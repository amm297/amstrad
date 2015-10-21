                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Wed Oct 21 09:22:42 2015
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
                             16 	.globl _vissionSensor
                             17 	.globl _patrol
                             18 	.globl _followPlayer
                             19 	.globl _checkArrowCollisions
                             20 	.globl _checkBoundsCollisions
                             21 	.globl _checkBoundsCollisionsEnemy
                             22 	.globl _menu
                             23 	.globl _gameOver
                             24 	.globl _initEnemies
                             25 	.globl _initPlayer
                             26 	.globl _init
                             27 	.globl _moveObject
                             28 	.globl _checkKeyboard
                             29 	.globl _checkCollisions
                             30 	.globl _movement
                             31 	.globl _setDirection
                             32 	.globl _chooseDirection
                             33 	.globl _detectPlayerRoom
                             34 	.globl _drawPickUps
                             35 	.globl _drawFatiga
                             36 	.globl _erases
                             37 	.globl _draws
                             38 	.globl _drawStats
                             39 	.globl _erase
                             40 	.globl _draw
                             41 	.globl _drawBullets
                             42 	.globl _drawVida
                             43 	.globl _drawMap
                             44 	.globl _cpct_getScreenPtr
                             45 	.globl _cpct_setPalette
                             46 	.globl _cpct_fw2hw
                             47 	.globl _cpct_waitVSYNC
                             48 	.globl _cpct_setVideoMode
                             49 	.globl _cpct_drawStringM0
                             50 	.globl _cpct_drawSolidBox
                             51 	.globl _cpct_drawSpriteMasked
                             52 	.globl _cpct_drawSprite
                             53 	.globl _cpct_isKeyPressed
                             54 	.globl _cpct_scanKeyboard_f
                             55 	.globl _cpct_scanKeyboard
                             56 	.globl _cpct_memset
                             57 	.globl _cpct_disableFirmware
                             58 	.globl _rand
                             59 	.globl _enemy
                             60 	.globl _player
                             61 	.globl _object
                             62 	.globl _archer
                             63 	.globl _bound
                             64 	.globl _following
                             65 	.globl _arrow
                             66 	.globl _finish
                             67 	.globl _path
                             68 	.globl _map
                             69 	.globl _temp
                             70 	.globl _scene
                             71 	.globl _mapa2
                             72 	.globl _mapa1
                             73 	.globl _origins
                             74 	.globl _g_palette
                             75 ;--------------------------------------------------------
                             76 ; special function registers
                             77 ;--------------------------------------------------------
                             78 ;--------------------------------------------------------
                             79 ; ram data
                             80 ;--------------------------------------------------------
                             81 	.area _DATA
   6C0A                      82 _scene::
   6C0A                      83 	.ds 240
   6CFA                      84 _temp::
   6CFA                      85 	.ds 2
   6CFC                      86 _map::
   6CFC                      87 	.ds 1
   6CFD                      88 _path::
   6CFD                      89 	.ds 1
   6CFE                      90 _finish::
   6CFE                      91 	.ds 1
   6CFF                      92 _arrow::
   6CFF                      93 	.ds 1
   6D00                      94 _following::
   6D00                      95 	.ds 1
   6D01                      96 _bound::
   6D01                      97 	.ds 1
   6D02                      98 _archer::
   6D02                      99 	.ds 1
   6D03                     100 _object::
   6D03                     101 	.ds 10
   6D0D                     102 _player::
   6D0D                     103 	.ds 11
   6D18                     104 _enemy::
   6D18                     105 	.ds 15
                            106 ;--------------------------------------------------------
                            107 ; ram data
                            108 ;--------------------------------------------------------
                            109 	.area _INITIALIZED
                            110 ;--------------------------------------------------------
                            111 ; absolute external ram data
                            112 ;--------------------------------------------------------
                            113 	.area _DABS (ABS)
                            114 ;--------------------------------------------------------
                            115 ; global & static initialisations
                            116 ;--------------------------------------------------------
                            117 	.area _HOME
                            118 	.area _GSINIT
                            119 	.area _GSFINAL
                            120 	.area _GSINIT
                            121 ;--------------------------------------------------------
                            122 ; Home
                            123 ;--------------------------------------------------------
                            124 	.area _HOME
                            125 	.area _HOME
                            126 ;--------------------------------------------------------
                            127 ; code
                            128 ;--------------------------------------------------------
                            129 	.area _CODE
                            130 ;src/draws.h:14: void drawMap(u8 t){
                            131 ;	---------------------------------
                            132 ; Function drawMap
                            133 ; ---------------------------------
   46C0                     134 _drawMap::
   46C0 DD E5         [15]  135 	push	ix
   46C2 DD 21 00 00   [14]  136 	ld	ix,#0
   46C6 DD 39         [15]  137 	add	ix,sp
   46C8 21 F0 FF      [10]  138 	ld	hl,#-16
   46CB 39            [11]  139 	add	hl,sp
   46CC F9            [ 6]  140 	ld	sp,hl
                            141 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  142 	ld	a,4 (ix)
   46D0 3D            [ 4]  143 	dec	a
   46D1 C2 79 47      [10]  144 	jp	NZ,00104$
                            145 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  146 	ld	hl,#0x0000
   46D7 E3            [19]  147 	ex	(sp), hl
   46D8 DD 36 F8 00   [19]  148 	ld	-8 (ix),#0x00
   46DC DD 36 F9 00   [19]  149 	ld	-7 (ix),#0x00
                            150 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     151 00130$:
   46E0 3E 0A         [ 7]  152 	ld	a,#<(_scene)
   46E2 DD 86 F8      [19]  153 	add	a, -8 (ix)
   46E5 DD 77 FE      [19]  154 	ld	-2 (ix),a
   46E8 3E 6C         [ 7]  155 	ld	a,#>(_scene)
   46EA DD 8E F9      [19]  156 	adc	a, -7 (ix)
   46ED DD 77 FF      [19]  157 	ld	-1 (ix),a
   46F0 3E 17         [ 7]  158 	ld	a,#<(_mapa1)
   46F2 DD 86 F8      [19]  159 	add	a, -8 (ix)
   46F5 DD 77 FA      [19]  160 	ld	-6 (ix),a
   46F8 3E 49         [ 7]  161 	ld	a,#>(_mapa1)
   46FA DD 8E F9      [19]  162 	adc	a, -7 (ix)
   46FD DD 77 FB      [19]  163 	ld	-5 (ix),a
   4700 DD 36 F2 00   [19]  164 	ld	-14 (ix),#0x00
   4704 DD 36 F3 00   [19]  165 	ld	-13 (ix),#0x00
   4708                     166 00115$:
                            167 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E FE      [19]  168 	ld	a,-2 (ix)
   470B DD 86 F2      [19]  169 	add	a, -14 (ix)
   470E DD 77 FC      [19]  170 	ld	-4 (ix),a
   4711 DD 7E FF      [19]  171 	ld	a,-1 (ix)
   4714 DD 8E F3      [19]  172 	adc	a, -13 (ix)
   4717 DD 77 FD      [19]  173 	ld	-3 (ix),a
   471A DD 7E FA      [19]  174 	ld	a,-6 (ix)
   471D DD 86 F2      [19]  175 	add	a, -14 (ix)
   4720 DD 77 F6      [19]  176 	ld	-10 (ix),a
   4723 DD 7E FB      [19]  177 	ld	a,-5 (ix)
   4726 DD 8E F3      [19]  178 	adc	a, -13 (ix)
   4729 DD 77 F7      [19]  179 	ld	-9 (ix),a
   472C DD 6E F6      [19]  180 	ld	l,-10 (ix)
   472F DD 66 F7      [19]  181 	ld	h,-9 (ix)
   4732 7E            [ 7]  182 	ld	a,(hl)
   4733 DD 6E FC      [19]  183 	ld	l,-4 (ix)
   4736 DD 66 FD      [19]  184 	ld	h,-3 (ix)
   4739 77            [ 7]  185 	ld	(hl),a
                            186 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F2      [23]  187 	inc	-14 (ix)
   473D 20 03         [12]  188 	jr	NZ,00189$
   473F DD 34 F3      [23]  189 	inc	-13 (ix)
   4742                     190 00189$:
   4742 DD 7E F2      [19]  191 	ld	a,-14 (ix)
   4745 D6 14         [ 7]  192 	sub	a, #0x14
   4747 DD 7E F3      [19]  193 	ld	a,-13 (ix)
   474A 17            [ 4]  194 	rla
   474B 3F            [ 4]  195 	ccf
   474C 1F            [ 4]  196 	rra
   474D DE 80         [ 7]  197 	sbc	a, #0x80
   474F 38 B7         [12]  198 	jr	C,00115$
                            199 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E F8      [19]  200 	ld	a,-8 (ix)
   4754 C6 14         [ 7]  201 	add	a, #0x14
   4756 DD 77 F8      [19]  202 	ld	-8 (ix),a
   4759 DD 7E F9      [19]  203 	ld	a,-7 (ix)
   475C CE 00         [ 7]  204 	adc	a, #0x00
   475E DD 77 F9      [19]  205 	ld	-7 (ix),a
   4761 DD 34 F0      [23]  206 	inc	-16 (ix)
   4764 20 03         [12]  207 	jr	NZ,00190$
   4766 DD 34 F1      [23]  208 	inc	-15 (ix)
   4769                     209 00190$:
   4769 DD 7E F0      [19]  210 	ld	a,-16 (ix)
   476C D6 0C         [ 7]  211 	sub	a, #0x0C
   476E DD 7E F1      [19]  212 	ld	a,-15 (ix)
   4771 17            [ 4]  213 	rla
   4772 3F            [ 4]  214 	ccf
   4773 1F            [ 4]  215 	rra
   4774 DE 80         [ 7]  216 	sbc	a, #0x80
   4776 DA E0 46      [10]  217 	jp	C,00130$
   4779                     218 00104$:
                            219 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  220 	ld	a,4 (ix)
   477C D6 02         [ 7]  221 	sub	a, #0x02
   477E C2 26 48      [10]  222 	jp	NZ,00141$
                            223 ;src/draws.h:27: for(y=0;y<height;y++){
   4781 21 00 00      [10]  224 	ld	hl,#0x0000
   4784 E3            [19]  225 	ex	(sp), hl
   4785 DD 36 F6 00   [19]  226 	ld	-10 (ix),#0x00
   4789 DD 36 F7 00   [19]  227 	ld	-9 (ix),#0x00
                            228 ;src/draws.h:28: for(x=0;x<width;x++){
   478D                     229 00134$:
   478D 3E 0A         [ 7]  230 	ld	a,#<(_scene)
   478F DD 86 F6      [19]  231 	add	a, -10 (ix)
   4792 DD 77 FC      [19]  232 	ld	-4 (ix),a
   4795 3E 6C         [ 7]  233 	ld	a,#>(_scene)
   4797 DD 8E F7      [19]  234 	adc	a, -9 (ix)
   479A DD 77 FD      [19]  235 	ld	-3 (ix),a
   479D 3E 07         [ 7]  236 	ld	a,#<(_mapa2)
   479F DD 86 F6      [19]  237 	add	a, -10 (ix)
   47A2 DD 77 FA      [19]  238 	ld	-6 (ix),a
   47A5 3E 4A         [ 7]  239 	ld	a,#>(_mapa2)
   47A7 DD 8E F7      [19]  240 	adc	a, -9 (ix)
   47AA DD 77 FB      [19]  241 	ld	-5 (ix),a
   47AD DD 36 F2 00   [19]  242 	ld	-14 (ix),#0x00
   47B1 DD 36 F3 00   [19]  243 	ld	-13 (ix),#0x00
   47B5                     244 00119$:
                            245 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   47B5 DD 7E FC      [19]  246 	ld	a,-4 (ix)
   47B8 DD 86 F2      [19]  247 	add	a, -14 (ix)
   47BB DD 77 FE      [19]  248 	ld	-2 (ix),a
   47BE DD 7E FD      [19]  249 	ld	a,-3 (ix)
   47C1 DD 8E F3      [19]  250 	adc	a, -13 (ix)
   47C4 DD 77 FF      [19]  251 	ld	-1 (ix),a
   47C7 DD 7E FA      [19]  252 	ld	a,-6 (ix)
   47CA DD 86 F2      [19]  253 	add	a, -14 (ix)
   47CD DD 77 F8      [19]  254 	ld	-8 (ix),a
   47D0 DD 7E FB      [19]  255 	ld	a,-5 (ix)
   47D3 DD 8E F3      [19]  256 	adc	a, -13 (ix)
   47D6 DD 77 F9      [19]  257 	ld	-7 (ix),a
   47D9 DD 6E F8      [19]  258 	ld	l,-8 (ix)
   47DC DD 66 F9      [19]  259 	ld	h,-7 (ix)
   47DF 7E            [ 7]  260 	ld	a,(hl)
   47E0 DD 6E FE      [19]  261 	ld	l,-2 (ix)
   47E3 DD 66 FF      [19]  262 	ld	h,-1 (ix)
   47E6 77            [ 7]  263 	ld	(hl),a
                            264 ;src/draws.h:28: for(x=0;x<width;x++){
   47E7 DD 34 F2      [23]  265 	inc	-14 (ix)
   47EA 20 03         [12]  266 	jr	NZ,00193$
   47EC DD 34 F3      [23]  267 	inc	-13 (ix)
   47EF                     268 00193$:
   47EF DD 7E F2      [19]  269 	ld	a,-14 (ix)
   47F2 D6 14         [ 7]  270 	sub	a, #0x14
   47F4 DD 7E F3      [19]  271 	ld	a,-13 (ix)
   47F7 17            [ 4]  272 	rla
   47F8 3F            [ 4]  273 	ccf
   47F9 1F            [ 4]  274 	rra
   47FA DE 80         [ 7]  275 	sbc	a, #0x80
   47FC 38 B7         [12]  276 	jr	C,00119$
                            277 ;src/draws.h:27: for(y=0;y<height;y++){
   47FE DD 7E F6      [19]  278 	ld	a,-10 (ix)
   4801 C6 14         [ 7]  279 	add	a, #0x14
   4803 DD 77 F6      [19]  280 	ld	-10 (ix),a
   4806 DD 7E F7      [19]  281 	ld	a,-9 (ix)
   4809 CE 00         [ 7]  282 	adc	a, #0x00
   480B DD 77 F7      [19]  283 	ld	-9 (ix),a
   480E DD 34 F0      [23]  284 	inc	-16 (ix)
   4811 20 03         [12]  285 	jr	NZ,00194$
   4813 DD 34 F1      [23]  286 	inc	-15 (ix)
   4816                     287 00194$:
   4816 DD 7E F0      [19]  288 	ld	a,-16 (ix)
   4819 D6 0C         [ 7]  289 	sub	a, #0x0C
   481B DD 7E F1      [19]  290 	ld	a,-15 (ix)
   481E 17            [ 4]  291 	rla
   481F 3F            [ 4]  292 	ccf
   4820 1F            [ 4]  293 	rra
   4821 DE 80         [ 7]  294 	sbc	a, #0x80
   4823 DA 8D 47      [10]  295 	jp	C,00134$
                            296 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   4826                     297 00141$:
   4826 01 00 00      [10]  298 	ld	bc,#0x0000
   4829 DD 36 F6 00   [19]  299 	ld	-10 (ix),#0x00
   482D DD 36 F7 00   [19]  300 	ld	-9 (ix),#0x00
   4831 11 00 00      [10]  301 	ld	de,#0x0000
                            302 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4834                     303 00139$:
   4834 21 0A 6C      [10]  304 	ld	hl,#_scene
   4837 19            [11]  305 	add	hl,de
   4838 DD 75 FC      [19]  306 	ld	-4 (ix),l
   483B DD 74 FD      [19]  307 	ld	-3 (ix),h
   483E DD 36 F4 00   [19]  308 	ld	-12 (ix),#0x00
   4842 DD 36 F5 00   [19]  309 	ld	-11 (ix),#0x00
   4846                     310 00123$:
                            311 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   4846 79            [ 4]  312 	ld	a,c
   4847 07            [ 4]  313 	rlca
   4848 07            [ 4]  314 	rlca
   4849 07            [ 4]  315 	rlca
   484A 07            [ 4]  316 	rlca
   484B E6 F0         [ 7]  317 	and	a,#0xF0
   484D 67            [ 4]  318 	ld	h,a
   484E DD 7E F4      [19]  319 	ld	a,-12 (ix)
   4851 87            [ 4]  320 	add	a, a
   4852 87            [ 4]  321 	add	a, a
   4853 C5            [11]  322 	push	bc
   4854 D5            [11]  323 	push	de
   4855 E5            [11]  324 	push	hl
   4856 33            [ 6]  325 	inc	sp
   4857 F5            [11]  326 	push	af
   4858 33            [ 6]  327 	inc	sp
   4859 21 00 C0      [10]  328 	ld	hl,#0xC000
   485C E5            [11]  329 	push	hl
   485D CD 14 6B      [17]  330 	call	_cpct_getScreenPtr
   4860 D1            [10]  331 	pop	de
   4861 C1            [10]  332 	pop	bc
   4862 E5            [11]  333 	push	hl
   4863 FD E1         [14]  334 	pop	iy
                            335 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4865 DD 7E FC      [19]  336 	ld	a,-4 (ix)
   4868 DD 86 F4      [19]  337 	add	a, -12 (ix)
   486B 6F            [ 4]  338 	ld	l,a
   486C DD 7E FD      [19]  339 	ld	a,-3 (ix)
   486F DD 8E F5      [19]  340 	adc	a, -11 (ix)
   4872 67            [ 4]  341 	ld	h,a
   4873 66            [ 7]  342 	ld	h,(hl)
                            343 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4874 FD E5         [15]  344 	push	iy
   4876 F1            [10]  345 	pop	af
   4877 DD 77 FB      [19]  346 	ld	-5 (ix),a
   487A FD E5         [15]  347 	push	iy
   487C 3B            [ 6]  348 	dec	sp
   487D F1            [10]  349 	pop	af
   487E 33            [ 6]  350 	inc	sp
   487F DD 77 FA      [19]  351 	ld	-6 (ix),a
                            352 ;src/draws.h:37: if(scene[posY][posX] == 1){
   4882 25            [ 4]  353 	dec	h
   4883 20 16         [12]  354 	jr	NZ,00110$
                            355 ;src/draws.h:38: cpct_drawSprite(muro,memptr,tilewidth, tileheight);
   4885 C5            [11]  356 	push	bc
   4886 D5            [11]  357 	push	de
   4887 21 04 10      [10]  358 	ld	hl,#0x1004
   488A E5            [11]  359 	push	hl
   488B DD 6E FA      [19]  360 	ld	l,-6 (ix)
   488E DD 66 FB      [19]  361 	ld	h,-5 (ix)
   4891 E5            [11]  362 	push	hl
   4892 21 62 66      [10]  363 	ld	hl,#_muro
   4895 E5            [11]  364 	push	hl
   4896 CD 57 68      [17]  365 	call	_cpct_drawSprite
   4899 D1            [10]  366 	pop	de
   489A C1            [10]  367 	pop	bc
   489B                     368 00110$:
                            369 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E 0A         [ 7]  370 	ld	a,#<(_scene)
   489D DD 86 F6      [19]  371 	add	a, -10 (ix)
   48A0 6F            [ 4]  372 	ld	l,a
   48A1 3E 6C         [ 7]  373 	ld	a,#>(_scene)
   48A3 DD 8E F7      [19]  374 	adc	a, -9 (ix)
   48A6 67            [ 4]  375 	ld	h,a
   48A7 7D            [ 4]  376 	ld	a,l
   48A8 DD 86 F4      [19]  377 	add	a, -12 (ix)
   48AB 6F            [ 4]  378 	ld	l,a
   48AC 7C            [ 4]  379 	ld	a,h
   48AD DD 8E F5      [19]  380 	adc	a, -11 (ix)
   48B0 67            [ 4]  381 	ld	h,a
   48B1 7E            [ 7]  382 	ld	a,(hl)
   48B2 D6 09         [ 7]  383 	sub	a, #0x09
   48B4 20 19         [12]  384 	jr	NZ,00124$
                            385 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   48B6 C5            [11]  386 	push	bc
   48B7 D5            [11]  387 	push	de
   48B8 21 04 10      [10]  388 	ld	hl,#0x1004
   48BB E5            [11]  389 	push	hl
   48BC 3E 09         [ 7]  390 	ld	a,#0x09
   48BE F5            [11]  391 	push	af
   48BF 33            [ 6]  392 	inc	sp
   48C0 DD 6E FA      [19]  393 	ld	l,-6 (ix)
   48C3 DD 66 FB      [19]  394 	ld	h,-5 (ix)
   48C6 E5            [11]  395 	push	hl
   48C7 CD 43 6A      [17]  396 	call	_cpct_drawSolidBox
   48CA F1            [10]  397 	pop	af
   48CB F1            [10]  398 	pop	af
   48CC 33            [ 6]  399 	inc	sp
   48CD D1            [10]  400 	pop	de
   48CE C1            [10]  401 	pop	bc
   48CF                     402 00124$:
                            403 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   48CF DD 34 F4      [23]  404 	inc	-12 (ix)
   48D2 20 03         [12]  405 	jr	NZ,00199$
   48D4 DD 34 F5      [23]  406 	inc	-11 (ix)
   48D7                     407 00199$:
   48D7 DD 7E F4      [19]  408 	ld	a,-12 (ix)
   48DA D6 14         [ 7]  409 	sub	a, #0x14
   48DC DD 7E F5      [19]  410 	ld	a,-11 (ix)
   48DF 17            [ 4]  411 	rla
   48E0 3F            [ 4]  412 	ccf
   48E1 1F            [ 4]  413 	rra
   48E2 DE 80         [ 7]  414 	sbc	a, #0x80
   48E4 DA 46 48      [10]  415 	jp	C,00123$
                            416 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   48E7 DD 7E F6      [19]  417 	ld	a,-10 (ix)
   48EA C6 14         [ 7]  418 	add	a, #0x14
   48EC DD 77 F6      [19]  419 	ld	-10 (ix),a
   48EF DD 7E F7      [19]  420 	ld	a,-9 (ix)
   48F2 CE 00         [ 7]  421 	adc	a, #0x00
   48F4 DD 77 F7      [19]  422 	ld	-9 (ix),a
   48F7 21 14 00      [10]  423 	ld	hl,#0x0014
   48FA 19            [11]  424 	add	hl,de
   48FB EB            [ 4]  425 	ex	de,hl
   48FC 03            [ 6]  426 	inc	bc
   48FD 79            [ 4]  427 	ld	a,c
   48FE D6 0C         [ 7]  428 	sub	a, #0x0C
   4900 78            [ 4]  429 	ld	a,b
   4901 17            [ 4]  430 	rla
   4902 3F            [ 4]  431 	ccf
   4903 1F            [ 4]  432 	rra
   4904 DE 80         [ 7]  433 	sbc	a, #0x80
   4906 DA 34 48      [10]  434 	jp	C,00139$
   4909 DD F9         [10]  435 	ld	sp, ix
   490B DD E1         [14]  436 	pop	ix
   490D C9            [10]  437 	ret
   490E                     438 _g_palette:
   490E 00                  439 	.db #0x00	; 0
   490F 1A                  440 	.db #0x1A	; 26
   4910 06                  441 	.db #0x06	; 6
   4911 0D                  442 	.db #0x0D	; 13
   4912 00                  443 	.db 0x00
   4913                     444 _origins:
   4913 00                  445 	.db #0x00	; 0
   4914 50                  446 	.db #0x50	; 80	'P'
   4915 34                  447 	.db #0x34	; 52	'4'
   4916 50                  448 	.db #0x50	; 80	'P'
   4917                     449 _mapa1:
   4917 01                  450 	.db #0x01	; 1
   4918 01                  451 	.db #0x01	; 1
   4919 01                  452 	.db #0x01	; 1
   491A 01                  453 	.db #0x01	; 1
   491B 01                  454 	.db #0x01	; 1
   491C 01                  455 	.db #0x01	; 1
   491D 01                  456 	.db #0x01	; 1
   491E 01                  457 	.db #0x01	; 1
   491F 01                  458 	.db #0x01	; 1
   4920 01                  459 	.db #0x01	; 1
   4921 01                  460 	.db #0x01	; 1
   4922 01                  461 	.db #0x01	; 1
   4923 01                  462 	.db #0x01	; 1
   4924 01                  463 	.db #0x01	; 1
   4925 01                  464 	.db #0x01	; 1
   4926 01                  465 	.db #0x01	; 1
   4927 01                  466 	.db #0x01	; 1
   4928 01                  467 	.db #0x01	; 1
   4929 01                  468 	.db #0x01	; 1
   492A 01                  469 	.db #0x01	; 1
   492B 01                  470 	.db #0x01	; 1
   492C 07                  471 	.db #0x07	; 7
   492D 05                  472 	.db #0x05	; 5
   492E 07                  473 	.db #0x07	; 7
   492F 07                  474 	.db #0x07	; 7
   4930 07                  475 	.db #0x07	; 7
   4931 07                  476 	.db #0x07	; 7
   4932 07                  477 	.db #0x07	; 7
   4933 07                  478 	.db #0x07	; 7
   4934 07                  479 	.db #0x07	; 7
   4935 07                  480 	.db #0x07	; 7
   4936 07                  481 	.db #0x07	; 7
   4937 07                  482 	.db #0x07	; 7
   4938 07                  483 	.db #0x07	; 7
   4939 07                  484 	.db #0x07	; 7
   493A 07                  485 	.db #0x07	; 7
   493B 07                  486 	.db #0x07	; 7
   493C 07                  487 	.db #0x07	; 7
   493D 07                  488 	.db #0x07	; 7
   493E 01                  489 	.db #0x01	; 1
   493F 01                  490 	.db #0x01	; 1
   4940 07                  491 	.db #0x07	; 7
   4941 07                  492 	.db #0x07	; 7
   4942 07                  493 	.db #0x07	; 7
   4943 07                  494 	.db #0x07	; 7
   4944 07                  495 	.db #0x07	; 7
   4945 07                  496 	.db #0x07	; 7
   4946 07                  497 	.db #0x07	; 7
   4947 07                  498 	.db #0x07	; 7
   4948 07                  499 	.db #0x07	; 7
   4949 07                  500 	.db #0x07	; 7
   494A 07                  501 	.db #0x07	; 7
   494B 07                  502 	.db #0x07	; 7
   494C 07                  503 	.db #0x07	; 7
   494D 07                  504 	.db #0x07	; 7
   494E 07                  505 	.db #0x07	; 7
   494F 07                  506 	.db #0x07	; 7
   4950 07                  507 	.db #0x07	; 7
   4951 07                  508 	.db #0x07	; 7
   4952 01                  509 	.db #0x01	; 1
   4953 01                  510 	.db #0x01	; 1
   4954 01                  511 	.db #0x01	; 1
   4955 01                  512 	.db #0x01	; 1
   4956 01                  513 	.db #0x01	; 1
   4957 01                  514 	.db #0x01	; 1
   4958 01                  515 	.db #0x01	; 1
   4959 01                  516 	.db #0x01	; 1
   495A 01                  517 	.db #0x01	; 1
   495B 01                  518 	.db #0x01	; 1
   495C 07                  519 	.db #0x07	; 7
   495D 07                  520 	.db #0x07	; 7
   495E 01                  521 	.db #0x01	; 1
   495F 01                  522 	.db #0x01	; 1
   4960 01                  523 	.db #0x01	; 1
   4961 01                  524 	.db #0x01	; 1
   4962 07                  525 	.db #0x07	; 7
   4963 07                  526 	.db #0x07	; 7
   4964 01                  527 	.db #0x01	; 1
   4965 01                  528 	.db #0x01	; 1
   4966 01                  529 	.db #0x01	; 1
   4967 01                  530 	.db #0x01	; 1
   4968 00                  531 	.db #0x00	; 0
   4969 00                  532 	.db #0x00	; 0
   496A 00                  533 	.db #0x00	; 0
   496B 00                  534 	.db #0x00	; 0
   496C 00                  535 	.db #0x00	; 0
   496D 00                  536 	.db #0x00	; 0
   496E 00                  537 	.db #0x00	; 0
   496F 06                  538 	.db #0x06	; 6
   4970 06                  539 	.db #0x06	; 6
   4971 06                  540 	.db #0x06	; 6
   4972 01                  541 	.db #0x01	; 1
   4973 03                  542 	.db #0x03	; 3
   4974 03                  543 	.db #0x03	; 3
   4975 03                  544 	.db #0x03	; 3
   4976 03                  545 	.db #0x03	; 3
   4977 03                  546 	.db #0x03	; 3
   4978 03                  547 	.db #0x03	; 3
   4979 03                  548 	.db #0x03	; 3
   497A 01                  549 	.db #0x01	; 1
   497B 00                  550 	.db #0x00	; 0
   497C 00                  551 	.db #0x00	; 0
   497D 01                  552 	.db #0x01	; 1
   497E 01                  553 	.db #0x01	; 1
   497F 04                  554 	.db #0x04	; 4
   4980 04                  555 	.db #0x04	; 4
   4981 01                  556 	.db #0x01	; 1
   4982 01                  557 	.db #0x01	; 1
   4983 06                  558 	.db #0x06	; 6
   4984 06                  559 	.db #0x06	; 6
   4985 06                  560 	.db #0x06	; 6
   4986 01                  561 	.db #0x01	; 1
   4987 03                  562 	.db #0x03	; 3
   4988 03                  563 	.db #0x03	; 3
   4989 03                  564 	.db #0x03	; 3
   498A 03                  565 	.db #0x03	; 3
   498B 03                  566 	.db #0x03	; 3
   498C 03                  567 	.db #0x03	; 3
   498D 03                  568 	.db #0x03	; 3
   498E 01                  569 	.db #0x01	; 1
   498F 01                  570 	.db #0x01	; 1
   4990 00                  571 	.db #0x00	; 0
   4991 01                  572 	.db #0x01	; 1
   4992 04                  573 	.db #0x04	; 4
   4993 04                  574 	.db #0x04	; 4
   4994 04                  575 	.db #0x04	; 4
   4995 04                  576 	.db #0x04	; 4
   4996 01                  577 	.db #0x01	; 1
   4997 06                  578 	.db #0x06	; 6
   4998 06                  579 	.db #0x06	; 6
   4999 06                  580 	.db #0x06	; 6
   499A 01                  581 	.db #0x01	; 1
   499B 03                  582 	.db #0x03	; 3
   499C 03                  583 	.db #0x03	; 3
   499D 03                  584 	.db #0x03	; 3
   499E 03                  585 	.db #0x03	; 3
   499F 03                  586 	.db #0x03	; 3
   49A0 03                  587 	.db #0x03	; 3
   49A1 03                  588 	.db #0x03	; 3
   49A2 01                  589 	.db #0x01	; 1
   49A3 01                  590 	.db #0x01	; 1
   49A4 00                  591 	.db #0x00	; 0
   49A5 01                  592 	.db #0x01	; 1
   49A6 04                  593 	.db #0x04	; 4
   49A7 04                  594 	.db #0x04	; 4
   49A8 04                  595 	.db #0x04	; 4
   49A9 04                  596 	.db #0x04	; 4
   49AA 01                  597 	.db #0x01	; 1
   49AB 06                  598 	.db #0x06	; 6
   49AC 06                  599 	.db #0x06	; 6
   49AD 06                  600 	.db #0x06	; 6
   49AE 01                  601 	.db #0x01	; 1
   49AF 03                  602 	.db #0x03	; 3
   49B0 03                  603 	.db #0x03	; 3
   49B1 03                  604 	.db #0x03	; 3
   49B2 03                  605 	.db #0x03	; 3
   49B3 03                  606 	.db #0x03	; 3
   49B4 03                  607 	.db #0x03	; 3
   49B5 03                  608 	.db #0x03	; 3
   49B6 01                  609 	.db #0x01	; 1
   49B7 01                  610 	.db #0x01	; 1
   49B8 00                  611 	.db #0x00	; 0
   49B9 01                  612 	.db #0x01	; 1
   49BA 04                  613 	.db #0x04	; 4
   49BB 04                  614 	.db #0x04	; 4
   49BC 04                  615 	.db #0x04	; 4
   49BD 04                  616 	.db #0x04	; 4
   49BE 01                  617 	.db #0x01	; 1
   49BF 06                  618 	.db #0x06	; 6
   49C0 06                  619 	.db #0x06	; 6
   49C1 06                  620 	.db #0x06	; 6
   49C2 01                  621 	.db #0x01	; 1
   49C3 03                  622 	.db #0x03	; 3
   49C4 03                  623 	.db #0x03	; 3
   49C5 03                  624 	.db #0x03	; 3
   49C6 03                  625 	.db #0x03	; 3
   49C7 03                  626 	.db #0x03	; 3
   49C8 03                  627 	.db #0x03	; 3
   49C9 03                  628 	.db #0x03	; 3
   49CA 01                  629 	.db #0x01	; 1
   49CB 01                  630 	.db #0x01	; 1
   49CC 00                  631 	.db #0x00	; 0
   49CD 01                  632 	.db #0x01	; 1
   49CE 04                  633 	.db #0x04	; 4
   49CF 04                  634 	.db #0x04	; 4
   49D0 04                  635 	.db #0x04	; 4
   49D1 04                  636 	.db #0x04	; 4
   49D2 01                  637 	.db #0x01	; 1
   49D3 06                  638 	.db #0x06	; 6
   49D4 06                  639 	.db #0x06	; 6
   49D5 06                  640 	.db #0x06	; 6
   49D6 01                  641 	.db #0x01	; 1
   49D7 03                  642 	.db #0x03	; 3
   49D8 03                  643 	.db #0x03	; 3
   49D9 03                  644 	.db #0x03	; 3
   49DA 03                  645 	.db #0x03	; 3
   49DB 03                  646 	.db #0x03	; 3
   49DC 03                  647 	.db #0x03	; 3
   49DD 03                  648 	.db #0x03	; 3
   49DE 01                  649 	.db #0x01	; 1
   49DF 01                  650 	.db #0x01	; 1
   49E0 02                  651 	.db #0x02	; 2
   49E1 01                  652 	.db #0x01	; 1
   49E2 04                  653 	.db #0x04	; 4
   49E3 04                  654 	.db #0x04	; 4
   49E4 04                  655 	.db #0x04	; 4
   49E5 04                  656 	.db #0x04	; 4
   49E6 01                  657 	.db #0x01	; 1
   49E7 06                  658 	.db #0x06	; 6
   49E8 06                  659 	.db #0x06	; 6
   49E9 06                  660 	.db #0x06	; 6
   49EA 03                  661 	.db #0x03	; 3
   49EB 03                  662 	.db #0x03	; 3
   49EC 03                  663 	.db #0x03	; 3
   49ED 03                  664 	.db #0x03	; 3
   49EE 03                  665 	.db #0x03	; 3
   49EF 03                  666 	.db #0x03	; 3
   49F0 03                  667 	.db #0x03	; 3
   49F1 03                  668 	.db #0x03	; 3
   49F2 01                  669 	.db #0x01	; 1
   49F3 01                  670 	.db #0x01	; 1
   49F4 01                  671 	.db #0x01	; 1
   49F5 01                  672 	.db #0x01	; 1
   49F6 01                  673 	.db #0x01	; 1
   49F7 01                  674 	.db #0x01	; 1
   49F8 01                  675 	.db #0x01	; 1
   49F9 01                  676 	.db #0x01	; 1
   49FA 01                  677 	.db #0x01	; 1
   49FB 01                  678 	.db #0x01	; 1
   49FC 01                  679 	.db #0x01	; 1
   49FD 01                  680 	.db #0x01	; 1
   49FE 01                  681 	.db #0x01	; 1
   49FF 01                  682 	.db #0x01	; 1
   4A00 01                  683 	.db #0x01	; 1
   4A01 01                  684 	.db #0x01	; 1
   4A02 09                  685 	.db #0x09	; 9
   4A03 09                  686 	.db #0x09	; 9
   4A04 01                  687 	.db #0x01	; 1
   4A05 01                  688 	.db #0x01	; 1
   4A06 01                  689 	.db #0x01	; 1
   4A07                     690 _mapa2:
   4A07 01                  691 	.db #0x01	; 1
   4A08 01                  692 	.db #0x01	; 1
   4A09 01                  693 	.db #0x01	; 1
   4A0A 01                  694 	.db #0x01	; 1
   4A0B 01                  695 	.db #0x01	; 1
   4A0C 01                  696 	.db #0x01	; 1
   4A0D 01                  697 	.db #0x01	; 1
   4A0E 01                  698 	.db #0x01	; 1
   4A0F 01                  699 	.db #0x01	; 1
   4A10 01                  700 	.db #0x01	; 1
   4A11 01                  701 	.db #0x01	; 1
   4A12 01                  702 	.db #0x01	; 1
   4A13 01                  703 	.db #0x01	; 1
   4A14 01                  704 	.db #0x01	; 1
   4A15 01                  705 	.db #0x01	; 1
   4A16 01                  706 	.db #0x01	; 1
   4A17 01                  707 	.db #0x01	; 1
   4A18 01                  708 	.db #0x01	; 1
   4A19 01                  709 	.db #0x01	; 1
   4A1A 01                  710 	.db #0x01	; 1
   4A1B 01                  711 	.db #0x01	; 1
   4A1C 00                  712 	.db #0x00	; 0
   4A1D 00                  713 	.db #0x00	; 0
   4A1E 00                  714 	.db #0x00	; 0
   4A1F 00                  715 	.db #0x00	; 0
   4A20 01                  716 	.db #0x01	; 1
   4A21 00                  717 	.db #0x00	; 0
   4A22 00                  718 	.db #0x00	; 0
   4A23 00                  719 	.db #0x00	; 0
   4A24 00                  720 	.db #0x00	; 0
   4A25 00                  721 	.db #0x00	; 0
   4A26 00                  722 	.db #0x00	; 0
   4A27 00                  723 	.db #0x00	; 0
   4A28 00                  724 	.db #0x00	; 0
   4A29 00                  725 	.db #0x00	; 0
   4A2A 00                  726 	.db #0x00	; 0
   4A2B 00                  727 	.db #0x00	; 0
   4A2C 00                  728 	.db #0x00	; 0
   4A2D 00                  729 	.db #0x00	; 0
   4A2E 06                  730 	.db #0x06	; 6
   4A2F 01                  731 	.db #0x01	; 1
   4A30 00                  732 	.db #0x00	; 0
   4A31 00                  733 	.db #0x00	; 0
   4A32 01                  734 	.db #0x01	; 1
   4A33 00                  735 	.db #0x00	; 0
   4A34 00                  736 	.db #0x00	; 0
   4A35 00                  737 	.db #0x00	; 0
   4A36 00                  738 	.db #0x00	; 0
   4A37 00                  739 	.db #0x00	; 0
   4A38 00                  740 	.db #0x00	; 0
   4A39 00                  741 	.db #0x00	; 0
   4A3A 00                  742 	.db #0x00	; 0
   4A3B 00                  743 	.db #0x00	; 0
   4A3C 00                  744 	.db #0x00	; 0
   4A3D 00                  745 	.db #0x00	; 0
   4A3E 00                  746 	.db #0x00	; 0
   4A3F 00                  747 	.db #0x00	; 0
   4A40 00                  748 	.db #0x00	; 0
   4A41 00                  749 	.db #0x00	; 0
   4A42 01                  750 	.db #0x01	; 1
   4A43 01                  751 	.db #0x01	; 1
   4A44 00                  752 	.db #0x00	; 0
   4A45 01                  753 	.db #0x01	; 1
   4A46 01                  754 	.db #0x01	; 1
   4A47 01                  755 	.db #0x01	; 1
   4A48 01                  756 	.db #0x01	; 1
   4A49 00                  757 	.db #0x00	; 0
   4A4A 00                  758 	.db #0x00	; 0
   4A4B 01                  759 	.db #0x01	; 1
   4A4C 01                  760 	.db #0x01	; 1
   4A4D 01                  761 	.db #0x01	; 1
   4A4E 01                  762 	.db #0x01	; 1
   4A4F 01                  763 	.db #0x01	; 1
   4A50 01                  764 	.db #0x01	; 1
   4A51 01                  765 	.db #0x01	; 1
   4A52 01                  766 	.db #0x01	; 1
   4A53 01                  767 	.db #0x01	; 1
   4A54 01                  768 	.db #0x01	; 1
   4A55 01                  769 	.db #0x01	; 1
   4A56 01                  770 	.db #0x01	; 1
   4A57 01                  771 	.db #0x01	; 1
   4A58 00                  772 	.db #0x00	; 0
   4A59 05                  773 	.db #0x05	; 5
   4A5A 01                  774 	.db #0x01	; 1
   4A5B 00                  775 	.db #0x00	; 0
   4A5C 00                  776 	.db #0x00	; 0
   4A5D 00                  777 	.db #0x00	; 0
   4A5E 00                  778 	.db #0x00	; 0
   4A5F 00                  779 	.db #0x00	; 0
   4A60 00                  780 	.db #0x00	; 0
   4A61 00                  781 	.db #0x00	; 0
   4A62 01                  782 	.db #0x01	; 1
   4A63 00                  783 	.db #0x00	; 0
   4A64 00                  784 	.db #0x00	; 0
   4A65 00                  785 	.db #0x00	; 0
   4A66 00                  786 	.db #0x00	; 0
   4A67 00                  787 	.db #0x00	; 0
   4A68 00                  788 	.db #0x00	; 0
   4A69 00                  789 	.db #0x00	; 0
   4A6A 01                  790 	.db #0x01	; 1
   4A6B 01                  791 	.db #0x01	; 1
   4A6C 00                  792 	.db #0x00	; 0
   4A6D 01                  793 	.db #0x01	; 1
   4A6E 01                  794 	.db #0x01	; 1
   4A6F 00                  795 	.db #0x00	; 0
   4A70 01                  796 	.db #0x01	; 1
   4A71 01                  797 	.db #0x01	; 1
   4A72 01                  798 	.db #0x01	; 1
   4A73 02                  799 	.db #0x02	; 2
   4A74 02                  800 	.db #0x02	; 2
   4A75 02                  801 	.db #0x02	; 2
   4A76 01                  802 	.db #0x01	; 1
   4A77 00                  803 	.db #0x00	; 0
   4A78 00                  804 	.db #0x00	; 0
   4A79 00                  805 	.db #0x00	; 0
   4A7A 05                  806 	.db #0x05	; 5
   4A7B 00                  807 	.db #0x00	; 0
   4A7C 00                  808 	.db #0x00	; 0
   4A7D 00                  809 	.db #0x00	; 0
   4A7E 01                  810 	.db #0x01	; 1
   4A7F 01                  811 	.db #0x01	; 1
   4A80 00                  812 	.db #0x00	; 0
   4A81 01                  813 	.db #0x01	; 1
   4A82 02                  814 	.db #0x02	; 2
   4A83 02                  815 	.db #0x02	; 2
   4A84 02                  816 	.db #0x02	; 2
   4A85 02                  817 	.db #0x02	; 2
   4A86 01                  818 	.db #0x01	; 1
   4A87 00                  819 	.db #0x00	; 0
   4A88 00                  820 	.db #0x00	; 0
   4A89 00                  821 	.db #0x00	; 0
   4A8A 01                  822 	.db #0x01	; 1
   4A8B 00                  823 	.db #0x00	; 0
   4A8C 00                  824 	.db #0x00	; 0
   4A8D 00                  825 	.db #0x00	; 0
   4A8E 05                  826 	.db #0x05	; 5
   4A8F 00                  827 	.db #0x00	; 0
   4A90 00                  828 	.db #0x00	; 0
   4A91 00                  829 	.db #0x00	; 0
   4A92 01                  830 	.db #0x01	; 1
   4A93 01                  831 	.db #0x01	; 1
   4A94 00                  832 	.db #0x00	; 0
   4A95 01                  833 	.db #0x01	; 1
   4A96 02                  834 	.db #0x02	; 2
   4A97 02                  835 	.db #0x02	; 2
   4A98 02                  836 	.db #0x02	; 2
   4A99 02                  837 	.db #0x02	; 2
   4A9A 01                  838 	.db #0x01	; 1
   4A9B 02                  839 	.db #0x02	; 2
   4A9C 02                  840 	.db #0x02	; 2
   4A9D 02                  841 	.db #0x02	; 2
   4A9E 01                  842 	.db #0x01	; 1
   4A9F 00                  843 	.db #0x00	; 0
   4AA0 00                  844 	.db #0x00	; 0
   4AA1 00                  845 	.db #0x00	; 0
   4AA2 05                  846 	.db #0x05	; 5
   4AA3 00                  847 	.db #0x00	; 0
   4AA4 00                  848 	.db #0x00	; 0
   4AA5 00                  849 	.db #0x00	; 0
   4AA6 01                  850 	.db #0x01	; 1
   4AA7 01                  851 	.db #0x01	; 1
   4AA8 00                  852 	.db #0x00	; 0
   4AA9 01                  853 	.db #0x01	; 1
   4AAA 02                  854 	.db #0x02	; 2
   4AAB 02                  855 	.db #0x02	; 2
   4AAC 02                  856 	.db #0x02	; 2
   4AAD 02                  857 	.db #0x02	; 2
   4AAE 01                  858 	.db #0x01	; 1
   4AAF 00                  859 	.db #0x00	; 0
   4AB0 00                  860 	.db #0x00	; 0
   4AB1 00                  861 	.db #0x00	; 0
   4AB2 01                  862 	.db #0x01	; 1
   4AB3 00                  863 	.db #0x00	; 0
   4AB4 00                  864 	.db #0x00	; 0
   4AB5 00                  865 	.db #0x00	; 0
   4AB6 00                  866 	.db #0x00	; 0
   4AB7 00                  867 	.db #0x00	; 0
   4AB8 00                  868 	.db #0x00	; 0
   4AB9 00                  869 	.db #0x00	; 0
   4ABA 01                  870 	.db #0x01	; 1
   4ABB 01                  871 	.db #0x01	; 1
   4ABC 00                  872 	.db #0x00	; 0
   4ABD 01                  873 	.db #0x01	; 1
   4ABE 02                  874 	.db #0x02	; 2
   4ABF 02                  875 	.db #0x02	; 2
   4AC0 02                  876 	.db #0x02	; 2
   4AC1 02                  877 	.db #0x02	; 2
   4AC2 01                  878 	.db #0x01	; 1
   4AC3 02                  879 	.db #0x02	; 2
   4AC4 02                  880 	.db #0x02	; 2
   4AC5 02                  881 	.db #0x02	; 2
   4AC6 01                  882 	.db #0x01	; 1
   4AC7 00                  883 	.db #0x00	; 0
   4AC8 00                  884 	.db #0x00	; 0
   4AC9 00                  885 	.db #0x00	; 0
   4ACA 00                  886 	.db #0x00	; 0
   4ACB 00                  887 	.db #0x00	; 0
   4ACC 00                  888 	.db #0x00	; 0
   4ACD 00                  889 	.db #0x00	; 0
   4ACE 01                  890 	.db #0x01	; 1
   4ACF 01                  891 	.db #0x01	; 1
   4AD0 05                  892 	.db #0x05	; 5
   4AD1 01                  893 	.db #0x01	; 1
   4AD2 02                  894 	.db #0x02	; 2
   4AD3 02                  895 	.db #0x02	; 2
   4AD4 02                  896 	.db #0x02	; 2
   4AD5 02                  897 	.db #0x02	; 2
   4AD6 01                  898 	.db #0x01	; 1
   4AD7 00                  899 	.db #0x00	; 0
   4AD8 00                  900 	.db #0x00	; 0
   4AD9 00                  901 	.db #0x00	; 0
   4ADA 00                  902 	.db #0x00	; 0
   4ADB 00                  903 	.db #0x00	; 0
   4ADC 00                  904 	.db #0x00	; 0
   4ADD 00                  905 	.db #0x00	; 0
   4ADE 00                  906 	.db #0x00	; 0
   4ADF 00                  907 	.db #0x00	; 0
   4AE0 00                  908 	.db #0x00	; 0
   4AE1 00                  909 	.db #0x00	; 0
   4AE2 01                  910 	.db #0x01	; 1
   4AE3 01                  911 	.db #0x01	; 1
   4AE4 01                  912 	.db #0x01	; 1
   4AE5 01                  913 	.db #0x01	; 1
   4AE6 01                  914 	.db #0x01	; 1
   4AE7 01                  915 	.db #0x01	; 1
   4AE8 01                  916 	.db #0x01	; 1
   4AE9 01                  917 	.db #0x01	; 1
   4AEA 01                  918 	.db #0x01	; 1
   4AEB 01                  919 	.db #0x01	; 1
   4AEC 01                  920 	.db #0x01	; 1
   4AED 01                  921 	.db #0x01	; 1
   4AEE 01                  922 	.db #0x01	; 1
   4AEF 01                  923 	.db #0x01	; 1
   4AF0 01                  924 	.db #0x01	; 1
   4AF1 01                  925 	.db #0x01	; 1
   4AF2 00                  926 	.db #0x00	; 0
   4AF3 01                  927 	.db #0x01	; 1
   4AF4 01                  928 	.db #0x01	; 1
   4AF5 01                  929 	.db #0x01	; 1
   4AF6 01                  930 	.db #0x01	; 1
                            931 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            932 ;	---------------------------------
                            933 ; Function drawVida
                            934 ; ---------------------------------
   4AF7                     935 _drawVida::
   4AF7 DD E5         [15]  936 	push	ix
   4AF9 DD 21 00 00   [14]  937 	ld	ix,#0
   4AFD DD 39         [15]  938 	add	ix,sp
                            939 ;src/draws.h:51: u8 p = pos;
   4AFF DD 56 05      [19]  940 	ld	d,5 (ix)
                            941 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B02 1E 01         [ 7]  942 	ld	e,#0x01
   4B04                     943 00105$:
                            944 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B04 D5            [11]  945 	push	de
   4B05 3E C0         [ 7]  946 	ld	a,#0xC0
   4B07 F5            [11]  947 	push	af
   4B08 33            [ 6]  948 	inc	sp
   4B09 D5            [11]  949 	push	de
   4B0A 33            [ 6]  950 	inc	sp
   4B0B 21 00 C0      [10]  951 	ld	hl,#0xC000
   4B0E E5            [11]  952 	push	hl
   4B0F CD 14 6B      [17]  953 	call	_cpct_getScreenPtr
   4B12 D1            [10]  954 	pop	de
                            955 ;src/draws.h:55: p+=5;
   4B13 7A            [ 4]  956 	ld	a,d
   4B14 C6 05         [ 7]  957 	add	a, #0x05
   4B16 57            [ 4]  958 	ld	d,a
                            959 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4B17 4D            [ 4]  960 	ld	c, l
   4B18 44            [ 4]  961 	ld	b, h
   4B19 DD 7E 04      [19]  962 	ld	a,4 (ix)
   4B1C 93            [ 4]  963 	sub	a, e
   4B1D 38 10         [12]  964 	jr	C,00102$
   4B1F D5            [11]  965 	push	de
   4B20 21 04 08      [10]  966 	ld	hl,#0x0804
   4B23 E5            [11]  967 	push	hl
   4B24 C5            [11]  968 	push	bc
   4B25 21 00 46      [10]  969 	ld	hl,#_corazon_lleno
   4B28 E5            [11]  970 	push	hl
   4B29 CD BD 69      [17]  971 	call	_cpct_drawSpriteMasked
   4B2C D1            [10]  972 	pop	de
   4B2D 18 20         [12]  973 	jr	00106$
   4B2F                     974 00102$:
                            975 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4B2F C5            [11]  976 	push	bc
   4B30 D5            [11]  977 	push	de
   4B31 21 04 08      [10]  978 	ld	hl,#0x0804
   4B34 E5            [11]  979 	push	hl
   4B35 AF            [ 4]  980 	xor	a, a
   4B36 F5            [11]  981 	push	af
   4B37 33            [ 6]  982 	inc	sp
   4B38 C5            [11]  983 	push	bc
   4B39 CD 43 6A      [17]  984 	call	_cpct_drawSolidBox
   4B3C F1            [10]  985 	pop	af
   4B3D F1            [10]  986 	pop	af
   4B3E 33            [ 6]  987 	inc	sp
   4B3F D1            [10]  988 	pop	de
   4B40 C1            [10]  989 	pop	bc
                            990 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B41 D5            [11]  991 	push	de
   4B42 21 04 08      [10]  992 	ld	hl,#0x0804
   4B45 E5            [11]  993 	push	hl
   4B46 C5            [11]  994 	push	bc
   4B47 21 40 46      [10]  995 	ld	hl,#_corazon_roto
   4B4A E5            [11]  996 	push	hl
   4B4B CD BD 69      [17]  997 	call	_cpct_drawSpriteMasked
   4B4E D1            [10]  998 	pop	de
   4B4F                     999 00106$:
                           1000 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B4F 1C            [ 4] 1001 	inc	e
   4B50 3E 03         [ 7] 1002 	ld	a,#0x03
   4B52 93            [ 4] 1003 	sub	a, e
   4B53 30 AF         [12] 1004 	jr	NC,00105$
   4B55 DD E1         [14] 1005 	pop	ix
   4B57 C9            [10] 1006 	ret
                           1007 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                           1008 ;	---------------------------------
                           1009 ; Function drawBullets
                           1010 ; ---------------------------------
   4B58                    1011 _drawBullets::
   4B58 DD E5         [15] 1012 	push	ix
   4B5A DD 21 00 00   [14] 1013 	ld	ix,#0
   4B5E DD 39         [15] 1014 	add	ix,sp
   4B60 3B            [ 6] 1015 	dec	sp
                           1016 ;src/draws.h:67: int p = pos;
   4B61 DD 4E 05      [19] 1017 	ld	c,5 (ix)
   4B64 06 00         [ 7] 1018 	ld	b,#0x00
                           1019 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B66 DD 36 FF 01   [19] 1020 	ld	-1 (ix),#0x01
   4B6A                    1021 00105$:
                           1022 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B6A 51            [ 4] 1023 	ld	d,c
   4B6B C5            [11] 1024 	push	bc
   4B6C 3E C0         [ 7] 1025 	ld	a,#0xC0
   4B6E F5            [11] 1026 	push	af
   4B6F 33            [ 6] 1027 	inc	sp
   4B70 D5            [11] 1028 	push	de
   4B71 33            [ 6] 1029 	inc	sp
   4B72 21 00 C0      [10] 1030 	ld	hl,#0xC000
   4B75 E5            [11] 1031 	push	hl
   4B76 CD 14 6B      [17] 1032 	call	_cpct_getScreenPtr
   4B79 C1            [10] 1033 	pop	bc
                           1034 ;src/draws.h:71: p+=3;
   4B7A 03            [ 6] 1035 	inc	bc
   4B7B 03            [ 6] 1036 	inc	bc
   4B7C 03            [ 6] 1037 	inc	bc
                           1038 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B7D EB            [ 4] 1039 	ex	de,hl
   4B7E DD 7E 04      [19] 1040 	ld	a,4 (ix)
   4B81 DD 96 FF      [19] 1041 	sub	a, -1 (ix)
   4B84 38 10         [12] 1042 	jr	C,00102$
   4B86 C5            [11] 1043 	push	bc
   4B87 21 02 08      [10] 1044 	ld	hl,#0x0802
   4B8A E5            [11] 1045 	push	hl
   4B8B D5            [11] 1046 	push	de
   4B8C 21 A2 66      [10] 1047 	ld	hl,#_flecha_arriba
   4B8F E5            [11] 1048 	push	hl
   4B90 CD BD 69      [17] 1049 	call	_cpct_drawSpriteMasked
   4B93 C1            [10] 1050 	pop	bc
   4B94 18 10         [12] 1051 	jr	00106$
   4B96                    1052 00102$:
                           1053 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B96 C5            [11] 1054 	push	bc
   4B97 21 02 08      [10] 1055 	ld	hl,#0x0802
   4B9A E5            [11] 1056 	push	hl
   4B9B AF            [ 4] 1057 	xor	a, a
   4B9C F5            [11] 1058 	push	af
   4B9D 33            [ 6] 1059 	inc	sp
   4B9E D5            [11] 1060 	push	de
   4B9F CD 43 6A      [17] 1061 	call	_cpct_drawSolidBox
   4BA2 F1            [10] 1062 	pop	af
   4BA3 F1            [10] 1063 	pop	af
   4BA4 33            [ 6] 1064 	inc	sp
   4BA5 C1            [10] 1065 	pop	bc
   4BA6                    1066 00106$:
                           1067 ;src/draws.h:69: for(i=1;i<=3;i++){
   4BA6 DD 34 FF      [23] 1068 	inc	-1 (ix)
   4BA9 3E 03         [ 7] 1069 	ld	a,#0x03
   4BAB DD 96 FF      [19] 1070 	sub	a, -1 (ix)
   4BAE 30 BA         [12] 1071 	jr	NC,00105$
   4BB0 33            [ 6] 1072 	inc	sp
   4BB1 DD E1         [14] 1073 	pop	ix
   4BB3 C9            [10] 1074 	ret
                           1075 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1076 ;	---------------------------------
                           1077 ; Function draw
                           1078 ; ---------------------------------
   4BB4                    1079 _draw::
                           1080 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BB4 21 03 00      [10] 1081 	ld	hl, #3+0
   4BB7 39            [11] 1082 	add	hl, sp
   4BB8 7E            [ 7] 1083 	ld	a, (hl)
   4BB9 F5            [11] 1084 	push	af
   4BBA 33            [ 6] 1085 	inc	sp
   4BBB 21 03 00      [10] 1086 	ld	hl, #3+0
   4BBE 39            [11] 1087 	add	hl, sp
   4BBF 7E            [ 7] 1088 	ld	a, (hl)
   4BC0 F5            [11] 1089 	push	af
   4BC1 33            [ 6] 1090 	inc	sp
   4BC2 21 00 C0      [10] 1091 	ld	hl,#0xC000
   4BC5 E5            [11] 1092 	push	hl
   4BC6 CD 14 6B      [17] 1093 	call	_cpct_getScreenPtr
   4BC9 EB            [ 4] 1094 	ex	de,hl
                           1095 ;src/draws.h:84: switch(mode){
   4BCA 3E 02         [ 7] 1096 	ld	a,#0x02
   4BCC FD 21 06 00   [14] 1097 	ld	iy,#6
   4BD0 FD 39         [15] 1098 	add	iy,sp
   4BD2 FD 96 00      [19] 1099 	sub	a, 0 (iy)
   4BD5 D8            [11] 1100 	ret	C
                           1101 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BD6 21 04 00      [10] 1102 	ld	hl, #4
   4BD9 39            [11] 1103 	add	hl, sp
   4BDA 4E            [ 7] 1104 	ld	c, (hl)
   4BDB 23            [ 6] 1105 	inc	hl
   4BDC 46            [ 7] 1106 	ld	b, (hl)
                           1107 ;src/draws.h:84: switch(mode){
   4BDD D5            [11] 1108 	push	de
   4BDE FD 21 08 00   [14] 1109 	ld	iy,#8
   4BE2 FD 39         [15] 1110 	add	iy,sp
   4BE4 FD 5E 00      [19] 1111 	ld	e,0 (iy)
   4BE7 16 00         [ 7] 1112 	ld	d,#0x00
   4BE9 21 F0 4B      [10] 1113 	ld	hl,#00111$
   4BEC 19            [11] 1114 	add	hl,de
   4BED 19            [11] 1115 	add	hl,de
                           1116 ;src/draws.h:85: case 0:
   4BEE D1            [10] 1117 	pop	de
   4BEF E9            [ 4] 1118 	jp	(hl)
   4BF0                    1119 00111$:
   4BF0 18 04         [12] 1120 	jr	00101$
   4BF2 18 0C         [12] 1121 	jr	00102$
   4BF4 18 14         [12] 1122 	jr	00103$
   4BF6                    1123 00101$:
                           1124 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BF6 21 04 10      [10] 1125 	ld	hl,#0x1004
   4BF9 E5            [11] 1126 	push	hl
   4BFA D5            [11] 1127 	push	de
   4BFB C5            [11] 1128 	push	bc
   4BFC CD BD 69      [17] 1129 	call	_cpct_drawSpriteMasked
                           1130 ;src/draws.h:87: break;
   4BFF C9            [10] 1131 	ret
                           1132 ;src/draws.h:88: case 1:
   4C00                    1133 00102$:
                           1134 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C00 21 02 08      [10] 1135 	ld	hl,#0x0802
   4C03 E5            [11] 1136 	push	hl
   4C04 D5            [11] 1137 	push	de
   4C05 C5            [11] 1138 	push	bc
   4C06 CD BD 69      [17] 1139 	call	_cpct_drawSpriteMasked
                           1140 ;src/draws.h:90: break;
   4C09 C9            [10] 1141 	ret
                           1142 ;src/draws.h:91: case 2:
   4C0A                    1143 00103$:
                           1144 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0A 21 04 04      [10] 1145 	ld	hl,#0x0404
   4C0D E5            [11] 1146 	push	hl
   4C0E D5            [11] 1147 	push	de
   4C0F C5            [11] 1148 	push	bc
   4C10 CD BD 69      [17] 1149 	call	_cpct_drawSpriteMasked
                           1150 ;src/draws.h:94: }
   4C13 C9            [10] 1151 	ret
                           1152 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1153 ;	---------------------------------
                           1154 ; Function erase
                           1155 ; ---------------------------------
   4C14                    1156 _erase::
                           1157 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4C14 21 03 00      [10] 1158 	ld	hl, #3+0
   4C17 39            [11] 1159 	add	hl, sp
   4C18 7E            [ 7] 1160 	ld	a, (hl)
   4C19 F5            [11] 1161 	push	af
   4C1A 33            [ 6] 1162 	inc	sp
   4C1B 21 03 00      [10] 1163 	ld	hl, #3+0
   4C1E 39            [11] 1164 	add	hl, sp
   4C1F 7E            [ 7] 1165 	ld	a, (hl)
   4C20 F5            [11] 1166 	push	af
   4C21 33            [ 6] 1167 	inc	sp
   4C22 21 00 C0      [10] 1168 	ld	hl,#0xC000
   4C25 E5            [11] 1169 	push	hl
   4C26 CD 14 6B      [17] 1170 	call	_cpct_getScreenPtr
   4C29 4D            [ 4] 1171 	ld	c, l
   4C2A 44            [ 4] 1172 	ld	b, h
                           1173 ;src/draws.h:102: switch(mode){
   4C2B 3E 02         [ 7] 1174 	ld	a,#0x02
   4C2D FD 21 04 00   [14] 1175 	ld	iy,#4
   4C31 FD 39         [15] 1176 	add	iy,sp
   4C33 FD 96 00      [19] 1177 	sub	a, 0 (iy)
   4C36 D8            [11] 1178 	ret	C
                           1179 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1180 ;src/draws.h:102: switch(mode){
   4C37 FD 5E 00      [19] 1181 	ld	e,0 (iy)
   4C3A 16 00         [ 7] 1182 	ld	d,#0x00
   4C3C 21 42 4C      [10] 1183 	ld	hl,#00111$
   4C3F 19            [11] 1184 	add	hl,de
   4C40 19            [11] 1185 	add	hl,de
                           1186 ;src/draws.h:103: case 0:
   4C41 E9            [ 4] 1187 	jp	(hl)
   4C42                    1188 00111$:
   4C42 18 04         [12] 1189 	jr	00101$
   4C44 18 11         [12] 1190 	jr	00102$
   4C46 18 1E         [12] 1191 	jr	00103$
   4C48                    1192 00101$:
                           1193 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C48 21 04 10      [10] 1194 	ld	hl,#0x1004
   4C4B E5            [11] 1195 	push	hl
   4C4C AF            [ 4] 1196 	xor	a, a
   4C4D F5            [11] 1197 	push	af
   4C4E 33            [ 6] 1198 	inc	sp
   4C4F C5            [11] 1199 	push	bc
   4C50 CD 43 6A      [17] 1200 	call	_cpct_drawSolidBox
   4C53 F1            [10] 1201 	pop	af
   4C54 F1            [10] 1202 	pop	af
   4C55 33            [ 6] 1203 	inc	sp
                           1204 ;src/draws.h:105: break;
   4C56 C9            [10] 1205 	ret
                           1206 ;src/draws.h:106: case 1:
   4C57                    1207 00102$:
                           1208 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C57 21 02 08      [10] 1209 	ld	hl,#0x0802
   4C5A E5            [11] 1210 	push	hl
   4C5B AF            [ 4] 1211 	xor	a, a
   4C5C F5            [11] 1212 	push	af
   4C5D 33            [ 6] 1213 	inc	sp
   4C5E C5            [11] 1214 	push	bc
   4C5F CD 43 6A      [17] 1215 	call	_cpct_drawSolidBox
   4C62 F1            [10] 1216 	pop	af
   4C63 F1            [10] 1217 	pop	af
   4C64 33            [ 6] 1218 	inc	sp
                           1219 ;src/draws.h:108: break;
   4C65 C9            [10] 1220 	ret
                           1221 ;src/draws.h:109: case 2:
   4C66                    1222 00103$:
                           1223 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C66 21 04 04      [10] 1224 	ld	hl,#0x0404
   4C69 E5            [11] 1225 	push	hl
   4C6A AF            [ 4] 1226 	xor	a, a
   4C6B F5            [11] 1227 	push	af
   4C6C 33            [ 6] 1228 	inc	sp
   4C6D C5            [11] 1229 	push	bc
   4C6E CD 43 6A      [17] 1230 	call	_cpct_drawSolidBox
   4C71 F1            [10] 1231 	pop	af
   4C72 F1            [10] 1232 	pop	af
   4C73 33            [ 6] 1233 	inc	sp
                           1234 ;src/draws.h:112: }
   4C74 C9            [10] 1235 	ret
                           1236 ;src/draws.h:115: void drawStats(){
                           1237 ;	---------------------------------
                           1238 ; Function drawStats
                           1239 ; ---------------------------------
   4C75                    1240 _drawStats::
                           1241 ;src/draws.h:116: drawVida(player.life,1);
   4C75 21 13 6D      [10] 1242 	ld	hl, #_player + 6
   4C78 56            [ 7] 1243 	ld	d,(hl)
   4C79 3E 01         [ 7] 1244 	ld	a,#0x01
   4C7B F5            [11] 1245 	push	af
   4C7C 33            [ 6] 1246 	inc	sp
   4C7D D5            [11] 1247 	push	de
   4C7E 33            [ 6] 1248 	inc	sp
   4C7F CD F7 4A      [17] 1249 	call	_drawVida
   4C82 F1            [10] 1250 	pop	af
                           1251 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C83 21 17 6D      [10] 1252 	ld	hl, #_player + 10
   4C86 56            [ 7] 1253 	ld	d,(hl)
   4C87 3E 10         [ 7] 1254 	ld	a,#0x10
   4C89 F5            [11] 1255 	push	af
   4C8A 33            [ 6] 1256 	inc	sp
   4C8B D5            [11] 1257 	push	de
   4C8C 33            [ 6] 1258 	inc	sp
   4C8D CD 58 4B      [17] 1259 	call	_drawBullets
   4C90 F1            [10] 1260 	pop	af
                           1261 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C91 21 22 6D      [10] 1262 	ld	hl, #_enemy + 10
   4C94 56            [ 7] 1263 	ld	d,(hl)
   4C95 3E 38         [ 7] 1264 	ld	a,#0x38
   4C97 F5            [11] 1265 	push	af
   4C98 33            [ 6] 1266 	inc	sp
   4C99 D5            [11] 1267 	push	de
   4C9A 33            [ 6] 1268 	inc	sp
   4C9B CD 58 4B      [17] 1269 	call	_drawBullets
   4C9E F1            [10] 1270 	pop	af
                           1271 ;src/draws.h:119: drawVida(enemy.life,65);
   4C9F 21 20 6D      [10] 1272 	ld	hl, #_enemy + 8
   4CA2 56            [ 7] 1273 	ld	d,(hl)
   4CA3 3E 41         [ 7] 1274 	ld	a,#0x41
   4CA5 F5            [11] 1275 	push	af
   4CA6 33            [ 6] 1276 	inc	sp
   4CA7 D5            [11] 1277 	push	de
   4CA8 33            [ 6] 1278 	inc	sp
   4CA9 CD F7 4A      [17] 1279 	call	_drawVida
   4CAC F1            [10] 1280 	pop	af
   4CAD C9            [10] 1281 	ret
                           1282 ;src/draws.h:124: void draws(){
                           1283 ;	---------------------------------
                           1284 ; Function draws
                           1285 ; ---------------------------------
   4CAE                    1286 _draws::
   4CAE DD E5         [15] 1287 	push	ix
   4CB0 DD 21 00 00   [14] 1288 	ld	ix,#0
   4CB4 DD 39         [15] 1289 	add	ix,sp
   4CB6 3B            [ 6] 1290 	dec	sp
                           1291 ;src/draws.h:126: draw(player.x,player.y,player.sprite,0);
   4CB7 ED 5B 11 6D   [20] 1292 	ld	de, (#_player + 4)
   4CBB 21 0E 6D      [10] 1293 	ld	hl, #_player + 1
   4CBE 46            [ 7] 1294 	ld	b,(hl)
   4CBF 21 0D 6D      [10] 1295 	ld	hl, #_player + 0
   4CC2 4E            [ 7] 1296 	ld	c,(hl)
   4CC3 AF            [ 4] 1297 	xor	a, a
   4CC4 F5            [11] 1298 	push	af
   4CC5 33            [ 6] 1299 	inc	sp
   4CC6 D5            [11] 1300 	push	de
   4CC7 C5            [11] 1301 	push	bc
   4CC8 CD B4 4B      [17] 1302 	call	_draw
   4CCB F1            [10] 1303 	pop	af
   4CCC F1            [10] 1304 	pop	af
   4CCD 33            [ 6] 1305 	inc	sp
                           1306 ;src/draws.h:127: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CCE ED 5B 1E 6D   [20] 1307 	ld	de, (#_enemy + 6)
   4CD2 21 19 6D      [10] 1308 	ld	hl, #_enemy + 1
   4CD5 46            [ 7] 1309 	ld	b,(hl)
   4CD6 21 18 6D      [10] 1310 	ld	hl, #_enemy + 0
   4CD9 4E            [ 7] 1311 	ld	c,(hl)
   4CDA AF            [ 4] 1312 	xor	a, a
   4CDB F5            [11] 1313 	push	af
   4CDC 33            [ 6] 1314 	inc	sp
   4CDD D5            [11] 1315 	push	de
   4CDE C5            [11] 1316 	push	bc
   4CDF CD B4 4B      [17] 1317 	call	_draw
   4CE2 F1            [10] 1318 	pop	af
   4CE3 F1            [10] 1319 	pop	af
   4CE4 33            [ 6] 1320 	inc	sp
                           1321 ;src/draws.h:128: if(arrow == 1){
   4CE5 3A FF 6C      [13] 1322 	ld	a,(#_arrow + 0)
   4CE8 3D            [ 4] 1323 	dec	a
   4CE9 20 5C         [12] 1324 	jr	NZ,00111$
                           1325 ;src/draws.h:129: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CEB 21 0A 6D      [10] 1326 	ld	hl, #_object + 7
   4CEE 5E            [ 7] 1327 	ld	e,(hl)
                           1328 ;src/draws.h:130: draw(object.x,object.y,object.sprite,2);
   4CEF 01 04 6D      [10] 1329 	ld	bc,#_object + 1
                           1330 ;src/draws.h:129: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CF2 7B            [ 4] 1331 	ld	a,e
   4CF3 D6 04         [ 7] 1332 	sub	a, #0x04
   4CF5 28 0C         [12] 1333 	jr	Z,00105$
   4CF7 21 09 6D      [10] 1334 	ld	hl,#_object + 6
   4CFA 7B            [ 4] 1335 	ld	a,e
   4CFB D6 06         [ 7] 1336 	sub	a, #0x06
   4CFD 20 25         [12] 1337 	jr	NZ,00106$
   4CFF 7E            [ 7] 1338 	ld	a,(hl)
   4D00 3D            [ 4] 1339 	dec	a
   4D01 20 21         [12] 1340 	jr	NZ,00106$
   4D03                    1341 00105$:
                           1342 ;src/draws.h:130: draw(object.x,object.y,object.sprite,2);
   4D03 ED 5B 07 6D   [20] 1343 	ld	de, (#(_object + 0x0004) + 0)
   4D07 0A            [ 7] 1344 	ld	a,(bc)
   4D08 DD 77 FF      [19] 1345 	ld	-1 (ix),a
   4D0B 21 03 6D      [10] 1346 	ld	hl, #_object + 0
   4D0E 4E            [ 7] 1347 	ld	c,(hl)
   4D0F 3E 02         [ 7] 1348 	ld	a,#0x02
   4D11 F5            [11] 1349 	push	af
   4D12 33            [ 6] 1350 	inc	sp
   4D13 D5            [11] 1351 	push	de
   4D14 DD 7E FF      [19] 1352 	ld	a,-1 (ix)
   4D17 F5            [11] 1353 	push	af
   4D18 33            [ 6] 1354 	inc	sp
   4D19 79            [ 4] 1355 	ld	a,c
   4D1A F5            [11] 1356 	push	af
   4D1B 33            [ 6] 1357 	inc	sp
   4D1C CD B4 4B      [17] 1358 	call	_draw
   4D1F F1            [10] 1359 	pop	af
   4D20 F1            [10] 1360 	pop	af
   4D21 33            [ 6] 1361 	inc	sp
   4D22 18 23         [12] 1362 	jr	00111$
   4D24                    1363 00106$:
                           1364 ;src/draws.h:131: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4D24 7B            [ 4] 1365 	ld	a,e
   4D25 FE 02         [ 7] 1366 	cp	a,#0x02
   4D27 28 08         [12] 1367 	jr	Z,00101$
   4D29 D6 08         [ 7] 1368 	sub	a, #0x08
   4D2B 20 1A         [12] 1369 	jr	NZ,00111$
   4D2D 7E            [ 7] 1370 	ld	a,(hl)
   4D2E 3D            [ 4] 1371 	dec	a
   4D2F 20 16         [12] 1372 	jr	NZ,00111$
   4D31                    1373 00101$:
                           1374 ;src/draws.h:132: draw(object.x,object.y,object.sprite,1);
   4D31 ED 5B 07 6D   [20] 1375 	ld	de, (#(_object + 0x0004) + 0)
   4D35 0A            [ 7] 1376 	ld	a,(bc)
   4D36 47            [ 4] 1377 	ld	b,a
   4D37 21 03 6D      [10] 1378 	ld	hl, #_object + 0
   4D3A 4E            [ 7] 1379 	ld	c,(hl)
   4D3B 3E 01         [ 7] 1380 	ld	a,#0x01
   4D3D F5            [11] 1381 	push	af
   4D3E 33            [ 6] 1382 	inc	sp
   4D3F D5            [11] 1383 	push	de
   4D40 C5            [11] 1384 	push	bc
   4D41 CD B4 4B      [17] 1385 	call	_draw
   4D44 F1            [10] 1386 	pop	af
   4D45 F1            [10] 1387 	pop	af
   4D46 33            [ 6] 1388 	inc	sp
   4D47                    1389 00111$:
                           1390 ;src/draws.h:134: drawStats();
   4D47 CD 75 4C      [17] 1391 	call	_drawStats
   4D4A 33            [ 6] 1392 	inc	sp
   4D4B DD E1         [14] 1393 	pop	ix
   4D4D C9            [10] 1394 	ret
                           1395 ;src/draws.h:137: void erases(){
                           1396 ;	---------------------------------
                           1397 ; Function erases
                           1398 ; ---------------------------------
   4D4E                    1399 _erases::
                           1400 ;src/draws.h:139: erase(player.lx,player.ly,0);
   4D4E 21 10 6D      [10] 1401 	ld	hl, #_player + 3
   4D51 46            [ 7] 1402 	ld	b,(hl)
   4D52 21 0F 6D      [10] 1403 	ld	hl, #_player + 2
   4D55 56            [ 7] 1404 	ld	d,(hl)
   4D56 AF            [ 4] 1405 	xor	a, a
   4D57 F5            [11] 1406 	push	af
   4D58 33            [ 6] 1407 	inc	sp
   4D59 4A            [ 4] 1408 	ld	c, d
   4D5A C5            [11] 1409 	push	bc
   4D5B CD 14 4C      [17] 1410 	call	_erase
   4D5E F1            [10] 1411 	pop	af
   4D5F 33            [ 6] 1412 	inc	sp
                           1413 ;src/draws.h:140: erase(enemy.lx,enemy.ly,0);
   4D60 21 1B 6D      [10] 1414 	ld	hl, #_enemy + 3
   4D63 46            [ 7] 1415 	ld	b,(hl)
   4D64 21 1A 6D      [10] 1416 	ld	hl, #_enemy + 2
   4D67 56            [ 7] 1417 	ld	d,(hl)
   4D68 AF            [ 4] 1418 	xor	a, a
   4D69 F5            [11] 1419 	push	af
   4D6A 33            [ 6] 1420 	inc	sp
   4D6B 4A            [ 4] 1421 	ld	c, d
   4D6C C5            [11] 1422 	push	bc
   4D6D CD 14 4C      [17] 1423 	call	_erase
   4D70 F1            [10] 1424 	pop	af
   4D71 33            [ 6] 1425 	inc	sp
                           1426 ;src/draws.h:141: if(arrow == 1){
   4D72 3A FF 6C      [13] 1427 	ld	a,(#_arrow + 0)
   4D75 3D            [ 4] 1428 	dec	a
   4D76 C0            [11] 1429 	ret	NZ
                           1430 ;src/draws.h:142: if(object.dir == 4 || object.dir == 6)
   4D77 21 0A 6D      [10] 1431 	ld	hl, #_object + 7
   4D7A 4E            [ 7] 1432 	ld	c,(hl)
                           1433 ;src/draws.h:143: erase(object.lx,object.ly,2);
   4D7B 21 06 6D      [10] 1434 	ld	hl, #_object + 3
   4D7E 56            [ 7] 1435 	ld	d,(hl)
   4D7F 21 05 6D      [10] 1436 	ld	hl, #_object + 2
   4D82 46            [ 7] 1437 	ld	b,(hl)
                           1438 ;src/draws.h:142: if(object.dir == 4 || object.dir == 6)
   4D83 79            [ 4] 1439 	ld	a,c
   4D84 FE 04         [ 7] 1440 	cp	a,#0x04
   4D86 28 04         [12] 1441 	jr	Z,00101$
   4D88 D6 06         [ 7] 1442 	sub	a, #0x06
   4D8A 20 0F         [12] 1443 	jr	NZ,00102$
   4D8C                    1444 00101$:
                           1445 ;src/draws.h:143: erase(object.lx,object.ly,2);
   4D8C 3E 02         [ 7] 1446 	ld	a,#0x02
   4D8E F5            [11] 1447 	push	af
   4D8F 33            [ 6] 1448 	inc	sp
   4D90 D5            [11] 1449 	push	de
   4D91 33            [ 6] 1450 	inc	sp
   4D92 C5            [11] 1451 	push	bc
   4D93 33            [ 6] 1452 	inc	sp
   4D94 CD 14 4C      [17] 1453 	call	_erase
   4D97 F1            [10] 1454 	pop	af
   4D98 33            [ 6] 1455 	inc	sp
   4D99 18 0D         [12] 1456 	jr	00103$
   4D9B                    1457 00102$:
                           1458 ;src/draws.h:145: erase(object.lx,object.ly,1);
   4D9B 3E 01         [ 7] 1459 	ld	a,#0x01
   4D9D F5            [11] 1460 	push	af
   4D9E 33            [ 6] 1461 	inc	sp
   4D9F D5            [11] 1462 	push	de
   4DA0 33            [ 6] 1463 	inc	sp
   4DA1 C5            [11] 1464 	push	bc
   4DA2 33            [ 6] 1465 	inc	sp
   4DA3 CD 14 4C      [17] 1466 	call	_erase
   4DA6 F1            [10] 1467 	pop	af
   4DA7 33            [ 6] 1468 	inc	sp
   4DA8                    1469 00103$:
                           1470 ;src/draws.h:146: if(bound == 1) arrow = 0;
   4DA8 3A 01 6D      [13] 1471 	ld	a,(#_bound + 0)
   4DAB 3D            [ 4] 1472 	dec	a
   4DAC C0            [11] 1473 	ret	NZ
   4DAD 21 FF 6C      [10] 1474 	ld	hl,#_arrow + 0
   4DB0 36 00         [10] 1475 	ld	(hl), #0x00
   4DB2 C9            [10] 1476 	ret
                           1477 ;src/draws.h:153: void drawFatiga(u8 atk, u8 col){
                           1478 ;	---------------------------------
                           1479 ; Function drawFatiga
                           1480 ; ---------------------------------
   4DB3                    1481 _drawFatiga::
   4DB3 DD E5         [15] 1482 	push	ix
   4DB5 DD 21 00 00   [14] 1483 	ld	ix,#0
   4DB9 DD 39         [15] 1484 	add	ix,sp
   4DBB F5            [11] 1485 	push	af
                           1486 ;src/draws.h:155: if(atk < 20)
   4DBC DD 7E 04      [19] 1487 	ld	a,4 (ix)
   4DBF D6 14         [ 7] 1488 	sub	a, #0x14
   4DC1 30 04         [12] 1489 	jr	NC,00102$
                           1490 ;src/draws.h:156: col = 2;
   4DC3 DD 36 05 02   [19] 1491 	ld	5 (ix),#0x02
   4DC7                    1492 00102$:
                           1493 ;src/draws.h:157: if(atk > 30 || atk <= 20){
   4DC7 3E 14         [ 7] 1494 	ld	a,#0x14
   4DC9 DD 96 04      [19] 1495 	sub	a, 4 (ix)
   4DCC 3E 00         [ 7] 1496 	ld	a,#0x00
   4DCE 17            [ 4] 1497 	rla
   4DCF DD 77 FE      [19] 1498 	ld	-2 (ix),a
                           1499 ;src/draws.h:159: switch(col){
   4DD2 3E 02         [ 7] 1500 	ld	a,#0x02
   4DD4 DD 96 05      [19] 1501 	sub	a, 5 (ix)
   4DD7 3E 00         [ 7] 1502 	ld	a,#0x00
   4DD9 17            [ 4] 1503 	rla
   4DDA DD 77 FF      [19] 1504 	ld	-1 (ix),a
                           1505 ;src/draws.h:157: if(atk > 30 || atk <= 20){
   4DDD 3E 1E         [ 7] 1506 	ld	a,#0x1E
   4DDF DD 96 04      [19] 1507 	sub	a, 4 (ix)
   4DE2 38 06         [12] 1508 	jr	C,00107$
   4DE4 DD 7E FE      [19] 1509 	ld	a,-2 (ix)
   4DE7 B7            [ 4] 1510 	or	a, a
   4DE8 20 4F         [12] 1511 	jr	NZ,00108$
   4DEA                    1512 00107$:
                           1513 ;src/draws.h:158: memptr = cpct_getScreenPtr(VMEM,28,192);
   4DEA 21 1C C0      [10] 1514 	ld	hl,#0xC01C
   4DED E5            [11] 1515 	push	hl
   4DEE 2E 00         [ 7] 1516 	ld	l, #0x00
   4DF0 E5            [11] 1517 	push	hl
   4DF1 CD 14 6B      [17] 1518 	call	_cpct_getScreenPtr
                           1519 ;src/draws.h:159: switch(col){
   4DF4 DD 7E FF      [19] 1520 	ld	a,-1 (ix)
   4DF7 B7            [ 4] 1521 	or	a, a
   4DF8 20 3F         [12] 1522 	jr	NZ,00108$
                           1523 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4DFA 4D            [ 4] 1524 	ld	c, l
   4DFB 44            [ 4] 1525 	ld	b, h
                           1526 ;src/draws.h:159: switch(col){
   4DFC DD 5E 05      [19] 1527 	ld	e,5 (ix)
   4DFF 16 00         [ 7] 1528 	ld	d,#0x00
   4E01 21 07 4E      [10] 1529 	ld	hl,#00156$
   4E04 19            [11] 1530 	add	hl,de
   4E05 19            [11] 1531 	add	hl,de
                           1532 ;src/draws.h:160: case 0:
   4E06 E9            [ 4] 1533 	jp	(hl)
   4E07                    1534 00156$:
   4E07 18 04         [12] 1535 	jr	00103$
   4E09 18 14         [12] 1536 	jr	00104$
   4E0B 18 20         [12] 1537 	jr	00105$
   4E0D                    1538 00103$:
                           1539 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4E0D 21 02 08      [10] 1540 	ld	hl,#0x0802
   4E10 E5            [11] 1541 	push	hl
   4E11 DD 7E 05      [19] 1542 	ld	a,5 (ix)
   4E14 F5            [11] 1543 	push	af
   4E15 33            [ 6] 1544 	inc	sp
   4E16 C5            [11] 1545 	push	bc
   4E17 CD 43 6A      [17] 1546 	call	_cpct_drawSolidBox
   4E1A F1            [10] 1547 	pop	af
   4E1B F1            [10] 1548 	pop	af
   4E1C 33            [ 6] 1549 	inc	sp
                           1550 ;src/draws.h:162: break;
   4E1D 18 1A         [12] 1551 	jr	00108$
                           1552 ;src/draws.h:163: case 1:
   4E1F                    1553 00104$:
                           1554 ;src/draws.h:164: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E1F 11 80 46      [10] 1555 	ld	de,#_fatiga_nor
   4E22 21 02 08      [10] 1556 	ld	hl,#0x0802
   4E25 E5            [11] 1557 	push	hl
   4E26 C5            [11] 1558 	push	bc
   4E27 D5            [11] 1559 	push	de
   4E28 CD BD 69      [17] 1560 	call	_cpct_drawSpriteMasked
                           1561 ;src/draws.h:165: break;
   4E2B 18 0C         [12] 1562 	jr	00108$
                           1563 ;src/draws.h:166: case 2:
   4E2D                    1564 00105$:
                           1565 ;src/draws.h:167: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E2D 11 A0 46      [10] 1566 	ld	de,#_fatiga_full
   4E30 21 02 08      [10] 1567 	ld	hl,#0x0802
   4E33 E5            [11] 1568 	push	hl
   4E34 C5            [11] 1569 	push	bc
   4E35 D5            [11] 1570 	push	de
   4E36 CD BD 69      [17] 1571 	call	_cpct_drawSpriteMasked
                           1572 ;src/draws.h:168: }
   4E39                    1573 00108$:
                           1574 ;src/draws.h:170: if(atk > 40 || atk <= 20){
   4E39 3E 28         [ 7] 1575 	ld	a,#0x28
   4E3B DD 96 04      [19] 1576 	sub	a, 4 (ix)
   4E3E 38 06         [12] 1577 	jr	C,00114$
   4E40 DD 7E FE      [19] 1578 	ld	a,-2 (ix)
   4E43 B7            [ 4] 1579 	or	a, a
   4E44 20 4F         [12] 1580 	jr	NZ,00115$
   4E46                    1581 00114$:
                           1582 ;src/draws.h:171: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E46 21 1F C0      [10] 1583 	ld	hl,#0xC01F
   4E49 E5            [11] 1584 	push	hl
   4E4A 2E 00         [ 7] 1585 	ld	l, #0x00
   4E4C E5            [11] 1586 	push	hl
   4E4D CD 14 6B      [17] 1587 	call	_cpct_getScreenPtr
                           1588 ;src/draws.h:172: switch(col){
   4E50 DD 7E FF      [19] 1589 	ld	a,-1 (ix)
   4E53 B7            [ 4] 1590 	or	a, a
   4E54 20 3F         [12] 1591 	jr	NZ,00115$
                           1592 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4E56 4D            [ 4] 1593 	ld	c, l
   4E57 44            [ 4] 1594 	ld	b, h
                           1595 ;src/draws.h:172: switch(col){
   4E58 DD 5E 05      [19] 1596 	ld	e,5 (ix)
   4E5B 16 00         [ 7] 1597 	ld	d,#0x00
   4E5D 21 63 4E      [10] 1598 	ld	hl,#00157$
   4E60 19            [11] 1599 	add	hl,de
   4E61 19            [11] 1600 	add	hl,de
                           1601 ;src/draws.h:173: case 0:
   4E62 E9            [ 4] 1602 	jp	(hl)
   4E63                    1603 00157$:
   4E63 18 04         [12] 1604 	jr	00110$
   4E65 18 14         [12] 1605 	jr	00111$
   4E67 18 20         [12] 1606 	jr	00112$
   4E69                    1607 00110$:
                           1608 ;src/draws.h:174: cpct_drawSolidBox(memptr, col, 2, 8);
   4E69 21 02 08      [10] 1609 	ld	hl,#0x0802
   4E6C E5            [11] 1610 	push	hl
   4E6D DD 7E 05      [19] 1611 	ld	a,5 (ix)
   4E70 F5            [11] 1612 	push	af
   4E71 33            [ 6] 1613 	inc	sp
   4E72 C5            [11] 1614 	push	bc
   4E73 CD 43 6A      [17] 1615 	call	_cpct_drawSolidBox
   4E76 F1            [10] 1616 	pop	af
   4E77 F1            [10] 1617 	pop	af
   4E78 33            [ 6] 1618 	inc	sp
                           1619 ;src/draws.h:175: break;
   4E79 18 1A         [12] 1620 	jr	00115$
                           1621 ;src/draws.h:176: case 1:
   4E7B                    1622 00111$:
                           1623 ;src/draws.h:177: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E7B 11 80 46      [10] 1624 	ld	de,#_fatiga_nor
   4E7E 21 02 08      [10] 1625 	ld	hl,#0x0802
   4E81 E5            [11] 1626 	push	hl
   4E82 C5            [11] 1627 	push	bc
   4E83 D5            [11] 1628 	push	de
   4E84 CD BD 69      [17] 1629 	call	_cpct_drawSpriteMasked
                           1630 ;src/draws.h:178: break;
   4E87 18 0C         [12] 1631 	jr	00115$
                           1632 ;src/draws.h:179: case 2:
   4E89                    1633 00112$:
                           1634 ;src/draws.h:180: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E89 11 A0 46      [10] 1635 	ld	de,#_fatiga_full
   4E8C 21 02 08      [10] 1636 	ld	hl,#0x0802
   4E8F E5            [11] 1637 	push	hl
   4E90 C5            [11] 1638 	push	bc
   4E91 D5            [11] 1639 	push	de
   4E92 CD BD 69      [17] 1640 	call	_cpct_drawSpriteMasked
                           1641 ;src/draws.h:181: }
   4E95                    1642 00115$:
                           1643 ;src/draws.h:183: if(atk <= 20){
   4E95 DD 7E FE      [19] 1644 	ld	a,-2 (ix)
   4E98 B7            [ 4] 1645 	or	a, a
   4E99 20 39         [12] 1646 	jr	NZ,00122$
                           1647 ;src/draws.h:184: memptr = cpct_getScreenPtr(VMEM,34,192);
   4E9B 21 22 C0      [10] 1648 	ld	hl,#0xC022
   4E9E E5            [11] 1649 	push	hl
   4E9F 2E 00         [ 7] 1650 	ld	l, #0x00
   4EA1 E5            [11] 1651 	push	hl
   4EA2 CD 14 6B      [17] 1652 	call	_cpct_getScreenPtr
                           1653 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4EA5 4D            [ 4] 1654 	ld	c, l
   4EA6 44            [ 4] 1655 	ld	b, h
                           1656 ;src/draws.h:185: switch(col){
   4EA7 DD 7E 05      [19] 1657 	ld	a,5 (ix)
   4EAA B7            [ 4] 1658 	or	a, a
   4EAB 28 09         [12] 1659 	jr	Z,00117$
   4EAD DD 7E 05      [19] 1660 	ld	a,5 (ix)
   4EB0 D6 02         [ 7] 1661 	sub	a, #0x02
   4EB2 28 14         [12] 1662 	jr	Z,00118$
   4EB4 18 1E         [12] 1663 	jr	00122$
                           1664 ;src/draws.h:186: case 0:
   4EB6                    1665 00117$:
                           1666 ;src/draws.h:187: cpct_drawSolidBox(memptr, col, 2, 8);
   4EB6 21 02 08      [10] 1667 	ld	hl,#0x0802
   4EB9 E5            [11] 1668 	push	hl
   4EBA DD 7E 05      [19] 1669 	ld	a,5 (ix)
   4EBD F5            [11] 1670 	push	af
   4EBE 33            [ 6] 1671 	inc	sp
   4EBF C5            [11] 1672 	push	bc
   4EC0 CD 43 6A      [17] 1673 	call	_cpct_drawSolidBox
   4EC3 F1            [10] 1674 	pop	af
   4EC4 F1            [10] 1675 	pop	af
   4EC5 33            [ 6] 1676 	inc	sp
                           1677 ;src/draws.h:188: break;
   4EC6 18 0C         [12] 1678 	jr	00122$
                           1679 ;src/draws.h:189: case 2:
   4EC8                    1680 00118$:
                           1681 ;src/draws.h:190: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4EC8 11 A0 46      [10] 1682 	ld	de,#_fatiga_full
   4ECB 21 02 08      [10] 1683 	ld	hl,#0x0802
   4ECE E5            [11] 1684 	push	hl
   4ECF C5            [11] 1685 	push	bc
   4ED0 D5            [11] 1686 	push	de
   4ED1 CD BD 69      [17] 1687 	call	_cpct_drawSpriteMasked
                           1688 ;src/draws.h:191: }
   4ED4                    1689 00122$:
   4ED4 DD F9         [10] 1690 	ld	sp, ix
   4ED6 DD E1         [14] 1691 	pop	ix
   4ED8 C9            [10] 1692 	ret
                           1693 ;src/draws.h:196: void drawPickUps(u8 corazon, u8 bullet){
                           1694 ;	---------------------------------
                           1695 ; Function drawPickUps
                           1696 ; ---------------------------------
   4ED9                    1697 _drawPickUps::
   4ED9 DD E5         [15] 1698 	push	ix
   4EDB DD 21 00 00   [14] 1699 	ld	ix,#0
   4EDF DD 39         [15] 1700 	add	ix,sp
                           1701 ;src/draws.h:199: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4EE1 21 04 A0      [10] 1702 	ld	hl,#0xA004
   4EE4 E5            [11] 1703 	push	hl
   4EE5 21 00 C0      [10] 1704 	ld	hl,#0xC000
   4EE8 E5            [11] 1705 	push	hl
   4EE9 CD 14 6B      [17] 1706 	call	_cpct_getScreenPtr
                           1707 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EEC 4D            [ 4] 1708 	ld	c, l
   4EED 44            [ 4] 1709 	ld	b, h
                           1710 ;src/draws.h:200: if(corazon == 0)
   4EEE DD 7E 04      [19] 1711 	ld	a,4 (ix)
   4EF1 B7            [ 4] 1712 	or	a, a
   4EF2 20 0E         [12] 1713 	jr	NZ,00102$
                           1714 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EF4 11 00 46      [10] 1715 	ld	de,#_corazon_lleno
   4EF7 21 04 08      [10] 1716 	ld	hl,#0x0804
   4EFA E5            [11] 1717 	push	hl
   4EFB C5            [11] 1718 	push	bc
   4EFC D5            [11] 1719 	push	de
   4EFD CD BD 69      [17] 1720 	call	_cpct_drawSpriteMasked
   4F00 18 0E         [12] 1721 	jr	00103$
   4F02                    1722 00102$:
                           1723 ;src/draws.h:203: cpct_drawSolidBox(memptr, 0, 4, 8);
   4F02 21 04 08      [10] 1724 	ld	hl,#0x0804
   4F05 E5            [11] 1725 	push	hl
   4F06 AF            [ 4] 1726 	xor	a, a
   4F07 F5            [11] 1727 	push	af
   4F08 33            [ 6] 1728 	inc	sp
   4F09 C5            [11] 1729 	push	bc
   4F0A CD 43 6A      [17] 1730 	call	_cpct_drawSolidBox
   4F0D F1            [10] 1731 	pop	af
   4F0E F1            [10] 1732 	pop	af
   4F0F 33            [ 6] 1733 	inc	sp
   4F10                    1734 00103$:
                           1735 ;src/draws.h:205: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4F10 21 08 10      [10] 1736 	ld	hl,#0x1008
   4F13 E5            [11] 1737 	push	hl
   4F14 21 00 C0      [10] 1738 	ld	hl,#0xC000
   4F17 E5            [11] 1739 	push	hl
   4F18 CD 14 6B      [17] 1740 	call	_cpct_getScreenPtr
                           1741 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F1B EB            [ 4] 1742 	ex	de,hl
                           1743 ;src/draws.h:206: if(bullet == 0)
   4F1C DD 7E 05      [19] 1744 	ld	a,5 (ix)
   4F1F B7            [ 4] 1745 	or	a, a
   4F20 20 0E         [12] 1746 	jr	NZ,00105$
                           1747 ;src/draws.h:207: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4F22 01 A2 66      [10] 1748 	ld	bc,#_flecha_arriba
   4F25 21 02 08      [10] 1749 	ld	hl,#0x0802
   4F28 E5            [11] 1750 	push	hl
   4F29 D5            [11] 1751 	push	de
   4F2A C5            [11] 1752 	push	bc
   4F2B CD BD 69      [17] 1753 	call	_cpct_drawSpriteMasked
   4F2E 18 0E         [12] 1754 	jr	00107$
   4F30                    1755 00105$:
                           1756 ;src/draws.h:209: cpct_drawSolidBox(memptr, 0, 2, 8);
   4F30 21 02 08      [10] 1757 	ld	hl,#0x0802
   4F33 E5            [11] 1758 	push	hl
   4F34 AF            [ 4] 1759 	xor	a, a
   4F35 F5            [11] 1760 	push	af
   4F36 33            [ 6] 1761 	inc	sp
   4F37 D5            [11] 1762 	push	de
   4F38 CD 43 6A      [17] 1763 	call	_cpct_drawSolidBox
   4F3B F1            [10] 1764 	pop	af
   4F3C F1            [10] 1765 	pop	af
   4F3D 33            [ 6] 1766 	inc	sp
   4F3E                    1767 00107$:
   4F3E DD E1         [14] 1768 	pop	ix
   4F40 C9            [10] 1769 	ret
                           1770 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1771 ;	---------------------------------
                           1772 ; Function detectPlayerRoom
                           1773 ; ---------------------------------
   4F41                    1774 _detectPlayerRoom::
   4F41 DD E5         [15] 1775 	push	ix
   4F43 DD 21 00 00   [14] 1776 	ld	ix,#0
   4F47 DD 39         [15] 1777 	add	ix,sp
                           1778 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   4F49 11 0A 6C      [10] 1779 	ld	de,#_scene+0
   4F4C DD 7E 05      [19] 1780 	ld	a,5 (ix)
   4F4F 07            [ 4] 1781 	rlca
   4F50 07            [ 4] 1782 	rlca
   4F51 07            [ 4] 1783 	rlca
   4F52 07            [ 4] 1784 	rlca
   4F53 E6 0F         [ 7] 1785 	and	a,#0x0F
   4F55 4F            [ 4] 1786 	ld	c,a
   4F56 06 00         [ 7] 1787 	ld	b,#0x00
   4F58 69            [ 4] 1788 	ld	l, c
   4F59 60            [ 4] 1789 	ld	h, b
   4F5A 29            [11] 1790 	add	hl, hl
   4F5B 29            [11] 1791 	add	hl, hl
   4F5C 09            [11] 1792 	add	hl, bc
   4F5D 29            [11] 1793 	add	hl, hl
   4F5E 29            [11] 1794 	add	hl, hl
   4F5F 19            [11] 1795 	add	hl,de
   4F60 DD 5E 04      [19] 1796 	ld	e,4 (ix)
   4F63 CB 3B         [ 8] 1797 	srl	e
   4F65 CB 3B         [ 8] 1798 	srl	e
   4F67 16 00         [ 7] 1799 	ld	d,#0x00
   4F69 19            [11] 1800 	add	hl,de
   4F6A 6E            [ 7] 1801 	ld	l,(hl)
   4F6B DD E1         [14] 1802 	pop	ix
   4F6D C9            [10] 1803 	ret
                           1804 ;src/ia.h:16: u8 chooseDirection(){
                           1805 ;	---------------------------------
                           1806 ; Function chooseDirection
                           1807 ; ---------------------------------
   4F6E                    1808 _chooseDirection::
                           1809 ;src/ia.h:18: u8 dir = 0;
   4F6E 16 00         [ 7] 1810 	ld	d,#0x00
                           1811 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   4F70 D5            [11] 1812 	push	de
   4F71 CD BC 67      [17] 1813 	call	_rand
   4F74 01 04 00      [10] 1814 	ld	bc,#0x0004
   4F77 C5            [11] 1815 	push	bc
   4F78 E5            [11] 1816 	push	hl
   4F79 CD 08 6B      [17] 1817 	call	__modsint
   4F7C F1            [10] 1818 	pop	af
   4F7D F1            [10] 1819 	pop	af
   4F7E D1            [10] 1820 	pop	de
   4F7F 5D            [ 4] 1821 	ld	e,l
   4F80 1C            [ 4] 1822 	inc	e
                           1823 ;src/ia.h:20: switch(rnd){
   4F81 7B            [ 4] 1824 	ld	a,e
   4F82 D6 01         [ 7] 1825 	sub	a, #0x01
   4F84 38 24         [12] 1826 	jr	C,00105$
   4F86 3E 04         [ 7] 1827 	ld	a,#0x04
   4F88 93            [ 4] 1828 	sub	a, e
   4F89 38 1F         [12] 1829 	jr	C,00105$
   4F8B 1D            [ 4] 1830 	dec	e
   4F8C 16 00         [ 7] 1831 	ld	d,#0x00
   4F8E 21 94 4F      [10] 1832 	ld	hl,#00116$
   4F91 19            [11] 1833 	add	hl,de
   4F92 19            [11] 1834 	add	hl,de
                           1835 ;src/ia.h:21: case 4: dir = 6;break;
   4F93 E9            [ 4] 1836 	jp	(hl)
   4F94                    1837 00116$:
   4F94 18 12         [12] 1838 	jr	00104$
   4F96 18 0C         [12] 1839 	jr	00103$
   4F98 18 06         [12] 1840 	jr	00102$
   4F9A 18 00         [12] 1841 	jr	00101$
   4F9C                    1842 00101$:
   4F9C 16 06         [ 7] 1843 	ld	d,#0x06
   4F9E 18 0A         [12] 1844 	jr	00105$
                           1845 ;src/ia.h:22: case 3: dir = 4;break;
   4FA0                    1846 00102$:
   4FA0 16 04         [ 7] 1847 	ld	d,#0x04
   4FA2 18 06         [12] 1848 	jr	00105$
                           1849 ;src/ia.h:23: case 2: dir = 2;break;
   4FA4                    1850 00103$:
   4FA4 16 02         [ 7] 1851 	ld	d,#0x02
   4FA6 18 02         [12] 1852 	jr	00105$
                           1853 ;src/ia.h:24: case 1: dir = 8;break;
   4FA8                    1854 00104$:
   4FA8 16 08         [ 7] 1855 	ld	d,#0x08
                           1856 ;src/ia.h:25: }
   4FAA                    1857 00105$:
                           1858 ;src/ia.h:27: return dir;
   4FAA 6A            [ 4] 1859 	ld	l,d
   4FAB C9            [10] 1860 	ret
                           1861 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           1862 ;	---------------------------------
                           1863 ; Function setDirection
                           1864 ; ---------------------------------
   4FAC                    1865 _setDirection::
   4FAC DD E5         [15] 1866 	push	ix
   4FAE DD 21 00 00   [14] 1867 	ld	ix,#0
   4FB2 DD 39         [15] 1868 	add	ix,sp
                           1869 ;src/ia.h:33: if(px < x) dir = 4;
   4FB4 DD 7E 04      [19] 1870 	ld	a,4 (ix)
   4FB7 DD 96 06      [19] 1871 	sub	a, 6 (ix)
   4FBA 30 04         [12] 1872 	jr	NC,00108$
   4FBC 2E 04         [ 7] 1873 	ld	l,#0x04
   4FBE 18 1A         [12] 1874 	jr	00109$
   4FC0                    1875 00108$:
                           1876 ;src/ia.h:34: else if(py > y) dir = 2;
   4FC0 DD 7E 07      [19] 1877 	ld	a,7 (ix)
   4FC3 DD 96 05      [19] 1878 	sub	a, 5 (ix)
   4FC6 30 04         [12] 1879 	jr	NC,00105$
   4FC8 2E 02         [ 7] 1880 	ld	l,#0x02
   4FCA 18 0E         [12] 1881 	jr	00109$
   4FCC                    1882 00105$:
                           1883 ;src/ia.h:35: else if(px > x) dir = 6;
   4FCC DD 7E 06      [19] 1884 	ld	a,6 (ix)
   4FCF DD 96 04      [19] 1885 	sub	a, 4 (ix)
   4FD2 30 04         [12] 1886 	jr	NC,00102$
   4FD4 2E 06         [ 7] 1887 	ld	l,#0x06
   4FD6 18 02         [12] 1888 	jr	00109$
   4FD8                    1889 00102$:
                           1890 ;src/ia.h:36: else dir = 8;
   4FD8 2E 08         [ 7] 1891 	ld	l,#0x08
   4FDA                    1892 00109$:
                           1893 ;src/ia.h:37: return dir;
   4FDA DD E1         [14] 1894 	pop	ix
   4FDC C9            [10] 1895 	ret
                           1896 ;src/ia.h:40: void movement(u8 dir){
                           1897 ;	---------------------------------
                           1898 ; Function movement
                           1899 ; ---------------------------------
   4FDD                    1900 _movement::
                           1901 ;src/ia.h:41: switch(dir){
   4FDD FD 21 02 00   [14] 1902 	ld	iy,#2
   4FE1 FD 39         [15] 1903 	add	iy,sp
   4FE3 FD 7E 00      [19] 1904 	ld	a,0 (iy)
   4FE6 D6 02         [ 7] 1905 	sub	a, #0x02
   4FE8 28 2B         [12] 1906 	jr	Z,00104$
   4FEA FD 7E 00      [19] 1907 	ld	a,0 (iy)
   4FED D6 04         [ 7] 1908 	sub	a, #0x04
   4FEF 28 14         [12] 1909 	jr	Z,00102$
   4FF1 FD 7E 00      [19] 1910 	ld	a,0 (iy)
   4FF4 D6 06         [ 7] 1911 	sub	a, #0x06
   4FF6 28 08         [12] 1912 	jr	Z,00101$
   4FF8 FD 7E 00      [19] 1913 	ld	a,0 (iy)
   4FFB D6 08         [ 7] 1914 	sub	a, #0x08
   4FFD 28 0E         [12] 1915 	jr	Z,00103$
   4FFF C9            [10] 1916 	ret
                           1917 ;src/ia.h:42: case 6: enemy.x += 1; break;
   5000                    1918 00101$:
   5000 21 18 6D      [10] 1919 	ld	hl,#_enemy+0
   5003 34            [11] 1920 	inc	(hl)
   5004 C9            [10] 1921 	ret
                           1922 ;src/ia.h:43: case 4: enemy.x -= 1; break;
   5005                    1923 00102$:
   5005 11 18 6D      [10] 1924 	ld	de,#_enemy+0
   5008 1A            [ 7] 1925 	ld	a,(de)
   5009 C6 FF         [ 7] 1926 	add	a,#0xFF
   500B 12            [ 7] 1927 	ld	(de),a
   500C C9            [10] 1928 	ret
                           1929 ;src/ia.h:44: case 8: enemy.y -= 2; break;
   500D                    1930 00103$:
   500D 11 19 6D      [10] 1931 	ld	de,#_enemy+1
   5010 1A            [ 7] 1932 	ld	a,(de)
   5011 C6 FE         [ 7] 1933 	add	a,#0xFE
   5013 12            [ 7] 1934 	ld	(de),a
   5014 C9            [10] 1935 	ret
                           1936 ;src/ia.h:45: case 2: enemy.y += 2; break;
   5015                    1937 00104$:
   5015 21 19 6D      [10] 1938 	ld	hl,#_enemy+1
   5018 7E            [ 7] 1939 	ld	a,(hl)
   5019 C6 02         [ 7] 1940 	add	a, #0x02
   501B 77            [ 7] 1941 	ld	(hl),a
                           1942 ;src/ia.h:46: }
   501C C9            [10] 1943 	ret
                           1944 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           1945 ;	---------------------------------
                           1946 ; Function checkCollisions
                           1947 ; ---------------------------------
   501D                    1948 _checkCollisions::
   501D DD E5         [15] 1949 	push	ix
   501F DD 21 00 00   [14] 1950 	ld	ix,#0
   5023 DD 39         [15] 1951 	add	ix,sp
   5025 21 FA FF      [10] 1952 	ld	hl,#-6
   5028 39            [11] 1953 	add	hl,sp
   5029 F9            [ 6] 1954 	ld	sp,hl
                           1955 ;src/CalcColision.h:8: u8 popX = pX + tilewidth;
   502A DD 6E 04      [19] 1956 	ld	l,4 (ix)
   502D 2C            [ 4] 1957 	inc	l
   502E 2C            [ 4] 1958 	inc	l
   502F 2C            [ 4] 1959 	inc	l
   5030 2C            [ 4] 1960 	inc	l
                           1961 ;src/CalcColision.h:9: u8 popY = pY + tileheight;
   5031 DD 7E 05      [19] 1962 	ld	a,5 (ix)
   5034 C6 10         [ 7] 1963 	add	a, #0x10
   5036 DD 77 FA      [19] 1964 	ld	-6 (ix),a
                           1965 ;src/CalcColision.h:10: u8 eopX = eX + tilewidth;
   5039 DD 5E 06      [19] 1966 	ld	e,6 (ix)
   503C 1C            [ 4] 1967 	inc	e
   503D 1C            [ 4] 1968 	inc	e
   503E 1C            [ 4] 1969 	inc	e
   503F 1C            [ 4] 1970 	inc	e
                           1971 ;src/CalcColision.h:11: u8 eopY = eY + tileheight;
   5040 DD 7E 07      [19] 1972 	ld	a,7 (ix)
   5043 C6 10         [ 7] 1973 	add	a, #0x10
   5045 DD 77 FB      [19] 1974 	ld	-5 (ix),a
                           1975 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5048 7B            [ 4] 1976 	ld	a,e
   5049 DD 96 04      [19] 1977 	sub	a, 4 (ix)
   504C 3E 00         [ 7] 1978 	ld	a,#0x00
   504E 17            [ 4] 1979 	rla
   504F DD 77 FF      [19] 1980 	ld	-1 (ix),a
   5052 7D            [ 4] 1981 	ld	a,l
   5053 93            [ 4] 1982 	sub	a, e
   5054 3E 00         [ 7] 1983 	ld	a,#0x00
   5056 17            [ 4] 1984 	rla
   5057 DD 77 FE      [19] 1985 	ld	-2 (ix),a
   505A DD 7E 07      [19] 1986 	ld	a,7 (ix)
   505D DD 96 05      [19] 1987 	sub	a, 5 (ix)
   5060 3E 00         [ 7] 1988 	ld	a,#0x00
   5062 17            [ 4] 1989 	rla
   5063 5F            [ 4] 1990 	ld	e,a
   5064 DD 7E FA      [19] 1991 	ld	a,-6 (ix)
   5067 DD 96 07      [19] 1992 	sub	a, 7 (ix)
   506A 3E 00         [ 7] 1993 	ld	a,#0x00
   506C 17            [ 4] 1994 	rla
   506D 4F            [ 4] 1995 	ld	c,a
                           1996 ;src/CalcColision.h:14: if(atk >= 21)
   506E DD 7E 08      [19] 1997 	ld	a,8 (ix)
   5071 D6 15         [ 7] 1998 	sub	a, #0x15
   5073 3E 00         [ 7] 1999 	ld	a,#0x00
   5075 17            [ 4] 2000 	rla
   5076 DD 77 FD      [19] 2001 	ld	-3 (ix),a
                           2002 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5079 DD 7E FF      [19] 2003 	ld	a,-1 (ix)
   507C B7            [ 4] 2004 	or	a, a
   507D 20 1C         [12] 2005 	jr	NZ,00105$
   507F DD 7E FE      [19] 2006 	ld	a,-2 (ix)
   5082 B7            [ 4] 2007 	or	a,a
   5083 20 16         [12] 2008 	jr	NZ,00105$
   5085 B3            [ 4] 2009 	or	a,e
   5086 20 13         [12] 2010 	jr	NZ,00105$
   5088 B1            [ 4] 2011 	or	a,c
   5089 20 10         [12] 2012 	jr	NZ,00105$
                           2013 ;src/CalcColision.h:14: if(atk >= 21)
   508B DD 7E FD      [19] 2014 	ld	a,-3 (ix)
   508E B7            [ 4] 2015 	or	a, a
   508F 20 05         [12] 2016 	jr	NZ,00102$
                           2017 ;src/CalcColision.h:15: return 1;
   5091 2E 01         [ 7] 2018 	ld	l,#0x01
   5093 C3 1F 51      [10] 2019 	jp	00133$
   5096                    2020 00102$:
                           2021 ;src/CalcColision.h:17: return 2;
   5096 2E 02         [ 7] 2022 	ld	l,#0x02
   5098 C3 1F 51      [10] 2023 	jp	00133$
   509B                    2024 00105$:
                           2025 ;src/CalcColision.h:19: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   509B DD 7E 06      [19] 2026 	ld	a,6 (ix)
   509E DD 96 04      [19] 2027 	sub	a, 4 (ix)
   50A1 3E 00         [ 7] 2028 	ld	a,#0x00
   50A3 17            [ 4] 2029 	rla
   50A4 DD 77 FC      [19] 2030 	ld	-4 (ix),a
   50A7 7D            [ 4] 2031 	ld	a,l
   50A8 DD 96 06      [19] 2032 	sub	a, 6 (ix)
   50AB 3E 00         [ 7] 2033 	ld	a,#0x00
   50AD 17            [ 4] 2034 	rla
   50AE 6F            [ 4] 2035 	ld	l,a
   50AF DD 7E FC      [19] 2036 	ld	a,-4 (ix)
   50B2 B7            [ 4] 2037 	or	a,a
   50B3 20 17         [12] 2038 	jr	NZ,00113$
   50B5 B5            [ 4] 2039 	or	a,l
   50B6 20 14         [12] 2040 	jr	NZ,00113$
   50B8 B3            [ 4] 2041 	or	a,e
   50B9 20 11         [12] 2042 	jr	NZ,00113$
   50BB B1            [ 4] 2043 	or	a,c
   50BC 20 0E         [12] 2044 	jr	NZ,00113$
                           2045 ;src/CalcColision.h:20: if(atk >= 21)
   50BE DD 7E FD      [19] 2046 	ld	a,-3 (ix)
   50C1 B7            [ 4] 2047 	or	a, a
   50C2 20 04         [12] 2048 	jr	NZ,00110$
                           2049 ;src/CalcColision.h:21: return 1;
   50C4 2E 01         [ 7] 2050 	ld	l,#0x01
   50C6 18 57         [12] 2051 	jr	00133$
   50C8                    2052 00110$:
                           2053 ;src/CalcColision.h:23: return 2;
   50C8 2E 02         [ 7] 2054 	ld	l,#0x02
   50CA 18 53         [12] 2055 	jr	00133$
   50CC                    2056 00113$:
                           2057 ;src/CalcColision.h:25: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   50CC DD 7E FB      [19] 2058 	ld	a,-5 (ix)
   50CF DD 96 05      [19] 2059 	sub	a, 5 (ix)
   50D2 3E 00         [ 7] 2060 	ld	a,#0x00
   50D4 17            [ 4] 2061 	rla
   50D5 5F            [ 4] 2062 	ld	e,a
   50D6 DD 7E FA      [19] 2063 	ld	a,-6 (ix)
   50D9 DD 96 FB      [19] 2064 	sub	a, -5 (ix)
   50DC 3E 00         [ 7] 2065 	ld	a,#0x00
   50DE 17            [ 4] 2066 	rla
   50DF 67            [ 4] 2067 	ld	h,a
   50E0 DD 7E FC      [19] 2068 	ld	a,-4 (ix)
   50E3 B7            [ 4] 2069 	or	a,a
   50E4 20 17         [12] 2070 	jr	NZ,00121$
   50E6 B5            [ 4] 2071 	or	a,l
   50E7 20 14         [12] 2072 	jr	NZ,00121$
   50E9 B3            [ 4] 2073 	or	a,e
   50EA 20 11         [12] 2074 	jr	NZ,00121$
   50EC B4            [ 4] 2075 	or	a,h
   50ED 20 0E         [12] 2076 	jr	NZ,00121$
                           2077 ;src/CalcColision.h:26: if(atk >= 21)
   50EF DD 7E FD      [19] 2078 	ld	a,-3 (ix)
   50F2 B7            [ 4] 2079 	or	a, a
   50F3 20 04         [12] 2080 	jr	NZ,00118$
                           2081 ;src/CalcColision.h:27: return 1;
   50F5 2E 01         [ 7] 2082 	ld	l,#0x01
   50F7 18 26         [12] 2083 	jr	00133$
   50F9                    2084 00118$:
                           2085 ;src/CalcColision.h:29: return 2;
   50F9 2E 02         [ 7] 2086 	ld	l,#0x02
   50FB 18 22         [12] 2087 	jr	00133$
   50FD                    2088 00121$:
                           2089 ;src/CalcColision.h:31: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   50FD DD 7E FF      [19] 2090 	ld	a,-1 (ix)
   5100 B7            [ 4] 2091 	or	a, a
   5101 20 1A         [12] 2092 	jr	NZ,00129$
   5103 DD 7E FE      [19] 2093 	ld	a,-2 (ix)
   5106 B7            [ 4] 2094 	or	a,a
   5107 20 14         [12] 2095 	jr	NZ,00129$
   5109 B3            [ 4] 2096 	or	a,e
   510A 20 11         [12] 2097 	jr	NZ,00129$
   510C B4            [ 4] 2098 	or	a,h
   510D 20 0E         [12] 2099 	jr	NZ,00129$
                           2100 ;src/CalcColision.h:32: if(atk >= 21)
   510F DD 7E FD      [19] 2101 	ld	a,-3 (ix)
   5112 B7            [ 4] 2102 	or	a, a
   5113 20 04         [12] 2103 	jr	NZ,00126$
                           2104 ;src/CalcColision.h:33: return 1;
   5115 2E 01         [ 7] 2105 	ld	l,#0x01
   5117 18 06         [12] 2106 	jr	00133$
   5119                    2107 00126$:
                           2108 ;src/CalcColision.h:35: return 2;
   5119 2E 02         [ 7] 2109 	ld	l,#0x02
   511B 18 02         [12] 2110 	jr	00133$
   511D                    2111 00129$:
                           2112 ;src/CalcColision.h:37: return 0;
   511D 2E 00         [ 7] 2113 	ld	l,#0x00
   511F                    2114 00133$:
   511F DD F9         [10] 2115 	ld	sp, ix
   5121 DD E1         [14] 2116 	pop	ix
   5123 C9            [10] 2117 	ret
                           2118 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2119 ;	---------------------------------
                           2120 ; Function checkKeyboard
                           2121 ; ---------------------------------
   5124                    2122 _checkKeyboard::
   5124 DD E5         [15] 2123 	push	ix
   5126 DD 21 00 00   [14] 2124 	ld	ix,#0
   512A DD 39         [15] 2125 	add	ix,sp
   512C 21 FA FF      [10] 2126 	ld	hl,#-6
   512F 39            [11] 2127 	add	hl,sp
   5130 F9            [ 6] 2128 	ld	sp,hl
                           2129 ;src/keyboard.h:14: u8 *s = NULL;
   5131 DD 36 FE 00   [19] 2130 	ld	-2 (ix),#0x00
   5135 DD 36 FF 00   [19] 2131 	ld	-1 (ix),#0x00
                           2132 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   5139 21 05 80      [10] 2133 	ld	hl,#0x8005
   513C CD 46 67      [17] 2134 	call	_cpct_isKeyPressed
   513F 7D            [ 4] 2135 	ld	a,l
   5140 B7            [ 4] 2136 	or	a, a
   5141 28 68         [12] 2137 	jr	Z,00147$
   5143 21 15 6D      [10] 2138 	ld	hl, #(_player + 0x0008) + 0
   5146 7E            [ 7] 2139 	ld	a,(hl)
   5147 DD 77 FD      [19] 2140 	ld	-3 (ix), a
   514A D6 14         [ 7] 2141 	sub	a, #0x14
   514C 38 5D         [12] 2142 	jr	C,00147$
                           2143 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   514E DD 7E FD      [19] 2144 	ld	a,-3 (ix)
   5151 D6 32         [ 7] 2145 	sub	a, #0x32
   5153 38 07         [12] 2146 	jr	C,00102$
   5155 21 15 6D      [10] 2147 	ld	hl,#(_player + 0x0008)
   5158 36 00         [10] 2148 	ld	(hl),#0x00
   515A 18 08         [12] 2149 	jr	00103$
   515C                    2150 00102$:
                           2151 ;src/keyboard.h:17: else player.atk += 1;
   515C DD 7E FD      [19] 2152 	ld	a,-3 (ix)
   515F 3C            [ 4] 2153 	inc	a
   5160 21 15 6D      [10] 2154 	ld	hl,#(_player + 0x0008)
   5163 77            [ 7] 2155 	ld	(hl),a
   5164                    2156 00103$:
                           2157 ;src/keyboard.h:18: switch(player.dir){
   5164 21 14 6D      [10] 2158 	ld	hl, #_player + 7
   5167 66            [ 7] 2159 	ld	h,(hl)
   5168 7C            [ 4] 2160 	ld	a,h
   5169 D6 02         [ 7] 2161 	sub	a, #0x02
   516B 28 33         [12] 2162 	jr	Z,00107$
   516D 7C            [ 4] 2163 	ld	a,h
   516E D6 04         [ 7] 2164 	sub	a, #0x04
   5170 28 0D         [12] 2165 	jr	Z,00104$
   5172 7C            [ 4] 2166 	ld	a,h
   5173 D6 06         [ 7] 2167 	sub	a, #0x06
   5175 28 13         [12] 2168 	jr	Z,00105$
   5177 7C            [ 4] 2169 	ld	a,h
   5178 D6 08         [ 7] 2170 	sub	a, #0x08
   517A 28 19         [12] 2171 	jr	Z,00106$
   517C C3 72 53      [10] 2172 	jp	00148$
                           2173 ;src/keyboard.h:19: case 4:
   517F                    2174 00104$:
                           2175 ;src/keyboard.h:20: s = gladis_atk_izda;
   517F DD 36 FE 80   [19] 2176 	ld	-2 (ix),#<(_gladis_atk_izda)
   5183 DD 36 FF 41   [19] 2177 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2178 ;src/keyboard.h:21: break;
   5187 C3 72 53      [10] 2179 	jp	00148$
                           2180 ;src/keyboard.h:22: case 6:
   518A                    2181 00105$:
                           2182 ;src/keyboard.h:23: s = gladis_atk_dcha;
   518A DD 36 FE 00   [19] 2183 	ld	-2 (ix),#<(_gladis_atk_dcha)
   518E DD 36 FF 41   [19] 2184 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2185 ;src/keyboard.h:24: break;
   5192 C3 72 53      [10] 2186 	jp	00148$
                           2187 ;src/keyboard.h:25: case 8:
   5195                    2188 00106$:
                           2189 ;src/keyboard.h:26: s = gladis_atk_arriba;
   5195 DD 36 FE 80   [19] 2190 	ld	-2 (ix),#<(_gladis_atk_arriba)
   5199 DD 36 FF 43   [19] 2191 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2192 ;src/keyboard.h:27: break;
   519D C3 72 53      [10] 2193 	jp	00148$
                           2194 ;src/keyboard.h:28: case 2:
   51A0                    2195 00107$:
                           2196 ;src/keyboard.h:29: s = gladis_atk_abajo;
   51A0 DD 36 FE 00   [19] 2197 	ld	-2 (ix),#<(_gladis_atk_abajo)
   51A4 DD 36 FF 43   [19] 2198 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2199 ;src/keyboard.h:31: }
   51A8 C3 72 53      [10] 2200 	jp	00148$
   51AB                    2201 00147$:
                           2202 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   51AB 21 15 6D      [10] 2203 	ld	hl, #(_player + 0x0008) + 0
   51AE 56            [ 7] 2204 	ld	d,(hl)
   51AF 7A            [ 4] 2205 	ld	a,d
   51B0 D6 14         [ 7] 2206 	sub	a, #0x14
   51B2 30 07         [12] 2207 	jr	NC,00110$
   51B4 14            [ 4] 2208 	inc	d
   51B5 21 15 6D      [10] 2209 	ld	hl,#(_player + 0x0008)
   51B8 72            [ 7] 2210 	ld	(hl),d
   51B9 18 05         [12] 2211 	jr	00111$
   51BB                    2212 00110$:
                           2213 ;src/keyboard.h:34: else player.atk = 20;
   51BB 21 15 6D      [10] 2214 	ld	hl,#(_player + 0x0008)
   51BE 36 14         [10] 2215 	ld	(hl),#0x14
   51C0                    2216 00111$:
                           2217 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   51C0 21 00 02      [10] 2218 	ld	hl,#0x0200
   51C3 CD 46 67      [17] 2219 	call	_cpct_isKeyPressed
                           2220 ;src/keyboard.h:37: player.dir = 6;
                           2221 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   51C6 7D            [ 4] 2222 	ld	a,l
   51C7 B7            [ 4] 2223 	or	a, a
   51C8 28 1E         [12] 2224 	jr	Z,00143$
   51CA 21 0D 6D      [10] 2225 	ld	hl, #_player + 0
   51CD 56            [ 7] 2226 	ld	d,(hl)
   51CE 7A            [ 4] 2227 	ld	a,d
   51CF D6 4C         [ 7] 2228 	sub	a, #0x4C
   51D1 30 15         [12] 2229 	jr	NC,00143$
                           2230 ;src/keyboard.h:36: player.x += 1;
   51D3 14            [ 4] 2231 	inc	d
   51D4 21 0D 6D      [10] 2232 	ld	hl,#_player
   51D7 72            [ 7] 2233 	ld	(hl),d
                           2234 ;src/keyboard.h:37: player.dir = 6;
   51D8 21 14 6D      [10] 2235 	ld	hl,#(_player + 0x0007)
   51DB 36 06         [10] 2236 	ld	(hl),#0x06
                           2237 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   51DD DD 36 FE 00   [19] 2238 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   51E1 DD 36 FF 40   [19] 2239 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   51E5 C3 72 53      [10] 2240 	jp	00148$
   51E8                    2241 00143$:
                           2242 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   51E8 21 01 01      [10] 2243 	ld	hl,#0x0101
   51EB CD 46 67      [17] 2244 	call	_cpct_isKeyPressed
   51EE 7D            [ 4] 2245 	ld	a,l
   51EF B7            [ 4] 2246 	or	a, a
   51F0 28 1B         [12] 2247 	jr	Z,00139$
   51F2 3A 0D 6D      [13] 2248 	ld	a, (#_player + 0)
   51F5 B7            [ 4] 2249 	or	a, a
   51F6 28 15         [12] 2250 	jr	Z,00139$
                           2251 ;src/keyboard.h:40: player.x -= 1;
   51F8 C6 FF         [ 7] 2252 	add	a,#0xFF
   51FA 32 0D 6D      [13] 2253 	ld	(#_player),a
                           2254 ;src/keyboard.h:41: player.dir = 4;
   51FD 21 14 6D      [10] 2255 	ld	hl,#(_player + 0x0007)
   5200 36 04         [10] 2256 	ld	(hl),#0x04
                           2257 ;src/keyboard.h:42: s = gladis_quieto_izda;
   5202 DD 36 FE 80   [19] 2258 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5206 DD 36 FF 40   [19] 2259 	ld	-1 (ix),#>(_gladis_quieto_izda)
   520A C3 72 53      [10] 2260 	jp	00148$
   520D                    2261 00139$:
                           2262 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   520D 21 00 04      [10] 2263 	ld	hl,#0x0400
   5210 CD 46 67      [17] 2264 	call	_cpct_isKeyPressed
   5213 01 0E 6D      [10] 2265 	ld	bc,#_player + 1
   5216 7D            [ 4] 2266 	ld	a,l
   5217 B7            [ 4] 2267 	or	a, a
   5218 28 1A         [12] 2268 	jr	Z,00135$
   521A 0A            [ 7] 2269 	ld	a,(bc)
   521B 67            [ 4] 2270 	ld	h,a
   521C D6 B4         [ 7] 2271 	sub	a, #0xB4
   521E 30 14         [12] 2272 	jr	NC,00135$
                           2273 ;src/keyboard.h:44: player.y += 2;
   5220 7C            [ 4] 2274 	ld	a,h
   5221 C6 02         [ 7] 2275 	add	a, #0x02
   5223 02            [ 7] 2276 	ld	(bc),a
                           2277 ;src/keyboard.h:45: player.dir = 2;
   5224 21 14 6D      [10] 2278 	ld	hl,#(_player + 0x0007)
   5227 36 02         [10] 2279 	ld	(hl),#0x02
                           2280 ;src/keyboard.h:46: s = gladis_abajo;
   5229 DD 36 FE 80   [19] 2281 	ld	-2 (ix),#<(_gladis_abajo)
   522D DD 36 FF 42   [19] 2282 	ld	-1 (ix),#>(_gladis_abajo)
   5231 C3 72 53      [10] 2283 	jp	00148$
   5234                    2284 00135$:
                           2285 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   5234 C5            [11] 2286 	push	bc
   5235 21 00 01      [10] 2287 	ld	hl,#0x0100
   5238 CD 46 67      [17] 2288 	call	_cpct_isKeyPressed
   523B 7D            [ 4] 2289 	ld	a,l
   523C C1            [10] 2290 	pop	bc
   523D B7            [ 4] 2291 	or	a, a
   523E 28 17         [12] 2292 	jr	Z,00131$
   5240 0A            [ 7] 2293 	ld	a,(bc)
   5241 B7            [ 4] 2294 	or	a, a
   5242 28 13         [12] 2295 	jr	Z,00131$
                           2296 ;src/keyboard.h:48: player.y -= 2;
   5244 C6 FE         [ 7] 2297 	add	a,#0xFE
   5246 02            [ 7] 2298 	ld	(bc),a
                           2299 ;src/keyboard.h:49: player.dir = 8;
   5247 21 14 6D      [10] 2300 	ld	hl,#(_player + 0x0007)
   524A 36 08         [10] 2301 	ld	(hl),#0x08
                           2302 ;src/keyboard.h:50: s = gladis_arriba;
   524C DD 36 FE 00   [19] 2303 	ld	-2 (ix),#<(_gladis_arriba)
   5250 DD 36 FF 42   [19] 2304 	ld	-1 (ix),#>(_gladis_arriba)
   5254 C3 72 53      [10] 2305 	jp	00148$
   5257                    2306 00131$:
                           2307 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   5257 C5            [11] 2308 	push	bc
   5258 21 07 80      [10] 2309 	ld	hl,#0x8007
   525B CD 46 67      [17] 2310 	call	_cpct_isKeyPressed
   525E 7D            [ 4] 2311 	ld	a,l
   525F C1            [10] 2312 	pop	bc
   5260 B7            [ 4] 2313 	or	a, a
   5261 CA 32 53      [10] 2314 	jp	Z,00125$
   5264 3A FF 6C      [13] 2315 	ld	a,(#_arrow + 0)
   5267 B7            [ 4] 2316 	or	a, a
   5268 C2 32 53      [10] 2317 	jp	NZ,00125$
   526B 3A 15 6D      [13] 2318 	ld	a, (#(_player + 0x0008) + 0)
   526E D6 14         [ 7] 2319 	sub	a, #0x14
   5270 C2 32 53      [10] 2320 	jp	NZ,00125$
   5273 3A 17 6D      [13] 2321 	ld	a, (#(_player + 0x000a) + 0)
   5276 B7            [ 4] 2322 	or	a, a
   5277 CA 32 53      [10] 2323 	jp	Z,00125$
                           2324 ;src/keyboard.h:52: if(player.bullets> 0){
   527A B7            [ 4] 2325 	or	a, a
   527B CA 2B 53      [10] 2326 	jp	Z,00118$
                           2327 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   527E DD 36 FB E2   [19] 2328 	ld	-5 (ix),#<(_flecha_dcha)
   5282 DD 36 FC 66   [19] 2329 	ld	-4 (ix),#>(_flecha_dcha)
   5286 DD 36 FA 02   [19] 2330 	ld	-6 (ix),#0x02
   528A 1E 08         [ 7] 2331 	ld	e,#0x08
                           2332 ;src/keyboard.h:54: switch(player.dir){
   528C 21 14 6D      [10] 2333 	ld	hl, #(_player + 0x0007) + 0
   528F 56            [ 7] 2334 	ld	d,(hl)
   5290 7A            [ 4] 2335 	ld	a,d
   5291 D6 02         [ 7] 2336 	sub	a, #0x02
   5293 28 31         [12] 2337 	jr	Z,00114$
   5295 7A            [ 4] 2338 	ld	a,d
   5296 D6 04         [ 7] 2339 	sub	a, #0x04
   5298 28 1C         [12] 2340 	jr	Z,00113$
   529A 7A            [ 4] 2341 	ld	a,d
   529B D6 06         [ 7] 2342 	sub	a, #0x06
   529D 28 07         [12] 2343 	jr	Z,00112$
   529F 7A            [ 4] 2344 	ld	a,d
   52A0 D6 08         [ 7] 2345 	sub	a, #0x08
   52A2 28 32         [12] 2346 	jr	Z,00115$
   52A4 18 3E         [12] 2347 	jr	00116$
                           2348 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   52A6                    2349 00112$:
   52A6 DD 36 FB E2   [19] 2350 	ld	-5 (ix),#<(_flecha_dcha)
   52AA DD 36 FC 66   [19] 2351 	ld	-4 (ix),#>(_flecha_dcha)
   52AE DD 36 FA 04   [19] 2352 	ld	-6 (ix),#0x04
   52B2 1E 04         [ 7] 2353 	ld	e,#0x04
   52B4 18 2E         [12] 2354 	jr	00116$
                           2355 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   52B6                    2356 00113$:
   52B6 DD 36 FB 02   [19] 2357 	ld	-5 (ix),#<(_flecha_izda)
   52BA DD 36 FC 67   [19] 2358 	ld	-4 (ix),#>(_flecha_izda)
   52BE DD 36 FA 04   [19] 2359 	ld	-6 (ix),#0x04
   52C2 1E 04         [ 7] 2360 	ld	e,#0x04
   52C4 18 1E         [12] 2361 	jr	00116$
                           2362 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   52C6                    2363 00114$:
   52C6 DD 36 FB C2   [19] 2364 	ld	-5 (ix),#<(_flecha_abajo)
   52CA DD 36 FC 66   [19] 2365 	ld	-4 (ix),#>(_flecha_abajo)
   52CE DD 36 FA 02   [19] 2366 	ld	-6 (ix),#0x02
   52D2 1E 08         [ 7] 2367 	ld	e,#0x08
   52D4 18 0E         [12] 2368 	jr	00116$
                           2369 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   52D6                    2370 00115$:
   52D6 DD 36 FB A2   [19] 2371 	ld	-5 (ix),#<(_flecha_arriba)
   52DA DD 36 FC 66   [19] 2372 	ld	-4 (ix),#>(_flecha_arriba)
   52DE DD 36 FA 02   [19] 2373 	ld	-6 (ix),#0x02
   52E2 1E 08         [ 7] 2374 	ld	e,#0x08
                           2375 ;src/keyboard.h:59: }
   52E4                    2376 00116$:
                           2377 ;src/keyboard.h:60: player.atk = 0;
   52E4 21 15 6D      [10] 2378 	ld	hl,#(_player + 0x0008)
   52E7 36 00         [10] 2379 	ld	(hl),#0x00
                           2380 ;src/keyboard.h:61: object.x = player.x;
   52E9 3A 0D 6D      [13] 2381 	ld	a, (#_player + 0)
   52EC 32 03 6D      [13] 2382 	ld	(#_object),a
                           2383 ;src/keyboard.h:62: object.y = player.y+8;
   52EF 0A            [ 7] 2384 	ld	a,(bc)
   52F0 C6 08         [ 7] 2385 	add	a, #0x08
   52F2 32 04 6D      [13] 2386 	ld	(#(_object + 0x0001)),a
                           2387 ;src/keyboard.h:63: object.x = object.x;
   52F5 21 03 6D      [10] 2388 	ld	hl, #_object + 0
   52F8 56            [ 7] 2389 	ld	d,(hl)
   52F9 21 03 6D      [10] 2390 	ld	hl,#_object
   52FC 72            [ 7] 2391 	ld	(hl),d
                           2392 ;src/keyboard.h:64: object.y = object.y;
   52FD 32 04 6D      [13] 2393 	ld	(#(_object + 0x0001)),a
                           2394 ;src/keyboard.h:65: object.sprite = spr;
   5300 21 07 6D      [10] 2395 	ld	hl,#_object + 4
   5303 DD 7E FB      [19] 2396 	ld	a,-5 (ix)
   5306 77            [ 7] 2397 	ld	(hl),a
   5307 23            [ 6] 2398 	inc	hl
   5308 DD 7E FC      [19] 2399 	ld	a,-4 (ix)
   530B 77            [ 7] 2400 	ld	(hl),a
                           2401 ;src/keyboard.h:66: object.vivo = 1;
   530C 21 09 6D      [10] 2402 	ld	hl,#_object + 6
   530F 36 01         [10] 2403 	ld	(hl),#0x01
                           2404 ;src/keyboard.h:67: object.dir = player.dir;
   5311 01 0A 6D      [10] 2405 	ld	bc,#_object + 7
   5314 3A 14 6D      [13] 2406 	ld	a, (#(_player + 0x0007) + 0)
   5317 02            [ 7] 2407 	ld	(bc),a
                           2408 ;src/keyboard.h:68: object.sizeX = xs;
   5318 21 0B 6D      [10] 2409 	ld	hl,#_object + 8
   531B DD 7E FA      [19] 2410 	ld	a,-6 (ix)
   531E 77            [ 7] 2411 	ld	(hl),a
                           2412 ;src/keyboard.h:69: object.sizeY = ys;
   531F 21 0C 6D      [10] 2413 	ld	hl,#_object + 9
   5322 73            [ 7] 2414 	ld	(hl),e
                           2415 ;src/keyboard.h:70: player.bullets--;
   5323 3A 17 6D      [13] 2416 	ld	a, (#(_player + 0x000a) + 0)
   5326 C6 FF         [ 7] 2417 	add	a,#0xFF
   5328 32 17 6D      [13] 2418 	ld	(#(_player + 0x000a)),a
   532B                    2419 00118$:
                           2420 ;src/keyboard.h:72: arrow=1;
   532B 21 FF 6C      [10] 2421 	ld	hl,#_arrow + 0
   532E 36 01         [10] 2422 	ld	(hl), #0x01
   5330 18 40         [12] 2423 	jr	00148$
   5332                    2424 00125$:
                           2425 ;src/keyboard.h:74: switch(player.dir){
   5332 21 14 6D      [10] 2426 	ld	hl, #(_player + 0x0007) + 0
   5335 66            [ 7] 2427 	ld	h,(hl)
   5336 7C            [ 4] 2428 	ld	a,h
   5337 D6 02         [ 7] 2429 	sub	a, #0x02
   5339 28 2F         [12] 2430 	jr	Z,00122$
   533B 7C            [ 4] 2431 	ld	a,h
   533C D6 04         [ 7] 2432 	sub	a, #0x04
   533E 28 0C         [12] 2433 	jr	Z,00119$
   5340 7C            [ 4] 2434 	ld	a,h
   5341 D6 06         [ 7] 2435 	sub	a, #0x06
   5343 28 11         [12] 2436 	jr	Z,00120$
   5345 7C            [ 4] 2437 	ld	a,h
   5346 D6 08         [ 7] 2438 	sub	a, #0x08
   5348 28 16         [12] 2439 	jr	Z,00121$
   534A 18 26         [12] 2440 	jr	00148$
                           2441 ;src/keyboard.h:75: case 4:
   534C                    2442 00119$:
                           2443 ;src/keyboard.h:76: s = gladis_quieto_izda;
   534C DD 36 FE 80   [19] 2444 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5350 DD 36 FF 40   [19] 2445 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           2446 ;src/keyboard.h:77: break;
   5354 18 1C         [12] 2447 	jr	00148$
                           2448 ;src/keyboard.h:78: case 6:
   5356                    2449 00120$:
                           2450 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   5356 DD 36 FE 00   [19] 2451 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   535A DD 36 FF 40   [19] 2452 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           2453 ;src/keyboard.h:80: break;
   535E 18 12         [12] 2454 	jr	00148$
                           2455 ;src/keyboard.h:81: case 8:
   5360                    2456 00121$:
                           2457 ;src/keyboard.h:82: s = gladis_arriba;
   5360 DD 36 FE 00   [19] 2458 	ld	-2 (ix),#<(_gladis_arriba)
   5364 DD 36 FF 42   [19] 2459 	ld	-1 (ix),#>(_gladis_arriba)
                           2460 ;src/keyboard.h:83: break;
   5368 18 08         [12] 2461 	jr	00148$
                           2462 ;src/keyboard.h:84: case 2:
   536A                    2463 00122$:
                           2464 ;src/keyboard.h:85: s = gladis_abajo;
   536A DD 36 FE 80   [19] 2465 	ld	-2 (ix),#<(_gladis_abajo)
   536E DD 36 FF 42   [19] 2466 	ld	-1 (ix),#>(_gladis_abajo)
                           2467 ;src/keyboard.h:87: }
   5372                    2468 00148$:
                           2469 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   5372 21 04 10      [10] 2470 	ld	hl,#0x1004
   5375 CD 46 67      [17] 2471 	call	_cpct_isKeyPressed
   5378 7D            [ 4] 2472 	ld	a,l
   5379 B7            [ 4] 2473 	or	a, a
   537A 28 05         [12] 2474 	jr	Z,00151$
                           2475 ;src/keyboard.h:94: arrow = 0;
   537C 21 FF 6C      [10] 2476 	ld	hl,#_arrow + 0
   537F 36 00         [10] 2477 	ld	(hl), #0x00
   5381                    2478 00151$:
                           2479 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   5381 21 08 04      [10] 2480 	ld	hl,#0x0408
   5384 CD 46 67      [17] 2481 	call	_cpct_isKeyPressed
   5387 7D            [ 4] 2482 	ld	a,l
   5388 B7            [ 4] 2483 	or	a, a
   5389 28 05         [12] 2484 	jr	Z,00153$
                           2485 ;src/keyboard.h:97: finish = 1;
   538B 21 FE 6C      [10] 2486 	ld	hl,#_finish + 0
   538E 36 01         [10] 2487 	ld	(hl), #0x01
   5390                    2488 00153$:
                           2489 ;src/keyboard.h:99: return s;
   5390 DD 6E FE      [19] 2490 	ld	l,-2 (ix)
   5393 DD 66 FF      [19] 2491 	ld	h,-1 (ix)
   5396 DD F9         [10] 2492 	ld	sp, ix
   5398 DD E1         [14] 2493 	pop	ix
   539A C9            [10] 2494 	ret
                           2495 ;src/keyboard.h:102: void moveObject(){
                           2496 ;	---------------------------------
                           2497 ; Function moveObject
                           2498 ; ---------------------------------
   539B                    2499 _moveObject::
                           2500 ;src/keyboard.h:103: object.lx = object.x;
   539B 01 03 6D      [10] 2501 	ld	bc,#_object+0
   539E 0A            [ 7] 2502 	ld	a,(bc)
   539F 32 05 6D      [13] 2503 	ld	(#(_object + 0x0002)),a
                           2504 ;src/keyboard.h:104: object.ly = object.y;
   53A2 59            [ 4] 2505 	ld	e, c
   53A3 50            [ 4] 2506 	ld	d, b
   53A4 13            [ 6] 2507 	inc	de
   53A5 1A            [ 7] 2508 	ld	a,(de)
   53A6 32 06 6D      [13] 2509 	ld	(#(_object + 0x0003)),a
                           2510 ;src/keyboard.h:105: switch(object.dir){
   53A9 3A 0A 6D      [13] 2511 	ld	a,(#_object + 7)
   53AC FE 02         [ 7] 2512 	cp	a,#0x02
   53AE 28 16         [12] 2513 	jr	Z,00103$
   53B0 FE 04         [ 7] 2514 	cp	a,#0x04
   53B2 28 0D         [12] 2515 	jr	Z,00102$
   53B4 FE 06         [ 7] 2516 	cp	a,#0x06
   53B6 28 05         [12] 2517 	jr	Z,00101$
   53B8 D6 08         [ 7] 2518 	sub	a, #0x08
   53BA 28 0F         [12] 2519 	jr	Z,00104$
   53BC C9            [10] 2520 	ret
                           2521 ;src/keyboard.h:106: case 6: object.x += 1; break;
   53BD                    2522 00101$:
   53BD 0A            [ 7] 2523 	ld	a,(bc)
   53BE 3C            [ 4] 2524 	inc	a
   53BF 02            [ 7] 2525 	ld	(bc),a
   53C0 C9            [10] 2526 	ret
                           2527 ;src/keyboard.h:107: case 4: object.x -= 1; break;
   53C1                    2528 00102$:
   53C1 0A            [ 7] 2529 	ld	a,(bc)
   53C2 C6 FF         [ 7] 2530 	add	a,#0xFF
   53C4 02            [ 7] 2531 	ld	(bc),a
   53C5 C9            [10] 2532 	ret
                           2533 ;src/keyboard.h:108: case 2: object.y += 2; break;
   53C6                    2534 00103$:
   53C6 1A            [ 7] 2535 	ld	a,(de)
   53C7 C6 02         [ 7] 2536 	add	a, #0x02
   53C9 12            [ 7] 2537 	ld	(de),a
   53CA C9            [10] 2538 	ret
                           2539 ;src/keyboard.h:109: case 8: object.y -= 2; break;
   53CB                    2540 00104$:
   53CB 1A            [ 7] 2541 	ld	a,(de)
   53CC C6 FE         [ 7] 2542 	add	a,#0xFE
   53CE 12            [ 7] 2543 	ld	(de),a
                           2544 ;src/keyboard.h:110: }
   53CF C9            [10] 2545 	ret
                           2546 ;src/main.c:37: void init(){
                           2547 ;	---------------------------------
                           2548 ; Function init
                           2549 ; ---------------------------------
   53D0                    2550 _init::
                           2551 ;src/main.c:38: cpct_disableFirmware();
   53D0 CD 32 6A      [17] 2552 	call	_cpct_disableFirmware
                           2553 ;src/main.c:39: cpct_setVideoMode(0);
   53D3 AF            [ 4] 2554 	xor	a, a
   53D4 F5            [11] 2555 	push	af
   53D5 33            [ 6] 2556 	inc	sp
   53D6 CD 0F 6A      [17] 2557 	call	_cpct_setVideoMode
   53D9 33            [ 6] 2558 	inc	sp
                           2559 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   53DA 11 0E 49      [10] 2560 	ld	de,#_g_palette
   53DD 3E 04         [ 7] 2561 	ld	a,#0x04
   53DF F5            [11] 2562 	push	af
   53E0 33            [ 6] 2563 	inc	sp
   53E1 D5            [11] 2564 	push	de
   53E2 CD 99 69      [17] 2565 	call	_cpct_fw2hw
   53E5 F1            [10] 2566 	pop	af
   53E6 33            [ 6] 2567 	inc	sp
                           2568 ;src/main.c:41: cpct_setPalette(g_palette,4);
   53E7 11 0E 49      [10] 2569 	ld	de,#_g_palette
   53EA 3E 04         [ 7] 2570 	ld	a,#0x04
   53EC F5            [11] 2571 	push	af
   53ED 33            [ 6] 2572 	inc	sp
   53EE D5            [11] 2573 	push	de
   53EF CD 22 67      [17] 2574 	call	_cpct_setPalette
   53F2 F1            [10] 2575 	pop	af
   53F3 33            [ 6] 2576 	inc	sp
   53F4 C9            [10] 2577 	ret
                           2578 ;src/main.c:44: void initPlayer(){
                           2579 ;	---------------------------------
                           2580 ; Function initPlayer
                           2581 ; ---------------------------------
   53F5                    2582 _initPlayer::
                           2583 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           2584 ;src/main.c:46: player.x = origins[0][0];
   53F5 01 13 49      [10] 2585 	ld	bc,#_origins+0
   53F8 0A            [ 7] 2586 	ld	a,(bc)
   53F9 32 0D 6D      [13] 2587 	ld	(#_player),a
                           2588 ;src/main.c:47: player.y = origins[0][1];
   53FC 59            [ 4] 2589 	ld	e, c
   53FD 50            [ 4] 2590 	ld	d, b
   53FE 13            [ 6] 2591 	inc	de
   53FF 1A            [ 7] 2592 	ld	a,(de)
   5400 32 0E 6D      [13] 2593 	ld	(#(_player + 0x0001)),a
                           2594 ;src/main.c:48: player.lx = origins[0][0];
   5403 0A            [ 7] 2595 	ld	a,(bc)
   5404 32 0F 6D      [13] 2596 	ld	(#(_player + 0x0002)),a
                           2597 ;src/main.c:49: player.ly = origins[0][1];
   5407 1A            [ 7] 2598 	ld	a,(de)
   5408 32 10 6D      [13] 2599 	ld	(#(_player + 0x0003)),a
                           2600 ;src/main.c:50: player.sprite = sprite;
   540B 21 00 40      [10] 2601 	ld	hl,#_gladis_quieto_dcha
   540E 22 11 6D      [16] 2602 	ld	((_player + 0x0004)), hl
                           2603 ;src/main.c:51: player.life = 3;
   5411 21 13 6D      [10] 2604 	ld	hl,#_player + 6
   5414 36 03         [10] 2605 	ld	(hl),#0x03
                           2606 ;src/main.c:52: player.dir = 6;
   5416 21 14 6D      [10] 2607 	ld	hl,#_player + 7
   5419 36 06         [10] 2608 	ld	(hl),#0x06
                           2609 ;src/main.c:53: player.atk = 20;
   541B 21 15 6D      [10] 2610 	ld	hl,#_player + 8
   541E 36 14         [10] 2611 	ld	(hl),#0x14
                           2612 ;src/main.c:54: player.latk = 20;
   5420 21 16 6D      [10] 2613 	ld	hl,#_player + 9
   5423 36 14         [10] 2614 	ld	(hl),#0x14
                           2615 ;src/main.c:55: player.bullets = 3;
   5425 21 17 6D      [10] 2616 	ld	hl,#_player + 10
   5428 36 03         [10] 2617 	ld	(hl),#0x03
   542A C9            [10] 2618 	ret
                           2619 ;src/main.c:58: void initEnemies(){
                           2620 ;	---------------------------------
                           2621 ; Function initEnemies
                           2622 ; ---------------------------------
   542B                    2623 _initEnemies::
                           2624 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           2625 ;src/main.c:60: enemy.x = origins[1][0];
   542B 01 15 49      [10] 2626 	ld	bc,#_origins + 2
   542E 0A            [ 7] 2627 	ld	a,(bc)
   542F 32 18 6D      [13] 2628 	ld	(#_enemy),a
                           2629 ;src/main.c:61: enemy.y = origins[1][1];
   5432 11 16 49      [10] 2630 	ld	de,#_origins + 3
   5435 1A            [ 7] 2631 	ld	a,(de)
   5436 32 19 6D      [13] 2632 	ld	(#(_enemy + 0x0001)),a
                           2633 ;src/main.c:62: enemy.lx = origins[1][0];
   5439 0A            [ 7] 2634 	ld	a,(bc)
   543A 32 1A 6D      [13] 2635 	ld	(#(_enemy + 0x0002)),a
                           2636 ;src/main.c:63: enemy.ly = origins[1][1];
   543D 1A            [ 7] 2637 	ld	a,(de)
   543E 32 1B 6D      [13] 2638 	ld	(#(_enemy + 0x0003)),a
                           2639 ;src/main.c:64: enemy.ox = origins[1][0];
   5441 0A            [ 7] 2640 	ld	a,(bc)
   5442 32 1C 6D      [13] 2641 	ld	(#(_enemy + 0x0004)),a
                           2642 ;src/main.c:65: enemy.oy = origins[1][1];
   5445 1A            [ 7] 2643 	ld	a,(de)
   5446 32 1D 6D      [13] 2644 	ld	(#(_enemy + 0x0005)),a
                           2645 ;src/main.c:66: enemy.sprite = sprite;
   5449 21 00 44      [10] 2646 	ld	hl,#_chacho_dcha
   544C 22 1E 6D      [16] 2647 	ld	((_enemy + 0x0006)), hl
                           2648 ;src/main.c:67: enemy.life = 3;
   544F 21 20 6D      [10] 2649 	ld	hl,#_enemy + 8
   5452 36 03         [10] 2650 	ld	(hl),#0x03
                           2651 ;src/main.c:68: enemy.dir = 6;
   5454 21 21 6D      [10] 2652 	ld	hl,#_enemy + 9
   5457 36 06         [10] 2653 	ld	(hl),#0x06
                           2654 ;src/main.c:69: enemy.bullets = 3;
   5459 21 22 6D      [10] 2655 	ld	hl,#_enemy + 10
   545C 36 03         [10] 2656 	ld	(hl),#0x03
                           2657 ;src/main.c:70: enemy.room = 3;
   545E 21 23 6D      [10] 2658 	ld	hl,#_enemy + 11
   5461 36 03         [10] 2659 	ld	(hl),#0x03
   5463 C9            [10] 2660 	ret
                           2661 ;src/main.c:75: void gameOver(){
                           2662 ;	---------------------------------
                           2663 ; Function gameOver
                           2664 ; ---------------------------------
   5464                    2665 _gameOver::
                           2666 ;src/main.c:77: cpct_clearScreen(0);
   5464 21 00 40      [10] 2667 	ld	hl,#0x4000
   5467 E5            [11] 2668 	push	hl
   5468 AF            [ 4] 2669 	xor	a, a
   5469 F5            [11] 2670 	push	af
   546A 33            [ 6] 2671 	inc	sp
   546B 26 C0         [ 7] 2672 	ld	h, #0xC0
   546D E5            [11] 2673 	push	hl
   546E CD 21 6A      [17] 2674 	call	_cpct_memset
                           2675 ;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
   5471 21 0A 0A      [10] 2676 	ld	hl,#0x0A0A
   5474 E5            [11] 2677 	push	hl
   5475 21 00 C0      [10] 2678 	ld	hl,#0xC000
   5478 E5            [11] 2679 	push	hl
   5479 CD 14 6B      [17] 2680 	call	_cpct_getScreenPtr
                           2681 ;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   547C 4D            [ 4] 2682 	ld	c, l
   547D 44            [ 4] 2683 	ld	b, h
   547E 11 90 54      [10] 2684 	ld	de,#___str_0
   5481 21 01 00      [10] 2685 	ld	hl,#0x0001
   5484 E5            [11] 2686 	push	hl
   5485 C5            [11] 2687 	push	bc
   5486 D5            [11] 2688 	push	de
   5487 CD 33 68      [17] 2689 	call	_cpct_drawStringM0
   548A 21 06 00      [10] 2690 	ld	hl,#6
   548D 39            [11] 2691 	add	hl,sp
   548E F9            [ 6] 2692 	ld	sp,hl
   548F C9            [10] 2693 	ret
   5490                    2694 ___str_0:
   5490 4C 6F 75 6E 67 65  2695 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   54A0 00                 2696 	.db 0x00
                           2697 ;src/main.c:84: int menu(){
                           2698 ;	---------------------------------
                           2699 ; Function menu
                           2700 ; ---------------------------------
   54A1                    2701 _menu::
   54A1 DD E5         [15] 2702 	push	ix
   54A3 DD 21 00 00   [14] 2703 	ld	ix,#0
   54A7 DD 39         [15] 2704 	add	ix,sp
   54A9 21 FA FF      [10] 2705 	ld	hl,#-6
   54AC 39            [11] 2706 	add	hl,sp
   54AD F9            [ 6] 2707 	ld	sp,hl
                           2708 ;src/main.c:86: int init = 50;
   54AE DD 36 FC 32   [19] 2709 	ld	-4 (ix),#0x32
   54B2 DD 36 FD 00   [19] 2710 	ld	-3 (ix),#0x00
                           2711 ;src/main.c:87: int pushed =0;
   54B6 21 00 00      [10] 2712 	ld	hl,#0x0000
   54B9 E3            [19] 2713 	ex	(sp), hl
                           2714 ;src/main.c:88: int cont =0;
   54BA 11 00 00      [10] 2715 	ld	de,#0x0000
                           2716 ;src/main.c:89: cpct_clearScreen(0);
   54BD D5            [11] 2717 	push	de
   54BE 21 00 40      [10] 2718 	ld	hl,#0x4000
   54C1 E5            [11] 2719 	push	hl
   54C2 AF            [ 4] 2720 	xor	a, a
   54C3 F5            [11] 2721 	push	af
   54C4 33            [ 6] 2722 	inc	sp
   54C5 26 C0         [ 7] 2723 	ld	h, #0xC0
   54C7 E5            [11] 2724 	push	hl
   54C8 CD 21 6A      [17] 2725 	call	_cpct_memset
   54CB 21 0A 0A      [10] 2726 	ld	hl,#0x0A0A
   54CE E5            [11] 2727 	push	hl
   54CF 21 00 C0      [10] 2728 	ld	hl,#0xC000
   54D2 E5            [11] 2729 	push	hl
   54D3 CD 14 6B      [17] 2730 	call	_cpct_getScreenPtr
   54D6 D1            [10] 2731 	pop	de
                           2732 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   54D7 4D            [ 4] 2733 	ld	c, l
   54D8 44            [ 4] 2734 	ld	b, h
   54D9 D5            [11] 2735 	push	de
   54DA 21 01 00      [10] 2736 	ld	hl,#0x0001
   54DD E5            [11] 2737 	push	hl
   54DE C5            [11] 2738 	push	bc
   54DF 21 84 56      [10] 2739 	ld	hl,#___str_1
   54E2 E5            [11] 2740 	push	hl
   54E3 CD 33 68      [17] 2741 	call	_cpct_drawStringM0
   54E6 21 06 00      [10] 2742 	ld	hl,#6
   54E9 39            [11] 2743 	add	hl,sp
   54EA F9            [ 6] 2744 	ld	sp,hl
   54EB 21 14 32      [10] 2745 	ld	hl,#0x3214
   54EE E5            [11] 2746 	push	hl
   54EF 21 00 C0      [10] 2747 	ld	hl,#0xC000
   54F2 E5            [11] 2748 	push	hl
   54F3 CD 14 6B      [17] 2749 	call	_cpct_getScreenPtr
   54F6 D1            [10] 2750 	pop	de
                           2751 ;src/main.c:96: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   54F7 4D            [ 4] 2752 	ld	c, l
   54F8 44            [ 4] 2753 	ld	b, h
   54F9 D5            [11] 2754 	push	de
   54FA 21 01 00      [10] 2755 	ld	hl,#0x0001
   54FD E5            [11] 2756 	push	hl
   54FE C5            [11] 2757 	push	bc
   54FF 21 95 56      [10] 2758 	ld	hl,#___str_2
   5502 E5            [11] 2759 	push	hl
   5503 CD 33 68      [17] 2760 	call	_cpct_drawStringM0
   5506 21 06 00      [10] 2761 	ld	hl,#6
   5509 39            [11] 2762 	add	hl,sp
   550A F9            [ 6] 2763 	ld	sp,hl
   550B 21 14 46      [10] 2764 	ld	hl,#0x4614
   550E E5            [11] 2765 	push	hl
   550F 21 00 C0      [10] 2766 	ld	hl,#0xC000
   5512 E5            [11] 2767 	push	hl
   5513 CD 14 6B      [17] 2768 	call	_cpct_getScreenPtr
   5516 D1            [10] 2769 	pop	de
                           2770 ;src/main.c:99: cpct_drawStringM0("Creditos",memptr,1,0);
   5517 4D            [ 4] 2771 	ld	c, l
   5518 44            [ 4] 2772 	ld	b, h
   5519 D5            [11] 2773 	push	de
   551A 21 01 00      [10] 2774 	ld	hl,#0x0001
   551D E5            [11] 2775 	push	hl
   551E C5            [11] 2776 	push	bc
   551F 21 A3 56      [10] 2777 	ld	hl,#___str_3
   5522 E5            [11] 2778 	push	hl
   5523 CD 33 68      [17] 2779 	call	_cpct_drawStringM0
   5526 21 06 00      [10] 2780 	ld	hl,#6
   5529 39            [11] 2781 	add	hl,sp
   552A F9            [ 6] 2782 	ld	sp,hl
   552B 21 14 5A      [10] 2783 	ld	hl,#0x5A14
   552E E5            [11] 2784 	push	hl
   552F 21 00 C0      [10] 2785 	ld	hl,#0xC000
   5532 E5            [11] 2786 	push	hl
   5533 CD 14 6B      [17] 2787 	call	_cpct_getScreenPtr
   5536 D1            [10] 2788 	pop	de
                           2789 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5537 DD 75 FE      [19] 2790 	ld	-2 (ix),l
   553A DD 74 FF      [19] 2791 	ld	-1 (ix),h
                           2792 ;src/main.c:102: cpct_drawStringM0("Salir",memptr,1,0);
   553D 01 AC 56      [10] 2793 	ld	bc,#___str_4
   5540 D5            [11] 2794 	push	de
   5541 21 01 00      [10] 2795 	ld	hl,#0x0001
   5544 E5            [11] 2796 	push	hl
   5545 DD 6E FE      [19] 2797 	ld	l,-2 (ix)
   5548 DD 66 FF      [19] 2798 	ld	h,-1 (ix)
   554B E5            [11] 2799 	push	hl
   554C C5            [11] 2800 	push	bc
   554D CD 33 68      [17] 2801 	call	_cpct_drawStringM0
   5550 21 06 00      [10] 2802 	ld	hl,#6
   5553 39            [11] 2803 	add	hl,sp
   5554 F9            [ 6] 2804 	ld	sp,hl
   5555 D1            [10] 2805 	pop	de
                           2806 ;src/main.c:108: while(1){
   5556                    2807 00118$:
                           2808 ;src/main.c:110: cpct_scanKeyboard();
   5556 D5            [11] 2809 	push	de
   5557 CD 34 6B      [17] 2810 	call	_cpct_scanKeyboard
   555A 21 00 04      [10] 2811 	ld	hl,#0x0400
   555D CD 46 67      [17] 2812 	call	_cpct_isKeyPressed
   5560 7D            [ 4] 2813 	ld	a,l
   5561 D1            [10] 2814 	pop	de
   5562 B7            [ 4] 2815 	or	a, a
   5563 28 2D         [12] 2816 	jr	Z,00102$
   5565 3E 96         [ 7] 2817 	ld	a,#0x96
   5567 BB            [ 4] 2818 	cp	a, e
   5568 3E 00         [ 7] 2819 	ld	a,#0x00
   556A 9A            [ 4] 2820 	sbc	a, d
   556B E2 70 55      [10] 2821 	jp	PO, 00162$
   556E EE 80         [ 7] 2822 	xor	a, #0x80
   5570                    2823 00162$:
   5570 F2 92 55      [10] 2824 	jp	P,00102$
                           2825 ;src/main.c:112: cpct_drawSolidBox(memptr, 0, 2, 8);
   5573 21 02 08      [10] 2826 	ld	hl,#0x0802
   5576 E5            [11] 2827 	push	hl
   5577 AF            [ 4] 2828 	xor	a, a
   5578 F5            [11] 2829 	push	af
   5579 33            [ 6] 2830 	inc	sp
   557A DD 6E FE      [19] 2831 	ld	l,-2 (ix)
   557D DD 66 FF      [19] 2832 	ld	h,-1 (ix)
   5580 E5            [11] 2833 	push	hl
   5581 CD 43 6A      [17] 2834 	call	_cpct_drawSolidBox
   5584 F1            [10] 2835 	pop	af
   5585 F1            [10] 2836 	pop	af
   5586 33            [ 6] 2837 	inc	sp
                           2838 ;src/main.c:113: pushed ++;
   5587 DD 34 FA      [23] 2839 	inc	-6 (ix)
   558A 20 03         [12] 2840 	jr	NZ,00163$
   558C DD 34 FB      [23] 2841 	inc	-5 (ix)
   558F                    2842 00163$:
                           2843 ;src/main.c:114: cont =0;
   558F 11 00 00      [10] 2844 	ld	de,#0x0000
   5592                    2845 00102$:
                           2846 ;src/main.c:116: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   5592 D5            [11] 2847 	push	de
   5593 21 00 01      [10] 2848 	ld	hl,#0x0100
   5596 CD 46 67      [17] 2849 	call	_cpct_isKeyPressed
   5599 7D            [ 4] 2850 	ld	a,l
   559A D1            [10] 2851 	pop	de
   559B B7            [ 4] 2852 	or	a, a
   559C 28 29         [12] 2853 	jr	Z,00105$
   559E 3E 96         [ 7] 2854 	ld	a,#0x96
   55A0 BB            [ 4] 2855 	cp	a, e
   55A1 3E 00         [ 7] 2856 	ld	a,#0x00
   55A3 9A            [ 4] 2857 	sbc	a, d
   55A4 E2 A9 55      [10] 2858 	jp	PO, 00164$
   55A7 EE 80         [ 7] 2859 	xor	a, #0x80
   55A9                    2860 00164$:
   55A9 F2 C7 55      [10] 2861 	jp	P,00105$
                           2862 ;src/main.c:117: cpct_drawSolidBox(memptr, 0, 2, 8);
   55AC 21 02 08      [10] 2863 	ld	hl,#0x0802
   55AF E5            [11] 2864 	push	hl
   55B0 AF            [ 4] 2865 	xor	a, a
   55B1 F5            [11] 2866 	push	af
   55B2 33            [ 6] 2867 	inc	sp
   55B3 DD 6E FE      [19] 2868 	ld	l,-2 (ix)
   55B6 DD 66 FF      [19] 2869 	ld	h,-1 (ix)
   55B9 E5            [11] 2870 	push	hl
   55BA CD 43 6A      [17] 2871 	call	_cpct_drawSolidBox
   55BD F1            [10] 2872 	pop	af
   55BE F1            [10] 2873 	pop	af
   55BF 33            [ 6] 2874 	inc	sp
                           2875 ;src/main.c:118: pushed --;
   55C0 E1            [10] 2876 	pop	hl
   55C1 E5            [11] 2877 	push	hl
   55C2 2B            [ 6] 2878 	dec	hl
   55C3 E3            [19] 2879 	ex	(sp), hl
                           2880 ;src/main.c:119: cont = 0;
   55C4 11 00 00      [10] 2881 	ld	de,#0x0000
   55C7                    2882 00105$:
                           2883 ;src/main.c:122: switch (pushed){
   55C7 DD 7E FB      [19] 2884 	ld	a,-5 (ix)
   55CA 07            [ 4] 2885 	rlca
   55CB E6 01         [ 7] 2886 	and	a,#0x01
   55CD 47            [ 4] 2887 	ld	b,a
   55CE 3E 02         [ 7] 2888 	ld	a,#0x02
   55D0 DD BE FA      [19] 2889 	cp	a, -6 (ix)
   55D3 3E 00         [ 7] 2890 	ld	a,#0x00
   55D5 DD 9E FB      [19] 2891 	sbc	a, -5 (ix)
   55D8 E2 DD 55      [10] 2892 	jp	PO, 00165$
   55DB EE 80         [ 7] 2893 	xor	a, #0x80
   55DD                    2894 00165$:
   55DD 07            [ 4] 2895 	rlca
   55DE E6 01         [ 7] 2896 	and	a,#0x01
   55E0 4F            [ 4] 2897 	ld	c,a
   55E1 78            [ 4] 2898 	ld	a,b
   55E2 B7            [ 4] 2899 	or	a,a
   55E3 20 32         [12] 2900 	jr	NZ,00110$
   55E5 B1            [ 4] 2901 	or	a,c
   55E6 20 2F         [12] 2902 	jr	NZ,00110$
   55E8 D5            [11] 2903 	push	de
   55E9 DD 5E FA      [19] 2904 	ld	e,-6 (ix)
   55EC 16 00         [ 7] 2905 	ld	d,#0x00
   55EE 21 F5 55      [10] 2906 	ld	hl,#00166$
   55F1 19            [11] 2907 	add	hl,de
   55F2 19            [11] 2908 	add	hl,de
                           2909 ;src/main.c:123: case 0: init = 50;break;
   55F3 D1            [10] 2910 	pop	de
   55F4 E9            [ 4] 2911 	jp	(hl)
   55F5                    2912 00166$:
   55F5 18 04         [12] 2913 	jr	00107$
   55F7 18 0C         [12] 2914 	jr	00108$
   55F9 18 14         [12] 2915 	jr	00109$
   55FB                    2916 00107$:
   55FB DD 36 FC 32   [19] 2917 	ld	-4 (ix),#0x32
   55FF DD 36 FD 00   [19] 2918 	ld	-3 (ix),#0x00
   5603 18 12         [12] 2919 	jr	00110$
                           2920 ;src/main.c:124: case 1: init = 70;break;
   5605                    2921 00108$:
   5605 DD 36 FC 46   [19] 2922 	ld	-4 (ix),#0x46
   5609 DD 36 FD 00   [19] 2923 	ld	-3 (ix),#0x00
   560D 18 08         [12] 2924 	jr	00110$
                           2925 ;src/main.c:125: case 2: init = 90;break;
   560F                    2926 00109$:
   560F DD 36 FC 5A   [19] 2927 	ld	-4 (ix),#0x5A
   5613 DD 36 FD 00   [19] 2928 	ld	-3 (ix),#0x00
                           2929 ;src/main.c:126: }
   5617                    2930 00110$:
                           2931 ;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,15,init);
   5617 DD 66 FC      [19] 2932 	ld	h,-4 (ix)
   561A C5            [11] 2933 	push	bc
   561B D5            [11] 2934 	push	de
   561C E5            [11] 2935 	push	hl
   561D 33            [ 6] 2936 	inc	sp
   561E 3E 0F         [ 7] 2937 	ld	a,#0x0F
   5620 F5            [11] 2938 	push	af
   5621 33            [ 6] 2939 	inc	sp
   5622 21 00 C0      [10] 2940 	ld	hl,#0xC000
   5625 E5            [11] 2941 	push	hl
   5626 CD 14 6B      [17] 2942 	call	_cpct_getScreenPtr
   5629 D1            [10] 2943 	pop	de
   562A C1            [10] 2944 	pop	bc
                           2945 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   562B DD 75 FE      [19] 2946 	ld	-2 (ix),l
   562E DD 74 FF      [19] 2947 	ld	-1 (ix),h
                           2948 ;src/main.c:128: cpct_drawSolidBox(memptr, 3, 2, 8);
   5631 C5            [11] 2949 	push	bc
   5632 D5            [11] 2950 	push	de
   5633 21 02 08      [10] 2951 	ld	hl,#0x0802
   5636 E5            [11] 2952 	push	hl
   5637 3E 03         [ 7] 2953 	ld	a,#0x03
   5639 F5            [11] 2954 	push	af
   563A 33            [ 6] 2955 	inc	sp
   563B DD 6E FE      [19] 2956 	ld	l,-2 (ix)
   563E DD 66 FF      [19] 2957 	ld	h,-1 (ix)
   5641 E5            [11] 2958 	push	hl
   5642 CD 43 6A      [17] 2959 	call	_cpct_drawSolidBox
   5645 F1            [10] 2960 	pop	af
   5646 F1            [10] 2961 	pop	af
   5647 33            [ 6] 2962 	inc	sp
   5648 21 00 40      [10] 2963 	ld	hl,#0x4000
   564B CD 46 67      [17] 2964 	call	_cpct_isKeyPressed
   564E 7D            [ 4] 2965 	ld	a,l
   564F D1            [10] 2966 	pop	de
   5650 C1            [10] 2967 	pop	bc
   5651 B7            [ 4] 2968 	or	a, a
   5652 28 27         [12] 2969 	jr	Z,00116$
                           2970 ;src/main.c:130: switch (pushed){
   5654 78            [ 4] 2971 	ld	a,b
   5655 B7            [ 4] 2972 	or	a,a
   5656 20 23         [12] 2973 	jr	NZ,00116$
   5658 B1            [ 4] 2974 	or	a,c
   5659 20 20         [12] 2975 	jr	NZ,00116$
   565B DD 5E FA      [19] 2976 	ld	e,-6 (ix)
   565E 16 00         [ 7] 2977 	ld	d,#0x00
   5660 21 66 56      [10] 2978 	ld	hl,#00167$
   5663 19            [11] 2979 	add	hl,de
   5664 19            [11] 2980 	add	hl,de
                           2981 ;src/main.c:131: case 0: return 1;break;
   5665 E9            [ 4] 2982 	jp	(hl)
   5666                    2983 00167$:
   5666 18 04         [12] 2984 	jr	00111$
   5668 18 07         [12] 2985 	jr	00112$
   566A 18 0A         [12] 2986 	jr	00113$
   566C                    2987 00111$:
   566C 21 01 00      [10] 2988 	ld	hl,#0x0001
   566F 18 0E         [12] 2989 	jr	00120$
                           2990 ;src/main.c:132: case 1: return 2;break;
   5671                    2991 00112$:
   5671 21 02 00      [10] 2992 	ld	hl,#0x0002
   5674 18 09         [12] 2993 	jr	00120$
                           2994 ;src/main.c:133: case 2: return 0;break;
   5676                    2995 00113$:
   5676 21 00 00      [10] 2996 	ld	hl,#0x0000
   5679 18 04         [12] 2997 	jr	00120$
                           2998 ;src/main.c:134: }
   567B                    2999 00116$:
                           3000 ;src/main.c:136: cont++;
   567B 13            [ 6] 3001 	inc	de
   567C C3 56 55      [10] 3002 	jp	00118$
   567F                    3003 00120$:
   567F DD F9         [10] 3004 	ld	sp, ix
   5681 DD E1         [14] 3005 	pop	ix
   5683 C9            [10] 3006 	ret
   5684                    3007 ___str_1:
   5684 4C 6F 75 6E 67 65  3008 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5694 00                 3009 	.db 0x00
   5695                    3010 ___str_2:
   5695 4E 75 65 76 61 20  3011 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   56A2 00                 3012 	.db 0x00
   56A3                    3013 ___str_3:
   56A3 43 72 65 64 69 74  3014 	.ascii "Creditos"
        6F 73
   56AB 00                 3015 	.db 0x00
   56AC                    3016 ___str_4:
   56AC 53 61 6C 69 72     3017 	.ascii "Salir"
   56B1 00                 3018 	.db 0x00
                           3019 ;src/main.c:155: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3020 ;	---------------------------------
                           3021 ; Function checkBoundsCollisionsEnemy
                           3022 ; ---------------------------------
   56B2                    3023 _checkBoundsCollisionsEnemy::
   56B2 DD E5         [15] 3024 	push	ix
   56B4 DD 21 00 00   [14] 3025 	ld	ix,#0
   56B8 DD 39         [15] 3026 	add	ix,sp
   56BA 21 EC FF      [10] 3027 	ld	hl,#-20
   56BD 39            [11] 3028 	add	hl,sp
   56BE F9            [ 6] 3029 	ld	sp,hl
                           3030 ;src/main.c:157: u8 *posX = x;
   56BF DD 7E 04      [19] 3031 	ld	a,4 (ix)
   56C2 DD 77 EE      [19] 3032 	ld	-18 (ix),a
   56C5 DD 7E 05      [19] 3033 	ld	a,5 (ix)
   56C8 DD 77 EF      [19] 3034 	ld	-17 (ix),a
                           3035 ;src/main.c:158: u8 *posY = y;
   56CB DD 7E 06      [19] 3036 	ld	a,6 (ix)
   56CE DD 77 EC      [19] 3037 	ld	-20 (ix),a
   56D1 DD 7E 07      [19] 3038 	ld	a,7 (ix)
   56D4 DD 77 ED      [19] 3039 	ld	-19 (ix),a
                           3040 ;src/main.c:159: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   56D7 E1            [10] 3041 	pop	hl
   56D8 E5            [11] 3042 	push	hl
   56D9 7E            [ 7] 3043 	ld	a,(hl)
   56DA DD 77 FB      [19] 3044 	ld	-5 (ix), a
   56DD 07            [ 4] 3045 	rlca
   56DE 07            [ 4] 3046 	rlca
   56DF 07            [ 4] 3047 	rlca
   56E0 07            [ 4] 3048 	rlca
   56E1 E6 0F         [ 7] 3049 	and	a,#0x0F
   56E3 4F            [ 4] 3050 	ld	c,a
   56E4 06 00         [ 7] 3051 	ld	b,#0x00
   56E6 69            [ 4] 3052 	ld	l, c
   56E7 60            [ 4] 3053 	ld	h, b
   56E8 29            [11] 3054 	add	hl, hl
   56E9 29            [11] 3055 	add	hl, hl
   56EA 09            [11] 3056 	add	hl, bc
   56EB 29            [11] 3057 	add	hl, hl
   56EC 29            [11] 3058 	add	hl, hl
   56ED 3E 0A         [ 7] 3059 	ld	a,#<(_scene)
   56EF 85            [ 4] 3060 	add	a, l
   56F0 DD 77 F9      [19] 3061 	ld	-7 (ix),a
   56F3 3E 6C         [ 7] 3062 	ld	a,#>(_scene)
   56F5 8C            [ 4] 3063 	adc	a, h
   56F6 DD 77 FA      [19] 3064 	ld	-6 (ix),a
   56F9 DD 6E EE      [19] 3065 	ld	l,-18 (ix)
   56FC DD 66 EF      [19] 3066 	ld	h,-17 (ix)
   56FF 7E            [ 7] 3067 	ld	a,(hl)
   5700 DD 77 FE      [19] 3068 	ld	-2 (ix), a
   5703 0F            [ 4] 3069 	rrca
   5704 0F            [ 4] 3070 	rrca
   5705 E6 3F         [ 7] 3071 	and	a,#0x3F
   5707 DD 77 FF      [19] 3072 	ld	-1 (ix), a
   570A DD 86 F9      [19] 3073 	add	a, -7 (ix)
   570D 6F            [ 4] 3074 	ld	l,a
   570E 3E 00         [ 7] 3075 	ld	a,#0x00
   5710 DD 8E FA      [19] 3076 	adc	a, -6 (ix)
   5713 67            [ 4] 3077 	ld	h,a
   5714 7E            [ 7] 3078 	ld	a,(hl)
   5715 DD 77 F8      [19] 3079 	ld	-8 (ix), a
   5718 3D            [ 4] 3080 	dec	a
   5719 CA 27 58      [10] 3081 	jp	Z,00106$
                           3082 ;src/main.c:160: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   571C DD 6E FE      [19] 3083 	ld	l,-2 (ix)
   571F 26 00         [ 7] 3084 	ld	h,#0x00
   5721 DD 5E 0A      [19] 3085 	ld	e,10 (ix)
   5724 16 00         [ 7] 3086 	ld	d,#0x00
   5726 19            [11] 3087 	add	hl,de
   5727 7D            [ 4] 3088 	ld	a,l
   5728 C6 FF         [ 7] 3089 	add	a,#0xFF
   572A DD 77 F0      [19] 3090 	ld	-16 (ix),a
   572D 7C            [ 4] 3091 	ld	a,h
   572E CE FF         [ 7] 3092 	adc	a,#0xFF
   5730 DD 77 F1      [19] 3093 	ld	-15 (ix),a
   5733 DD 7E F0      [19] 3094 	ld	a,-16 (ix)
   5736 DD 77 F6      [19] 3095 	ld	-10 (ix),a
   5739 DD 7E F1      [19] 3096 	ld	a,-15 (ix)
   573C DD 77 F7      [19] 3097 	ld	-9 (ix),a
   573F DD 7E F1      [19] 3098 	ld	a,-15 (ix)
   5742 07            [ 4] 3099 	rlca
   5743 E6 01         [ 7] 3100 	and	a,#0x01
   5745 DD 77 FE      [19] 3101 	ld	-2 (ix),a
   5748 23            [ 6] 3102 	inc	hl
   5749 23            [ 6] 3103 	inc	hl
   574A DD 75 F2      [19] 3104 	ld	-14 (ix),l
   574D DD 74 F3      [19] 3105 	ld	-13 (ix),h
   5750 DD 7E FE      [19] 3106 	ld	a,-2 (ix)
   5753 B7            [ 4] 3107 	or	a, a
   5754 28 0C         [12] 3108 	jr	Z,00114$
   5756 DD 7E F2      [19] 3109 	ld	a,-14 (ix)
   5759 DD 77 F6      [19] 3110 	ld	-10 (ix),a
   575C DD 7E F3      [19] 3111 	ld	a,-13 (ix)
   575F DD 77 F7      [19] 3112 	ld	-9 (ix),a
   5762                    3113 00114$:
   5762 DD 6E F6      [19] 3114 	ld	l,-10 (ix)
   5765 DD 66 F7      [19] 3115 	ld	h,-9 (ix)
   5768 CB 2C         [ 8] 3116 	sra	h
   576A CB 1D         [ 8] 3117 	rr	l
   576C CB 2C         [ 8] 3118 	sra	h
   576E CB 1D         [ 8] 3119 	rr	l
   5770 DD 5E F9      [19] 3120 	ld	e,-7 (ix)
   5773 DD 56 FA      [19] 3121 	ld	d,-6 (ix)
   5776 19            [11] 3122 	add	hl,de
   5777 7E            [ 7] 3123 	ld	a,(hl)
   5778 3D            [ 4] 3124 	dec	a
   5779 CA 27 58      [10] 3125 	jp	Z,00106$
                           3126 ;src/main.c:161: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   577C DD 6E FB      [19] 3127 	ld	l,-5 (ix)
   577F 26 00         [ 7] 3128 	ld	h,#0x00
   5781 DD 5E 0B      [19] 3129 	ld	e,11 (ix)
   5784 16 00         [ 7] 3130 	ld	d,#0x00
   5786 19            [11] 3131 	add	hl,de
   5787 4D            [ 4] 3132 	ld	c,l
   5788 44            [ 4] 3133 	ld	b,h
   5789 0B            [ 6] 3134 	dec	bc
   578A 0B            [ 6] 3135 	dec	bc
   578B 59            [ 4] 3136 	ld	e, c
   578C 78            [ 4] 3137 	ld	a,b
   578D 57            [ 4] 3138 	ld	d,a
   578E 07            [ 4] 3139 	rlca
   578F E6 01         [ 7] 3140 	and	a,#0x01
   5791 DD 77 F6      [19] 3141 	ld	-10 (ix),a
   5794 7D            [ 4] 3142 	ld	a,l
   5795 C6 0D         [ 7] 3143 	add	a, #0x0D
   5797 DD 77 FC      [19] 3144 	ld	-4 (ix),a
   579A 7C            [ 4] 3145 	ld	a,h
   579B CE 00         [ 7] 3146 	adc	a, #0x00
   579D DD 77 FD      [19] 3147 	ld	-3 (ix),a
   57A0 DD 7E F6      [19] 3148 	ld	a,-10 (ix)
   57A3 B7            [ 4] 3149 	or	a, a
   57A4 28 06         [12] 3150 	jr	Z,00115$
   57A6 DD 5E FC      [19] 3151 	ld	e,-4 (ix)
   57A9 DD 56 FD      [19] 3152 	ld	d,-3 (ix)
   57AC                    3153 00115$:
   57AC CB 2A         [ 8] 3154 	sra	d
   57AE CB 1B         [ 8] 3155 	rr	e
   57B0 CB 2A         [ 8] 3156 	sra	d
   57B2 CB 1B         [ 8] 3157 	rr	e
   57B4 CB 2A         [ 8] 3158 	sra	d
   57B6 CB 1B         [ 8] 3159 	rr	e
   57B8 CB 2A         [ 8] 3160 	sra	d
   57BA CB 1B         [ 8] 3161 	rr	e
   57BC 6B            [ 4] 3162 	ld	l, e
   57BD 62            [ 4] 3163 	ld	h, d
   57BE 29            [11] 3164 	add	hl, hl
   57BF 29            [11] 3165 	add	hl, hl
   57C0 19            [11] 3166 	add	hl, de
   57C1 29            [11] 3167 	add	hl, hl
   57C2 29            [11] 3168 	add	hl, hl
   57C3 11 0A 6C      [10] 3169 	ld	de,#_scene
   57C6 19            [11] 3170 	add	hl,de
   57C7 DD 5E FF      [19] 3171 	ld	e,-1 (ix)
   57CA 16 00         [ 7] 3172 	ld	d,#0x00
   57CC 19            [11] 3173 	add	hl,de
   57CD 7E            [ 7] 3174 	ld	a,(hl)
   57CE 3D            [ 4] 3175 	dec	a
   57CF 28 56         [12] 3176 	jr	Z,00106$
                           3177 ;src/main.c:162: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   57D1 69            [ 4] 3178 	ld	l, c
   57D2 60            [ 4] 3179 	ld	h, b
   57D3 DD 7E F6      [19] 3180 	ld	a,-10 (ix)
   57D6 B7            [ 4] 3181 	or	a, a
   57D7 28 06         [12] 3182 	jr	Z,00116$
   57D9 DD 6E FC      [19] 3183 	ld	l,-4 (ix)
   57DC DD 66 FD      [19] 3184 	ld	h,-3 (ix)
   57DF                    3185 00116$:
   57DF CB 2C         [ 8] 3186 	sra	h
   57E1 CB 1D         [ 8] 3187 	rr	l
   57E3 CB 2C         [ 8] 3188 	sra	h
   57E5 CB 1D         [ 8] 3189 	rr	l
   57E7 CB 2C         [ 8] 3190 	sra	h
   57E9 CB 1D         [ 8] 3191 	rr	l
   57EB CB 2C         [ 8] 3192 	sra	h
   57ED CB 1D         [ 8] 3193 	rr	l
   57EF 5D            [ 4] 3194 	ld	e, l
   57F0 54            [ 4] 3195 	ld	d, h
   57F1 29            [11] 3196 	add	hl, hl
   57F2 29            [11] 3197 	add	hl, hl
   57F3 19            [11] 3198 	add	hl, de
   57F4 29            [11] 3199 	add	hl, hl
   57F5 29            [11] 3200 	add	hl, hl
   57F6 3E 0A         [ 7] 3201 	ld	a,#<(_scene)
   57F8 85            [ 4] 3202 	add	a, l
   57F9 DD 77 F4      [19] 3203 	ld	-12 (ix),a
   57FC 3E 6C         [ 7] 3204 	ld	a,#>(_scene)
   57FE 8C            [ 4] 3205 	adc	a, h
   57FF DD 77 F5      [19] 3206 	ld	-11 (ix),a
   5802 DD 6E F0      [19] 3207 	ld	l,-16 (ix)
   5805 DD 66 F1      [19] 3208 	ld	h,-15 (ix)
   5808 DD 7E FE      [19] 3209 	ld	a,-2 (ix)
   580B B7            [ 4] 3210 	or	a, a
   580C 28 06         [12] 3211 	jr	Z,00117$
   580E DD 6E F2      [19] 3212 	ld	l,-14 (ix)
   5811 DD 66 F3      [19] 3213 	ld	h,-13 (ix)
   5814                    3214 00117$:
   5814 CB 2C         [ 8] 3215 	sra	h
   5816 CB 1D         [ 8] 3216 	rr	l
   5818 CB 2C         [ 8] 3217 	sra	h
   581A CB 1D         [ 8] 3218 	rr	l
   581C DD 5E F4      [19] 3219 	ld	e,-12 (ix)
   581F DD 56 F5      [19] 3220 	ld	d,-11 (ix)
   5822 19            [11] 3221 	add	hl,de
   5823 7E            [ 7] 3222 	ld	a,(hl)
   5824 3D            [ 4] 3223 	dec	a
   5825 20 13         [12] 3224 	jr	NZ,00107$
   5827                    3225 00106$:
                           3226 ;src/main.c:164: *posX=lx;
   5827 DD 6E EE      [19] 3227 	ld	l,-18 (ix)
   582A DD 66 EF      [19] 3228 	ld	h,-17 (ix)
   582D DD 7E 08      [19] 3229 	ld	a,8 (ix)
   5830 77            [ 7] 3230 	ld	(hl),a
                           3231 ;src/main.c:165: *posY=ly;
   5831 E1            [10] 3232 	pop	hl
   5832 E5            [11] 3233 	push	hl
   5833 DD 7E 09      [19] 3234 	ld	a,9 (ix)
   5836 77            [ 7] 3235 	ld	(hl),a
   5837 C3 02 59      [10] 3236 	jp	00112$
   583A                    3237 00107$:
                           3238 ;src/main.c:167: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   583A DD 7E F8      [19] 3239 	ld	a,-8 (ix)
   583D D6 03         [ 7] 3240 	sub	a, #0x03
   583F C2 F2 58      [10] 3241 	jp	NZ,00101$
                           3242 ;src/main.c:168: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5842 DD 6E F0      [19] 3243 	ld	l,-16 (ix)
   5845 DD 66 F1      [19] 3244 	ld	h,-15 (ix)
   5848 DD 7E FE      [19] 3245 	ld	a,-2 (ix)
   584B B7            [ 4] 3246 	or	a, a
   584C 28 06         [12] 3247 	jr	Z,00118$
   584E DD 6E F2      [19] 3248 	ld	l,-14 (ix)
   5851 DD 66 F3      [19] 3249 	ld	h,-13 (ix)
   5854                    3250 00118$:
   5854 CB 2C         [ 8] 3251 	sra	h
   5856 CB 1D         [ 8] 3252 	rr	l
   5858 CB 2C         [ 8] 3253 	sra	h
   585A CB 1D         [ 8] 3254 	rr	l
   585C DD 5E F9      [19] 3255 	ld	e,-7 (ix)
   585F DD 56 FA      [19] 3256 	ld	d,-6 (ix)
   5862 19            [11] 3257 	add	hl,de
   5863 7E            [ 7] 3258 	ld	a,(hl)
   5864 D6 03         [ 7] 3259 	sub	a, #0x03
   5866 C2 F2 58      [10] 3260 	jp	NZ,00101$
                           3261 ;src/main.c:169: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   5869 69            [ 4] 3262 	ld	l, c
   586A 60            [ 4] 3263 	ld	h, b
   586B DD 7E F6      [19] 3264 	ld	a,-10 (ix)
   586E B7            [ 4] 3265 	or	a, a
   586F 28 06         [12] 3266 	jr	Z,00119$
   5871 DD 6E FC      [19] 3267 	ld	l,-4 (ix)
   5874 DD 66 FD      [19] 3268 	ld	h,-3 (ix)
   5877                    3269 00119$:
   5877 CB 2C         [ 8] 3270 	sra	h
   5879 CB 1D         [ 8] 3271 	rr	l
   587B CB 2C         [ 8] 3272 	sra	h
   587D CB 1D         [ 8] 3273 	rr	l
   587F CB 2C         [ 8] 3274 	sra	h
   5881 CB 1D         [ 8] 3275 	rr	l
   5883 CB 2C         [ 8] 3276 	sra	h
   5885 CB 1D         [ 8] 3277 	rr	l
   5887 5D            [ 4] 3278 	ld	e, l
   5888 54            [ 4] 3279 	ld	d, h
   5889 29            [11] 3280 	add	hl, hl
   588A 29            [11] 3281 	add	hl, hl
   588B 19            [11] 3282 	add	hl, de
   588C 29            [11] 3283 	add	hl, hl
   588D 29            [11] 3284 	add	hl, hl
   588E 11 0A 6C      [10] 3285 	ld	de,#_scene
   5891 19            [11] 3286 	add	hl,de
   5892 DD 5E FF      [19] 3287 	ld	e,-1 (ix)
   5895 16 00         [ 7] 3288 	ld	d,#0x00
   5897 19            [11] 3289 	add	hl,de
   5898 7E            [ 7] 3290 	ld	a,(hl)
   5899 D6 03         [ 7] 3291 	sub	a, #0x03
   589B 20 55         [12] 3292 	jr	NZ,00101$
                           3293 ;src/main.c:170: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   589D DD 7E F6      [19] 3294 	ld	a,-10 (ix)
   58A0 B7            [ 4] 3295 	or	a, a
   58A1 28 06         [12] 3296 	jr	Z,00120$
   58A3 DD 4E FC      [19] 3297 	ld	c,-4 (ix)
   58A6 DD 46 FD      [19] 3298 	ld	b,-3 (ix)
   58A9                    3299 00120$:
   58A9 CB 28         [ 8] 3300 	sra	b
   58AB CB 19         [ 8] 3301 	rr	c
   58AD CB 28         [ 8] 3302 	sra	b
   58AF CB 19         [ 8] 3303 	rr	c
   58B1 CB 28         [ 8] 3304 	sra	b
   58B3 CB 19         [ 8] 3305 	rr	c
   58B5 CB 28         [ 8] 3306 	sra	b
   58B7 CB 19         [ 8] 3307 	rr	c
   58B9 69            [ 4] 3308 	ld	l, c
   58BA 60            [ 4] 3309 	ld	h, b
   58BB 29            [11] 3310 	add	hl, hl
   58BC 29            [11] 3311 	add	hl, hl
   58BD 09            [11] 3312 	add	hl, bc
   58BE 29            [11] 3313 	add	hl, hl
   58BF 29            [11] 3314 	add	hl, hl
   58C0 3E 0A         [ 7] 3315 	ld	a,#<(_scene)
   58C2 85            [ 4] 3316 	add	a, l
   58C3 DD 77 F4      [19] 3317 	ld	-12 (ix),a
   58C6 3E 6C         [ 7] 3318 	ld	a,#>(_scene)
   58C8 8C            [ 4] 3319 	adc	a, h
   58C9 DD 77 F5      [19] 3320 	ld	-11 (ix),a
   58CC DD 6E F0      [19] 3321 	ld	l,-16 (ix)
   58CF DD 66 F1      [19] 3322 	ld	h,-15 (ix)
   58D2 DD 7E FE      [19] 3323 	ld	a,-2 (ix)
   58D5 B7            [ 4] 3324 	or	a, a
   58D6 28 06         [12] 3325 	jr	Z,00121$
   58D8 DD 6E F2      [19] 3326 	ld	l,-14 (ix)
   58DB DD 66 F3      [19] 3327 	ld	h,-13 (ix)
   58DE                    3328 00121$:
   58DE CB 2C         [ 8] 3329 	sra	h
   58E0 CB 1D         [ 8] 3330 	rr	l
   58E2 CB 2C         [ 8] 3331 	sra	h
   58E4 CB 1D         [ 8] 3332 	rr	l
   58E6 DD 5E F4      [19] 3333 	ld	e,-12 (ix)
   58E9 DD 56 F5      [19] 3334 	ld	d,-11 (ix)
   58EC 19            [11] 3335 	add	hl,de
   58ED 7E            [ 7] 3336 	ld	a,(hl)
   58EE D6 03         [ 7] 3337 	sub	a, #0x03
   58F0 28 10         [12] 3338 	jr	Z,00112$
   58F2                    3339 00101$:
                           3340 ;src/main.c:172: *posX=lx;
   58F2 DD 6E EE      [19] 3341 	ld	l,-18 (ix)
   58F5 DD 66 EF      [19] 3342 	ld	h,-17 (ix)
   58F8 DD 7E 08      [19] 3343 	ld	a,8 (ix)
   58FB 77            [ 7] 3344 	ld	(hl),a
                           3345 ;src/main.c:173: *posY=ly;
   58FC E1            [10] 3346 	pop	hl
   58FD E5            [11] 3347 	push	hl
   58FE DD 7E 09      [19] 3348 	ld	a,9 (ix)
   5901 77            [ 7] 3349 	ld	(hl),a
   5902                    3350 00112$:
   5902 DD F9         [10] 3351 	ld	sp, ix
   5904 DD E1         [14] 3352 	pop	ix
   5906 C9            [10] 3353 	ret
                           3354 ;src/main.c:179: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3355 ;	---------------------------------
                           3356 ; Function checkBoundsCollisions
                           3357 ; ---------------------------------
   5907                    3358 _checkBoundsCollisions::
   5907 DD E5         [15] 3359 	push	ix
   5909 DD 21 00 00   [14] 3360 	ld	ix,#0
   590D DD 39         [15] 3361 	add	ix,sp
   590F 21 F2 FF      [10] 3362 	ld	hl,#-14
   5912 39            [11] 3363 	add	hl,sp
   5913 F9            [ 6] 3364 	ld	sp,hl
                           3365 ;src/main.c:180: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5914 3A 0E 6D      [13] 3366 	ld	a,(#(_player + 0x0001) + 0)
   5917 DD 77 F8      [19] 3367 	ld	-8 (ix), a
   591A 07            [ 4] 3368 	rlca
   591B 07            [ 4] 3369 	rlca
   591C 07            [ 4] 3370 	rlca
   591D 07            [ 4] 3371 	rlca
   591E E6 0F         [ 7] 3372 	and	a,#0x0F
   5920 4F            [ 4] 3373 	ld	c,a
   5921 06 00         [ 7] 3374 	ld	b,#0x00
   5923 69            [ 4] 3375 	ld	l, c
   5924 60            [ 4] 3376 	ld	h, b
   5925 29            [11] 3377 	add	hl, hl
   5926 29            [11] 3378 	add	hl, hl
   5927 09            [11] 3379 	add	hl, bc
   5928 29            [11] 3380 	add	hl, hl
   5929 29            [11] 3381 	add	hl, hl
   592A 3E 0A         [ 7] 3382 	ld	a,#<(_scene)
   592C 85            [ 4] 3383 	add	a, l
   592D DD 77 F4      [19] 3384 	ld	-12 (ix),a
   5930 3E 6C         [ 7] 3385 	ld	a,#>(_scene)
   5932 8C            [ 4] 3386 	adc	a, h
   5933 DD 77 F5      [19] 3387 	ld	-11 (ix),a
   5936 21 0D 6D      [10] 3388 	ld	hl, #_player + 0
   5939 4E            [ 7] 3389 	ld	c,(hl)
   593A 79            [ 4] 3390 	ld	a,c
   593B 0F            [ 4] 3391 	rrca
   593C 0F            [ 4] 3392 	rrca
   593D E6 3F         [ 7] 3393 	and	a,#0x3F
   593F DD 77 F7      [19] 3394 	ld	-9 (ix), a
   5942 DD 86 F4      [19] 3395 	add	a, -12 (ix)
   5945 6F            [ 4] 3396 	ld	l,a
   5946 3E 00         [ 7] 3397 	ld	a,#0x00
   5948 DD 8E F5      [19] 3398 	adc	a, -11 (ix)
   594B 67            [ 4] 3399 	ld	h,a
   594C 7E            [ 7] 3400 	ld	a,(hl)
   594D DD 77 F6      [19] 3401 	ld	-10 (ix), a
   5950 3D            [ 4] 3402 	dec	a
   5951 CA 67 5A      [10] 3403 	jp	Z,00124$
                           3404 ;src/main.c:181: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5954 06 00         [ 7] 3405 	ld	b,#0x00
   5956 21 03 00      [10] 3406 	ld	hl,#0x0003
   5959 09            [11] 3407 	add	hl,bc
   595A DD 75 FB      [19] 3408 	ld	-5 (ix),l
   595D DD 74 FC      [19] 3409 	ld	-4 (ix),h
   5960 DD 7E FB      [19] 3410 	ld	a,-5 (ix)
   5963 DD 77 FE      [19] 3411 	ld	-2 (ix),a
   5966 DD 7E FC      [19] 3412 	ld	a,-4 (ix)
   5969 DD 77 FF      [19] 3413 	ld	-1 (ix),a
   596C DD 7E FC      [19] 3414 	ld	a,-4 (ix)
   596F 07            [ 4] 3415 	rlca
   5970 E6 01         [ 7] 3416 	and	a,#0x01
   5972 DD 77 FD      [19] 3417 	ld	-3 (ix),a
   5975 21 06 00      [10] 3418 	ld	hl,#0x0006
   5978 09            [11] 3419 	add	hl,bc
   5979 E3            [19] 3420 	ex	(sp), hl
   597A DD 7E FD      [19] 3421 	ld	a,-3 (ix)
   597D B7            [ 4] 3422 	or	a, a
   597E 28 0C         [12] 3423 	jr	Z,00132$
   5980 DD 7E F2      [19] 3424 	ld	a,-14 (ix)
   5983 DD 77 FE      [19] 3425 	ld	-2 (ix),a
   5986 DD 7E F3      [19] 3426 	ld	a,-13 (ix)
   5989 DD 77 FF      [19] 3427 	ld	-1 (ix),a
   598C                    3428 00132$:
   598C DD 6E FE      [19] 3429 	ld	l,-2 (ix)
   598F DD 66 FF      [19] 3430 	ld	h,-1 (ix)
   5992 CB 2C         [ 8] 3431 	sra	h
   5994 CB 1D         [ 8] 3432 	rr	l
   5996 CB 2C         [ 8] 3433 	sra	h
   5998 CB 1D         [ 8] 3434 	rr	l
   599A DD 5E F4      [19] 3435 	ld	e,-12 (ix)
   599D DD 56 F5      [19] 3436 	ld	d,-11 (ix)
   59A0 19            [11] 3437 	add	hl,de
   59A1 7E            [ 7] 3438 	ld	a,(hl)
   59A2 3D            [ 4] 3439 	dec	a
   59A3 CA 67 5A      [10] 3440 	jp	Z,00124$
                           3441 ;src/main.c:182: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   59A6 DD 5E F8      [19] 3442 	ld	e,-8 (ix)
   59A9 16 00         [ 7] 3443 	ld	d,#0x00
   59AB 21 0E 00      [10] 3444 	ld	hl,#0x000E
   59AE 19            [11] 3445 	add	hl,de
   59AF 4D            [ 4] 3446 	ld	c,l
   59B0 44            [ 4] 3447 	ld	b,h
   59B1 DD 71 FE      [19] 3448 	ld	-2 (ix),c
   59B4 DD 70 FF      [19] 3449 	ld	-1 (ix),b
   59B7 78            [ 4] 3450 	ld	a,b
   59B8 07            [ 4] 3451 	rlca
   59B9 E6 01         [ 7] 3452 	and	a,#0x01
   59BB DD 77 F8      [19] 3453 	ld	-8 (ix),a
   59BE 21 1D 00      [10] 3454 	ld	hl,#0x001D
   59C1 19            [11] 3455 	add	hl,de
   59C2 DD 75 F9      [19] 3456 	ld	-7 (ix),l
   59C5 DD 74 FA      [19] 3457 	ld	-6 (ix),h
   59C8 DD 7E F8      [19] 3458 	ld	a,-8 (ix)
   59CB B7            [ 4] 3459 	or	a, a
   59CC 28 0C         [12] 3460 	jr	Z,00133$
   59CE DD 7E F9      [19] 3461 	ld	a,-7 (ix)
   59D1 DD 77 FE      [19] 3462 	ld	-2 (ix),a
   59D4 DD 7E FA      [19] 3463 	ld	a,-6 (ix)
   59D7 DD 77 FF      [19] 3464 	ld	-1 (ix),a
   59DA                    3465 00133$:
   59DA DD 6E FE      [19] 3466 	ld	l,-2 (ix)
   59DD DD 66 FF      [19] 3467 	ld	h,-1 (ix)
   59E0 CB 2C         [ 8] 3468 	sra	h
   59E2 CB 1D         [ 8] 3469 	rr	l
   59E4 CB 2C         [ 8] 3470 	sra	h
   59E6 CB 1D         [ 8] 3471 	rr	l
   59E8 CB 2C         [ 8] 3472 	sra	h
   59EA CB 1D         [ 8] 3473 	rr	l
   59EC CB 2C         [ 8] 3474 	sra	h
   59EE CB 1D         [ 8] 3475 	rr	l
   59F0 5D            [ 4] 3476 	ld	e, l
   59F1 54            [ 4] 3477 	ld	d, h
   59F2 29            [11] 3478 	add	hl, hl
   59F3 29            [11] 3479 	add	hl, hl
   59F4 19            [11] 3480 	add	hl, de
   59F5 29            [11] 3481 	add	hl, hl
   59F6 29            [11] 3482 	add	hl, hl
   59F7 11 0A 6C      [10] 3483 	ld	de,#_scene
   59FA 19            [11] 3484 	add	hl,de
   59FB DD 5E F7      [19] 3485 	ld	e,-9 (ix)
   59FE 16 00         [ 7] 3486 	ld	d,#0x00
   5A00 19            [11] 3487 	add	hl,de
   5A01 7E            [ 7] 3488 	ld	a,(hl)
   5A02 3D            [ 4] 3489 	dec	a
   5A03 28 62         [12] 3490 	jr	Z,00124$
                           3491 ;src/main.c:183: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5A05 DD 71 FE      [19] 3492 	ld	-2 (ix),c
   5A08 DD 70 FF      [19] 3493 	ld	-1 (ix),b
   5A0B DD 7E F8      [19] 3494 	ld	a,-8 (ix)
   5A0E B7            [ 4] 3495 	or	a, a
   5A0F 28 0C         [12] 3496 	jr	Z,00134$
   5A11 DD 7E F9      [19] 3497 	ld	a,-7 (ix)
   5A14 DD 77 FE      [19] 3498 	ld	-2 (ix),a
   5A17 DD 7E FA      [19] 3499 	ld	a,-6 (ix)
   5A1A DD 77 FF      [19] 3500 	ld	-1 (ix),a
   5A1D                    3501 00134$:
   5A1D DD 6E FE      [19] 3502 	ld	l,-2 (ix)
   5A20 DD 66 FF      [19] 3503 	ld	h,-1 (ix)
   5A23 CB 2C         [ 8] 3504 	sra	h
   5A25 CB 1D         [ 8] 3505 	rr	l
   5A27 CB 2C         [ 8] 3506 	sra	h
   5A29 CB 1D         [ 8] 3507 	rr	l
   5A2B CB 2C         [ 8] 3508 	sra	h
   5A2D CB 1D         [ 8] 3509 	rr	l
   5A2F CB 2C         [ 8] 3510 	sra	h
   5A31 CB 1D         [ 8] 3511 	rr	l
   5A33 5D            [ 4] 3512 	ld	e, l
   5A34 54            [ 4] 3513 	ld	d, h
   5A35 29            [11] 3514 	add	hl, hl
   5A36 29            [11] 3515 	add	hl, hl
   5A37 19            [11] 3516 	add	hl, de
   5A38 29            [11] 3517 	add	hl, hl
   5A39 29            [11] 3518 	add	hl, hl
   5A3A 3E 0A         [ 7] 3519 	ld	a,#<(_scene)
   5A3C 85            [ 4] 3520 	add	a, l
   5A3D DD 77 FE      [19] 3521 	ld	-2 (ix),a
   5A40 3E 6C         [ 7] 3522 	ld	a,#>(_scene)
   5A42 8C            [ 4] 3523 	adc	a, h
   5A43 DD 77 FF      [19] 3524 	ld	-1 (ix),a
   5A46 DD 6E FB      [19] 3525 	ld	l,-5 (ix)
   5A49 DD 66 FC      [19] 3526 	ld	h,-4 (ix)
   5A4C DD 7E FD      [19] 3527 	ld	a,-3 (ix)
   5A4F B7            [ 4] 3528 	or	a, a
   5A50 28 02         [12] 3529 	jr	Z,00135$
   5A52 E1            [10] 3530 	pop	hl
   5A53 E5            [11] 3531 	push	hl
   5A54                    3532 00135$:
   5A54 CB 2C         [ 8] 3533 	sra	h
   5A56 CB 1D         [ 8] 3534 	rr	l
   5A58 CB 2C         [ 8] 3535 	sra	h
   5A5A CB 1D         [ 8] 3536 	rr	l
   5A5C DD 5E FE      [19] 3537 	ld	e,-2 (ix)
   5A5F DD 56 FF      [19] 3538 	ld	d,-1 (ix)
   5A62 19            [11] 3539 	add	hl,de
   5A63 7E            [ 7] 3540 	ld	a,(hl)
   5A64 3D            [ 4] 3541 	dec	a
   5A65 20 10         [12] 3542 	jr	NZ,00125$
   5A67                    3543 00124$:
                           3544 ;src/main.c:185: player.x=player.lx;
   5A67 3A 0F 6D      [13] 3545 	ld	a, (#_player + 2)
   5A6A 21 0D 6D      [10] 3546 	ld	hl,#_player
   5A6D 77            [ 7] 3547 	ld	(hl),a
                           3548 ;src/main.c:186: player.y=player.ly;
   5A6E 3A 10 6D      [13] 3549 	ld	a, (#_player + 3)
   5A71 32 0E 6D      [13] 3550 	ld	(#(_player + 0x0001)),a
   5A74 C3 D3 5C      [10] 3551 	jp	00130$
   5A77                    3552 00125$:
                           3553 ;src/main.c:188: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5A77 DD 7E F6      [19] 3554 	ld	a,-10 (ix)
   5A7A D6 02         [ 7] 3555 	sub	a, #0x02
   5A7C CA 1F 5B      [10] 3556 	jp	Z,00118$
                           3557 ;src/main.c:189: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5A7F DD 6E FB      [19] 3558 	ld	l,-5 (ix)
   5A82 DD 66 FC      [19] 3559 	ld	h,-4 (ix)
   5A85 DD 7E FD      [19] 3560 	ld	a,-3 (ix)
   5A88 B7            [ 4] 3561 	or	a, a
   5A89 28 02         [12] 3562 	jr	Z,00136$
   5A8B E1            [10] 3563 	pop	hl
   5A8C E5            [11] 3564 	push	hl
   5A8D                    3565 00136$:
   5A8D CB 2C         [ 8] 3566 	sra	h
   5A8F CB 1D         [ 8] 3567 	rr	l
   5A91 CB 2C         [ 8] 3568 	sra	h
   5A93 CB 1D         [ 8] 3569 	rr	l
   5A95 DD 5E F4      [19] 3570 	ld	e,-12 (ix)
   5A98 DD 56 F5      [19] 3571 	ld	d,-11 (ix)
   5A9B 19            [11] 3572 	add	hl,de
   5A9C 7E            [ 7] 3573 	ld	a,(hl)
   5A9D D6 02         [ 7] 3574 	sub	a, #0x02
   5A9F CA 1F 5B      [10] 3575 	jp	Z,00118$
                           3576 ;src/main.c:190: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5AA2 69            [ 4] 3577 	ld	l, c
   5AA3 60            [ 4] 3578 	ld	h, b
   5AA4 DD 7E F8      [19] 3579 	ld	a,-8 (ix)
   5AA7 B7            [ 4] 3580 	or	a, a
   5AA8 28 06         [12] 3581 	jr	Z,00137$
   5AAA DD 6E F9      [19] 3582 	ld	l,-7 (ix)
   5AAD DD 66 FA      [19] 3583 	ld	h,-6 (ix)
   5AB0                    3584 00137$:
   5AB0 CB 2C         [ 8] 3585 	sra	h
   5AB2 CB 1D         [ 8] 3586 	rr	l
   5AB4 CB 2C         [ 8] 3587 	sra	h
   5AB6 CB 1D         [ 8] 3588 	rr	l
   5AB8 CB 2C         [ 8] 3589 	sra	h
   5ABA CB 1D         [ 8] 3590 	rr	l
   5ABC CB 2C         [ 8] 3591 	sra	h
   5ABE CB 1D         [ 8] 3592 	rr	l
   5AC0 5D            [ 4] 3593 	ld	e, l
   5AC1 54            [ 4] 3594 	ld	d, h
   5AC2 29            [11] 3595 	add	hl, hl
   5AC3 29            [11] 3596 	add	hl, hl
   5AC4 19            [11] 3597 	add	hl, de
   5AC5 29            [11] 3598 	add	hl, hl
   5AC6 29            [11] 3599 	add	hl, hl
   5AC7 11 0A 6C      [10] 3600 	ld	de,#_scene
   5ACA 19            [11] 3601 	add	hl,de
   5ACB DD 5E F7      [19] 3602 	ld	e,-9 (ix)
   5ACE 16 00         [ 7] 3603 	ld	d,#0x00
   5AD0 19            [11] 3604 	add	hl,de
   5AD1 7E            [ 7] 3605 	ld	a,(hl)
   5AD2 D6 02         [ 7] 3606 	sub	a, #0x02
   5AD4 28 49         [12] 3607 	jr	Z,00118$
                           3608 ;src/main.c:191: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5AD6 69            [ 4] 3609 	ld	l, c
   5AD7 60            [ 4] 3610 	ld	h, b
   5AD8 DD 7E F8      [19] 3611 	ld	a,-8 (ix)
   5ADB B7            [ 4] 3612 	or	a, a
   5ADC 28 06         [12] 3613 	jr	Z,00138$
   5ADE DD 6E F9      [19] 3614 	ld	l,-7 (ix)
   5AE1 DD 66 FA      [19] 3615 	ld	h,-6 (ix)
   5AE4                    3616 00138$:
   5AE4 CB 2C         [ 8] 3617 	sra	h
   5AE6 CB 1D         [ 8] 3618 	rr	l
   5AE8 CB 2C         [ 8] 3619 	sra	h
   5AEA CB 1D         [ 8] 3620 	rr	l
   5AEC CB 2C         [ 8] 3621 	sra	h
   5AEE CB 1D         [ 8] 3622 	rr	l
   5AF0 CB 2C         [ 8] 3623 	sra	h
   5AF2 CB 1D         [ 8] 3624 	rr	l
   5AF4 5D            [ 4] 3625 	ld	e, l
   5AF5 54            [ 4] 3626 	ld	d, h
   5AF6 29            [11] 3627 	add	hl, hl
   5AF7 29            [11] 3628 	add	hl, hl
   5AF8 19            [11] 3629 	add	hl, de
   5AF9 29            [11] 3630 	add	hl, hl
   5AFA 29            [11] 3631 	add	hl, hl
   5AFB 3E 0A         [ 7] 3632 	ld	a,#<(_scene)
   5AFD 85            [ 4] 3633 	add	a, l
   5AFE 5F            [ 4] 3634 	ld	e,a
   5AFF 3E 6C         [ 7] 3635 	ld	a,#>(_scene)
   5B01 8C            [ 4] 3636 	adc	a, h
   5B02 57            [ 4] 3637 	ld	d,a
   5B03 DD 6E FB      [19] 3638 	ld	l,-5 (ix)
   5B06 DD 66 FC      [19] 3639 	ld	h,-4 (ix)
   5B09 DD 7E FD      [19] 3640 	ld	a,-3 (ix)
   5B0C B7            [ 4] 3641 	or	a, a
   5B0D 28 02         [12] 3642 	jr	Z,00139$
   5B0F E1            [10] 3643 	pop	hl
   5B10 E5            [11] 3644 	push	hl
   5B11                    3645 00139$:
   5B11 CB 2C         [ 8] 3646 	sra	h
   5B13 CB 1D         [ 8] 3647 	rr	l
   5B15 CB 2C         [ 8] 3648 	sra	h
   5B17 CB 1D         [ 8] 3649 	rr	l
   5B19 19            [11] 3650 	add	hl,de
   5B1A 7E            [ 7] 3651 	ld	a,(hl)
   5B1B D6 02         [ 7] 3652 	sub	a, #0x02
   5B1D 20 21         [12] 3653 	jr	NZ,00119$
   5B1F                    3654 00118$:
                           3655 ;src/main.c:193: if(player.life < 3 && *corazon == 0){
   5B1F FD 21 13 6D   [14] 3656 	ld	iy,#_player + 6
   5B23 FD 5E 00      [19] 3657 	ld	e, 0 (iy)
   5B26 7B            [ 4] 3658 	ld	a,e
   5B27 D6 03         [ 7] 3659 	sub	a, #0x03
   5B29 D2 D3 5C      [10] 3660 	jp	NC,00130$
   5B2C DD 6E 04      [19] 3661 	ld	l,4 (ix)
   5B2F DD 66 05      [19] 3662 	ld	h,5 (ix)
   5B32 7E            [ 7] 3663 	ld	a,(hl)
   5B33 B7            [ 4] 3664 	or	a, a
   5B34 C2 D3 5C      [10] 3665 	jp	NZ,00130$
                           3666 ;src/main.c:194: player.life += 1;
   5B37 1C            [ 4] 3667 	inc	e
   5B38 FD 73 00      [19] 3668 	ld	0 (iy), e
                           3669 ;src/main.c:195: *corazon = 1;
   5B3B 36 01         [10] 3670 	ld	(hl),#0x01
   5B3D C3 D3 5C      [10] 3671 	jp	00130$
   5B40                    3672 00119$:
                           3673 ;src/main.c:198: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5B40 DD 7E F6      [19] 3674 	ld	a,-10 (ix)
   5B43 D6 05         [ 7] 3675 	sub	a, #0x05
   5B45 CA E8 5B      [10] 3676 	jp	Z,00112$
                           3677 ;src/main.c:199: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5B48 DD 6E FB      [19] 3678 	ld	l,-5 (ix)
   5B4B DD 66 FC      [19] 3679 	ld	h,-4 (ix)
   5B4E DD 7E FD      [19] 3680 	ld	a,-3 (ix)
   5B51 B7            [ 4] 3681 	or	a, a
   5B52 28 02         [12] 3682 	jr	Z,00140$
   5B54 E1            [10] 3683 	pop	hl
   5B55 E5            [11] 3684 	push	hl
   5B56                    3685 00140$:
   5B56 CB 2C         [ 8] 3686 	sra	h
   5B58 CB 1D         [ 8] 3687 	rr	l
   5B5A CB 2C         [ 8] 3688 	sra	h
   5B5C CB 1D         [ 8] 3689 	rr	l
   5B5E DD 5E F4      [19] 3690 	ld	e,-12 (ix)
   5B61 DD 56 F5      [19] 3691 	ld	d,-11 (ix)
   5B64 19            [11] 3692 	add	hl,de
   5B65 7E            [ 7] 3693 	ld	a,(hl)
   5B66 D6 05         [ 7] 3694 	sub	a, #0x05
   5B68 CA E8 5B      [10] 3695 	jp	Z,00112$
                           3696 ;src/main.c:200: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5B6B 69            [ 4] 3697 	ld	l, c
   5B6C 60            [ 4] 3698 	ld	h, b
   5B6D DD 7E F8      [19] 3699 	ld	a,-8 (ix)
   5B70 B7            [ 4] 3700 	or	a, a
   5B71 28 06         [12] 3701 	jr	Z,00141$
   5B73 DD 6E F9      [19] 3702 	ld	l,-7 (ix)
   5B76 DD 66 FA      [19] 3703 	ld	h,-6 (ix)
   5B79                    3704 00141$:
   5B79 CB 2C         [ 8] 3705 	sra	h
   5B7B CB 1D         [ 8] 3706 	rr	l
   5B7D CB 2C         [ 8] 3707 	sra	h
   5B7F CB 1D         [ 8] 3708 	rr	l
   5B81 CB 2C         [ 8] 3709 	sra	h
   5B83 CB 1D         [ 8] 3710 	rr	l
   5B85 CB 2C         [ 8] 3711 	sra	h
   5B87 CB 1D         [ 8] 3712 	rr	l
   5B89 5D            [ 4] 3713 	ld	e, l
   5B8A 54            [ 4] 3714 	ld	d, h
   5B8B 29            [11] 3715 	add	hl, hl
   5B8C 29            [11] 3716 	add	hl, hl
   5B8D 19            [11] 3717 	add	hl, de
   5B8E 29            [11] 3718 	add	hl, hl
   5B8F 29            [11] 3719 	add	hl, hl
   5B90 11 0A 6C      [10] 3720 	ld	de,#_scene
   5B93 19            [11] 3721 	add	hl,de
   5B94 DD 5E F7      [19] 3722 	ld	e,-9 (ix)
   5B97 16 00         [ 7] 3723 	ld	d,#0x00
   5B99 19            [11] 3724 	add	hl,de
   5B9A 7E            [ 7] 3725 	ld	a,(hl)
   5B9B D6 05         [ 7] 3726 	sub	a, #0x05
   5B9D 28 49         [12] 3727 	jr	Z,00112$
                           3728 ;src/main.c:201: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5B9F 69            [ 4] 3729 	ld	l, c
   5BA0 60            [ 4] 3730 	ld	h, b
   5BA1 DD 7E F8      [19] 3731 	ld	a,-8 (ix)
   5BA4 B7            [ 4] 3732 	or	a, a
   5BA5 28 06         [12] 3733 	jr	Z,00142$
   5BA7 DD 6E F9      [19] 3734 	ld	l,-7 (ix)
   5BAA DD 66 FA      [19] 3735 	ld	h,-6 (ix)
   5BAD                    3736 00142$:
   5BAD CB 2C         [ 8] 3737 	sra	h
   5BAF CB 1D         [ 8] 3738 	rr	l
   5BB1 CB 2C         [ 8] 3739 	sra	h
   5BB3 CB 1D         [ 8] 3740 	rr	l
   5BB5 CB 2C         [ 8] 3741 	sra	h
   5BB7 CB 1D         [ 8] 3742 	rr	l
   5BB9 CB 2C         [ 8] 3743 	sra	h
   5BBB CB 1D         [ 8] 3744 	rr	l
   5BBD 5D            [ 4] 3745 	ld	e, l
   5BBE 54            [ 4] 3746 	ld	d, h
   5BBF 29            [11] 3747 	add	hl, hl
   5BC0 29            [11] 3748 	add	hl, hl
   5BC1 19            [11] 3749 	add	hl, de
   5BC2 29            [11] 3750 	add	hl, hl
   5BC3 29            [11] 3751 	add	hl, hl
   5BC4 3E 0A         [ 7] 3752 	ld	a,#<(_scene)
   5BC6 85            [ 4] 3753 	add	a, l
   5BC7 5F            [ 4] 3754 	ld	e,a
   5BC8 3E 6C         [ 7] 3755 	ld	a,#>(_scene)
   5BCA 8C            [ 4] 3756 	adc	a, h
   5BCB 57            [ 4] 3757 	ld	d,a
   5BCC DD 6E FB      [19] 3758 	ld	l,-5 (ix)
   5BCF DD 66 FC      [19] 3759 	ld	h,-4 (ix)
   5BD2 DD 7E FD      [19] 3760 	ld	a,-3 (ix)
   5BD5 B7            [ 4] 3761 	or	a, a
   5BD6 28 02         [12] 3762 	jr	Z,00143$
   5BD8 E1            [10] 3763 	pop	hl
   5BD9 E5            [11] 3764 	push	hl
   5BDA                    3765 00143$:
   5BDA CB 2C         [ 8] 3766 	sra	h
   5BDC CB 1D         [ 8] 3767 	rr	l
   5BDE CB 2C         [ 8] 3768 	sra	h
   5BE0 CB 1D         [ 8] 3769 	rr	l
   5BE2 19            [11] 3770 	add	hl,de
   5BE3 7E            [ 7] 3771 	ld	a,(hl)
   5BE4 D6 05         [ 7] 3772 	sub	a, #0x05
   5BE6 20 21         [12] 3773 	jr	NZ,00113$
   5BE8                    3774 00112$:
                           3775 ;src/main.c:203: if(player.bullets < 3 && *flecha == 0){
   5BE8 FD 21 17 6D   [14] 3776 	ld	iy,#_player + 10
   5BEC FD 5E 00      [19] 3777 	ld	e, 0 (iy)
   5BEF 7B            [ 4] 3778 	ld	a,e
   5BF0 D6 03         [ 7] 3779 	sub	a, #0x03
   5BF2 D2 D3 5C      [10] 3780 	jp	NC,00130$
   5BF5 DD 6E 06      [19] 3781 	ld	l,6 (ix)
   5BF8 DD 66 07      [19] 3782 	ld	h,7 (ix)
   5BFB 7E            [ 7] 3783 	ld	a,(hl)
   5BFC B7            [ 4] 3784 	or	a, a
   5BFD C2 D3 5C      [10] 3785 	jp	NZ,00130$
                           3786 ;src/main.c:204: player.bullets += 1;
   5C00 1C            [ 4] 3787 	inc	e
   5C01 FD 73 00      [19] 3788 	ld	0 (iy), e
                           3789 ;src/main.c:205: *flecha = 1;
   5C04 36 01         [10] 3790 	ld	(hl),#0x01
   5C06 C3 D3 5C      [10] 3791 	jp	00130$
   5C09                    3792 00113$:
                           3793 ;src/main.c:207: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5C09 DD 7E F6      [19] 3794 	ld	a,-10 (ix)
   5C0C D6 09         [ 7] 3795 	sub	a, #0x09
   5C0E CA B9 5C      [10] 3796 	jp	Z,00107$
                           3797 ;src/main.c:208: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C11 DD 6E FB      [19] 3798 	ld	l,-5 (ix)
   5C14 DD 66 FC      [19] 3799 	ld	h,-4 (ix)
   5C17 DD 7E FD      [19] 3800 	ld	a,-3 (ix)
   5C1A B7            [ 4] 3801 	or	a, a
   5C1B 28 02         [12] 3802 	jr	Z,00144$
   5C1D E1            [10] 3803 	pop	hl
   5C1E E5            [11] 3804 	push	hl
   5C1F                    3805 00144$:
   5C1F CB 2C         [ 8] 3806 	sra	h
   5C21 CB 1D         [ 8] 3807 	rr	l
   5C23 CB 2C         [ 8] 3808 	sra	h
   5C25 CB 1D         [ 8] 3809 	rr	l
   5C27 DD 5E F4      [19] 3810 	ld	e,-12 (ix)
   5C2A DD 56 F5      [19] 3811 	ld	d,-11 (ix)
   5C2D 19            [11] 3812 	add	hl,de
   5C2E 7E            [ 7] 3813 	ld	a,(hl)
   5C2F D6 09         [ 7] 3814 	sub	a, #0x09
   5C31 CA B9 5C      [10] 3815 	jp	Z,00107$
                           3816 ;src/main.c:209: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5C34 69            [ 4] 3817 	ld	l, c
   5C35 60            [ 4] 3818 	ld	h, b
   5C36 DD 7E F8      [19] 3819 	ld	a,-8 (ix)
   5C39 B7            [ 4] 3820 	or	a, a
   5C3A 28 06         [12] 3821 	jr	Z,00145$
   5C3C DD 6E F9      [19] 3822 	ld	l,-7 (ix)
   5C3F DD 66 FA      [19] 3823 	ld	h,-6 (ix)
   5C42                    3824 00145$:
   5C42 CB 2C         [ 8] 3825 	sra	h
   5C44 CB 1D         [ 8] 3826 	rr	l
   5C46 CB 2C         [ 8] 3827 	sra	h
   5C48 CB 1D         [ 8] 3828 	rr	l
   5C4A CB 2C         [ 8] 3829 	sra	h
   5C4C CB 1D         [ 8] 3830 	rr	l
   5C4E CB 2C         [ 8] 3831 	sra	h
   5C50 CB 1D         [ 8] 3832 	rr	l
   5C52 5D            [ 4] 3833 	ld	e, l
   5C53 54            [ 4] 3834 	ld	d, h
   5C54 29            [11] 3835 	add	hl, hl
   5C55 29            [11] 3836 	add	hl, hl
   5C56 19            [11] 3837 	add	hl, de
   5C57 29            [11] 3838 	add	hl, hl
   5C58 29            [11] 3839 	add	hl, hl
   5C59 11 0A 6C      [10] 3840 	ld	de,#_scene
   5C5C 19            [11] 3841 	add	hl,de
   5C5D DD 5E F7      [19] 3842 	ld	e,-9 (ix)
   5C60 16 00         [ 7] 3843 	ld	d,#0x00
   5C62 19            [11] 3844 	add	hl,de
   5C63 7E            [ 7] 3845 	ld	a,(hl)
   5C64 D6 09         [ 7] 3846 	sub	a, #0x09
   5C66 28 51         [12] 3847 	jr	Z,00107$
                           3848 ;src/main.c:210: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C68 DD 7E F8      [19] 3849 	ld	a,-8 (ix)
   5C6B B7            [ 4] 3850 	or	a, a
   5C6C 28 06         [12] 3851 	jr	Z,00146$
   5C6E DD 4E F9      [19] 3852 	ld	c,-7 (ix)
   5C71 DD 46 FA      [19] 3853 	ld	b,-6 (ix)
   5C74                    3854 00146$:
   5C74 CB 28         [ 8] 3855 	sra	b
   5C76 CB 19         [ 8] 3856 	rr	c
   5C78 CB 28         [ 8] 3857 	sra	b
   5C7A CB 19         [ 8] 3858 	rr	c
   5C7C CB 28         [ 8] 3859 	sra	b
   5C7E CB 19         [ 8] 3860 	rr	c
   5C80 CB 28         [ 8] 3861 	sra	b
   5C82 CB 19         [ 8] 3862 	rr	c
   5C84 69            [ 4] 3863 	ld	l, c
   5C85 60            [ 4] 3864 	ld	h, b
   5C86 29            [11] 3865 	add	hl, hl
   5C87 29            [11] 3866 	add	hl, hl
   5C88 09            [11] 3867 	add	hl, bc
   5C89 29            [11] 3868 	add	hl, hl
   5C8A 29            [11] 3869 	add	hl, hl
   5C8B 3E 0A         [ 7] 3870 	ld	a,#<(_scene)
   5C8D 85            [ 4] 3871 	add	a, l
   5C8E DD 77 F9      [19] 3872 	ld	-7 (ix),a
   5C91 3E 6C         [ 7] 3873 	ld	a,#>(_scene)
   5C93 8C            [ 4] 3874 	adc	a, h
   5C94 DD 77 FA      [19] 3875 	ld	-6 (ix),a
   5C97 DD 6E FB      [19] 3876 	ld	l,-5 (ix)
   5C9A DD 66 FC      [19] 3877 	ld	h,-4 (ix)
   5C9D DD 7E FD      [19] 3878 	ld	a,-3 (ix)
   5CA0 B7            [ 4] 3879 	or	a, a
   5CA1 28 02         [12] 3880 	jr	Z,00147$
   5CA3 E1            [10] 3881 	pop	hl
   5CA4 E5            [11] 3882 	push	hl
   5CA5                    3883 00147$:
   5CA5 CB 2C         [ 8] 3884 	sra	h
   5CA7 CB 1D         [ 8] 3885 	rr	l
   5CA9 CB 2C         [ 8] 3886 	sra	h
   5CAB CB 1D         [ 8] 3887 	rr	l
   5CAD DD 5E F9      [19] 3888 	ld	e,-7 (ix)
   5CB0 DD 56 FA      [19] 3889 	ld	d,-6 (ix)
   5CB3 19            [11] 3890 	add	hl,de
   5CB4 7E            [ 7] 3891 	ld	a,(hl)
   5CB5 D6 09         [ 7] 3892 	sub	a, #0x09
   5CB7 20 1A         [12] 3893 	jr	NZ,00130$
   5CB9                    3894 00107$:
                           3895 ;src/main.c:213: cpct_clearScreen(0);
   5CB9 21 00 40      [10] 3896 	ld	hl,#0x4000
   5CBC E5            [11] 3897 	push	hl
   5CBD AF            [ 4] 3898 	xor	a, a
   5CBE F5            [11] 3899 	push	af
   5CBF 33            [ 6] 3900 	inc	sp
   5CC0 26 C0         [ 7] 3901 	ld	h, #0xC0
   5CC2 E5            [11] 3902 	push	hl
   5CC3 CD 21 6A      [17] 3903 	call	_cpct_memset
                           3904 ;src/main.c:214: map+=1;
   5CC6 21 FC 6C      [10] 3905 	ld	hl, #_map+0
   5CC9 34            [11] 3906 	inc	(hl)
                           3907 ;src/main.c:215: drawMap(map);
   5CCA 3A FC 6C      [13] 3908 	ld	a,(_map)
   5CCD F5            [11] 3909 	push	af
   5CCE 33            [ 6] 3910 	inc	sp
   5CCF CD C0 46      [17] 3911 	call	_drawMap
   5CD2 33            [ 6] 3912 	inc	sp
   5CD3                    3913 00130$:
   5CD3 DD F9         [10] 3914 	ld	sp, ix
   5CD5 DD E1         [14] 3915 	pop	ix
   5CD7 C9            [10] 3916 	ret
                           3917 ;src/main.c:219: u8 checkArrowCollisions(){
                           3918 ;	---------------------------------
                           3919 ; Function checkArrowCollisions
                           3920 ; ---------------------------------
   5CD8                    3921 _checkArrowCollisions::
   5CD8 DD E5         [15] 3922 	push	ix
   5CDA DD 21 00 00   [14] 3923 	ld	ix,#0
   5CDE DD 39         [15] 3924 	add	ix,sp
   5CE0 21 F4 FF      [10] 3925 	ld	hl,#-12
   5CE3 39            [11] 3926 	add	hl,sp
   5CE4 F9            [ 6] 3927 	ld	sp,hl
                           3928 ;src/main.c:220: u8 bound =0;
   5CE5 DD 36 F4 00   [19] 3929 	ld	-12 (ix),#0x00
                           3930 ;src/main.c:221: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5CE9 3A 04 6D      [13] 3931 	ld	a,(#(_object + 0x0001) + 0)
   5CEC DD 77 FD      [19] 3932 	ld	-3 (ix), a
   5CEF 07            [ 4] 3933 	rlca
   5CF0 07            [ 4] 3934 	rlca
   5CF1 07            [ 4] 3935 	rlca
   5CF2 07            [ 4] 3936 	rlca
   5CF3 E6 0F         [ 7] 3937 	and	a,#0x0F
   5CF5 4F            [ 4] 3938 	ld	c,a
   5CF6 06 00         [ 7] 3939 	ld	b,#0x00
   5CF8 69            [ 4] 3940 	ld	l, c
   5CF9 60            [ 4] 3941 	ld	h, b
   5CFA 29            [11] 3942 	add	hl, hl
   5CFB 29            [11] 3943 	add	hl, hl
   5CFC 09            [11] 3944 	add	hl, bc
   5CFD 29            [11] 3945 	add	hl, hl
   5CFE 29            [11] 3946 	add	hl, hl
   5CFF 3E 0A         [ 7] 3947 	ld	a,#<(_scene)
   5D01 85            [ 4] 3948 	add	a, l
   5D02 DD 77 FE      [19] 3949 	ld	-2 (ix),a
   5D05 3E 6C         [ 7] 3950 	ld	a,#>(_scene)
   5D07 8C            [ 4] 3951 	adc	a, h
   5D08 DD 77 FF      [19] 3952 	ld	-1 (ix),a
   5D0B 21 03 6D      [10] 3953 	ld	hl, #_object + 0
   5D0E 4E            [ 7] 3954 	ld	c,(hl)
   5D0F 79            [ 4] 3955 	ld	a,c
   5D10 0F            [ 4] 3956 	rrca
   5D11 0F            [ 4] 3957 	rrca
   5D12 E6 3F         [ 7] 3958 	and	a,#0x3F
   5D14 DD 77 FA      [19] 3959 	ld	-6 (ix),a
   5D17 DD 7E FE      [19] 3960 	ld	a,-2 (ix)
   5D1A DD 86 FA      [19] 3961 	add	a, -6 (ix)
   5D1D 6F            [ 4] 3962 	ld	l,a
   5D1E DD 7E FF      [19] 3963 	ld	a,-1 (ix)
   5D21 CE 00         [ 7] 3964 	adc	a, #0x00
   5D23 67            [ 4] 3965 	ld	h,a
   5D24 7E            [ 7] 3966 	ld	a,(hl)
   5D25 3D            [ 4] 3967 	dec	a
   5D26 CA 23 5E      [10] 3968 	jp	Z,00101$
                           3969 ;src/main.c:222: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5D29 06 00         [ 7] 3970 	ld	b,#0x00
   5D2B 21 03 00      [10] 3971 	ld	hl,#0x0003
   5D2E 09            [11] 3972 	add	hl,bc
   5D2F DD 75 F8      [19] 3973 	ld	-8 (ix),l
   5D32 DD 74 F9      [19] 3974 	ld	-7 (ix),h
   5D35 DD 7E F8      [19] 3975 	ld	a,-8 (ix)
   5D38 DD 77 FB      [19] 3976 	ld	-5 (ix),a
   5D3B DD 7E F9      [19] 3977 	ld	a,-7 (ix)
   5D3E DD 77 FC      [19] 3978 	ld	-4 (ix),a
   5D41 DD 7E F9      [19] 3979 	ld	a,-7 (ix)
   5D44 07            [ 4] 3980 	rlca
   5D45 E6 01         [ 7] 3981 	and	a,#0x01
   5D47 DD 77 F5      [19] 3982 	ld	-11 (ix),a
   5D4A 21 06 00      [10] 3983 	ld	hl,#0x0006
   5D4D 09            [11] 3984 	add	hl,bc
   5D4E DD 75 F6      [19] 3985 	ld	-10 (ix),l
   5D51 DD 74 F7      [19] 3986 	ld	-9 (ix),h
   5D54 DD 7E F5      [19] 3987 	ld	a,-11 (ix)
   5D57 B7            [ 4] 3988 	or	a, a
   5D58 28 0C         [12] 3989 	jr	Z,00108$
   5D5A DD 7E F6      [19] 3990 	ld	a,-10 (ix)
   5D5D DD 77 FB      [19] 3991 	ld	-5 (ix),a
   5D60 DD 7E F7      [19] 3992 	ld	a,-9 (ix)
   5D63 DD 77 FC      [19] 3993 	ld	-4 (ix),a
   5D66                    3994 00108$:
   5D66 DD 6E FB      [19] 3995 	ld	l,-5 (ix)
   5D69 DD 66 FC      [19] 3996 	ld	h,-4 (ix)
   5D6C CB 2C         [ 8] 3997 	sra	h
   5D6E CB 1D         [ 8] 3998 	rr	l
   5D70 CB 2C         [ 8] 3999 	sra	h
   5D72 CB 1D         [ 8] 4000 	rr	l
   5D74 DD 5E FE      [19] 4001 	ld	e,-2 (ix)
   5D77 DD 56 FF      [19] 4002 	ld	d,-1 (ix)
   5D7A 19            [11] 4003 	add	hl,de
   5D7B 7E            [ 7] 4004 	ld	a,(hl)
   5D7C 3D            [ 4] 4005 	dec	a
   5D7D CA 23 5E      [10] 4006 	jp	Z,00101$
                           4007 ;src/main.c:223: || scene[(object.y+tileheight-2)/tileheight][(object.x)/tilewidth] == 1
   5D80 DD 5E FD      [19] 4008 	ld	e,-3 (ix)
   5D83 16 00         [ 7] 4009 	ld	d,#0x00
   5D85 21 0E 00      [10] 4010 	ld	hl,#0x000E
   5D88 19            [11] 4011 	add	hl,de
   5D89 4D            [ 4] 4012 	ld	c,l
   5D8A 44            [ 4] 4013 	ld	b,h
   5D8B 69            [ 4] 4014 	ld	l, c
   5D8C 78            [ 4] 4015 	ld	a,b
   5D8D 67            [ 4] 4016 	ld	h,a
   5D8E 07            [ 4] 4017 	rlca
   5D8F E6 01         [ 7] 4018 	and	a,#0x01
   5D91 DD 77 FB      [19] 4019 	ld	-5 (ix),a
   5D94 7B            [ 4] 4020 	ld	a,e
   5D95 C6 1D         [ 7] 4021 	add	a, #0x1D
   5D97 DD 77 FE      [19] 4022 	ld	-2 (ix),a
   5D9A 7A            [ 4] 4023 	ld	a,d
   5D9B CE 00         [ 7] 4024 	adc	a, #0x00
   5D9D DD 77 FF      [19] 4025 	ld	-1 (ix),a
   5DA0 DD 7E FB      [19] 4026 	ld	a,-5 (ix)
   5DA3 B7            [ 4] 4027 	or	a, a
   5DA4 28 06         [12] 4028 	jr	Z,00109$
   5DA6 DD 6E FE      [19] 4029 	ld	l,-2 (ix)
   5DA9 DD 66 FF      [19] 4030 	ld	h,-1 (ix)
   5DAC                    4031 00109$:
   5DAC CB 2C         [ 8] 4032 	sra	h
   5DAE CB 1D         [ 8] 4033 	rr	l
   5DB0 CB 2C         [ 8] 4034 	sra	h
   5DB2 CB 1D         [ 8] 4035 	rr	l
   5DB4 CB 2C         [ 8] 4036 	sra	h
   5DB6 CB 1D         [ 8] 4037 	rr	l
   5DB8 CB 2C         [ 8] 4038 	sra	h
   5DBA CB 1D         [ 8] 4039 	rr	l
   5DBC 5D            [ 4] 4040 	ld	e, l
   5DBD 54            [ 4] 4041 	ld	d, h
   5DBE 29            [11] 4042 	add	hl, hl
   5DBF 29            [11] 4043 	add	hl, hl
   5DC0 19            [11] 4044 	add	hl, de
   5DC1 29            [11] 4045 	add	hl, hl
   5DC2 29            [11] 4046 	add	hl, hl
   5DC3 11 0A 6C      [10] 4047 	ld	de,#_scene
   5DC6 19            [11] 4048 	add	hl,de
   5DC7 DD 5E FA      [19] 4049 	ld	e,-6 (ix)
   5DCA 16 00         [ 7] 4050 	ld	d,#0x00
   5DCC 19            [11] 4051 	add	hl,de
   5DCD 7E            [ 7] 4052 	ld	a,(hl)
   5DCE 3D            [ 4] 4053 	dec	a
   5DCF 28 52         [12] 4054 	jr	Z,00101$
                           4055 ;src/main.c:224: || scene[(object.y+tileheight-2)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5DD1 DD 7E FB      [19] 4056 	ld	a,-5 (ix)
   5DD4 B7            [ 4] 4057 	or	a, a
   5DD5 28 06         [12] 4058 	jr	Z,00110$
   5DD7 DD 4E FE      [19] 4059 	ld	c,-2 (ix)
   5DDA DD 46 FF      [19] 4060 	ld	b,-1 (ix)
   5DDD                    4061 00110$:
   5DDD CB 28         [ 8] 4062 	sra	b
   5DDF CB 19         [ 8] 4063 	rr	c
   5DE1 CB 28         [ 8] 4064 	sra	b
   5DE3 CB 19         [ 8] 4065 	rr	c
   5DE5 CB 28         [ 8] 4066 	sra	b
   5DE7 CB 19         [ 8] 4067 	rr	c
   5DE9 CB 28         [ 8] 4068 	sra	b
   5DEB CB 19         [ 8] 4069 	rr	c
   5DED 69            [ 4] 4070 	ld	l, c
   5DEE 60            [ 4] 4071 	ld	h, b
   5DEF 29            [11] 4072 	add	hl, hl
   5DF0 29            [11] 4073 	add	hl, hl
   5DF1 09            [11] 4074 	add	hl, bc
   5DF2 29            [11] 4075 	add	hl, hl
   5DF3 29            [11] 4076 	add	hl, hl
   5DF4 3E 0A         [ 7] 4077 	ld	a,#<(_scene)
   5DF6 85            [ 4] 4078 	add	a, l
   5DF7 DD 77 FB      [19] 4079 	ld	-5 (ix),a
   5DFA 3E 6C         [ 7] 4080 	ld	a,#>(_scene)
   5DFC 8C            [ 4] 4081 	adc	a, h
   5DFD DD 77 FC      [19] 4082 	ld	-4 (ix),a
   5E00 DD 6E F8      [19] 4083 	ld	l,-8 (ix)
   5E03 DD 66 F9      [19] 4084 	ld	h,-7 (ix)
   5E06 DD 7E F5      [19] 4085 	ld	a,-11 (ix)
   5E09 B7            [ 4] 4086 	or	a, a
   5E0A 28 04         [12] 4087 	jr	Z,00111$
   5E0C C1            [10] 4088 	pop	bc
   5E0D E1            [10] 4089 	pop	hl
   5E0E E5            [11] 4090 	push	hl
   5E0F C5            [11] 4091 	push	bc
   5E10                    4092 00111$:
   5E10 CB 2C         [ 8] 4093 	sra	h
   5E12 CB 1D         [ 8] 4094 	rr	l
   5E14 CB 2C         [ 8] 4095 	sra	h
   5E16 CB 1D         [ 8] 4096 	rr	l
   5E18 DD 5E FB      [19] 4097 	ld	e,-5 (ix)
   5E1B DD 56 FC      [19] 4098 	ld	d,-4 (ix)
   5E1E 19            [11] 4099 	add	hl,de
   5E1F 7E            [ 7] 4100 	ld	a,(hl)
   5E20 3D            [ 4] 4101 	dec	a
   5E21 20 10         [12] 4102 	jr	NZ,00102$
   5E23                    4103 00101$:
                           4104 ;src/main.c:226: object.x=object.lx;
   5E23 3A 05 6D      [13] 4105 	ld	a, (#_object + 2)
   5E26 32 03 6D      [13] 4106 	ld	(#_object),a
                           4107 ;src/main.c:227: object.y=object.ly;
   5E29 3A 06 6D      [13] 4108 	ld	a, (#_object + 3)
   5E2C 32 04 6D      [13] 4109 	ld	(#(_object + 0x0001)),a
                           4110 ;src/main.c:228: bound = 1;
   5E2F DD 36 F4 01   [19] 4111 	ld	-12 (ix),#0x01
   5E33                    4112 00102$:
                           4113 ;src/main.c:231: return bound;
   5E33 DD 6E F4      [19] 4114 	ld	l,-12 (ix)
   5E36 DD F9         [10] 4115 	ld	sp, ix
   5E38 DD E1         [14] 4116 	pop	ix
   5E3A C9            [10] 4117 	ret
                           4118 ;src/main.c:237: void followPlayer(){
                           4119 ;	---------------------------------
                           4120 ; Function followPlayer
                           4121 ; ---------------------------------
   5E3B                    4122 _followPlayer::
   5E3B DD E5         [15] 4123 	push	ix
   5E3D DD 21 00 00   [14] 4124 	ld	ix,#0
   5E41 DD 39         [15] 4125 	add	ix,sp
   5E43 21 E5 FF      [10] 4126 	ld	hl,#-27
   5E46 39            [11] 4127 	add	hl,sp
   5E47 F9            [ 6] 4128 	ld	sp,hl
                           4129 ;src/main.c:240: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   5E48 21 0E 6D      [10] 4130 	ld	hl, #(_player + 0x0001) + 0
   5E4B 56            [ 7] 4131 	ld	d,(hl)
   5E4C 3A 0D 6D      [13] 4132 	ld	a, (#_player + 0)
   5E4F D5            [11] 4133 	push	de
   5E50 33            [ 6] 4134 	inc	sp
   5E51 F5            [11] 4135 	push	af
   5E52 33            [ 6] 4136 	inc	sp
   5E53 CD 41 4F      [17] 4137 	call	_detectPlayerRoom
   5E56 F1            [10] 4138 	pop	af
   5E57 DD 75 FF      [19] 4139 	ld	-1 (ix),l
   5E5A 21 23 6D      [10] 4140 	ld	hl, #_enemy + 11
   5E5D DD 7E FF      [19] 4141 	ld	a,-1 (ix)
   5E60 96            [ 7] 4142 	sub	a,(hl)
   5E61 28 0C         [12] 4143 	jr	Z,00102$
                           4144 ;src/main.c:241: auxX = enemy.seenX;
   5E63 3A 24 6D      [13] 4145 	ld	a,(#_enemy + 12)
   5E66 DD 77 E5      [19] 4146 	ld	-27 (ix),a
                           4147 ;src/main.c:242: auxY = enemy.seenY;
   5E69 21 25 6D      [10] 4148 	ld	hl, #_enemy + 13
   5E6C 56            [ 7] 4149 	ld	d,(hl)
   5E6D 18 0B         [12] 4150 	jr	00103$
   5E6F                    4151 00102$:
                           4152 ;src/main.c:244: auxX = player.x;
   5E6F 21 0D 6D      [10] 4153 	ld	hl, #_player + 0
   5E72 7E            [ 7] 4154 	ld	a,(hl)
   5E73 DD 77 E5      [19] 4155 	ld	-27 (ix),a
                           4156 ;src/main.c:245: auxY = player.y;
   5E76 21 0E 6D      [10] 4157 	ld	hl, #(_player + 0x0001) + 0
   5E79 56            [ 7] 4158 	ld	d,(hl)
   5E7A                    4159 00103$:
                           4160 ;src/main.c:249: if(auxX < enemy.x){
   5E7A 3A 18 6D      [13] 4161 	ld	a,(#_enemy + 0)
                           4162 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E7D DD 77 FF      [19] 4163 	ld	-1 (ix), a
   5E80 DD 77 FD      [19] 4164 	ld	-3 (ix),a
   5E83 DD 36 FE 00   [19] 4165 	ld	-2 (ix),#0x00
                           4166 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5E87 DD 7E FF      [19] 4167 	ld	a,-1 (ix)
   5E8A 0F            [ 4] 4168 	rrca
   5E8B 0F            [ 4] 4169 	rrca
   5E8C E6 3F         [ 7] 4170 	and	a,#0x3F
   5E8E DD 77 FC      [19] 4171 	ld	-4 (ix),a
                           4172 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E91 21 19 6D      [10] 4173 	ld	hl, #(_enemy + 0x0001) + 0
   5E94 5E            [ 7] 4174 	ld	e,(hl)
   5E95 DD 7E FD      [19] 4175 	ld	a,-3 (ix)
   5E98 C6 FF         [ 7] 4176 	add	a,#0xFF
   5E9A DD 77 FA      [19] 4177 	ld	-6 (ix),a
   5E9D DD 7E FE      [19] 4178 	ld	a,-2 (ix)
   5EA0 CE FF         [ 7] 4179 	adc	a,#0xFF
   5EA2 DD 77 FB      [19] 4180 	ld	-5 (ix),a
   5EA5 DD 7E FD      [19] 4181 	ld	a,-3 (ix)
   5EA8 C6 02         [ 7] 4182 	add	a, #0x02
   5EAA DD 77 F8      [19] 4183 	ld	-8 (ix),a
   5EAD DD 7E FE      [19] 4184 	ld	a,-2 (ix)
   5EB0 CE 00         [ 7] 4185 	adc	a, #0x00
   5EB2 DD 77 F9      [19] 4186 	ld	-7 (ix),a
   5EB5 7B            [ 4] 4187 	ld	a,e
   5EB6 07            [ 4] 4188 	rlca
   5EB7 07            [ 4] 4189 	rlca
   5EB8 07            [ 4] 4190 	rlca
   5EB9 07            [ 4] 4191 	rlca
   5EBA E6 0F         [ 7] 4192 	and	a,#0x0F
   5EBC 67            [ 4] 4193 	ld	h,a
   5EBD DD 7E FB      [19] 4194 	ld	a,-5 (ix)
   5EC0 07            [ 4] 4195 	rlca
   5EC1 E6 01         [ 7] 4196 	and	a,#0x01
   5EC3 DD 77 F7      [19] 4197 	ld	-9 (ix),a
                           4198 ;src/main.c:253: }else if(auxY < enemy.y){
   5EC6 7A            [ 4] 4199 	ld	a,d
   5EC7 93            [ 4] 4200 	sub	a, e
   5EC8 3E 00         [ 7] 4201 	ld	a,#0x00
   5ECA 17            [ 4] 4202 	rla
   5ECB DD 77 F6      [19] 4203 	ld	-10 (ix),a
                           4204 ;src/main.c:255: enemy.y-=1;
   5ECE 7B            [ 4] 4205 	ld	a,e
   5ECF C6 FF         [ 7] 4206 	add	a,#0xFF
   5ED1 DD 77 F5      [19] 4207 	ld	-11 (ix),a
                           4208 ;src/main.c:258: enemy.y+=1;
   5ED4 7B            [ 4] 4209 	ld	a,e
   5ED5 3C            [ 4] 4210 	inc	a
   5ED6 DD 77 F4      [19] 4211 	ld	-12 (ix),a
                           4212 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5ED9 16 00         [ 7] 4213 	ld	d,#0x00
                           4214 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5EDB 4C            [ 4] 4215 	ld	c,h
   5EDC 06 00         [ 7] 4216 	ld	b,#0x00
   5EDE 69            [ 4] 4217 	ld	l, c
   5EDF 60            [ 4] 4218 	ld	h, b
   5EE0 29            [11] 4219 	add	hl, hl
   5EE1 29            [11] 4220 	add	hl, hl
   5EE2 09            [11] 4221 	add	hl, bc
   5EE3 29            [11] 4222 	add	hl, hl
   5EE4 29            [11] 4223 	add	hl, hl
   5EE5 DD 75 F2      [19] 4224 	ld	-14 (ix),l
   5EE8 DD 74 F3      [19] 4225 	ld	-13 (ix),h
                           4226 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5EEB 7B            [ 4] 4227 	ld	a,e
   5EEC C6 FF         [ 7] 4228 	add	a,#0xFF
   5EEE DD 77 F0      [19] 4229 	ld	-16 (ix),a
   5EF1 7A            [ 4] 4230 	ld	a,d
   5EF2 CE FF         [ 7] 4231 	adc	a,#0xFF
   5EF4 DD 77 F1      [19] 4232 	ld	-15 (ix),a
   5EF7 21 0E 00      [10] 4233 	ld	hl,#0x000E
   5EFA 19            [11] 4234 	add	hl,de
   5EFB DD 75 EE      [19] 4235 	ld	-18 (ix),l
   5EFE DD 74 EF      [19] 4236 	ld	-17 (ix),h
                           4237 ;src/main.c:257: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5F01 21 10 00      [10] 4238 	ld	hl,#0x0010
   5F04 19            [11] 4239 	add	hl,de
   5F05 DD 75 EC      [19] 4240 	ld	-20 (ix),l
   5F08 DD 74 ED      [19] 4241 	ld	-19 (ix),h
   5F0B 21 1F 00      [10] 4242 	ld	hl,#0x001F
   5F0E 19            [11] 4243 	add	hl,de
   5F0F DD 75 EA      [19] 4244 	ld	-22 (ix),l
   5F12 DD 74 EB      [19] 4245 	ld	-21 (ix),h
                           4246 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5F15 DD 7E F1      [19] 4247 	ld	a,-15 (ix)
   5F18 07            [ 4] 4248 	rlca
   5F19 E6 01         [ 7] 4249 	and	a,#0x01
   5F1B DD 77 E9      [19] 4250 	ld	-23 (ix),a
                           4251 ;src/main.c:257: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5F1E DD 7E ED      [19] 4252 	ld	a,-19 (ix)
   5F21 07            [ 4] 4253 	rlca
   5F22 E6 01         [ 7] 4254 	and	a,#0x01
   5F24 DD 77 E8      [19] 4255 	ld	-24 (ix),a
                           4256 ;src/main.c:249: if(auxX < enemy.x){
   5F27 DD 7E E5      [19] 4257 	ld	a,-27 (ix)
   5F2A DD 96 FF      [19] 4258 	sub	a, -1 (ix)
   5F2D D2 F0 5F      [10] 4259 	jp	NC,00135$
                           4260 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5F30 DD 7E F2      [19] 4261 	ld	a,-14 (ix)
   5F33 C6 0A         [ 7] 4262 	add	a, #<(_scene)
   5F35 6F            [ 4] 4263 	ld	l,a
   5F36 DD 7E F3      [19] 4264 	ld	a,-13 (ix)
   5F39 CE 6C         [ 7] 4265 	adc	a, #>(_scene)
   5F3B 67            [ 4] 4266 	ld	h,a
   5F3C DD 5E FA      [19] 4267 	ld	e,-6 (ix)
   5F3F DD 56 FB      [19] 4268 	ld	d,-5 (ix)
   5F42 DD 7E F7      [19] 4269 	ld	a,-9 (ix)
   5F45 B7            [ 4] 4270 	or	a, a
   5F46 28 06         [12] 4271 	jr	Z,00139$
   5F48 DD 5E F8      [19] 4272 	ld	e,-8 (ix)
   5F4B DD 56 F9      [19] 4273 	ld	d,-7 (ix)
   5F4E                    4274 00139$:
   5F4E CB 2A         [ 8] 4275 	sra	d
   5F50 CB 1B         [ 8] 4276 	rr	e
   5F52 CB 2A         [ 8] 4277 	sra	d
   5F54 CB 1B         [ 8] 4278 	rr	e
   5F56 19            [11] 4279 	add	hl,de
   5F57 7E            [ 7] 4280 	ld	a,(hl)
   5F58 3D            [ 4] 4281 	dec	a
   5F59 28 0B         [12] 4282 	jr	Z,00112$
                           4283 ;src/main.c:252: enemy.x-=1;
   5F5B DD 56 FF      [19] 4284 	ld	d,-1 (ix)
   5F5E 15            [ 4] 4285 	dec	d
   5F5F 21 18 6D      [10] 4286 	ld	hl,#_enemy
   5F62 72            [ 7] 4287 	ld	(hl),d
   5F63 C3 4E 61      [10] 4288 	jp	00137$
   5F66                    4289 00112$:
                           4290 ;src/main.c:253: }else if(auxY < enemy.y){
   5F66 DD 7E F6      [19] 4291 	ld	a,-10 (ix)
   5F69 B7            [ 4] 4292 	or	a, a
   5F6A 28 42         [12] 4293 	jr	Z,00109$
                           4294 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5F6C DD 4E F0      [19] 4295 	ld	c,-16 (ix)
   5F6F DD 46 F1      [19] 4296 	ld	b,-15 (ix)
   5F72 DD 7E E9      [19] 4297 	ld	a,-23 (ix)
   5F75 B7            [ 4] 4298 	or	a, a
   5F76 28 06         [12] 4299 	jr	Z,00140$
   5F78 DD 4E EE      [19] 4300 	ld	c,-18 (ix)
   5F7B DD 46 EF      [19] 4301 	ld	b,-17 (ix)
   5F7E                    4302 00140$:
   5F7E CB 28         [ 8] 4303 	sra	b
   5F80 CB 19         [ 8] 4304 	rr	c
   5F82 CB 28         [ 8] 4305 	sra	b
   5F84 CB 19         [ 8] 4306 	rr	c
   5F86 CB 28         [ 8] 4307 	sra	b
   5F88 CB 19         [ 8] 4308 	rr	c
   5F8A CB 28         [ 8] 4309 	sra	b
   5F8C CB 19         [ 8] 4310 	rr	c
   5F8E 69            [ 4] 4311 	ld	l, c
   5F8F 60            [ 4] 4312 	ld	h, b
   5F90 29            [11] 4313 	add	hl, hl
   5F91 29            [11] 4314 	add	hl, hl
   5F92 09            [11] 4315 	add	hl, bc
   5F93 29            [11] 4316 	add	hl, hl
   5F94 29            [11] 4317 	add	hl, hl
   5F95 11 0A 6C      [10] 4318 	ld	de,#_scene
   5F98 19            [11] 4319 	add	hl,de
   5F99 DD 5E FC      [19] 4320 	ld	e,-4 (ix)
   5F9C 16 00         [ 7] 4321 	ld	d,#0x00
   5F9E 19            [11] 4322 	add	hl,de
   5F9F 7E            [ 7] 4323 	ld	a,(hl)
   5FA0 3D            [ 4] 4324 	dec	a
   5FA1 CA 4E 61      [10] 4325 	jp	Z,00137$
                           4326 ;src/main.c:255: enemy.y-=1;
   5FA4 21 19 6D      [10] 4327 	ld	hl,#(_enemy + 0x0001)
   5FA7 DD 7E F5      [19] 4328 	ld	a,-11 (ix)
   5FAA 77            [ 7] 4329 	ld	(hl),a
   5FAB C3 4E 61      [10] 4330 	jp	00137$
   5FAE                    4331 00109$:
                           4332 ;src/main.c:257: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5FAE DD 4E EC      [19] 4333 	ld	c,-20 (ix)
   5FB1 DD 46 ED      [19] 4334 	ld	b,-19 (ix)
   5FB4 DD 7E E8      [19] 4335 	ld	a,-24 (ix)
   5FB7 B7            [ 4] 4336 	or	a, a
   5FB8 28 06         [12] 4337 	jr	Z,00141$
   5FBA DD 4E EA      [19] 4338 	ld	c,-22 (ix)
   5FBD DD 46 EB      [19] 4339 	ld	b,-21 (ix)
   5FC0                    4340 00141$:
   5FC0 CB 28         [ 8] 4341 	sra	b
   5FC2 CB 19         [ 8] 4342 	rr	c
   5FC4 CB 28         [ 8] 4343 	sra	b
   5FC6 CB 19         [ 8] 4344 	rr	c
   5FC8 CB 28         [ 8] 4345 	sra	b
   5FCA CB 19         [ 8] 4346 	rr	c
   5FCC CB 28         [ 8] 4347 	sra	b
   5FCE CB 19         [ 8] 4348 	rr	c
   5FD0 69            [ 4] 4349 	ld	l, c
   5FD1 60            [ 4] 4350 	ld	h, b
   5FD2 29            [11] 4351 	add	hl, hl
   5FD3 29            [11] 4352 	add	hl, hl
   5FD4 09            [11] 4353 	add	hl, bc
   5FD5 29            [11] 4354 	add	hl, hl
   5FD6 29            [11] 4355 	add	hl, hl
   5FD7 11 0A 6C      [10] 4356 	ld	de,#_scene
   5FDA 19            [11] 4357 	add	hl,de
   5FDB DD 5E FC      [19] 4358 	ld	e,-4 (ix)
   5FDE 16 00         [ 7] 4359 	ld	d,#0x00
   5FE0 19            [11] 4360 	add	hl,de
   5FE1 7E            [ 7] 4361 	ld	a,(hl)
   5FE2 3D            [ 4] 4362 	dec	a
   5FE3 CA 4E 61      [10] 4363 	jp	Z,00137$
                           4364 ;src/main.c:258: enemy.y+=1;
   5FE6 21 19 6D      [10] 4365 	ld	hl,#(_enemy + 0x0001)
   5FE9 DD 7E F4      [19] 4366 	ld	a,-12 (ix)
   5FEC 77            [ 7] 4367 	ld	(hl),a
   5FED C3 4E 61      [10] 4368 	jp	00137$
   5FF0                    4369 00135$:
                           4370 ;src/main.c:260: }else if(auxX > enemy.x){
   5FF0 DD 7E FF      [19] 4371 	ld	a,-1 (ix)
   5FF3 DD 96 E5      [19] 4372 	sub	a, -27 (ix)
   5FF6 D2 CA 60      [10] 4373 	jp	NC,00132$
                           4374 ;src/main.c:262: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   5FF9 3E 0A         [ 7] 4375 	ld	a,#<(_scene)
   5FFB DD 86 F2      [19] 4376 	add	a, -14 (ix)
   5FFE DD 77 F2      [19] 4377 	ld	-14 (ix),a
   6001 3E 6C         [ 7] 4378 	ld	a,#>(_scene)
   6003 DD 8E F3      [19] 4379 	adc	a, -13 (ix)
   6006 DD 77 F3      [19] 4380 	ld	-13 (ix),a
   6009 DD 7E FD      [19] 4381 	ld	a,-3 (ix)
   600C C6 04         [ 7] 4382 	add	a, #0x04
   600E 67            [ 4] 4383 	ld	h,a
   600F DD 7E FE      [19] 4384 	ld	a,-2 (ix)
   6012 CE 00         [ 7] 4385 	adc	a, #0x00
   6014 6F            [ 4] 4386 	ld	l,a
   6015 DD 74 E6      [19] 4387 	ld	-26 (ix),h
   6018 DD 75 E7      [19] 4388 	ld	-25 (ix),l
   601B CB 7D         [ 8] 4389 	bit	7, l
   601D 28 10         [12] 4390 	jr	Z,00142$
   601F DD 7E FD      [19] 4391 	ld	a,-3 (ix)
   6022 C6 07         [ 7] 4392 	add	a, #0x07
   6024 DD 77 E6      [19] 4393 	ld	-26 (ix),a
   6027 DD 7E FE      [19] 4394 	ld	a,-2 (ix)
   602A CE 00         [ 7] 4395 	adc	a, #0x00
   602C DD 77 E7      [19] 4396 	ld	-25 (ix),a
   602F                    4397 00142$:
   602F DD 6E E6      [19] 4398 	ld	l,-26 (ix)
   6032 DD 66 E7      [19] 4399 	ld	h,-25 (ix)
   6035 CB 2C         [ 8] 4400 	sra	h
   6037 CB 1D         [ 8] 4401 	rr	l
   6039 CB 2C         [ 8] 4402 	sra	h
   603B CB 1D         [ 8] 4403 	rr	l
   603D DD 5E F2      [19] 4404 	ld	e,-14 (ix)
   6040 DD 56 F3      [19] 4405 	ld	d,-13 (ix)
   6043 19            [11] 4406 	add	hl,de
   6044 7E            [ 7] 4407 	ld	a,(hl)
   6045 3D            [ 4] 4408 	dec	a
   6046 28 0A         [12] 4409 	jr	Z,00122$
                           4410 ;src/main.c:263: enemy.x+=1;
   6048 DD 7E FF      [19] 4411 	ld	a,-1 (ix)
   604B 3C            [ 4] 4412 	inc	a
   604C 32 18 6D      [13] 4413 	ld	(#_enemy),a
   604F C3 4E 61      [10] 4414 	jp	00137$
   6052                    4415 00122$:
                           4416 ;src/main.c:264: }else if(auxY < enemy.y){
   6052 DD 7E F6      [19] 4417 	ld	a,-10 (ix)
   6055 B7            [ 4] 4418 	or	a, a
   6056 28 30         [12] 4419 	jr	Z,00119$
                           4420 ;src/main.c:265: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   6058 DD 4E FA      [19] 4421 	ld	c,-6 (ix)
   605B DD 46 FB      [19] 4422 	ld	b,-5 (ix)
   605E DD 7E F7      [19] 4423 	ld	a,-9 (ix)
   6061 B7            [ 4] 4424 	or	a, a
   6062 28 06         [12] 4425 	jr	Z,00143$
   6064 DD 4E F8      [19] 4426 	ld	c,-8 (ix)
   6067 DD 46 F9      [19] 4427 	ld	b,-7 (ix)
   606A                    4428 00143$:
   606A CB 28         [ 8] 4429 	sra	b
   606C CB 19         [ 8] 4430 	rr	c
   606E CB 28         [ 8] 4431 	sra	b
   6070 CB 19         [ 8] 4432 	rr	c
   6072 DD 6E F2      [19] 4433 	ld	l,-14 (ix)
   6075 DD 66 F3      [19] 4434 	ld	h,-13 (ix)
   6078 09            [11] 4435 	add	hl,bc
   6079 7E            [ 7] 4436 	ld	a,(hl)
   607A 3D            [ 4] 4437 	dec	a
   607B CA 4E 61      [10] 4438 	jp	Z,00137$
                           4439 ;src/main.c:266: enemy.y-=1;
   607E 21 19 6D      [10] 4440 	ld	hl,#(_enemy + 0x0001)
   6081 DD 7E F5      [19] 4441 	ld	a,-11 (ix)
   6084 77            [ 7] 4442 	ld	(hl),a
   6085 C3 4E 61      [10] 4443 	jp	00137$
   6088                    4444 00119$:
                           4445 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   6088 DD 4E EC      [19] 4446 	ld	c,-20 (ix)
   608B DD 46 ED      [19] 4447 	ld	b,-19 (ix)
   608E DD 7E E8      [19] 4448 	ld	a,-24 (ix)
   6091 B7            [ 4] 4449 	or	a, a
   6092 28 06         [12] 4450 	jr	Z,00144$
   6094 DD 4E EA      [19] 4451 	ld	c,-22 (ix)
   6097 DD 46 EB      [19] 4452 	ld	b,-21 (ix)
   609A                    4453 00144$:
   609A CB 28         [ 8] 4454 	sra	b
   609C CB 19         [ 8] 4455 	rr	c
   609E CB 28         [ 8] 4456 	sra	b
   60A0 CB 19         [ 8] 4457 	rr	c
   60A2 CB 28         [ 8] 4458 	sra	b
   60A4 CB 19         [ 8] 4459 	rr	c
   60A6 CB 28         [ 8] 4460 	sra	b
   60A8 CB 19         [ 8] 4461 	rr	c
   60AA 69            [ 4] 4462 	ld	l, c
   60AB 60            [ 4] 4463 	ld	h, b
   60AC 29            [11] 4464 	add	hl, hl
   60AD 29            [11] 4465 	add	hl, hl
   60AE 09            [11] 4466 	add	hl, bc
   60AF 29            [11] 4467 	add	hl, hl
   60B0 29            [11] 4468 	add	hl, hl
   60B1 11 0A 6C      [10] 4469 	ld	de,#_scene
   60B4 19            [11] 4470 	add	hl,de
   60B5 DD 5E FC      [19] 4471 	ld	e,-4 (ix)
   60B8 16 00         [ 7] 4472 	ld	d,#0x00
   60BA 19            [11] 4473 	add	hl,de
   60BB 7E            [ 7] 4474 	ld	a,(hl)
   60BC 3D            [ 4] 4475 	dec	a
   60BD CA 4E 61      [10] 4476 	jp	Z,00137$
                           4477 ;src/main.c:269: enemy.y+=1;
   60C0 21 19 6D      [10] 4478 	ld	hl,#(_enemy + 0x0001)
   60C3 DD 7E F4      [19] 4479 	ld	a,-12 (ix)
   60C6 77            [ 7] 4480 	ld	(hl),a
   60C7 C3 4E 61      [10] 4481 	jp	00137$
   60CA                    4482 00132$:
                           4483 ;src/main.c:273: if(auxY < enemy.y){
   60CA DD 7E F6      [19] 4484 	ld	a,-10 (ix)
   60CD B7            [ 4] 4485 	or	a, a
   60CE 28 40         [12] 4486 	jr	Z,00129$
                           4487 ;src/main.c:274: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   60D0 DD 4E F0      [19] 4488 	ld	c,-16 (ix)
   60D3 DD 46 F1      [19] 4489 	ld	b,-15 (ix)
   60D6 DD 7E E9      [19] 4490 	ld	a,-23 (ix)
   60D9 B7            [ 4] 4491 	or	a, a
   60DA 28 06         [12] 4492 	jr	Z,00145$
   60DC DD 4E EE      [19] 4493 	ld	c,-18 (ix)
   60DF DD 46 EF      [19] 4494 	ld	b,-17 (ix)
   60E2                    4495 00145$:
   60E2 CB 28         [ 8] 4496 	sra	b
   60E4 CB 19         [ 8] 4497 	rr	c
   60E6 CB 28         [ 8] 4498 	sra	b
   60E8 CB 19         [ 8] 4499 	rr	c
   60EA CB 28         [ 8] 4500 	sra	b
   60EC CB 19         [ 8] 4501 	rr	c
   60EE CB 28         [ 8] 4502 	sra	b
   60F0 CB 19         [ 8] 4503 	rr	c
   60F2 69            [ 4] 4504 	ld	l, c
   60F3 60            [ 4] 4505 	ld	h, b
   60F4 29            [11] 4506 	add	hl, hl
   60F5 29            [11] 4507 	add	hl, hl
   60F6 09            [11] 4508 	add	hl, bc
   60F7 29            [11] 4509 	add	hl, hl
   60F8 29            [11] 4510 	add	hl, hl
   60F9 11 0A 6C      [10] 4511 	ld	de,#_scene
   60FC 19            [11] 4512 	add	hl,de
   60FD DD 5E FC      [19] 4513 	ld	e,-4 (ix)
   6100 16 00         [ 7] 4514 	ld	d,#0x00
   6102 19            [11] 4515 	add	hl,de
   6103 7E            [ 7] 4516 	ld	a,(hl)
   6104 3D            [ 4] 4517 	dec	a
   6105 28 47         [12] 4518 	jr	Z,00137$
                           4519 ;src/main.c:275: enemy.y-=1;
   6107 21 19 6D      [10] 4520 	ld	hl,#(_enemy + 0x0001)
   610A DD 7E F5      [19] 4521 	ld	a,-11 (ix)
   610D 77            [ 7] 4522 	ld	(hl),a
   610E 18 3E         [12] 4523 	jr	00137$
   6110                    4524 00129$:
                           4525 ;src/main.c:277: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   6110 DD 4E EC      [19] 4526 	ld	c,-20 (ix)
   6113 DD 46 ED      [19] 4527 	ld	b,-19 (ix)
   6116 DD 7E E8      [19] 4528 	ld	a,-24 (ix)
   6119 B7            [ 4] 4529 	or	a, a
   611A 28 06         [12] 4530 	jr	Z,00146$
   611C DD 4E EA      [19] 4531 	ld	c,-22 (ix)
   611F DD 46 EB      [19] 4532 	ld	b,-21 (ix)
   6122                    4533 00146$:
   6122 CB 28         [ 8] 4534 	sra	b
   6124 CB 19         [ 8] 4535 	rr	c
   6126 CB 28         [ 8] 4536 	sra	b
   6128 CB 19         [ 8] 4537 	rr	c
   612A CB 28         [ 8] 4538 	sra	b
   612C CB 19         [ 8] 4539 	rr	c
   612E CB 28         [ 8] 4540 	sra	b
   6130 CB 19         [ 8] 4541 	rr	c
   6132 69            [ 4] 4542 	ld	l, c
   6133 60            [ 4] 4543 	ld	h, b
   6134 29            [11] 4544 	add	hl, hl
   6135 29            [11] 4545 	add	hl, hl
   6136 09            [11] 4546 	add	hl, bc
   6137 29            [11] 4547 	add	hl, hl
   6138 29            [11] 4548 	add	hl, hl
   6139 11 0A 6C      [10] 4549 	ld	de,#_scene
   613C 19            [11] 4550 	add	hl,de
   613D DD 5E FC      [19] 4551 	ld	e,-4 (ix)
   6140 16 00         [ 7] 4552 	ld	d,#0x00
   6142 19            [11] 4553 	add	hl,de
   6143 7E            [ 7] 4554 	ld	a,(hl)
   6144 3D            [ 4] 4555 	dec	a
   6145 28 07         [12] 4556 	jr	Z,00137$
                           4557 ;src/main.c:278: enemy.y+=1;
   6147 21 19 6D      [10] 4558 	ld	hl,#(_enemy + 0x0001)
   614A DD 7E F4      [19] 4559 	ld	a,-12 (ix)
   614D 77            [ 7] 4560 	ld	(hl),a
   614E                    4561 00137$:
   614E DD F9         [10] 4562 	ld	sp, ix
   6150 DD E1         [14] 4563 	pop	ix
   6152 C9            [10] 4564 	ret
                           4565 ;src/main.c:294: void patrol(){
                           4566 ;	---------------------------------
                           4567 ; Function patrol
                           4568 ; ---------------------------------
   6153                    4569 _patrol::
   6153 DD E5         [15] 4570 	push	ix
   6155 DD 21 00 00   [14] 4571 	ld	ix,#0
   6159 DD 39         [15] 4572 	add	ix,sp
   615B 21 F4 FF      [10] 4573 	ld	hl,#-12
   615E 39            [11] 4574 	add	hl,sp
   615F F9            [ 6] 4575 	ld	sp,hl
                           4576 ;src/main.c:297: movement(enemy.dir);
   6160 3A 21 6D      [13] 4577 	ld	a, (#(_enemy + 0x0009) + 0)
   6163 F5            [11] 4578 	push	af
   6164 33            [ 6] 4579 	inc	sp
   6165 CD DD 4F      [17] 4580 	call	_movement
   6168 33            [ 6] 4581 	inc	sp
                           4582 ;src/main.c:299: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   6169 3A 19 6D      [13] 4583 	ld	a,(#_enemy + 1)
   616C DD 77 F6      [19] 4584 	ld	-10 (ix), a
   616F 07            [ 4] 4585 	rlca
   6170 07            [ 4] 4586 	rlca
   6171 07            [ 4] 4587 	rlca
   6172 07            [ 4] 4588 	rlca
   6173 E6 0F         [ 7] 4589 	and	a,#0x0F
   6175 4F            [ 4] 4590 	ld	c,a
   6176 06 00         [ 7] 4591 	ld	b,#0x00
   6178 69            [ 4] 4592 	ld	l, c
   6179 60            [ 4] 4593 	ld	h, b
   617A 29            [11] 4594 	add	hl, hl
   617B 29            [11] 4595 	add	hl, hl
   617C 09            [11] 4596 	add	hl, bc
   617D 29            [11] 4597 	add	hl, hl
   617E 29            [11] 4598 	add	hl, hl
   617F 3E 0A         [ 7] 4599 	ld	a,#<(_scene)
   6181 85            [ 4] 4600 	add	a, l
   6182 DD 77 F4      [19] 4601 	ld	-12 (ix),a
   6185 3E 6C         [ 7] 4602 	ld	a,#>(_scene)
   6187 8C            [ 4] 4603 	adc	a, h
   6188 DD 77 F5      [19] 4604 	ld	-11 (ix),a
   618B 3A 18 6D      [13] 4605 	ld	a,(#_enemy + 0)
   618E DD 77 FC      [19] 4606 	ld	-4 (ix), a
   6191 0F            [ 4] 4607 	rrca
   6192 0F            [ 4] 4608 	rrca
   6193 E6 3F         [ 7] 4609 	and	a,#0x3F
   6195 DD 77 F9      [19] 4610 	ld	-7 (ix),a
   6198 DD 7E F4      [19] 4611 	ld	a,-12 (ix)
   619B DD 86 F9      [19] 4612 	add	a, -7 (ix)
   619E 5F            [ 4] 4613 	ld	e,a
   619F DD 7E F5      [19] 4614 	ld	a,-11 (ix)
   61A2 CE 00         [ 7] 4615 	adc	a, #0x00
   61A4 57            [ 4] 4616 	ld	d,a
   61A5 3A 23 6D      [13] 4617 	ld	a,(#_enemy + 11)
   61A8 DD 77 FD      [19] 4618 	ld	-3 (ix),a
   61AB 1A            [ 7] 4619 	ld	a,(de)
   61AC 57            [ 4] 4620 	ld	d,a
   61AD DD 7E FD      [19] 4621 	ld	a,-3 (ix)
   61B0 92            [ 4] 4622 	sub	a, d
   61B1 C2 AD 62      [10] 4623 	jp	NZ,00106$
                           4624 ;src/main.c:300: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   61B4 DD 5E FC      [19] 4625 	ld	e,-4 (ix)
   61B7 16 00         [ 7] 4626 	ld	d,#0x00
   61B9 21 03 00      [10] 4627 	ld	hl,#0x0003
   61BC 19            [11] 4628 	add	hl,de
   61BD DD 75 F7      [19] 4629 	ld	-9 (ix),l
   61C0 DD 74 F8      [19] 4630 	ld	-8 (ix),h
   61C3 DD 7E F7      [19] 4631 	ld	a,-9 (ix)
   61C6 DD 77 FE      [19] 4632 	ld	-2 (ix),a
   61C9 DD 7E F8      [19] 4633 	ld	a,-8 (ix)
   61CC DD 77 FF      [19] 4634 	ld	-1 (ix),a
   61CF DD 7E F8      [19] 4635 	ld	a,-8 (ix)
   61D2 07            [ 4] 4636 	rlca
   61D3 E6 01         [ 7] 4637 	and	a,#0x01
   61D5 DD 77 FC      [19] 4638 	ld	-4 (ix),a
   61D8 21 06 00      [10] 4639 	ld	hl,#0x0006
   61DB 19            [11] 4640 	add	hl,de
   61DC DD 75 FA      [19] 4641 	ld	-6 (ix),l
   61DF DD 74 FB      [19] 4642 	ld	-5 (ix),h
   61E2 DD 7E FC      [19] 4643 	ld	a,-4 (ix)
   61E5 B7            [ 4] 4644 	or	a, a
   61E6 28 0C         [12] 4645 	jr	Z,00113$
   61E8 DD 7E FA      [19] 4646 	ld	a,-6 (ix)
   61EB DD 77 FE      [19] 4647 	ld	-2 (ix),a
   61EE DD 7E FB      [19] 4648 	ld	a,-5 (ix)
   61F1 DD 77 FF      [19] 4649 	ld	-1 (ix),a
   61F4                    4650 00113$:
   61F4 DD 6E FE      [19] 4651 	ld	l,-2 (ix)
   61F7 DD 66 FF      [19] 4652 	ld	h,-1 (ix)
   61FA CB 2C         [ 8] 4653 	sra	h
   61FC CB 1D         [ 8] 4654 	rr	l
   61FE CB 2C         [ 8] 4655 	sra	h
   6200 CB 1D         [ 8] 4656 	rr	l
   6202 D1            [10] 4657 	pop	de
   6203 D5            [11] 4658 	push	de
   6204 19            [11] 4659 	add	hl,de
   6205 DD 7E FD      [19] 4660 	ld	a,-3 (ix)
   6208 96            [ 7] 4661 	sub	a,(hl)
   6209 C2 AD 62      [10] 4662 	jp	NZ,00106$
                           4663 ;src/main.c:301: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   620C DD 5E F6      [19] 4664 	ld	e,-10 (ix)
   620F 16 00         [ 7] 4665 	ld	d,#0x00
   6211 21 0E 00      [10] 4666 	ld	hl,#0x000E
   6214 19            [11] 4667 	add	hl,de
   6215 4D            [ 4] 4668 	ld	c,l
   6216 44            [ 4] 4669 	ld	b,h
   6217 69            [ 4] 4670 	ld	l, c
   6218 78            [ 4] 4671 	ld	a,b
   6219 67            [ 4] 4672 	ld	h,a
   621A 07            [ 4] 4673 	rlca
   621B E6 01         [ 7] 4674 	and	a,#0x01
   621D DD 77 FE      [19] 4675 	ld	-2 (ix),a
   6220 7B            [ 4] 4676 	ld	a,e
   6221 C6 1D         [ 7] 4677 	add	a, #0x1D
   6223 DD 77 F4      [19] 4678 	ld	-12 (ix),a
   6226 7A            [ 4] 4679 	ld	a,d
   6227 CE 00         [ 7] 4680 	adc	a, #0x00
   6229 DD 77 F5      [19] 4681 	ld	-11 (ix),a
   622C DD 7E FE      [19] 4682 	ld	a,-2 (ix)
   622F B7            [ 4] 4683 	or	a, a
   6230 28 02         [12] 4684 	jr	Z,00114$
   6232 E1            [10] 4685 	pop	hl
   6233 E5            [11] 4686 	push	hl
   6234                    4687 00114$:
   6234 CB 2C         [ 8] 4688 	sra	h
   6236 CB 1D         [ 8] 4689 	rr	l
   6238 CB 2C         [ 8] 4690 	sra	h
   623A CB 1D         [ 8] 4691 	rr	l
   623C CB 2C         [ 8] 4692 	sra	h
   623E CB 1D         [ 8] 4693 	rr	l
   6240 CB 2C         [ 8] 4694 	sra	h
   6242 CB 1D         [ 8] 4695 	rr	l
   6244 5D            [ 4] 4696 	ld	e, l
   6245 54            [ 4] 4697 	ld	d, h
   6246 29            [11] 4698 	add	hl, hl
   6247 29            [11] 4699 	add	hl, hl
   6248 19            [11] 4700 	add	hl, de
   6249 29            [11] 4701 	add	hl, hl
   624A 29            [11] 4702 	add	hl, hl
   624B 11 0A 6C      [10] 4703 	ld	de,#_scene
   624E 19            [11] 4704 	add	hl,de
   624F DD 5E F9      [19] 4705 	ld	e,-7 (ix)
   6252 16 00         [ 7] 4706 	ld	d,#0x00
   6254 19            [11] 4707 	add	hl,de
   6255 DD 7E FD      [19] 4708 	ld	a,-3 (ix)
   6258 96            [ 7] 4709 	sub	a,(hl)
   6259 20 52         [12] 4710 	jr	NZ,00106$
                           4711 ;src/main.c:302: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   625B DD 7E FE      [19] 4712 	ld	a,-2 (ix)
   625E B7            [ 4] 4713 	or	a, a
   625F 28 02         [12] 4714 	jr	Z,00115$
   6261 C1            [10] 4715 	pop	bc
   6262 C5            [11] 4716 	push	bc
   6263                    4717 00115$:
   6263 CB 28         [ 8] 4718 	sra	b
   6265 CB 19         [ 8] 4719 	rr	c
   6267 CB 28         [ 8] 4720 	sra	b
   6269 CB 19         [ 8] 4721 	rr	c
   626B CB 28         [ 8] 4722 	sra	b
   626D CB 19         [ 8] 4723 	rr	c
   626F CB 28         [ 8] 4724 	sra	b
   6271 CB 19         [ 8] 4725 	rr	c
   6273 69            [ 4] 4726 	ld	l, c
   6274 60            [ 4] 4727 	ld	h, b
   6275 29            [11] 4728 	add	hl, hl
   6276 29            [11] 4729 	add	hl, hl
   6277 09            [11] 4730 	add	hl, bc
   6278 29            [11] 4731 	add	hl, hl
   6279 29            [11] 4732 	add	hl, hl
   627A 3E 0A         [ 7] 4733 	ld	a,#<(_scene)
   627C 85            [ 4] 4734 	add	a, l
   627D DD 77 FE      [19] 4735 	ld	-2 (ix),a
   6280 3E 6C         [ 7] 4736 	ld	a,#>(_scene)
   6282 8C            [ 4] 4737 	adc	a, h
   6283 DD 77 FF      [19] 4738 	ld	-1 (ix),a
   6286 DD 5E F7      [19] 4739 	ld	e,-9 (ix)
   6289 DD 56 F8      [19] 4740 	ld	d,-8 (ix)
   628C DD 7E FC      [19] 4741 	ld	a,-4 (ix)
   628F B7            [ 4] 4742 	or	a, a
   6290 28 06         [12] 4743 	jr	Z,00116$
   6292 DD 5E FA      [19] 4744 	ld	e,-6 (ix)
   6295 DD 56 FB      [19] 4745 	ld	d,-5 (ix)
   6298                    4746 00116$:
   6298 CB 2A         [ 8] 4747 	sra	d
   629A CB 1B         [ 8] 4748 	rr	e
   629C CB 2A         [ 8] 4749 	sra	d
   629E CB 1B         [ 8] 4750 	rr	e
   62A0 DD 6E FE      [19] 4751 	ld	l,-2 (ix)
   62A3 DD 66 FF      [19] 4752 	ld	h,-1 (ix)
   62A6 19            [11] 4753 	add	hl,de
   62A7 DD 7E FD      [19] 4754 	ld	a,-3 (ix)
   62AA 96            [ 7] 4755 	sub	a,(hl)
   62AB 28 3B         [12] 4756 	jr	Z,00111$
   62AD                    4757 00106$:
                           4758 ;src/main.c:304: switch(enemy.dir){
   62AD 3A 21 6D      [13] 4759 	ld	a,(#(_enemy + 0x0009) + 0)
   62B0 FE 02         [ 7] 4760 	cp	a,#0x02
   62B2 28 22         [12] 4761 	jr	Z,00103$
   62B4 FE 04         [ 7] 4762 	cp	a,#0x04
   62B6 28 0A         [12] 4763 	jr	Z,00101$
   62B8 FE 06         [ 7] 4764 	cp	a,#0x06
   62BA 28 10         [12] 4765 	jr	Z,00102$
   62BC D6 08         [ 7] 4766 	sub	a, #0x08
   62BE 28 20         [12] 4767 	jr	Z,00104$
   62C0 18 26         [12] 4768 	jr	00111$
                           4769 ;src/main.c:305: case 4:
   62C2                    4770 00101$:
                           4771 ;src/main.c:306: movement(6);
   62C2 3E 06         [ 7] 4772 	ld	a,#0x06
   62C4 F5            [11] 4773 	push	af
   62C5 33            [ 6] 4774 	inc	sp
   62C6 CD DD 4F      [17] 4775 	call	_movement
   62C9 33            [ 6] 4776 	inc	sp
                           4777 ;src/main.c:307: break;
   62CA 18 1C         [12] 4778 	jr	00111$
                           4779 ;src/main.c:308: case 6:
   62CC                    4780 00102$:
                           4781 ;src/main.c:309: movement(4);
   62CC 3E 04         [ 7] 4782 	ld	a,#0x04
   62CE F5            [11] 4783 	push	af
   62CF 33            [ 6] 4784 	inc	sp
   62D0 CD DD 4F      [17] 4785 	call	_movement
   62D3 33            [ 6] 4786 	inc	sp
                           4787 ;src/main.c:310: break;
   62D4 18 12         [12] 4788 	jr	00111$
                           4789 ;src/main.c:311: case 2:
   62D6                    4790 00103$:
                           4791 ;src/main.c:312: movement(8);
   62D6 3E 08         [ 7] 4792 	ld	a,#0x08
   62D8 F5            [11] 4793 	push	af
   62D9 33            [ 6] 4794 	inc	sp
   62DA CD DD 4F      [17] 4795 	call	_movement
   62DD 33            [ 6] 4796 	inc	sp
                           4797 ;src/main.c:313: break;
   62DE 18 08         [12] 4798 	jr	00111$
                           4799 ;src/main.c:314: case 8:
   62E0                    4800 00104$:
                           4801 ;src/main.c:315: movement(2);
   62E0 3E 02         [ 7] 4802 	ld	a,#0x02
   62E2 F5            [11] 4803 	push	af
   62E3 33            [ 6] 4804 	inc	sp
   62E4 CD DD 4F      [17] 4805 	call	_movement
   62E7 33            [ 6] 4806 	inc	sp
                           4807 ;src/main.c:317: }
   62E8                    4808 00111$:
   62E8 DD F9         [10] 4809 	ld	sp, ix
   62EA DD E1         [14] 4810 	pop	ix
   62EC C9            [10] 4811 	ret
                           4812 ;src/main.c:322: u8 vissionSensor(){
                           4813 ;	---------------------------------
                           4814 ; Function vissionSensor
                           4815 ; ---------------------------------
   62ED                    4816 _vissionSensor::
   62ED DD E5         [15] 4817 	push	ix
   62EF DD 21 00 00   [14] 4818 	ld	ix,#0
   62F3 DD 39         [15] 4819 	add	ix,sp
   62F5 21 F9 FF      [10] 4820 	ld	hl,#-7
   62F8 39            [11] 4821 	add	hl,sp
   62F9 F9            [ 6] 4822 	ld	sp,hl
                           4823 ;src/main.c:323: u8 following = 0;
   62FA DD 36 FC 00   [19] 4824 	ld	-4 (ix),#0x00
                           4825 ;src/main.c:324: u8 cx = enemy.x/tilewidth;
   62FE 3A 18 6D      [13] 4826 	ld	a, (#_enemy + 0)
   6301 0F            [ 4] 4827 	rrca
   6302 0F            [ 4] 4828 	rrca
   6303 E6 3F         [ 7] 4829 	and	a,#0x3F
   6305 DD 77 FB      [19] 4830 	ld	-5 (ix),a
                           4831 ;src/main.c:325: u8 cy = enemy.y/tilewidth;
   6308 3A 19 6D      [13] 4832 	ld	a, (#(_enemy + 0x0001) + 0)
   630B 0F            [ 4] 4833 	rrca
   630C 0F            [ 4] 4834 	rrca
   630D E6 3F         [ 7] 4835 	and	a,#0x3F
   630F 4F            [ 4] 4836 	ld	c,a
                           4837 ;src/main.c:326: u8 pcx = player.x/tilewidth;
   6310 3A 0D 6D      [13] 4838 	ld	a, (#_player + 0)
   6313 0F            [ 4] 4839 	rrca
   6314 0F            [ 4] 4840 	rrca
   6315 E6 3F         [ 7] 4841 	and	a,#0x3F
   6317 DD 77 FE      [19] 4842 	ld	-2 (ix),a
                           4843 ;src/main.c:327: u8 pcy = player.y/tilewidth;
   631A 3A 0E 6D      [13] 4844 	ld	a, (#(_player + 0x0001) + 0)
   631D 0F            [ 4] 4845 	rrca
   631E 0F            [ 4] 4846 	rrca
   631F E6 3F         [ 7] 4847 	and	a,#0x3F
   6321 DD 77 FF      [19] 4848 	ld	-1 (ix),a
                           4849 ;src/main.c:330: for(i=0;i<3;i++){
   6324 1E 00         [ 7] 4850 	ld	e,#0x00
   6326                    4851 00107$:
                           4852 ;src/main.c:331: lex = cx - i;
   6326 DD 7E FB      [19] 4853 	ld	a,-5 (ix)
   6329 93            [ 4] 4854 	sub	a, e
   632A DD 77 FA      [19] 4855 	ld	-6 (ix),a
                           4856 ;src/main.c:332: ley = cy - i;
   632D 79            [ 4] 4857 	ld	a,c
   632E 93            [ 4] 4858 	sub	a, e
   632F DD 77 FD      [19] 4859 	ld	-3 (ix),a
                           4860 ;src/main.c:333: mex = cx + i;
   6332 DD 7E FB      [19] 4861 	ld	a,-5 (ix)
   6335 83            [ 4] 4862 	add	a, e
   6336 DD 77 F9      [19] 4863 	ld	-7 (ix),a
                           4864 ;src/main.c:334: mey = cy + i;
   6339 79            [ 4] 4865 	ld	a,c
   633A 83            [ 4] 4866 	add	a, e
   633B 57            [ 4] 4867 	ld	d,a
                           4868 ;src/main.c:335: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
   633C DD 7E FA      [19] 4869 	ld	a,-6 (ix)
   633F DD 96 FE      [19] 4870 	sub	a, -2 (ix)
   6342 28 16         [12] 4871 	jr	Z,00101$
   6344 DD 7E FD      [19] 4872 	ld	a,-3 (ix)
   6347 DD 96 FF      [19] 4873 	sub	a, -1 (ix)
   634A 28 0E         [12] 4874 	jr	Z,00101$
   634C DD 7E F9      [19] 4875 	ld	a,-7 (ix)
   634F DD 96 FE      [19] 4876 	sub	a, -2 (ix)
   6352 28 06         [12] 4877 	jr	Z,00101$
   6354 DD 7E FF      [19] 4878 	ld	a,-1 (ix)
   6357 92            [ 4] 4879 	sub	a, d
   6358 20 04         [12] 4880 	jr	NZ,00108$
   635A                    4881 00101$:
                           4882 ;src/main.c:336: following = 1;
   635A DD 36 FC 01   [19] 4883 	ld	-4 (ix),#0x01
   635E                    4884 00108$:
                           4885 ;src/main.c:330: for(i=0;i<3;i++){
   635E 1C            [ 4] 4886 	inc	e
   635F 7B            [ 4] 4887 	ld	a,e
   6360 D6 03         [ 7] 4888 	sub	a, #0x03
   6362 38 C2         [12] 4889 	jr	C,00107$
                           4890 ;src/main.c:340: return following;
   6364 DD 6E FC      [19] 4891 	ld	l,-4 (ix)
   6367 DD F9         [10] 4892 	ld	sp, ix
   6369 DD E1         [14] 4893 	pop	ix
   636B C9            [10] 4894 	ret
                           4895 ;src/main.c:345: void move(){
                           4896 ;	---------------------------------
                           4897 ; Function move
                           4898 ; ---------------------------------
   636C                    4899 _move::
                           4900 ;src/main.c:346: if(temp > 10){
   636C 3E 0A         [ 7] 4901 	ld	a,#0x0A
   636E FD 21 FA 6C   [14] 4902 	ld	iy,#_temp
   6372 FD BE 00      [19] 4903 	cp	a, 0 (iy)
   6375 3E 00         [ 7] 4904 	ld	a,#0x00
   6377 FD 21 FA 6C   [14] 4905 	ld	iy,#_temp
   637B FD 9E 01      [19] 4906 	sbc	a, 1 (iy)
   637E E2 83 63      [10] 4907 	jp	PO, 00153$
   6381 EE 80         [ 7] 4908 	xor	a, #0x80
   6383                    4909 00153$:
   6383 F2 CB 63      [10] 4910 	jp	P,00114$
                           4911 ;src/main.c:347: enemy.dir = chooseDirection();
   6386 CD 6E 4F      [17] 4912 	call	_chooseDirection
   6389 7D            [ 4] 4913 	ld	a,l
   638A 21 21 6D      [10] 4914 	ld	hl,#(_enemy + 0x0009)
   638D 77            [ 7] 4915 	ld	(hl),a
                           4916 ;src/main.c:348: following = detectPlayerRoom(player.x,player.y);
   638E 3A 0E 6D      [13] 4917 	ld	a, (#_player + 1)
   6391 21 0D 6D      [10] 4918 	ld	hl, #_player + 0
   6394 56            [ 7] 4919 	ld	d,(hl)
   6395 F5            [11] 4920 	push	af
   6396 33            [ 6] 4921 	inc	sp
   6397 D5            [11] 4922 	push	de
   6398 33            [ 6] 4923 	inc	sp
   6399 CD 41 4F      [17] 4924 	call	_detectPlayerRoom
   639C F1            [10] 4925 	pop	af
   639D FD 21 00 6D   [14] 4926 	ld	iy,#_following
   63A1 FD 75 00      [19] 4927 	ld	0 (iy),l
                           4928 ;src/main.c:349: if(following == enemy.room || enemy.pursue != 0){
   63A4 21 23 6D      [10] 4929 	ld	hl, #_enemy + 11
   63A7 56            [ 7] 4930 	ld	d,(hl)
   63A8 01 26 6D      [10] 4931 	ld	bc,#_enemy + 14
   63AB 0A            [ 7] 4932 	ld	a,(bc)
   63AC 5F            [ 4] 4933 	ld	e,a
   63AD 3A 00 6D      [13] 4934 	ld	a,(#_following + 0)
   63B0 92            [ 4] 4935 	sub	a, d
   63B1 28 04         [12] 4936 	jr	Z,00104$
   63B3 7B            [ 4] 4937 	ld	a,e
   63B4 B7            [ 4] 4938 	or	a, a
   63B5 28 0C         [12] 4939 	jr	Z,00105$
   63B7                    4940 00104$:
                           4941 ;src/main.c:350: if(enemy.pursue == 0)
   63B7 7B            [ 4] 4942 	ld	a,e
   63B8 B7            [ 4] 4943 	or	a, a
   63B9 20 05         [12] 4944 	jr	NZ,00102$
                           4945 ;src/main.c:351: enemy.pursue = 1;
   63BB 3E 01         [ 7] 4946 	ld	a,#0x01
   63BD 02            [ 7] 4947 	ld	(bc),a
   63BE 18 03         [12] 4948 	jr	00105$
   63C0                    4949 00102$:
                           4950 ;src/main.c:353: enemy.pursue -=1;
   63C0 1D            [ 4] 4951 	dec	e
   63C1 7B            [ 4] 4952 	ld	a,e
   63C2 02            [ 7] 4953 	ld	(bc),a
   63C3                    4954 00105$:
                           4955 ;src/main.c:355: temp = 0;
   63C3 21 00 00      [10] 4956 	ld	hl,#0x0000
   63C6 22 FA 6C      [16] 4957 	ld	(_temp),hl
   63C9 18 2C         [12] 4958 	jr	00115$
   63CB                    4959 00114$:
                           4960 ;src/main.c:357: if(enemy.pursue >= 1){
   63CB 3A 26 6D      [13] 4961 	ld	a,(#(_enemy + 0x000e) + 0)
   63CE D6 01         [ 7] 4962 	sub	a, #0x01
   63D0 38 22         [12] 4963 	jr	C,00111$
                           4964 ;src/main.c:358: followPlayer();
   63D2 CD 3B 5E      [17] 4965 	call	_followPlayer
                           4966 ;src/main.c:359: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   63D5 21 24 6D      [10] 4967 	ld	hl, #_enemy + 12
   63D8 56            [ 7] 4968 	ld	d,(hl)
   63D9 21 18 6D      [10] 4969 	ld	hl, #_enemy + 0
   63DC 5E            [ 7] 4970 	ld	e,(hl)
   63DD 7A            [ 4] 4971 	ld	a,d
   63DE 93            [ 4] 4972 	sub	a, e
   63DF 20 16         [12] 4973 	jr	NZ,00115$
   63E1 21 25 6D      [10] 4974 	ld	hl, #_enemy + 13
   63E4 56            [ 7] 4975 	ld	d,(hl)
   63E5 21 19 6D      [10] 4976 	ld	hl, #_enemy + 1
   63E8 5E            [ 7] 4977 	ld	e,(hl)
   63E9 7A            [ 4] 4978 	ld	a,d
   63EA 93            [ 4] 4979 	sub	a, e
   63EB 20 0A         [12] 4980 	jr	NZ,00115$
                           4981 ;src/main.c:360: enemy.pursue = 0;
   63ED 21 26 6D      [10] 4982 	ld	hl,#(_enemy + 0x000e)
   63F0 36 00         [10] 4983 	ld	(hl),#0x00
   63F2 18 03         [12] 4984 	jr	00115$
   63F4                    4985 00111$:
                           4986 ;src/main.c:362: patrol();
   63F4 CD 53 61      [17] 4987 	call	_patrol
   63F7                    4988 00115$:
                           4989 ;src/main.c:365: if((detectPlayerRoom(enemy.lx,enemy.ly) != detectPlayerRoom(player.x,player.y)) && enemy.pursue != 0){
   63F7 21 1B 6D      [10] 4990 	ld	hl, #_enemy + 3
   63FA 56            [ 7] 4991 	ld	d,(hl)
   63FB 3A 1A 6D      [13] 4992 	ld	a, (#_enemy + 2)
   63FE D5            [11] 4993 	push	de
   63FF 33            [ 6] 4994 	inc	sp
   6400 F5            [11] 4995 	push	af
   6401 33            [ 6] 4996 	inc	sp
   6402 CD 41 4F      [17] 4997 	call	_detectPlayerRoom
   6405 F1            [10] 4998 	pop	af
   6406 55            [ 4] 4999 	ld	d,l
   6407 3A 0E 6D      [13] 5000 	ld	a, (#(_player + 0x0001) + 0)
   640A 21 0D 6D      [10] 5001 	ld	hl, #_player + 0
   640D 46            [ 7] 5002 	ld	b,(hl)
   640E D5            [11] 5003 	push	de
   640F F5            [11] 5004 	push	af
   6410 33            [ 6] 5005 	inc	sp
   6411 C5            [11] 5006 	push	bc
   6412 33            [ 6] 5007 	inc	sp
   6413 CD 41 4F      [17] 5008 	call	_detectPlayerRoom
   6416 F1            [10] 5009 	pop	af
   6417 45            [ 4] 5010 	ld	b,l
   6418 D1            [10] 5011 	pop	de
   6419 7A            [ 4] 5012 	ld	a,d
   641A 90            [ 4] 5013 	sub	a, b
   641B 28 14         [12] 5014 	jr	Z,00117$
   641D 3A 26 6D      [13] 5015 	ld	a, (#_enemy + 14)
   6420 B7            [ 4] 5016 	or	a, a
   6421 28 0E         [12] 5017 	jr	Z,00117$
                           5018 ;src/main.c:366: enemy.seenX = player.x;
   6423 11 24 6D      [10] 5019 	ld	de,#_enemy + 12
   6426 3A 0D 6D      [13] 5020 	ld	a, (#_player + 0)
   6429 12            [ 7] 5021 	ld	(de),a
                           5022 ;src/main.c:367: enemy.seenY = player.y;
   642A 11 25 6D      [10] 5023 	ld	de,#_enemy + 13
   642D 3A 0E 6D      [13] 5024 	ld	a, (#(_player + 0x0001) + 0)
   6430 12            [ 7] 5025 	ld	(de),a
   6431                    5026 00117$:
                           5027 ;src/main.c:369: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   6431 3A 19 6D      [13] 5028 	ld	a, (#_enemy + 1)
   6434 21 18 6D      [10] 5029 	ld	hl, #_enemy + 0
   6437 56            [ 7] 5030 	ld	d,(hl)
   6438 F5            [11] 5031 	push	af
   6439 33            [ 6] 5032 	inc	sp
   643A D5            [11] 5033 	push	de
   643B 33            [ 6] 5034 	inc	sp
   643C CD 41 4F      [17] 5035 	call	_detectPlayerRoom
   643F F1            [10] 5036 	pop	af
   6440 7D            [ 4] 5037 	ld	a,l
   6441 32 23 6D      [13] 5038 	ld	(#(_enemy + 0x000b)),a
                           5039 ;src/main.c:370: temp += 1;
   6444 21 FA 6C      [10] 5040 	ld	hl, #_temp+0
   6447 34            [11] 5041 	inc	(hl)
   6448 C0            [11] 5042 	ret	NZ
   6449 21 FB 6C      [10] 5043 	ld	hl, #_temp+1
   644C 34            [11] 5044 	inc	(hl)
   644D C9            [10] 5045 	ret
                           5046 ;src/main.c:375: void game(){
                           5047 ;	---------------------------------
                           5048 ; Function game
                           5049 ; ---------------------------------
   644E                    5050 _game::
   644E DD E5         [15] 5051 	push	ix
   6450 DD 21 00 00   [14] 5052 	ld	ix,#0
   6454 DD 39         [15] 5053 	add	ix,sp
   6456 21 F5 FF      [10] 5054 	ld	hl,#-11
   6459 39            [11] 5055 	add	hl,sp
   645A F9            [ 6] 5056 	ld	sp,hl
                           5057 ;src/main.c:376: TNivel n = {0,0,0};
   645B 21 00 00      [10] 5058 	ld	hl,#0x0000
   645E 39            [11] 5059 	add	hl,sp
   645F 36 00         [10] 5060 	ld	(hl),#0x00
   6461 21 00 00      [10] 5061 	ld	hl,#0x0000
   6464 39            [11] 5062 	add	hl,sp
   6465 5D            [ 4] 5063 	ld	e, l
   6466 54            [ 4] 5064 	ld	d, h
   6467 23            [ 6] 5065 	inc	hl
   6468 DD 75 FA      [19] 5066 	ld	-6 (ix),l
   646B DD 74 FB      [19] 5067 	ld	-5 (ix),h
   646E DD 6E FA      [19] 5068 	ld	l,-6 (ix)
   6471 DD 66 FB      [19] 5069 	ld	h,-5 (ix)
   6474 36 00         [10] 5070 	ld	(hl),#0x00
   6476 13            [ 6] 5071 	inc	de
   6477 13            [ 6] 5072 	inc	de
   6478 DD 73 FC      [19] 5073 	ld	-4 (ix),e
   647B DD 72 FD      [19] 5074 	ld	-3 (ix),d
   647E DD 6E FC      [19] 5075 	ld	l,-4 (ix)
   6481 DD 66 FD      [19] 5076 	ld	h,-3 (ix)
   6484 36 00         [10] 5077 	ld	(hl),#0x00
                           5078 ;src/main.c:377: bound =0;
   6486 21 01 6D      [10] 5079 	ld	hl,#_bound + 0
   6489 36 00         [10] 5080 	ld	(hl), #0x00
                           5081 ;src/main.c:378: temp = 0;
   648B 21 00 00      [10] 5082 	ld	hl,#0x0000
   648E 22 FA 6C      [16] 5083 	ld	(_temp),hl
                           5084 ;src/main.c:379: map = 1;
   6491 21 FC 6C      [10] 5085 	ld	hl,#_map + 0
   6494 36 01         [10] 5086 	ld	(hl), #0x01
                           5087 ;src/main.c:380: arrow =0;
   6496 21 FF 6C      [10] 5088 	ld	hl,#_arrow + 0
   6499 36 00         [10] 5089 	ld	(hl), #0x00
                           5090 ;src/main.c:381: finish =0;
   649B 21 FE 6C      [10] 5091 	ld	hl,#_finish + 0
   649E 36 00         [10] 5092 	ld	(hl), #0x00
                           5093 ;src/main.c:382: following =0;
   64A0 21 00 6D      [10] 5094 	ld	hl,#_following + 0
   64A3 36 00         [10] 5095 	ld	(hl), #0x00
                           5096 ;src/main.c:383: archer = 0;
   64A5 21 02 6D      [10] 5097 	ld	hl,#_archer + 0
   64A8 36 00         [10] 5098 	ld	(hl), #0x00
                           5099 ;src/main.c:385: initPlayer();
   64AA CD F5 53      [17] 5100 	call	_initPlayer
                           5101 ;src/main.c:386: initEnemies();
   64AD CD 2B 54      [17] 5102 	call	_initEnemies
                           5103 ;src/main.c:388: cpct_clearScreen(0);
   64B0 21 00 40      [10] 5104 	ld	hl,#0x4000
   64B3 E5            [11] 5105 	push	hl
   64B4 AF            [ 4] 5106 	xor	a, a
   64B5 F5            [11] 5107 	push	af
   64B6 33            [ 6] 5108 	inc	sp
   64B7 26 C0         [ 7] 5109 	ld	h, #0xC0
   64B9 E5            [11] 5110 	push	hl
   64BA CD 21 6A      [17] 5111 	call	_cpct_memset
                           5112 ;src/main.c:389: drawMap(map);
   64BD 3A FC 6C      [13] 5113 	ld	a,(_map)
   64C0 F5            [11] 5114 	push	af
   64C1 33            [ 6] 5115 	inc	sp
   64C2 CD C0 46      [17] 5116 	call	_drawMap
   64C5 33            [ 6] 5117 	inc	sp
                           5118 ;src/main.c:395: while (1){
   64C6 DD 7E FC      [19] 5119 	ld	a,-4 (ix)
   64C9 DD 77 F8      [19] 5120 	ld	-8 (ix),a
   64CC DD 7E FD      [19] 5121 	ld	a,-3 (ix)
   64CF DD 77 F9      [19] 5122 	ld	-7 (ix),a
   64D2 DD 7E FA      [19] 5123 	ld	a,-6 (ix)
   64D5 DD 77 FE      [19] 5124 	ld	-2 (ix),a
   64D8 DD 7E FB      [19] 5125 	ld	a,-5 (ix)
   64DB DD 77 FF      [19] 5126 	ld	-1 (ix),a
   64DE                    5127 00112$:
                           5128 ;src/main.c:398: cpct_waitVSYNC();
   64DE CD 07 6A      [17] 5129 	call	_cpct_waitVSYNC
                           5130 ;src/main.c:401: erases();
   64E1 CD 4E 4D      [17] 5131 	call	_erases
                           5132 ;src/main.c:404: drawPickUps(n.corazon,n.bullet);
   64E4 DD 6E FC      [19] 5133 	ld	l,-4 (ix)
   64E7 DD 66 FD      [19] 5134 	ld	h,-3 (ix)
   64EA 46            [ 7] 5135 	ld	b,(hl)
   64EB DD 6E FA      [19] 5136 	ld	l,-6 (ix)
   64EE DD 66 FB      [19] 5137 	ld	h,-5 (ix)
   64F1 4E            [ 7] 5138 	ld	c, (hl)
   64F2 C5            [11] 5139 	push	bc
   64F3 CD D9 4E      [17] 5140 	call	_drawPickUps
   64F6 F1            [10] 5141 	pop	af
                           5142 ;src/main.c:407: draws();
   64F7 CD AE 4C      [17] 5143 	call	_draws
                           5144 ;src/main.c:410: if(player.atk < 20) drawFatiga(player.atk,2);
   64FA 21 15 6D      [10] 5145 	ld	hl, #(_player + 0x0008) + 0
   64FD 56            [ 7] 5146 	ld	d,(hl)
   64FE 7A            [ 4] 5147 	ld	a,d
   64FF D6 14         [ 7] 5148 	sub	a, #0x14
   6501 30 0C         [12] 5149 	jr	NC,00105$
   6503 3E 02         [ 7] 5150 	ld	a,#0x02
   6505 F5            [11] 5151 	push	af
   6506 33            [ 6] 5152 	inc	sp
   6507 D5            [11] 5153 	push	de
   6508 33            [ 6] 5154 	inc	sp
   6509 CD B3 4D      [17] 5155 	call	_drawFatiga
   650C F1            [10] 5156 	pop	af
   650D 18 1A         [12] 5157 	jr	00106$
   650F                    5158 00105$:
                           5159 ;src/main.c:411: else if(player.atk > 20) drawFatiga(player.atk,1);
   650F 3E 14         [ 7] 5160 	ld	a,#0x14
   6511 92            [ 4] 5161 	sub	a, d
   6512 30 0C         [12] 5162 	jr	NC,00102$
   6514 3E 01         [ 7] 5163 	ld	a,#0x01
   6516 F5            [11] 5164 	push	af
   6517 33            [ 6] 5165 	inc	sp
   6518 D5            [11] 5166 	push	de
   6519 33            [ 6] 5167 	inc	sp
   651A CD B3 4D      [17] 5168 	call	_drawFatiga
   651D F1            [10] 5169 	pop	af
   651E 18 09         [12] 5170 	jr	00106$
   6520                    5171 00102$:
                           5172 ;src/main.c:412: else drawFatiga(player.atk,0);
   6520 AF            [ 4] 5173 	xor	a, a
   6521 F5            [11] 5174 	push	af
   6522 33            [ 6] 5175 	inc	sp
   6523 D5            [11] 5176 	push	de
   6524 33            [ 6] 5177 	inc	sp
   6525 CD B3 4D      [17] 5178 	call	_drawFatiga
   6528 F1            [10] 5179 	pop	af
   6529                    5180 00106$:
                           5181 ;src/main.c:415: player.lx = player.x;
   6529 3A 0D 6D      [13] 5182 	ld	a, (#_player + 0)
   652C 21 0F 6D      [10] 5183 	ld	hl,#(_player + 0x0002)
   652F 77            [ 7] 5184 	ld	(hl),a
                           5185 ;src/main.c:416: player.ly = player.y;
   6530 3A 0E 6D      [13] 5186 	ld	a, (#_player + 1)
   6533 32 10 6D      [13] 5187 	ld	(#(_player + 0x0003)),a
                           5188 ;src/main.c:417: enemy.lx = enemy.x;
   6536 3A 18 6D      [13] 5189 	ld	a, (#_enemy + 0)
   6539 32 1A 6D      [13] 5190 	ld	(#(_enemy + 0x0002)),a
                           5191 ;src/main.c:418: enemy.ly = enemy.y;
   653C 3A 19 6D      [13] 5192 	ld	a, (#_enemy + 1)
   653F 21 1B 6D      [10] 5193 	ld	hl,#(_enemy + 0x0003)
   6542 77            [ 7] 5194 	ld	(hl),a
                           5195 ;src/main.c:419: player.latk = player.atk;
   6543 3A 15 6D      [13] 5196 	ld	a, (#(_player + 0x0008) + 0)
   6546 32 16 6D      [13] 5197 	ld	(#(_player + 0x0009)),a
                           5198 ;src/main.c:424: cpct_scanKeyboard_f();
   6549 CD 52 67      [17] 5199 	call	_cpct_scanKeyboard_f
                           5200 ;src/main.c:425: player.sprite = checkKeyboard();
   654C CD 24 51      [17] 5201 	call	_checkKeyboard
   654F 5D            [ 4] 5202 	ld	e,l
   6550 54            [ 4] 5203 	ld	d,h
   6551 ED 53 11 6D   [20] 5204 	ld	((_player + 0x0004)), de
                           5205 ;src/main.c:426: checkBoundsCollisions(&n.corazon,&n.bullet);
   6555 DD 5E F8      [19] 5206 	ld	e,-8 (ix)
   6558 DD 56 F9      [19] 5207 	ld	d,-7 (ix)
   655B DD 6E FE      [19] 5208 	ld	l,-2 (ix)
   655E DD 66 FF      [19] 5209 	ld	h,-1 (ix)
   6561 D5            [11] 5210 	push	de
   6562 E5            [11] 5211 	push	hl
   6563 CD 07 59      [17] 5212 	call	_checkBoundsCollisions
   6566 F1            [10] 5213 	pop	af
   6567 F1            [10] 5214 	pop	af
                           5215 ;src/main.c:428: move();
   6568 CD 6C 63      [17] 5216 	call	_move
                           5217 ;src/main.c:430: if(arrow == 1){
   656B 3A FF 6C      [13] 5218 	ld	a,(#_arrow + 0)
   656E 3D            [ 4] 5219 	dec	a
   656F 20 0D         [12] 5220 	jr	NZ,00108$
                           5221 ;src/main.c:431: moveObject();
   6571 CD 9B 53      [17] 5222 	call	_moveObject
                           5223 ;src/main.c:432: bound = checkArrowCollisions();
   6574 CD D8 5C      [17] 5224 	call	_checkArrowCollisions
   6577 FD 21 01 6D   [14] 5225 	ld	iy,#_bound
   657B FD 75 00      [19] 5226 	ld	0 (iy),l
   657E                    5227 00108$:
                           5228 ;src/main.c:437: if(finish == 1) return;
   657E 3A FE 6C      [13] 5229 	ld	a,(#_finish + 0)
   6581 3D            [ 4] 5230 	dec	a
   6582 C2 DE 64      [10] 5231 	jp	NZ,00112$
   6585 DD F9         [10] 5232 	ld	sp, ix
   6587 DD E1         [14] 5233 	pop	ix
   6589 C9            [10] 5234 	ret
                           5235 ;src/main.c:444: void credits(){
                           5236 ;	---------------------------------
                           5237 ; Function credits
                           5238 ; ---------------------------------
   658A                    5239 _credits::
                           5240 ;src/main.c:446: cpct_clearScreen(0);
   658A 21 00 40      [10] 5241 	ld	hl,#0x4000
   658D E5            [11] 5242 	push	hl
   658E AF            [ 4] 5243 	xor	a, a
   658F F5            [11] 5244 	push	af
   6590 33            [ 6] 5245 	inc	sp
   6591 26 C0         [ 7] 5246 	ld	h, #0xC0
   6593 E5            [11] 5247 	push	hl
   6594 CD 21 6A      [17] 5248 	call	_cpct_memset
                           5249 ;src/main.c:447: memptr = cpct_getScreenPtr(VMEM,10,10);
   6597 21 0A 0A      [10] 5250 	ld	hl,#0x0A0A
   659A E5            [11] 5251 	push	hl
   659B 21 00 C0      [10] 5252 	ld	hl,#0xC000
   659E E5            [11] 5253 	push	hl
   659F CD 14 6B      [17] 5254 	call	_cpct_getScreenPtr
                           5255 ;src/main.c:448: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   65A2 EB            [ 4] 5256 	ex	de,hl
   65A3 01 EC 65      [10] 5257 	ld	bc,#___str_5
   65A6 D5            [11] 5258 	push	de
   65A7 21 01 00      [10] 5259 	ld	hl,#0x0001
   65AA E5            [11] 5260 	push	hl
   65AB D5            [11] 5261 	push	de
   65AC C5            [11] 5262 	push	bc
   65AD CD 33 68      [17] 5263 	call	_cpct_drawStringM0
   65B0 21 06 00      [10] 5264 	ld	hl,#6
   65B3 39            [11] 5265 	add	hl,sp
   65B4 F9            [ 6] 5266 	ld	sp,hl
   65B5 D1            [10] 5267 	pop	de
                           5268 ;src/main.c:450: while (1){
   65B6                    5269 00104$:
                           5270 ;src/main.c:452: cpct_scanKeyboard_f();
   65B6 D5            [11] 5271 	push	de
   65B7 CD 52 67      [17] 5272 	call	_cpct_scanKeyboard_f
   65BA D1            [10] 5273 	pop	de
                           5274 ;src/main.c:453: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   65BB 01 FD 65      [10] 5275 	ld	bc,#___str_6
   65BE D5            [11] 5276 	push	de
   65BF 21 01 00      [10] 5277 	ld	hl,#0x0001
   65C2 E5            [11] 5278 	push	hl
   65C3 D5            [11] 5279 	push	de
   65C4 C5            [11] 5280 	push	bc
   65C5 CD 33 68      [17] 5281 	call	_cpct_drawStringM0
   65C8 21 06 00      [10] 5282 	ld	hl,#6
   65CB 39            [11] 5283 	add	hl,sp
   65CC F9            [ 6] 5284 	ld	sp,hl
   65CD D1            [10] 5285 	pop	de
                           5286 ;src/main.c:454: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   65CE 01 13 66      [10] 5287 	ld	bc,#___str_7
   65D1 D5            [11] 5288 	push	de
   65D2 21 01 00      [10] 5289 	ld	hl,#0x0001
   65D5 E5            [11] 5290 	push	hl
   65D6 D5            [11] 5291 	push	de
   65D7 C5            [11] 5292 	push	bc
   65D8 CD 33 68      [17] 5293 	call	_cpct_drawStringM0
   65DB 21 06 00      [10] 5294 	ld	hl,#6
   65DE 39            [11] 5295 	add	hl,sp
   65DF F9            [ 6] 5296 	ld	sp,hl
   65E0 21 08 04      [10] 5297 	ld	hl,#0x0408
   65E3 CD 46 67      [17] 5298 	call	_cpct_isKeyPressed
   65E6 7D            [ 4] 5299 	ld	a,l
   65E7 D1            [10] 5300 	pop	de
   65E8 B7            [ 4] 5301 	or	a, a
   65E9 28 CB         [12] 5302 	jr	Z,00104$
                           5303 ;src/main.c:458: return;
   65EB C9            [10] 5304 	ret
   65EC                    5305 ___str_5:
   65EC 4C 6F 75 6E 67 65  5306 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   65FC 00                 5307 	.db 0x00
   65FD                    5308 ___str_6:
   65FD 4A 6F 73 65 70 20  5309 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   6612 00                 5310 	.db 0x00
   6613                    5311 ___str_7:
   6613 41 6C 62 65 72 74  5312 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   662C 00                 5313 	.db 0x00
                           5314 ;src/main.c:468: void main(void) {
                           5315 ;	---------------------------------
                           5316 ; Function main
                           5317 ; ---------------------------------
   662D                    5318 _main::
                           5319 ;src/main.c:472: init();
   662D CD D0 53      [17] 5320 	call	_init
                           5321 ;src/main.c:475: while(1){
   6630                    5322 00106$:
                           5323 ;src/main.c:476: x=menu();
   6630 CD A1 54      [17] 5324 	call	_menu
   6633 5D            [ 4] 5325 	ld	e, l
   6634 54            [ 4] 5326 	ld	d, h
                           5327 ;src/main.c:477: switch(x){
   6635 CB 7A         [ 8] 5328 	bit	7, d
   6637 20 F7         [12] 5329 	jr	NZ,00106$
   6639 3E 02         [ 7] 5330 	ld	a,#0x02
   663B BB            [ 4] 5331 	cp	a, e
   663C 3E 00         [ 7] 5332 	ld	a,#0x00
   663E 9A            [ 4] 5333 	sbc	a, d
   663F E2 44 66      [10] 5334 	jp	PO, 00122$
   6642 EE 80         [ 7] 5335 	xor	a, #0x80
   6644                    5336 00122$:
   6644 FA 30 66      [10] 5337 	jp	M,00106$
   6647 16 00         [ 7] 5338 	ld	d,#0x00
   6649 21 4F 66      [10] 5339 	ld	hl,#00123$
   664C 19            [11] 5340 	add	hl,de
   664D 19            [11] 5341 	add	hl,de
                           5342 ;src/main.c:478: case 0: return;break;
                           5343 ;src/main.c:479: case 1: game(); break;
   664E E9            [ 4] 5344 	jp	(hl)
   664F                    5345 00123$:
   664F 18 10         [12] 5346 	jr	00108$
   6651 18 04         [12] 5347 	jr	00102$
   6653 18 07         [12] 5348 	jr	00103$
   6655 18 0A         [12] 5349 	jr	00108$
   6657                    5350 00102$:
   6657 CD 4E 64      [17] 5351 	call	_game
   665A 18 D4         [12] 5352 	jr	00106$
                           5353 ;src/main.c:480: case 2: credits();break;
   665C                    5354 00103$:
   665C CD 8A 65      [17] 5355 	call	_credits
                           5356 ;src/main.c:481: }
   665F 18 CF         [12] 5357 	jr	00106$
   6661                    5358 00108$:
   6661 C9            [10] 5359 	ret
                           5360 	.area _CODE
                           5361 	.area _INITIALIZER
                           5362 	.area _CABS (ABS)
