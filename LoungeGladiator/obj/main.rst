                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Wed Oct 21 13:04:42 2015
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
   6D02                      82 _scene::
   6D02                      83 	.ds 240
   6DF2                      84 _temp::
   6DF2                      85 	.ds 1
   6DF3                      86 _map::
   6DF3                      87 	.ds 1
   6DF4                      88 _path::
   6DF4                      89 	.ds 1
   6DF5                      90 _finish::
   6DF5                      91 	.ds 1
   6DF6                      92 _arrow::
   6DF6                      93 	.ds 1
   6DF7                      94 _following::
   6DF7                      95 	.ds 1
   6DF8                      96 _bound::
   6DF8                      97 	.ds 1
   6DF9                      98 _archer::
   6DF9                      99 	.ds 1
   6DFA                     100 _object::
   6DFA                     101 	.ds 10
   6E04                     102 _player::
   6E04                     103 	.ds 11
   6E0F                     104 _enemy::
   6E0F                     105 	.ds 15
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
   46E0 3E 02         [ 7]  152 	ld	a,#<(_scene)
   46E2 DD 86 F8      [19]  153 	add	a, -8 (ix)
   46E5 DD 77 FE      [19]  154 	ld	-2 (ix),a
   46E8 3E 6D         [ 7]  155 	ld	a,#>(_scene)
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
   478D 3E 02         [ 7]  230 	ld	a,#<(_scene)
   478F DD 86 F6      [19]  231 	add	a, -10 (ix)
   4792 DD 77 FC      [19]  232 	ld	-4 (ix),a
   4795 3E 6D         [ 7]  233 	ld	a,#>(_scene)
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
   4834 21 02 6D      [10]  304 	ld	hl,#_scene
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
   485D CD 0C 6C      [17]  330 	call	_cpct_getScreenPtr
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
   4892 21 5A 67      [10]  363 	ld	hl,#_muro
   4895 E5            [11]  364 	push	hl
   4896 CD 4F 69      [17]  365 	call	_cpct_drawSprite
   4899 D1            [10]  366 	pop	de
   489A C1            [10]  367 	pop	bc
   489B                     368 00110$:
                            369 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E 02         [ 7]  370 	ld	a,#<(_scene)
   489D DD 86 F6      [19]  371 	add	a, -10 (ix)
   48A0 6F            [ 4]  372 	ld	l,a
   48A1 3E 6D         [ 7]  373 	ld	a,#>(_scene)
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
   48C7 CD 3B 6B      [17]  396 	call	_cpct_drawSolidBox
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
   4B0F CD 0C 6C      [17]  953 	call	_cpct_getScreenPtr
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
   4B29 CD B5 6A      [17]  971 	call	_cpct_drawSpriteMasked
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
   4B39 CD 3B 6B      [17]  984 	call	_cpct_drawSolidBox
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
   4B4B CD B5 6A      [17]  997 	call	_cpct_drawSpriteMasked
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
   4B76 CD 0C 6C      [17] 1032 	call	_cpct_getScreenPtr
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
   4B8C 21 9A 67      [10] 1047 	ld	hl,#_flecha_arriba
   4B8F E5            [11] 1048 	push	hl
   4B90 CD B5 6A      [17] 1049 	call	_cpct_drawSpriteMasked
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
   4B9F CD 3B 6B      [17] 1061 	call	_cpct_drawSolidBox
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
   4BC6 CD 0C 6C      [17] 1093 	call	_cpct_getScreenPtr
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
   4BFC CD B5 6A      [17] 1129 	call	_cpct_drawSpriteMasked
                           1130 ;src/draws.h:87: break;
   4BFF C9            [10] 1131 	ret
                           1132 ;src/draws.h:88: case 1:
   4C00                    1133 00102$:
                           1134 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C00 21 02 08      [10] 1135 	ld	hl,#0x0802
   4C03 E5            [11] 1136 	push	hl
   4C04 D5            [11] 1137 	push	de
   4C05 C5            [11] 1138 	push	bc
   4C06 CD B5 6A      [17] 1139 	call	_cpct_drawSpriteMasked
                           1140 ;src/draws.h:90: break;
   4C09 C9            [10] 1141 	ret
                           1142 ;src/draws.h:91: case 2:
   4C0A                    1143 00103$:
                           1144 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0A 21 04 04      [10] 1145 	ld	hl,#0x0404
   4C0D E5            [11] 1146 	push	hl
   4C0E D5            [11] 1147 	push	de
   4C0F C5            [11] 1148 	push	bc
   4C10 CD B5 6A      [17] 1149 	call	_cpct_drawSpriteMasked
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
   4C26 CD 0C 6C      [17] 1170 	call	_cpct_getScreenPtr
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
   4C50 CD 3B 6B      [17] 1200 	call	_cpct_drawSolidBox
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
   4C5F CD 3B 6B      [17] 1215 	call	_cpct_drawSolidBox
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
   4C6E CD 3B 6B      [17] 1230 	call	_cpct_drawSolidBox
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
   4C75 21 0A 6E      [10] 1242 	ld	hl, #_player + 6
   4C78 56            [ 7] 1243 	ld	d,(hl)
   4C79 3E 01         [ 7] 1244 	ld	a,#0x01
   4C7B F5            [11] 1245 	push	af
   4C7C 33            [ 6] 1246 	inc	sp
   4C7D D5            [11] 1247 	push	de
   4C7E 33            [ 6] 1248 	inc	sp
   4C7F CD F7 4A      [17] 1249 	call	_drawVida
   4C82 F1            [10] 1250 	pop	af
                           1251 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C83 21 0E 6E      [10] 1252 	ld	hl, #_player + 10
   4C86 56            [ 7] 1253 	ld	d,(hl)
   4C87 3E 10         [ 7] 1254 	ld	a,#0x10
   4C89 F5            [11] 1255 	push	af
   4C8A 33            [ 6] 1256 	inc	sp
   4C8B D5            [11] 1257 	push	de
   4C8C 33            [ 6] 1258 	inc	sp
   4C8D CD 58 4B      [17] 1259 	call	_drawBullets
   4C90 F1            [10] 1260 	pop	af
                           1261 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C91 21 19 6E      [10] 1262 	ld	hl, #_enemy + 10
   4C94 56            [ 7] 1263 	ld	d,(hl)
   4C95 3E 38         [ 7] 1264 	ld	a,#0x38
   4C97 F5            [11] 1265 	push	af
   4C98 33            [ 6] 1266 	inc	sp
   4C99 D5            [11] 1267 	push	de
   4C9A 33            [ 6] 1268 	inc	sp
   4C9B CD 58 4B      [17] 1269 	call	_drawBullets
   4C9E F1            [10] 1270 	pop	af
                           1271 ;src/draws.h:119: drawVida(enemy.life,65);
   4C9F 21 17 6E      [10] 1272 	ld	hl, #_enemy + 8
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
   4CB7 ED 5B 08 6E   [20] 1292 	ld	de, (#_player + 4)
   4CBB 21 05 6E      [10] 1293 	ld	hl, #_player + 1
   4CBE 46            [ 7] 1294 	ld	b,(hl)
   4CBF 21 04 6E      [10] 1295 	ld	hl, #_player + 0
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
                           1306 ;src/draws.h:127: if(enemy.life > 0)
   4CCE 11 0F 6E      [10] 1307 	ld	de,#_enemy+0
   4CD1 3A 17 6E      [13] 1308 	ld	a, (#_enemy + 8)
   4CD4 B7            [ 4] 1309 	or	a, a
   4CD5 28 1B         [12] 1310 	jr	Z,00102$
                           1311 ;src/draws.h:128: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CD7 ED 4B 15 6E   [20] 1312 	ld	bc, (#_enemy + 6)
   4CDB 6B            [ 4] 1313 	ld	l, e
   4CDC 62            [ 4] 1314 	ld	h, d
   4CDD 23            [ 6] 1315 	inc	hl
   4CDE 7E            [ 7] 1316 	ld	a,(hl)
   4CDF DD 77 FF      [19] 1317 	ld	-1 (ix),a
   4CE2 1A            [ 7] 1318 	ld	a,(de)
   4CE3 5F            [ 4] 1319 	ld	e,a
   4CE4 AF            [ 4] 1320 	xor	a, a
   4CE5 F5            [11] 1321 	push	af
   4CE6 33            [ 6] 1322 	inc	sp
   4CE7 C5            [11] 1323 	push	bc
   4CE8 DD 56 FF      [19] 1324 	ld	d, -1 (ix)
   4CEB D5            [11] 1325 	push	de
   4CEC CD B4 4B      [17] 1326 	call	_draw
   4CEF F1            [10] 1327 	pop	af
   4CF0 F1            [10] 1328 	pop	af
   4CF1 33            [ 6] 1329 	inc	sp
   4CF2                    1330 00102$:
                           1331 ;src/draws.h:129: if(arrow == 1){
   4CF2 3A F6 6D      [13] 1332 	ld	a,(#_arrow + 0)
   4CF5 3D            [ 4] 1333 	dec	a
   4CF6 20 5C         [12] 1334 	jr	NZ,00113$
                           1335 ;src/draws.h:130: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CF8 21 01 6E      [10] 1336 	ld	hl, #_object + 7
   4CFB 5E            [ 7] 1337 	ld	e,(hl)
                           1338 ;src/draws.h:131: draw(object.x,object.y,object.sprite,2);
   4CFC 01 FB 6D      [10] 1339 	ld	bc,#_object + 1
                           1340 ;src/draws.h:130: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CFF 7B            [ 4] 1341 	ld	a,e
   4D00 D6 04         [ 7] 1342 	sub	a, #0x04
   4D02 28 0C         [12] 1343 	jr	Z,00107$
   4D04 21 00 6E      [10] 1344 	ld	hl,#_object + 6
   4D07 7B            [ 4] 1345 	ld	a,e
   4D08 D6 06         [ 7] 1346 	sub	a, #0x06
   4D0A 20 25         [12] 1347 	jr	NZ,00108$
   4D0C 7E            [ 7] 1348 	ld	a,(hl)
   4D0D 3D            [ 4] 1349 	dec	a
   4D0E 20 21         [12] 1350 	jr	NZ,00108$
   4D10                    1351 00107$:
                           1352 ;src/draws.h:131: draw(object.x,object.y,object.sprite,2);
   4D10 ED 5B FE 6D   [20] 1353 	ld	de, (#(_object + 0x0004) + 0)
   4D14 0A            [ 7] 1354 	ld	a,(bc)
   4D15 DD 77 FF      [19] 1355 	ld	-1 (ix),a
   4D18 21 FA 6D      [10] 1356 	ld	hl, #_object + 0
   4D1B 4E            [ 7] 1357 	ld	c,(hl)
   4D1C 3E 02         [ 7] 1358 	ld	a,#0x02
   4D1E F5            [11] 1359 	push	af
   4D1F 33            [ 6] 1360 	inc	sp
   4D20 D5            [11] 1361 	push	de
   4D21 DD 7E FF      [19] 1362 	ld	a,-1 (ix)
   4D24 F5            [11] 1363 	push	af
   4D25 33            [ 6] 1364 	inc	sp
   4D26 79            [ 4] 1365 	ld	a,c
   4D27 F5            [11] 1366 	push	af
   4D28 33            [ 6] 1367 	inc	sp
   4D29 CD B4 4B      [17] 1368 	call	_draw
   4D2C F1            [10] 1369 	pop	af
   4D2D F1            [10] 1370 	pop	af
   4D2E 33            [ 6] 1371 	inc	sp
   4D2F 18 23         [12] 1372 	jr	00113$
   4D31                    1373 00108$:
                           1374 ;src/draws.h:132: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4D31 7B            [ 4] 1375 	ld	a,e
   4D32 FE 02         [ 7] 1376 	cp	a,#0x02
   4D34 28 08         [12] 1377 	jr	Z,00103$
   4D36 D6 08         [ 7] 1378 	sub	a, #0x08
   4D38 20 1A         [12] 1379 	jr	NZ,00113$
   4D3A 7E            [ 7] 1380 	ld	a,(hl)
   4D3B 3D            [ 4] 1381 	dec	a
   4D3C 20 16         [12] 1382 	jr	NZ,00113$
   4D3E                    1383 00103$:
                           1384 ;src/draws.h:133: draw(object.x,object.y,object.sprite,1);
   4D3E ED 5B FE 6D   [20] 1385 	ld	de, (#(_object + 0x0004) + 0)
   4D42 0A            [ 7] 1386 	ld	a,(bc)
   4D43 47            [ 4] 1387 	ld	b,a
   4D44 21 FA 6D      [10] 1388 	ld	hl, #_object + 0
   4D47 4E            [ 7] 1389 	ld	c,(hl)
   4D48 3E 01         [ 7] 1390 	ld	a,#0x01
   4D4A F5            [11] 1391 	push	af
   4D4B 33            [ 6] 1392 	inc	sp
   4D4C D5            [11] 1393 	push	de
   4D4D C5            [11] 1394 	push	bc
   4D4E CD B4 4B      [17] 1395 	call	_draw
   4D51 F1            [10] 1396 	pop	af
   4D52 F1            [10] 1397 	pop	af
   4D53 33            [ 6] 1398 	inc	sp
   4D54                    1399 00113$:
                           1400 ;src/draws.h:135: drawStats();
   4D54 CD 75 4C      [17] 1401 	call	_drawStats
   4D57 33            [ 6] 1402 	inc	sp
   4D58 DD E1         [14] 1403 	pop	ix
   4D5A C9            [10] 1404 	ret
                           1405 ;src/draws.h:138: void erases(){
                           1406 ;	---------------------------------
                           1407 ; Function erases
                           1408 ; ---------------------------------
   4D5B                    1409 _erases::
                           1410 ;src/draws.h:140: erase(player.lx,player.ly,0);
   4D5B 21 07 6E      [10] 1411 	ld	hl, #_player + 3
   4D5E 46            [ 7] 1412 	ld	b,(hl)
   4D5F 21 06 6E      [10] 1413 	ld	hl, #_player + 2
   4D62 56            [ 7] 1414 	ld	d,(hl)
   4D63 AF            [ 4] 1415 	xor	a, a
   4D64 F5            [11] 1416 	push	af
   4D65 33            [ 6] 1417 	inc	sp
   4D66 4A            [ 4] 1418 	ld	c, d
   4D67 C5            [11] 1419 	push	bc
   4D68 CD 14 4C      [17] 1420 	call	_erase
   4D6B F1            [10] 1421 	pop	af
   4D6C 33            [ 6] 1422 	inc	sp
                           1423 ;src/draws.h:141: erase(enemy.lx,enemy.ly,0);
   4D6D 21 12 6E      [10] 1424 	ld	hl, #_enemy + 3
   4D70 46            [ 7] 1425 	ld	b,(hl)
   4D71 21 11 6E      [10] 1426 	ld	hl, #_enemy + 2
   4D74 56            [ 7] 1427 	ld	d,(hl)
   4D75 AF            [ 4] 1428 	xor	a, a
   4D76 F5            [11] 1429 	push	af
   4D77 33            [ 6] 1430 	inc	sp
   4D78 4A            [ 4] 1431 	ld	c, d
   4D79 C5            [11] 1432 	push	bc
   4D7A CD 14 4C      [17] 1433 	call	_erase
   4D7D F1            [10] 1434 	pop	af
   4D7E 33            [ 6] 1435 	inc	sp
                           1436 ;src/draws.h:142: if(arrow == 1){
   4D7F 3A F6 6D      [13] 1437 	ld	a,(#_arrow + 0)
   4D82 3D            [ 4] 1438 	dec	a
   4D83 C0            [11] 1439 	ret	NZ
                           1440 ;src/draws.h:143: if(object.dir == 4 || object.dir == 6)
   4D84 21 01 6E      [10] 1441 	ld	hl, #_object + 7
   4D87 4E            [ 7] 1442 	ld	c,(hl)
                           1443 ;src/draws.h:144: erase(object.lx,object.ly,2);
   4D88 21 FD 6D      [10] 1444 	ld	hl, #_object + 3
   4D8B 56            [ 7] 1445 	ld	d,(hl)
   4D8C 21 FC 6D      [10] 1446 	ld	hl, #_object + 2
   4D8F 46            [ 7] 1447 	ld	b,(hl)
                           1448 ;src/draws.h:143: if(object.dir == 4 || object.dir == 6)
   4D90 79            [ 4] 1449 	ld	a,c
   4D91 FE 04         [ 7] 1450 	cp	a,#0x04
   4D93 28 04         [12] 1451 	jr	Z,00101$
   4D95 D6 06         [ 7] 1452 	sub	a, #0x06
   4D97 20 0F         [12] 1453 	jr	NZ,00102$
   4D99                    1454 00101$:
                           1455 ;src/draws.h:144: erase(object.lx,object.ly,2);
   4D99 3E 02         [ 7] 1456 	ld	a,#0x02
   4D9B F5            [11] 1457 	push	af
   4D9C 33            [ 6] 1458 	inc	sp
   4D9D D5            [11] 1459 	push	de
   4D9E 33            [ 6] 1460 	inc	sp
   4D9F C5            [11] 1461 	push	bc
   4DA0 33            [ 6] 1462 	inc	sp
   4DA1 CD 14 4C      [17] 1463 	call	_erase
   4DA4 F1            [10] 1464 	pop	af
   4DA5 33            [ 6] 1465 	inc	sp
   4DA6 18 0D         [12] 1466 	jr	00103$
   4DA8                    1467 00102$:
                           1468 ;src/draws.h:146: erase(object.lx,object.ly,1);
   4DA8 3E 01         [ 7] 1469 	ld	a,#0x01
   4DAA F5            [11] 1470 	push	af
   4DAB 33            [ 6] 1471 	inc	sp
   4DAC D5            [11] 1472 	push	de
   4DAD 33            [ 6] 1473 	inc	sp
   4DAE C5            [11] 1474 	push	bc
   4DAF 33            [ 6] 1475 	inc	sp
   4DB0 CD 14 4C      [17] 1476 	call	_erase
   4DB3 F1            [10] 1477 	pop	af
   4DB4 33            [ 6] 1478 	inc	sp
   4DB5                    1479 00103$:
                           1480 ;src/draws.h:147: if(bound == 1) arrow = 0;
   4DB5 3A F8 6D      [13] 1481 	ld	a,(#_bound + 0)
   4DB8 3D            [ 4] 1482 	dec	a
   4DB9 C0            [11] 1483 	ret	NZ
   4DBA 21 F6 6D      [10] 1484 	ld	hl,#_arrow + 0
   4DBD 36 00         [10] 1485 	ld	(hl), #0x00
   4DBF C9            [10] 1486 	ret
                           1487 ;src/draws.h:154: void drawFatiga(u8 atk, u8 col){
                           1488 ;	---------------------------------
                           1489 ; Function drawFatiga
                           1490 ; ---------------------------------
   4DC0                    1491 _drawFatiga::
   4DC0 DD E5         [15] 1492 	push	ix
   4DC2 DD 21 00 00   [14] 1493 	ld	ix,#0
   4DC6 DD 39         [15] 1494 	add	ix,sp
   4DC8 F5            [11] 1495 	push	af
                           1496 ;src/draws.h:156: if(atk < 20)
   4DC9 DD 7E 04      [19] 1497 	ld	a,4 (ix)
   4DCC D6 14         [ 7] 1498 	sub	a, #0x14
   4DCE 30 04         [12] 1499 	jr	NC,00102$
                           1500 ;src/draws.h:157: col = 2;
   4DD0 DD 36 05 02   [19] 1501 	ld	5 (ix),#0x02
   4DD4                    1502 00102$:
                           1503 ;src/draws.h:158: if(atk > 30 || atk <= 20){
   4DD4 3E 14         [ 7] 1504 	ld	a,#0x14
   4DD6 DD 96 04      [19] 1505 	sub	a, 4 (ix)
   4DD9 3E 00         [ 7] 1506 	ld	a,#0x00
   4DDB 17            [ 4] 1507 	rla
   4DDC DD 77 FE      [19] 1508 	ld	-2 (ix),a
                           1509 ;src/draws.h:160: switch(col){
   4DDF 3E 02         [ 7] 1510 	ld	a,#0x02
   4DE1 DD 96 05      [19] 1511 	sub	a, 5 (ix)
   4DE4 3E 00         [ 7] 1512 	ld	a,#0x00
   4DE6 17            [ 4] 1513 	rla
   4DE7 DD 77 FF      [19] 1514 	ld	-1 (ix),a
                           1515 ;src/draws.h:158: if(atk > 30 || atk <= 20){
   4DEA 3E 1E         [ 7] 1516 	ld	a,#0x1E
   4DEC DD 96 04      [19] 1517 	sub	a, 4 (ix)
   4DEF 38 06         [12] 1518 	jr	C,00107$
   4DF1 DD 7E FE      [19] 1519 	ld	a,-2 (ix)
   4DF4 B7            [ 4] 1520 	or	a, a
   4DF5 20 4F         [12] 1521 	jr	NZ,00108$
   4DF7                    1522 00107$:
                           1523 ;src/draws.h:159: memptr = cpct_getScreenPtr(VMEM,28,192);
   4DF7 21 1C C0      [10] 1524 	ld	hl,#0xC01C
   4DFA E5            [11] 1525 	push	hl
   4DFB 2E 00         [ 7] 1526 	ld	l, #0x00
   4DFD E5            [11] 1527 	push	hl
   4DFE CD 0C 6C      [17] 1528 	call	_cpct_getScreenPtr
                           1529 ;src/draws.h:160: switch(col){
   4E01 DD 7E FF      [19] 1530 	ld	a,-1 (ix)
   4E04 B7            [ 4] 1531 	or	a, a
   4E05 20 3F         [12] 1532 	jr	NZ,00108$
                           1533 ;src/draws.h:162: cpct_drawSolidBox(memptr, col, 2, 8);
   4E07 4D            [ 4] 1534 	ld	c, l
   4E08 44            [ 4] 1535 	ld	b, h
                           1536 ;src/draws.h:160: switch(col){
   4E09 DD 5E 05      [19] 1537 	ld	e,5 (ix)
   4E0C 16 00         [ 7] 1538 	ld	d,#0x00
   4E0E 21 14 4E      [10] 1539 	ld	hl,#00156$
   4E11 19            [11] 1540 	add	hl,de
   4E12 19            [11] 1541 	add	hl,de
                           1542 ;src/draws.h:161: case 0:
   4E13 E9            [ 4] 1543 	jp	(hl)
   4E14                    1544 00156$:
   4E14 18 04         [12] 1545 	jr	00103$
   4E16 18 14         [12] 1546 	jr	00104$
   4E18 18 20         [12] 1547 	jr	00105$
   4E1A                    1548 00103$:
                           1549 ;src/draws.h:162: cpct_drawSolidBox(memptr, col, 2, 8);
   4E1A 21 02 08      [10] 1550 	ld	hl,#0x0802
   4E1D E5            [11] 1551 	push	hl
   4E1E DD 7E 05      [19] 1552 	ld	a,5 (ix)
   4E21 F5            [11] 1553 	push	af
   4E22 33            [ 6] 1554 	inc	sp
   4E23 C5            [11] 1555 	push	bc
   4E24 CD 3B 6B      [17] 1556 	call	_cpct_drawSolidBox
   4E27 F1            [10] 1557 	pop	af
   4E28 F1            [10] 1558 	pop	af
   4E29 33            [ 6] 1559 	inc	sp
                           1560 ;src/draws.h:163: break;
   4E2A 18 1A         [12] 1561 	jr	00108$
                           1562 ;src/draws.h:164: case 1:
   4E2C                    1563 00104$:
                           1564 ;src/draws.h:165: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E2C 11 80 46      [10] 1565 	ld	de,#_fatiga_nor
   4E2F 21 02 08      [10] 1566 	ld	hl,#0x0802
   4E32 E5            [11] 1567 	push	hl
   4E33 C5            [11] 1568 	push	bc
   4E34 D5            [11] 1569 	push	de
   4E35 CD B5 6A      [17] 1570 	call	_cpct_drawSpriteMasked
                           1571 ;src/draws.h:166: break;
   4E38 18 0C         [12] 1572 	jr	00108$
                           1573 ;src/draws.h:167: case 2:
   4E3A                    1574 00105$:
                           1575 ;src/draws.h:168: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E3A 11 A0 46      [10] 1576 	ld	de,#_fatiga_full
   4E3D 21 02 08      [10] 1577 	ld	hl,#0x0802
   4E40 E5            [11] 1578 	push	hl
   4E41 C5            [11] 1579 	push	bc
   4E42 D5            [11] 1580 	push	de
   4E43 CD B5 6A      [17] 1581 	call	_cpct_drawSpriteMasked
                           1582 ;src/draws.h:169: }
   4E46                    1583 00108$:
                           1584 ;src/draws.h:171: if(atk > 40 || atk <= 20){
   4E46 3E 28         [ 7] 1585 	ld	a,#0x28
   4E48 DD 96 04      [19] 1586 	sub	a, 4 (ix)
   4E4B 38 06         [12] 1587 	jr	C,00114$
   4E4D DD 7E FE      [19] 1588 	ld	a,-2 (ix)
   4E50 B7            [ 4] 1589 	or	a, a
   4E51 20 4F         [12] 1590 	jr	NZ,00115$
   4E53                    1591 00114$:
                           1592 ;src/draws.h:172: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E53 21 1F C0      [10] 1593 	ld	hl,#0xC01F
   4E56 E5            [11] 1594 	push	hl
   4E57 2E 00         [ 7] 1595 	ld	l, #0x00
   4E59 E5            [11] 1596 	push	hl
   4E5A CD 0C 6C      [17] 1597 	call	_cpct_getScreenPtr
                           1598 ;src/draws.h:173: switch(col){
   4E5D DD 7E FF      [19] 1599 	ld	a,-1 (ix)
   4E60 B7            [ 4] 1600 	or	a, a
   4E61 20 3F         [12] 1601 	jr	NZ,00115$
                           1602 ;src/draws.h:162: cpct_drawSolidBox(memptr, col, 2, 8);
   4E63 4D            [ 4] 1603 	ld	c, l
   4E64 44            [ 4] 1604 	ld	b, h
                           1605 ;src/draws.h:173: switch(col){
   4E65 DD 5E 05      [19] 1606 	ld	e,5 (ix)
   4E68 16 00         [ 7] 1607 	ld	d,#0x00
   4E6A 21 70 4E      [10] 1608 	ld	hl,#00157$
   4E6D 19            [11] 1609 	add	hl,de
   4E6E 19            [11] 1610 	add	hl,de
                           1611 ;src/draws.h:174: case 0:
   4E6F E9            [ 4] 1612 	jp	(hl)
   4E70                    1613 00157$:
   4E70 18 04         [12] 1614 	jr	00110$
   4E72 18 14         [12] 1615 	jr	00111$
   4E74 18 20         [12] 1616 	jr	00112$
   4E76                    1617 00110$:
                           1618 ;src/draws.h:175: cpct_drawSolidBox(memptr, col, 2, 8);
   4E76 21 02 08      [10] 1619 	ld	hl,#0x0802
   4E79 E5            [11] 1620 	push	hl
   4E7A DD 7E 05      [19] 1621 	ld	a,5 (ix)
   4E7D F5            [11] 1622 	push	af
   4E7E 33            [ 6] 1623 	inc	sp
   4E7F C5            [11] 1624 	push	bc
   4E80 CD 3B 6B      [17] 1625 	call	_cpct_drawSolidBox
   4E83 F1            [10] 1626 	pop	af
   4E84 F1            [10] 1627 	pop	af
   4E85 33            [ 6] 1628 	inc	sp
                           1629 ;src/draws.h:176: break;
   4E86 18 1A         [12] 1630 	jr	00115$
                           1631 ;src/draws.h:177: case 1:
   4E88                    1632 00111$:
                           1633 ;src/draws.h:178: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E88 11 80 46      [10] 1634 	ld	de,#_fatiga_nor
   4E8B 21 02 08      [10] 1635 	ld	hl,#0x0802
   4E8E E5            [11] 1636 	push	hl
   4E8F C5            [11] 1637 	push	bc
   4E90 D5            [11] 1638 	push	de
   4E91 CD B5 6A      [17] 1639 	call	_cpct_drawSpriteMasked
                           1640 ;src/draws.h:179: break;
   4E94 18 0C         [12] 1641 	jr	00115$
                           1642 ;src/draws.h:180: case 2:
   4E96                    1643 00112$:
                           1644 ;src/draws.h:181: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E96 11 A0 46      [10] 1645 	ld	de,#_fatiga_full
   4E99 21 02 08      [10] 1646 	ld	hl,#0x0802
   4E9C E5            [11] 1647 	push	hl
   4E9D C5            [11] 1648 	push	bc
   4E9E D5            [11] 1649 	push	de
   4E9F CD B5 6A      [17] 1650 	call	_cpct_drawSpriteMasked
                           1651 ;src/draws.h:182: }
   4EA2                    1652 00115$:
                           1653 ;src/draws.h:184: if(atk <= 20){
   4EA2 DD 7E FE      [19] 1654 	ld	a,-2 (ix)
   4EA5 B7            [ 4] 1655 	or	a, a
   4EA6 20 39         [12] 1656 	jr	NZ,00122$
                           1657 ;src/draws.h:185: memptr = cpct_getScreenPtr(VMEM,34,192);
   4EA8 21 22 C0      [10] 1658 	ld	hl,#0xC022
   4EAB E5            [11] 1659 	push	hl
   4EAC 2E 00         [ 7] 1660 	ld	l, #0x00
   4EAE E5            [11] 1661 	push	hl
   4EAF CD 0C 6C      [17] 1662 	call	_cpct_getScreenPtr
                           1663 ;src/draws.h:162: cpct_drawSolidBox(memptr, col, 2, 8);
   4EB2 4D            [ 4] 1664 	ld	c, l
   4EB3 44            [ 4] 1665 	ld	b, h
                           1666 ;src/draws.h:186: switch(col){
   4EB4 DD 7E 05      [19] 1667 	ld	a,5 (ix)
   4EB7 B7            [ 4] 1668 	or	a, a
   4EB8 28 09         [12] 1669 	jr	Z,00117$
   4EBA DD 7E 05      [19] 1670 	ld	a,5 (ix)
   4EBD D6 02         [ 7] 1671 	sub	a, #0x02
   4EBF 28 14         [12] 1672 	jr	Z,00118$
   4EC1 18 1E         [12] 1673 	jr	00122$
                           1674 ;src/draws.h:187: case 0:
   4EC3                    1675 00117$:
                           1676 ;src/draws.h:188: cpct_drawSolidBox(memptr, col, 2, 8);
   4EC3 21 02 08      [10] 1677 	ld	hl,#0x0802
   4EC6 E5            [11] 1678 	push	hl
   4EC7 DD 7E 05      [19] 1679 	ld	a,5 (ix)
   4ECA F5            [11] 1680 	push	af
   4ECB 33            [ 6] 1681 	inc	sp
   4ECC C5            [11] 1682 	push	bc
   4ECD CD 3B 6B      [17] 1683 	call	_cpct_drawSolidBox
   4ED0 F1            [10] 1684 	pop	af
   4ED1 F1            [10] 1685 	pop	af
   4ED2 33            [ 6] 1686 	inc	sp
                           1687 ;src/draws.h:189: break;
   4ED3 18 0C         [12] 1688 	jr	00122$
                           1689 ;src/draws.h:190: case 2:
   4ED5                    1690 00118$:
                           1691 ;src/draws.h:191: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4ED5 11 A0 46      [10] 1692 	ld	de,#_fatiga_full
   4ED8 21 02 08      [10] 1693 	ld	hl,#0x0802
   4EDB E5            [11] 1694 	push	hl
   4EDC C5            [11] 1695 	push	bc
   4EDD D5            [11] 1696 	push	de
   4EDE CD B5 6A      [17] 1697 	call	_cpct_drawSpriteMasked
                           1698 ;src/draws.h:192: }
   4EE1                    1699 00122$:
   4EE1 DD F9         [10] 1700 	ld	sp, ix
   4EE3 DD E1         [14] 1701 	pop	ix
   4EE5 C9            [10] 1702 	ret
                           1703 ;src/draws.h:197: void drawPickUps(u8 corazon, u8 bullet){
                           1704 ;	---------------------------------
                           1705 ; Function drawPickUps
                           1706 ; ---------------------------------
   4EE6                    1707 _drawPickUps::
   4EE6 DD E5         [15] 1708 	push	ix
   4EE8 DD 21 00 00   [14] 1709 	ld	ix,#0
   4EEC DD 39         [15] 1710 	add	ix,sp
                           1711 ;src/draws.h:200: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4EEE 21 04 A0      [10] 1712 	ld	hl,#0xA004
   4EF1 E5            [11] 1713 	push	hl
   4EF2 21 00 C0      [10] 1714 	ld	hl,#0xC000
   4EF5 E5            [11] 1715 	push	hl
   4EF6 CD 0C 6C      [17] 1716 	call	_cpct_getScreenPtr
                           1717 ;src/draws.h:202: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EF9 4D            [ 4] 1718 	ld	c, l
   4EFA 44            [ 4] 1719 	ld	b, h
                           1720 ;src/draws.h:201: if(corazon == 0)
   4EFB DD 7E 04      [19] 1721 	ld	a,4 (ix)
   4EFE B7            [ 4] 1722 	or	a, a
   4EFF 20 0E         [12] 1723 	jr	NZ,00102$
                           1724 ;src/draws.h:202: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F01 11 00 46      [10] 1725 	ld	de,#_corazon_lleno
   4F04 21 04 08      [10] 1726 	ld	hl,#0x0804
   4F07 E5            [11] 1727 	push	hl
   4F08 C5            [11] 1728 	push	bc
   4F09 D5            [11] 1729 	push	de
   4F0A CD B5 6A      [17] 1730 	call	_cpct_drawSpriteMasked
   4F0D 18 0E         [12] 1731 	jr	00103$
   4F0F                    1732 00102$:
                           1733 ;src/draws.h:204: cpct_drawSolidBox(memptr, 0, 4, 8);
   4F0F 21 04 08      [10] 1734 	ld	hl,#0x0804
   4F12 E5            [11] 1735 	push	hl
   4F13 AF            [ 4] 1736 	xor	a, a
   4F14 F5            [11] 1737 	push	af
   4F15 33            [ 6] 1738 	inc	sp
   4F16 C5            [11] 1739 	push	bc
   4F17 CD 3B 6B      [17] 1740 	call	_cpct_drawSolidBox
   4F1A F1            [10] 1741 	pop	af
   4F1B F1            [10] 1742 	pop	af
   4F1C 33            [ 6] 1743 	inc	sp
   4F1D                    1744 00103$:
                           1745 ;src/draws.h:206: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4F1D 21 08 10      [10] 1746 	ld	hl,#0x1008
   4F20 E5            [11] 1747 	push	hl
   4F21 21 00 C0      [10] 1748 	ld	hl,#0xC000
   4F24 E5            [11] 1749 	push	hl
   4F25 CD 0C 6C      [17] 1750 	call	_cpct_getScreenPtr
                           1751 ;src/draws.h:202: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F28 EB            [ 4] 1752 	ex	de,hl
                           1753 ;src/draws.h:207: if(bullet == 0)
   4F29 DD 7E 05      [19] 1754 	ld	a,5 (ix)
   4F2C B7            [ 4] 1755 	or	a, a
   4F2D 20 0E         [12] 1756 	jr	NZ,00105$
                           1757 ;src/draws.h:208: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4F2F 01 9A 67      [10] 1758 	ld	bc,#_flecha_arriba
   4F32 21 02 08      [10] 1759 	ld	hl,#0x0802
   4F35 E5            [11] 1760 	push	hl
   4F36 D5            [11] 1761 	push	de
   4F37 C5            [11] 1762 	push	bc
   4F38 CD B5 6A      [17] 1763 	call	_cpct_drawSpriteMasked
   4F3B 18 0E         [12] 1764 	jr	00107$
   4F3D                    1765 00105$:
                           1766 ;src/draws.h:210: cpct_drawSolidBox(memptr, 0, 2, 8);
   4F3D 21 02 08      [10] 1767 	ld	hl,#0x0802
   4F40 E5            [11] 1768 	push	hl
   4F41 AF            [ 4] 1769 	xor	a, a
   4F42 F5            [11] 1770 	push	af
   4F43 33            [ 6] 1771 	inc	sp
   4F44 D5            [11] 1772 	push	de
   4F45 CD 3B 6B      [17] 1773 	call	_cpct_drawSolidBox
   4F48 F1            [10] 1774 	pop	af
   4F49 F1            [10] 1775 	pop	af
   4F4A 33            [ 6] 1776 	inc	sp
   4F4B                    1777 00107$:
   4F4B DD E1         [14] 1778 	pop	ix
   4F4D C9            [10] 1779 	ret
                           1780 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1781 ;	---------------------------------
                           1782 ; Function detectPlayerRoom
                           1783 ; ---------------------------------
   4F4E                    1784 _detectPlayerRoom::
   4F4E DD E5         [15] 1785 	push	ix
   4F50 DD 21 00 00   [14] 1786 	ld	ix,#0
   4F54 DD 39         [15] 1787 	add	ix,sp
                           1788 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   4F56 11 02 6D      [10] 1789 	ld	de,#_scene+0
   4F59 DD 7E 05      [19] 1790 	ld	a,5 (ix)
   4F5C 07            [ 4] 1791 	rlca
   4F5D 07            [ 4] 1792 	rlca
   4F5E 07            [ 4] 1793 	rlca
   4F5F 07            [ 4] 1794 	rlca
   4F60 E6 0F         [ 7] 1795 	and	a,#0x0F
   4F62 4F            [ 4] 1796 	ld	c,a
   4F63 06 00         [ 7] 1797 	ld	b,#0x00
   4F65 69            [ 4] 1798 	ld	l, c
   4F66 60            [ 4] 1799 	ld	h, b
   4F67 29            [11] 1800 	add	hl, hl
   4F68 29            [11] 1801 	add	hl, hl
   4F69 09            [11] 1802 	add	hl, bc
   4F6A 29            [11] 1803 	add	hl, hl
   4F6B 29            [11] 1804 	add	hl, hl
   4F6C 19            [11] 1805 	add	hl,de
   4F6D DD 5E 04      [19] 1806 	ld	e,4 (ix)
   4F70 CB 3B         [ 8] 1807 	srl	e
   4F72 CB 3B         [ 8] 1808 	srl	e
   4F74 16 00         [ 7] 1809 	ld	d,#0x00
   4F76 19            [11] 1810 	add	hl,de
   4F77 6E            [ 7] 1811 	ld	l,(hl)
   4F78 DD E1         [14] 1812 	pop	ix
   4F7A C9            [10] 1813 	ret
                           1814 ;src/ia.h:16: u8 chooseDirection(){
                           1815 ;	---------------------------------
                           1816 ; Function chooseDirection
                           1817 ; ---------------------------------
   4F7B                    1818 _chooseDirection::
                           1819 ;src/ia.h:18: u8 dir = 0;
   4F7B 16 00         [ 7] 1820 	ld	d,#0x00
                           1821 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   4F7D D5            [11] 1822 	push	de
   4F7E CD B4 68      [17] 1823 	call	_rand
   4F81 01 04 00      [10] 1824 	ld	bc,#0x0004
   4F84 C5            [11] 1825 	push	bc
   4F85 E5            [11] 1826 	push	hl
   4F86 CD 00 6C      [17] 1827 	call	__modsint
   4F89 F1            [10] 1828 	pop	af
   4F8A F1            [10] 1829 	pop	af
   4F8B D1            [10] 1830 	pop	de
   4F8C 5D            [ 4] 1831 	ld	e,l
   4F8D 1C            [ 4] 1832 	inc	e
                           1833 ;src/ia.h:20: switch(rnd){
   4F8E 7B            [ 4] 1834 	ld	a,e
   4F8F D6 01         [ 7] 1835 	sub	a, #0x01
   4F91 38 24         [12] 1836 	jr	C,00105$
   4F93 3E 04         [ 7] 1837 	ld	a,#0x04
   4F95 93            [ 4] 1838 	sub	a, e
   4F96 38 1F         [12] 1839 	jr	C,00105$
   4F98 1D            [ 4] 1840 	dec	e
   4F99 16 00         [ 7] 1841 	ld	d,#0x00
   4F9B 21 A1 4F      [10] 1842 	ld	hl,#00116$
   4F9E 19            [11] 1843 	add	hl,de
   4F9F 19            [11] 1844 	add	hl,de
                           1845 ;src/ia.h:21: case 4: dir = 6;break;
   4FA0 E9            [ 4] 1846 	jp	(hl)
   4FA1                    1847 00116$:
   4FA1 18 12         [12] 1848 	jr	00104$
   4FA3 18 0C         [12] 1849 	jr	00103$
   4FA5 18 06         [12] 1850 	jr	00102$
   4FA7 18 00         [12] 1851 	jr	00101$
   4FA9                    1852 00101$:
   4FA9 16 06         [ 7] 1853 	ld	d,#0x06
   4FAB 18 0A         [12] 1854 	jr	00105$
                           1855 ;src/ia.h:22: case 3: dir = 4;break;
   4FAD                    1856 00102$:
   4FAD 16 04         [ 7] 1857 	ld	d,#0x04
   4FAF 18 06         [12] 1858 	jr	00105$
                           1859 ;src/ia.h:23: case 2: dir = 2;break;
   4FB1                    1860 00103$:
   4FB1 16 02         [ 7] 1861 	ld	d,#0x02
   4FB3 18 02         [12] 1862 	jr	00105$
                           1863 ;src/ia.h:24: case 1: dir = 8;break;
   4FB5                    1864 00104$:
   4FB5 16 08         [ 7] 1865 	ld	d,#0x08
                           1866 ;src/ia.h:25: }
   4FB7                    1867 00105$:
                           1868 ;src/ia.h:27: return dir;
   4FB7 6A            [ 4] 1869 	ld	l,d
   4FB8 C9            [10] 1870 	ret
                           1871 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           1872 ;	---------------------------------
                           1873 ; Function setDirection
                           1874 ; ---------------------------------
   4FB9                    1875 _setDirection::
   4FB9 DD E5         [15] 1876 	push	ix
   4FBB DD 21 00 00   [14] 1877 	ld	ix,#0
   4FBF DD 39         [15] 1878 	add	ix,sp
                           1879 ;src/ia.h:33: if(px < x) dir = 4;
   4FC1 DD 7E 04      [19] 1880 	ld	a,4 (ix)
   4FC4 DD 96 06      [19] 1881 	sub	a, 6 (ix)
   4FC7 30 04         [12] 1882 	jr	NC,00108$
   4FC9 2E 04         [ 7] 1883 	ld	l,#0x04
   4FCB 18 1A         [12] 1884 	jr	00109$
   4FCD                    1885 00108$:
                           1886 ;src/ia.h:34: else if(py > y) dir = 2;
   4FCD DD 7E 07      [19] 1887 	ld	a,7 (ix)
   4FD0 DD 96 05      [19] 1888 	sub	a, 5 (ix)
   4FD3 30 04         [12] 1889 	jr	NC,00105$
   4FD5 2E 02         [ 7] 1890 	ld	l,#0x02
   4FD7 18 0E         [12] 1891 	jr	00109$
   4FD9                    1892 00105$:
                           1893 ;src/ia.h:35: else if(px > x) dir = 6;
   4FD9 DD 7E 06      [19] 1894 	ld	a,6 (ix)
   4FDC DD 96 04      [19] 1895 	sub	a, 4 (ix)
   4FDF 30 04         [12] 1896 	jr	NC,00102$
   4FE1 2E 06         [ 7] 1897 	ld	l,#0x06
   4FE3 18 02         [12] 1898 	jr	00109$
   4FE5                    1899 00102$:
                           1900 ;src/ia.h:36: else dir = 8;
   4FE5 2E 08         [ 7] 1901 	ld	l,#0x08
   4FE7                    1902 00109$:
                           1903 ;src/ia.h:37: return dir;
   4FE7 DD E1         [14] 1904 	pop	ix
   4FE9 C9            [10] 1905 	ret
                           1906 ;src/ia.h:40: void movement(u8 dir){
                           1907 ;	---------------------------------
                           1908 ; Function movement
                           1909 ; ---------------------------------
   4FEA                    1910 _movement::
                           1911 ;src/ia.h:41: switch(dir){
   4FEA FD 21 02 00   [14] 1912 	ld	iy,#2
   4FEE FD 39         [15] 1913 	add	iy,sp
   4FF0 FD 7E 00      [19] 1914 	ld	a,0 (iy)
   4FF3 D6 02         [ 7] 1915 	sub	a, #0x02
   4FF5 28 2B         [12] 1916 	jr	Z,00104$
   4FF7 FD 7E 00      [19] 1917 	ld	a,0 (iy)
   4FFA D6 04         [ 7] 1918 	sub	a, #0x04
   4FFC 28 14         [12] 1919 	jr	Z,00102$
   4FFE FD 7E 00      [19] 1920 	ld	a,0 (iy)
   5001 D6 06         [ 7] 1921 	sub	a, #0x06
   5003 28 08         [12] 1922 	jr	Z,00101$
   5005 FD 7E 00      [19] 1923 	ld	a,0 (iy)
   5008 D6 08         [ 7] 1924 	sub	a, #0x08
   500A 28 0E         [12] 1925 	jr	Z,00103$
   500C C9            [10] 1926 	ret
                           1927 ;src/ia.h:42: case 6: enemy.x += 1; break;
   500D                    1928 00101$:
   500D 21 0F 6E      [10] 1929 	ld	hl,#_enemy+0
   5010 34            [11] 1930 	inc	(hl)
   5011 C9            [10] 1931 	ret
                           1932 ;src/ia.h:43: case 4: enemy.x -= 1; break;
   5012                    1933 00102$:
   5012 11 0F 6E      [10] 1934 	ld	de,#_enemy+0
   5015 1A            [ 7] 1935 	ld	a,(de)
   5016 C6 FF         [ 7] 1936 	add	a,#0xFF
   5018 12            [ 7] 1937 	ld	(de),a
   5019 C9            [10] 1938 	ret
                           1939 ;src/ia.h:44: case 8: enemy.y -= 2; break;
   501A                    1940 00103$:
   501A 11 10 6E      [10] 1941 	ld	de,#_enemy+1
   501D 1A            [ 7] 1942 	ld	a,(de)
   501E C6 FE         [ 7] 1943 	add	a,#0xFE
   5020 12            [ 7] 1944 	ld	(de),a
   5021 C9            [10] 1945 	ret
                           1946 ;src/ia.h:45: case 2: enemy.y += 2; break;
   5022                    1947 00104$:
   5022 21 10 6E      [10] 1948 	ld	hl,#_enemy+1
   5025 7E            [ 7] 1949 	ld	a,(hl)
   5026 C6 02         [ 7] 1950 	add	a, #0x02
   5028 77            [ 7] 1951 	ld	(hl),a
                           1952 ;src/ia.h:46: }
   5029 C9            [10] 1953 	ret
                           1954 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           1955 ;	---------------------------------
                           1956 ; Function checkCollisions
                           1957 ; ---------------------------------
   502A                    1958 _checkCollisions::
   502A DD E5         [15] 1959 	push	ix
   502C DD 21 00 00   [14] 1960 	ld	ix,#0
   5030 DD 39         [15] 1961 	add	ix,sp
   5032 21 FA FF      [10] 1962 	ld	hl,#-6
   5035 39            [11] 1963 	add	hl,sp
   5036 F9            [ 6] 1964 	ld	sp,hl
                           1965 ;src/CalcColision.h:8: u8 popX = pX + tilewidth;
   5037 DD 6E 04      [19] 1966 	ld	l,4 (ix)
   503A 2C            [ 4] 1967 	inc	l
   503B 2C            [ 4] 1968 	inc	l
   503C 2C            [ 4] 1969 	inc	l
   503D 2C            [ 4] 1970 	inc	l
                           1971 ;src/CalcColision.h:9: u8 popY = pY + tileheight;
   503E DD 7E 05      [19] 1972 	ld	a,5 (ix)
   5041 C6 10         [ 7] 1973 	add	a, #0x10
   5043 DD 77 FA      [19] 1974 	ld	-6 (ix),a
                           1975 ;src/CalcColision.h:10: u8 eopX = eX + tilewidth;
   5046 DD 5E 06      [19] 1976 	ld	e,6 (ix)
   5049 1C            [ 4] 1977 	inc	e
   504A 1C            [ 4] 1978 	inc	e
   504B 1C            [ 4] 1979 	inc	e
   504C 1C            [ 4] 1980 	inc	e
                           1981 ;src/CalcColision.h:11: u8 eopY = eY + tileheight;
   504D DD 7E 07      [19] 1982 	ld	a,7 (ix)
   5050 C6 10         [ 7] 1983 	add	a, #0x10
   5052 DD 77 FB      [19] 1984 	ld	-5 (ix),a
                           1985 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5055 7B            [ 4] 1986 	ld	a,e
   5056 DD 96 04      [19] 1987 	sub	a, 4 (ix)
   5059 3E 00         [ 7] 1988 	ld	a,#0x00
   505B 17            [ 4] 1989 	rla
   505C DD 77 FF      [19] 1990 	ld	-1 (ix),a
   505F 7D            [ 4] 1991 	ld	a,l
   5060 93            [ 4] 1992 	sub	a, e
   5061 3E 00         [ 7] 1993 	ld	a,#0x00
   5063 17            [ 4] 1994 	rla
   5064 DD 77 FE      [19] 1995 	ld	-2 (ix),a
   5067 DD 7E 07      [19] 1996 	ld	a,7 (ix)
   506A DD 96 05      [19] 1997 	sub	a, 5 (ix)
   506D 3E 00         [ 7] 1998 	ld	a,#0x00
   506F 17            [ 4] 1999 	rla
   5070 5F            [ 4] 2000 	ld	e,a
   5071 DD 7E FA      [19] 2001 	ld	a,-6 (ix)
   5074 DD 96 07      [19] 2002 	sub	a, 7 (ix)
   5077 3E 00         [ 7] 2003 	ld	a,#0x00
   5079 17            [ 4] 2004 	rla
   507A 4F            [ 4] 2005 	ld	c,a
                           2006 ;src/CalcColision.h:14: if(atk >= 21)
   507B DD 7E 08      [19] 2007 	ld	a,8 (ix)
   507E D6 15         [ 7] 2008 	sub	a, #0x15
   5080 3E 00         [ 7] 2009 	ld	a,#0x00
   5082 17            [ 4] 2010 	rla
   5083 DD 77 FD      [19] 2011 	ld	-3 (ix),a
                           2012 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5086 DD 7E FF      [19] 2013 	ld	a,-1 (ix)
   5089 B7            [ 4] 2014 	or	a, a
   508A 20 1C         [12] 2015 	jr	NZ,00105$
   508C DD 7E FE      [19] 2016 	ld	a,-2 (ix)
   508F B7            [ 4] 2017 	or	a,a
   5090 20 16         [12] 2018 	jr	NZ,00105$
   5092 B3            [ 4] 2019 	or	a,e
   5093 20 13         [12] 2020 	jr	NZ,00105$
   5095 B1            [ 4] 2021 	or	a,c
   5096 20 10         [12] 2022 	jr	NZ,00105$
                           2023 ;src/CalcColision.h:14: if(atk >= 21)
   5098 DD 7E FD      [19] 2024 	ld	a,-3 (ix)
   509B B7            [ 4] 2025 	or	a, a
   509C 20 05         [12] 2026 	jr	NZ,00102$
                           2027 ;src/CalcColision.h:15: return 1;
   509E 2E 01         [ 7] 2028 	ld	l,#0x01
   50A0 C3 2C 51      [10] 2029 	jp	00133$
   50A3                    2030 00102$:
                           2031 ;src/CalcColision.h:17: return 2;
   50A3 2E 02         [ 7] 2032 	ld	l,#0x02
   50A5 C3 2C 51      [10] 2033 	jp	00133$
   50A8                    2034 00105$:
                           2035 ;src/CalcColision.h:19: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   50A8 DD 7E 06      [19] 2036 	ld	a,6 (ix)
   50AB DD 96 04      [19] 2037 	sub	a, 4 (ix)
   50AE 3E 00         [ 7] 2038 	ld	a,#0x00
   50B0 17            [ 4] 2039 	rla
   50B1 DD 77 FC      [19] 2040 	ld	-4 (ix),a
   50B4 7D            [ 4] 2041 	ld	a,l
   50B5 DD 96 06      [19] 2042 	sub	a, 6 (ix)
   50B8 3E 00         [ 7] 2043 	ld	a,#0x00
   50BA 17            [ 4] 2044 	rla
   50BB 6F            [ 4] 2045 	ld	l,a
   50BC DD 7E FC      [19] 2046 	ld	a,-4 (ix)
   50BF B7            [ 4] 2047 	or	a,a
   50C0 20 17         [12] 2048 	jr	NZ,00113$
   50C2 B5            [ 4] 2049 	or	a,l
   50C3 20 14         [12] 2050 	jr	NZ,00113$
   50C5 B3            [ 4] 2051 	or	a,e
   50C6 20 11         [12] 2052 	jr	NZ,00113$
   50C8 B1            [ 4] 2053 	or	a,c
   50C9 20 0E         [12] 2054 	jr	NZ,00113$
                           2055 ;src/CalcColision.h:20: if(atk >= 21)
   50CB DD 7E FD      [19] 2056 	ld	a,-3 (ix)
   50CE B7            [ 4] 2057 	or	a, a
   50CF 20 04         [12] 2058 	jr	NZ,00110$
                           2059 ;src/CalcColision.h:21: return 1;
   50D1 2E 01         [ 7] 2060 	ld	l,#0x01
   50D3 18 57         [12] 2061 	jr	00133$
   50D5                    2062 00110$:
                           2063 ;src/CalcColision.h:23: return 2;
   50D5 2E 02         [ 7] 2064 	ld	l,#0x02
   50D7 18 53         [12] 2065 	jr	00133$
   50D9                    2066 00113$:
                           2067 ;src/CalcColision.h:25: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   50D9 DD 7E FB      [19] 2068 	ld	a,-5 (ix)
   50DC DD 96 05      [19] 2069 	sub	a, 5 (ix)
   50DF 3E 00         [ 7] 2070 	ld	a,#0x00
   50E1 17            [ 4] 2071 	rla
   50E2 5F            [ 4] 2072 	ld	e,a
   50E3 DD 7E FA      [19] 2073 	ld	a,-6 (ix)
   50E6 DD 96 FB      [19] 2074 	sub	a, -5 (ix)
   50E9 3E 00         [ 7] 2075 	ld	a,#0x00
   50EB 17            [ 4] 2076 	rla
   50EC 67            [ 4] 2077 	ld	h,a
   50ED DD 7E FC      [19] 2078 	ld	a,-4 (ix)
   50F0 B7            [ 4] 2079 	or	a,a
   50F1 20 17         [12] 2080 	jr	NZ,00121$
   50F3 B5            [ 4] 2081 	or	a,l
   50F4 20 14         [12] 2082 	jr	NZ,00121$
   50F6 B3            [ 4] 2083 	or	a,e
   50F7 20 11         [12] 2084 	jr	NZ,00121$
   50F9 B4            [ 4] 2085 	or	a,h
   50FA 20 0E         [12] 2086 	jr	NZ,00121$
                           2087 ;src/CalcColision.h:26: if(atk >= 21)
   50FC DD 7E FD      [19] 2088 	ld	a,-3 (ix)
   50FF B7            [ 4] 2089 	or	a, a
   5100 20 04         [12] 2090 	jr	NZ,00118$
                           2091 ;src/CalcColision.h:27: return 1;
   5102 2E 01         [ 7] 2092 	ld	l,#0x01
   5104 18 26         [12] 2093 	jr	00133$
   5106                    2094 00118$:
                           2095 ;src/CalcColision.h:29: return 2;
   5106 2E 02         [ 7] 2096 	ld	l,#0x02
   5108 18 22         [12] 2097 	jr	00133$
   510A                    2098 00121$:
                           2099 ;src/CalcColision.h:31: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   510A DD 7E FF      [19] 2100 	ld	a,-1 (ix)
   510D B7            [ 4] 2101 	or	a, a
   510E 20 1A         [12] 2102 	jr	NZ,00129$
   5110 DD 7E FE      [19] 2103 	ld	a,-2 (ix)
   5113 B7            [ 4] 2104 	or	a,a
   5114 20 14         [12] 2105 	jr	NZ,00129$
   5116 B3            [ 4] 2106 	or	a,e
   5117 20 11         [12] 2107 	jr	NZ,00129$
   5119 B4            [ 4] 2108 	or	a,h
   511A 20 0E         [12] 2109 	jr	NZ,00129$
                           2110 ;src/CalcColision.h:32: if(atk >= 21)
   511C DD 7E FD      [19] 2111 	ld	a,-3 (ix)
   511F B7            [ 4] 2112 	or	a, a
   5120 20 04         [12] 2113 	jr	NZ,00126$
                           2114 ;src/CalcColision.h:33: return 1;
   5122 2E 01         [ 7] 2115 	ld	l,#0x01
   5124 18 06         [12] 2116 	jr	00133$
   5126                    2117 00126$:
                           2118 ;src/CalcColision.h:35: return 2;
   5126 2E 02         [ 7] 2119 	ld	l,#0x02
   5128 18 02         [12] 2120 	jr	00133$
   512A                    2121 00129$:
                           2122 ;src/CalcColision.h:37: return 0;
   512A 2E 00         [ 7] 2123 	ld	l,#0x00
   512C                    2124 00133$:
   512C DD F9         [10] 2125 	ld	sp, ix
   512E DD E1         [14] 2126 	pop	ix
   5130 C9            [10] 2127 	ret
                           2128 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2129 ;	---------------------------------
                           2130 ; Function checkKeyboard
                           2131 ; ---------------------------------
   5131                    2132 _checkKeyboard::
   5131 DD E5         [15] 2133 	push	ix
   5133 DD 21 00 00   [14] 2134 	ld	ix,#0
   5137 DD 39         [15] 2135 	add	ix,sp
   5139 21 FA FF      [10] 2136 	ld	hl,#-6
   513C 39            [11] 2137 	add	hl,sp
   513D F9            [ 6] 2138 	ld	sp,hl
                           2139 ;src/keyboard.h:14: u8 *s = NULL;
   513E DD 36 FE 00   [19] 2140 	ld	-2 (ix),#0x00
   5142 DD 36 FF 00   [19] 2141 	ld	-1 (ix),#0x00
                           2142 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   5146 21 05 80      [10] 2143 	ld	hl,#0x8005
   5149 CD 3E 68      [17] 2144 	call	_cpct_isKeyPressed
   514C 7D            [ 4] 2145 	ld	a,l
   514D B7            [ 4] 2146 	or	a, a
   514E 28 68         [12] 2147 	jr	Z,00147$
   5150 21 0C 6E      [10] 2148 	ld	hl, #(_player + 0x0008) + 0
   5153 7E            [ 7] 2149 	ld	a,(hl)
   5154 DD 77 FD      [19] 2150 	ld	-3 (ix), a
   5157 D6 14         [ 7] 2151 	sub	a, #0x14
   5159 38 5D         [12] 2152 	jr	C,00147$
                           2153 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   515B DD 7E FD      [19] 2154 	ld	a,-3 (ix)
   515E D6 32         [ 7] 2155 	sub	a, #0x32
   5160 38 07         [12] 2156 	jr	C,00102$
   5162 21 0C 6E      [10] 2157 	ld	hl,#(_player + 0x0008)
   5165 36 00         [10] 2158 	ld	(hl),#0x00
   5167 18 08         [12] 2159 	jr	00103$
   5169                    2160 00102$:
                           2161 ;src/keyboard.h:17: else player.atk += 1;
   5169 DD 7E FD      [19] 2162 	ld	a,-3 (ix)
   516C 3C            [ 4] 2163 	inc	a
   516D 21 0C 6E      [10] 2164 	ld	hl,#(_player + 0x0008)
   5170 77            [ 7] 2165 	ld	(hl),a
   5171                    2166 00103$:
                           2167 ;src/keyboard.h:18: switch(player.dir){
   5171 21 0B 6E      [10] 2168 	ld	hl, #_player + 7
   5174 66            [ 7] 2169 	ld	h,(hl)
   5175 7C            [ 4] 2170 	ld	a,h
   5176 D6 02         [ 7] 2171 	sub	a, #0x02
   5178 28 33         [12] 2172 	jr	Z,00107$
   517A 7C            [ 4] 2173 	ld	a,h
   517B D6 04         [ 7] 2174 	sub	a, #0x04
   517D 28 0D         [12] 2175 	jr	Z,00104$
   517F 7C            [ 4] 2176 	ld	a,h
   5180 D6 06         [ 7] 2177 	sub	a, #0x06
   5182 28 13         [12] 2178 	jr	Z,00105$
   5184 7C            [ 4] 2179 	ld	a,h
   5185 D6 08         [ 7] 2180 	sub	a, #0x08
   5187 28 19         [12] 2181 	jr	Z,00106$
   5189 C3 7F 53      [10] 2182 	jp	00148$
                           2183 ;src/keyboard.h:19: case 4:
   518C                    2184 00104$:
                           2185 ;src/keyboard.h:20: s = gladis_atk_izda;
   518C DD 36 FE 80   [19] 2186 	ld	-2 (ix),#<(_gladis_atk_izda)
   5190 DD 36 FF 41   [19] 2187 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2188 ;src/keyboard.h:21: break;
   5194 C3 7F 53      [10] 2189 	jp	00148$
                           2190 ;src/keyboard.h:22: case 6:
   5197                    2191 00105$:
                           2192 ;src/keyboard.h:23: s = gladis_atk_dcha;
   5197 DD 36 FE 00   [19] 2193 	ld	-2 (ix),#<(_gladis_atk_dcha)
   519B DD 36 FF 41   [19] 2194 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2195 ;src/keyboard.h:24: break;
   519F C3 7F 53      [10] 2196 	jp	00148$
                           2197 ;src/keyboard.h:25: case 8:
   51A2                    2198 00106$:
                           2199 ;src/keyboard.h:26: s = gladis_atk_arriba;
   51A2 DD 36 FE 80   [19] 2200 	ld	-2 (ix),#<(_gladis_atk_arriba)
   51A6 DD 36 FF 43   [19] 2201 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2202 ;src/keyboard.h:27: break;
   51AA C3 7F 53      [10] 2203 	jp	00148$
                           2204 ;src/keyboard.h:28: case 2:
   51AD                    2205 00107$:
                           2206 ;src/keyboard.h:29: s = gladis_atk_abajo;
   51AD DD 36 FE 00   [19] 2207 	ld	-2 (ix),#<(_gladis_atk_abajo)
   51B1 DD 36 FF 43   [19] 2208 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2209 ;src/keyboard.h:31: }
   51B5 C3 7F 53      [10] 2210 	jp	00148$
   51B8                    2211 00147$:
                           2212 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   51B8 21 0C 6E      [10] 2213 	ld	hl, #(_player + 0x0008) + 0
   51BB 56            [ 7] 2214 	ld	d,(hl)
   51BC 7A            [ 4] 2215 	ld	a,d
   51BD D6 14         [ 7] 2216 	sub	a, #0x14
   51BF 30 07         [12] 2217 	jr	NC,00110$
   51C1 14            [ 4] 2218 	inc	d
   51C2 21 0C 6E      [10] 2219 	ld	hl,#(_player + 0x0008)
   51C5 72            [ 7] 2220 	ld	(hl),d
   51C6 18 05         [12] 2221 	jr	00111$
   51C8                    2222 00110$:
                           2223 ;src/keyboard.h:34: else player.atk = 20;
   51C8 21 0C 6E      [10] 2224 	ld	hl,#(_player + 0x0008)
   51CB 36 14         [10] 2225 	ld	(hl),#0x14
   51CD                    2226 00111$:
                           2227 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   51CD 21 00 02      [10] 2228 	ld	hl,#0x0200
   51D0 CD 3E 68      [17] 2229 	call	_cpct_isKeyPressed
                           2230 ;src/keyboard.h:37: player.dir = 6;
                           2231 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   51D3 7D            [ 4] 2232 	ld	a,l
   51D4 B7            [ 4] 2233 	or	a, a
   51D5 28 1E         [12] 2234 	jr	Z,00143$
   51D7 21 04 6E      [10] 2235 	ld	hl, #_player + 0
   51DA 56            [ 7] 2236 	ld	d,(hl)
   51DB 7A            [ 4] 2237 	ld	a,d
   51DC D6 4C         [ 7] 2238 	sub	a, #0x4C
   51DE 30 15         [12] 2239 	jr	NC,00143$
                           2240 ;src/keyboard.h:36: player.x += 1;
   51E0 14            [ 4] 2241 	inc	d
   51E1 21 04 6E      [10] 2242 	ld	hl,#_player
   51E4 72            [ 7] 2243 	ld	(hl),d
                           2244 ;src/keyboard.h:37: player.dir = 6;
   51E5 21 0B 6E      [10] 2245 	ld	hl,#(_player + 0x0007)
   51E8 36 06         [10] 2246 	ld	(hl),#0x06
                           2247 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   51EA DD 36 FE 00   [19] 2248 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   51EE DD 36 FF 40   [19] 2249 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   51F2 C3 7F 53      [10] 2250 	jp	00148$
   51F5                    2251 00143$:
                           2252 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   51F5 21 01 01      [10] 2253 	ld	hl,#0x0101
   51F8 CD 3E 68      [17] 2254 	call	_cpct_isKeyPressed
   51FB 7D            [ 4] 2255 	ld	a,l
   51FC B7            [ 4] 2256 	or	a, a
   51FD 28 1B         [12] 2257 	jr	Z,00139$
   51FF 3A 04 6E      [13] 2258 	ld	a, (#_player + 0)
   5202 B7            [ 4] 2259 	or	a, a
   5203 28 15         [12] 2260 	jr	Z,00139$
                           2261 ;src/keyboard.h:40: player.x -= 1;
   5205 C6 FF         [ 7] 2262 	add	a,#0xFF
   5207 32 04 6E      [13] 2263 	ld	(#_player),a
                           2264 ;src/keyboard.h:41: player.dir = 4;
   520A 21 0B 6E      [10] 2265 	ld	hl,#(_player + 0x0007)
   520D 36 04         [10] 2266 	ld	(hl),#0x04
                           2267 ;src/keyboard.h:42: s = gladis_quieto_izda;
   520F DD 36 FE 80   [19] 2268 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5213 DD 36 FF 40   [19] 2269 	ld	-1 (ix),#>(_gladis_quieto_izda)
   5217 C3 7F 53      [10] 2270 	jp	00148$
   521A                    2271 00139$:
                           2272 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   521A 21 00 04      [10] 2273 	ld	hl,#0x0400
   521D CD 3E 68      [17] 2274 	call	_cpct_isKeyPressed
   5220 01 05 6E      [10] 2275 	ld	bc,#_player + 1
   5223 7D            [ 4] 2276 	ld	a,l
   5224 B7            [ 4] 2277 	or	a, a
   5225 28 1A         [12] 2278 	jr	Z,00135$
   5227 0A            [ 7] 2279 	ld	a,(bc)
   5228 67            [ 4] 2280 	ld	h,a
   5229 D6 B4         [ 7] 2281 	sub	a, #0xB4
   522B 30 14         [12] 2282 	jr	NC,00135$
                           2283 ;src/keyboard.h:44: player.y += 2;
   522D 7C            [ 4] 2284 	ld	a,h
   522E C6 02         [ 7] 2285 	add	a, #0x02
   5230 02            [ 7] 2286 	ld	(bc),a
                           2287 ;src/keyboard.h:45: player.dir = 2;
   5231 21 0B 6E      [10] 2288 	ld	hl,#(_player + 0x0007)
   5234 36 02         [10] 2289 	ld	(hl),#0x02
                           2290 ;src/keyboard.h:46: s = gladis_abajo;
   5236 DD 36 FE 80   [19] 2291 	ld	-2 (ix),#<(_gladis_abajo)
   523A DD 36 FF 42   [19] 2292 	ld	-1 (ix),#>(_gladis_abajo)
   523E C3 7F 53      [10] 2293 	jp	00148$
   5241                    2294 00135$:
                           2295 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   5241 C5            [11] 2296 	push	bc
   5242 21 00 01      [10] 2297 	ld	hl,#0x0100
   5245 CD 3E 68      [17] 2298 	call	_cpct_isKeyPressed
   5248 7D            [ 4] 2299 	ld	a,l
   5249 C1            [10] 2300 	pop	bc
   524A B7            [ 4] 2301 	or	a, a
   524B 28 17         [12] 2302 	jr	Z,00131$
   524D 0A            [ 7] 2303 	ld	a,(bc)
   524E B7            [ 4] 2304 	or	a, a
   524F 28 13         [12] 2305 	jr	Z,00131$
                           2306 ;src/keyboard.h:48: player.y -= 2;
   5251 C6 FE         [ 7] 2307 	add	a,#0xFE
   5253 02            [ 7] 2308 	ld	(bc),a
                           2309 ;src/keyboard.h:49: player.dir = 8;
   5254 21 0B 6E      [10] 2310 	ld	hl,#(_player + 0x0007)
   5257 36 08         [10] 2311 	ld	(hl),#0x08
                           2312 ;src/keyboard.h:50: s = gladis_arriba;
   5259 DD 36 FE 00   [19] 2313 	ld	-2 (ix),#<(_gladis_arriba)
   525D DD 36 FF 42   [19] 2314 	ld	-1 (ix),#>(_gladis_arriba)
   5261 C3 7F 53      [10] 2315 	jp	00148$
   5264                    2316 00131$:
                           2317 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   5264 C5            [11] 2318 	push	bc
   5265 21 07 80      [10] 2319 	ld	hl,#0x8007
   5268 CD 3E 68      [17] 2320 	call	_cpct_isKeyPressed
   526B 7D            [ 4] 2321 	ld	a,l
   526C C1            [10] 2322 	pop	bc
   526D B7            [ 4] 2323 	or	a, a
   526E CA 3F 53      [10] 2324 	jp	Z,00125$
   5271 3A F6 6D      [13] 2325 	ld	a,(#_arrow + 0)
   5274 B7            [ 4] 2326 	or	a, a
   5275 C2 3F 53      [10] 2327 	jp	NZ,00125$
   5278 3A 0C 6E      [13] 2328 	ld	a, (#(_player + 0x0008) + 0)
   527B D6 14         [ 7] 2329 	sub	a, #0x14
   527D C2 3F 53      [10] 2330 	jp	NZ,00125$
   5280 3A 0E 6E      [13] 2331 	ld	a, (#(_player + 0x000a) + 0)
   5283 B7            [ 4] 2332 	or	a, a
   5284 CA 3F 53      [10] 2333 	jp	Z,00125$
                           2334 ;src/keyboard.h:52: if(player.bullets> 0){
   5287 B7            [ 4] 2335 	or	a, a
   5288 CA 38 53      [10] 2336 	jp	Z,00118$
                           2337 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   528B DD 36 FB DA   [19] 2338 	ld	-5 (ix),#<(_flecha_dcha)
   528F DD 36 FC 67   [19] 2339 	ld	-4 (ix),#>(_flecha_dcha)
   5293 DD 36 FA 02   [19] 2340 	ld	-6 (ix),#0x02
   5297 1E 08         [ 7] 2341 	ld	e,#0x08
                           2342 ;src/keyboard.h:54: switch(player.dir){
   5299 21 0B 6E      [10] 2343 	ld	hl, #(_player + 0x0007) + 0
   529C 56            [ 7] 2344 	ld	d,(hl)
   529D 7A            [ 4] 2345 	ld	a,d
   529E D6 02         [ 7] 2346 	sub	a, #0x02
   52A0 28 31         [12] 2347 	jr	Z,00114$
   52A2 7A            [ 4] 2348 	ld	a,d
   52A3 D6 04         [ 7] 2349 	sub	a, #0x04
   52A5 28 1C         [12] 2350 	jr	Z,00113$
   52A7 7A            [ 4] 2351 	ld	a,d
   52A8 D6 06         [ 7] 2352 	sub	a, #0x06
   52AA 28 07         [12] 2353 	jr	Z,00112$
   52AC 7A            [ 4] 2354 	ld	a,d
   52AD D6 08         [ 7] 2355 	sub	a, #0x08
   52AF 28 32         [12] 2356 	jr	Z,00115$
   52B1 18 3E         [12] 2357 	jr	00116$
                           2358 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   52B3                    2359 00112$:
   52B3 DD 36 FB DA   [19] 2360 	ld	-5 (ix),#<(_flecha_dcha)
   52B7 DD 36 FC 67   [19] 2361 	ld	-4 (ix),#>(_flecha_dcha)
   52BB DD 36 FA 04   [19] 2362 	ld	-6 (ix),#0x04
   52BF 1E 04         [ 7] 2363 	ld	e,#0x04
   52C1 18 2E         [12] 2364 	jr	00116$
                           2365 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   52C3                    2366 00113$:
   52C3 DD 36 FB FA   [19] 2367 	ld	-5 (ix),#<(_flecha_izda)
   52C7 DD 36 FC 67   [19] 2368 	ld	-4 (ix),#>(_flecha_izda)
   52CB DD 36 FA 04   [19] 2369 	ld	-6 (ix),#0x04
   52CF 1E 04         [ 7] 2370 	ld	e,#0x04
   52D1 18 1E         [12] 2371 	jr	00116$
                           2372 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   52D3                    2373 00114$:
   52D3 DD 36 FB BA   [19] 2374 	ld	-5 (ix),#<(_flecha_abajo)
   52D7 DD 36 FC 67   [19] 2375 	ld	-4 (ix),#>(_flecha_abajo)
   52DB DD 36 FA 02   [19] 2376 	ld	-6 (ix),#0x02
   52DF 1E 08         [ 7] 2377 	ld	e,#0x08
   52E1 18 0E         [12] 2378 	jr	00116$
                           2379 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   52E3                    2380 00115$:
   52E3 DD 36 FB 9A   [19] 2381 	ld	-5 (ix),#<(_flecha_arriba)
   52E7 DD 36 FC 67   [19] 2382 	ld	-4 (ix),#>(_flecha_arriba)
   52EB DD 36 FA 02   [19] 2383 	ld	-6 (ix),#0x02
   52EF 1E 08         [ 7] 2384 	ld	e,#0x08
                           2385 ;src/keyboard.h:59: }
   52F1                    2386 00116$:
                           2387 ;src/keyboard.h:60: player.atk = 0;
   52F1 21 0C 6E      [10] 2388 	ld	hl,#(_player + 0x0008)
   52F4 36 00         [10] 2389 	ld	(hl),#0x00
                           2390 ;src/keyboard.h:61: object.x = player.x;
   52F6 3A 04 6E      [13] 2391 	ld	a, (#_player + 0)
   52F9 32 FA 6D      [13] 2392 	ld	(#_object),a
                           2393 ;src/keyboard.h:62: object.y = player.y+8;
   52FC 0A            [ 7] 2394 	ld	a,(bc)
   52FD C6 08         [ 7] 2395 	add	a, #0x08
   52FF 32 FB 6D      [13] 2396 	ld	(#(_object + 0x0001)),a
                           2397 ;src/keyboard.h:63: object.x = object.x;
   5302 21 FA 6D      [10] 2398 	ld	hl, #_object + 0
   5305 56            [ 7] 2399 	ld	d,(hl)
   5306 21 FA 6D      [10] 2400 	ld	hl,#_object
   5309 72            [ 7] 2401 	ld	(hl),d
                           2402 ;src/keyboard.h:64: object.y = object.y;
   530A 32 FB 6D      [13] 2403 	ld	(#(_object + 0x0001)),a
                           2404 ;src/keyboard.h:65: object.sprite = spr;
   530D 21 FE 6D      [10] 2405 	ld	hl,#_object + 4
   5310 DD 7E FB      [19] 2406 	ld	a,-5 (ix)
   5313 77            [ 7] 2407 	ld	(hl),a
   5314 23            [ 6] 2408 	inc	hl
   5315 DD 7E FC      [19] 2409 	ld	a,-4 (ix)
   5318 77            [ 7] 2410 	ld	(hl),a
                           2411 ;src/keyboard.h:66: object.vivo = 1;
   5319 21 00 6E      [10] 2412 	ld	hl,#_object + 6
   531C 36 01         [10] 2413 	ld	(hl),#0x01
                           2414 ;src/keyboard.h:67: object.dir = player.dir;
   531E 01 01 6E      [10] 2415 	ld	bc,#_object + 7
   5321 3A 0B 6E      [13] 2416 	ld	a, (#(_player + 0x0007) + 0)
   5324 02            [ 7] 2417 	ld	(bc),a
                           2418 ;src/keyboard.h:68: object.sizeX = xs;
   5325 21 02 6E      [10] 2419 	ld	hl,#_object + 8
   5328 DD 7E FA      [19] 2420 	ld	a,-6 (ix)
   532B 77            [ 7] 2421 	ld	(hl),a
                           2422 ;src/keyboard.h:69: object.sizeY = ys;
   532C 21 03 6E      [10] 2423 	ld	hl,#_object + 9
   532F 73            [ 7] 2424 	ld	(hl),e
                           2425 ;src/keyboard.h:70: player.bullets--;
   5330 3A 0E 6E      [13] 2426 	ld	a, (#(_player + 0x000a) + 0)
   5333 C6 FF         [ 7] 2427 	add	a,#0xFF
   5335 32 0E 6E      [13] 2428 	ld	(#(_player + 0x000a)),a
   5338                    2429 00118$:
                           2430 ;src/keyboard.h:72: arrow=1;
   5338 21 F6 6D      [10] 2431 	ld	hl,#_arrow + 0
   533B 36 01         [10] 2432 	ld	(hl), #0x01
   533D 18 40         [12] 2433 	jr	00148$
   533F                    2434 00125$:
                           2435 ;src/keyboard.h:74: switch(player.dir){
   533F 21 0B 6E      [10] 2436 	ld	hl, #(_player + 0x0007) + 0
   5342 66            [ 7] 2437 	ld	h,(hl)
   5343 7C            [ 4] 2438 	ld	a,h
   5344 D6 02         [ 7] 2439 	sub	a, #0x02
   5346 28 2F         [12] 2440 	jr	Z,00122$
   5348 7C            [ 4] 2441 	ld	a,h
   5349 D6 04         [ 7] 2442 	sub	a, #0x04
   534B 28 0C         [12] 2443 	jr	Z,00119$
   534D 7C            [ 4] 2444 	ld	a,h
   534E D6 06         [ 7] 2445 	sub	a, #0x06
   5350 28 11         [12] 2446 	jr	Z,00120$
   5352 7C            [ 4] 2447 	ld	a,h
   5353 D6 08         [ 7] 2448 	sub	a, #0x08
   5355 28 16         [12] 2449 	jr	Z,00121$
   5357 18 26         [12] 2450 	jr	00148$
                           2451 ;src/keyboard.h:75: case 4:
   5359                    2452 00119$:
                           2453 ;src/keyboard.h:76: s = gladis_quieto_izda;
   5359 DD 36 FE 80   [19] 2454 	ld	-2 (ix),#<(_gladis_quieto_izda)
   535D DD 36 FF 40   [19] 2455 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           2456 ;src/keyboard.h:77: break;
   5361 18 1C         [12] 2457 	jr	00148$
                           2458 ;src/keyboard.h:78: case 6:
   5363                    2459 00120$:
                           2460 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   5363 DD 36 FE 00   [19] 2461 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   5367 DD 36 FF 40   [19] 2462 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           2463 ;src/keyboard.h:80: break;
   536B 18 12         [12] 2464 	jr	00148$
                           2465 ;src/keyboard.h:81: case 8:
   536D                    2466 00121$:
                           2467 ;src/keyboard.h:82: s = gladis_arriba;
   536D DD 36 FE 00   [19] 2468 	ld	-2 (ix),#<(_gladis_arriba)
   5371 DD 36 FF 42   [19] 2469 	ld	-1 (ix),#>(_gladis_arriba)
                           2470 ;src/keyboard.h:83: break;
   5375 18 08         [12] 2471 	jr	00148$
                           2472 ;src/keyboard.h:84: case 2:
   5377                    2473 00122$:
                           2474 ;src/keyboard.h:85: s = gladis_abajo;
   5377 DD 36 FE 80   [19] 2475 	ld	-2 (ix),#<(_gladis_abajo)
   537B DD 36 FF 42   [19] 2476 	ld	-1 (ix),#>(_gladis_abajo)
                           2477 ;src/keyboard.h:87: }
   537F                    2478 00148$:
                           2479 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   537F 21 04 10      [10] 2480 	ld	hl,#0x1004
   5382 CD 3E 68      [17] 2481 	call	_cpct_isKeyPressed
   5385 7D            [ 4] 2482 	ld	a,l
   5386 B7            [ 4] 2483 	or	a, a
   5387 28 05         [12] 2484 	jr	Z,00151$
                           2485 ;src/keyboard.h:94: arrow = 0;
   5389 21 F6 6D      [10] 2486 	ld	hl,#_arrow + 0
   538C 36 00         [10] 2487 	ld	(hl), #0x00
   538E                    2488 00151$:
                           2489 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   538E 21 08 04      [10] 2490 	ld	hl,#0x0408
   5391 CD 3E 68      [17] 2491 	call	_cpct_isKeyPressed
   5394 7D            [ 4] 2492 	ld	a,l
   5395 B7            [ 4] 2493 	or	a, a
   5396 28 05         [12] 2494 	jr	Z,00153$
                           2495 ;src/keyboard.h:97: finish = 1;
   5398 21 F5 6D      [10] 2496 	ld	hl,#_finish + 0
   539B 36 01         [10] 2497 	ld	(hl), #0x01
   539D                    2498 00153$:
                           2499 ;src/keyboard.h:99: return s;
   539D DD 6E FE      [19] 2500 	ld	l,-2 (ix)
   53A0 DD 66 FF      [19] 2501 	ld	h,-1 (ix)
   53A3 DD F9         [10] 2502 	ld	sp, ix
   53A5 DD E1         [14] 2503 	pop	ix
   53A7 C9            [10] 2504 	ret
                           2505 ;src/keyboard.h:102: void moveObject(){
                           2506 ;	---------------------------------
                           2507 ; Function moveObject
                           2508 ; ---------------------------------
   53A8                    2509 _moveObject::
                           2510 ;src/keyboard.h:103: object.lx = object.x;
   53A8 01 FA 6D      [10] 2511 	ld	bc,#_object+0
   53AB 0A            [ 7] 2512 	ld	a,(bc)
   53AC 32 FC 6D      [13] 2513 	ld	(#(_object + 0x0002)),a
                           2514 ;src/keyboard.h:104: object.ly = object.y;
   53AF 59            [ 4] 2515 	ld	e, c
   53B0 50            [ 4] 2516 	ld	d, b
   53B1 13            [ 6] 2517 	inc	de
   53B2 1A            [ 7] 2518 	ld	a,(de)
   53B3 32 FD 6D      [13] 2519 	ld	(#(_object + 0x0003)),a
                           2520 ;src/keyboard.h:105: switch(object.dir){
   53B6 3A 01 6E      [13] 2521 	ld	a,(#_object + 7)
   53B9 FE 02         [ 7] 2522 	cp	a,#0x02
   53BB 28 16         [12] 2523 	jr	Z,00103$
   53BD FE 04         [ 7] 2524 	cp	a,#0x04
   53BF 28 0D         [12] 2525 	jr	Z,00102$
   53C1 FE 06         [ 7] 2526 	cp	a,#0x06
   53C3 28 05         [12] 2527 	jr	Z,00101$
   53C5 D6 08         [ 7] 2528 	sub	a, #0x08
   53C7 28 0F         [12] 2529 	jr	Z,00104$
   53C9 C9            [10] 2530 	ret
                           2531 ;src/keyboard.h:106: case 6: object.x += 1; break;
   53CA                    2532 00101$:
   53CA 0A            [ 7] 2533 	ld	a,(bc)
   53CB 3C            [ 4] 2534 	inc	a
   53CC 02            [ 7] 2535 	ld	(bc),a
   53CD C9            [10] 2536 	ret
                           2537 ;src/keyboard.h:107: case 4: object.x -= 1; break;
   53CE                    2538 00102$:
   53CE 0A            [ 7] 2539 	ld	a,(bc)
   53CF C6 FF         [ 7] 2540 	add	a,#0xFF
   53D1 02            [ 7] 2541 	ld	(bc),a
   53D2 C9            [10] 2542 	ret
                           2543 ;src/keyboard.h:108: case 2: object.y += 2; break;
   53D3                    2544 00103$:
   53D3 1A            [ 7] 2545 	ld	a,(de)
   53D4 C6 02         [ 7] 2546 	add	a, #0x02
   53D6 12            [ 7] 2547 	ld	(de),a
   53D7 C9            [10] 2548 	ret
                           2549 ;src/keyboard.h:109: case 8: object.y -= 2; break;
   53D8                    2550 00104$:
   53D8 1A            [ 7] 2551 	ld	a,(de)
   53D9 C6 FE         [ 7] 2552 	add	a,#0xFE
   53DB 12            [ 7] 2553 	ld	(de),a
                           2554 ;src/keyboard.h:110: }
   53DC C9            [10] 2555 	ret
                           2556 ;src/main.c:37: void init(){
                           2557 ;	---------------------------------
                           2558 ; Function init
                           2559 ; ---------------------------------
   53DD                    2560 _init::
                           2561 ;src/main.c:38: cpct_disableFirmware();
   53DD CD 2A 6B      [17] 2562 	call	_cpct_disableFirmware
                           2563 ;src/main.c:39: cpct_setVideoMode(0);
   53E0 AF            [ 4] 2564 	xor	a, a
   53E1 F5            [11] 2565 	push	af
   53E2 33            [ 6] 2566 	inc	sp
   53E3 CD 07 6B      [17] 2567 	call	_cpct_setVideoMode
   53E6 33            [ 6] 2568 	inc	sp
                           2569 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   53E7 11 0E 49      [10] 2570 	ld	de,#_g_palette
   53EA 3E 04         [ 7] 2571 	ld	a,#0x04
   53EC F5            [11] 2572 	push	af
   53ED 33            [ 6] 2573 	inc	sp
   53EE D5            [11] 2574 	push	de
   53EF CD 91 6A      [17] 2575 	call	_cpct_fw2hw
   53F2 F1            [10] 2576 	pop	af
   53F3 33            [ 6] 2577 	inc	sp
                           2578 ;src/main.c:41: cpct_setPalette(g_palette,4);
   53F4 11 0E 49      [10] 2579 	ld	de,#_g_palette
   53F7 3E 04         [ 7] 2580 	ld	a,#0x04
   53F9 F5            [11] 2581 	push	af
   53FA 33            [ 6] 2582 	inc	sp
   53FB D5            [11] 2583 	push	de
   53FC CD 1A 68      [17] 2584 	call	_cpct_setPalette
   53FF F1            [10] 2585 	pop	af
   5400 33            [ 6] 2586 	inc	sp
   5401 C9            [10] 2587 	ret
                           2588 ;src/main.c:44: void initPlayer(){
                           2589 ;	---------------------------------
                           2590 ; Function initPlayer
                           2591 ; ---------------------------------
   5402                    2592 _initPlayer::
                           2593 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           2594 ;src/main.c:46: player.x = origins[0][0];
   5402 01 13 49      [10] 2595 	ld	bc,#_origins+0
   5405 0A            [ 7] 2596 	ld	a,(bc)
   5406 32 04 6E      [13] 2597 	ld	(#_player),a
                           2598 ;src/main.c:47: player.y = origins[0][1];
   5409 59            [ 4] 2599 	ld	e, c
   540A 50            [ 4] 2600 	ld	d, b
   540B 13            [ 6] 2601 	inc	de
   540C 1A            [ 7] 2602 	ld	a,(de)
   540D 32 05 6E      [13] 2603 	ld	(#(_player + 0x0001)),a
                           2604 ;src/main.c:48: player.lx = origins[0][0];
   5410 0A            [ 7] 2605 	ld	a,(bc)
   5411 32 06 6E      [13] 2606 	ld	(#(_player + 0x0002)),a
                           2607 ;src/main.c:49: player.ly = origins[0][1];
   5414 1A            [ 7] 2608 	ld	a,(de)
   5415 32 07 6E      [13] 2609 	ld	(#(_player + 0x0003)),a
                           2610 ;src/main.c:50: player.sprite = sprite;
   5418 21 00 40      [10] 2611 	ld	hl,#_gladis_quieto_dcha
   541B 22 08 6E      [16] 2612 	ld	((_player + 0x0004)), hl
                           2613 ;src/main.c:51: player.life = 3;
   541E 21 0A 6E      [10] 2614 	ld	hl,#_player + 6
   5421 36 03         [10] 2615 	ld	(hl),#0x03
                           2616 ;src/main.c:52: player.dir = 6;
   5423 21 0B 6E      [10] 2617 	ld	hl,#_player + 7
   5426 36 06         [10] 2618 	ld	(hl),#0x06
                           2619 ;src/main.c:53: player.atk = 20;
   5428 21 0C 6E      [10] 2620 	ld	hl,#_player + 8
   542B 36 14         [10] 2621 	ld	(hl),#0x14
                           2622 ;src/main.c:54: player.latk = 20;
   542D 21 0D 6E      [10] 2623 	ld	hl,#_player + 9
   5430 36 14         [10] 2624 	ld	(hl),#0x14
                           2625 ;src/main.c:55: player.bullets = 3;
   5432 21 0E 6E      [10] 2626 	ld	hl,#_player + 10
   5435 36 03         [10] 2627 	ld	(hl),#0x03
   5437 C9            [10] 2628 	ret
                           2629 ;src/main.c:58: void initEnemies(){
                           2630 ;	---------------------------------
                           2631 ; Function initEnemies
                           2632 ; ---------------------------------
   5438                    2633 _initEnemies::
                           2634 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           2635 ;src/main.c:60: enemy.x = origins[1][0];
   5438 01 15 49      [10] 2636 	ld	bc,#_origins + 2
   543B 0A            [ 7] 2637 	ld	a,(bc)
   543C 32 0F 6E      [13] 2638 	ld	(#_enemy),a
                           2639 ;src/main.c:61: enemy.y = origins[1][1];
   543F 11 16 49      [10] 2640 	ld	de,#_origins + 3
   5442 1A            [ 7] 2641 	ld	a,(de)
   5443 32 10 6E      [13] 2642 	ld	(#(_enemy + 0x0001)),a
                           2643 ;src/main.c:62: enemy.lx = origins[1][0];
   5446 0A            [ 7] 2644 	ld	a,(bc)
   5447 32 11 6E      [13] 2645 	ld	(#(_enemy + 0x0002)),a
                           2646 ;src/main.c:63: enemy.ly = origins[1][1];
   544A 1A            [ 7] 2647 	ld	a,(de)
   544B 32 12 6E      [13] 2648 	ld	(#(_enemy + 0x0003)),a
                           2649 ;src/main.c:64: enemy.ox = origins[1][0];
   544E 0A            [ 7] 2650 	ld	a,(bc)
   544F 32 13 6E      [13] 2651 	ld	(#(_enemy + 0x0004)),a
                           2652 ;src/main.c:65: enemy.oy = origins[1][1];
   5452 1A            [ 7] 2653 	ld	a,(de)
   5453 32 14 6E      [13] 2654 	ld	(#(_enemy + 0x0005)),a
                           2655 ;src/main.c:66: enemy.sprite = sprite;
   5456 21 00 44      [10] 2656 	ld	hl,#_chacho_dcha
   5459 22 15 6E      [16] 2657 	ld	((_enemy + 0x0006)), hl
                           2658 ;src/main.c:67: enemy.life = 3;
   545C 21 17 6E      [10] 2659 	ld	hl,#_enemy + 8
   545F 36 03         [10] 2660 	ld	(hl),#0x03
                           2661 ;src/main.c:68: enemy.dir = 6;
   5461 21 18 6E      [10] 2662 	ld	hl,#_enemy + 9
   5464 36 06         [10] 2663 	ld	(hl),#0x06
                           2664 ;src/main.c:69: enemy.bullets = 3;
   5466 21 19 6E      [10] 2665 	ld	hl,#_enemy + 10
   5469 36 03         [10] 2666 	ld	(hl),#0x03
                           2667 ;src/main.c:70: enemy.room = 3;
   546B 21 1A 6E      [10] 2668 	ld	hl,#_enemy + 11
   546E 36 03         [10] 2669 	ld	(hl),#0x03
   5470 C9            [10] 2670 	ret
                           2671 ;src/main.c:75: void gameOver(){
                           2672 ;	---------------------------------
                           2673 ; Function gameOver
                           2674 ; ---------------------------------
   5471                    2675 _gameOver::
                           2676 ;src/main.c:77: cpct_clearScreen(0);
   5471 21 00 40      [10] 2677 	ld	hl,#0x4000
   5474 E5            [11] 2678 	push	hl
   5475 AF            [ 4] 2679 	xor	a, a
   5476 F5            [11] 2680 	push	af
   5477 33            [ 6] 2681 	inc	sp
   5478 26 C0         [ 7] 2682 	ld	h, #0xC0
   547A E5            [11] 2683 	push	hl
   547B CD 19 6B      [17] 2684 	call	_cpct_memset
                           2685 ;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
   547E 21 0A 0A      [10] 2686 	ld	hl,#0x0A0A
   5481 E5            [11] 2687 	push	hl
   5482 21 00 C0      [10] 2688 	ld	hl,#0xC000
   5485 E5            [11] 2689 	push	hl
   5486 CD 0C 6C      [17] 2690 	call	_cpct_getScreenPtr
                           2691 ;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5489 4D            [ 4] 2692 	ld	c, l
   548A 44            [ 4] 2693 	ld	b, h
   548B 11 9D 54      [10] 2694 	ld	de,#___str_0
   548E 21 01 00      [10] 2695 	ld	hl,#0x0001
   5491 E5            [11] 2696 	push	hl
   5492 C5            [11] 2697 	push	bc
   5493 D5            [11] 2698 	push	de
   5494 CD 2B 69      [17] 2699 	call	_cpct_drawStringM0
   5497 21 06 00      [10] 2700 	ld	hl,#6
   549A 39            [11] 2701 	add	hl,sp
   549B F9            [ 6] 2702 	ld	sp,hl
   549C C9            [10] 2703 	ret
   549D                    2704 ___str_0:
   549D 4C 6F 75 6E 67 65  2705 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   54AD 00                 2706 	.db 0x00
                           2707 ;src/main.c:84: int menu(){
                           2708 ;	---------------------------------
                           2709 ; Function menu
                           2710 ; ---------------------------------
   54AE                    2711 _menu::
   54AE DD E5         [15] 2712 	push	ix
   54B0 DD 21 00 00   [14] 2713 	ld	ix,#0
   54B4 DD 39         [15] 2714 	add	ix,sp
   54B6 21 FA FF      [10] 2715 	ld	hl,#-6
   54B9 39            [11] 2716 	add	hl,sp
   54BA F9            [ 6] 2717 	ld	sp,hl
                           2718 ;src/main.c:86: int init = 50;
   54BB DD 36 FC 32   [19] 2719 	ld	-4 (ix),#0x32
   54BF DD 36 FD 00   [19] 2720 	ld	-3 (ix),#0x00
                           2721 ;src/main.c:87: int pushed =0;
   54C3 21 00 00      [10] 2722 	ld	hl,#0x0000
   54C6 E3            [19] 2723 	ex	(sp), hl
                           2724 ;src/main.c:88: int cont =0;
   54C7 11 00 00      [10] 2725 	ld	de,#0x0000
                           2726 ;src/main.c:89: cpct_clearScreen(0);
   54CA D5            [11] 2727 	push	de
   54CB 21 00 40      [10] 2728 	ld	hl,#0x4000
   54CE E5            [11] 2729 	push	hl
   54CF AF            [ 4] 2730 	xor	a, a
   54D0 F5            [11] 2731 	push	af
   54D1 33            [ 6] 2732 	inc	sp
   54D2 26 C0         [ 7] 2733 	ld	h, #0xC0
   54D4 E5            [11] 2734 	push	hl
   54D5 CD 19 6B      [17] 2735 	call	_cpct_memset
   54D8 21 0A 0A      [10] 2736 	ld	hl,#0x0A0A
   54DB E5            [11] 2737 	push	hl
   54DC 21 00 C0      [10] 2738 	ld	hl,#0xC000
   54DF E5            [11] 2739 	push	hl
   54E0 CD 0C 6C      [17] 2740 	call	_cpct_getScreenPtr
   54E3 D1            [10] 2741 	pop	de
                           2742 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   54E4 4D            [ 4] 2743 	ld	c, l
   54E5 44            [ 4] 2744 	ld	b, h
   54E6 D5            [11] 2745 	push	de
   54E7 21 01 00      [10] 2746 	ld	hl,#0x0001
   54EA E5            [11] 2747 	push	hl
   54EB C5            [11] 2748 	push	bc
   54EC 21 91 56      [10] 2749 	ld	hl,#___str_1
   54EF E5            [11] 2750 	push	hl
   54F0 CD 2B 69      [17] 2751 	call	_cpct_drawStringM0
   54F3 21 06 00      [10] 2752 	ld	hl,#6
   54F6 39            [11] 2753 	add	hl,sp
   54F7 F9            [ 6] 2754 	ld	sp,hl
   54F8 21 14 32      [10] 2755 	ld	hl,#0x3214
   54FB E5            [11] 2756 	push	hl
   54FC 21 00 C0      [10] 2757 	ld	hl,#0xC000
   54FF E5            [11] 2758 	push	hl
   5500 CD 0C 6C      [17] 2759 	call	_cpct_getScreenPtr
   5503 D1            [10] 2760 	pop	de
                           2761 ;src/main.c:96: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   5504 4D            [ 4] 2762 	ld	c, l
   5505 44            [ 4] 2763 	ld	b, h
   5506 D5            [11] 2764 	push	de
   5507 21 01 00      [10] 2765 	ld	hl,#0x0001
   550A E5            [11] 2766 	push	hl
   550B C5            [11] 2767 	push	bc
   550C 21 A2 56      [10] 2768 	ld	hl,#___str_2
   550F E5            [11] 2769 	push	hl
   5510 CD 2B 69      [17] 2770 	call	_cpct_drawStringM0
   5513 21 06 00      [10] 2771 	ld	hl,#6
   5516 39            [11] 2772 	add	hl,sp
   5517 F9            [ 6] 2773 	ld	sp,hl
   5518 21 14 46      [10] 2774 	ld	hl,#0x4614
   551B E5            [11] 2775 	push	hl
   551C 21 00 C0      [10] 2776 	ld	hl,#0xC000
   551F E5            [11] 2777 	push	hl
   5520 CD 0C 6C      [17] 2778 	call	_cpct_getScreenPtr
   5523 D1            [10] 2779 	pop	de
                           2780 ;src/main.c:99: cpct_drawStringM0("Creditos",memptr,1,0);
   5524 4D            [ 4] 2781 	ld	c, l
   5525 44            [ 4] 2782 	ld	b, h
   5526 D5            [11] 2783 	push	de
   5527 21 01 00      [10] 2784 	ld	hl,#0x0001
   552A E5            [11] 2785 	push	hl
   552B C5            [11] 2786 	push	bc
   552C 21 B0 56      [10] 2787 	ld	hl,#___str_3
   552F E5            [11] 2788 	push	hl
   5530 CD 2B 69      [17] 2789 	call	_cpct_drawStringM0
   5533 21 06 00      [10] 2790 	ld	hl,#6
   5536 39            [11] 2791 	add	hl,sp
   5537 F9            [ 6] 2792 	ld	sp,hl
   5538 21 14 5A      [10] 2793 	ld	hl,#0x5A14
   553B E5            [11] 2794 	push	hl
   553C 21 00 C0      [10] 2795 	ld	hl,#0xC000
   553F E5            [11] 2796 	push	hl
   5540 CD 0C 6C      [17] 2797 	call	_cpct_getScreenPtr
   5543 D1            [10] 2798 	pop	de
                           2799 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5544 DD 75 FE      [19] 2800 	ld	-2 (ix),l
   5547 DD 74 FF      [19] 2801 	ld	-1 (ix),h
                           2802 ;src/main.c:102: cpct_drawStringM0("Salir",memptr,1,0);
   554A 01 B9 56      [10] 2803 	ld	bc,#___str_4
   554D D5            [11] 2804 	push	de
   554E 21 01 00      [10] 2805 	ld	hl,#0x0001
   5551 E5            [11] 2806 	push	hl
   5552 DD 6E FE      [19] 2807 	ld	l,-2 (ix)
   5555 DD 66 FF      [19] 2808 	ld	h,-1 (ix)
   5558 E5            [11] 2809 	push	hl
   5559 C5            [11] 2810 	push	bc
   555A CD 2B 69      [17] 2811 	call	_cpct_drawStringM0
   555D 21 06 00      [10] 2812 	ld	hl,#6
   5560 39            [11] 2813 	add	hl,sp
   5561 F9            [ 6] 2814 	ld	sp,hl
   5562 D1            [10] 2815 	pop	de
                           2816 ;src/main.c:108: while(1){
   5563                    2817 00118$:
                           2818 ;src/main.c:110: cpct_scanKeyboard();
   5563 D5            [11] 2819 	push	de
   5564 CD 2C 6C      [17] 2820 	call	_cpct_scanKeyboard
   5567 21 00 04      [10] 2821 	ld	hl,#0x0400
   556A CD 3E 68      [17] 2822 	call	_cpct_isKeyPressed
   556D 7D            [ 4] 2823 	ld	a,l
   556E D1            [10] 2824 	pop	de
   556F B7            [ 4] 2825 	or	a, a
   5570 28 2D         [12] 2826 	jr	Z,00102$
   5572 3E 96         [ 7] 2827 	ld	a,#0x96
   5574 BB            [ 4] 2828 	cp	a, e
   5575 3E 00         [ 7] 2829 	ld	a,#0x00
   5577 9A            [ 4] 2830 	sbc	a, d
   5578 E2 7D 55      [10] 2831 	jp	PO, 00162$
   557B EE 80         [ 7] 2832 	xor	a, #0x80
   557D                    2833 00162$:
   557D F2 9F 55      [10] 2834 	jp	P,00102$
                           2835 ;src/main.c:112: cpct_drawSolidBox(memptr, 0, 2, 8);
   5580 21 02 08      [10] 2836 	ld	hl,#0x0802
   5583 E5            [11] 2837 	push	hl
   5584 AF            [ 4] 2838 	xor	a, a
   5585 F5            [11] 2839 	push	af
   5586 33            [ 6] 2840 	inc	sp
   5587 DD 6E FE      [19] 2841 	ld	l,-2 (ix)
   558A DD 66 FF      [19] 2842 	ld	h,-1 (ix)
   558D E5            [11] 2843 	push	hl
   558E CD 3B 6B      [17] 2844 	call	_cpct_drawSolidBox
   5591 F1            [10] 2845 	pop	af
   5592 F1            [10] 2846 	pop	af
   5593 33            [ 6] 2847 	inc	sp
                           2848 ;src/main.c:113: pushed ++;
   5594 DD 34 FA      [23] 2849 	inc	-6 (ix)
   5597 20 03         [12] 2850 	jr	NZ,00163$
   5599 DD 34 FB      [23] 2851 	inc	-5 (ix)
   559C                    2852 00163$:
                           2853 ;src/main.c:114: cont =0;
   559C 11 00 00      [10] 2854 	ld	de,#0x0000
   559F                    2855 00102$:
                           2856 ;src/main.c:116: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   559F D5            [11] 2857 	push	de
   55A0 21 00 01      [10] 2858 	ld	hl,#0x0100
   55A3 CD 3E 68      [17] 2859 	call	_cpct_isKeyPressed
   55A6 7D            [ 4] 2860 	ld	a,l
   55A7 D1            [10] 2861 	pop	de
   55A8 B7            [ 4] 2862 	or	a, a
   55A9 28 29         [12] 2863 	jr	Z,00105$
   55AB 3E 96         [ 7] 2864 	ld	a,#0x96
   55AD BB            [ 4] 2865 	cp	a, e
   55AE 3E 00         [ 7] 2866 	ld	a,#0x00
   55B0 9A            [ 4] 2867 	sbc	a, d
   55B1 E2 B6 55      [10] 2868 	jp	PO, 00164$
   55B4 EE 80         [ 7] 2869 	xor	a, #0x80
   55B6                    2870 00164$:
   55B6 F2 D4 55      [10] 2871 	jp	P,00105$
                           2872 ;src/main.c:117: cpct_drawSolidBox(memptr, 0, 2, 8);
   55B9 21 02 08      [10] 2873 	ld	hl,#0x0802
   55BC E5            [11] 2874 	push	hl
   55BD AF            [ 4] 2875 	xor	a, a
   55BE F5            [11] 2876 	push	af
   55BF 33            [ 6] 2877 	inc	sp
   55C0 DD 6E FE      [19] 2878 	ld	l,-2 (ix)
   55C3 DD 66 FF      [19] 2879 	ld	h,-1 (ix)
   55C6 E5            [11] 2880 	push	hl
   55C7 CD 3B 6B      [17] 2881 	call	_cpct_drawSolidBox
   55CA F1            [10] 2882 	pop	af
   55CB F1            [10] 2883 	pop	af
   55CC 33            [ 6] 2884 	inc	sp
                           2885 ;src/main.c:118: pushed --;
   55CD E1            [10] 2886 	pop	hl
   55CE E5            [11] 2887 	push	hl
   55CF 2B            [ 6] 2888 	dec	hl
   55D0 E3            [19] 2889 	ex	(sp), hl
                           2890 ;src/main.c:119: cont = 0;
   55D1 11 00 00      [10] 2891 	ld	de,#0x0000
   55D4                    2892 00105$:
                           2893 ;src/main.c:122: switch (pushed){
   55D4 DD 7E FB      [19] 2894 	ld	a,-5 (ix)
   55D7 07            [ 4] 2895 	rlca
   55D8 E6 01         [ 7] 2896 	and	a,#0x01
   55DA 47            [ 4] 2897 	ld	b,a
   55DB 3E 02         [ 7] 2898 	ld	a,#0x02
   55DD DD BE FA      [19] 2899 	cp	a, -6 (ix)
   55E0 3E 00         [ 7] 2900 	ld	a,#0x00
   55E2 DD 9E FB      [19] 2901 	sbc	a, -5 (ix)
   55E5 E2 EA 55      [10] 2902 	jp	PO, 00165$
   55E8 EE 80         [ 7] 2903 	xor	a, #0x80
   55EA                    2904 00165$:
   55EA 07            [ 4] 2905 	rlca
   55EB E6 01         [ 7] 2906 	and	a,#0x01
   55ED 4F            [ 4] 2907 	ld	c,a
   55EE 78            [ 4] 2908 	ld	a,b
   55EF B7            [ 4] 2909 	or	a,a
   55F0 20 32         [12] 2910 	jr	NZ,00110$
   55F2 B1            [ 4] 2911 	or	a,c
   55F3 20 2F         [12] 2912 	jr	NZ,00110$
   55F5 D5            [11] 2913 	push	de
   55F6 DD 5E FA      [19] 2914 	ld	e,-6 (ix)
   55F9 16 00         [ 7] 2915 	ld	d,#0x00
   55FB 21 02 56      [10] 2916 	ld	hl,#00166$
   55FE 19            [11] 2917 	add	hl,de
   55FF 19            [11] 2918 	add	hl,de
                           2919 ;src/main.c:123: case 0: init = 50;break;
   5600 D1            [10] 2920 	pop	de
   5601 E9            [ 4] 2921 	jp	(hl)
   5602                    2922 00166$:
   5602 18 04         [12] 2923 	jr	00107$
   5604 18 0C         [12] 2924 	jr	00108$
   5606 18 14         [12] 2925 	jr	00109$
   5608                    2926 00107$:
   5608 DD 36 FC 32   [19] 2927 	ld	-4 (ix),#0x32
   560C DD 36 FD 00   [19] 2928 	ld	-3 (ix),#0x00
   5610 18 12         [12] 2929 	jr	00110$
                           2930 ;src/main.c:124: case 1: init = 70;break;
   5612                    2931 00108$:
   5612 DD 36 FC 46   [19] 2932 	ld	-4 (ix),#0x46
   5616 DD 36 FD 00   [19] 2933 	ld	-3 (ix),#0x00
   561A 18 08         [12] 2934 	jr	00110$
                           2935 ;src/main.c:125: case 2: init = 90;break;
   561C                    2936 00109$:
   561C DD 36 FC 5A   [19] 2937 	ld	-4 (ix),#0x5A
   5620 DD 36 FD 00   [19] 2938 	ld	-3 (ix),#0x00
                           2939 ;src/main.c:126: }
   5624                    2940 00110$:
                           2941 ;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,15,init);
   5624 DD 66 FC      [19] 2942 	ld	h,-4 (ix)
   5627 C5            [11] 2943 	push	bc
   5628 D5            [11] 2944 	push	de
   5629 E5            [11] 2945 	push	hl
   562A 33            [ 6] 2946 	inc	sp
   562B 3E 0F         [ 7] 2947 	ld	a,#0x0F
   562D F5            [11] 2948 	push	af
   562E 33            [ 6] 2949 	inc	sp
   562F 21 00 C0      [10] 2950 	ld	hl,#0xC000
   5632 E5            [11] 2951 	push	hl
   5633 CD 0C 6C      [17] 2952 	call	_cpct_getScreenPtr
   5636 D1            [10] 2953 	pop	de
   5637 C1            [10] 2954 	pop	bc
                           2955 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5638 DD 75 FE      [19] 2956 	ld	-2 (ix),l
   563B DD 74 FF      [19] 2957 	ld	-1 (ix),h
                           2958 ;src/main.c:128: cpct_drawSolidBox(memptr, 3, 2, 8);
   563E C5            [11] 2959 	push	bc
   563F D5            [11] 2960 	push	de
   5640 21 02 08      [10] 2961 	ld	hl,#0x0802
   5643 E5            [11] 2962 	push	hl
   5644 3E 03         [ 7] 2963 	ld	a,#0x03
   5646 F5            [11] 2964 	push	af
   5647 33            [ 6] 2965 	inc	sp
   5648 DD 6E FE      [19] 2966 	ld	l,-2 (ix)
   564B DD 66 FF      [19] 2967 	ld	h,-1 (ix)
   564E E5            [11] 2968 	push	hl
   564F CD 3B 6B      [17] 2969 	call	_cpct_drawSolidBox
   5652 F1            [10] 2970 	pop	af
   5653 F1            [10] 2971 	pop	af
   5654 33            [ 6] 2972 	inc	sp
   5655 21 00 40      [10] 2973 	ld	hl,#0x4000
   5658 CD 3E 68      [17] 2974 	call	_cpct_isKeyPressed
   565B 7D            [ 4] 2975 	ld	a,l
   565C D1            [10] 2976 	pop	de
   565D C1            [10] 2977 	pop	bc
   565E B7            [ 4] 2978 	or	a, a
   565F 28 27         [12] 2979 	jr	Z,00116$
                           2980 ;src/main.c:130: switch (pushed){
   5661 78            [ 4] 2981 	ld	a,b
   5662 B7            [ 4] 2982 	or	a,a
   5663 20 23         [12] 2983 	jr	NZ,00116$
   5665 B1            [ 4] 2984 	or	a,c
   5666 20 20         [12] 2985 	jr	NZ,00116$
   5668 DD 5E FA      [19] 2986 	ld	e,-6 (ix)
   566B 16 00         [ 7] 2987 	ld	d,#0x00
   566D 21 73 56      [10] 2988 	ld	hl,#00167$
   5670 19            [11] 2989 	add	hl,de
   5671 19            [11] 2990 	add	hl,de
                           2991 ;src/main.c:131: case 0: return 1;break;
   5672 E9            [ 4] 2992 	jp	(hl)
   5673                    2993 00167$:
   5673 18 04         [12] 2994 	jr	00111$
   5675 18 07         [12] 2995 	jr	00112$
   5677 18 0A         [12] 2996 	jr	00113$
   5679                    2997 00111$:
   5679 21 01 00      [10] 2998 	ld	hl,#0x0001
   567C 18 0E         [12] 2999 	jr	00120$
                           3000 ;src/main.c:132: case 1: return 2;break;
   567E                    3001 00112$:
   567E 21 02 00      [10] 3002 	ld	hl,#0x0002
   5681 18 09         [12] 3003 	jr	00120$
                           3004 ;src/main.c:133: case 2: return 0;break;
   5683                    3005 00113$:
   5683 21 00 00      [10] 3006 	ld	hl,#0x0000
   5686 18 04         [12] 3007 	jr	00120$
                           3008 ;src/main.c:134: }
   5688                    3009 00116$:
                           3010 ;src/main.c:136: cont++;
   5688 13            [ 6] 3011 	inc	de
   5689 C3 63 55      [10] 3012 	jp	00118$
   568C                    3013 00120$:
   568C DD F9         [10] 3014 	ld	sp, ix
   568E DD E1         [14] 3015 	pop	ix
   5690 C9            [10] 3016 	ret
   5691                    3017 ___str_1:
   5691 4C 6F 75 6E 67 65  3018 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   56A1 00                 3019 	.db 0x00
   56A2                    3020 ___str_2:
   56A2 4E 75 65 76 61 20  3021 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   56AF 00                 3022 	.db 0x00
   56B0                    3023 ___str_3:
   56B0 43 72 65 64 69 74  3024 	.ascii "Creditos"
        6F 73
   56B8 00                 3025 	.db 0x00
   56B9                    3026 ___str_4:
   56B9 53 61 6C 69 72     3027 	.ascii "Salir"
   56BE 00                 3028 	.db 0x00
                           3029 ;src/main.c:155: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3030 ;	---------------------------------
                           3031 ; Function checkBoundsCollisionsEnemy
                           3032 ; ---------------------------------
   56BF                    3033 _checkBoundsCollisionsEnemy::
   56BF DD E5         [15] 3034 	push	ix
   56C1 DD 21 00 00   [14] 3035 	ld	ix,#0
   56C5 DD 39         [15] 3036 	add	ix,sp
   56C7 21 EC FF      [10] 3037 	ld	hl,#-20
   56CA 39            [11] 3038 	add	hl,sp
   56CB F9            [ 6] 3039 	ld	sp,hl
                           3040 ;src/main.c:157: u8 *posX = x;
   56CC DD 7E 04      [19] 3041 	ld	a,4 (ix)
   56CF DD 77 EE      [19] 3042 	ld	-18 (ix),a
   56D2 DD 7E 05      [19] 3043 	ld	a,5 (ix)
   56D5 DD 77 EF      [19] 3044 	ld	-17 (ix),a
                           3045 ;src/main.c:158: u8 *posY = y;
   56D8 DD 7E 06      [19] 3046 	ld	a,6 (ix)
   56DB DD 77 EC      [19] 3047 	ld	-20 (ix),a
   56DE DD 7E 07      [19] 3048 	ld	a,7 (ix)
   56E1 DD 77 ED      [19] 3049 	ld	-19 (ix),a
                           3050 ;src/main.c:159: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   56E4 E1            [10] 3051 	pop	hl
   56E5 E5            [11] 3052 	push	hl
   56E6 7E            [ 7] 3053 	ld	a,(hl)
   56E7 DD 77 FB      [19] 3054 	ld	-5 (ix), a
   56EA 07            [ 4] 3055 	rlca
   56EB 07            [ 4] 3056 	rlca
   56EC 07            [ 4] 3057 	rlca
   56ED 07            [ 4] 3058 	rlca
   56EE E6 0F         [ 7] 3059 	and	a,#0x0F
   56F0 4F            [ 4] 3060 	ld	c,a
   56F1 06 00         [ 7] 3061 	ld	b,#0x00
   56F3 69            [ 4] 3062 	ld	l, c
   56F4 60            [ 4] 3063 	ld	h, b
   56F5 29            [11] 3064 	add	hl, hl
   56F6 29            [11] 3065 	add	hl, hl
   56F7 09            [11] 3066 	add	hl, bc
   56F8 29            [11] 3067 	add	hl, hl
   56F9 29            [11] 3068 	add	hl, hl
   56FA 3E 02         [ 7] 3069 	ld	a,#<(_scene)
   56FC 85            [ 4] 3070 	add	a, l
   56FD DD 77 F9      [19] 3071 	ld	-7 (ix),a
   5700 3E 6D         [ 7] 3072 	ld	a,#>(_scene)
   5702 8C            [ 4] 3073 	adc	a, h
   5703 DD 77 FA      [19] 3074 	ld	-6 (ix),a
   5706 DD 6E EE      [19] 3075 	ld	l,-18 (ix)
   5709 DD 66 EF      [19] 3076 	ld	h,-17 (ix)
   570C 7E            [ 7] 3077 	ld	a,(hl)
   570D DD 77 FE      [19] 3078 	ld	-2 (ix), a
   5710 0F            [ 4] 3079 	rrca
   5711 0F            [ 4] 3080 	rrca
   5712 E6 3F         [ 7] 3081 	and	a,#0x3F
   5714 DD 77 FF      [19] 3082 	ld	-1 (ix), a
   5717 DD 86 F9      [19] 3083 	add	a, -7 (ix)
   571A 6F            [ 4] 3084 	ld	l,a
   571B 3E 00         [ 7] 3085 	ld	a,#0x00
   571D DD 8E FA      [19] 3086 	adc	a, -6 (ix)
   5720 67            [ 4] 3087 	ld	h,a
   5721 7E            [ 7] 3088 	ld	a,(hl)
   5722 DD 77 F8      [19] 3089 	ld	-8 (ix), a
   5725 3D            [ 4] 3090 	dec	a
   5726 CA 34 58      [10] 3091 	jp	Z,00106$
                           3092 ;src/main.c:160: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5729 DD 6E FE      [19] 3093 	ld	l,-2 (ix)
   572C 26 00         [ 7] 3094 	ld	h,#0x00
   572E DD 5E 0A      [19] 3095 	ld	e,10 (ix)
   5731 16 00         [ 7] 3096 	ld	d,#0x00
   5733 19            [11] 3097 	add	hl,de
   5734 7D            [ 4] 3098 	ld	a,l
   5735 C6 FF         [ 7] 3099 	add	a,#0xFF
   5737 DD 77 F0      [19] 3100 	ld	-16 (ix),a
   573A 7C            [ 4] 3101 	ld	a,h
   573B CE FF         [ 7] 3102 	adc	a,#0xFF
   573D DD 77 F1      [19] 3103 	ld	-15 (ix),a
   5740 DD 7E F0      [19] 3104 	ld	a,-16 (ix)
   5743 DD 77 F6      [19] 3105 	ld	-10 (ix),a
   5746 DD 7E F1      [19] 3106 	ld	a,-15 (ix)
   5749 DD 77 F7      [19] 3107 	ld	-9 (ix),a
   574C DD 7E F1      [19] 3108 	ld	a,-15 (ix)
   574F 07            [ 4] 3109 	rlca
   5750 E6 01         [ 7] 3110 	and	a,#0x01
   5752 DD 77 FE      [19] 3111 	ld	-2 (ix),a
   5755 23            [ 6] 3112 	inc	hl
   5756 23            [ 6] 3113 	inc	hl
   5757 DD 75 F2      [19] 3114 	ld	-14 (ix),l
   575A DD 74 F3      [19] 3115 	ld	-13 (ix),h
   575D DD 7E FE      [19] 3116 	ld	a,-2 (ix)
   5760 B7            [ 4] 3117 	or	a, a
   5761 28 0C         [12] 3118 	jr	Z,00114$
   5763 DD 7E F2      [19] 3119 	ld	a,-14 (ix)
   5766 DD 77 F6      [19] 3120 	ld	-10 (ix),a
   5769 DD 7E F3      [19] 3121 	ld	a,-13 (ix)
   576C DD 77 F7      [19] 3122 	ld	-9 (ix),a
   576F                    3123 00114$:
   576F DD 6E F6      [19] 3124 	ld	l,-10 (ix)
   5772 DD 66 F7      [19] 3125 	ld	h,-9 (ix)
   5775 CB 2C         [ 8] 3126 	sra	h
   5777 CB 1D         [ 8] 3127 	rr	l
   5779 CB 2C         [ 8] 3128 	sra	h
   577B CB 1D         [ 8] 3129 	rr	l
   577D DD 5E F9      [19] 3130 	ld	e,-7 (ix)
   5780 DD 56 FA      [19] 3131 	ld	d,-6 (ix)
   5783 19            [11] 3132 	add	hl,de
   5784 7E            [ 7] 3133 	ld	a,(hl)
   5785 3D            [ 4] 3134 	dec	a
   5786 CA 34 58      [10] 3135 	jp	Z,00106$
                           3136 ;src/main.c:161: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   5789 DD 6E FB      [19] 3137 	ld	l,-5 (ix)
   578C 26 00         [ 7] 3138 	ld	h,#0x00
   578E DD 5E 0B      [19] 3139 	ld	e,11 (ix)
   5791 16 00         [ 7] 3140 	ld	d,#0x00
   5793 19            [11] 3141 	add	hl,de
   5794 4D            [ 4] 3142 	ld	c,l
   5795 44            [ 4] 3143 	ld	b,h
   5796 0B            [ 6] 3144 	dec	bc
   5797 0B            [ 6] 3145 	dec	bc
   5798 59            [ 4] 3146 	ld	e, c
   5799 78            [ 4] 3147 	ld	a,b
   579A 57            [ 4] 3148 	ld	d,a
   579B 07            [ 4] 3149 	rlca
   579C E6 01         [ 7] 3150 	and	a,#0x01
   579E DD 77 F6      [19] 3151 	ld	-10 (ix),a
   57A1 7D            [ 4] 3152 	ld	a,l
   57A2 C6 0D         [ 7] 3153 	add	a, #0x0D
   57A4 DD 77 FC      [19] 3154 	ld	-4 (ix),a
   57A7 7C            [ 4] 3155 	ld	a,h
   57A8 CE 00         [ 7] 3156 	adc	a, #0x00
   57AA DD 77 FD      [19] 3157 	ld	-3 (ix),a
   57AD DD 7E F6      [19] 3158 	ld	a,-10 (ix)
   57B0 B7            [ 4] 3159 	or	a, a
   57B1 28 06         [12] 3160 	jr	Z,00115$
   57B3 DD 5E FC      [19] 3161 	ld	e,-4 (ix)
   57B6 DD 56 FD      [19] 3162 	ld	d,-3 (ix)
   57B9                    3163 00115$:
   57B9 CB 2A         [ 8] 3164 	sra	d
   57BB CB 1B         [ 8] 3165 	rr	e
   57BD CB 2A         [ 8] 3166 	sra	d
   57BF CB 1B         [ 8] 3167 	rr	e
   57C1 CB 2A         [ 8] 3168 	sra	d
   57C3 CB 1B         [ 8] 3169 	rr	e
   57C5 CB 2A         [ 8] 3170 	sra	d
   57C7 CB 1B         [ 8] 3171 	rr	e
   57C9 6B            [ 4] 3172 	ld	l, e
   57CA 62            [ 4] 3173 	ld	h, d
   57CB 29            [11] 3174 	add	hl, hl
   57CC 29            [11] 3175 	add	hl, hl
   57CD 19            [11] 3176 	add	hl, de
   57CE 29            [11] 3177 	add	hl, hl
   57CF 29            [11] 3178 	add	hl, hl
   57D0 11 02 6D      [10] 3179 	ld	de,#_scene
   57D3 19            [11] 3180 	add	hl,de
   57D4 DD 5E FF      [19] 3181 	ld	e,-1 (ix)
   57D7 16 00         [ 7] 3182 	ld	d,#0x00
   57D9 19            [11] 3183 	add	hl,de
   57DA 7E            [ 7] 3184 	ld	a,(hl)
   57DB 3D            [ 4] 3185 	dec	a
   57DC 28 56         [12] 3186 	jr	Z,00106$
                           3187 ;src/main.c:162: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   57DE 69            [ 4] 3188 	ld	l, c
   57DF 60            [ 4] 3189 	ld	h, b
   57E0 DD 7E F6      [19] 3190 	ld	a,-10 (ix)
   57E3 B7            [ 4] 3191 	or	a, a
   57E4 28 06         [12] 3192 	jr	Z,00116$
   57E6 DD 6E FC      [19] 3193 	ld	l,-4 (ix)
   57E9 DD 66 FD      [19] 3194 	ld	h,-3 (ix)
   57EC                    3195 00116$:
   57EC CB 2C         [ 8] 3196 	sra	h
   57EE CB 1D         [ 8] 3197 	rr	l
   57F0 CB 2C         [ 8] 3198 	sra	h
   57F2 CB 1D         [ 8] 3199 	rr	l
   57F4 CB 2C         [ 8] 3200 	sra	h
   57F6 CB 1D         [ 8] 3201 	rr	l
   57F8 CB 2C         [ 8] 3202 	sra	h
   57FA CB 1D         [ 8] 3203 	rr	l
   57FC 5D            [ 4] 3204 	ld	e, l
   57FD 54            [ 4] 3205 	ld	d, h
   57FE 29            [11] 3206 	add	hl, hl
   57FF 29            [11] 3207 	add	hl, hl
   5800 19            [11] 3208 	add	hl, de
   5801 29            [11] 3209 	add	hl, hl
   5802 29            [11] 3210 	add	hl, hl
   5803 3E 02         [ 7] 3211 	ld	a,#<(_scene)
   5805 85            [ 4] 3212 	add	a, l
   5806 DD 77 F4      [19] 3213 	ld	-12 (ix),a
   5809 3E 6D         [ 7] 3214 	ld	a,#>(_scene)
   580B 8C            [ 4] 3215 	adc	a, h
   580C DD 77 F5      [19] 3216 	ld	-11 (ix),a
   580F DD 6E F0      [19] 3217 	ld	l,-16 (ix)
   5812 DD 66 F1      [19] 3218 	ld	h,-15 (ix)
   5815 DD 7E FE      [19] 3219 	ld	a,-2 (ix)
   5818 B7            [ 4] 3220 	or	a, a
   5819 28 06         [12] 3221 	jr	Z,00117$
   581B DD 6E F2      [19] 3222 	ld	l,-14 (ix)
   581E DD 66 F3      [19] 3223 	ld	h,-13 (ix)
   5821                    3224 00117$:
   5821 CB 2C         [ 8] 3225 	sra	h
   5823 CB 1D         [ 8] 3226 	rr	l
   5825 CB 2C         [ 8] 3227 	sra	h
   5827 CB 1D         [ 8] 3228 	rr	l
   5829 DD 5E F4      [19] 3229 	ld	e,-12 (ix)
   582C DD 56 F5      [19] 3230 	ld	d,-11 (ix)
   582F 19            [11] 3231 	add	hl,de
   5830 7E            [ 7] 3232 	ld	a,(hl)
   5831 3D            [ 4] 3233 	dec	a
   5832 20 13         [12] 3234 	jr	NZ,00107$
   5834                    3235 00106$:
                           3236 ;src/main.c:164: *posX=lx;
   5834 DD 6E EE      [19] 3237 	ld	l,-18 (ix)
   5837 DD 66 EF      [19] 3238 	ld	h,-17 (ix)
   583A DD 7E 08      [19] 3239 	ld	a,8 (ix)
   583D 77            [ 7] 3240 	ld	(hl),a
                           3241 ;src/main.c:165: *posY=ly;
   583E E1            [10] 3242 	pop	hl
   583F E5            [11] 3243 	push	hl
   5840 DD 7E 09      [19] 3244 	ld	a,9 (ix)
   5843 77            [ 7] 3245 	ld	(hl),a
   5844 C3 0F 59      [10] 3246 	jp	00112$
   5847                    3247 00107$:
                           3248 ;src/main.c:167: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   5847 DD 7E F8      [19] 3249 	ld	a,-8 (ix)
   584A D6 03         [ 7] 3250 	sub	a, #0x03
   584C C2 FF 58      [10] 3251 	jp	NZ,00101$
                           3252 ;src/main.c:168: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   584F DD 6E F0      [19] 3253 	ld	l,-16 (ix)
   5852 DD 66 F1      [19] 3254 	ld	h,-15 (ix)
   5855 DD 7E FE      [19] 3255 	ld	a,-2 (ix)
   5858 B7            [ 4] 3256 	or	a, a
   5859 28 06         [12] 3257 	jr	Z,00118$
   585B DD 6E F2      [19] 3258 	ld	l,-14 (ix)
   585E DD 66 F3      [19] 3259 	ld	h,-13 (ix)
   5861                    3260 00118$:
   5861 CB 2C         [ 8] 3261 	sra	h
   5863 CB 1D         [ 8] 3262 	rr	l
   5865 CB 2C         [ 8] 3263 	sra	h
   5867 CB 1D         [ 8] 3264 	rr	l
   5869 DD 5E F9      [19] 3265 	ld	e,-7 (ix)
   586C DD 56 FA      [19] 3266 	ld	d,-6 (ix)
   586F 19            [11] 3267 	add	hl,de
   5870 7E            [ 7] 3268 	ld	a,(hl)
   5871 D6 03         [ 7] 3269 	sub	a, #0x03
   5873 C2 FF 58      [10] 3270 	jp	NZ,00101$
                           3271 ;src/main.c:169: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   5876 69            [ 4] 3272 	ld	l, c
   5877 60            [ 4] 3273 	ld	h, b
   5878 DD 7E F6      [19] 3274 	ld	a,-10 (ix)
   587B B7            [ 4] 3275 	or	a, a
   587C 28 06         [12] 3276 	jr	Z,00119$
   587E DD 6E FC      [19] 3277 	ld	l,-4 (ix)
   5881 DD 66 FD      [19] 3278 	ld	h,-3 (ix)
   5884                    3279 00119$:
   5884 CB 2C         [ 8] 3280 	sra	h
   5886 CB 1D         [ 8] 3281 	rr	l
   5888 CB 2C         [ 8] 3282 	sra	h
   588A CB 1D         [ 8] 3283 	rr	l
   588C CB 2C         [ 8] 3284 	sra	h
   588E CB 1D         [ 8] 3285 	rr	l
   5890 CB 2C         [ 8] 3286 	sra	h
   5892 CB 1D         [ 8] 3287 	rr	l
   5894 5D            [ 4] 3288 	ld	e, l
   5895 54            [ 4] 3289 	ld	d, h
   5896 29            [11] 3290 	add	hl, hl
   5897 29            [11] 3291 	add	hl, hl
   5898 19            [11] 3292 	add	hl, de
   5899 29            [11] 3293 	add	hl, hl
   589A 29            [11] 3294 	add	hl, hl
   589B 11 02 6D      [10] 3295 	ld	de,#_scene
   589E 19            [11] 3296 	add	hl,de
   589F DD 5E FF      [19] 3297 	ld	e,-1 (ix)
   58A2 16 00         [ 7] 3298 	ld	d,#0x00
   58A4 19            [11] 3299 	add	hl,de
   58A5 7E            [ 7] 3300 	ld	a,(hl)
   58A6 D6 03         [ 7] 3301 	sub	a, #0x03
   58A8 20 55         [12] 3302 	jr	NZ,00101$
                           3303 ;src/main.c:170: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   58AA DD 7E F6      [19] 3304 	ld	a,-10 (ix)
   58AD B7            [ 4] 3305 	or	a, a
   58AE 28 06         [12] 3306 	jr	Z,00120$
   58B0 DD 4E FC      [19] 3307 	ld	c,-4 (ix)
   58B3 DD 46 FD      [19] 3308 	ld	b,-3 (ix)
   58B6                    3309 00120$:
   58B6 CB 28         [ 8] 3310 	sra	b
   58B8 CB 19         [ 8] 3311 	rr	c
   58BA CB 28         [ 8] 3312 	sra	b
   58BC CB 19         [ 8] 3313 	rr	c
   58BE CB 28         [ 8] 3314 	sra	b
   58C0 CB 19         [ 8] 3315 	rr	c
   58C2 CB 28         [ 8] 3316 	sra	b
   58C4 CB 19         [ 8] 3317 	rr	c
   58C6 69            [ 4] 3318 	ld	l, c
   58C7 60            [ 4] 3319 	ld	h, b
   58C8 29            [11] 3320 	add	hl, hl
   58C9 29            [11] 3321 	add	hl, hl
   58CA 09            [11] 3322 	add	hl, bc
   58CB 29            [11] 3323 	add	hl, hl
   58CC 29            [11] 3324 	add	hl, hl
   58CD 3E 02         [ 7] 3325 	ld	a,#<(_scene)
   58CF 85            [ 4] 3326 	add	a, l
   58D0 DD 77 F4      [19] 3327 	ld	-12 (ix),a
   58D3 3E 6D         [ 7] 3328 	ld	a,#>(_scene)
   58D5 8C            [ 4] 3329 	adc	a, h
   58D6 DD 77 F5      [19] 3330 	ld	-11 (ix),a
   58D9 DD 6E F0      [19] 3331 	ld	l,-16 (ix)
   58DC DD 66 F1      [19] 3332 	ld	h,-15 (ix)
   58DF DD 7E FE      [19] 3333 	ld	a,-2 (ix)
   58E2 B7            [ 4] 3334 	or	a, a
   58E3 28 06         [12] 3335 	jr	Z,00121$
   58E5 DD 6E F2      [19] 3336 	ld	l,-14 (ix)
   58E8 DD 66 F3      [19] 3337 	ld	h,-13 (ix)
   58EB                    3338 00121$:
   58EB CB 2C         [ 8] 3339 	sra	h
   58ED CB 1D         [ 8] 3340 	rr	l
   58EF CB 2C         [ 8] 3341 	sra	h
   58F1 CB 1D         [ 8] 3342 	rr	l
   58F3 DD 5E F4      [19] 3343 	ld	e,-12 (ix)
   58F6 DD 56 F5      [19] 3344 	ld	d,-11 (ix)
   58F9 19            [11] 3345 	add	hl,de
   58FA 7E            [ 7] 3346 	ld	a,(hl)
   58FB D6 03         [ 7] 3347 	sub	a, #0x03
   58FD 28 10         [12] 3348 	jr	Z,00112$
   58FF                    3349 00101$:
                           3350 ;src/main.c:172: *posX=lx;
   58FF DD 6E EE      [19] 3351 	ld	l,-18 (ix)
   5902 DD 66 EF      [19] 3352 	ld	h,-17 (ix)
   5905 DD 7E 08      [19] 3353 	ld	a,8 (ix)
   5908 77            [ 7] 3354 	ld	(hl),a
                           3355 ;src/main.c:173: *posY=ly;
   5909 E1            [10] 3356 	pop	hl
   590A E5            [11] 3357 	push	hl
   590B DD 7E 09      [19] 3358 	ld	a,9 (ix)
   590E 77            [ 7] 3359 	ld	(hl),a
   590F                    3360 00112$:
   590F DD F9         [10] 3361 	ld	sp, ix
   5911 DD E1         [14] 3362 	pop	ix
   5913 C9            [10] 3363 	ret
                           3364 ;src/main.c:179: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3365 ;	---------------------------------
                           3366 ; Function checkBoundsCollisions
                           3367 ; ---------------------------------
   5914                    3368 _checkBoundsCollisions::
   5914 DD E5         [15] 3369 	push	ix
   5916 DD 21 00 00   [14] 3370 	ld	ix,#0
   591A DD 39         [15] 3371 	add	ix,sp
   591C 21 F2 FF      [10] 3372 	ld	hl,#-14
   591F 39            [11] 3373 	add	hl,sp
   5920 F9            [ 6] 3374 	ld	sp,hl
                           3375 ;src/main.c:180: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5921 3A 05 6E      [13] 3376 	ld	a,(#(_player + 0x0001) + 0)
   5924 DD 77 F8      [19] 3377 	ld	-8 (ix), a
   5927 07            [ 4] 3378 	rlca
   5928 07            [ 4] 3379 	rlca
   5929 07            [ 4] 3380 	rlca
   592A 07            [ 4] 3381 	rlca
   592B E6 0F         [ 7] 3382 	and	a,#0x0F
   592D 4F            [ 4] 3383 	ld	c,a
   592E 06 00         [ 7] 3384 	ld	b,#0x00
   5930 69            [ 4] 3385 	ld	l, c
   5931 60            [ 4] 3386 	ld	h, b
   5932 29            [11] 3387 	add	hl, hl
   5933 29            [11] 3388 	add	hl, hl
   5934 09            [11] 3389 	add	hl, bc
   5935 29            [11] 3390 	add	hl, hl
   5936 29            [11] 3391 	add	hl, hl
   5937 3E 02         [ 7] 3392 	ld	a,#<(_scene)
   5939 85            [ 4] 3393 	add	a, l
   593A DD 77 F4      [19] 3394 	ld	-12 (ix),a
   593D 3E 6D         [ 7] 3395 	ld	a,#>(_scene)
   593F 8C            [ 4] 3396 	adc	a, h
   5940 DD 77 F5      [19] 3397 	ld	-11 (ix),a
   5943 21 04 6E      [10] 3398 	ld	hl, #_player + 0
   5946 4E            [ 7] 3399 	ld	c,(hl)
   5947 79            [ 4] 3400 	ld	a,c
   5948 0F            [ 4] 3401 	rrca
   5949 0F            [ 4] 3402 	rrca
   594A E6 3F         [ 7] 3403 	and	a,#0x3F
   594C DD 77 F7      [19] 3404 	ld	-9 (ix), a
   594F DD 86 F4      [19] 3405 	add	a, -12 (ix)
   5952 6F            [ 4] 3406 	ld	l,a
   5953 3E 00         [ 7] 3407 	ld	a,#0x00
   5955 DD 8E F5      [19] 3408 	adc	a, -11 (ix)
   5958 67            [ 4] 3409 	ld	h,a
   5959 7E            [ 7] 3410 	ld	a,(hl)
   595A DD 77 F6      [19] 3411 	ld	-10 (ix), a
   595D 3D            [ 4] 3412 	dec	a
   595E CA 74 5A      [10] 3413 	jp	Z,00124$
                           3414 ;src/main.c:181: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5961 06 00         [ 7] 3415 	ld	b,#0x00
   5963 21 03 00      [10] 3416 	ld	hl,#0x0003
   5966 09            [11] 3417 	add	hl,bc
   5967 DD 75 FB      [19] 3418 	ld	-5 (ix),l
   596A DD 74 FC      [19] 3419 	ld	-4 (ix),h
   596D DD 7E FB      [19] 3420 	ld	a,-5 (ix)
   5970 DD 77 FE      [19] 3421 	ld	-2 (ix),a
   5973 DD 7E FC      [19] 3422 	ld	a,-4 (ix)
   5976 DD 77 FF      [19] 3423 	ld	-1 (ix),a
   5979 DD 7E FC      [19] 3424 	ld	a,-4 (ix)
   597C 07            [ 4] 3425 	rlca
   597D E6 01         [ 7] 3426 	and	a,#0x01
   597F DD 77 FD      [19] 3427 	ld	-3 (ix),a
   5982 21 06 00      [10] 3428 	ld	hl,#0x0006
   5985 09            [11] 3429 	add	hl,bc
   5986 E3            [19] 3430 	ex	(sp), hl
   5987 DD 7E FD      [19] 3431 	ld	a,-3 (ix)
   598A B7            [ 4] 3432 	or	a, a
   598B 28 0C         [12] 3433 	jr	Z,00132$
   598D DD 7E F2      [19] 3434 	ld	a,-14 (ix)
   5990 DD 77 FE      [19] 3435 	ld	-2 (ix),a
   5993 DD 7E F3      [19] 3436 	ld	a,-13 (ix)
   5996 DD 77 FF      [19] 3437 	ld	-1 (ix),a
   5999                    3438 00132$:
   5999 DD 6E FE      [19] 3439 	ld	l,-2 (ix)
   599C DD 66 FF      [19] 3440 	ld	h,-1 (ix)
   599F CB 2C         [ 8] 3441 	sra	h
   59A1 CB 1D         [ 8] 3442 	rr	l
   59A3 CB 2C         [ 8] 3443 	sra	h
   59A5 CB 1D         [ 8] 3444 	rr	l
   59A7 DD 5E F4      [19] 3445 	ld	e,-12 (ix)
   59AA DD 56 F5      [19] 3446 	ld	d,-11 (ix)
   59AD 19            [11] 3447 	add	hl,de
   59AE 7E            [ 7] 3448 	ld	a,(hl)
   59AF 3D            [ 4] 3449 	dec	a
   59B0 CA 74 5A      [10] 3450 	jp	Z,00124$
                           3451 ;src/main.c:182: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   59B3 DD 5E F8      [19] 3452 	ld	e,-8 (ix)
   59B6 16 00         [ 7] 3453 	ld	d,#0x00
   59B8 21 0E 00      [10] 3454 	ld	hl,#0x000E
   59BB 19            [11] 3455 	add	hl,de
   59BC 4D            [ 4] 3456 	ld	c,l
   59BD 44            [ 4] 3457 	ld	b,h
   59BE DD 71 FE      [19] 3458 	ld	-2 (ix),c
   59C1 DD 70 FF      [19] 3459 	ld	-1 (ix),b
   59C4 78            [ 4] 3460 	ld	a,b
   59C5 07            [ 4] 3461 	rlca
   59C6 E6 01         [ 7] 3462 	and	a,#0x01
   59C8 DD 77 F8      [19] 3463 	ld	-8 (ix),a
   59CB 21 1D 00      [10] 3464 	ld	hl,#0x001D
   59CE 19            [11] 3465 	add	hl,de
   59CF DD 75 F9      [19] 3466 	ld	-7 (ix),l
   59D2 DD 74 FA      [19] 3467 	ld	-6 (ix),h
   59D5 DD 7E F8      [19] 3468 	ld	a,-8 (ix)
   59D8 B7            [ 4] 3469 	or	a, a
   59D9 28 0C         [12] 3470 	jr	Z,00133$
   59DB DD 7E F9      [19] 3471 	ld	a,-7 (ix)
   59DE DD 77 FE      [19] 3472 	ld	-2 (ix),a
   59E1 DD 7E FA      [19] 3473 	ld	a,-6 (ix)
   59E4 DD 77 FF      [19] 3474 	ld	-1 (ix),a
   59E7                    3475 00133$:
   59E7 DD 6E FE      [19] 3476 	ld	l,-2 (ix)
   59EA DD 66 FF      [19] 3477 	ld	h,-1 (ix)
   59ED CB 2C         [ 8] 3478 	sra	h
   59EF CB 1D         [ 8] 3479 	rr	l
   59F1 CB 2C         [ 8] 3480 	sra	h
   59F3 CB 1D         [ 8] 3481 	rr	l
   59F5 CB 2C         [ 8] 3482 	sra	h
   59F7 CB 1D         [ 8] 3483 	rr	l
   59F9 CB 2C         [ 8] 3484 	sra	h
   59FB CB 1D         [ 8] 3485 	rr	l
   59FD 5D            [ 4] 3486 	ld	e, l
   59FE 54            [ 4] 3487 	ld	d, h
   59FF 29            [11] 3488 	add	hl, hl
   5A00 29            [11] 3489 	add	hl, hl
   5A01 19            [11] 3490 	add	hl, de
   5A02 29            [11] 3491 	add	hl, hl
   5A03 29            [11] 3492 	add	hl, hl
   5A04 11 02 6D      [10] 3493 	ld	de,#_scene
   5A07 19            [11] 3494 	add	hl,de
   5A08 DD 5E F7      [19] 3495 	ld	e,-9 (ix)
   5A0B 16 00         [ 7] 3496 	ld	d,#0x00
   5A0D 19            [11] 3497 	add	hl,de
   5A0E 7E            [ 7] 3498 	ld	a,(hl)
   5A0F 3D            [ 4] 3499 	dec	a
   5A10 28 62         [12] 3500 	jr	Z,00124$
                           3501 ;src/main.c:183: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5A12 DD 71 FE      [19] 3502 	ld	-2 (ix),c
   5A15 DD 70 FF      [19] 3503 	ld	-1 (ix),b
   5A18 DD 7E F8      [19] 3504 	ld	a,-8 (ix)
   5A1B B7            [ 4] 3505 	or	a, a
   5A1C 28 0C         [12] 3506 	jr	Z,00134$
   5A1E DD 7E F9      [19] 3507 	ld	a,-7 (ix)
   5A21 DD 77 FE      [19] 3508 	ld	-2 (ix),a
   5A24 DD 7E FA      [19] 3509 	ld	a,-6 (ix)
   5A27 DD 77 FF      [19] 3510 	ld	-1 (ix),a
   5A2A                    3511 00134$:
   5A2A DD 6E FE      [19] 3512 	ld	l,-2 (ix)
   5A2D DD 66 FF      [19] 3513 	ld	h,-1 (ix)
   5A30 CB 2C         [ 8] 3514 	sra	h
   5A32 CB 1D         [ 8] 3515 	rr	l
   5A34 CB 2C         [ 8] 3516 	sra	h
   5A36 CB 1D         [ 8] 3517 	rr	l
   5A38 CB 2C         [ 8] 3518 	sra	h
   5A3A CB 1D         [ 8] 3519 	rr	l
   5A3C CB 2C         [ 8] 3520 	sra	h
   5A3E CB 1D         [ 8] 3521 	rr	l
   5A40 5D            [ 4] 3522 	ld	e, l
   5A41 54            [ 4] 3523 	ld	d, h
   5A42 29            [11] 3524 	add	hl, hl
   5A43 29            [11] 3525 	add	hl, hl
   5A44 19            [11] 3526 	add	hl, de
   5A45 29            [11] 3527 	add	hl, hl
   5A46 29            [11] 3528 	add	hl, hl
   5A47 3E 02         [ 7] 3529 	ld	a,#<(_scene)
   5A49 85            [ 4] 3530 	add	a, l
   5A4A DD 77 FE      [19] 3531 	ld	-2 (ix),a
   5A4D 3E 6D         [ 7] 3532 	ld	a,#>(_scene)
   5A4F 8C            [ 4] 3533 	adc	a, h
   5A50 DD 77 FF      [19] 3534 	ld	-1 (ix),a
   5A53 DD 6E FB      [19] 3535 	ld	l,-5 (ix)
   5A56 DD 66 FC      [19] 3536 	ld	h,-4 (ix)
   5A59 DD 7E FD      [19] 3537 	ld	a,-3 (ix)
   5A5C B7            [ 4] 3538 	or	a, a
   5A5D 28 02         [12] 3539 	jr	Z,00135$
   5A5F E1            [10] 3540 	pop	hl
   5A60 E5            [11] 3541 	push	hl
   5A61                    3542 00135$:
   5A61 CB 2C         [ 8] 3543 	sra	h
   5A63 CB 1D         [ 8] 3544 	rr	l
   5A65 CB 2C         [ 8] 3545 	sra	h
   5A67 CB 1D         [ 8] 3546 	rr	l
   5A69 DD 5E FE      [19] 3547 	ld	e,-2 (ix)
   5A6C DD 56 FF      [19] 3548 	ld	d,-1 (ix)
   5A6F 19            [11] 3549 	add	hl,de
   5A70 7E            [ 7] 3550 	ld	a,(hl)
   5A71 3D            [ 4] 3551 	dec	a
   5A72 20 10         [12] 3552 	jr	NZ,00125$
   5A74                    3553 00124$:
                           3554 ;src/main.c:185: player.x=player.lx;
   5A74 3A 06 6E      [13] 3555 	ld	a, (#_player + 2)
   5A77 21 04 6E      [10] 3556 	ld	hl,#_player
   5A7A 77            [ 7] 3557 	ld	(hl),a
                           3558 ;src/main.c:186: player.y=player.ly;
   5A7B 3A 07 6E      [13] 3559 	ld	a, (#_player + 3)
   5A7E 32 05 6E      [13] 3560 	ld	(#(_player + 0x0001)),a
   5A81 C3 E0 5C      [10] 3561 	jp	00130$
   5A84                    3562 00125$:
                           3563 ;src/main.c:188: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5A84 DD 7E F6      [19] 3564 	ld	a,-10 (ix)
   5A87 D6 02         [ 7] 3565 	sub	a, #0x02
   5A89 CA 2C 5B      [10] 3566 	jp	Z,00118$
                           3567 ;src/main.c:189: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5A8C DD 6E FB      [19] 3568 	ld	l,-5 (ix)
   5A8F DD 66 FC      [19] 3569 	ld	h,-4 (ix)
   5A92 DD 7E FD      [19] 3570 	ld	a,-3 (ix)
   5A95 B7            [ 4] 3571 	or	a, a
   5A96 28 02         [12] 3572 	jr	Z,00136$
   5A98 E1            [10] 3573 	pop	hl
   5A99 E5            [11] 3574 	push	hl
   5A9A                    3575 00136$:
   5A9A CB 2C         [ 8] 3576 	sra	h
   5A9C CB 1D         [ 8] 3577 	rr	l
   5A9E CB 2C         [ 8] 3578 	sra	h
   5AA0 CB 1D         [ 8] 3579 	rr	l
   5AA2 DD 5E F4      [19] 3580 	ld	e,-12 (ix)
   5AA5 DD 56 F5      [19] 3581 	ld	d,-11 (ix)
   5AA8 19            [11] 3582 	add	hl,de
   5AA9 7E            [ 7] 3583 	ld	a,(hl)
   5AAA D6 02         [ 7] 3584 	sub	a, #0x02
   5AAC CA 2C 5B      [10] 3585 	jp	Z,00118$
                           3586 ;src/main.c:190: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5AAF 69            [ 4] 3587 	ld	l, c
   5AB0 60            [ 4] 3588 	ld	h, b
   5AB1 DD 7E F8      [19] 3589 	ld	a,-8 (ix)
   5AB4 B7            [ 4] 3590 	or	a, a
   5AB5 28 06         [12] 3591 	jr	Z,00137$
   5AB7 DD 6E F9      [19] 3592 	ld	l,-7 (ix)
   5ABA DD 66 FA      [19] 3593 	ld	h,-6 (ix)
   5ABD                    3594 00137$:
   5ABD CB 2C         [ 8] 3595 	sra	h
   5ABF CB 1D         [ 8] 3596 	rr	l
   5AC1 CB 2C         [ 8] 3597 	sra	h
   5AC3 CB 1D         [ 8] 3598 	rr	l
   5AC5 CB 2C         [ 8] 3599 	sra	h
   5AC7 CB 1D         [ 8] 3600 	rr	l
   5AC9 CB 2C         [ 8] 3601 	sra	h
   5ACB CB 1D         [ 8] 3602 	rr	l
   5ACD 5D            [ 4] 3603 	ld	e, l
   5ACE 54            [ 4] 3604 	ld	d, h
   5ACF 29            [11] 3605 	add	hl, hl
   5AD0 29            [11] 3606 	add	hl, hl
   5AD1 19            [11] 3607 	add	hl, de
   5AD2 29            [11] 3608 	add	hl, hl
   5AD3 29            [11] 3609 	add	hl, hl
   5AD4 11 02 6D      [10] 3610 	ld	de,#_scene
   5AD7 19            [11] 3611 	add	hl,de
   5AD8 DD 5E F7      [19] 3612 	ld	e,-9 (ix)
   5ADB 16 00         [ 7] 3613 	ld	d,#0x00
   5ADD 19            [11] 3614 	add	hl,de
   5ADE 7E            [ 7] 3615 	ld	a,(hl)
   5ADF D6 02         [ 7] 3616 	sub	a, #0x02
   5AE1 28 49         [12] 3617 	jr	Z,00118$
                           3618 ;src/main.c:191: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5AE3 69            [ 4] 3619 	ld	l, c
   5AE4 60            [ 4] 3620 	ld	h, b
   5AE5 DD 7E F8      [19] 3621 	ld	a,-8 (ix)
   5AE8 B7            [ 4] 3622 	or	a, a
   5AE9 28 06         [12] 3623 	jr	Z,00138$
   5AEB DD 6E F9      [19] 3624 	ld	l,-7 (ix)
   5AEE DD 66 FA      [19] 3625 	ld	h,-6 (ix)
   5AF1                    3626 00138$:
   5AF1 CB 2C         [ 8] 3627 	sra	h
   5AF3 CB 1D         [ 8] 3628 	rr	l
   5AF5 CB 2C         [ 8] 3629 	sra	h
   5AF7 CB 1D         [ 8] 3630 	rr	l
   5AF9 CB 2C         [ 8] 3631 	sra	h
   5AFB CB 1D         [ 8] 3632 	rr	l
   5AFD CB 2C         [ 8] 3633 	sra	h
   5AFF CB 1D         [ 8] 3634 	rr	l
   5B01 5D            [ 4] 3635 	ld	e, l
   5B02 54            [ 4] 3636 	ld	d, h
   5B03 29            [11] 3637 	add	hl, hl
   5B04 29            [11] 3638 	add	hl, hl
   5B05 19            [11] 3639 	add	hl, de
   5B06 29            [11] 3640 	add	hl, hl
   5B07 29            [11] 3641 	add	hl, hl
   5B08 3E 02         [ 7] 3642 	ld	a,#<(_scene)
   5B0A 85            [ 4] 3643 	add	a, l
   5B0B 5F            [ 4] 3644 	ld	e,a
   5B0C 3E 6D         [ 7] 3645 	ld	a,#>(_scene)
   5B0E 8C            [ 4] 3646 	adc	a, h
   5B0F 57            [ 4] 3647 	ld	d,a
   5B10 DD 6E FB      [19] 3648 	ld	l,-5 (ix)
   5B13 DD 66 FC      [19] 3649 	ld	h,-4 (ix)
   5B16 DD 7E FD      [19] 3650 	ld	a,-3 (ix)
   5B19 B7            [ 4] 3651 	or	a, a
   5B1A 28 02         [12] 3652 	jr	Z,00139$
   5B1C E1            [10] 3653 	pop	hl
   5B1D E5            [11] 3654 	push	hl
   5B1E                    3655 00139$:
   5B1E CB 2C         [ 8] 3656 	sra	h
   5B20 CB 1D         [ 8] 3657 	rr	l
   5B22 CB 2C         [ 8] 3658 	sra	h
   5B24 CB 1D         [ 8] 3659 	rr	l
   5B26 19            [11] 3660 	add	hl,de
   5B27 7E            [ 7] 3661 	ld	a,(hl)
   5B28 D6 02         [ 7] 3662 	sub	a, #0x02
   5B2A 20 21         [12] 3663 	jr	NZ,00119$
   5B2C                    3664 00118$:
                           3665 ;src/main.c:193: if(player.life < 3 && *corazon == 0){
   5B2C FD 21 0A 6E   [14] 3666 	ld	iy,#_player + 6
   5B30 FD 5E 00      [19] 3667 	ld	e, 0 (iy)
   5B33 7B            [ 4] 3668 	ld	a,e
   5B34 D6 03         [ 7] 3669 	sub	a, #0x03
   5B36 D2 E0 5C      [10] 3670 	jp	NC,00130$
   5B39 DD 6E 04      [19] 3671 	ld	l,4 (ix)
   5B3C DD 66 05      [19] 3672 	ld	h,5 (ix)
   5B3F 7E            [ 7] 3673 	ld	a,(hl)
   5B40 B7            [ 4] 3674 	or	a, a
   5B41 C2 E0 5C      [10] 3675 	jp	NZ,00130$
                           3676 ;src/main.c:194: player.life += 1;
   5B44 1C            [ 4] 3677 	inc	e
   5B45 FD 73 00      [19] 3678 	ld	0 (iy), e
                           3679 ;src/main.c:195: *corazon = 1;
   5B48 36 01         [10] 3680 	ld	(hl),#0x01
   5B4A C3 E0 5C      [10] 3681 	jp	00130$
   5B4D                    3682 00119$:
                           3683 ;src/main.c:198: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5B4D DD 7E F6      [19] 3684 	ld	a,-10 (ix)
   5B50 D6 05         [ 7] 3685 	sub	a, #0x05
   5B52 CA F5 5B      [10] 3686 	jp	Z,00112$
                           3687 ;src/main.c:199: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5B55 DD 6E FB      [19] 3688 	ld	l,-5 (ix)
   5B58 DD 66 FC      [19] 3689 	ld	h,-4 (ix)
   5B5B DD 7E FD      [19] 3690 	ld	a,-3 (ix)
   5B5E B7            [ 4] 3691 	or	a, a
   5B5F 28 02         [12] 3692 	jr	Z,00140$
   5B61 E1            [10] 3693 	pop	hl
   5B62 E5            [11] 3694 	push	hl
   5B63                    3695 00140$:
   5B63 CB 2C         [ 8] 3696 	sra	h
   5B65 CB 1D         [ 8] 3697 	rr	l
   5B67 CB 2C         [ 8] 3698 	sra	h
   5B69 CB 1D         [ 8] 3699 	rr	l
   5B6B DD 5E F4      [19] 3700 	ld	e,-12 (ix)
   5B6E DD 56 F5      [19] 3701 	ld	d,-11 (ix)
   5B71 19            [11] 3702 	add	hl,de
   5B72 7E            [ 7] 3703 	ld	a,(hl)
   5B73 D6 05         [ 7] 3704 	sub	a, #0x05
   5B75 CA F5 5B      [10] 3705 	jp	Z,00112$
                           3706 ;src/main.c:200: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5B78 69            [ 4] 3707 	ld	l, c
   5B79 60            [ 4] 3708 	ld	h, b
   5B7A DD 7E F8      [19] 3709 	ld	a,-8 (ix)
   5B7D B7            [ 4] 3710 	or	a, a
   5B7E 28 06         [12] 3711 	jr	Z,00141$
   5B80 DD 6E F9      [19] 3712 	ld	l,-7 (ix)
   5B83 DD 66 FA      [19] 3713 	ld	h,-6 (ix)
   5B86                    3714 00141$:
   5B86 CB 2C         [ 8] 3715 	sra	h
   5B88 CB 1D         [ 8] 3716 	rr	l
   5B8A CB 2C         [ 8] 3717 	sra	h
   5B8C CB 1D         [ 8] 3718 	rr	l
   5B8E CB 2C         [ 8] 3719 	sra	h
   5B90 CB 1D         [ 8] 3720 	rr	l
   5B92 CB 2C         [ 8] 3721 	sra	h
   5B94 CB 1D         [ 8] 3722 	rr	l
   5B96 5D            [ 4] 3723 	ld	e, l
   5B97 54            [ 4] 3724 	ld	d, h
   5B98 29            [11] 3725 	add	hl, hl
   5B99 29            [11] 3726 	add	hl, hl
   5B9A 19            [11] 3727 	add	hl, de
   5B9B 29            [11] 3728 	add	hl, hl
   5B9C 29            [11] 3729 	add	hl, hl
   5B9D 11 02 6D      [10] 3730 	ld	de,#_scene
   5BA0 19            [11] 3731 	add	hl,de
   5BA1 DD 5E F7      [19] 3732 	ld	e,-9 (ix)
   5BA4 16 00         [ 7] 3733 	ld	d,#0x00
   5BA6 19            [11] 3734 	add	hl,de
   5BA7 7E            [ 7] 3735 	ld	a,(hl)
   5BA8 D6 05         [ 7] 3736 	sub	a, #0x05
   5BAA 28 49         [12] 3737 	jr	Z,00112$
                           3738 ;src/main.c:201: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5BAC 69            [ 4] 3739 	ld	l, c
   5BAD 60            [ 4] 3740 	ld	h, b
   5BAE DD 7E F8      [19] 3741 	ld	a,-8 (ix)
   5BB1 B7            [ 4] 3742 	or	a, a
   5BB2 28 06         [12] 3743 	jr	Z,00142$
   5BB4 DD 6E F9      [19] 3744 	ld	l,-7 (ix)
   5BB7 DD 66 FA      [19] 3745 	ld	h,-6 (ix)
   5BBA                    3746 00142$:
   5BBA CB 2C         [ 8] 3747 	sra	h
   5BBC CB 1D         [ 8] 3748 	rr	l
   5BBE CB 2C         [ 8] 3749 	sra	h
   5BC0 CB 1D         [ 8] 3750 	rr	l
   5BC2 CB 2C         [ 8] 3751 	sra	h
   5BC4 CB 1D         [ 8] 3752 	rr	l
   5BC6 CB 2C         [ 8] 3753 	sra	h
   5BC8 CB 1D         [ 8] 3754 	rr	l
   5BCA 5D            [ 4] 3755 	ld	e, l
   5BCB 54            [ 4] 3756 	ld	d, h
   5BCC 29            [11] 3757 	add	hl, hl
   5BCD 29            [11] 3758 	add	hl, hl
   5BCE 19            [11] 3759 	add	hl, de
   5BCF 29            [11] 3760 	add	hl, hl
   5BD0 29            [11] 3761 	add	hl, hl
   5BD1 3E 02         [ 7] 3762 	ld	a,#<(_scene)
   5BD3 85            [ 4] 3763 	add	a, l
   5BD4 5F            [ 4] 3764 	ld	e,a
   5BD5 3E 6D         [ 7] 3765 	ld	a,#>(_scene)
   5BD7 8C            [ 4] 3766 	adc	a, h
   5BD8 57            [ 4] 3767 	ld	d,a
   5BD9 DD 6E FB      [19] 3768 	ld	l,-5 (ix)
   5BDC DD 66 FC      [19] 3769 	ld	h,-4 (ix)
   5BDF DD 7E FD      [19] 3770 	ld	a,-3 (ix)
   5BE2 B7            [ 4] 3771 	or	a, a
   5BE3 28 02         [12] 3772 	jr	Z,00143$
   5BE5 E1            [10] 3773 	pop	hl
   5BE6 E5            [11] 3774 	push	hl
   5BE7                    3775 00143$:
   5BE7 CB 2C         [ 8] 3776 	sra	h
   5BE9 CB 1D         [ 8] 3777 	rr	l
   5BEB CB 2C         [ 8] 3778 	sra	h
   5BED CB 1D         [ 8] 3779 	rr	l
   5BEF 19            [11] 3780 	add	hl,de
   5BF0 7E            [ 7] 3781 	ld	a,(hl)
   5BF1 D6 05         [ 7] 3782 	sub	a, #0x05
   5BF3 20 21         [12] 3783 	jr	NZ,00113$
   5BF5                    3784 00112$:
                           3785 ;src/main.c:203: if(player.bullets < 3 && *flecha == 0){
   5BF5 FD 21 0E 6E   [14] 3786 	ld	iy,#_player + 10
   5BF9 FD 5E 00      [19] 3787 	ld	e, 0 (iy)
   5BFC 7B            [ 4] 3788 	ld	a,e
   5BFD D6 03         [ 7] 3789 	sub	a, #0x03
   5BFF D2 E0 5C      [10] 3790 	jp	NC,00130$
   5C02 DD 6E 06      [19] 3791 	ld	l,6 (ix)
   5C05 DD 66 07      [19] 3792 	ld	h,7 (ix)
   5C08 7E            [ 7] 3793 	ld	a,(hl)
   5C09 B7            [ 4] 3794 	or	a, a
   5C0A C2 E0 5C      [10] 3795 	jp	NZ,00130$
                           3796 ;src/main.c:204: player.bullets += 1;
   5C0D 1C            [ 4] 3797 	inc	e
   5C0E FD 73 00      [19] 3798 	ld	0 (iy), e
                           3799 ;src/main.c:205: *flecha = 1;
   5C11 36 01         [10] 3800 	ld	(hl),#0x01
   5C13 C3 E0 5C      [10] 3801 	jp	00130$
   5C16                    3802 00113$:
                           3803 ;src/main.c:207: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5C16 DD 7E F6      [19] 3804 	ld	a,-10 (ix)
   5C19 D6 09         [ 7] 3805 	sub	a, #0x09
   5C1B CA C6 5C      [10] 3806 	jp	Z,00107$
                           3807 ;src/main.c:208: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C1E DD 6E FB      [19] 3808 	ld	l,-5 (ix)
   5C21 DD 66 FC      [19] 3809 	ld	h,-4 (ix)
   5C24 DD 7E FD      [19] 3810 	ld	a,-3 (ix)
   5C27 B7            [ 4] 3811 	or	a, a
   5C28 28 02         [12] 3812 	jr	Z,00144$
   5C2A E1            [10] 3813 	pop	hl
   5C2B E5            [11] 3814 	push	hl
   5C2C                    3815 00144$:
   5C2C CB 2C         [ 8] 3816 	sra	h
   5C2E CB 1D         [ 8] 3817 	rr	l
   5C30 CB 2C         [ 8] 3818 	sra	h
   5C32 CB 1D         [ 8] 3819 	rr	l
   5C34 DD 5E F4      [19] 3820 	ld	e,-12 (ix)
   5C37 DD 56 F5      [19] 3821 	ld	d,-11 (ix)
   5C3A 19            [11] 3822 	add	hl,de
   5C3B 7E            [ 7] 3823 	ld	a,(hl)
   5C3C D6 09         [ 7] 3824 	sub	a, #0x09
   5C3E CA C6 5C      [10] 3825 	jp	Z,00107$
                           3826 ;src/main.c:209: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5C41 69            [ 4] 3827 	ld	l, c
   5C42 60            [ 4] 3828 	ld	h, b
   5C43 DD 7E F8      [19] 3829 	ld	a,-8 (ix)
   5C46 B7            [ 4] 3830 	or	a, a
   5C47 28 06         [12] 3831 	jr	Z,00145$
   5C49 DD 6E F9      [19] 3832 	ld	l,-7 (ix)
   5C4C DD 66 FA      [19] 3833 	ld	h,-6 (ix)
   5C4F                    3834 00145$:
   5C4F CB 2C         [ 8] 3835 	sra	h
   5C51 CB 1D         [ 8] 3836 	rr	l
   5C53 CB 2C         [ 8] 3837 	sra	h
   5C55 CB 1D         [ 8] 3838 	rr	l
   5C57 CB 2C         [ 8] 3839 	sra	h
   5C59 CB 1D         [ 8] 3840 	rr	l
   5C5B CB 2C         [ 8] 3841 	sra	h
   5C5D CB 1D         [ 8] 3842 	rr	l
   5C5F 5D            [ 4] 3843 	ld	e, l
   5C60 54            [ 4] 3844 	ld	d, h
   5C61 29            [11] 3845 	add	hl, hl
   5C62 29            [11] 3846 	add	hl, hl
   5C63 19            [11] 3847 	add	hl, de
   5C64 29            [11] 3848 	add	hl, hl
   5C65 29            [11] 3849 	add	hl, hl
   5C66 11 02 6D      [10] 3850 	ld	de,#_scene
   5C69 19            [11] 3851 	add	hl,de
   5C6A DD 5E F7      [19] 3852 	ld	e,-9 (ix)
   5C6D 16 00         [ 7] 3853 	ld	d,#0x00
   5C6F 19            [11] 3854 	add	hl,de
   5C70 7E            [ 7] 3855 	ld	a,(hl)
   5C71 D6 09         [ 7] 3856 	sub	a, #0x09
   5C73 28 51         [12] 3857 	jr	Z,00107$
                           3858 ;src/main.c:210: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C75 DD 7E F8      [19] 3859 	ld	a,-8 (ix)
   5C78 B7            [ 4] 3860 	or	a, a
   5C79 28 06         [12] 3861 	jr	Z,00146$
   5C7B DD 4E F9      [19] 3862 	ld	c,-7 (ix)
   5C7E DD 46 FA      [19] 3863 	ld	b,-6 (ix)
   5C81                    3864 00146$:
   5C81 CB 28         [ 8] 3865 	sra	b
   5C83 CB 19         [ 8] 3866 	rr	c
   5C85 CB 28         [ 8] 3867 	sra	b
   5C87 CB 19         [ 8] 3868 	rr	c
   5C89 CB 28         [ 8] 3869 	sra	b
   5C8B CB 19         [ 8] 3870 	rr	c
   5C8D CB 28         [ 8] 3871 	sra	b
   5C8F CB 19         [ 8] 3872 	rr	c
   5C91 69            [ 4] 3873 	ld	l, c
   5C92 60            [ 4] 3874 	ld	h, b
   5C93 29            [11] 3875 	add	hl, hl
   5C94 29            [11] 3876 	add	hl, hl
   5C95 09            [11] 3877 	add	hl, bc
   5C96 29            [11] 3878 	add	hl, hl
   5C97 29            [11] 3879 	add	hl, hl
   5C98 3E 02         [ 7] 3880 	ld	a,#<(_scene)
   5C9A 85            [ 4] 3881 	add	a, l
   5C9B DD 77 F9      [19] 3882 	ld	-7 (ix),a
   5C9E 3E 6D         [ 7] 3883 	ld	a,#>(_scene)
   5CA0 8C            [ 4] 3884 	adc	a, h
   5CA1 DD 77 FA      [19] 3885 	ld	-6 (ix),a
   5CA4 DD 6E FB      [19] 3886 	ld	l,-5 (ix)
   5CA7 DD 66 FC      [19] 3887 	ld	h,-4 (ix)
   5CAA DD 7E FD      [19] 3888 	ld	a,-3 (ix)
   5CAD B7            [ 4] 3889 	or	a, a
   5CAE 28 02         [12] 3890 	jr	Z,00147$
   5CB0 E1            [10] 3891 	pop	hl
   5CB1 E5            [11] 3892 	push	hl
   5CB2                    3893 00147$:
   5CB2 CB 2C         [ 8] 3894 	sra	h
   5CB4 CB 1D         [ 8] 3895 	rr	l
   5CB6 CB 2C         [ 8] 3896 	sra	h
   5CB8 CB 1D         [ 8] 3897 	rr	l
   5CBA DD 5E F9      [19] 3898 	ld	e,-7 (ix)
   5CBD DD 56 FA      [19] 3899 	ld	d,-6 (ix)
   5CC0 19            [11] 3900 	add	hl,de
   5CC1 7E            [ 7] 3901 	ld	a,(hl)
   5CC2 D6 09         [ 7] 3902 	sub	a, #0x09
   5CC4 20 1A         [12] 3903 	jr	NZ,00130$
   5CC6                    3904 00107$:
                           3905 ;src/main.c:213: cpct_clearScreen(0);
   5CC6 21 00 40      [10] 3906 	ld	hl,#0x4000
   5CC9 E5            [11] 3907 	push	hl
   5CCA AF            [ 4] 3908 	xor	a, a
   5CCB F5            [11] 3909 	push	af
   5CCC 33            [ 6] 3910 	inc	sp
   5CCD 26 C0         [ 7] 3911 	ld	h, #0xC0
   5CCF E5            [11] 3912 	push	hl
   5CD0 CD 19 6B      [17] 3913 	call	_cpct_memset
                           3914 ;src/main.c:214: map+=1;
   5CD3 21 F3 6D      [10] 3915 	ld	hl, #_map+0
   5CD6 34            [11] 3916 	inc	(hl)
                           3917 ;src/main.c:215: drawMap(map);
   5CD7 3A F3 6D      [13] 3918 	ld	a,(_map)
   5CDA F5            [11] 3919 	push	af
   5CDB 33            [ 6] 3920 	inc	sp
   5CDC CD C0 46      [17] 3921 	call	_drawMap
   5CDF 33            [ 6] 3922 	inc	sp
   5CE0                    3923 00130$:
   5CE0 DD F9         [10] 3924 	ld	sp, ix
   5CE2 DD E1         [14] 3925 	pop	ix
   5CE4 C9            [10] 3926 	ret
                           3927 ;src/main.c:219: u8 checkArrowCollisions(){
                           3928 ;	---------------------------------
                           3929 ; Function checkArrowCollisions
                           3930 ; ---------------------------------
   5CE5                    3931 _checkArrowCollisions::
   5CE5 DD E5         [15] 3932 	push	ix
   5CE7 DD 21 00 00   [14] 3933 	ld	ix,#0
   5CEB DD 39         [15] 3934 	add	ix,sp
   5CED 21 F4 FF      [10] 3935 	ld	hl,#-12
   5CF0 39            [11] 3936 	add	hl,sp
   5CF1 F9            [ 6] 3937 	ld	sp,hl
                           3938 ;src/main.c:220: u8 bound =0;
   5CF2 DD 36 F4 00   [19] 3939 	ld	-12 (ix),#0x00
                           3940 ;src/main.c:221: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5CF6 3A FB 6D      [13] 3941 	ld	a,(#(_object + 0x0001) + 0)
   5CF9 DD 77 FD      [19] 3942 	ld	-3 (ix), a
   5CFC 07            [ 4] 3943 	rlca
   5CFD 07            [ 4] 3944 	rlca
   5CFE 07            [ 4] 3945 	rlca
   5CFF 07            [ 4] 3946 	rlca
   5D00 E6 0F         [ 7] 3947 	and	a,#0x0F
   5D02 4F            [ 4] 3948 	ld	c,a
   5D03 06 00         [ 7] 3949 	ld	b,#0x00
   5D05 69            [ 4] 3950 	ld	l, c
   5D06 60            [ 4] 3951 	ld	h, b
   5D07 29            [11] 3952 	add	hl, hl
   5D08 29            [11] 3953 	add	hl, hl
   5D09 09            [11] 3954 	add	hl, bc
   5D0A 29            [11] 3955 	add	hl, hl
   5D0B 29            [11] 3956 	add	hl, hl
   5D0C 3E 02         [ 7] 3957 	ld	a,#<(_scene)
   5D0E 85            [ 4] 3958 	add	a, l
   5D0F DD 77 FE      [19] 3959 	ld	-2 (ix),a
   5D12 3E 6D         [ 7] 3960 	ld	a,#>(_scene)
   5D14 8C            [ 4] 3961 	adc	a, h
   5D15 DD 77 FF      [19] 3962 	ld	-1 (ix),a
   5D18 21 FA 6D      [10] 3963 	ld	hl, #_object + 0
   5D1B 4E            [ 7] 3964 	ld	c,(hl)
   5D1C 79            [ 4] 3965 	ld	a,c
   5D1D 0F            [ 4] 3966 	rrca
   5D1E 0F            [ 4] 3967 	rrca
   5D1F E6 3F         [ 7] 3968 	and	a,#0x3F
   5D21 DD 77 FA      [19] 3969 	ld	-6 (ix),a
   5D24 DD 7E FE      [19] 3970 	ld	a,-2 (ix)
   5D27 DD 86 FA      [19] 3971 	add	a, -6 (ix)
   5D2A 6F            [ 4] 3972 	ld	l,a
   5D2B DD 7E FF      [19] 3973 	ld	a,-1 (ix)
   5D2E CE 00         [ 7] 3974 	adc	a, #0x00
   5D30 67            [ 4] 3975 	ld	h,a
   5D31 7E            [ 7] 3976 	ld	a,(hl)
   5D32 3D            [ 4] 3977 	dec	a
   5D33 CA 30 5E      [10] 3978 	jp	Z,00101$
                           3979 ;src/main.c:222: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5D36 06 00         [ 7] 3980 	ld	b,#0x00
   5D38 21 03 00      [10] 3981 	ld	hl,#0x0003
   5D3B 09            [11] 3982 	add	hl,bc
   5D3C DD 75 F8      [19] 3983 	ld	-8 (ix),l
   5D3F DD 74 F9      [19] 3984 	ld	-7 (ix),h
   5D42 DD 7E F8      [19] 3985 	ld	a,-8 (ix)
   5D45 DD 77 FB      [19] 3986 	ld	-5 (ix),a
   5D48 DD 7E F9      [19] 3987 	ld	a,-7 (ix)
   5D4B DD 77 FC      [19] 3988 	ld	-4 (ix),a
   5D4E DD 7E F9      [19] 3989 	ld	a,-7 (ix)
   5D51 07            [ 4] 3990 	rlca
   5D52 E6 01         [ 7] 3991 	and	a,#0x01
   5D54 DD 77 F5      [19] 3992 	ld	-11 (ix),a
   5D57 21 06 00      [10] 3993 	ld	hl,#0x0006
   5D5A 09            [11] 3994 	add	hl,bc
   5D5B DD 75 F6      [19] 3995 	ld	-10 (ix),l
   5D5E DD 74 F7      [19] 3996 	ld	-9 (ix),h
   5D61 DD 7E F5      [19] 3997 	ld	a,-11 (ix)
   5D64 B7            [ 4] 3998 	or	a, a
   5D65 28 0C         [12] 3999 	jr	Z,00108$
   5D67 DD 7E F6      [19] 4000 	ld	a,-10 (ix)
   5D6A DD 77 FB      [19] 4001 	ld	-5 (ix),a
   5D6D DD 7E F7      [19] 4002 	ld	a,-9 (ix)
   5D70 DD 77 FC      [19] 4003 	ld	-4 (ix),a
   5D73                    4004 00108$:
   5D73 DD 6E FB      [19] 4005 	ld	l,-5 (ix)
   5D76 DD 66 FC      [19] 4006 	ld	h,-4 (ix)
   5D79 CB 2C         [ 8] 4007 	sra	h
   5D7B CB 1D         [ 8] 4008 	rr	l
   5D7D CB 2C         [ 8] 4009 	sra	h
   5D7F CB 1D         [ 8] 4010 	rr	l
   5D81 DD 5E FE      [19] 4011 	ld	e,-2 (ix)
   5D84 DD 56 FF      [19] 4012 	ld	d,-1 (ix)
   5D87 19            [11] 4013 	add	hl,de
   5D88 7E            [ 7] 4014 	ld	a,(hl)
   5D89 3D            [ 4] 4015 	dec	a
   5D8A CA 30 5E      [10] 4016 	jp	Z,00101$
                           4017 ;src/main.c:223: || scene[(object.y+tileheight-2)/tileheight][(object.x)/tilewidth] == 1
   5D8D DD 5E FD      [19] 4018 	ld	e,-3 (ix)
   5D90 16 00         [ 7] 4019 	ld	d,#0x00
   5D92 21 0E 00      [10] 4020 	ld	hl,#0x000E
   5D95 19            [11] 4021 	add	hl,de
   5D96 4D            [ 4] 4022 	ld	c,l
   5D97 44            [ 4] 4023 	ld	b,h
   5D98 69            [ 4] 4024 	ld	l, c
   5D99 78            [ 4] 4025 	ld	a,b
   5D9A 67            [ 4] 4026 	ld	h,a
   5D9B 07            [ 4] 4027 	rlca
   5D9C E6 01         [ 7] 4028 	and	a,#0x01
   5D9E DD 77 FB      [19] 4029 	ld	-5 (ix),a
   5DA1 7B            [ 4] 4030 	ld	a,e
   5DA2 C6 1D         [ 7] 4031 	add	a, #0x1D
   5DA4 DD 77 FE      [19] 4032 	ld	-2 (ix),a
   5DA7 7A            [ 4] 4033 	ld	a,d
   5DA8 CE 00         [ 7] 4034 	adc	a, #0x00
   5DAA DD 77 FF      [19] 4035 	ld	-1 (ix),a
   5DAD DD 7E FB      [19] 4036 	ld	a,-5 (ix)
   5DB0 B7            [ 4] 4037 	or	a, a
   5DB1 28 06         [12] 4038 	jr	Z,00109$
   5DB3 DD 6E FE      [19] 4039 	ld	l,-2 (ix)
   5DB6 DD 66 FF      [19] 4040 	ld	h,-1 (ix)
   5DB9                    4041 00109$:
   5DB9 CB 2C         [ 8] 4042 	sra	h
   5DBB CB 1D         [ 8] 4043 	rr	l
   5DBD CB 2C         [ 8] 4044 	sra	h
   5DBF CB 1D         [ 8] 4045 	rr	l
   5DC1 CB 2C         [ 8] 4046 	sra	h
   5DC3 CB 1D         [ 8] 4047 	rr	l
   5DC5 CB 2C         [ 8] 4048 	sra	h
   5DC7 CB 1D         [ 8] 4049 	rr	l
   5DC9 5D            [ 4] 4050 	ld	e, l
   5DCA 54            [ 4] 4051 	ld	d, h
   5DCB 29            [11] 4052 	add	hl, hl
   5DCC 29            [11] 4053 	add	hl, hl
   5DCD 19            [11] 4054 	add	hl, de
   5DCE 29            [11] 4055 	add	hl, hl
   5DCF 29            [11] 4056 	add	hl, hl
   5DD0 11 02 6D      [10] 4057 	ld	de,#_scene
   5DD3 19            [11] 4058 	add	hl,de
   5DD4 DD 5E FA      [19] 4059 	ld	e,-6 (ix)
   5DD7 16 00         [ 7] 4060 	ld	d,#0x00
   5DD9 19            [11] 4061 	add	hl,de
   5DDA 7E            [ 7] 4062 	ld	a,(hl)
   5DDB 3D            [ 4] 4063 	dec	a
   5DDC 28 52         [12] 4064 	jr	Z,00101$
                           4065 ;src/main.c:224: || scene[(object.y+tileheight-2)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5DDE DD 7E FB      [19] 4066 	ld	a,-5 (ix)
   5DE1 B7            [ 4] 4067 	or	a, a
   5DE2 28 06         [12] 4068 	jr	Z,00110$
   5DE4 DD 4E FE      [19] 4069 	ld	c,-2 (ix)
   5DE7 DD 46 FF      [19] 4070 	ld	b,-1 (ix)
   5DEA                    4071 00110$:
   5DEA CB 28         [ 8] 4072 	sra	b
   5DEC CB 19         [ 8] 4073 	rr	c
   5DEE CB 28         [ 8] 4074 	sra	b
   5DF0 CB 19         [ 8] 4075 	rr	c
   5DF2 CB 28         [ 8] 4076 	sra	b
   5DF4 CB 19         [ 8] 4077 	rr	c
   5DF6 CB 28         [ 8] 4078 	sra	b
   5DF8 CB 19         [ 8] 4079 	rr	c
   5DFA 69            [ 4] 4080 	ld	l, c
   5DFB 60            [ 4] 4081 	ld	h, b
   5DFC 29            [11] 4082 	add	hl, hl
   5DFD 29            [11] 4083 	add	hl, hl
   5DFE 09            [11] 4084 	add	hl, bc
   5DFF 29            [11] 4085 	add	hl, hl
   5E00 29            [11] 4086 	add	hl, hl
   5E01 3E 02         [ 7] 4087 	ld	a,#<(_scene)
   5E03 85            [ 4] 4088 	add	a, l
   5E04 DD 77 FB      [19] 4089 	ld	-5 (ix),a
   5E07 3E 6D         [ 7] 4090 	ld	a,#>(_scene)
   5E09 8C            [ 4] 4091 	adc	a, h
   5E0A DD 77 FC      [19] 4092 	ld	-4 (ix),a
   5E0D DD 6E F8      [19] 4093 	ld	l,-8 (ix)
   5E10 DD 66 F9      [19] 4094 	ld	h,-7 (ix)
   5E13 DD 7E F5      [19] 4095 	ld	a,-11 (ix)
   5E16 B7            [ 4] 4096 	or	a, a
   5E17 28 04         [12] 4097 	jr	Z,00111$
   5E19 C1            [10] 4098 	pop	bc
   5E1A E1            [10] 4099 	pop	hl
   5E1B E5            [11] 4100 	push	hl
   5E1C C5            [11] 4101 	push	bc
   5E1D                    4102 00111$:
   5E1D CB 2C         [ 8] 4103 	sra	h
   5E1F CB 1D         [ 8] 4104 	rr	l
   5E21 CB 2C         [ 8] 4105 	sra	h
   5E23 CB 1D         [ 8] 4106 	rr	l
   5E25 DD 5E FB      [19] 4107 	ld	e,-5 (ix)
   5E28 DD 56 FC      [19] 4108 	ld	d,-4 (ix)
   5E2B 19            [11] 4109 	add	hl,de
   5E2C 7E            [ 7] 4110 	ld	a,(hl)
   5E2D 3D            [ 4] 4111 	dec	a
   5E2E 20 10         [12] 4112 	jr	NZ,00102$
   5E30                    4113 00101$:
                           4114 ;src/main.c:226: object.x=object.lx;
   5E30 3A FC 6D      [13] 4115 	ld	a, (#_object + 2)
   5E33 32 FA 6D      [13] 4116 	ld	(#_object),a
                           4117 ;src/main.c:227: object.y=object.ly;
   5E36 3A FD 6D      [13] 4118 	ld	a, (#_object + 3)
   5E39 32 FB 6D      [13] 4119 	ld	(#(_object + 0x0001)),a
                           4120 ;src/main.c:228: bound = 1;
   5E3C DD 36 F4 01   [19] 4121 	ld	-12 (ix),#0x01
   5E40                    4122 00102$:
                           4123 ;src/main.c:231: return bound;
   5E40 DD 6E F4      [19] 4124 	ld	l,-12 (ix)
   5E43 DD F9         [10] 4125 	ld	sp, ix
   5E45 DD E1         [14] 4126 	pop	ix
   5E47 C9            [10] 4127 	ret
                           4128 ;src/main.c:237: void followPlayer(){
                           4129 ;	---------------------------------
                           4130 ; Function followPlayer
                           4131 ; ---------------------------------
   5E48                    4132 _followPlayer::
   5E48 DD E5         [15] 4133 	push	ix
   5E4A DD 21 00 00   [14] 4134 	ld	ix,#0
   5E4E DD 39         [15] 4135 	add	ix,sp
   5E50 21 E5 FF      [10] 4136 	ld	hl,#-27
   5E53 39            [11] 4137 	add	hl,sp
   5E54 F9            [ 6] 4138 	ld	sp,hl
                           4139 ;src/main.c:240: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   5E55 21 05 6E      [10] 4140 	ld	hl, #(_player + 0x0001) + 0
   5E58 56            [ 7] 4141 	ld	d,(hl)
   5E59 3A 04 6E      [13] 4142 	ld	a, (#_player + 0)
   5E5C D5            [11] 4143 	push	de
   5E5D 33            [ 6] 4144 	inc	sp
   5E5E F5            [11] 4145 	push	af
   5E5F 33            [ 6] 4146 	inc	sp
   5E60 CD 4E 4F      [17] 4147 	call	_detectPlayerRoom
   5E63 F1            [10] 4148 	pop	af
   5E64 DD 75 FF      [19] 4149 	ld	-1 (ix),l
   5E67 21 1A 6E      [10] 4150 	ld	hl, #_enemy + 11
   5E6A DD 7E FF      [19] 4151 	ld	a,-1 (ix)
   5E6D 96            [ 7] 4152 	sub	a,(hl)
   5E6E 28 0C         [12] 4153 	jr	Z,00102$
                           4154 ;src/main.c:241: auxX = enemy.seenX;
   5E70 3A 1B 6E      [13] 4155 	ld	a,(#_enemy + 12)
   5E73 DD 77 E5      [19] 4156 	ld	-27 (ix),a
                           4157 ;src/main.c:242: auxY = enemy.seenY;
   5E76 21 1C 6E      [10] 4158 	ld	hl, #_enemy + 13
   5E79 56            [ 7] 4159 	ld	d,(hl)
   5E7A 18 0B         [12] 4160 	jr	00103$
   5E7C                    4161 00102$:
                           4162 ;src/main.c:244: auxX = player.x;
   5E7C 21 04 6E      [10] 4163 	ld	hl, #_player + 0
   5E7F 7E            [ 7] 4164 	ld	a,(hl)
   5E80 DD 77 E5      [19] 4165 	ld	-27 (ix),a
                           4166 ;src/main.c:245: auxY = player.y;
   5E83 21 05 6E      [10] 4167 	ld	hl, #(_player + 0x0001) + 0
   5E86 56            [ 7] 4168 	ld	d,(hl)
   5E87                    4169 00103$:
                           4170 ;src/main.c:249: if(auxX < enemy.x){
   5E87 3A 0F 6E      [13] 4171 	ld	a,(#_enemy + 0)
                           4172 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E8A DD 77 FF      [19] 4173 	ld	-1 (ix), a
   5E8D DD 77 FD      [19] 4174 	ld	-3 (ix),a
   5E90 DD 36 FE 00   [19] 4175 	ld	-2 (ix),#0x00
                           4176 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5E94 DD 7E FF      [19] 4177 	ld	a,-1 (ix)
   5E97 0F            [ 4] 4178 	rrca
   5E98 0F            [ 4] 4179 	rrca
   5E99 E6 3F         [ 7] 4180 	and	a,#0x3F
   5E9B DD 77 FC      [19] 4181 	ld	-4 (ix),a
                           4182 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E9E 21 10 6E      [10] 4183 	ld	hl, #(_enemy + 0x0001) + 0
   5EA1 5E            [ 7] 4184 	ld	e,(hl)
   5EA2 DD 7E FD      [19] 4185 	ld	a,-3 (ix)
   5EA5 C6 FF         [ 7] 4186 	add	a,#0xFF
   5EA7 DD 77 FA      [19] 4187 	ld	-6 (ix),a
   5EAA DD 7E FE      [19] 4188 	ld	a,-2 (ix)
   5EAD CE FF         [ 7] 4189 	adc	a,#0xFF
   5EAF DD 77 FB      [19] 4190 	ld	-5 (ix),a
   5EB2 DD 7E FD      [19] 4191 	ld	a,-3 (ix)
   5EB5 C6 02         [ 7] 4192 	add	a, #0x02
   5EB7 DD 77 F8      [19] 4193 	ld	-8 (ix),a
   5EBA DD 7E FE      [19] 4194 	ld	a,-2 (ix)
   5EBD CE 00         [ 7] 4195 	adc	a, #0x00
   5EBF DD 77 F9      [19] 4196 	ld	-7 (ix),a
   5EC2 7B            [ 4] 4197 	ld	a,e
   5EC3 07            [ 4] 4198 	rlca
   5EC4 07            [ 4] 4199 	rlca
   5EC5 07            [ 4] 4200 	rlca
   5EC6 07            [ 4] 4201 	rlca
   5EC7 E6 0F         [ 7] 4202 	and	a,#0x0F
   5EC9 67            [ 4] 4203 	ld	h,a
   5ECA DD 7E FB      [19] 4204 	ld	a,-5 (ix)
   5ECD 07            [ 4] 4205 	rlca
   5ECE E6 01         [ 7] 4206 	and	a,#0x01
   5ED0 DD 77 F7      [19] 4207 	ld	-9 (ix),a
                           4208 ;src/main.c:253: }else if(auxY < enemy.y){
   5ED3 7A            [ 4] 4209 	ld	a,d
   5ED4 93            [ 4] 4210 	sub	a, e
   5ED5 3E 00         [ 7] 4211 	ld	a,#0x00
   5ED7 17            [ 4] 4212 	rla
   5ED8 DD 77 F6      [19] 4213 	ld	-10 (ix),a
                           4214 ;src/main.c:255: enemy.y-=1;
   5EDB 7B            [ 4] 4215 	ld	a,e
   5EDC C6 FF         [ 7] 4216 	add	a,#0xFF
   5EDE DD 77 F5      [19] 4217 	ld	-11 (ix),a
                           4218 ;src/main.c:258: enemy.y+=1;
   5EE1 7B            [ 4] 4219 	ld	a,e
   5EE2 3C            [ 4] 4220 	inc	a
   5EE3 DD 77 F4      [19] 4221 	ld	-12 (ix),a
                           4222 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5EE6 16 00         [ 7] 4223 	ld	d,#0x00
                           4224 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5EE8 4C            [ 4] 4225 	ld	c,h
   5EE9 06 00         [ 7] 4226 	ld	b,#0x00
   5EEB 69            [ 4] 4227 	ld	l, c
   5EEC 60            [ 4] 4228 	ld	h, b
   5EED 29            [11] 4229 	add	hl, hl
   5EEE 29            [11] 4230 	add	hl, hl
   5EEF 09            [11] 4231 	add	hl, bc
   5EF0 29            [11] 4232 	add	hl, hl
   5EF1 29            [11] 4233 	add	hl, hl
   5EF2 DD 75 F2      [19] 4234 	ld	-14 (ix),l
   5EF5 DD 74 F3      [19] 4235 	ld	-13 (ix),h
                           4236 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5EF8 7B            [ 4] 4237 	ld	a,e
   5EF9 C6 FF         [ 7] 4238 	add	a,#0xFF
   5EFB DD 77 F0      [19] 4239 	ld	-16 (ix),a
   5EFE 7A            [ 4] 4240 	ld	a,d
   5EFF CE FF         [ 7] 4241 	adc	a,#0xFF
   5F01 DD 77 F1      [19] 4242 	ld	-15 (ix),a
   5F04 21 0E 00      [10] 4243 	ld	hl,#0x000E
   5F07 19            [11] 4244 	add	hl,de
   5F08 DD 75 EE      [19] 4245 	ld	-18 (ix),l
   5F0B DD 74 EF      [19] 4246 	ld	-17 (ix),h
                           4247 ;src/main.c:257: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5F0E 21 10 00      [10] 4248 	ld	hl,#0x0010
   5F11 19            [11] 4249 	add	hl,de
   5F12 DD 75 EC      [19] 4250 	ld	-20 (ix),l
   5F15 DD 74 ED      [19] 4251 	ld	-19 (ix),h
   5F18 21 1F 00      [10] 4252 	ld	hl,#0x001F
   5F1B 19            [11] 4253 	add	hl,de
   5F1C DD 75 EA      [19] 4254 	ld	-22 (ix),l
   5F1F DD 74 EB      [19] 4255 	ld	-21 (ix),h
                           4256 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5F22 DD 7E F1      [19] 4257 	ld	a,-15 (ix)
   5F25 07            [ 4] 4258 	rlca
   5F26 E6 01         [ 7] 4259 	and	a,#0x01
   5F28 DD 77 E9      [19] 4260 	ld	-23 (ix),a
                           4261 ;src/main.c:257: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5F2B DD 7E ED      [19] 4262 	ld	a,-19 (ix)
   5F2E 07            [ 4] 4263 	rlca
   5F2F E6 01         [ 7] 4264 	and	a,#0x01
   5F31 DD 77 E8      [19] 4265 	ld	-24 (ix),a
                           4266 ;src/main.c:249: if(auxX < enemy.x){
   5F34 DD 7E E5      [19] 4267 	ld	a,-27 (ix)
   5F37 DD 96 FF      [19] 4268 	sub	a, -1 (ix)
   5F3A D2 FD 5F      [10] 4269 	jp	NC,00135$
                           4270 ;src/main.c:251: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5F3D DD 7E F2      [19] 4271 	ld	a,-14 (ix)
   5F40 C6 02         [ 7] 4272 	add	a, #<(_scene)
   5F42 6F            [ 4] 4273 	ld	l,a
   5F43 DD 7E F3      [19] 4274 	ld	a,-13 (ix)
   5F46 CE 6D         [ 7] 4275 	adc	a, #>(_scene)
   5F48 67            [ 4] 4276 	ld	h,a
   5F49 DD 5E FA      [19] 4277 	ld	e,-6 (ix)
   5F4C DD 56 FB      [19] 4278 	ld	d,-5 (ix)
   5F4F DD 7E F7      [19] 4279 	ld	a,-9 (ix)
   5F52 B7            [ 4] 4280 	or	a, a
   5F53 28 06         [12] 4281 	jr	Z,00139$
   5F55 DD 5E F8      [19] 4282 	ld	e,-8 (ix)
   5F58 DD 56 F9      [19] 4283 	ld	d,-7 (ix)
   5F5B                    4284 00139$:
   5F5B CB 2A         [ 8] 4285 	sra	d
   5F5D CB 1B         [ 8] 4286 	rr	e
   5F5F CB 2A         [ 8] 4287 	sra	d
   5F61 CB 1B         [ 8] 4288 	rr	e
   5F63 19            [11] 4289 	add	hl,de
   5F64 7E            [ 7] 4290 	ld	a,(hl)
   5F65 3D            [ 4] 4291 	dec	a
   5F66 28 0B         [12] 4292 	jr	Z,00112$
                           4293 ;src/main.c:252: enemy.x-=1;
   5F68 DD 56 FF      [19] 4294 	ld	d,-1 (ix)
   5F6B 15            [ 4] 4295 	dec	d
   5F6C 21 0F 6E      [10] 4296 	ld	hl,#_enemy
   5F6F 72            [ 7] 4297 	ld	(hl),d
   5F70 C3 5B 61      [10] 4298 	jp	00137$
   5F73                    4299 00112$:
                           4300 ;src/main.c:253: }else if(auxY < enemy.y){
   5F73 DD 7E F6      [19] 4301 	ld	a,-10 (ix)
   5F76 B7            [ 4] 4302 	or	a, a
   5F77 28 42         [12] 4303 	jr	Z,00109$
                           4304 ;src/main.c:254: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5F79 DD 4E F0      [19] 4305 	ld	c,-16 (ix)
   5F7C DD 46 F1      [19] 4306 	ld	b,-15 (ix)
   5F7F DD 7E E9      [19] 4307 	ld	a,-23 (ix)
   5F82 B7            [ 4] 4308 	or	a, a
   5F83 28 06         [12] 4309 	jr	Z,00140$
   5F85 DD 4E EE      [19] 4310 	ld	c,-18 (ix)
   5F88 DD 46 EF      [19] 4311 	ld	b,-17 (ix)
   5F8B                    4312 00140$:
   5F8B CB 28         [ 8] 4313 	sra	b
   5F8D CB 19         [ 8] 4314 	rr	c
   5F8F CB 28         [ 8] 4315 	sra	b
   5F91 CB 19         [ 8] 4316 	rr	c
   5F93 CB 28         [ 8] 4317 	sra	b
   5F95 CB 19         [ 8] 4318 	rr	c
   5F97 CB 28         [ 8] 4319 	sra	b
   5F99 CB 19         [ 8] 4320 	rr	c
   5F9B 69            [ 4] 4321 	ld	l, c
   5F9C 60            [ 4] 4322 	ld	h, b
   5F9D 29            [11] 4323 	add	hl, hl
   5F9E 29            [11] 4324 	add	hl, hl
   5F9F 09            [11] 4325 	add	hl, bc
   5FA0 29            [11] 4326 	add	hl, hl
   5FA1 29            [11] 4327 	add	hl, hl
   5FA2 11 02 6D      [10] 4328 	ld	de,#_scene
   5FA5 19            [11] 4329 	add	hl,de
   5FA6 DD 5E FC      [19] 4330 	ld	e,-4 (ix)
   5FA9 16 00         [ 7] 4331 	ld	d,#0x00
   5FAB 19            [11] 4332 	add	hl,de
   5FAC 7E            [ 7] 4333 	ld	a,(hl)
   5FAD 3D            [ 4] 4334 	dec	a
   5FAE CA 5B 61      [10] 4335 	jp	Z,00137$
                           4336 ;src/main.c:255: enemy.y-=1;
   5FB1 21 10 6E      [10] 4337 	ld	hl,#(_enemy + 0x0001)
   5FB4 DD 7E F5      [19] 4338 	ld	a,-11 (ix)
   5FB7 77            [ 7] 4339 	ld	(hl),a
   5FB8 C3 5B 61      [10] 4340 	jp	00137$
   5FBB                    4341 00109$:
                           4342 ;src/main.c:257: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5FBB DD 4E EC      [19] 4343 	ld	c,-20 (ix)
   5FBE DD 46 ED      [19] 4344 	ld	b,-19 (ix)
   5FC1 DD 7E E8      [19] 4345 	ld	a,-24 (ix)
   5FC4 B7            [ 4] 4346 	or	a, a
   5FC5 28 06         [12] 4347 	jr	Z,00141$
   5FC7 DD 4E EA      [19] 4348 	ld	c,-22 (ix)
   5FCA DD 46 EB      [19] 4349 	ld	b,-21 (ix)
   5FCD                    4350 00141$:
   5FCD CB 28         [ 8] 4351 	sra	b
   5FCF CB 19         [ 8] 4352 	rr	c
   5FD1 CB 28         [ 8] 4353 	sra	b
   5FD3 CB 19         [ 8] 4354 	rr	c
   5FD5 CB 28         [ 8] 4355 	sra	b
   5FD7 CB 19         [ 8] 4356 	rr	c
   5FD9 CB 28         [ 8] 4357 	sra	b
   5FDB CB 19         [ 8] 4358 	rr	c
   5FDD 69            [ 4] 4359 	ld	l, c
   5FDE 60            [ 4] 4360 	ld	h, b
   5FDF 29            [11] 4361 	add	hl, hl
   5FE0 29            [11] 4362 	add	hl, hl
   5FE1 09            [11] 4363 	add	hl, bc
   5FE2 29            [11] 4364 	add	hl, hl
   5FE3 29            [11] 4365 	add	hl, hl
   5FE4 11 02 6D      [10] 4366 	ld	de,#_scene
   5FE7 19            [11] 4367 	add	hl,de
   5FE8 DD 5E FC      [19] 4368 	ld	e,-4 (ix)
   5FEB 16 00         [ 7] 4369 	ld	d,#0x00
   5FED 19            [11] 4370 	add	hl,de
   5FEE 7E            [ 7] 4371 	ld	a,(hl)
   5FEF 3D            [ 4] 4372 	dec	a
   5FF0 CA 5B 61      [10] 4373 	jp	Z,00137$
                           4374 ;src/main.c:258: enemy.y+=1;
   5FF3 21 10 6E      [10] 4375 	ld	hl,#(_enemy + 0x0001)
   5FF6 DD 7E F4      [19] 4376 	ld	a,-12 (ix)
   5FF9 77            [ 7] 4377 	ld	(hl),a
   5FFA C3 5B 61      [10] 4378 	jp	00137$
   5FFD                    4379 00135$:
                           4380 ;src/main.c:260: }else if(auxX > enemy.x){
   5FFD DD 7E FF      [19] 4381 	ld	a,-1 (ix)
   6000 DD 96 E5      [19] 4382 	sub	a, -27 (ix)
   6003 D2 D7 60      [10] 4383 	jp	NC,00132$
                           4384 ;src/main.c:262: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   6006 3E 02         [ 7] 4385 	ld	a,#<(_scene)
   6008 DD 86 F2      [19] 4386 	add	a, -14 (ix)
   600B DD 77 F2      [19] 4387 	ld	-14 (ix),a
   600E 3E 6D         [ 7] 4388 	ld	a,#>(_scene)
   6010 DD 8E F3      [19] 4389 	adc	a, -13 (ix)
   6013 DD 77 F3      [19] 4390 	ld	-13 (ix),a
   6016 DD 7E FD      [19] 4391 	ld	a,-3 (ix)
   6019 C6 04         [ 7] 4392 	add	a, #0x04
   601B 67            [ 4] 4393 	ld	h,a
   601C DD 7E FE      [19] 4394 	ld	a,-2 (ix)
   601F CE 00         [ 7] 4395 	adc	a, #0x00
   6021 6F            [ 4] 4396 	ld	l,a
   6022 DD 74 E6      [19] 4397 	ld	-26 (ix),h
   6025 DD 75 E7      [19] 4398 	ld	-25 (ix),l
   6028 CB 7D         [ 8] 4399 	bit	7, l
   602A 28 10         [12] 4400 	jr	Z,00142$
   602C DD 7E FD      [19] 4401 	ld	a,-3 (ix)
   602F C6 07         [ 7] 4402 	add	a, #0x07
   6031 DD 77 E6      [19] 4403 	ld	-26 (ix),a
   6034 DD 7E FE      [19] 4404 	ld	a,-2 (ix)
   6037 CE 00         [ 7] 4405 	adc	a, #0x00
   6039 DD 77 E7      [19] 4406 	ld	-25 (ix),a
   603C                    4407 00142$:
   603C DD 6E E6      [19] 4408 	ld	l,-26 (ix)
   603F DD 66 E7      [19] 4409 	ld	h,-25 (ix)
   6042 CB 2C         [ 8] 4410 	sra	h
   6044 CB 1D         [ 8] 4411 	rr	l
   6046 CB 2C         [ 8] 4412 	sra	h
   6048 CB 1D         [ 8] 4413 	rr	l
   604A DD 5E F2      [19] 4414 	ld	e,-14 (ix)
   604D DD 56 F3      [19] 4415 	ld	d,-13 (ix)
   6050 19            [11] 4416 	add	hl,de
   6051 7E            [ 7] 4417 	ld	a,(hl)
   6052 3D            [ 4] 4418 	dec	a
   6053 28 0A         [12] 4419 	jr	Z,00122$
                           4420 ;src/main.c:263: enemy.x+=1;
   6055 DD 7E FF      [19] 4421 	ld	a,-1 (ix)
   6058 3C            [ 4] 4422 	inc	a
   6059 32 0F 6E      [13] 4423 	ld	(#_enemy),a
   605C C3 5B 61      [10] 4424 	jp	00137$
   605F                    4425 00122$:
                           4426 ;src/main.c:264: }else if(auxY < enemy.y){
   605F DD 7E F6      [19] 4427 	ld	a,-10 (ix)
   6062 B7            [ 4] 4428 	or	a, a
   6063 28 30         [12] 4429 	jr	Z,00119$
                           4430 ;src/main.c:265: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   6065 DD 4E FA      [19] 4431 	ld	c,-6 (ix)
   6068 DD 46 FB      [19] 4432 	ld	b,-5 (ix)
   606B DD 7E F7      [19] 4433 	ld	a,-9 (ix)
   606E B7            [ 4] 4434 	or	a, a
   606F 28 06         [12] 4435 	jr	Z,00143$
   6071 DD 4E F8      [19] 4436 	ld	c,-8 (ix)
   6074 DD 46 F9      [19] 4437 	ld	b,-7 (ix)
   6077                    4438 00143$:
   6077 CB 28         [ 8] 4439 	sra	b
   6079 CB 19         [ 8] 4440 	rr	c
   607B CB 28         [ 8] 4441 	sra	b
   607D CB 19         [ 8] 4442 	rr	c
   607F DD 6E F2      [19] 4443 	ld	l,-14 (ix)
   6082 DD 66 F3      [19] 4444 	ld	h,-13 (ix)
   6085 09            [11] 4445 	add	hl,bc
   6086 7E            [ 7] 4446 	ld	a,(hl)
   6087 3D            [ 4] 4447 	dec	a
   6088 CA 5B 61      [10] 4448 	jp	Z,00137$
                           4449 ;src/main.c:266: enemy.y-=1;
   608B 21 10 6E      [10] 4450 	ld	hl,#(_enemy + 0x0001)
   608E DD 7E F5      [19] 4451 	ld	a,-11 (ix)
   6091 77            [ 7] 4452 	ld	(hl),a
   6092 C3 5B 61      [10] 4453 	jp	00137$
   6095                    4454 00119$:
                           4455 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   6095 DD 4E EC      [19] 4456 	ld	c,-20 (ix)
   6098 DD 46 ED      [19] 4457 	ld	b,-19 (ix)
   609B DD 7E E8      [19] 4458 	ld	a,-24 (ix)
   609E B7            [ 4] 4459 	or	a, a
   609F 28 06         [12] 4460 	jr	Z,00144$
   60A1 DD 4E EA      [19] 4461 	ld	c,-22 (ix)
   60A4 DD 46 EB      [19] 4462 	ld	b,-21 (ix)
   60A7                    4463 00144$:
   60A7 CB 28         [ 8] 4464 	sra	b
   60A9 CB 19         [ 8] 4465 	rr	c
   60AB CB 28         [ 8] 4466 	sra	b
   60AD CB 19         [ 8] 4467 	rr	c
   60AF CB 28         [ 8] 4468 	sra	b
   60B1 CB 19         [ 8] 4469 	rr	c
   60B3 CB 28         [ 8] 4470 	sra	b
   60B5 CB 19         [ 8] 4471 	rr	c
   60B7 69            [ 4] 4472 	ld	l, c
   60B8 60            [ 4] 4473 	ld	h, b
   60B9 29            [11] 4474 	add	hl, hl
   60BA 29            [11] 4475 	add	hl, hl
   60BB 09            [11] 4476 	add	hl, bc
   60BC 29            [11] 4477 	add	hl, hl
   60BD 29            [11] 4478 	add	hl, hl
   60BE 11 02 6D      [10] 4479 	ld	de,#_scene
   60C1 19            [11] 4480 	add	hl,de
   60C2 DD 5E FC      [19] 4481 	ld	e,-4 (ix)
   60C5 16 00         [ 7] 4482 	ld	d,#0x00
   60C7 19            [11] 4483 	add	hl,de
   60C8 7E            [ 7] 4484 	ld	a,(hl)
   60C9 3D            [ 4] 4485 	dec	a
   60CA CA 5B 61      [10] 4486 	jp	Z,00137$
                           4487 ;src/main.c:269: enemy.y+=1;
   60CD 21 10 6E      [10] 4488 	ld	hl,#(_enemy + 0x0001)
   60D0 DD 7E F4      [19] 4489 	ld	a,-12 (ix)
   60D3 77            [ 7] 4490 	ld	(hl),a
   60D4 C3 5B 61      [10] 4491 	jp	00137$
   60D7                    4492 00132$:
                           4493 ;src/main.c:273: if(auxY < enemy.y){
   60D7 DD 7E F6      [19] 4494 	ld	a,-10 (ix)
   60DA B7            [ 4] 4495 	or	a, a
   60DB 28 40         [12] 4496 	jr	Z,00129$
                           4497 ;src/main.c:274: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   60DD DD 4E F0      [19] 4498 	ld	c,-16 (ix)
   60E0 DD 46 F1      [19] 4499 	ld	b,-15 (ix)
   60E3 DD 7E E9      [19] 4500 	ld	a,-23 (ix)
   60E6 B7            [ 4] 4501 	or	a, a
   60E7 28 06         [12] 4502 	jr	Z,00145$
   60E9 DD 4E EE      [19] 4503 	ld	c,-18 (ix)
   60EC DD 46 EF      [19] 4504 	ld	b,-17 (ix)
   60EF                    4505 00145$:
   60EF CB 28         [ 8] 4506 	sra	b
   60F1 CB 19         [ 8] 4507 	rr	c
   60F3 CB 28         [ 8] 4508 	sra	b
   60F5 CB 19         [ 8] 4509 	rr	c
   60F7 CB 28         [ 8] 4510 	sra	b
   60F9 CB 19         [ 8] 4511 	rr	c
   60FB CB 28         [ 8] 4512 	sra	b
   60FD CB 19         [ 8] 4513 	rr	c
   60FF 69            [ 4] 4514 	ld	l, c
   6100 60            [ 4] 4515 	ld	h, b
   6101 29            [11] 4516 	add	hl, hl
   6102 29            [11] 4517 	add	hl, hl
   6103 09            [11] 4518 	add	hl, bc
   6104 29            [11] 4519 	add	hl, hl
   6105 29            [11] 4520 	add	hl, hl
   6106 11 02 6D      [10] 4521 	ld	de,#_scene
   6109 19            [11] 4522 	add	hl,de
   610A DD 5E FC      [19] 4523 	ld	e,-4 (ix)
   610D 16 00         [ 7] 4524 	ld	d,#0x00
   610F 19            [11] 4525 	add	hl,de
   6110 7E            [ 7] 4526 	ld	a,(hl)
   6111 3D            [ 4] 4527 	dec	a
   6112 28 47         [12] 4528 	jr	Z,00137$
                           4529 ;src/main.c:275: enemy.y-=1;
   6114 21 10 6E      [10] 4530 	ld	hl,#(_enemy + 0x0001)
   6117 DD 7E F5      [19] 4531 	ld	a,-11 (ix)
   611A 77            [ 7] 4532 	ld	(hl),a
   611B 18 3E         [12] 4533 	jr	00137$
   611D                    4534 00129$:
                           4535 ;src/main.c:277: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   611D DD 4E EC      [19] 4536 	ld	c,-20 (ix)
   6120 DD 46 ED      [19] 4537 	ld	b,-19 (ix)
   6123 DD 7E E8      [19] 4538 	ld	a,-24 (ix)
   6126 B7            [ 4] 4539 	or	a, a
   6127 28 06         [12] 4540 	jr	Z,00146$
   6129 DD 4E EA      [19] 4541 	ld	c,-22 (ix)
   612C DD 46 EB      [19] 4542 	ld	b,-21 (ix)
   612F                    4543 00146$:
   612F CB 28         [ 8] 4544 	sra	b
   6131 CB 19         [ 8] 4545 	rr	c
   6133 CB 28         [ 8] 4546 	sra	b
   6135 CB 19         [ 8] 4547 	rr	c
   6137 CB 28         [ 8] 4548 	sra	b
   6139 CB 19         [ 8] 4549 	rr	c
   613B CB 28         [ 8] 4550 	sra	b
   613D CB 19         [ 8] 4551 	rr	c
   613F 69            [ 4] 4552 	ld	l, c
   6140 60            [ 4] 4553 	ld	h, b
   6141 29            [11] 4554 	add	hl, hl
   6142 29            [11] 4555 	add	hl, hl
   6143 09            [11] 4556 	add	hl, bc
   6144 29            [11] 4557 	add	hl, hl
   6145 29            [11] 4558 	add	hl, hl
   6146 11 02 6D      [10] 4559 	ld	de,#_scene
   6149 19            [11] 4560 	add	hl,de
   614A DD 5E FC      [19] 4561 	ld	e,-4 (ix)
   614D 16 00         [ 7] 4562 	ld	d,#0x00
   614F 19            [11] 4563 	add	hl,de
   6150 7E            [ 7] 4564 	ld	a,(hl)
   6151 3D            [ 4] 4565 	dec	a
   6152 28 07         [12] 4566 	jr	Z,00137$
                           4567 ;src/main.c:278: enemy.y+=1;
   6154 21 10 6E      [10] 4568 	ld	hl,#(_enemy + 0x0001)
   6157 DD 7E F4      [19] 4569 	ld	a,-12 (ix)
   615A 77            [ 7] 4570 	ld	(hl),a
   615B                    4571 00137$:
   615B DD F9         [10] 4572 	ld	sp, ix
   615D DD E1         [14] 4573 	pop	ix
   615F C9            [10] 4574 	ret
                           4575 ;src/main.c:283: void patrol(){
                           4576 ;	---------------------------------
                           4577 ; Function patrol
                           4578 ; ---------------------------------
   6160                    4579 _patrol::
   6160 DD E5         [15] 4580 	push	ix
   6162 DD 21 00 00   [14] 4581 	ld	ix,#0
   6166 DD 39         [15] 4582 	add	ix,sp
   6168 21 F4 FF      [10] 4583 	ld	hl,#-12
   616B 39            [11] 4584 	add	hl,sp
   616C F9            [ 6] 4585 	ld	sp,hl
                           4586 ;src/main.c:286: movement(enemy.dir);
   616D 3A 18 6E      [13] 4587 	ld	a, (#(_enemy + 0x0009) + 0)
   6170 F5            [11] 4588 	push	af
   6171 33            [ 6] 4589 	inc	sp
   6172 CD EA 4F      [17] 4590 	call	_movement
   6175 33            [ 6] 4591 	inc	sp
                           4592 ;src/main.c:288: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   6176 3A 10 6E      [13] 4593 	ld	a,(#_enemy + 1)
   6179 DD 77 F6      [19] 4594 	ld	-10 (ix), a
   617C 07            [ 4] 4595 	rlca
   617D 07            [ 4] 4596 	rlca
   617E 07            [ 4] 4597 	rlca
   617F 07            [ 4] 4598 	rlca
   6180 E6 0F         [ 7] 4599 	and	a,#0x0F
   6182 4F            [ 4] 4600 	ld	c,a
   6183 06 00         [ 7] 4601 	ld	b,#0x00
   6185 69            [ 4] 4602 	ld	l, c
   6186 60            [ 4] 4603 	ld	h, b
   6187 29            [11] 4604 	add	hl, hl
   6188 29            [11] 4605 	add	hl, hl
   6189 09            [11] 4606 	add	hl, bc
   618A 29            [11] 4607 	add	hl, hl
   618B 29            [11] 4608 	add	hl, hl
   618C 3E 02         [ 7] 4609 	ld	a,#<(_scene)
   618E 85            [ 4] 4610 	add	a, l
   618F DD 77 F4      [19] 4611 	ld	-12 (ix),a
   6192 3E 6D         [ 7] 4612 	ld	a,#>(_scene)
   6194 8C            [ 4] 4613 	adc	a, h
   6195 DD 77 F5      [19] 4614 	ld	-11 (ix),a
   6198 3A 0F 6E      [13] 4615 	ld	a,(#_enemy + 0)
   619B DD 77 FC      [19] 4616 	ld	-4 (ix), a
   619E 0F            [ 4] 4617 	rrca
   619F 0F            [ 4] 4618 	rrca
   61A0 E6 3F         [ 7] 4619 	and	a,#0x3F
   61A2 DD 77 F9      [19] 4620 	ld	-7 (ix),a
   61A5 DD 7E F4      [19] 4621 	ld	a,-12 (ix)
   61A8 DD 86 F9      [19] 4622 	add	a, -7 (ix)
   61AB 5F            [ 4] 4623 	ld	e,a
   61AC DD 7E F5      [19] 4624 	ld	a,-11 (ix)
   61AF CE 00         [ 7] 4625 	adc	a, #0x00
   61B1 57            [ 4] 4626 	ld	d,a
   61B2 3A 1A 6E      [13] 4627 	ld	a,(#_enemy + 11)
   61B5 DD 77 FD      [19] 4628 	ld	-3 (ix),a
   61B8 1A            [ 7] 4629 	ld	a,(de)
   61B9 57            [ 4] 4630 	ld	d,a
   61BA DD 7E FD      [19] 4631 	ld	a,-3 (ix)
   61BD 92            [ 4] 4632 	sub	a, d
   61BE C2 BA 62      [10] 4633 	jp	NZ,00106$
                           4634 ;src/main.c:289: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   61C1 DD 5E FC      [19] 4635 	ld	e,-4 (ix)
   61C4 16 00         [ 7] 4636 	ld	d,#0x00
   61C6 21 03 00      [10] 4637 	ld	hl,#0x0003
   61C9 19            [11] 4638 	add	hl,de
   61CA DD 75 F7      [19] 4639 	ld	-9 (ix),l
   61CD DD 74 F8      [19] 4640 	ld	-8 (ix),h
   61D0 DD 7E F7      [19] 4641 	ld	a,-9 (ix)
   61D3 DD 77 FE      [19] 4642 	ld	-2 (ix),a
   61D6 DD 7E F8      [19] 4643 	ld	a,-8 (ix)
   61D9 DD 77 FF      [19] 4644 	ld	-1 (ix),a
   61DC DD 7E F8      [19] 4645 	ld	a,-8 (ix)
   61DF 07            [ 4] 4646 	rlca
   61E0 E6 01         [ 7] 4647 	and	a,#0x01
   61E2 DD 77 FC      [19] 4648 	ld	-4 (ix),a
   61E5 21 06 00      [10] 4649 	ld	hl,#0x0006
   61E8 19            [11] 4650 	add	hl,de
   61E9 DD 75 FA      [19] 4651 	ld	-6 (ix),l
   61EC DD 74 FB      [19] 4652 	ld	-5 (ix),h
   61EF DD 7E FC      [19] 4653 	ld	a,-4 (ix)
   61F2 B7            [ 4] 4654 	or	a, a
   61F3 28 0C         [12] 4655 	jr	Z,00113$
   61F5 DD 7E FA      [19] 4656 	ld	a,-6 (ix)
   61F8 DD 77 FE      [19] 4657 	ld	-2 (ix),a
   61FB DD 7E FB      [19] 4658 	ld	a,-5 (ix)
   61FE DD 77 FF      [19] 4659 	ld	-1 (ix),a
   6201                    4660 00113$:
   6201 DD 6E FE      [19] 4661 	ld	l,-2 (ix)
   6204 DD 66 FF      [19] 4662 	ld	h,-1 (ix)
   6207 CB 2C         [ 8] 4663 	sra	h
   6209 CB 1D         [ 8] 4664 	rr	l
   620B CB 2C         [ 8] 4665 	sra	h
   620D CB 1D         [ 8] 4666 	rr	l
   620F D1            [10] 4667 	pop	de
   6210 D5            [11] 4668 	push	de
   6211 19            [11] 4669 	add	hl,de
   6212 DD 7E FD      [19] 4670 	ld	a,-3 (ix)
   6215 96            [ 7] 4671 	sub	a,(hl)
   6216 C2 BA 62      [10] 4672 	jp	NZ,00106$
                           4673 ;src/main.c:290: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   6219 DD 5E F6      [19] 4674 	ld	e,-10 (ix)
   621C 16 00         [ 7] 4675 	ld	d,#0x00
   621E 21 0E 00      [10] 4676 	ld	hl,#0x000E
   6221 19            [11] 4677 	add	hl,de
   6222 4D            [ 4] 4678 	ld	c,l
   6223 44            [ 4] 4679 	ld	b,h
   6224 69            [ 4] 4680 	ld	l, c
   6225 78            [ 4] 4681 	ld	a,b
   6226 67            [ 4] 4682 	ld	h,a
   6227 07            [ 4] 4683 	rlca
   6228 E6 01         [ 7] 4684 	and	a,#0x01
   622A DD 77 FE      [19] 4685 	ld	-2 (ix),a
   622D 7B            [ 4] 4686 	ld	a,e
   622E C6 1D         [ 7] 4687 	add	a, #0x1D
   6230 DD 77 F4      [19] 4688 	ld	-12 (ix),a
   6233 7A            [ 4] 4689 	ld	a,d
   6234 CE 00         [ 7] 4690 	adc	a, #0x00
   6236 DD 77 F5      [19] 4691 	ld	-11 (ix),a
   6239 DD 7E FE      [19] 4692 	ld	a,-2 (ix)
   623C B7            [ 4] 4693 	or	a, a
   623D 28 02         [12] 4694 	jr	Z,00114$
   623F E1            [10] 4695 	pop	hl
   6240 E5            [11] 4696 	push	hl
   6241                    4697 00114$:
   6241 CB 2C         [ 8] 4698 	sra	h
   6243 CB 1D         [ 8] 4699 	rr	l
   6245 CB 2C         [ 8] 4700 	sra	h
   6247 CB 1D         [ 8] 4701 	rr	l
   6249 CB 2C         [ 8] 4702 	sra	h
   624B CB 1D         [ 8] 4703 	rr	l
   624D CB 2C         [ 8] 4704 	sra	h
   624F CB 1D         [ 8] 4705 	rr	l
   6251 5D            [ 4] 4706 	ld	e, l
   6252 54            [ 4] 4707 	ld	d, h
   6253 29            [11] 4708 	add	hl, hl
   6254 29            [11] 4709 	add	hl, hl
   6255 19            [11] 4710 	add	hl, de
   6256 29            [11] 4711 	add	hl, hl
   6257 29            [11] 4712 	add	hl, hl
   6258 11 02 6D      [10] 4713 	ld	de,#_scene
   625B 19            [11] 4714 	add	hl,de
   625C DD 5E F9      [19] 4715 	ld	e,-7 (ix)
   625F 16 00         [ 7] 4716 	ld	d,#0x00
   6261 19            [11] 4717 	add	hl,de
   6262 DD 7E FD      [19] 4718 	ld	a,-3 (ix)
   6265 96            [ 7] 4719 	sub	a,(hl)
   6266 20 52         [12] 4720 	jr	NZ,00106$
                           4721 ;src/main.c:291: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   6268 DD 7E FE      [19] 4722 	ld	a,-2 (ix)
   626B B7            [ 4] 4723 	or	a, a
   626C 28 02         [12] 4724 	jr	Z,00115$
   626E C1            [10] 4725 	pop	bc
   626F C5            [11] 4726 	push	bc
   6270                    4727 00115$:
   6270 CB 28         [ 8] 4728 	sra	b
   6272 CB 19         [ 8] 4729 	rr	c
   6274 CB 28         [ 8] 4730 	sra	b
   6276 CB 19         [ 8] 4731 	rr	c
   6278 CB 28         [ 8] 4732 	sra	b
   627A CB 19         [ 8] 4733 	rr	c
   627C CB 28         [ 8] 4734 	sra	b
   627E CB 19         [ 8] 4735 	rr	c
   6280 69            [ 4] 4736 	ld	l, c
   6281 60            [ 4] 4737 	ld	h, b
   6282 29            [11] 4738 	add	hl, hl
   6283 29            [11] 4739 	add	hl, hl
   6284 09            [11] 4740 	add	hl, bc
   6285 29            [11] 4741 	add	hl, hl
   6286 29            [11] 4742 	add	hl, hl
   6287 3E 02         [ 7] 4743 	ld	a,#<(_scene)
   6289 85            [ 4] 4744 	add	a, l
   628A DD 77 FE      [19] 4745 	ld	-2 (ix),a
   628D 3E 6D         [ 7] 4746 	ld	a,#>(_scene)
   628F 8C            [ 4] 4747 	adc	a, h
   6290 DD 77 FF      [19] 4748 	ld	-1 (ix),a
   6293 DD 5E F7      [19] 4749 	ld	e,-9 (ix)
   6296 DD 56 F8      [19] 4750 	ld	d,-8 (ix)
   6299 DD 7E FC      [19] 4751 	ld	a,-4 (ix)
   629C B7            [ 4] 4752 	or	a, a
   629D 28 06         [12] 4753 	jr	Z,00116$
   629F DD 5E FA      [19] 4754 	ld	e,-6 (ix)
   62A2 DD 56 FB      [19] 4755 	ld	d,-5 (ix)
   62A5                    4756 00116$:
   62A5 CB 2A         [ 8] 4757 	sra	d
   62A7 CB 1B         [ 8] 4758 	rr	e
   62A9 CB 2A         [ 8] 4759 	sra	d
   62AB CB 1B         [ 8] 4760 	rr	e
   62AD DD 6E FE      [19] 4761 	ld	l,-2 (ix)
   62B0 DD 66 FF      [19] 4762 	ld	h,-1 (ix)
   62B3 19            [11] 4763 	add	hl,de
   62B4 DD 7E FD      [19] 4764 	ld	a,-3 (ix)
   62B7 96            [ 7] 4765 	sub	a,(hl)
   62B8 28 3B         [12] 4766 	jr	Z,00111$
   62BA                    4767 00106$:
                           4768 ;src/main.c:293: switch(enemy.dir){
   62BA 3A 18 6E      [13] 4769 	ld	a,(#(_enemy + 0x0009) + 0)
   62BD FE 02         [ 7] 4770 	cp	a,#0x02
   62BF 28 22         [12] 4771 	jr	Z,00103$
   62C1 FE 04         [ 7] 4772 	cp	a,#0x04
   62C3 28 0A         [12] 4773 	jr	Z,00101$
   62C5 FE 06         [ 7] 4774 	cp	a,#0x06
   62C7 28 10         [12] 4775 	jr	Z,00102$
   62C9 D6 08         [ 7] 4776 	sub	a, #0x08
   62CB 28 20         [12] 4777 	jr	Z,00104$
   62CD 18 26         [12] 4778 	jr	00111$
                           4779 ;src/main.c:294: case 4:
   62CF                    4780 00101$:
                           4781 ;src/main.c:295: movement(6);
   62CF 3E 06         [ 7] 4782 	ld	a,#0x06
   62D1 F5            [11] 4783 	push	af
   62D2 33            [ 6] 4784 	inc	sp
   62D3 CD EA 4F      [17] 4785 	call	_movement
   62D6 33            [ 6] 4786 	inc	sp
                           4787 ;src/main.c:296: break;
   62D7 18 1C         [12] 4788 	jr	00111$
                           4789 ;src/main.c:297: case 6:
   62D9                    4790 00102$:
                           4791 ;src/main.c:298: movement(4);
   62D9 3E 04         [ 7] 4792 	ld	a,#0x04
   62DB F5            [11] 4793 	push	af
   62DC 33            [ 6] 4794 	inc	sp
   62DD CD EA 4F      [17] 4795 	call	_movement
   62E0 33            [ 6] 4796 	inc	sp
                           4797 ;src/main.c:299: break;
   62E1 18 12         [12] 4798 	jr	00111$
                           4799 ;src/main.c:300: case 2:
   62E3                    4800 00103$:
                           4801 ;src/main.c:301: movement(8);
   62E3 3E 08         [ 7] 4802 	ld	a,#0x08
   62E5 F5            [11] 4803 	push	af
   62E6 33            [ 6] 4804 	inc	sp
   62E7 CD EA 4F      [17] 4805 	call	_movement
   62EA 33            [ 6] 4806 	inc	sp
                           4807 ;src/main.c:302: break;
   62EB 18 08         [12] 4808 	jr	00111$
                           4809 ;src/main.c:303: case 8:
   62ED                    4810 00104$:
                           4811 ;src/main.c:304: movement(2);
   62ED 3E 02         [ 7] 4812 	ld	a,#0x02
   62EF F5            [11] 4813 	push	af
   62F0 33            [ 6] 4814 	inc	sp
   62F1 CD EA 4F      [17] 4815 	call	_movement
   62F4 33            [ 6] 4816 	inc	sp
                           4817 ;src/main.c:306: }
   62F5                    4818 00111$:
   62F5 DD F9         [10] 4819 	ld	sp, ix
   62F7 DD E1         [14] 4820 	pop	ix
   62F9 C9            [10] 4821 	ret
                           4822 ;src/main.c:311: u8 vissionSensor(){
                           4823 ;	---------------------------------
                           4824 ; Function vissionSensor
                           4825 ; ---------------------------------
   62FA                    4826 _vissionSensor::
   62FA DD E5         [15] 4827 	push	ix
   62FC DD 21 00 00   [14] 4828 	ld	ix,#0
   6300 DD 39         [15] 4829 	add	ix,sp
   6302 21 F9 FF      [10] 4830 	ld	hl,#-7
   6305 39            [11] 4831 	add	hl,sp
   6306 F9            [ 6] 4832 	ld	sp,hl
                           4833 ;src/main.c:312: u8 following = 0;
   6307 DD 36 FC 00   [19] 4834 	ld	-4 (ix),#0x00
                           4835 ;src/main.c:313: u8 cx = enemy.x/tilewidth;
   630B 3A 0F 6E      [13] 4836 	ld	a, (#_enemy + 0)
   630E 0F            [ 4] 4837 	rrca
   630F 0F            [ 4] 4838 	rrca
   6310 E6 3F         [ 7] 4839 	and	a,#0x3F
   6312 DD 77 FB      [19] 4840 	ld	-5 (ix),a
                           4841 ;src/main.c:314: u8 cy = enemy.y/tilewidth;
   6315 3A 10 6E      [13] 4842 	ld	a, (#(_enemy + 0x0001) + 0)
   6318 0F            [ 4] 4843 	rrca
   6319 0F            [ 4] 4844 	rrca
   631A E6 3F         [ 7] 4845 	and	a,#0x3F
   631C 4F            [ 4] 4846 	ld	c,a
                           4847 ;src/main.c:315: u8 pcx = player.x/tilewidth;
   631D 3A 04 6E      [13] 4848 	ld	a, (#_player + 0)
   6320 0F            [ 4] 4849 	rrca
   6321 0F            [ 4] 4850 	rrca
   6322 E6 3F         [ 7] 4851 	and	a,#0x3F
   6324 DD 77 FE      [19] 4852 	ld	-2 (ix),a
                           4853 ;src/main.c:316: u8 pcy = player.y/tilewidth;
   6327 3A 05 6E      [13] 4854 	ld	a, (#(_player + 0x0001) + 0)
   632A 0F            [ 4] 4855 	rrca
   632B 0F            [ 4] 4856 	rrca
   632C E6 3F         [ 7] 4857 	and	a,#0x3F
   632E DD 77 FF      [19] 4858 	ld	-1 (ix),a
                           4859 ;src/main.c:319: for(i=0;i<3;i++){
   6331 1E 00         [ 7] 4860 	ld	e,#0x00
   6333                    4861 00107$:
                           4862 ;src/main.c:320: lex = cx - i;
   6333 DD 7E FB      [19] 4863 	ld	a,-5 (ix)
   6336 93            [ 4] 4864 	sub	a, e
   6337 DD 77 FA      [19] 4865 	ld	-6 (ix),a
                           4866 ;src/main.c:321: ley = cy - i;
   633A 79            [ 4] 4867 	ld	a,c
   633B 93            [ 4] 4868 	sub	a, e
   633C DD 77 FD      [19] 4869 	ld	-3 (ix),a
                           4870 ;src/main.c:322: mex = cx + i;
   633F DD 7E FB      [19] 4871 	ld	a,-5 (ix)
   6342 83            [ 4] 4872 	add	a, e
   6343 DD 77 F9      [19] 4873 	ld	-7 (ix),a
                           4874 ;src/main.c:323: mey = cy + i;
   6346 79            [ 4] 4875 	ld	a,c
   6347 83            [ 4] 4876 	add	a, e
   6348 57            [ 4] 4877 	ld	d,a
                           4878 ;src/main.c:324: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
   6349 DD 7E FA      [19] 4879 	ld	a,-6 (ix)
   634C DD 96 FE      [19] 4880 	sub	a, -2 (ix)
   634F 28 16         [12] 4881 	jr	Z,00101$
   6351 DD 7E FD      [19] 4882 	ld	a,-3 (ix)
   6354 DD 96 FF      [19] 4883 	sub	a, -1 (ix)
   6357 28 0E         [12] 4884 	jr	Z,00101$
   6359 DD 7E F9      [19] 4885 	ld	a,-7 (ix)
   635C DD 96 FE      [19] 4886 	sub	a, -2 (ix)
   635F 28 06         [12] 4887 	jr	Z,00101$
   6361 DD 7E FF      [19] 4888 	ld	a,-1 (ix)
   6364 92            [ 4] 4889 	sub	a, d
   6365 20 04         [12] 4890 	jr	NZ,00108$
   6367                    4891 00101$:
                           4892 ;src/main.c:325: following = 1;
   6367 DD 36 FC 01   [19] 4893 	ld	-4 (ix),#0x01
   636B                    4894 00108$:
                           4895 ;src/main.c:319: for(i=0;i<3;i++){
   636B 1C            [ 4] 4896 	inc	e
   636C 7B            [ 4] 4897 	ld	a,e
   636D D6 03         [ 7] 4898 	sub	a, #0x03
   636F 38 C2         [12] 4899 	jr	C,00107$
                           4900 ;src/main.c:329: return following;
   6371 DD 6E FC      [19] 4901 	ld	l,-4 (ix)
   6374 DD F9         [10] 4902 	ld	sp, ix
   6376 DD E1         [14] 4903 	pop	ix
   6378 C9            [10] 4904 	ret
                           4905 ;src/main.c:334: void move(){
                           4906 ;	---------------------------------
                           4907 ; Function move
                           4908 ; ---------------------------------
   6379                    4909 _move::
                           4910 ;src/main.c:336: if(temp > 10){
   6379 3E 0A         [ 7] 4911 	ld	a,#0x0A
   637B FD 21 F2 6D   [14] 4912 	ld	iy,#_temp
   637F FD 96 00      [19] 4913 	sub	a, 0 (iy)
   6382 D2 06 64      [10] 4914 	jp	NC,00116$
                           4915 ;src/main.c:337: enemy.dir = chooseDirection();
   6385 CD 7B 4F      [17] 4916 	call	_chooseDirection
   6388 7D            [ 4] 4917 	ld	a,l
   6389 21 18 6E      [10] 4918 	ld	hl,#(_enemy + 0x0009)
   638C 77            [ 7] 4919 	ld	(hl),a
                           4920 ;src/main.c:338: following = detectPlayerRoom(player.x,player.y);
   638D 3A 05 6E      [13] 4921 	ld	a, (#_player + 1)
   6390 21 04 6E      [10] 4922 	ld	hl, #_player + 0
   6393 56            [ 7] 4923 	ld	d,(hl)
   6394 F5            [11] 4924 	push	af
   6395 33            [ 6] 4925 	inc	sp
   6396 D5            [11] 4926 	push	de
   6397 33            [ 6] 4927 	inc	sp
   6398 CD 4E 4F      [17] 4928 	call	_detectPlayerRoom
   639B F1            [10] 4929 	pop	af
   639C FD 21 F7 6D   [14] 4930 	ld	iy,#_following
   63A0 FD 75 00      [19] 4931 	ld	0 (iy),l
                           4932 ;src/main.c:339: memptr = cpct_getScreenPtr(VMEM,20,20);
   63A3 21 14 14      [10] 4933 	ld	hl,#0x1414
   63A6 E5            [11] 4934 	push	hl
   63A7 21 00 C0      [10] 4935 	ld	hl,#0xC000
   63AA E5            [11] 4936 	push	hl
   63AB CD 0C 6C      [17] 4937 	call	_cpct_getScreenPtr
                           4938 ;src/main.c:340: cpct_drawSolidBox(memptr, following, 2, 8);
   63AE EB            [ 4] 4939 	ex	de,hl
   63AF 21 02 08      [10] 4940 	ld	hl,#0x0802
   63B2 E5            [11] 4941 	push	hl
   63B3 3A F7 6D      [13] 4942 	ld	a,(_following)
   63B6 F5            [11] 4943 	push	af
   63B7 33            [ 6] 4944 	inc	sp
   63B8 D5            [11] 4945 	push	de
   63B9 CD 3B 6B      [17] 4946 	call	_cpct_drawSolidBox
   63BC F1            [10] 4947 	pop	af
                           4948 ;src/main.c:341: memptr = cpct_getScreenPtr(VMEM,24,20);
   63BD 33            [ 6] 4949 	inc	sp
   63BE 21 18 14      [10] 4950 	ld	hl,#0x1418
   63C1 E3            [19] 4951 	ex	(sp),hl
   63C2 21 00 C0      [10] 4952 	ld	hl,#0xC000
   63C5 E5            [11] 4953 	push	hl
   63C6 CD 0C 6C      [17] 4954 	call	_cpct_getScreenPtr
   63C9 EB            [ 4] 4955 	ex	de,hl
                           4956 ;src/main.c:342: cpct_drawSolidBox(memptr, enemy.room, 2, 8);
   63CA 21 1A 6E      [10] 4957 	ld	hl, #(_enemy + 0x000b) + 0
   63CD 46            [ 7] 4958 	ld	b,(hl)
   63CE 21 02 08      [10] 4959 	ld	hl,#0x0802
   63D1 E5            [11] 4960 	push	hl
   63D2 C5            [11] 4961 	push	bc
   63D3 33            [ 6] 4962 	inc	sp
   63D4 D5            [11] 4963 	push	de
   63D5 CD 3B 6B      [17] 4964 	call	_cpct_drawSolidBox
   63D8 F1            [10] 4965 	pop	af
   63D9 F1            [10] 4966 	pop	af
   63DA 33            [ 6] 4967 	inc	sp
                           4968 ;src/main.c:343: if(following == enemy.room || enemy.pursue != 0){
   63DB 21 1A 6E      [10] 4969 	ld	hl, #(_enemy + 0x000b) + 0
   63DE 56            [ 7] 4970 	ld	d,(hl)
   63DF 01 1D 6E      [10] 4971 	ld	bc,#_enemy + 14
   63E2 0A            [ 7] 4972 	ld	a,(bc)
   63E3 5F            [ 4] 4973 	ld	e,a
   63E4 3A F7 6D      [13] 4974 	ld	a,(#_following + 0)
   63E7 92            [ 4] 4975 	sub	a, d
   63E8 28 04         [12] 4976 	jr	Z,00106$
   63EA 7B            [ 4] 4977 	ld	a,e
   63EB B7            [ 4] 4978 	or	a, a
   63EC 28 11         [12] 4979 	jr	Z,00107$
   63EE                    4980 00106$:
                           4981 ;src/main.c:344: if(enemy.pursue == 0)
   63EE 7B            [ 4] 4982 	ld	a,e
   63EF B7            [ 4] 4983 	or	a, a
   63F0 20 05         [12] 4984 	jr	NZ,00104$
                           4985 ;src/main.c:345: enemy.pursue = 3;
   63F2 3E 03         [ 7] 4986 	ld	a,#0x03
   63F4 02            [ 7] 4987 	ld	(bc),a
   63F5 18 08         [12] 4988 	jr	00107$
   63F7                    4989 00104$:
                           4990 ;src/main.c:346: else if(enemy.pursue > 1)
   63F7 3E 01         [ 7] 4991 	ld	a,#0x01
   63F9 93            [ 4] 4992 	sub	a, e
   63FA 30 03         [12] 4993 	jr	NC,00107$
                           4994 ;src/main.c:347: enemy.pursue -=1;
   63FC 1D            [ 4] 4995 	dec	e
   63FD 7B            [ 4] 4996 	ld	a,e
   63FE 02            [ 7] 4997 	ld	(bc),a
   63FF                    4998 00107$:
                           4999 ;src/main.c:349: temp = 0;
   63FF 21 F2 6D      [10] 5000 	ld	hl,#_temp + 0
   6402 36 00         [10] 5001 	ld	(hl), #0x00
   6404 18 2C         [12] 5002 	jr	00117$
   6406                    5003 00116$:
                           5004 ;src/main.c:351: if(enemy.pursue >= 1){
   6406 3A 1D 6E      [13] 5005 	ld	a,(#(_enemy + 0x000e) + 0)
   6409 D6 01         [ 7] 5006 	sub	a, #0x01
   640B 38 22         [12] 5007 	jr	C,00113$
                           5008 ;src/main.c:352: followPlayer();
   640D CD 48 5E      [17] 5009 	call	_followPlayer
                           5010 ;src/main.c:353: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   6410 21 1B 6E      [10] 5011 	ld	hl, #_enemy + 12
   6413 56            [ 7] 5012 	ld	d,(hl)
   6414 21 0F 6E      [10] 5013 	ld	hl, #_enemy + 0
   6417 5E            [ 7] 5014 	ld	e,(hl)
   6418 7A            [ 4] 5015 	ld	a,d
   6419 93            [ 4] 5016 	sub	a, e
   641A 20 16         [12] 5017 	jr	NZ,00117$
   641C 21 1C 6E      [10] 5018 	ld	hl, #_enemy + 13
   641F 56            [ 7] 5019 	ld	d,(hl)
   6420 21 10 6E      [10] 5020 	ld	hl, #_enemy + 1
   6423 5E            [ 7] 5021 	ld	e,(hl)
   6424 7A            [ 4] 5022 	ld	a,d
   6425 93            [ 4] 5023 	sub	a, e
   6426 20 0A         [12] 5024 	jr	NZ,00117$
                           5025 ;src/main.c:354: enemy.pursue = 0;
   6428 21 1D 6E      [10] 5026 	ld	hl,#(_enemy + 0x000e)
   642B 36 00         [10] 5027 	ld	(hl),#0x00
   642D 18 03         [12] 5028 	jr	00117$
   642F                    5029 00113$:
                           5030 ;src/main.c:356: patrol();
   642F CD 60 61      [17] 5031 	call	_patrol
   6432                    5032 00117$:
                           5033 ;src/main.c:359: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   6432 21 12 6E      [10] 5034 	ld	hl, #_enemy + 3
   6435 56            [ 7] 5035 	ld	d,(hl)
   6436 3A 11 6E      [13] 5036 	ld	a, (#_enemy + 2)
   6439 D5            [11] 5037 	push	de
   643A 33            [ 6] 5038 	inc	sp
   643B F5            [11] 5039 	push	af
   643C 33            [ 6] 5040 	inc	sp
   643D CD 4E 4F      [17] 5041 	call	_detectPlayerRoom
   6440 F1            [10] 5042 	pop	af
   6441 55            [ 4] 5043 	ld	d,l
   6442 3A 05 6E      [13] 5044 	ld	a, (#(_player + 0x0001) + 0)
   6445 21 04 6E      [10] 5045 	ld	hl, #_player + 0
   6448 46            [ 7] 5046 	ld	b,(hl)
   6449 D5            [11] 5047 	push	de
   644A F5            [11] 5048 	push	af
   644B 33            [ 6] 5049 	inc	sp
   644C C5            [11] 5050 	push	bc
   644D 33            [ 6] 5051 	inc	sp
   644E CD 4E 4F      [17] 5052 	call	_detectPlayerRoom
   6451 F1            [10] 5053 	pop	af
   6452 45            [ 4] 5054 	ld	b,l
   6453 D1            [10] 5055 	pop	de
   6454 7A            [ 4] 5056 	ld	a,d
   6455 90            [ 4] 5057 	sub	a, b
   6456 28 09         [12] 5058 	jr	Z,00118$
   6458 21 1D 6E      [10] 5059 	ld	hl, #_enemy + 14
   645B 66            [ 7] 5060 	ld	h,(hl)
   645C 3E 01         [ 7] 5061 	ld	a,#0x01
   645E 94            [ 4] 5062 	sub	a, h
   645F 30 0E         [12] 5063 	jr	NC,00119$
   6461                    5064 00118$:
                           5065 ;src/main.c:360: enemy.seenX = player.x;
   6461 11 1B 6E      [10] 5066 	ld	de,#_enemy + 12
   6464 3A 04 6E      [13] 5067 	ld	a, (#_player + 0)
   6467 12            [ 7] 5068 	ld	(de),a
                           5069 ;src/main.c:361: enemy.seenY = player.y;
   6468 11 1C 6E      [10] 5070 	ld	de,#_enemy + 13
   646B 3A 05 6E      [13] 5071 	ld	a, (#(_player + 0x0001) + 0)
   646E 12            [ 7] 5072 	ld	(de),a
   646F                    5073 00119$:
                           5074 ;src/main.c:363: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   646F 3A 10 6E      [13] 5075 	ld	a, (#_enemy + 1)
   6472 21 0F 6E      [10] 5076 	ld	hl, #_enemy + 0
   6475 56            [ 7] 5077 	ld	d,(hl)
   6476 F5            [11] 5078 	push	af
   6477 33            [ 6] 5079 	inc	sp
   6478 D5            [11] 5080 	push	de
   6479 33            [ 6] 5081 	inc	sp
   647A CD 4E 4F      [17] 5082 	call	_detectPlayerRoom
   647D F1            [10] 5083 	pop	af
   647E 7D            [ 4] 5084 	ld	a,l
   647F 32 1A 6E      [13] 5085 	ld	(#(_enemy + 0x000b)),a
                           5086 ;src/main.c:364: temp += 1;
   6482 21 F2 6D      [10] 5087 	ld	hl, #_temp+0
   6485 34            [11] 5088 	inc	(hl)
   6486 C9            [10] 5089 	ret
                           5090 ;src/main.c:369: void game(){
                           5091 ;	---------------------------------
                           5092 ; Function game
                           5093 ; ---------------------------------
   6487                    5094 _game::
   6487 DD E5         [15] 5095 	push	ix
   6489 DD 21 00 00   [14] 5096 	ld	ix,#0
   648D DD 39         [15] 5097 	add	ix,sp
   648F 21 F4 FF      [10] 5098 	ld	hl,#-12
   6492 39            [11] 5099 	add	hl,sp
   6493 F9            [ 6] 5100 	ld	sp,hl
                           5101 ;src/main.c:370: TNivel n = {0,0,0};
   6494 21 01 00      [10] 5102 	ld	hl,#0x0001
   6497 39            [11] 5103 	add	hl,sp
   6498 36 00         [10] 5104 	ld	(hl),#0x00
   649A 21 01 00      [10] 5105 	ld	hl,#0x0001
   649D 39            [11] 5106 	add	hl,sp
   649E 5D            [ 4] 5107 	ld	e, l
   649F 54            [ 4] 5108 	ld	d, h
   64A0 23            [ 6] 5109 	inc	hl
   64A1 DD 75 F8      [19] 5110 	ld	-8 (ix),l
   64A4 DD 74 F9      [19] 5111 	ld	-7 (ix),h
   64A7 DD 6E F8      [19] 5112 	ld	l,-8 (ix)
   64AA DD 66 F9      [19] 5113 	ld	h,-7 (ix)
   64AD 36 00         [10] 5114 	ld	(hl),#0x00
   64AF 13            [ 6] 5115 	inc	de
   64B0 13            [ 6] 5116 	inc	de
   64B1 DD 73 FA      [19] 5117 	ld	-6 (ix),e
   64B4 DD 72 FB      [19] 5118 	ld	-5 (ix),d
   64B7 DD 6E FA      [19] 5119 	ld	l,-6 (ix)
   64BA DD 66 FB      [19] 5120 	ld	h,-5 (ix)
   64BD 36 00         [10] 5121 	ld	(hl),#0x00
                           5122 ;src/main.c:371: u8 fps = 0;
   64BF DD 36 F4 00   [19] 5123 	ld	-12 (ix),#0x00
                           5124 ;src/main.c:372: bound =0;
   64C3 21 F8 6D      [10] 5125 	ld	hl,#_bound + 0
   64C6 36 00         [10] 5126 	ld	(hl), #0x00
                           5127 ;src/main.c:373: temp = 0;
   64C8 21 F2 6D      [10] 5128 	ld	hl,#_temp + 0
   64CB 36 00         [10] 5129 	ld	(hl), #0x00
                           5130 ;src/main.c:374: map = 1;
   64CD 21 F3 6D      [10] 5131 	ld	hl,#_map + 0
   64D0 36 01         [10] 5132 	ld	(hl), #0x01
                           5133 ;src/main.c:375: arrow =0;
   64D2 21 F6 6D      [10] 5134 	ld	hl,#_arrow + 0
   64D5 36 00         [10] 5135 	ld	(hl), #0x00
                           5136 ;src/main.c:376: finish =0;
   64D7 21 F5 6D      [10] 5137 	ld	hl,#_finish + 0
   64DA 36 00         [10] 5138 	ld	(hl), #0x00
                           5139 ;src/main.c:377: following =0;
   64DC 21 F7 6D      [10] 5140 	ld	hl,#_following + 0
   64DF 36 00         [10] 5141 	ld	(hl), #0x00
                           5142 ;src/main.c:378: archer = 0;
   64E1 21 F9 6D      [10] 5143 	ld	hl,#_archer + 0
   64E4 36 00         [10] 5144 	ld	(hl), #0x00
                           5145 ;src/main.c:380: initPlayer();
   64E6 CD 02 54      [17] 5146 	call	_initPlayer
                           5147 ;src/main.c:381: initEnemies();
   64E9 CD 38 54      [17] 5148 	call	_initEnemies
                           5149 ;src/main.c:383: cpct_clearScreen(0);
   64EC 21 00 40      [10] 5150 	ld	hl,#0x4000
   64EF E5            [11] 5151 	push	hl
   64F0 AF            [ 4] 5152 	xor	a, a
   64F1 F5            [11] 5153 	push	af
   64F2 33            [ 6] 5154 	inc	sp
   64F3 26 C0         [ 7] 5155 	ld	h, #0xC0
   64F5 E5            [11] 5156 	push	hl
   64F6 CD 19 6B      [17] 5157 	call	_cpct_memset
                           5158 ;src/main.c:384: drawMap(map);
   64F9 3A F3 6D      [13] 5159 	ld	a,(_map)
   64FC F5            [11] 5160 	push	af
   64FD 33            [ 6] 5161 	inc	sp
   64FE CD C0 46      [17] 5162 	call	_drawMap
   6501 33            [ 6] 5163 	inc	sp
                           5164 ;src/main.c:390: while (1){
   6502 DD 7E FA      [19] 5165 	ld	a,-6 (ix)
   6505 DD 77 FE      [19] 5166 	ld	-2 (ix),a
   6508 DD 7E FB      [19] 5167 	ld	a,-5 (ix)
   650B DD 77 FF      [19] 5168 	ld	-1 (ix),a
   650E DD 7E F8      [19] 5169 	ld	a,-8 (ix)
   6511 DD 77 FC      [19] 5170 	ld	-4 (ix),a
   6514 DD 7E F9      [19] 5171 	ld	a,-7 (ix)
   6517 DD 77 FD      [19] 5172 	ld	-3 (ix),a
   651A                    5173 00126$:
                           5174 ;src/main.c:393: cpct_waitVSYNC();
   651A CD FF 6A      [17] 5175 	call	_cpct_waitVSYNC
                           5176 ;src/main.c:396: erases();
   651D CD 5B 4D      [17] 5177 	call	_erases
                           5178 ;src/main.c:399: if(fps == 4)
   6520 DD 7E F4      [19] 5179 	ld	a,-12 (ix)
   6523 D6 04         [ 7] 5180 	sub	a, #0x04
   6525 20 04         [12] 5181 	jr	NZ,00182$
   6527 3E 01         [ 7] 5182 	ld	a,#0x01
   6529 18 01         [12] 5183 	jr	00183$
   652B                    5184 00182$:
   652B AF            [ 4] 5185 	xor	a,a
   652C                    5186 00183$:
   652C 5F            [ 4] 5187 	ld	e,a
   652D B7            [ 4] 5188 	or	a, a
   652E 28 18         [12] 5189 	jr	Z,00102$
                           5190 ;src/main.c:400: drawPickUps(n.corazon,n.bullet);
   6530 DD 6E FA      [19] 5191 	ld	l,-6 (ix)
   6533 DD 66 FB      [19] 5192 	ld	h,-5 (ix)
   6536 7E            [ 7] 5193 	ld	a,(hl)
   6537 DD 6E F8      [19] 5194 	ld	l,-8 (ix)
   653A DD 66 F9      [19] 5195 	ld	h,-7 (ix)
   653D 56            [ 7] 5196 	ld	d,(hl)
   653E D5            [11] 5197 	push	de
   653F F5            [11] 5198 	push	af
   6540 33            [ 6] 5199 	inc	sp
   6541 D5            [11] 5200 	push	de
   6542 33            [ 6] 5201 	inc	sp
   6543 CD E6 4E      [17] 5202 	call	_drawPickUps
   6546 F1            [10] 5203 	pop	af
   6547 D1            [10] 5204 	pop	de
   6548                    5205 00102$:
                           5206 ;src/main.c:403: draws();
   6548 D5            [11] 5207 	push	de
   6549 CD AE 4C      [17] 5208 	call	_draws
   654C D1            [10] 5209 	pop	de
                           5210 ;src/main.c:406: if(fps == 4){
   654D 7B            [ 4] 5211 	ld	a,e
   654E B7            [ 4] 5212 	or	a, a
   654F 28 33         [12] 5213 	jr	Z,00110$
                           5214 ;src/main.c:407: if(player.atk < 20) drawFatiga(player.atk,2);
   6551 21 0C 6E      [10] 5215 	ld	hl, #(_player + 0x0008) + 0
   6554 56            [ 7] 5216 	ld	d,(hl)
   6555 7A            [ 4] 5217 	ld	a,d
   6556 D6 14         [ 7] 5218 	sub	a, #0x14
   6558 30 0C         [12] 5219 	jr	NC,00107$
   655A 3E 02         [ 7] 5220 	ld	a,#0x02
   655C F5            [11] 5221 	push	af
   655D 33            [ 6] 5222 	inc	sp
   655E D5            [11] 5223 	push	de
   655F 33            [ 6] 5224 	inc	sp
   6560 CD C0 4D      [17] 5225 	call	_drawFatiga
   6563 F1            [10] 5226 	pop	af
   6564 18 1A         [12] 5227 	jr	00108$
   6566                    5228 00107$:
                           5229 ;src/main.c:408: else if(player.atk > 20) drawFatiga(player.atk,1);
   6566 3E 14         [ 7] 5230 	ld	a,#0x14
   6568 92            [ 4] 5231 	sub	a, d
   6569 30 0C         [12] 5232 	jr	NC,00104$
   656B 3E 01         [ 7] 5233 	ld	a,#0x01
   656D F5            [11] 5234 	push	af
   656E 33            [ 6] 5235 	inc	sp
   656F D5            [11] 5236 	push	de
   6570 33            [ 6] 5237 	inc	sp
   6571 CD C0 4D      [17] 5238 	call	_drawFatiga
   6574 F1            [10] 5239 	pop	af
   6575 18 09         [12] 5240 	jr	00108$
   6577                    5241 00104$:
                           5242 ;src/main.c:409: else drawFatiga(player.atk,0);
   6577 AF            [ 4] 5243 	xor	a, a
   6578 F5            [11] 5244 	push	af
   6579 33            [ 6] 5245 	inc	sp
   657A D5            [11] 5246 	push	de
   657B 33            [ 6] 5247 	inc	sp
   657C CD C0 4D      [17] 5248 	call	_drawFatiga
   657F F1            [10] 5249 	pop	af
   6580                    5250 00108$:
                           5251 ;src/main.c:410: fps = 0;
   6580 DD 36 F4 00   [19] 5252 	ld	-12 (ix),#0x00
   6584                    5253 00110$:
                           5254 ;src/main.c:415: player.lx = player.x;
   6584 3A 04 6E      [13] 5255 	ld	a, (#_player + 0)
   6587 21 06 6E      [10] 5256 	ld	hl,#(_player + 0x0002)
   658A 77            [ 7] 5257 	ld	(hl),a
                           5258 ;src/main.c:416: player.ly = player.y;
   658B 3A 05 6E      [13] 5259 	ld	a, (#(_player + 0x0001) + 0)
   658E 32 07 6E      [13] 5260 	ld	(#(_player + 0x0003)),a
                           5261 ;src/main.c:417: if(enemy.life > 0){
   6591 21 17 6E      [10] 5262 	ld	hl, #(_enemy + 0x0008) + 0
   6594 6E            [ 7] 5263 	ld	l,(hl)
                           5264 ;src/main.c:419: enemy.ly = enemy.y;
                           5265 ;src/main.c:417: if(enemy.life > 0){
   6595 7D            [ 4] 5266 	ld	a,l
   6596 B7            [ 4] 5267 	or	a, a
   6597 28 67         [12] 5268 	jr	Z,00117$
                           5269 ;src/main.c:418: enemy.lx = enemy.x;
   6599 3A 0F 6E      [13] 5270 	ld	a, (#_enemy + 0)
   659C 32 11 6E      [13] 5271 	ld	(#(_enemy + 0x0002)),a
                           5272 ;src/main.c:419: enemy.ly = enemy.y;
   659F 11 12 6E      [10] 5273 	ld	de,#_enemy + 3
   65A2 3A 10 6E      [13] 5274 	ld	a, (#(_enemy + 0x0001) + 0)
   65A5 12            [ 7] 5275 	ld	(de),a
                           5276 ;src/main.c:420: move();
   65A6 CD 79 63      [17] 5277 	call	_move
                           5278 ;src/main.c:422: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   65A9 21 0C 6E      [10] 5279 	ld	hl, #(_player + 0x0008) + 0
   65AC 56            [ 7] 5280 	ld	d,(hl)
   65AD 3A 10 6E      [13] 5281 	ld	a, (#(_enemy + 0x0001) + 0)
   65B0 21 0F 6E      [10] 5282 	ld	hl, #_enemy + 0
   65B3 5E            [ 7] 5283 	ld	e,(hl)
   65B4 21 05 6E      [10] 5284 	ld	hl, #(_player + 0x0001) + 0
   65B7 46            [ 7] 5285 	ld	b,(hl)
   65B8 21 04 6E      [10] 5286 	ld	hl, #_player + 0
   65BB 4E            [ 7] 5287 	ld	c,(hl)
   65BC D5            [11] 5288 	push	de
   65BD 33            [ 6] 5289 	inc	sp
   65BE 57            [ 4] 5290 	ld	d,a
   65BF D5            [11] 5291 	push	de
   65C0 C5            [11] 5292 	push	bc
   65C1 CD 2A 50      [17] 5293 	call	_checkCollisions
   65C4 F1            [10] 5294 	pop	af
   65C5 F1            [10] 5295 	pop	af
   65C6 33            [ 6] 5296 	inc	sp
   65C7 7D            [ 4] 5297 	ld	a,l
   65C8 3D            [ 4] 5298 	dec	a
   65C9 28 07         [12] 5299 	jr	Z,00111$
   65CB 7D            [ 4] 5300 	ld	a,l
   65CC D6 02         [ 7] 5301 	sub	a, #0x02
   65CE 28 19         [12] 5302 	jr	Z,00112$
   65D0 18 2E         [12] 5303 	jr	00117$
                           5304 ;src/main.c:423: case 1:
   65D2                    5305 00111$:
                           5306 ;src/main.c:424: enemy.x = enemy.ox;
   65D2 3A 13 6E      [13] 5307 	ld	a, (#_enemy + 4)
   65D5 32 0F 6E      [13] 5308 	ld	(#_enemy),a
                           5309 ;src/main.c:425: enemy.y = enemy.oy;
   65D8 3A 14 6E      [13] 5310 	ld	a, (#_enemy + 5)
   65DB 32 10 6E      [13] 5311 	ld	(#(_enemy + 0x0001)),a
                           5312 ;src/main.c:426: enemy.life -= 1;
   65DE 3A 17 6E      [13] 5313 	ld	a, (#(_enemy + 0x0008) + 0)
   65E1 C6 FF         [ 7] 5314 	add	a,#0xFF
   65E3 21 17 6E      [10] 5315 	ld	hl,#(_enemy + 0x0008)
   65E6 77            [ 7] 5316 	ld	(hl),a
                           5317 ;src/main.c:427: break;
   65E7 18 17         [12] 5318 	jr	00117$
                           5319 ;src/main.c:428: case 2:
   65E9                    5320 00112$:
                           5321 ;src/main.c:429: player.x = 0;
   65E9 21 04 6E      [10] 5322 	ld	hl,#_player
   65EC 36 00         [10] 5323 	ld	(hl),#0x00
                           5324 ;src/main.c:430: player.y = 80;
   65EE 21 05 6E      [10] 5325 	ld	hl,#(_player + 0x0001)
   65F1 36 50         [10] 5326 	ld	(hl),#0x50
                           5327 ;src/main.c:431: player.life -= 1;
   65F3 21 0A 6E      [10] 5328 	ld	hl,#_player + 6
   65F6 7E            [ 7] 5329 	ld	a,(hl)
   65F7 C6 FF         [ 7] 5330 	add	a,#0xFF
   65F9 77            [ 7] 5331 	ld	(hl),a
                           5332 ;src/main.c:432: if(player.life == 0){
   65FA B7            [ 4] 5333 	or	a, a
   65FB 20 03         [12] 5334 	jr	NZ,00117$
                           5335 ;src/main.c:433: gameOver();
   65FD CD 71 54      [17] 5336 	call	_gameOver
                           5337 ;src/main.c:436: }
   6600                    5338 00117$:
                           5339 ;src/main.c:438: player.latk = player.atk;
   6600 11 0D 6E      [10] 5340 	ld	de,#_player + 9
   6603 3A 0C 6E      [13] 5341 	ld	a, (#(_player + 0x0008) + 0)
   6606 12            [ 7] 5342 	ld	(de),a
                           5343 ;src/main.c:443: cpct_scanKeyboard_f();
   6607 CD 4A 68      [17] 5344 	call	_cpct_scanKeyboard_f
                           5345 ;src/main.c:444: player.sprite = checkKeyboard();
   660A CD 31 51      [17] 5346 	call	_checkKeyboard
   660D 5D            [ 4] 5347 	ld	e,l
   660E 54            [ 4] 5348 	ld	d,h
   660F ED 53 08 6E   [20] 5349 	ld	((_player + 0x0004)), de
                           5350 ;src/main.c:445: checkBoundsCollisions(&n.corazon,&n.bullet);
   6613 DD 6E FE      [19] 5351 	ld	l,-2 (ix)
   6616 DD 66 FF      [19] 5352 	ld	h,-1 (ix)
   6619 DD 5E FC      [19] 5353 	ld	e,-4 (ix)
   661C DD 56 FD      [19] 5354 	ld	d,-3 (ix)
   661F E5            [11] 5355 	push	hl
   6620 D5            [11] 5356 	push	de
   6621 CD 14 59      [17] 5357 	call	_checkBoundsCollisions
   6624 F1            [10] 5358 	pop	af
   6625 F1            [10] 5359 	pop	af
                           5360 ;src/main.c:447: if(arrow == 1){
   6626 3A F6 6D      [13] 5361 	ld	a,(#_arrow + 0)
   6629 3D            [ 4] 5362 	dec	a
   662A 20 47         [12] 5363 	jr	NZ,00122$
                           5364 ;src/main.c:448: moveObject();
   662C CD A8 53      [17] 5365 	call	_moveObject
                           5366 ;src/main.c:449: bound = checkArrowCollisions();
   662F CD E5 5C      [17] 5367 	call	_checkArrowCollisions
   6632 FD 21 F8 6D   [14] 5368 	ld	iy,#_bound
   6636 FD 75 00      [19] 5369 	ld	0 (iy),l
                           5370 ;src/main.c:450: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, 21) == 1){
   6639 3A 17 6E      [13] 5371 	ld	a, (#(_enemy + 0x0008) + 0)
   663C B7            [ 4] 5372 	or	a, a
   663D 28 34         [12] 5373 	jr	Z,00122$
   663F 21 10 6E      [10] 5374 	ld	hl, #(_enemy + 0x0001) + 0
   6642 4E            [ 7] 5375 	ld	c,(hl)
   6643 21 0F 6E      [10] 5376 	ld	hl, #_enemy + 0
   6646 46            [ 7] 5377 	ld	b,(hl)
   6647 21 FB 6D      [10] 5378 	ld	hl, #_object + 1
   664A 5E            [ 7] 5379 	ld	e,(hl)
   664B 21 FA 6D      [10] 5380 	ld	hl, #_object + 0
   664E 56            [ 7] 5381 	ld	d,(hl)
   664F 3E 15         [ 7] 5382 	ld	a,#0x15
   6651 F5            [11] 5383 	push	af
   6652 33            [ 6] 5384 	inc	sp
   6653 79            [ 4] 5385 	ld	a,c
   6654 F5            [11] 5386 	push	af
   6655 33            [ 6] 5387 	inc	sp
   6656 C5            [11] 5388 	push	bc
   6657 33            [ 6] 5389 	inc	sp
   6658 7B            [ 4] 5390 	ld	a,e
   6659 F5            [11] 5391 	push	af
   665A 33            [ 6] 5392 	inc	sp
   665B D5            [11] 5393 	push	de
   665C 33            [ 6] 5394 	inc	sp
   665D CD 2A 50      [17] 5395 	call	_checkCollisions
   6660 F1            [10] 5396 	pop	af
   6661 F1            [10] 5397 	pop	af
   6662 33            [ 6] 5398 	inc	sp
   6663 2D            [ 4] 5399 	dec	l
   6664 20 0D         [12] 5400 	jr	NZ,00122$
                           5401 ;src/main.c:451: enemy.life -= 1;
   6666 3A 17 6E      [13] 5402 	ld	a, (#(_enemy + 0x0008) + 0)
   6669 C6 FF         [ 7] 5403 	add	a,#0xFF
   666B 32 17 6E      [13] 5404 	ld	(#(_enemy + 0x0008)),a
                           5405 ;src/main.c:452: object.vivo = 0;
   666E 21 00 6E      [10] 5406 	ld	hl,#_object + 6
   6671 36 00         [10] 5407 	ld	(hl),#0x00
   6673                    5408 00122$:
                           5409 ;src/main.c:456: fps++;
   6673 DD 34 F4      [23] 5410 	inc	-12 (ix)
                           5411 ;src/main.c:457: if(finish == 1) return;
   6676 3A F5 6D      [13] 5412 	ld	a,(#_finish + 0)
   6679 3D            [ 4] 5413 	dec	a
   667A C2 1A 65      [10] 5414 	jp	NZ,00126$
   667D DD F9         [10] 5415 	ld	sp, ix
   667F DD E1         [14] 5416 	pop	ix
   6681 C9            [10] 5417 	ret
                           5418 ;src/main.c:464: void credits(){
                           5419 ;	---------------------------------
                           5420 ; Function credits
                           5421 ; ---------------------------------
   6682                    5422 _credits::
                           5423 ;src/main.c:466: cpct_clearScreen(0);
   6682 21 00 40      [10] 5424 	ld	hl,#0x4000
   6685 E5            [11] 5425 	push	hl
   6686 AF            [ 4] 5426 	xor	a, a
   6687 F5            [11] 5427 	push	af
   6688 33            [ 6] 5428 	inc	sp
   6689 26 C0         [ 7] 5429 	ld	h, #0xC0
   668B E5            [11] 5430 	push	hl
   668C CD 19 6B      [17] 5431 	call	_cpct_memset
                           5432 ;src/main.c:467: memptr = cpct_getScreenPtr(VMEM,10,10);
   668F 21 0A 0A      [10] 5433 	ld	hl,#0x0A0A
   6692 E5            [11] 5434 	push	hl
   6693 21 00 C0      [10] 5435 	ld	hl,#0xC000
   6696 E5            [11] 5436 	push	hl
   6697 CD 0C 6C      [17] 5437 	call	_cpct_getScreenPtr
                           5438 ;src/main.c:468: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   669A EB            [ 4] 5439 	ex	de,hl
   669B 01 E4 66      [10] 5440 	ld	bc,#___str_5
   669E D5            [11] 5441 	push	de
   669F 21 01 00      [10] 5442 	ld	hl,#0x0001
   66A2 E5            [11] 5443 	push	hl
   66A3 D5            [11] 5444 	push	de
   66A4 C5            [11] 5445 	push	bc
   66A5 CD 2B 69      [17] 5446 	call	_cpct_drawStringM0
   66A8 21 06 00      [10] 5447 	ld	hl,#6
   66AB 39            [11] 5448 	add	hl,sp
   66AC F9            [ 6] 5449 	ld	sp,hl
   66AD D1            [10] 5450 	pop	de
                           5451 ;src/main.c:470: while (1){
   66AE                    5452 00104$:
                           5453 ;src/main.c:472: cpct_scanKeyboard_f();
   66AE D5            [11] 5454 	push	de
   66AF CD 4A 68      [17] 5455 	call	_cpct_scanKeyboard_f
   66B2 D1            [10] 5456 	pop	de
                           5457 ;src/main.c:473: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   66B3 01 F5 66      [10] 5458 	ld	bc,#___str_6
   66B6 D5            [11] 5459 	push	de
   66B7 21 01 00      [10] 5460 	ld	hl,#0x0001
   66BA E5            [11] 5461 	push	hl
   66BB D5            [11] 5462 	push	de
   66BC C5            [11] 5463 	push	bc
   66BD CD 2B 69      [17] 5464 	call	_cpct_drawStringM0
   66C0 21 06 00      [10] 5465 	ld	hl,#6
   66C3 39            [11] 5466 	add	hl,sp
   66C4 F9            [ 6] 5467 	ld	sp,hl
   66C5 D1            [10] 5468 	pop	de
                           5469 ;src/main.c:474: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   66C6 01 0B 67      [10] 5470 	ld	bc,#___str_7
   66C9 D5            [11] 5471 	push	de
   66CA 21 01 00      [10] 5472 	ld	hl,#0x0001
   66CD E5            [11] 5473 	push	hl
   66CE D5            [11] 5474 	push	de
   66CF C5            [11] 5475 	push	bc
   66D0 CD 2B 69      [17] 5476 	call	_cpct_drawStringM0
   66D3 21 06 00      [10] 5477 	ld	hl,#6
   66D6 39            [11] 5478 	add	hl,sp
   66D7 F9            [ 6] 5479 	ld	sp,hl
   66D8 21 08 04      [10] 5480 	ld	hl,#0x0408
   66DB CD 3E 68      [17] 5481 	call	_cpct_isKeyPressed
   66DE 7D            [ 4] 5482 	ld	a,l
   66DF D1            [10] 5483 	pop	de
   66E0 B7            [ 4] 5484 	or	a, a
   66E1 28 CB         [12] 5485 	jr	Z,00104$
                           5486 ;src/main.c:478: return;
   66E3 C9            [10] 5487 	ret
   66E4                    5488 ___str_5:
   66E4 4C 6F 75 6E 67 65  5489 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   66F4 00                 5490 	.db 0x00
   66F5                    5491 ___str_6:
   66F5 4A 6F 73 65 70 20  5492 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   670A 00                 5493 	.db 0x00
   670B                    5494 ___str_7:
   670B 41 6C 62 65 72 74  5495 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   6724 00                 5496 	.db 0x00
                           5497 ;src/main.c:488: void main(void) {
                           5498 ;	---------------------------------
                           5499 ; Function main
                           5500 ; ---------------------------------
   6725                    5501 _main::
                           5502 ;src/main.c:492: init();
   6725 CD DD 53      [17] 5503 	call	_init
                           5504 ;src/main.c:495: while(1){
   6728                    5505 00106$:
                           5506 ;src/main.c:496: x=menu();
   6728 CD AE 54      [17] 5507 	call	_menu
   672B 5D            [ 4] 5508 	ld	e, l
   672C 54            [ 4] 5509 	ld	d, h
                           5510 ;src/main.c:497: switch(x){
   672D CB 7A         [ 8] 5511 	bit	7, d
   672F 20 F7         [12] 5512 	jr	NZ,00106$
   6731 3E 02         [ 7] 5513 	ld	a,#0x02
   6733 BB            [ 4] 5514 	cp	a, e
   6734 3E 00         [ 7] 5515 	ld	a,#0x00
   6736 9A            [ 4] 5516 	sbc	a, d
   6737 E2 3C 67      [10] 5517 	jp	PO, 00122$
   673A EE 80         [ 7] 5518 	xor	a, #0x80
   673C                    5519 00122$:
   673C FA 28 67      [10] 5520 	jp	M,00106$
   673F 16 00         [ 7] 5521 	ld	d,#0x00
   6741 21 47 67      [10] 5522 	ld	hl,#00123$
   6744 19            [11] 5523 	add	hl,de
   6745 19            [11] 5524 	add	hl,de
                           5525 ;src/main.c:498: case 0: return;break;
                           5526 ;src/main.c:499: case 1: game(); break;
   6746 E9            [ 4] 5527 	jp	(hl)
   6747                    5528 00123$:
   6747 18 10         [12] 5529 	jr	00108$
   6749 18 04         [12] 5530 	jr	00102$
   674B 18 07         [12] 5531 	jr	00103$
   674D 18 0A         [12] 5532 	jr	00108$
   674F                    5533 00102$:
   674F CD 87 64      [17] 5534 	call	_game
   6752 18 D4         [12] 5535 	jr	00106$
                           5536 ;src/main.c:500: case 2: credits();break;
   6754                    5537 00103$:
   6754 CD 82 66      [17] 5538 	call	_credits
                           5539 ;src/main.c:501: }
   6757 18 CF         [12] 5540 	jr	00106$
   6759                    5541 00108$:
   6759 C9            [10] 5542 	ret
                           5543 	.area _CODE
                           5544 	.area _INITIALIZER
                           5545 	.area _CABS (ABS)
