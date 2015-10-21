                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Wed Oct 21 18:51:29 2015
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
   6CC8                      82 _scene::
   6CC8                      83 	.ds 240
   6DB8                      84 _temp::
   6DB8                      85 	.ds 1
   6DB9                      86 _map::
   6DB9                      87 	.ds 1
   6DBA                      88 _path::
   6DBA                      89 	.ds 1
   6DBB                      90 _finish::
   6DBB                      91 	.ds 1
   6DBC                      92 _arrow::
   6DBC                      93 	.ds 1
   6DBD                      94 _following::
   6DBD                      95 	.ds 1
   6DBE                      96 _bound::
   6DBE                      97 	.ds 1
   6DBF                      98 _archer::
   6DBF                      99 	.ds 1
   6DC0                     100 _object::
   6DC0                     101 	.ds 10
   6DCA                     102 _player::
   6DCA                     103 	.ds 11
   6DD5                     104 _enemy::
   6DD5                     105 	.ds 15
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
   46E0 3E C8         [ 7]  152 	ld	a,#<(_scene)
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
   478D 3E C8         [ 7]  230 	ld	a,#<(_scene)
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
   4834 21 C8 6C      [10]  304 	ld	hl,#_scene
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
   485D CD 13 6C      [17]  330 	call	_cpct_getScreenPtr
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
   4892 21 20 67      [10]  363 	ld	hl,#_muro
   4895 E5            [11]  364 	push	hl
   4896 CD 15 69      [17]  365 	call	_cpct_drawSprite
   4899 D1            [10]  366 	pop	de
   489A C1            [10]  367 	pop	bc
   489B                     368 00110$:
                            369 ;src/draws.h:40: if(scene[posY][posX] == 9){
   489B 3E C8         [ 7]  370 	ld	a,#<(_scene)
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
   48C7 CD 42 6B      [17]  396 	call	_cpct_drawSolidBox
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
   4B0F CD 13 6C      [17]  953 	call	_cpct_getScreenPtr
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
   4B29 CD BC 6A      [17]  971 	call	_cpct_drawSpriteMasked
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
   4B39 CD 42 6B      [17]  984 	call	_cpct_drawSolidBox
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
   4B4B CD BC 6A      [17]  997 	call	_cpct_drawSpriteMasked
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
   4B76 CD 13 6C      [17] 1032 	call	_cpct_getScreenPtr
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
   4B8C 21 60 67      [10] 1047 	ld	hl,#_flecha_arriba
   4B8F E5            [11] 1048 	push	hl
   4B90 CD BC 6A      [17] 1049 	call	_cpct_drawSpriteMasked
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
   4B9F CD 42 6B      [17] 1061 	call	_cpct_drawSolidBox
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
   4BC6 CD 13 6C      [17] 1093 	call	_cpct_getScreenPtr
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
   4BFC CD BC 6A      [17] 1129 	call	_cpct_drawSpriteMasked
                           1130 ;src/draws.h:87: break;
   4BFF C9            [10] 1131 	ret
                           1132 ;src/draws.h:88: case 1:
   4C00                    1133 00102$:
                           1134 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4C00 21 02 08      [10] 1135 	ld	hl,#0x0802
   4C03 E5            [11] 1136 	push	hl
   4C04 D5            [11] 1137 	push	de
   4C05 C5            [11] 1138 	push	bc
   4C06 CD BC 6A      [17] 1139 	call	_cpct_drawSpriteMasked
                           1140 ;src/draws.h:90: break;
   4C09 C9            [10] 1141 	ret
                           1142 ;src/draws.h:91: case 2:
   4C0A                    1143 00103$:
                           1144 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4C0A 21 04 04      [10] 1145 	ld	hl,#0x0404
   4C0D E5            [11] 1146 	push	hl
   4C0E D5            [11] 1147 	push	de
   4C0F C5            [11] 1148 	push	bc
   4C10 CD BC 6A      [17] 1149 	call	_cpct_drawSpriteMasked
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
   4C26 CD 13 6C      [17] 1170 	call	_cpct_getScreenPtr
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
   4C50 CD 42 6B      [17] 1200 	call	_cpct_drawSolidBox
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
   4C5F CD 42 6B      [17] 1215 	call	_cpct_drawSolidBox
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
   4C6E CD 42 6B      [17] 1230 	call	_cpct_drawSolidBox
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
   4C75 21 D0 6D      [10] 1242 	ld	hl, #_player + 6
   4C78 56            [ 7] 1243 	ld	d,(hl)
   4C79 3E 01         [ 7] 1244 	ld	a,#0x01
   4C7B F5            [11] 1245 	push	af
   4C7C 33            [ 6] 1246 	inc	sp
   4C7D D5            [11] 1247 	push	de
   4C7E 33            [ 6] 1248 	inc	sp
   4C7F CD F7 4A      [17] 1249 	call	_drawVida
   4C82 F1            [10] 1250 	pop	af
                           1251 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C83 21 D4 6D      [10] 1252 	ld	hl, #_player + 10
   4C86 56            [ 7] 1253 	ld	d,(hl)
   4C87 3E 10         [ 7] 1254 	ld	a,#0x10
   4C89 F5            [11] 1255 	push	af
   4C8A 33            [ 6] 1256 	inc	sp
   4C8B D5            [11] 1257 	push	de
   4C8C 33            [ 6] 1258 	inc	sp
   4C8D CD 58 4B      [17] 1259 	call	_drawBullets
   4C90 F1            [10] 1260 	pop	af
                           1261 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C91 21 DF 6D      [10] 1262 	ld	hl, #_enemy + 10
   4C94 56            [ 7] 1263 	ld	d,(hl)
   4C95 3E 38         [ 7] 1264 	ld	a,#0x38
   4C97 F5            [11] 1265 	push	af
   4C98 33            [ 6] 1266 	inc	sp
   4C99 D5            [11] 1267 	push	de
   4C9A 33            [ 6] 1268 	inc	sp
   4C9B CD 58 4B      [17] 1269 	call	_drawBullets
   4C9E F1            [10] 1270 	pop	af
                           1271 ;src/draws.h:119: drawVida(enemy.life,65);
   4C9F 21 DD 6D      [10] 1272 	ld	hl, #_enemy + 8
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
                           1291 ;src/draws.h:126: if(temp%2 == 0)
   4CB7 FD 21 B8 6D   [14] 1292 	ld	iy,#_temp
   4CBB FD CB 00 46   [20] 1293 	bit	0, 0 (iy)
   4CBF 20 17         [12] 1294 	jr	NZ,00102$
                           1295 ;src/draws.h:127: draw(player.x,player.y,player.sprite,0);
   4CC1 ED 5B CE 6D   [20] 1296 	ld	de, (#_player + 4)
   4CC5 21 CB 6D      [10] 1297 	ld	hl, #_player + 1
   4CC8 46            [ 7] 1298 	ld	b,(hl)
   4CC9 21 CA 6D      [10] 1299 	ld	hl, #_player + 0
   4CCC 4E            [ 7] 1300 	ld	c,(hl)
   4CCD AF            [ 4] 1301 	xor	a, a
   4CCE F5            [11] 1302 	push	af
   4CCF 33            [ 6] 1303 	inc	sp
   4CD0 D5            [11] 1304 	push	de
   4CD1 C5            [11] 1305 	push	bc
   4CD2 CD B4 4B      [17] 1306 	call	_draw
   4CD5 F1            [10] 1307 	pop	af
   4CD6 F1            [10] 1308 	pop	af
   4CD7 33            [ 6] 1309 	inc	sp
   4CD8                    1310 00102$:
                           1311 ;src/draws.h:128: if(enemy.life > 0 && temp%2 == 1)
   4CD8 11 D5 6D      [10] 1312 	ld	de,#_enemy+0
   4CDB 3A DD 6D      [13] 1313 	ld	a, (#_enemy + 8)
   4CDE B7            [ 4] 1314 	or	a, a
   4CDF 28 23         [12] 1315 	jr	Z,00104$
   4CE1 3A B8 6D      [13] 1316 	ld	a,(#_temp + 0)
   4CE4 E6 01         [ 7] 1317 	and	a, #0x01
   4CE6 3D            [ 4] 1318 	dec	a
   4CE7 20 1B         [12] 1319 	jr	NZ,00104$
                           1320 ;src/draws.h:129: draw(enemy.x,enemy.y,enemy.sprite,0);
   4CE9 ED 4B DB 6D   [20] 1321 	ld	bc, (#_enemy + 6)
   4CED 6B            [ 4] 1322 	ld	l, e
   4CEE 62            [ 4] 1323 	ld	h, d
   4CEF 23            [ 6] 1324 	inc	hl
   4CF0 7E            [ 7] 1325 	ld	a,(hl)
   4CF1 DD 77 FF      [19] 1326 	ld	-1 (ix),a
   4CF4 1A            [ 7] 1327 	ld	a,(de)
   4CF5 5F            [ 4] 1328 	ld	e,a
   4CF6 AF            [ 4] 1329 	xor	a, a
   4CF7 F5            [11] 1330 	push	af
   4CF8 33            [ 6] 1331 	inc	sp
   4CF9 C5            [11] 1332 	push	bc
   4CFA DD 56 FF      [19] 1333 	ld	d, -1 (ix)
   4CFD D5            [11] 1334 	push	de
   4CFE CD B4 4B      [17] 1335 	call	_draw
   4D01 F1            [10] 1336 	pop	af
   4D02 F1            [10] 1337 	pop	af
   4D03 33            [ 6] 1338 	inc	sp
   4D04                    1339 00104$:
                           1340 ;src/draws.h:130: if(arrow == 1){
   4D04 3A BC 6D      [13] 1341 	ld	a,(#_arrow + 0)
   4D07 3D            [ 4] 1342 	dec	a
   4D08 20 5C         [12] 1343 	jr	NZ,00116$
                           1344 ;src/draws.h:131: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4D0A 21 C7 6D      [10] 1345 	ld	hl, #_object + 7
   4D0D 5E            [ 7] 1346 	ld	e,(hl)
                           1347 ;src/draws.h:132: draw(object.x,object.y,object.sprite,2);
   4D0E 01 C1 6D      [10] 1348 	ld	bc,#_object + 1
                           1349 ;src/draws.h:131: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4D11 7B            [ 4] 1350 	ld	a,e
   4D12 D6 04         [ 7] 1351 	sub	a, #0x04
   4D14 28 0C         [12] 1352 	jr	Z,00110$
   4D16 21 C6 6D      [10] 1353 	ld	hl,#_object + 6
   4D19 7B            [ 4] 1354 	ld	a,e
   4D1A D6 06         [ 7] 1355 	sub	a, #0x06
   4D1C 20 25         [12] 1356 	jr	NZ,00111$
   4D1E 7E            [ 7] 1357 	ld	a,(hl)
   4D1F 3D            [ 4] 1358 	dec	a
   4D20 20 21         [12] 1359 	jr	NZ,00111$
   4D22                    1360 00110$:
                           1361 ;src/draws.h:132: draw(object.x,object.y,object.sprite,2);
   4D22 ED 5B C4 6D   [20] 1362 	ld	de, (#(_object + 0x0004) + 0)
   4D26 0A            [ 7] 1363 	ld	a,(bc)
   4D27 DD 77 FF      [19] 1364 	ld	-1 (ix),a
   4D2A 21 C0 6D      [10] 1365 	ld	hl, #_object + 0
   4D2D 4E            [ 7] 1366 	ld	c,(hl)
   4D2E 3E 02         [ 7] 1367 	ld	a,#0x02
   4D30 F5            [11] 1368 	push	af
   4D31 33            [ 6] 1369 	inc	sp
   4D32 D5            [11] 1370 	push	de
   4D33 DD 7E FF      [19] 1371 	ld	a,-1 (ix)
   4D36 F5            [11] 1372 	push	af
   4D37 33            [ 6] 1373 	inc	sp
   4D38 79            [ 4] 1374 	ld	a,c
   4D39 F5            [11] 1375 	push	af
   4D3A 33            [ 6] 1376 	inc	sp
   4D3B CD B4 4B      [17] 1377 	call	_draw
   4D3E F1            [10] 1378 	pop	af
   4D3F F1            [10] 1379 	pop	af
   4D40 33            [ 6] 1380 	inc	sp
   4D41 18 23         [12] 1381 	jr	00116$
   4D43                    1382 00111$:
                           1383 ;src/draws.h:133: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4D43 7B            [ 4] 1384 	ld	a,e
   4D44 FE 02         [ 7] 1385 	cp	a,#0x02
   4D46 28 08         [12] 1386 	jr	Z,00106$
   4D48 D6 08         [ 7] 1387 	sub	a, #0x08
   4D4A 20 1A         [12] 1388 	jr	NZ,00116$
   4D4C 7E            [ 7] 1389 	ld	a,(hl)
   4D4D 3D            [ 4] 1390 	dec	a
   4D4E 20 16         [12] 1391 	jr	NZ,00116$
   4D50                    1392 00106$:
                           1393 ;src/draws.h:134: draw(object.x,object.y,object.sprite,1);
   4D50 ED 5B C4 6D   [20] 1394 	ld	de, (#(_object + 0x0004) + 0)
   4D54 0A            [ 7] 1395 	ld	a,(bc)
   4D55 47            [ 4] 1396 	ld	b,a
   4D56 21 C0 6D      [10] 1397 	ld	hl, #_object + 0
   4D59 4E            [ 7] 1398 	ld	c,(hl)
   4D5A 3E 01         [ 7] 1399 	ld	a,#0x01
   4D5C F5            [11] 1400 	push	af
   4D5D 33            [ 6] 1401 	inc	sp
   4D5E D5            [11] 1402 	push	de
   4D5F C5            [11] 1403 	push	bc
   4D60 CD B4 4B      [17] 1404 	call	_draw
   4D63 F1            [10] 1405 	pop	af
   4D64 F1            [10] 1406 	pop	af
   4D65 33            [ 6] 1407 	inc	sp
   4D66                    1408 00116$:
                           1409 ;src/draws.h:136: drawStats();
   4D66 CD 75 4C      [17] 1410 	call	_drawStats
   4D69 33            [ 6] 1411 	inc	sp
   4D6A DD E1         [14] 1412 	pop	ix
   4D6C C9            [10] 1413 	ret
                           1414 ;src/draws.h:139: void erases(){
                           1415 ;	---------------------------------
                           1416 ; Function erases
                           1417 ; ---------------------------------
   4D6D                    1418 _erases::
                           1419 ;src/draws.h:141: if(temp%2 == 0)
   4D6D FD 21 B8 6D   [14] 1420 	ld	iy,#_temp
   4D71 FD CB 00 46   [20] 1421 	bit	0, 0 (iy)
   4D75 20 14         [12] 1422 	jr	NZ,00102$
                           1423 ;src/draws.h:142: erase(player.lx,player.ly,0);
   4D77 21 CD 6D      [10] 1424 	ld	hl, #_player + 3
   4D7A 56            [ 7] 1425 	ld	d,(hl)
   4D7B 21 CC 6D      [10] 1426 	ld	hl, #_player + 2
   4D7E 46            [ 7] 1427 	ld	b,(hl)
   4D7F AF            [ 4] 1428 	xor	a, a
   4D80 F5            [11] 1429 	push	af
   4D81 33            [ 6] 1430 	inc	sp
   4D82 D5            [11] 1431 	push	de
   4D83 33            [ 6] 1432 	inc	sp
   4D84 C5            [11] 1433 	push	bc
   4D85 33            [ 6] 1434 	inc	sp
   4D86 CD 14 4C      [17] 1435 	call	_erase
   4D89 F1            [10] 1436 	pop	af
   4D8A 33            [ 6] 1437 	inc	sp
   4D8B                    1438 00102$:
                           1439 ;src/draws.h:143: if(temp%2 == 1)
   4D8B 3A B8 6D      [13] 1440 	ld	a,(#_temp + 0)
   4D8E E6 01         [ 7] 1441 	and	a, #0x01
   4D90 3D            [ 4] 1442 	dec	a
   4D91 20 14         [12] 1443 	jr	NZ,00104$
                           1444 ;src/draws.h:144: erase(enemy.lx,enemy.ly,0);
   4D93 21 D8 6D      [10] 1445 	ld	hl, #_enemy + 3
   4D96 56            [ 7] 1446 	ld	d,(hl)
   4D97 21 D7 6D      [10] 1447 	ld	hl, #_enemy + 2
   4D9A 46            [ 7] 1448 	ld	b,(hl)
   4D9B AF            [ 4] 1449 	xor	a, a
   4D9C F5            [11] 1450 	push	af
   4D9D 33            [ 6] 1451 	inc	sp
   4D9E D5            [11] 1452 	push	de
   4D9F 33            [ 6] 1453 	inc	sp
   4DA0 C5            [11] 1454 	push	bc
   4DA1 33            [ 6] 1455 	inc	sp
   4DA2 CD 14 4C      [17] 1456 	call	_erase
   4DA5 F1            [10] 1457 	pop	af
   4DA6 33            [ 6] 1458 	inc	sp
   4DA7                    1459 00104$:
                           1460 ;src/draws.h:145: if(arrow == 1){
   4DA7 3A BC 6D      [13] 1461 	ld	a,(#_arrow + 0)
   4DAA 3D            [ 4] 1462 	dec	a
   4DAB C0            [11] 1463 	ret	NZ
                           1464 ;src/draws.h:146: if(object.dir == 4 || object.dir == 6)
   4DAC 21 C7 6D      [10] 1465 	ld	hl, #_object + 7
   4DAF 5E            [ 7] 1466 	ld	e,(hl)
                           1467 ;src/draws.h:147: erase(object.lx,object.ly,2);
   4DB0 21 C3 6D      [10] 1468 	ld	hl, #_object + 3
   4DB3 56            [ 7] 1469 	ld	d,(hl)
   4DB4 21 C2 6D      [10] 1470 	ld	hl, #_object + 2
   4DB7 46            [ 7] 1471 	ld	b,(hl)
                           1472 ;src/draws.h:146: if(object.dir == 4 || object.dir == 6)
   4DB8 7B            [ 4] 1473 	ld	a,e
   4DB9 FE 04         [ 7] 1474 	cp	a,#0x04
   4DBB 28 04         [12] 1475 	jr	Z,00105$
   4DBD D6 06         [ 7] 1476 	sub	a, #0x06
   4DBF 20 0F         [12] 1477 	jr	NZ,00106$
   4DC1                    1478 00105$:
                           1479 ;src/draws.h:147: erase(object.lx,object.ly,2);
   4DC1 3E 02         [ 7] 1480 	ld	a,#0x02
   4DC3 F5            [11] 1481 	push	af
   4DC4 33            [ 6] 1482 	inc	sp
   4DC5 D5            [11] 1483 	push	de
   4DC6 33            [ 6] 1484 	inc	sp
   4DC7 C5            [11] 1485 	push	bc
   4DC8 33            [ 6] 1486 	inc	sp
   4DC9 CD 14 4C      [17] 1487 	call	_erase
   4DCC F1            [10] 1488 	pop	af
   4DCD 33            [ 6] 1489 	inc	sp
   4DCE 18 0D         [12] 1490 	jr	00107$
   4DD0                    1491 00106$:
                           1492 ;src/draws.h:149: erase(object.lx,object.ly,1);
   4DD0 3E 01         [ 7] 1493 	ld	a,#0x01
   4DD2 F5            [11] 1494 	push	af
   4DD3 33            [ 6] 1495 	inc	sp
   4DD4 D5            [11] 1496 	push	de
   4DD5 33            [ 6] 1497 	inc	sp
   4DD6 C5            [11] 1498 	push	bc
   4DD7 33            [ 6] 1499 	inc	sp
   4DD8 CD 14 4C      [17] 1500 	call	_erase
   4DDB F1            [10] 1501 	pop	af
   4DDC 33            [ 6] 1502 	inc	sp
   4DDD                    1503 00107$:
                           1504 ;src/draws.h:150: if(bound == 1) arrow = 0;
   4DDD 3A BE 6D      [13] 1505 	ld	a,(#_bound + 0)
   4DE0 3D            [ 4] 1506 	dec	a
   4DE1 C0            [11] 1507 	ret	NZ
   4DE2 21 BC 6D      [10] 1508 	ld	hl,#_arrow + 0
   4DE5 36 00         [10] 1509 	ld	(hl), #0x00
   4DE7 C9            [10] 1510 	ret
                           1511 ;src/draws.h:157: void drawFatiga(u8 atk, u8 col){
                           1512 ;	---------------------------------
                           1513 ; Function drawFatiga
                           1514 ; ---------------------------------
   4DE8                    1515 _drawFatiga::
   4DE8 DD E5         [15] 1516 	push	ix
   4DEA DD 21 00 00   [14] 1517 	ld	ix,#0
   4DEE DD 39         [15] 1518 	add	ix,sp
   4DF0 F5            [11] 1519 	push	af
                           1520 ;src/draws.h:159: if(atk < 20)
   4DF1 DD 7E 04      [19] 1521 	ld	a,4 (ix)
   4DF4 D6 14         [ 7] 1522 	sub	a, #0x14
   4DF6 30 04         [12] 1523 	jr	NC,00102$
                           1524 ;src/draws.h:160: col = 2;
   4DF8 DD 36 05 02   [19] 1525 	ld	5 (ix),#0x02
   4DFC                    1526 00102$:
                           1527 ;src/draws.h:161: if(atk > 30 || atk <= 20){
   4DFC 3E 14         [ 7] 1528 	ld	a,#0x14
   4DFE DD 96 04      [19] 1529 	sub	a, 4 (ix)
   4E01 3E 00         [ 7] 1530 	ld	a,#0x00
   4E03 17            [ 4] 1531 	rla
   4E04 DD 77 FF      [19] 1532 	ld	-1 (ix),a
                           1533 ;src/draws.h:163: switch(col){
   4E07 3E 02         [ 7] 1534 	ld	a,#0x02
   4E09 DD 96 05      [19] 1535 	sub	a, 5 (ix)
   4E0C 3E 00         [ 7] 1536 	ld	a,#0x00
   4E0E 17            [ 4] 1537 	rla
   4E0F DD 77 FE      [19] 1538 	ld	-2 (ix),a
                           1539 ;src/draws.h:161: if(atk > 30 || atk <= 20){
   4E12 3E 1E         [ 7] 1540 	ld	a,#0x1E
   4E14 DD 96 04      [19] 1541 	sub	a, 4 (ix)
   4E17 38 06         [12] 1542 	jr	C,00107$
   4E19 DD 7E FF      [19] 1543 	ld	a,-1 (ix)
   4E1C B7            [ 4] 1544 	or	a, a
   4E1D 20 4F         [12] 1545 	jr	NZ,00108$
   4E1F                    1546 00107$:
                           1547 ;src/draws.h:162: memptr = cpct_getScreenPtr(VMEM,28,192);
   4E1F 21 1C C0      [10] 1548 	ld	hl,#0xC01C
   4E22 E5            [11] 1549 	push	hl
   4E23 2E 00         [ 7] 1550 	ld	l, #0x00
   4E25 E5            [11] 1551 	push	hl
   4E26 CD 13 6C      [17] 1552 	call	_cpct_getScreenPtr
                           1553 ;src/draws.h:163: switch(col){
   4E29 DD 7E FE      [19] 1554 	ld	a,-2 (ix)
   4E2C B7            [ 4] 1555 	or	a, a
   4E2D 20 3F         [12] 1556 	jr	NZ,00108$
                           1557 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E2F 4D            [ 4] 1558 	ld	c, l
   4E30 44            [ 4] 1559 	ld	b, h
                           1560 ;src/draws.h:163: switch(col){
   4E31 DD 5E 05      [19] 1561 	ld	e,5 (ix)
   4E34 16 00         [ 7] 1562 	ld	d,#0x00
   4E36 21 3C 4E      [10] 1563 	ld	hl,#00156$
   4E39 19            [11] 1564 	add	hl,de
   4E3A 19            [11] 1565 	add	hl,de
                           1566 ;src/draws.h:164: case 0:
   4E3B E9            [ 4] 1567 	jp	(hl)
   4E3C                    1568 00156$:
   4E3C 18 04         [12] 1569 	jr	00103$
   4E3E 18 14         [12] 1570 	jr	00104$
   4E40 18 20         [12] 1571 	jr	00105$
   4E42                    1572 00103$:
                           1573 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E42 21 02 08      [10] 1574 	ld	hl,#0x0802
   4E45 E5            [11] 1575 	push	hl
   4E46 DD 7E 05      [19] 1576 	ld	a,5 (ix)
   4E49 F5            [11] 1577 	push	af
   4E4A 33            [ 6] 1578 	inc	sp
   4E4B C5            [11] 1579 	push	bc
   4E4C CD 42 6B      [17] 1580 	call	_cpct_drawSolidBox
   4E4F F1            [10] 1581 	pop	af
   4E50 F1            [10] 1582 	pop	af
   4E51 33            [ 6] 1583 	inc	sp
                           1584 ;src/draws.h:166: break;
   4E52 18 1A         [12] 1585 	jr	00108$
                           1586 ;src/draws.h:167: case 1:
   4E54                    1587 00104$:
                           1588 ;src/draws.h:168: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E54 11 80 46      [10] 1589 	ld	de,#_fatiga_nor
   4E57 21 02 08      [10] 1590 	ld	hl,#0x0802
   4E5A E5            [11] 1591 	push	hl
   4E5B C5            [11] 1592 	push	bc
   4E5C D5            [11] 1593 	push	de
   4E5D CD BC 6A      [17] 1594 	call	_cpct_drawSpriteMasked
                           1595 ;src/draws.h:169: break;
   4E60 18 0C         [12] 1596 	jr	00108$
                           1597 ;src/draws.h:170: case 2:
   4E62                    1598 00105$:
                           1599 ;src/draws.h:171: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E62 11 A0 46      [10] 1600 	ld	de,#_fatiga_full
   4E65 21 02 08      [10] 1601 	ld	hl,#0x0802
   4E68 E5            [11] 1602 	push	hl
   4E69 C5            [11] 1603 	push	bc
   4E6A D5            [11] 1604 	push	de
   4E6B CD BC 6A      [17] 1605 	call	_cpct_drawSpriteMasked
                           1606 ;src/draws.h:172: }
   4E6E                    1607 00108$:
                           1608 ;src/draws.h:174: if(atk > 40 || atk <= 20){
   4E6E 3E 28         [ 7] 1609 	ld	a,#0x28
   4E70 DD 96 04      [19] 1610 	sub	a, 4 (ix)
   4E73 38 06         [12] 1611 	jr	C,00114$
   4E75 DD 7E FF      [19] 1612 	ld	a,-1 (ix)
   4E78 B7            [ 4] 1613 	or	a, a
   4E79 20 4F         [12] 1614 	jr	NZ,00115$
   4E7B                    1615 00114$:
                           1616 ;src/draws.h:175: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E7B 21 1F C0      [10] 1617 	ld	hl,#0xC01F
   4E7E E5            [11] 1618 	push	hl
   4E7F 2E 00         [ 7] 1619 	ld	l, #0x00
   4E81 E5            [11] 1620 	push	hl
   4E82 CD 13 6C      [17] 1621 	call	_cpct_getScreenPtr
                           1622 ;src/draws.h:176: switch(col){
   4E85 DD 7E FE      [19] 1623 	ld	a,-2 (ix)
   4E88 B7            [ 4] 1624 	or	a, a
   4E89 20 3F         [12] 1625 	jr	NZ,00115$
                           1626 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4E8B 4D            [ 4] 1627 	ld	c, l
   4E8C 44            [ 4] 1628 	ld	b, h
                           1629 ;src/draws.h:176: switch(col){
   4E8D DD 5E 05      [19] 1630 	ld	e,5 (ix)
   4E90 16 00         [ 7] 1631 	ld	d,#0x00
   4E92 21 98 4E      [10] 1632 	ld	hl,#00157$
   4E95 19            [11] 1633 	add	hl,de
   4E96 19            [11] 1634 	add	hl,de
                           1635 ;src/draws.h:177: case 0:
   4E97 E9            [ 4] 1636 	jp	(hl)
   4E98                    1637 00157$:
   4E98 18 04         [12] 1638 	jr	00110$
   4E9A 18 14         [12] 1639 	jr	00111$
   4E9C 18 20         [12] 1640 	jr	00112$
   4E9E                    1641 00110$:
                           1642 ;src/draws.h:178: cpct_drawSolidBox(memptr, col, 2, 8);
   4E9E 21 02 08      [10] 1643 	ld	hl,#0x0802
   4EA1 E5            [11] 1644 	push	hl
   4EA2 DD 7E 05      [19] 1645 	ld	a,5 (ix)
   4EA5 F5            [11] 1646 	push	af
   4EA6 33            [ 6] 1647 	inc	sp
   4EA7 C5            [11] 1648 	push	bc
   4EA8 CD 42 6B      [17] 1649 	call	_cpct_drawSolidBox
   4EAB F1            [10] 1650 	pop	af
   4EAC F1            [10] 1651 	pop	af
   4EAD 33            [ 6] 1652 	inc	sp
                           1653 ;src/draws.h:179: break;
   4EAE 18 1A         [12] 1654 	jr	00115$
                           1655 ;src/draws.h:180: case 1:
   4EB0                    1656 00111$:
                           1657 ;src/draws.h:181: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4EB0 11 80 46      [10] 1658 	ld	de,#_fatiga_nor
   4EB3 21 02 08      [10] 1659 	ld	hl,#0x0802
   4EB6 E5            [11] 1660 	push	hl
   4EB7 C5            [11] 1661 	push	bc
   4EB8 D5            [11] 1662 	push	de
   4EB9 CD BC 6A      [17] 1663 	call	_cpct_drawSpriteMasked
                           1664 ;src/draws.h:182: break;
   4EBC 18 0C         [12] 1665 	jr	00115$
                           1666 ;src/draws.h:183: case 2:
   4EBE                    1667 00112$:
                           1668 ;src/draws.h:184: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4EBE 11 A0 46      [10] 1669 	ld	de,#_fatiga_full
   4EC1 21 02 08      [10] 1670 	ld	hl,#0x0802
   4EC4 E5            [11] 1671 	push	hl
   4EC5 C5            [11] 1672 	push	bc
   4EC6 D5            [11] 1673 	push	de
   4EC7 CD BC 6A      [17] 1674 	call	_cpct_drawSpriteMasked
                           1675 ;src/draws.h:185: }
   4ECA                    1676 00115$:
                           1677 ;src/draws.h:187: if(atk <= 20){
   4ECA DD 7E FF      [19] 1678 	ld	a,-1 (ix)
   4ECD B7            [ 4] 1679 	or	a, a
   4ECE 20 39         [12] 1680 	jr	NZ,00122$
                           1681 ;src/draws.h:188: memptr = cpct_getScreenPtr(VMEM,34,192);
   4ED0 21 22 C0      [10] 1682 	ld	hl,#0xC022
   4ED3 E5            [11] 1683 	push	hl
   4ED4 2E 00         [ 7] 1684 	ld	l, #0x00
   4ED6 E5            [11] 1685 	push	hl
   4ED7 CD 13 6C      [17] 1686 	call	_cpct_getScreenPtr
                           1687 ;src/draws.h:165: cpct_drawSolidBox(memptr, col, 2, 8);
   4EDA 4D            [ 4] 1688 	ld	c, l
   4EDB 44            [ 4] 1689 	ld	b, h
                           1690 ;src/draws.h:189: switch(col){
   4EDC DD 7E 05      [19] 1691 	ld	a,5 (ix)
   4EDF B7            [ 4] 1692 	or	a, a
   4EE0 28 09         [12] 1693 	jr	Z,00117$
   4EE2 DD 7E 05      [19] 1694 	ld	a,5 (ix)
   4EE5 D6 02         [ 7] 1695 	sub	a, #0x02
   4EE7 28 14         [12] 1696 	jr	Z,00118$
   4EE9 18 1E         [12] 1697 	jr	00122$
                           1698 ;src/draws.h:190: case 0:
   4EEB                    1699 00117$:
                           1700 ;src/draws.h:191: cpct_drawSolidBox(memptr, col, 2, 8);
   4EEB 21 02 08      [10] 1701 	ld	hl,#0x0802
   4EEE E5            [11] 1702 	push	hl
   4EEF DD 7E 05      [19] 1703 	ld	a,5 (ix)
   4EF2 F5            [11] 1704 	push	af
   4EF3 33            [ 6] 1705 	inc	sp
   4EF4 C5            [11] 1706 	push	bc
   4EF5 CD 42 6B      [17] 1707 	call	_cpct_drawSolidBox
   4EF8 F1            [10] 1708 	pop	af
   4EF9 F1            [10] 1709 	pop	af
   4EFA 33            [ 6] 1710 	inc	sp
                           1711 ;src/draws.h:192: break;
   4EFB 18 0C         [12] 1712 	jr	00122$
                           1713 ;src/draws.h:193: case 2:
   4EFD                    1714 00118$:
                           1715 ;src/draws.h:194: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4EFD 11 A0 46      [10] 1716 	ld	de,#_fatiga_full
   4F00 21 02 08      [10] 1717 	ld	hl,#0x0802
   4F03 E5            [11] 1718 	push	hl
   4F04 C5            [11] 1719 	push	bc
   4F05 D5            [11] 1720 	push	de
   4F06 CD BC 6A      [17] 1721 	call	_cpct_drawSpriteMasked
                           1722 ;src/draws.h:195: }
   4F09                    1723 00122$:
   4F09 DD F9         [10] 1724 	ld	sp, ix
   4F0B DD E1         [14] 1725 	pop	ix
   4F0D C9            [10] 1726 	ret
                           1727 ;src/draws.h:200: void drawPickUps(u8 corazon, u8 bullet){
                           1728 ;	---------------------------------
                           1729 ; Function drawPickUps
                           1730 ; ---------------------------------
   4F0E                    1731 _drawPickUps::
   4F0E DD E5         [15] 1732 	push	ix
   4F10 DD 21 00 00   [14] 1733 	ld	ix,#0
   4F14 DD 39         [15] 1734 	add	ix,sp
                           1735 ;src/draws.h:203: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4F16 21 04 A0      [10] 1736 	ld	hl,#0xA004
   4F19 E5            [11] 1737 	push	hl
   4F1A 21 00 C0      [10] 1738 	ld	hl,#0xC000
   4F1D E5            [11] 1739 	push	hl
   4F1E CD 13 6C      [17] 1740 	call	_cpct_getScreenPtr
                           1741 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F21 4D            [ 4] 1742 	ld	c, l
   4F22 44            [ 4] 1743 	ld	b, h
                           1744 ;src/draws.h:204: if(corazon == 0)
   4F23 DD 7E 04      [19] 1745 	ld	a,4 (ix)
   4F26 B7            [ 4] 1746 	or	a, a
   4F27 20 0E         [12] 1747 	jr	NZ,00102$
                           1748 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F29 11 00 46      [10] 1749 	ld	de,#_corazon_lleno
   4F2C 21 04 08      [10] 1750 	ld	hl,#0x0804
   4F2F E5            [11] 1751 	push	hl
   4F30 C5            [11] 1752 	push	bc
   4F31 D5            [11] 1753 	push	de
   4F32 CD BC 6A      [17] 1754 	call	_cpct_drawSpriteMasked
   4F35 18 0E         [12] 1755 	jr	00103$
   4F37                    1756 00102$:
                           1757 ;src/draws.h:207: cpct_drawSolidBox(memptr, 0, 4, 8);
   4F37 21 04 08      [10] 1758 	ld	hl,#0x0804
   4F3A E5            [11] 1759 	push	hl
   4F3B AF            [ 4] 1760 	xor	a, a
   4F3C F5            [11] 1761 	push	af
   4F3D 33            [ 6] 1762 	inc	sp
   4F3E C5            [11] 1763 	push	bc
   4F3F CD 42 6B      [17] 1764 	call	_cpct_drawSolidBox
   4F42 F1            [10] 1765 	pop	af
   4F43 F1            [10] 1766 	pop	af
   4F44 33            [ 6] 1767 	inc	sp
   4F45                    1768 00103$:
                           1769 ;src/draws.h:209: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4F45 21 08 10      [10] 1770 	ld	hl,#0x1008
   4F48 E5            [11] 1771 	push	hl
   4F49 21 00 C0      [10] 1772 	ld	hl,#0xC000
   4F4C E5            [11] 1773 	push	hl
   4F4D CD 13 6C      [17] 1774 	call	_cpct_getScreenPtr
                           1775 ;src/draws.h:205: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4F50 EB            [ 4] 1776 	ex	de,hl
                           1777 ;src/draws.h:210: if(bullet == 0)
   4F51 DD 7E 05      [19] 1778 	ld	a,5 (ix)
   4F54 B7            [ 4] 1779 	or	a, a
   4F55 20 0E         [12] 1780 	jr	NZ,00105$
                           1781 ;src/draws.h:211: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4F57 01 60 67      [10] 1782 	ld	bc,#_flecha_arriba
   4F5A 21 02 08      [10] 1783 	ld	hl,#0x0802
   4F5D E5            [11] 1784 	push	hl
   4F5E D5            [11] 1785 	push	de
   4F5F C5            [11] 1786 	push	bc
   4F60 CD BC 6A      [17] 1787 	call	_cpct_drawSpriteMasked
   4F63 18 0E         [12] 1788 	jr	00107$
   4F65                    1789 00105$:
                           1790 ;src/draws.h:213: cpct_drawSolidBox(memptr, 0, 2, 8);
   4F65 21 02 08      [10] 1791 	ld	hl,#0x0802
   4F68 E5            [11] 1792 	push	hl
   4F69 AF            [ 4] 1793 	xor	a, a
   4F6A F5            [11] 1794 	push	af
   4F6B 33            [ 6] 1795 	inc	sp
   4F6C D5            [11] 1796 	push	de
   4F6D CD 42 6B      [17] 1797 	call	_cpct_drawSolidBox
   4F70 F1            [10] 1798 	pop	af
   4F71 F1            [10] 1799 	pop	af
   4F72 33            [ 6] 1800 	inc	sp
   4F73                    1801 00107$:
   4F73 DD E1         [14] 1802 	pop	ix
   4F75 C9            [10] 1803 	ret
                           1804 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1805 ;	---------------------------------
                           1806 ; Function detectPlayerRoom
                           1807 ; ---------------------------------
   4F76                    1808 _detectPlayerRoom::
   4F76 DD E5         [15] 1809 	push	ix
   4F78 DD 21 00 00   [14] 1810 	ld	ix,#0
   4F7C DD 39         [15] 1811 	add	ix,sp
                           1812 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   4F7E 11 C8 6C      [10] 1813 	ld	de,#_scene+0
   4F81 DD 7E 05      [19] 1814 	ld	a,5 (ix)
   4F84 07            [ 4] 1815 	rlca
   4F85 07            [ 4] 1816 	rlca
   4F86 07            [ 4] 1817 	rlca
   4F87 07            [ 4] 1818 	rlca
   4F88 E6 0F         [ 7] 1819 	and	a,#0x0F
   4F8A 4F            [ 4] 1820 	ld	c,a
   4F8B 06 00         [ 7] 1821 	ld	b,#0x00
   4F8D 69            [ 4] 1822 	ld	l, c
   4F8E 60            [ 4] 1823 	ld	h, b
   4F8F 29            [11] 1824 	add	hl, hl
   4F90 29            [11] 1825 	add	hl, hl
   4F91 09            [11] 1826 	add	hl, bc
   4F92 29            [11] 1827 	add	hl, hl
   4F93 29            [11] 1828 	add	hl, hl
   4F94 19            [11] 1829 	add	hl,de
   4F95 DD 5E 04      [19] 1830 	ld	e,4 (ix)
   4F98 CB 3B         [ 8] 1831 	srl	e
   4F9A CB 3B         [ 8] 1832 	srl	e
   4F9C 16 00         [ 7] 1833 	ld	d,#0x00
   4F9E 19            [11] 1834 	add	hl,de
   4F9F 6E            [ 7] 1835 	ld	l,(hl)
   4FA0 DD E1         [14] 1836 	pop	ix
   4FA2 C9            [10] 1837 	ret
                           1838 ;src/ia.h:16: u8 chooseDirection(){
                           1839 ;	---------------------------------
                           1840 ; Function chooseDirection
                           1841 ; ---------------------------------
   4FA3                    1842 _chooseDirection::
                           1843 ;src/ia.h:18: u8 dir = 0;
   4FA3 16 00         [ 7] 1844 	ld	d,#0x00
                           1845 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   4FA5 D5            [11] 1846 	push	de
   4FA6 CD 7A 68      [17] 1847 	call	_rand
   4FA9 01 04 00      [10] 1848 	ld	bc,#0x0004
   4FAC C5            [11] 1849 	push	bc
   4FAD E5            [11] 1850 	push	hl
   4FAE CD 07 6C      [17] 1851 	call	__modsint
   4FB1 F1            [10] 1852 	pop	af
   4FB2 F1            [10] 1853 	pop	af
   4FB3 D1            [10] 1854 	pop	de
   4FB4 5D            [ 4] 1855 	ld	e,l
   4FB5 1C            [ 4] 1856 	inc	e
                           1857 ;src/ia.h:20: switch(rnd){
   4FB6 7B            [ 4] 1858 	ld	a,e
   4FB7 D6 01         [ 7] 1859 	sub	a, #0x01
   4FB9 38 24         [12] 1860 	jr	C,00105$
   4FBB 3E 04         [ 7] 1861 	ld	a,#0x04
   4FBD 93            [ 4] 1862 	sub	a, e
   4FBE 38 1F         [12] 1863 	jr	C,00105$
   4FC0 1D            [ 4] 1864 	dec	e
   4FC1 16 00         [ 7] 1865 	ld	d,#0x00
   4FC3 21 C9 4F      [10] 1866 	ld	hl,#00116$
   4FC6 19            [11] 1867 	add	hl,de
   4FC7 19            [11] 1868 	add	hl,de
                           1869 ;src/ia.h:21: case 4: dir = 6;break;
   4FC8 E9            [ 4] 1870 	jp	(hl)
   4FC9                    1871 00116$:
   4FC9 18 12         [12] 1872 	jr	00104$
   4FCB 18 0C         [12] 1873 	jr	00103$
   4FCD 18 06         [12] 1874 	jr	00102$
   4FCF 18 00         [12] 1875 	jr	00101$
   4FD1                    1876 00101$:
   4FD1 16 06         [ 7] 1877 	ld	d,#0x06
   4FD3 18 0A         [12] 1878 	jr	00105$
                           1879 ;src/ia.h:22: case 3: dir = 4;break;
   4FD5                    1880 00102$:
   4FD5 16 04         [ 7] 1881 	ld	d,#0x04
   4FD7 18 06         [12] 1882 	jr	00105$
                           1883 ;src/ia.h:23: case 2: dir = 2;break;
   4FD9                    1884 00103$:
   4FD9 16 02         [ 7] 1885 	ld	d,#0x02
   4FDB 18 02         [12] 1886 	jr	00105$
                           1887 ;src/ia.h:24: case 1: dir = 8;break;
   4FDD                    1888 00104$:
   4FDD 16 08         [ 7] 1889 	ld	d,#0x08
                           1890 ;src/ia.h:25: }
   4FDF                    1891 00105$:
                           1892 ;src/ia.h:27: return dir;
   4FDF 6A            [ 4] 1893 	ld	l,d
   4FE0 C9            [10] 1894 	ret
                           1895 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           1896 ;	---------------------------------
                           1897 ; Function setDirection
                           1898 ; ---------------------------------
   4FE1                    1899 _setDirection::
   4FE1 DD E5         [15] 1900 	push	ix
   4FE3 DD 21 00 00   [14] 1901 	ld	ix,#0
   4FE7 DD 39         [15] 1902 	add	ix,sp
                           1903 ;src/ia.h:33: if(px < x) dir = 4;
   4FE9 DD 7E 04      [19] 1904 	ld	a,4 (ix)
   4FEC DD 96 06      [19] 1905 	sub	a, 6 (ix)
   4FEF 30 04         [12] 1906 	jr	NC,00108$
   4FF1 2E 04         [ 7] 1907 	ld	l,#0x04
   4FF3 18 1A         [12] 1908 	jr	00109$
   4FF5                    1909 00108$:
                           1910 ;src/ia.h:34: else if(py > y) dir = 2;
   4FF5 DD 7E 07      [19] 1911 	ld	a,7 (ix)
   4FF8 DD 96 05      [19] 1912 	sub	a, 5 (ix)
   4FFB 30 04         [12] 1913 	jr	NC,00105$
   4FFD 2E 02         [ 7] 1914 	ld	l,#0x02
   4FFF 18 0E         [12] 1915 	jr	00109$
   5001                    1916 00105$:
                           1917 ;src/ia.h:35: else if(px > x) dir = 6;
   5001 DD 7E 06      [19] 1918 	ld	a,6 (ix)
   5004 DD 96 04      [19] 1919 	sub	a, 4 (ix)
   5007 30 04         [12] 1920 	jr	NC,00102$
   5009 2E 06         [ 7] 1921 	ld	l,#0x06
   500B 18 02         [12] 1922 	jr	00109$
   500D                    1923 00102$:
                           1924 ;src/ia.h:36: else dir = 8;
   500D 2E 08         [ 7] 1925 	ld	l,#0x08
   500F                    1926 00109$:
                           1927 ;src/ia.h:37: return dir;
   500F DD E1         [14] 1928 	pop	ix
   5011 C9            [10] 1929 	ret
                           1930 ;src/ia.h:40: void movement(u8 dir){
                           1931 ;	---------------------------------
                           1932 ; Function movement
                           1933 ; ---------------------------------
   5012                    1934 _movement::
                           1935 ;src/ia.h:41: switch(dir){
   5012 FD 21 02 00   [14] 1936 	ld	iy,#2
   5016 FD 39         [15] 1937 	add	iy,sp
   5018 FD 7E 00      [19] 1938 	ld	a,0 (iy)
   501B D6 02         [ 7] 1939 	sub	a, #0x02
   501D 28 2B         [12] 1940 	jr	Z,00104$
   501F FD 7E 00      [19] 1941 	ld	a,0 (iy)
   5022 D6 04         [ 7] 1942 	sub	a, #0x04
   5024 28 14         [12] 1943 	jr	Z,00102$
   5026 FD 7E 00      [19] 1944 	ld	a,0 (iy)
   5029 D6 06         [ 7] 1945 	sub	a, #0x06
   502B 28 08         [12] 1946 	jr	Z,00101$
   502D FD 7E 00      [19] 1947 	ld	a,0 (iy)
   5030 D6 08         [ 7] 1948 	sub	a, #0x08
   5032 28 0E         [12] 1949 	jr	Z,00103$
   5034 C9            [10] 1950 	ret
                           1951 ;src/ia.h:42: case 6: enemy.x += 1; break;
   5035                    1952 00101$:
   5035 21 D5 6D      [10] 1953 	ld	hl,#_enemy+0
   5038 34            [11] 1954 	inc	(hl)
   5039 C9            [10] 1955 	ret
                           1956 ;src/ia.h:43: case 4: enemy.x -= 1; break;
   503A                    1957 00102$:
   503A 11 D5 6D      [10] 1958 	ld	de,#_enemy+0
   503D 1A            [ 7] 1959 	ld	a,(de)
   503E C6 FF         [ 7] 1960 	add	a,#0xFF
   5040 12            [ 7] 1961 	ld	(de),a
   5041 C9            [10] 1962 	ret
                           1963 ;src/ia.h:44: case 8: enemy.y -= 2; break;
   5042                    1964 00103$:
   5042 11 D6 6D      [10] 1965 	ld	de,#_enemy+1
   5045 1A            [ 7] 1966 	ld	a,(de)
   5046 C6 FE         [ 7] 1967 	add	a,#0xFE
   5048 12            [ 7] 1968 	ld	(de),a
   5049 C9            [10] 1969 	ret
                           1970 ;src/ia.h:45: case 2: enemy.y += 2; break;
   504A                    1971 00104$:
   504A 21 D6 6D      [10] 1972 	ld	hl,#_enemy+1
   504D 7E            [ 7] 1973 	ld	a,(hl)
   504E C6 02         [ 7] 1974 	add	a, #0x02
   5050 77            [ 7] 1975 	ld	(hl),a
                           1976 ;src/ia.h:46: }
   5051 C9            [10] 1977 	ret
                           1978 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           1979 ;	---------------------------------
                           1980 ; Function checkCollisions
                           1981 ; ---------------------------------
   5052                    1982 _checkCollisions::
   5052 DD E5         [15] 1983 	push	ix
   5054 DD 21 00 00   [14] 1984 	ld	ix,#0
   5058 DD 39         [15] 1985 	add	ix,sp
   505A 21 FA FF      [10] 1986 	ld	hl,#-6
   505D 39            [11] 1987 	add	hl,sp
   505E F9            [ 6] 1988 	ld	sp,hl
                           1989 ;src/CalcColision.h:14: switch(atk){
   505F DD 7E 08      [19] 1990 	ld	a,8 (ix)
   5062 D6 15         [ 7] 1991 	sub	a, #0x15
   5064 28 09         [12] 1992 	jr	Z,00101$
   5066 DD 7E 08      [19] 1993 	ld	a,8 (ix)
   5069 D6 16         [ 7] 1994 	sub	a, #0x16
   506B 28 08         [12] 1995 	jr	Z,00102$
   506D 18 0C         [12] 1996 	jr	00103$
                           1997 ;src/CalcColision.h:15: case 21:
   506F                    1998 00101$:
                           1999 ;src/CalcColision.h:16: auxX = 2;
   506F 1E 02         [ 7] 2000 	ld	e,#0x02
                           2001 ;src/CalcColision.h:17: auxY = 8;
   5071 0E 08         [ 7] 2002 	ld	c,#0x08
                           2003 ;src/CalcColision.h:18: break;
   5073 18 0A         [12] 2004 	jr	00104$
                           2005 ;src/CalcColision.h:19: case 22:
   5075                    2006 00102$:
                           2007 ;src/CalcColision.h:20: auxX = 4;
   5075 1E 04         [ 7] 2008 	ld	e,#0x04
                           2009 ;src/CalcColision.h:21: auxY = 4;
   5077 0E 04         [ 7] 2010 	ld	c,#0x04
                           2011 ;src/CalcColision.h:22: break;
   5079 18 04         [12] 2012 	jr	00104$
                           2013 ;src/CalcColision.h:23: default:
   507B                    2014 00103$:
                           2015 ;src/CalcColision.h:24: auxX = tilewidth;
   507B 1E 04         [ 7] 2016 	ld	e,#0x04
                           2017 ;src/CalcColision.h:25: auxY = tileheight;
   507D 0E 10         [ 7] 2018 	ld	c,#0x10
                           2019 ;src/CalcColision.h:26: }
   507F                    2020 00104$:
                           2021 ;src/CalcColision.h:27: popX = pX + auxX;
   507F DD 7E 04      [19] 2022 	ld	a,4 (ix)
   5082 83            [ 4] 2023 	add	a, e
   5083 6F            [ 4] 2024 	ld	l,a
                           2025 ;src/CalcColision.h:28: popY = pY + auxY;
   5084 DD 7E 05      [19] 2026 	ld	a,5 (ix)
   5087 81            [ 4] 2027 	add	a, c
   5088 DD 77 FB      [19] 2028 	ld	-5 (ix),a
                           2029 ;src/CalcColision.h:29: eopX = eX + auxX;
   508B DD 7E 06      [19] 2030 	ld	a,6 (ix)
   508E 83            [ 4] 2031 	add	a, e
   508F 5F            [ 4] 2032 	ld	e,a
                           2033 ;src/CalcColision.h:30: eopY = eY + auxY;
   5090 DD 7E 07      [19] 2034 	ld	a,7 (ix)
   5093 81            [ 4] 2035 	add	a, c
   5094 DD 77 FA      [19] 2036 	ld	-6 (ix),a
                           2037 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   5097 7B            [ 4] 2038 	ld	a,e
   5098 DD 96 04      [19] 2039 	sub	a, 4 (ix)
   509B 3E 00         [ 7] 2040 	ld	a,#0x00
   509D 17            [ 4] 2041 	rla
   509E DD 77 FC      [19] 2042 	ld	-4 (ix),a
   50A1 7D            [ 4] 2043 	ld	a,l
   50A2 93            [ 4] 2044 	sub	a, e
   50A3 3E 00         [ 7] 2045 	ld	a,#0x00
   50A5 17            [ 4] 2046 	rla
   50A6 DD 77 FD      [19] 2047 	ld	-3 (ix),a
   50A9 DD 7E 07      [19] 2048 	ld	a,7 (ix)
   50AC DD 96 05      [19] 2049 	sub	a, 5 (ix)
   50AF 3E 00         [ 7] 2050 	ld	a,#0x00
   50B1 17            [ 4] 2051 	rla
   50B2 5F            [ 4] 2052 	ld	e,a
   50B3 DD 7E FB      [19] 2053 	ld	a,-5 (ix)
   50B6 DD 96 07      [19] 2054 	sub	a, 7 (ix)
   50B9 3E 00         [ 7] 2055 	ld	a,#0x00
   50BB 17            [ 4] 2056 	rla
   50BC 4F            [ 4] 2057 	ld	c,a
                           2058 ;src/CalcColision.h:33: if(atk >= 21)
   50BD DD 7E 08      [19] 2059 	ld	a,8 (ix)
   50C0 D6 15         [ 7] 2060 	sub	a, #0x15
   50C2 3E 00         [ 7] 2061 	ld	a,#0x00
   50C4 17            [ 4] 2062 	rla
   50C5 DD 77 FF      [19] 2063 	ld	-1 (ix),a
                           2064 ;src/CalcColision.h:32: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   50C8 DD 7E FC      [19] 2065 	ld	a,-4 (ix)
   50CB B7            [ 4] 2066 	or	a, a
   50CC 20 1C         [12] 2067 	jr	NZ,00109$
   50CE DD 7E FD      [19] 2068 	ld	a,-3 (ix)
   50D1 B7            [ 4] 2069 	or	a,a
   50D2 20 16         [12] 2070 	jr	NZ,00109$
   50D4 B3            [ 4] 2071 	or	a,e
   50D5 20 13         [12] 2072 	jr	NZ,00109$
   50D7 B1            [ 4] 2073 	or	a,c
   50D8 20 10         [12] 2074 	jr	NZ,00109$
                           2075 ;src/CalcColision.h:33: if(atk >= 21)
   50DA DD 7E FF      [19] 2076 	ld	a,-1 (ix)
   50DD B7            [ 4] 2077 	or	a, a
   50DE 20 05         [12] 2078 	jr	NZ,00106$
                           2079 ;src/CalcColision.h:34: return 1;
   50E0 2E 01         [ 7] 2080 	ld	l,#0x01
   50E2 C3 6E 51      [10] 2081 	jp	00137$
   50E5                    2082 00106$:
                           2083 ;src/CalcColision.h:36: return 2;
   50E5 2E 02         [ 7] 2084 	ld	l,#0x02
   50E7 C3 6E 51      [10] 2085 	jp	00137$
   50EA                    2086 00109$:
                           2087 ;src/CalcColision.h:38: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   50EA DD 7E 06      [19] 2088 	ld	a,6 (ix)
   50ED DD 96 04      [19] 2089 	sub	a, 4 (ix)
   50F0 3E 00         [ 7] 2090 	ld	a,#0x00
   50F2 17            [ 4] 2091 	rla
   50F3 DD 77 FE      [19] 2092 	ld	-2 (ix),a
   50F6 7D            [ 4] 2093 	ld	a,l
   50F7 DD 96 06      [19] 2094 	sub	a, 6 (ix)
   50FA 3E 00         [ 7] 2095 	ld	a,#0x00
   50FC 17            [ 4] 2096 	rla
   50FD 6F            [ 4] 2097 	ld	l,a
   50FE DD 7E FE      [19] 2098 	ld	a,-2 (ix)
   5101 B7            [ 4] 2099 	or	a,a
   5102 20 17         [12] 2100 	jr	NZ,00117$
   5104 B5            [ 4] 2101 	or	a,l
   5105 20 14         [12] 2102 	jr	NZ,00117$
   5107 B3            [ 4] 2103 	or	a,e
   5108 20 11         [12] 2104 	jr	NZ,00117$
   510A B1            [ 4] 2105 	or	a,c
   510B 20 0E         [12] 2106 	jr	NZ,00117$
                           2107 ;src/CalcColision.h:39: if(atk >= 21)
   510D DD 7E FF      [19] 2108 	ld	a,-1 (ix)
   5110 B7            [ 4] 2109 	or	a, a
   5111 20 04         [12] 2110 	jr	NZ,00114$
                           2111 ;src/CalcColision.h:40: return 1;
   5113 2E 01         [ 7] 2112 	ld	l,#0x01
   5115 18 57         [12] 2113 	jr	00137$
   5117                    2114 00114$:
                           2115 ;src/CalcColision.h:42: return 2;
   5117 2E 02         [ 7] 2116 	ld	l,#0x02
   5119 18 53         [12] 2117 	jr	00137$
   511B                    2118 00117$:
                           2119 ;src/CalcColision.h:44: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   511B DD 7E FA      [19] 2120 	ld	a,-6 (ix)
   511E DD 96 05      [19] 2121 	sub	a, 5 (ix)
   5121 3E 00         [ 7] 2122 	ld	a,#0x00
   5123 17            [ 4] 2123 	rla
   5124 5F            [ 4] 2124 	ld	e,a
   5125 DD 7E FB      [19] 2125 	ld	a,-5 (ix)
   5128 DD 96 FA      [19] 2126 	sub	a, -6 (ix)
   512B 3E 00         [ 7] 2127 	ld	a,#0x00
   512D 17            [ 4] 2128 	rla
   512E 67            [ 4] 2129 	ld	h,a
   512F DD 7E FE      [19] 2130 	ld	a,-2 (ix)
   5132 B7            [ 4] 2131 	or	a,a
   5133 20 17         [12] 2132 	jr	NZ,00125$
   5135 B5            [ 4] 2133 	or	a,l
   5136 20 14         [12] 2134 	jr	NZ,00125$
   5138 B3            [ 4] 2135 	or	a,e
   5139 20 11         [12] 2136 	jr	NZ,00125$
   513B B4            [ 4] 2137 	or	a,h
   513C 20 0E         [12] 2138 	jr	NZ,00125$
                           2139 ;src/CalcColision.h:45: if(atk >= 21)
   513E DD 7E FF      [19] 2140 	ld	a,-1 (ix)
   5141 B7            [ 4] 2141 	or	a, a
   5142 20 04         [12] 2142 	jr	NZ,00122$
                           2143 ;src/CalcColision.h:46: return 1;
   5144 2E 01         [ 7] 2144 	ld	l,#0x01
   5146 18 26         [12] 2145 	jr	00137$
   5148                    2146 00122$:
                           2147 ;src/CalcColision.h:48: return 2;
   5148 2E 02         [ 7] 2148 	ld	l,#0x02
   514A 18 22         [12] 2149 	jr	00137$
   514C                    2150 00125$:
                           2151 ;src/CalcColision.h:50: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   514C DD 7E FC      [19] 2152 	ld	a,-4 (ix)
   514F B7            [ 4] 2153 	or	a, a
   5150 20 1A         [12] 2154 	jr	NZ,00133$
   5152 DD 7E FD      [19] 2155 	ld	a,-3 (ix)
   5155 B7            [ 4] 2156 	or	a,a
   5156 20 14         [12] 2157 	jr	NZ,00133$
   5158 B3            [ 4] 2158 	or	a,e
   5159 20 11         [12] 2159 	jr	NZ,00133$
   515B B4            [ 4] 2160 	or	a,h
   515C 20 0E         [12] 2161 	jr	NZ,00133$
                           2162 ;src/CalcColision.h:51: if(atk >= 21)
   515E DD 7E FF      [19] 2163 	ld	a,-1 (ix)
   5161 B7            [ 4] 2164 	or	a, a
   5162 20 04         [12] 2165 	jr	NZ,00130$
                           2166 ;src/CalcColision.h:52: return 1;
   5164 2E 01         [ 7] 2167 	ld	l,#0x01
   5166 18 06         [12] 2168 	jr	00137$
   5168                    2169 00130$:
                           2170 ;src/CalcColision.h:54: return 2;
   5168 2E 02         [ 7] 2171 	ld	l,#0x02
   516A 18 02         [12] 2172 	jr	00137$
   516C                    2173 00133$:
                           2174 ;src/CalcColision.h:56: return 0;
   516C 2E 00         [ 7] 2175 	ld	l,#0x00
   516E                    2176 00137$:
   516E DD F9         [10] 2177 	ld	sp, ix
   5170 DD E1         [14] 2178 	pop	ix
   5172 C9            [10] 2179 	ret
                           2180 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2181 ;	---------------------------------
                           2182 ; Function checkKeyboard
                           2183 ; ---------------------------------
   5173                    2184 _checkKeyboard::
   5173 DD E5         [15] 2185 	push	ix
   5175 DD 21 00 00   [14] 2186 	ld	ix,#0
   5179 DD 39         [15] 2187 	add	ix,sp
   517B 21 FA FF      [10] 2188 	ld	hl,#-6
   517E 39            [11] 2189 	add	hl,sp
   517F F9            [ 6] 2190 	ld	sp,hl
                           2191 ;src/keyboard.h:14: u8 *s = NULL;
   5180 DD 36 FE 00   [19] 2192 	ld	-2 (ix),#0x00
   5184 DD 36 FF 00   [19] 2193 	ld	-1 (ix),#0x00
                           2194 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   5188 21 05 80      [10] 2195 	ld	hl,#0x8005
   518B CD 04 68      [17] 2196 	call	_cpct_isKeyPressed
   518E 7D            [ 4] 2197 	ld	a,l
   518F B7            [ 4] 2198 	or	a, a
   5190 28 68         [12] 2199 	jr	Z,00147$
   5192 21 D2 6D      [10] 2200 	ld	hl, #(_player + 0x0008) + 0
   5195 7E            [ 7] 2201 	ld	a,(hl)
   5196 DD 77 FD      [19] 2202 	ld	-3 (ix), a
   5199 D6 14         [ 7] 2203 	sub	a, #0x14
   519B 38 5D         [12] 2204 	jr	C,00147$
                           2205 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   519D DD 7E FD      [19] 2206 	ld	a,-3 (ix)
   51A0 D6 32         [ 7] 2207 	sub	a, #0x32
   51A2 38 07         [12] 2208 	jr	C,00102$
   51A4 21 D2 6D      [10] 2209 	ld	hl,#(_player + 0x0008)
   51A7 36 00         [10] 2210 	ld	(hl),#0x00
   51A9 18 08         [12] 2211 	jr	00103$
   51AB                    2212 00102$:
                           2213 ;src/keyboard.h:17: else player.atk += 1;
   51AB DD 7E FD      [19] 2214 	ld	a,-3 (ix)
   51AE 3C            [ 4] 2215 	inc	a
   51AF 21 D2 6D      [10] 2216 	ld	hl,#(_player + 0x0008)
   51B2 77            [ 7] 2217 	ld	(hl),a
   51B3                    2218 00103$:
                           2219 ;src/keyboard.h:18: switch(player.dir){
   51B3 21 D1 6D      [10] 2220 	ld	hl, #_player + 7
   51B6 66            [ 7] 2221 	ld	h,(hl)
   51B7 7C            [ 4] 2222 	ld	a,h
   51B8 D6 02         [ 7] 2223 	sub	a, #0x02
   51BA 28 33         [12] 2224 	jr	Z,00107$
   51BC 7C            [ 4] 2225 	ld	a,h
   51BD D6 04         [ 7] 2226 	sub	a, #0x04
   51BF 28 0D         [12] 2227 	jr	Z,00104$
   51C1 7C            [ 4] 2228 	ld	a,h
   51C2 D6 06         [ 7] 2229 	sub	a, #0x06
   51C4 28 13         [12] 2230 	jr	Z,00105$
   51C6 7C            [ 4] 2231 	ld	a,h
   51C7 D6 08         [ 7] 2232 	sub	a, #0x08
   51C9 28 19         [12] 2233 	jr	Z,00106$
   51CB C3 C1 53      [10] 2234 	jp	00148$
                           2235 ;src/keyboard.h:19: case 4:
   51CE                    2236 00104$:
                           2237 ;src/keyboard.h:20: s = gladis_atk_izda;
   51CE DD 36 FE 80   [19] 2238 	ld	-2 (ix),#<(_gladis_atk_izda)
   51D2 DD 36 FF 41   [19] 2239 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2240 ;src/keyboard.h:21: break;
   51D6 C3 C1 53      [10] 2241 	jp	00148$
                           2242 ;src/keyboard.h:22: case 6:
   51D9                    2243 00105$:
                           2244 ;src/keyboard.h:23: s = gladis_atk_dcha;
   51D9 DD 36 FE 00   [19] 2245 	ld	-2 (ix),#<(_gladis_atk_dcha)
   51DD DD 36 FF 41   [19] 2246 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2247 ;src/keyboard.h:24: break;
   51E1 C3 C1 53      [10] 2248 	jp	00148$
                           2249 ;src/keyboard.h:25: case 8:
   51E4                    2250 00106$:
                           2251 ;src/keyboard.h:26: s = gladis_atk_arriba;
   51E4 DD 36 FE 80   [19] 2252 	ld	-2 (ix),#<(_gladis_atk_arriba)
   51E8 DD 36 FF 43   [19] 2253 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2254 ;src/keyboard.h:27: break;
   51EC C3 C1 53      [10] 2255 	jp	00148$
                           2256 ;src/keyboard.h:28: case 2:
   51EF                    2257 00107$:
                           2258 ;src/keyboard.h:29: s = gladis_atk_abajo;
   51EF DD 36 FE 00   [19] 2259 	ld	-2 (ix),#<(_gladis_atk_abajo)
   51F3 DD 36 FF 43   [19] 2260 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2261 ;src/keyboard.h:31: }
   51F7 C3 C1 53      [10] 2262 	jp	00148$
   51FA                    2263 00147$:
                           2264 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   51FA 21 D2 6D      [10] 2265 	ld	hl, #(_player + 0x0008) + 0
   51FD 56            [ 7] 2266 	ld	d,(hl)
   51FE 7A            [ 4] 2267 	ld	a,d
   51FF D6 14         [ 7] 2268 	sub	a, #0x14
   5201 30 07         [12] 2269 	jr	NC,00110$
   5203 14            [ 4] 2270 	inc	d
   5204 21 D2 6D      [10] 2271 	ld	hl,#(_player + 0x0008)
   5207 72            [ 7] 2272 	ld	(hl),d
   5208 18 05         [12] 2273 	jr	00111$
   520A                    2274 00110$:
                           2275 ;src/keyboard.h:34: else player.atk = 20;
   520A 21 D2 6D      [10] 2276 	ld	hl,#(_player + 0x0008)
   520D 36 14         [10] 2277 	ld	(hl),#0x14
   520F                    2278 00111$:
                           2279 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   520F 21 00 02      [10] 2280 	ld	hl,#0x0200
   5212 CD 04 68      [17] 2281 	call	_cpct_isKeyPressed
                           2282 ;src/keyboard.h:37: player.dir = 6;
                           2283 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5215 7D            [ 4] 2284 	ld	a,l
   5216 B7            [ 4] 2285 	or	a, a
   5217 28 1E         [12] 2286 	jr	Z,00143$
   5219 21 CA 6D      [10] 2287 	ld	hl, #_player + 0
   521C 56            [ 7] 2288 	ld	d,(hl)
   521D 7A            [ 4] 2289 	ld	a,d
   521E D6 4C         [ 7] 2290 	sub	a, #0x4C
   5220 30 15         [12] 2291 	jr	NC,00143$
                           2292 ;src/keyboard.h:36: player.x += 1;
   5222 14            [ 4] 2293 	inc	d
   5223 21 CA 6D      [10] 2294 	ld	hl,#_player
   5226 72            [ 7] 2295 	ld	(hl),d
                           2296 ;src/keyboard.h:37: player.dir = 6;
   5227 21 D1 6D      [10] 2297 	ld	hl,#(_player + 0x0007)
   522A 36 06         [10] 2298 	ld	(hl),#0x06
                           2299 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   522C DD 36 FE 00   [19] 2300 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   5230 DD 36 FF 40   [19] 2301 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   5234 C3 C1 53      [10] 2302 	jp	00148$
   5237                    2303 00143$:
                           2304 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   5237 21 01 01      [10] 2305 	ld	hl,#0x0101
   523A CD 04 68      [17] 2306 	call	_cpct_isKeyPressed
   523D 7D            [ 4] 2307 	ld	a,l
   523E B7            [ 4] 2308 	or	a, a
   523F 28 1B         [12] 2309 	jr	Z,00139$
   5241 3A CA 6D      [13] 2310 	ld	a, (#_player + 0)
   5244 B7            [ 4] 2311 	or	a, a
   5245 28 15         [12] 2312 	jr	Z,00139$
                           2313 ;src/keyboard.h:40: player.x -= 1;
   5247 C6 FF         [ 7] 2314 	add	a,#0xFF
   5249 32 CA 6D      [13] 2315 	ld	(#_player),a
                           2316 ;src/keyboard.h:41: player.dir = 4;
   524C 21 D1 6D      [10] 2317 	ld	hl,#(_player + 0x0007)
   524F 36 04         [10] 2318 	ld	(hl),#0x04
                           2319 ;src/keyboard.h:42: s = gladis_quieto_izda;
   5251 DD 36 FE 80   [19] 2320 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5255 DD 36 FF 40   [19] 2321 	ld	-1 (ix),#>(_gladis_quieto_izda)
   5259 C3 C1 53      [10] 2322 	jp	00148$
   525C                    2323 00139$:
                           2324 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   525C 21 00 04      [10] 2325 	ld	hl,#0x0400
   525F CD 04 68      [17] 2326 	call	_cpct_isKeyPressed
   5262 01 CB 6D      [10] 2327 	ld	bc,#_player + 1
   5265 7D            [ 4] 2328 	ld	a,l
   5266 B7            [ 4] 2329 	or	a, a
   5267 28 1A         [12] 2330 	jr	Z,00135$
   5269 0A            [ 7] 2331 	ld	a,(bc)
   526A 67            [ 4] 2332 	ld	h,a
   526B D6 B4         [ 7] 2333 	sub	a, #0xB4
   526D 30 14         [12] 2334 	jr	NC,00135$
                           2335 ;src/keyboard.h:44: player.y += 2;
   526F 7C            [ 4] 2336 	ld	a,h
   5270 C6 02         [ 7] 2337 	add	a, #0x02
   5272 02            [ 7] 2338 	ld	(bc),a
                           2339 ;src/keyboard.h:45: player.dir = 2;
   5273 21 D1 6D      [10] 2340 	ld	hl,#(_player + 0x0007)
   5276 36 02         [10] 2341 	ld	(hl),#0x02
                           2342 ;src/keyboard.h:46: s = gladis_abajo;
   5278 DD 36 FE 80   [19] 2343 	ld	-2 (ix),#<(_gladis_abajo)
   527C DD 36 FF 42   [19] 2344 	ld	-1 (ix),#>(_gladis_abajo)
   5280 C3 C1 53      [10] 2345 	jp	00148$
   5283                    2346 00135$:
                           2347 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   5283 C5            [11] 2348 	push	bc
   5284 21 00 01      [10] 2349 	ld	hl,#0x0100
   5287 CD 04 68      [17] 2350 	call	_cpct_isKeyPressed
   528A 7D            [ 4] 2351 	ld	a,l
   528B C1            [10] 2352 	pop	bc
   528C B7            [ 4] 2353 	or	a, a
   528D 28 17         [12] 2354 	jr	Z,00131$
   528F 0A            [ 7] 2355 	ld	a,(bc)
   5290 B7            [ 4] 2356 	or	a, a
   5291 28 13         [12] 2357 	jr	Z,00131$
                           2358 ;src/keyboard.h:48: player.y -= 2;
   5293 C6 FE         [ 7] 2359 	add	a,#0xFE
   5295 02            [ 7] 2360 	ld	(bc),a
                           2361 ;src/keyboard.h:49: player.dir = 8;
   5296 21 D1 6D      [10] 2362 	ld	hl,#(_player + 0x0007)
   5299 36 08         [10] 2363 	ld	(hl),#0x08
                           2364 ;src/keyboard.h:50: s = gladis_arriba;
   529B DD 36 FE 00   [19] 2365 	ld	-2 (ix),#<(_gladis_arriba)
   529F DD 36 FF 42   [19] 2366 	ld	-1 (ix),#>(_gladis_arriba)
   52A3 C3 C1 53      [10] 2367 	jp	00148$
   52A6                    2368 00131$:
                           2369 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   52A6 C5            [11] 2370 	push	bc
   52A7 21 07 80      [10] 2371 	ld	hl,#0x8007
   52AA CD 04 68      [17] 2372 	call	_cpct_isKeyPressed
   52AD 7D            [ 4] 2373 	ld	a,l
   52AE C1            [10] 2374 	pop	bc
   52AF B7            [ 4] 2375 	or	a, a
   52B0 CA 81 53      [10] 2376 	jp	Z,00125$
   52B3 3A BC 6D      [13] 2377 	ld	a,(#_arrow + 0)
   52B6 B7            [ 4] 2378 	or	a, a
   52B7 C2 81 53      [10] 2379 	jp	NZ,00125$
   52BA 3A D2 6D      [13] 2380 	ld	a, (#(_player + 0x0008) + 0)
   52BD D6 14         [ 7] 2381 	sub	a, #0x14
   52BF C2 81 53      [10] 2382 	jp	NZ,00125$
   52C2 3A D4 6D      [13] 2383 	ld	a, (#(_player + 0x000a) + 0)
   52C5 B7            [ 4] 2384 	or	a, a
   52C6 CA 81 53      [10] 2385 	jp	Z,00125$
                           2386 ;src/keyboard.h:52: if(player.bullets> 0){
   52C9 B7            [ 4] 2387 	or	a, a
   52CA CA 7A 53      [10] 2388 	jp	Z,00118$
                           2389 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   52CD DD 36 FB A0   [19] 2390 	ld	-5 (ix),#<(_flecha_dcha)
   52D1 DD 36 FC 67   [19] 2391 	ld	-4 (ix),#>(_flecha_dcha)
   52D5 DD 36 FA 02   [19] 2392 	ld	-6 (ix),#0x02
   52D9 1E 08         [ 7] 2393 	ld	e,#0x08
                           2394 ;src/keyboard.h:54: switch(player.dir){
   52DB 21 D1 6D      [10] 2395 	ld	hl, #(_player + 0x0007) + 0
   52DE 56            [ 7] 2396 	ld	d,(hl)
   52DF 7A            [ 4] 2397 	ld	a,d
   52E0 D6 02         [ 7] 2398 	sub	a, #0x02
   52E2 28 31         [12] 2399 	jr	Z,00114$
   52E4 7A            [ 4] 2400 	ld	a,d
   52E5 D6 04         [ 7] 2401 	sub	a, #0x04
   52E7 28 1C         [12] 2402 	jr	Z,00113$
   52E9 7A            [ 4] 2403 	ld	a,d
   52EA D6 06         [ 7] 2404 	sub	a, #0x06
   52EC 28 07         [12] 2405 	jr	Z,00112$
   52EE 7A            [ 4] 2406 	ld	a,d
   52EF D6 08         [ 7] 2407 	sub	a, #0x08
   52F1 28 32         [12] 2408 	jr	Z,00115$
   52F3 18 3E         [12] 2409 	jr	00116$
                           2410 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   52F5                    2411 00112$:
   52F5 DD 36 FB A0   [19] 2412 	ld	-5 (ix),#<(_flecha_dcha)
   52F9 DD 36 FC 67   [19] 2413 	ld	-4 (ix),#>(_flecha_dcha)
   52FD DD 36 FA 04   [19] 2414 	ld	-6 (ix),#0x04
   5301 1E 04         [ 7] 2415 	ld	e,#0x04
   5303 18 2E         [12] 2416 	jr	00116$
                           2417 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   5305                    2418 00113$:
   5305 DD 36 FB C0   [19] 2419 	ld	-5 (ix),#<(_flecha_izda)
   5309 DD 36 FC 67   [19] 2420 	ld	-4 (ix),#>(_flecha_izda)
   530D DD 36 FA 04   [19] 2421 	ld	-6 (ix),#0x04
   5311 1E 04         [ 7] 2422 	ld	e,#0x04
   5313 18 1E         [12] 2423 	jr	00116$
                           2424 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   5315                    2425 00114$:
   5315 DD 36 FB 80   [19] 2426 	ld	-5 (ix),#<(_flecha_abajo)
   5319 DD 36 FC 67   [19] 2427 	ld	-4 (ix),#>(_flecha_abajo)
   531D DD 36 FA 02   [19] 2428 	ld	-6 (ix),#0x02
   5321 1E 08         [ 7] 2429 	ld	e,#0x08
   5323 18 0E         [12] 2430 	jr	00116$
                           2431 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   5325                    2432 00115$:
   5325 DD 36 FB 60   [19] 2433 	ld	-5 (ix),#<(_flecha_arriba)
   5329 DD 36 FC 67   [19] 2434 	ld	-4 (ix),#>(_flecha_arriba)
   532D DD 36 FA 02   [19] 2435 	ld	-6 (ix),#0x02
   5331 1E 08         [ 7] 2436 	ld	e,#0x08
                           2437 ;src/keyboard.h:59: }
   5333                    2438 00116$:
                           2439 ;src/keyboard.h:60: player.atk = 0;
   5333 21 D2 6D      [10] 2440 	ld	hl,#(_player + 0x0008)
   5336 36 00         [10] 2441 	ld	(hl),#0x00
                           2442 ;src/keyboard.h:61: object.x = player.x;
   5338 3A CA 6D      [13] 2443 	ld	a, (#_player + 0)
   533B 32 C0 6D      [13] 2444 	ld	(#_object),a
                           2445 ;src/keyboard.h:62: object.y = player.y+8;
   533E 0A            [ 7] 2446 	ld	a,(bc)
   533F C6 08         [ 7] 2447 	add	a, #0x08
   5341 32 C1 6D      [13] 2448 	ld	(#(_object + 0x0001)),a
                           2449 ;src/keyboard.h:63: object.x = object.x;
   5344 21 C0 6D      [10] 2450 	ld	hl, #_object + 0
   5347 56            [ 7] 2451 	ld	d,(hl)
   5348 21 C0 6D      [10] 2452 	ld	hl,#_object
   534B 72            [ 7] 2453 	ld	(hl),d
                           2454 ;src/keyboard.h:64: object.y = object.y;
   534C 32 C1 6D      [13] 2455 	ld	(#(_object + 0x0001)),a
                           2456 ;src/keyboard.h:65: object.sprite = spr;
   534F 21 C4 6D      [10] 2457 	ld	hl,#_object + 4
   5352 DD 7E FB      [19] 2458 	ld	a,-5 (ix)
   5355 77            [ 7] 2459 	ld	(hl),a
   5356 23            [ 6] 2460 	inc	hl
   5357 DD 7E FC      [19] 2461 	ld	a,-4 (ix)
   535A 77            [ 7] 2462 	ld	(hl),a
                           2463 ;src/keyboard.h:66: object.vivo = 1;
   535B 21 C6 6D      [10] 2464 	ld	hl,#_object + 6
   535E 36 01         [10] 2465 	ld	(hl),#0x01
                           2466 ;src/keyboard.h:67: object.dir = player.dir;
   5360 01 C7 6D      [10] 2467 	ld	bc,#_object + 7
   5363 3A D1 6D      [13] 2468 	ld	a, (#(_player + 0x0007) + 0)
   5366 02            [ 7] 2469 	ld	(bc),a
                           2470 ;src/keyboard.h:68: object.sizeX = xs;
   5367 21 C8 6D      [10] 2471 	ld	hl,#_object + 8
   536A DD 7E FA      [19] 2472 	ld	a,-6 (ix)
   536D 77            [ 7] 2473 	ld	(hl),a
                           2474 ;src/keyboard.h:69: object.sizeY = ys;
   536E 21 C9 6D      [10] 2475 	ld	hl,#_object + 9
   5371 73            [ 7] 2476 	ld	(hl),e
                           2477 ;src/keyboard.h:70: player.bullets--;
   5372 3A D4 6D      [13] 2478 	ld	a, (#(_player + 0x000a) + 0)
   5375 C6 FF         [ 7] 2479 	add	a,#0xFF
   5377 32 D4 6D      [13] 2480 	ld	(#(_player + 0x000a)),a
   537A                    2481 00118$:
                           2482 ;src/keyboard.h:72: arrow=1;
   537A 21 BC 6D      [10] 2483 	ld	hl,#_arrow + 0
   537D 36 01         [10] 2484 	ld	(hl), #0x01
   537F 18 40         [12] 2485 	jr	00148$
   5381                    2486 00125$:
                           2487 ;src/keyboard.h:74: switch(player.dir){
   5381 21 D1 6D      [10] 2488 	ld	hl, #(_player + 0x0007) + 0
   5384 66            [ 7] 2489 	ld	h,(hl)
   5385 7C            [ 4] 2490 	ld	a,h
   5386 D6 02         [ 7] 2491 	sub	a, #0x02
   5388 28 2F         [12] 2492 	jr	Z,00122$
   538A 7C            [ 4] 2493 	ld	a,h
   538B D6 04         [ 7] 2494 	sub	a, #0x04
   538D 28 0C         [12] 2495 	jr	Z,00119$
   538F 7C            [ 4] 2496 	ld	a,h
   5390 D6 06         [ 7] 2497 	sub	a, #0x06
   5392 28 11         [12] 2498 	jr	Z,00120$
   5394 7C            [ 4] 2499 	ld	a,h
   5395 D6 08         [ 7] 2500 	sub	a, #0x08
   5397 28 16         [12] 2501 	jr	Z,00121$
   5399 18 26         [12] 2502 	jr	00148$
                           2503 ;src/keyboard.h:75: case 4:
   539B                    2504 00119$:
                           2505 ;src/keyboard.h:76: s = gladis_quieto_izda;
   539B DD 36 FE 80   [19] 2506 	ld	-2 (ix),#<(_gladis_quieto_izda)
   539F DD 36 FF 40   [19] 2507 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           2508 ;src/keyboard.h:77: break;
   53A3 18 1C         [12] 2509 	jr	00148$
                           2510 ;src/keyboard.h:78: case 6:
   53A5                    2511 00120$:
                           2512 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   53A5 DD 36 FE 00   [19] 2513 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   53A9 DD 36 FF 40   [19] 2514 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           2515 ;src/keyboard.h:80: break;
   53AD 18 12         [12] 2516 	jr	00148$
                           2517 ;src/keyboard.h:81: case 8:
   53AF                    2518 00121$:
                           2519 ;src/keyboard.h:82: s = gladis_arriba;
   53AF DD 36 FE 00   [19] 2520 	ld	-2 (ix),#<(_gladis_arriba)
   53B3 DD 36 FF 42   [19] 2521 	ld	-1 (ix),#>(_gladis_arriba)
                           2522 ;src/keyboard.h:83: break;
   53B7 18 08         [12] 2523 	jr	00148$
                           2524 ;src/keyboard.h:84: case 2:
   53B9                    2525 00122$:
                           2526 ;src/keyboard.h:85: s = gladis_abajo;
   53B9 DD 36 FE 80   [19] 2527 	ld	-2 (ix),#<(_gladis_abajo)
   53BD DD 36 FF 42   [19] 2528 	ld	-1 (ix),#>(_gladis_abajo)
                           2529 ;src/keyboard.h:87: }
   53C1                    2530 00148$:
                           2531 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   53C1 21 04 10      [10] 2532 	ld	hl,#0x1004
   53C4 CD 04 68      [17] 2533 	call	_cpct_isKeyPressed
   53C7 7D            [ 4] 2534 	ld	a,l
   53C8 B7            [ 4] 2535 	or	a, a
   53C9 28 05         [12] 2536 	jr	Z,00151$
                           2537 ;src/keyboard.h:94: arrow = 0;
   53CB 21 BC 6D      [10] 2538 	ld	hl,#_arrow + 0
   53CE 36 00         [10] 2539 	ld	(hl), #0x00
   53D0                    2540 00151$:
                           2541 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   53D0 21 08 04      [10] 2542 	ld	hl,#0x0408
   53D3 CD 04 68      [17] 2543 	call	_cpct_isKeyPressed
   53D6 7D            [ 4] 2544 	ld	a,l
   53D7 B7            [ 4] 2545 	or	a, a
   53D8 28 05         [12] 2546 	jr	Z,00153$
                           2547 ;src/keyboard.h:97: finish = 1;
   53DA 21 BB 6D      [10] 2548 	ld	hl,#_finish + 0
   53DD 36 01         [10] 2549 	ld	(hl), #0x01
   53DF                    2550 00153$:
                           2551 ;src/keyboard.h:99: return s;
   53DF DD 6E FE      [19] 2552 	ld	l,-2 (ix)
   53E2 DD 66 FF      [19] 2553 	ld	h,-1 (ix)
   53E5 DD F9         [10] 2554 	ld	sp, ix
   53E7 DD E1         [14] 2555 	pop	ix
   53E9 C9            [10] 2556 	ret
                           2557 ;src/keyboard.h:102: void moveObject(){
                           2558 ;	---------------------------------
                           2559 ; Function moveObject
                           2560 ; ---------------------------------
   53EA                    2561 _moveObject::
                           2562 ;src/keyboard.h:103: object.lx = object.x;
   53EA 01 C0 6D      [10] 2563 	ld	bc,#_object+0
   53ED 0A            [ 7] 2564 	ld	a,(bc)
   53EE 32 C2 6D      [13] 2565 	ld	(#(_object + 0x0002)),a
                           2566 ;src/keyboard.h:104: object.ly = object.y;
   53F1 59            [ 4] 2567 	ld	e, c
   53F2 50            [ 4] 2568 	ld	d, b
   53F3 13            [ 6] 2569 	inc	de
   53F4 1A            [ 7] 2570 	ld	a,(de)
   53F5 32 C3 6D      [13] 2571 	ld	(#(_object + 0x0003)),a
                           2572 ;src/keyboard.h:105: switch(object.dir){
   53F8 3A C7 6D      [13] 2573 	ld	a,(#_object + 7)
   53FB FE 02         [ 7] 2574 	cp	a,#0x02
   53FD 28 16         [12] 2575 	jr	Z,00103$
   53FF FE 04         [ 7] 2576 	cp	a,#0x04
   5401 28 0D         [12] 2577 	jr	Z,00102$
   5403 FE 06         [ 7] 2578 	cp	a,#0x06
   5405 28 05         [12] 2579 	jr	Z,00101$
   5407 D6 08         [ 7] 2580 	sub	a, #0x08
   5409 28 0F         [12] 2581 	jr	Z,00104$
   540B C9            [10] 2582 	ret
                           2583 ;src/keyboard.h:106: case 6: object.x += 1; break;
   540C                    2584 00101$:
   540C 0A            [ 7] 2585 	ld	a,(bc)
   540D 3C            [ 4] 2586 	inc	a
   540E 02            [ 7] 2587 	ld	(bc),a
   540F C9            [10] 2588 	ret
                           2589 ;src/keyboard.h:107: case 4: object.x -= 1; break;
   5410                    2590 00102$:
   5410 0A            [ 7] 2591 	ld	a,(bc)
   5411 C6 FF         [ 7] 2592 	add	a,#0xFF
   5413 02            [ 7] 2593 	ld	(bc),a
   5414 C9            [10] 2594 	ret
                           2595 ;src/keyboard.h:108: case 2: object.y += 2; break;
   5415                    2596 00103$:
   5415 1A            [ 7] 2597 	ld	a,(de)
   5416 C6 02         [ 7] 2598 	add	a, #0x02
   5418 12            [ 7] 2599 	ld	(de),a
   5419 C9            [10] 2600 	ret
                           2601 ;src/keyboard.h:109: case 8: object.y -= 2; break;
   541A                    2602 00104$:
   541A 1A            [ 7] 2603 	ld	a,(de)
   541B C6 FE         [ 7] 2604 	add	a,#0xFE
   541D 12            [ 7] 2605 	ld	(de),a
                           2606 ;src/keyboard.h:110: }
   541E C9            [10] 2607 	ret
                           2608 ;src/main.c:37: void init(){
                           2609 ;	---------------------------------
                           2610 ; Function init
                           2611 ; ---------------------------------
   541F                    2612 _init::
                           2613 ;src/main.c:38: cpct_disableFirmware();
   541F CD 31 6B      [17] 2614 	call	_cpct_disableFirmware
                           2615 ;src/main.c:39: cpct_setVideoMode(0);
   5422 AF            [ 4] 2616 	xor	a, a
   5423 F5            [11] 2617 	push	af
   5424 33            [ 6] 2618 	inc	sp
   5425 CD 0E 6B      [17] 2619 	call	_cpct_setVideoMode
   5428 33            [ 6] 2620 	inc	sp
                           2621 ;src/main.c:40: cpct_fw2hw(g_palette,4);
   5429 11 0E 49      [10] 2622 	ld	de,#_g_palette
   542C 3E 04         [ 7] 2623 	ld	a,#0x04
   542E F5            [11] 2624 	push	af
   542F 33            [ 6] 2625 	inc	sp
   5430 D5            [11] 2626 	push	de
   5431 CD 98 6A      [17] 2627 	call	_cpct_fw2hw
   5434 F1            [10] 2628 	pop	af
   5435 33            [ 6] 2629 	inc	sp
                           2630 ;src/main.c:41: cpct_setPalette(g_palette,4);
   5436 11 0E 49      [10] 2631 	ld	de,#_g_palette
   5439 3E 04         [ 7] 2632 	ld	a,#0x04
   543B F5            [11] 2633 	push	af
   543C 33            [ 6] 2634 	inc	sp
   543D D5            [11] 2635 	push	de
   543E CD E0 67      [17] 2636 	call	_cpct_setPalette
   5441 F1            [10] 2637 	pop	af
   5442 33            [ 6] 2638 	inc	sp
   5443 C9            [10] 2639 	ret
                           2640 ;src/main.c:44: void initPlayer(){
                           2641 ;	---------------------------------
                           2642 ; Function initPlayer
                           2643 ; ---------------------------------
   5444                    2644 _initPlayer::
                           2645 ;src/main.c:45: u8 *sprite = gladis_quieto_dcha;
                           2646 ;src/main.c:46: player.x = origins[0][0];
   5444 01 13 49      [10] 2647 	ld	bc,#_origins+0
   5447 0A            [ 7] 2648 	ld	a,(bc)
   5448 32 CA 6D      [13] 2649 	ld	(#_player),a
                           2650 ;src/main.c:47: player.y = origins[0][1];
   544B 59            [ 4] 2651 	ld	e, c
   544C 50            [ 4] 2652 	ld	d, b
   544D 13            [ 6] 2653 	inc	de
   544E 1A            [ 7] 2654 	ld	a,(de)
   544F 32 CB 6D      [13] 2655 	ld	(#(_player + 0x0001)),a
                           2656 ;src/main.c:48: player.lx = origins[0][0];
   5452 0A            [ 7] 2657 	ld	a,(bc)
   5453 32 CC 6D      [13] 2658 	ld	(#(_player + 0x0002)),a
                           2659 ;src/main.c:49: player.ly = origins[0][1];
   5456 1A            [ 7] 2660 	ld	a,(de)
   5457 32 CD 6D      [13] 2661 	ld	(#(_player + 0x0003)),a
                           2662 ;src/main.c:50: player.sprite = sprite;
   545A 21 00 40      [10] 2663 	ld	hl,#_gladis_quieto_dcha
   545D 22 CE 6D      [16] 2664 	ld	((_player + 0x0004)), hl
                           2665 ;src/main.c:51: player.life = 3;
   5460 21 D0 6D      [10] 2666 	ld	hl,#_player + 6
   5463 36 03         [10] 2667 	ld	(hl),#0x03
                           2668 ;src/main.c:52: player.dir = 6;
   5465 21 D1 6D      [10] 2669 	ld	hl,#_player + 7
   5468 36 06         [10] 2670 	ld	(hl),#0x06
                           2671 ;src/main.c:53: player.atk = 20;
   546A 21 D2 6D      [10] 2672 	ld	hl,#_player + 8
   546D 36 14         [10] 2673 	ld	(hl),#0x14
                           2674 ;src/main.c:54: player.latk = 20;
   546F 21 D3 6D      [10] 2675 	ld	hl,#_player + 9
   5472 36 14         [10] 2676 	ld	(hl),#0x14
                           2677 ;src/main.c:55: player.bullets = 3;
   5474 21 D4 6D      [10] 2678 	ld	hl,#_player + 10
   5477 36 03         [10] 2679 	ld	(hl),#0x03
   5479 C9            [10] 2680 	ret
                           2681 ;src/main.c:58: void initEnemies(){
                           2682 ;	---------------------------------
                           2683 ; Function initEnemies
                           2684 ; ---------------------------------
   547A                    2685 _initEnemies::
                           2686 ;src/main.c:59: u8 *sprite = chacho_dcha;
                           2687 ;src/main.c:60: enemy.x = origins[1][0];
   547A 01 15 49      [10] 2688 	ld	bc,#_origins + 2
   547D 0A            [ 7] 2689 	ld	a,(bc)
   547E 32 D5 6D      [13] 2690 	ld	(#_enemy),a
                           2691 ;src/main.c:61: enemy.y = origins[1][1];
   5481 11 16 49      [10] 2692 	ld	de,#_origins + 3
   5484 1A            [ 7] 2693 	ld	a,(de)
   5485 32 D6 6D      [13] 2694 	ld	(#(_enemy + 0x0001)),a
                           2695 ;src/main.c:62: enemy.lx = origins[1][0];
   5488 0A            [ 7] 2696 	ld	a,(bc)
   5489 32 D7 6D      [13] 2697 	ld	(#(_enemy + 0x0002)),a
                           2698 ;src/main.c:63: enemy.ly = origins[1][1];
   548C 1A            [ 7] 2699 	ld	a,(de)
   548D 32 D8 6D      [13] 2700 	ld	(#(_enemy + 0x0003)),a
                           2701 ;src/main.c:64: enemy.ox = origins[1][0];
   5490 0A            [ 7] 2702 	ld	a,(bc)
   5491 32 D9 6D      [13] 2703 	ld	(#(_enemy + 0x0004)),a
                           2704 ;src/main.c:65: enemy.oy = origins[1][1];
   5494 1A            [ 7] 2705 	ld	a,(de)
   5495 32 DA 6D      [13] 2706 	ld	(#(_enemy + 0x0005)),a
                           2707 ;src/main.c:66: enemy.sprite = sprite;
   5498 21 00 44      [10] 2708 	ld	hl,#_chacho_dcha
   549B 22 DB 6D      [16] 2709 	ld	((_enemy + 0x0006)), hl
                           2710 ;src/main.c:67: enemy.life = 3;
   549E 21 DD 6D      [10] 2711 	ld	hl,#_enemy + 8
   54A1 36 03         [10] 2712 	ld	(hl),#0x03
                           2713 ;src/main.c:68: enemy.dir = 6;
   54A3 21 DE 6D      [10] 2714 	ld	hl,#_enemy + 9
   54A6 36 06         [10] 2715 	ld	(hl),#0x06
                           2716 ;src/main.c:69: enemy.bullets = 3;
   54A8 21 DF 6D      [10] 2717 	ld	hl,#_enemy + 10
   54AB 36 03         [10] 2718 	ld	(hl),#0x03
                           2719 ;src/main.c:70: enemy.room = 3;
   54AD 21 E0 6D      [10] 2720 	ld	hl,#_enemy + 11
   54B0 36 03         [10] 2721 	ld	(hl),#0x03
   54B2 C9            [10] 2722 	ret
                           2723 ;src/main.c:75: void gameOver(){
                           2724 ;	---------------------------------
                           2725 ; Function gameOver
                           2726 ; ---------------------------------
   54B3                    2727 _gameOver::
                           2728 ;src/main.c:77: cpct_clearScreen(0);
   54B3 21 00 40      [10] 2729 	ld	hl,#0x4000
   54B6 E5            [11] 2730 	push	hl
   54B7 AF            [ 4] 2731 	xor	a, a
   54B8 F5            [11] 2732 	push	af
   54B9 33            [ 6] 2733 	inc	sp
   54BA 26 C0         [ 7] 2734 	ld	h, #0xC0
   54BC E5            [11] 2735 	push	hl
   54BD CD 20 6B      [17] 2736 	call	_cpct_memset
                           2737 ;src/main.c:78: memptr = cpct_getScreenPtr(VMEM,10,10);
   54C0 21 0A 0A      [10] 2738 	ld	hl,#0x0A0A
   54C3 E5            [11] 2739 	push	hl
   54C4 21 00 C0      [10] 2740 	ld	hl,#0xC000
   54C7 E5            [11] 2741 	push	hl
   54C8 CD 13 6C      [17] 2742 	call	_cpct_getScreenPtr
                           2743 ;src/main.c:79: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   54CB 4D            [ 4] 2744 	ld	c, l
   54CC 44            [ 4] 2745 	ld	b, h
   54CD 11 DF 54      [10] 2746 	ld	de,#___str_0
   54D0 21 01 00      [10] 2747 	ld	hl,#0x0001
   54D3 E5            [11] 2748 	push	hl
   54D4 C5            [11] 2749 	push	bc
   54D5 D5            [11] 2750 	push	de
   54D6 CD F1 68      [17] 2751 	call	_cpct_drawStringM0
   54D9 21 06 00      [10] 2752 	ld	hl,#6
   54DC 39            [11] 2753 	add	hl,sp
   54DD F9            [ 6] 2754 	ld	sp,hl
   54DE C9            [10] 2755 	ret
   54DF                    2756 ___str_0:
   54DF 4C 6F 75 6E 67 65  2757 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   54EF 00                 2758 	.db 0x00
                           2759 ;src/main.c:84: int menu(){
                           2760 ;	---------------------------------
                           2761 ; Function menu
                           2762 ; ---------------------------------
   54F0                    2763 _menu::
   54F0 DD E5         [15] 2764 	push	ix
   54F2 DD 21 00 00   [14] 2765 	ld	ix,#0
   54F6 DD 39         [15] 2766 	add	ix,sp
   54F8 21 FA FF      [10] 2767 	ld	hl,#-6
   54FB 39            [11] 2768 	add	hl,sp
   54FC F9            [ 6] 2769 	ld	sp,hl
                           2770 ;src/main.c:86: int init = 50;
   54FD DD 36 FC 32   [19] 2771 	ld	-4 (ix),#0x32
   5501 DD 36 FD 00   [19] 2772 	ld	-3 (ix),#0x00
                           2773 ;src/main.c:87: int pushed =0;
   5505 21 00 00      [10] 2774 	ld	hl,#0x0000
   5508 E3            [19] 2775 	ex	(sp), hl
                           2776 ;src/main.c:88: int cont =0;
   5509 11 00 00      [10] 2777 	ld	de,#0x0000
                           2778 ;src/main.c:89: cpct_clearScreen(0);
   550C D5            [11] 2779 	push	de
   550D 21 00 40      [10] 2780 	ld	hl,#0x4000
   5510 E5            [11] 2781 	push	hl
   5511 AF            [ 4] 2782 	xor	a, a
   5512 F5            [11] 2783 	push	af
   5513 33            [ 6] 2784 	inc	sp
   5514 26 C0         [ 7] 2785 	ld	h, #0xC0
   5516 E5            [11] 2786 	push	hl
   5517 CD 20 6B      [17] 2787 	call	_cpct_memset
   551A 21 0A 0A      [10] 2788 	ld	hl,#0x0A0A
   551D E5            [11] 2789 	push	hl
   551E 21 00 C0      [10] 2790 	ld	hl,#0xC000
   5521 E5            [11] 2791 	push	hl
   5522 CD 13 6C      [17] 2792 	call	_cpct_getScreenPtr
   5525 D1            [10] 2793 	pop	de
                           2794 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5526 4D            [ 4] 2795 	ld	c, l
   5527 44            [ 4] 2796 	ld	b, h
   5528 D5            [11] 2797 	push	de
   5529 21 01 00      [10] 2798 	ld	hl,#0x0001
   552C E5            [11] 2799 	push	hl
   552D C5            [11] 2800 	push	bc
   552E 21 D3 56      [10] 2801 	ld	hl,#___str_1
   5531 E5            [11] 2802 	push	hl
   5532 CD F1 68      [17] 2803 	call	_cpct_drawStringM0
   5535 21 06 00      [10] 2804 	ld	hl,#6
   5538 39            [11] 2805 	add	hl,sp
   5539 F9            [ 6] 2806 	ld	sp,hl
   553A 21 14 32      [10] 2807 	ld	hl,#0x3214
   553D E5            [11] 2808 	push	hl
   553E 21 00 C0      [10] 2809 	ld	hl,#0xC000
   5541 E5            [11] 2810 	push	hl
   5542 CD 13 6C      [17] 2811 	call	_cpct_getScreenPtr
   5545 D1            [10] 2812 	pop	de
                           2813 ;src/main.c:96: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   5546 4D            [ 4] 2814 	ld	c, l
   5547 44            [ 4] 2815 	ld	b, h
   5548 D5            [11] 2816 	push	de
   5549 21 01 00      [10] 2817 	ld	hl,#0x0001
   554C E5            [11] 2818 	push	hl
   554D C5            [11] 2819 	push	bc
   554E 21 E4 56      [10] 2820 	ld	hl,#___str_2
   5551 E5            [11] 2821 	push	hl
   5552 CD F1 68      [17] 2822 	call	_cpct_drawStringM0
   5555 21 06 00      [10] 2823 	ld	hl,#6
   5558 39            [11] 2824 	add	hl,sp
   5559 F9            [ 6] 2825 	ld	sp,hl
   555A 21 14 46      [10] 2826 	ld	hl,#0x4614
   555D E5            [11] 2827 	push	hl
   555E 21 00 C0      [10] 2828 	ld	hl,#0xC000
   5561 E5            [11] 2829 	push	hl
   5562 CD 13 6C      [17] 2830 	call	_cpct_getScreenPtr
   5565 D1            [10] 2831 	pop	de
                           2832 ;src/main.c:99: cpct_drawStringM0("Creditos",memptr,1,0);
   5566 4D            [ 4] 2833 	ld	c, l
   5567 44            [ 4] 2834 	ld	b, h
   5568 D5            [11] 2835 	push	de
   5569 21 01 00      [10] 2836 	ld	hl,#0x0001
   556C E5            [11] 2837 	push	hl
   556D C5            [11] 2838 	push	bc
   556E 21 F2 56      [10] 2839 	ld	hl,#___str_3
   5571 E5            [11] 2840 	push	hl
   5572 CD F1 68      [17] 2841 	call	_cpct_drawStringM0
   5575 21 06 00      [10] 2842 	ld	hl,#6
   5578 39            [11] 2843 	add	hl,sp
   5579 F9            [ 6] 2844 	ld	sp,hl
   557A 21 14 5A      [10] 2845 	ld	hl,#0x5A14
   557D E5            [11] 2846 	push	hl
   557E 21 00 C0      [10] 2847 	ld	hl,#0xC000
   5581 E5            [11] 2848 	push	hl
   5582 CD 13 6C      [17] 2849 	call	_cpct_getScreenPtr
   5585 D1            [10] 2850 	pop	de
                           2851 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5586 DD 75 FE      [19] 2852 	ld	-2 (ix),l
   5589 DD 74 FF      [19] 2853 	ld	-1 (ix),h
                           2854 ;src/main.c:102: cpct_drawStringM0("Salir",memptr,1,0);
   558C 01 FB 56      [10] 2855 	ld	bc,#___str_4
   558F D5            [11] 2856 	push	de
   5590 21 01 00      [10] 2857 	ld	hl,#0x0001
   5593 E5            [11] 2858 	push	hl
   5594 DD 6E FE      [19] 2859 	ld	l,-2 (ix)
   5597 DD 66 FF      [19] 2860 	ld	h,-1 (ix)
   559A E5            [11] 2861 	push	hl
   559B C5            [11] 2862 	push	bc
   559C CD F1 68      [17] 2863 	call	_cpct_drawStringM0
   559F 21 06 00      [10] 2864 	ld	hl,#6
   55A2 39            [11] 2865 	add	hl,sp
   55A3 F9            [ 6] 2866 	ld	sp,hl
   55A4 D1            [10] 2867 	pop	de
                           2868 ;src/main.c:108: while(1){
   55A5                    2869 00118$:
                           2870 ;src/main.c:110: cpct_scanKeyboard();
   55A5 D5            [11] 2871 	push	de
   55A6 CD 33 6C      [17] 2872 	call	_cpct_scanKeyboard
   55A9 21 00 04      [10] 2873 	ld	hl,#0x0400
   55AC CD 04 68      [17] 2874 	call	_cpct_isKeyPressed
   55AF 7D            [ 4] 2875 	ld	a,l
   55B0 D1            [10] 2876 	pop	de
   55B1 B7            [ 4] 2877 	or	a, a
   55B2 28 2D         [12] 2878 	jr	Z,00102$
   55B4 3E 96         [ 7] 2879 	ld	a,#0x96
   55B6 BB            [ 4] 2880 	cp	a, e
   55B7 3E 00         [ 7] 2881 	ld	a,#0x00
   55B9 9A            [ 4] 2882 	sbc	a, d
   55BA E2 BF 55      [10] 2883 	jp	PO, 00162$
   55BD EE 80         [ 7] 2884 	xor	a, #0x80
   55BF                    2885 00162$:
   55BF F2 E1 55      [10] 2886 	jp	P,00102$
                           2887 ;src/main.c:112: cpct_drawSolidBox(memptr, 0, 2, 8);
   55C2 21 02 08      [10] 2888 	ld	hl,#0x0802
   55C5 E5            [11] 2889 	push	hl
   55C6 AF            [ 4] 2890 	xor	a, a
   55C7 F5            [11] 2891 	push	af
   55C8 33            [ 6] 2892 	inc	sp
   55C9 DD 6E FE      [19] 2893 	ld	l,-2 (ix)
   55CC DD 66 FF      [19] 2894 	ld	h,-1 (ix)
   55CF E5            [11] 2895 	push	hl
   55D0 CD 42 6B      [17] 2896 	call	_cpct_drawSolidBox
   55D3 F1            [10] 2897 	pop	af
   55D4 F1            [10] 2898 	pop	af
   55D5 33            [ 6] 2899 	inc	sp
                           2900 ;src/main.c:113: pushed ++;
   55D6 DD 34 FA      [23] 2901 	inc	-6 (ix)
   55D9 20 03         [12] 2902 	jr	NZ,00163$
   55DB DD 34 FB      [23] 2903 	inc	-5 (ix)
   55DE                    2904 00163$:
                           2905 ;src/main.c:114: cont =0;
   55DE 11 00 00      [10] 2906 	ld	de,#0x0000
   55E1                    2907 00102$:
                           2908 ;src/main.c:116: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   55E1 D5            [11] 2909 	push	de
   55E2 21 00 01      [10] 2910 	ld	hl,#0x0100
   55E5 CD 04 68      [17] 2911 	call	_cpct_isKeyPressed
   55E8 7D            [ 4] 2912 	ld	a,l
   55E9 D1            [10] 2913 	pop	de
   55EA B7            [ 4] 2914 	or	a, a
   55EB 28 29         [12] 2915 	jr	Z,00105$
   55ED 3E 96         [ 7] 2916 	ld	a,#0x96
   55EF BB            [ 4] 2917 	cp	a, e
   55F0 3E 00         [ 7] 2918 	ld	a,#0x00
   55F2 9A            [ 4] 2919 	sbc	a, d
   55F3 E2 F8 55      [10] 2920 	jp	PO, 00164$
   55F6 EE 80         [ 7] 2921 	xor	a, #0x80
   55F8                    2922 00164$:
   55F8 F2 16 56      [10] 2923 	jp	P,00105$
                           2924 ;src/main.c:117: cpct_drawSolidBox(memptr, 0, 2, 8);
   55FB 21 02 08      [10] 2925 	ld	hl,#0x0802
   55FE E5            [11] 2926 	push	hl
   55FF AF            [ 4] 2927 	xor	a, a
   5600 F5            [11] 2928 	push	af
   5601 33            [ 6] 2929 	inc	sp
   5602 DD 6E FE      [19] 2930 	ld	l,-2 (ix)
   5605 DD 66 FF      [19] 2931 	ld	h,-1 (ix)
   5608 E5            [11] 2932 	push	hl
   5609 CD 42 6B      [17] 2933 	call	_cpct_drawSolidBox
   560C F1            [10] 2934 	pop	af
   560D F1            [10] 2935 	pop	af
   560E 33            [ 6] 2936 	inc	sp
                           2937 ;src/main.c:118: pushed --;
   560F E1            [10] 2938 	pop	hl
   5610 E5            [11] 2939 	push	hl
   5611 2B            [ 6] 2940 	dec	hl
   5612 E3            [19] 2941 	ex	(sp), hl
                           2942 ;src/main.c:119: cont = 0;
   5613 11 00 00      [10] 2943 	ld	de,#0x0000
   5616                    2944 00105$:
                           2945 ;src/main.c:122: switch (pushed){
   5616 DD 7E FB      [19] 2946 	ld	a,-5 (ix)
   5619 07            [ 4] 2947 	rlca
   561A E6 01         [ 7] 2948 	and	a,#0x01
   561C 47            [ 4] 2949 	ld	b,a
   561D 3E 02         [ 7] 2950 	ld	a,#0x02
   561F DD BE FA      [19] 2951 	cp	a, -6 (ix)
   5622 3E 00         [ 7] 2952 	ld	a,#0x00
   5624 DD 9E FB      [19] 2953 	sbc	a, -5 (ix)
   5627 E2 2C 56      [10] 2954 	jp	PO, 00165$
   562A EE 80         [ 7] 2955 	xor	a, #0x80
   562C                    2956 00165$:
   562C 07            [ 4] 2957 	rlca
   562D E6 01         [ 7] 2958 	and	a,#0x01
   562F 4F            [ 4] 2959 	ld	c,a
   5630 78            [ 4] 2960 	ld	a,b
   5631 B7            [ 4] 2961 	or	a,a
   5632 20 32         [12] 2962 	jr	NZ,00110$
   5634 B1            [ 4] 2963 	or	a,c
   5635 20 2F         [12] 2964 	jr	NZ,00110$
   5637 D5            [11] 2965 	push	de
   5638 DD 5E FA      [19] 2966 	ld	e,-6 (ix)
   563B 16 00         [ 7] 2967 	ld	d,#0x00
   563D 21 44 56      [10] 2968 	ld	hl,#00166$
   5640 19            [11] 2969 	add	hl,de
   5641 19            [11] 2970 	add	hl,de
                           2971 ;src/main.c:123: case 0: init = 50;break;
   5642 D1            [10] 2972 	pop	de
   5643 E9            [ 4] 2973 	jp	(hl)
   5644                    2974 00166$:
   5644 18 04         [12] 2975 	jr	00107$
   5646 18 0C         [12] 2976 	jr	00108$
   5648 18 14         [12] 2977 	jr	00109$
   564A                    2978 00107$:
   564A DD 36 FC 32   [19] 2979 	ld	-4 (ix),#0x32
   564E DD 36 FD 00   [19] 2980 	ld	-3 (ix),#0x00
   5652 18 12         [12] 2981 	jr	00110$
                           2982 ;src/main.c:124: case 1: init = 70;break;
   5654                    2983 00108$:
   5654 DD 36 FC 46   [19] 2984 	ld	-4 (ix),#0x46
   5658 DD 36 FD 00   [19] 2985 	ld	-3 (ix),#0x00
   565C 18 08         [12] 2986 	jr	00110$
                           2987 ;src/main.c:125: case 2: init = 90;break;
   565E                    2988 00109$:
   565E DD 36 FC 5A   [19] 2989 	ld	-4 (ix),#0x5A
   5662 DD 36 FD 00   [19] 2990 	ld	-3 (ix),#0x00
                           2991 ;src/main.c:126: }
   5666                    2992 00110$:
                           2993 ;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,15,init);
   5666 DD 66 FC      [19] 2994 	ld	h,-4 (ix)
   5669 C5            [11] 2995 	push	bc
   566A D5            [11] 2996 	push	de
   566B E5            [11] 2997 	push	hl
   566C 33            [ 6] 2998 	inc	sp
   566D 3E 0F         [ 7] 2999 	ld	a,#0x0F
   566F F5            [11] 3000 	push	af
   5670 33            [ 6] 3001 	inc	sp
   5671 21 00 C0      [10] 3002 	ld	hl,#0xC000
   5674 E5            [11] 3003 	push	hl
   5675 CD 13 6C      [17] 3004 	call	_cpct_getScreenPtr
   5678 D1            [10] 3005 	pop	de
   5679 C1            [10] 3006 	pop	bc
                           3007 ;src/main.c:92: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   567A DD 75 FE      [19] 3008 	ld	-2 (ix),l
   567D DD 74 FF      [19] 3009 	ld	-1 (ix),h
                           3010 ;src/main.c:128: cpct_drawSolidBox(memptr, 3, 2, 8);
   5680 C5            [11] 3011 	push	bc
   5681 D5            [11] 3012 	push	de
   5682 21 02 08      [10] 3013 	ld	hl,#0x0802
   5685 E5            [11] 3014 	push	hl
   5686 3E 03         [ 7] 3015 	ld	a,#0x03
   5688 F5            [11] 3016 	push	af
   5689 33            [ 6] 3017 	inc	sp
   568A DD 6E FE      [19] 3018 	ld	l,-2 (ix)
   568D DD 66 FF      [19] 3019 	ld	h,-1 (ix)
   5690 E5            [11] 3020 	push	hl
   5691 CD 42 6B      [17] 3021 	call	_cpct_drawSolidBox
   5694 F1            [10] 3022 	pop	af
   5695 F1            [10] 3023 	pop	af
   5696 33            [ 6] 3024 	inc	sp
   5697 21 00 40      [10] 3025 	ld	hl,#0x4000
   569A CD 04 68      [17] 3026 	call	_cpct_isKeyPressed
   569D 7D            [ 4] 3027 	ld	a,l
   569E D1            [10] 3028 	pop	de
   569F C1            [10] 3029 	pop	bc
   56A0 B7            [ 4] 3030 	or	a, a
   56A1 28 27         [12] 3031 	jr	Z,00116$
                           3032 ;src/main.c:130: switch (pushed){
   56A3 78            [ 4] 3033 	ld	a,b
   56A4 B7            [ 4] 3034 	or	a,a
   56A5 20 23         [12] 3035 	jr	NZ,00116$
   56A7 B1            [ 4] 3036 	or	a,c
   56A8 20 20         [12] 3037 	jr	NZ,00116$
   56AA DD 5E FA      [19] 3038 	ld	e,-6 (ix)
   56AD 16 00         [ 7] 3039 	ld	d,#0x00
   56AF 21 B5 56      [10] 3040 	ld	hl,#00167$
   56B2 19            [11] 3041 	add	hl,de
   56B3 19            [11] 3042 	add	hl,de
                           3043 ;src/main.c:131: case 0: return 1;break;
   56B4 E9            [ 4] 3044 	jp	(hl)
   56B5                    3045 00167$:
   56B5 18 04         [12] 3046 	jr	00111$
   56B7 18 07         [12] 3047 	jr	00112$
   56B9 18 0A         [12] 3048 	jr	00113$
   56BB                    3049 00111$:
   56BB 21 01 00      [10] 3050 	ld	hl,#0x0001
   56BE 18 0E         [12] 3051 	jr	00120$
                           3052 ;src/main.c:132: case 1: return 2;break;
   56C0                    3053 00112$:
   56C0 21 02 00      [10] 3054 	ld	hl,#0x0002
   56C3 18 09         [12] 3055 	jr	00120$
                           3056 ;src/main.c:133: case 2: return 0;break;
   56C5                    3057 00113$:
   56C5 21 00 00      [10] 3058 	ld	hl,#0x0000
   56C8 18 04         [12] 3059 	jr	00120$
                           3060 ;src/main.c:134: }
   56CA                    3061 00116$:
                           3062 ;src/main.c:136: cont++;
   56CA 13            [ 6] 3063 	inc	de
   56CB C3 A5 55      [10] 3064 	jp	00118$
   56CE                    3065 00120$:
   56CE DD F9         [10] 3066 	ld	sp, ix
   56D0 DD E1         [14] 3067 	pop	ix
   56D2 C9            [10] 3068 	ret
   56D3                    3069 ___str_1:
   56D3 4C 6F 75 6E 67 65  3070 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   56E3 00                 3071 	.db 0x00
   56E4                    3072 ___str_2:
   56E4 4E 75 65 76 61 20  3073 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   56F1 00                 3074 	.db 0x00
   56F2                    3075 ___str_3:
   56F2 43 72 65 64 69 74  3076 	.ascii "Creditos"
        6F 73
   56FA 00                 3077 	.db 0x00
   56FB                    3078 ___str_4:
   56FB 53 61 6C 69 72     3079 	.ascii "Salir"
   5700 00                 3080 	.db 0x00
                           3081 ;src/main.c:155: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3082 ;	---------------------------------
                           3083 ; Function checkBoundsCollisionsEnemy
                           3084 ; ---------------------------------
   5701                    3085 _checkBoundsCollisionsEnemy::
   5701 DD E5         [15] 3086 	push	ix
   5703 DD 21 00 00   [14] 3087 	ld	ix,#0
   5707 DD 39         [15] 3088 	add	ix,sp
   5709 21 EC FF      [10] 3089 	ld	hl,#-20
   570C 39            [11] 3090 	add	hl,sp
   570D F9            [ 6] 3091 	ld	sp,hl
                           3092 ;src/main.c:157: u8 *posX = x;
   570E DD 7E 04      [19] 3093 	ld	a,4 (ix)
   5711 DD 77 EE      [19] 3094 	ld	-18 (ix),a
   5714 DD 7E 05      [19] 3095 	ld	a,5 (ix)
   5717 DD 77 EF      [19] 3096 	ld	-17 (ix),a
                           3097 ;src/main.c:158: u8 *posY = y;
   571A DD 7E 06      [19] 3098 	ld	a,6 (ix)
   571D DD 77 EC      [19] 3099 	ld	-20 (ix),a
   5720 DD 7E 07      [19] 3100 	ld	a,7 (ix)
   5723 DD 77 ED      [19] 3101 	ld	-19 (ix),a
                           3102 ;src/main.c:159: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   5726 E1            [10] 3103 	pop	hl
   5727 E5            [11] 3104 	push	hl
   5728 7E            [ 7] 3105 	ld	a,(hl)
   5729 DD 77 FB      [19] 3106 	ld	-5 (ix), a
   572C 07            [ 4] 3107 	rlca
   572D 07            [ 4] 3108 	rlca
   572E 07            [ 4] 3109 	rlca
   572F 07            [ 4] 3110 	rlca
   5730 E6 0F         [ 7] 3111 	and	a,#0x0F
   5732 4F            [ 4] 3112 	ld	c,a
   5733 06 00         [ 7] 3113 	ld	b,#0x00
   5735 69            [ 4] 3114 	ld	l, c
   5736 60            [ 4] 3115 	ld	h, b
   5737 29            [11] 3116 	add	hl, hl
   5738 29            [11] 3117 	add	hl, hl
   5739 09            [11] 3118 	add	hl, bc
   573A 29            [11] 3119 	add	hl, hl
   573B 29            [11] 3120 	add	hl, hl
   573C 3E C8         [ 7] 3121 	ld	a,#<(_scene)
   573E 85            [ 4] 3122 	add	a, l
   573F DD 77 F9      [19] 3123 	ld	-7 (ix),a
   5742 3E 6C         [ 7] 3124 	ld	a,#>(_scene)
   5744 8C            [ 4] 3125 	adc	a, h
   5745 DD 77 FA      [19] 3126 	ld	-6 (ix),a
   5748 DD 6E EE      [19] 3127 	ld	l,-18 (ix)
   574B DD 66 EF      [19] 3128 	ld	h,-17 (ix)
   574E 7E            [ 7] 3129 	ld	a,(hl)
   574F DD 77 FE      [19] 3130 	ld	-2 (ix), a
   5752 0F            [ 4] 3131 	rrca
   5753 0F            [ 4] 3132 	rrca
   5754 E6 3F         [ 7] 3133 	and	a,#0x3F
   5756 DD 77 FF      [19] 3134 	ld	-1 (ix), a
   5759 DD 86 F9      [19] 3135 	add	a, -7 (ix)
   575C 6F            [ 4] 3136 	ld	l,a
   575D 3E 00         [ 7] 3137 	ld	a,#0x00
   575F DD 8E FA      [19] 3138 	adc	a, -6 (ix)
   5762 67            [ 4] 3139 	ld	h,a
   5763 7E            [ 7] 3140 	ld	a,(hl)
   5764 DD 77 F8      [19] 3141 	ld	-8 (ix), a
   5767 3D            [ 4] 3142 	dec	a
   5768 CA 76 58      [10] 3143 	jp	Z,00106$
                           3144 ;src/main.c:160: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   576B DD 6E FE      [19] 3145 	ld	l,-2 (ix)
   576E 26 00         [ 7] 3146 	ld	h,#0x00
   5770 DD 5E 0A      [19] 3147 	ld	e,10 (ix)
   5773 16 00         [ 7] 3148 	ld	d,#0x00
   5775 19            [11] 3149 	add	hl,de
   5776 7D            [ 4] 3150 	ld	a,l
   5777 C6 FF         [ 7] 3151 	add	a,#0xFF
   5779 DD 77 F0      [19] 3152 	ld	-16 (ix),a
   577C 7C            [ 4] 3153 	ld	a,h
   577D CE FF         [ 7] 3154 	adc	a,#0xFF
   577F DD 77 F1      [19] 3155 	ld	-15 (ix),a
   5782 DD 7E F0      [19] 3156 	ld	a,-16 (ix)
   5785 DD 77 F6      [19] 3157 	ld	-10 (ix),a
   5788 DD 7E F1      [19] 3158 	ld	a,-15 (ix)
   578B DD 77 F7      [19] 3159 	ld	-9 (ix),a
   578E DD 7E F1      [19] 3160 	ld	a,-15 (ix)
   5791 07            [ 4] 3161 	rlca
   5792 E6 01         [ 7] 3162 	and	a,#0x01
   5794 DD 77 FE      [19] 3163 	ld	-2 (ix),a
   5797 23            [ 6] 3164 	inc	hl
   5798 23            [ 6] 3165 	inc	hl
   5799 DD 75 F2      [19] 3166 	ld	-14 (ix),l
   579C DD 74 F3      [19] 3167 	ld	-13 (ix),h
   579F DD 7E FE      [19] 3168 	ld	a,-2 (ix)
   57A2 B7            [ 4] 3169 	or	a, a
   57A3 28 0C         [12] 3170 	jr	Z,00114$
   57A5 DD 7E F2      [19] 3171 	ld	a,-14 (ix)
   57A8 DD 77 F6      [19] 3172 	ld	-10 (ix),a
   57AB DD 7E F3      [19] 3173 	ld	a,-13 (ix)
   57AE DD 77 F7      [19] 3174 	ld	-9 (ix),a
   57B1                    3175 00114$:
   57B1 DD 6E F6      [19] 3176 	ld	l,-10 (ix)
   57B4 DD 66 F7      [19] 3177 	ld	h,-9 (ix)
   57B7 CB 2C         [ 8] 3178 	sra	h
   57B9 CB 1D         [ 8] 3179 	rr	l
   57BB CB 2C         [ 8] 3180 	sra	h
   57BD CB 1D         [ 8] 3181 	rr	l
   57BF DD 5E F9      [19] 3182 	ld	e,-7 (ix)
   57C2 DD 56 FA      [19] 3183 	ld	d,-6 (ix)
   57C5 19            [11] 3184 	add	hl,de
   57C6 7E            [ 7] 3185 	ld	a,(hl)
   57C7 3D            [ 4] 3186 	dec	a
   57C8 CA 76 58      [10] 3187 	jp	Z,00106$
                           3188 ;src/main.c:161: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   57CB DD 6E FB      [19] 3189 	ld	l,-5 (ix)
   57CE 26 00         [ 7] 3190 	ld	h,#0x00
   57D0 DD 5E 0B      [19] 3191 	ld	e,11 (ix)
   57D3 16 00         [ 7] 3192 	ld	d,#0x00
   57D5 19            [11] 3193 	add	hl,de
   57D6 4D            [ 4] 3194 	ld	c,l
   57D7 44            [ 4] 3195 	ld	b,h
   57D8 0B            [ 6] 3196 	dec	bc
   57D9 0B            [ 6] 3197 	dec	bc
   57DA 59            [ 4] 3198 	ld	e, c
   57DB 78            [ 4] 3199 	ld	a,b
   57DC 57            [ 4] 3200 	ld	d,a
   57DD 07            [ 4] 3201 	rlca
   57DE E6 01         [ 7] 3202 	and	a,#0x01
   57E0 DD 77 F6      [19] 3203 	ld	-10 (ix),a
   57E3 7D            [ 4] 3204 	ld	a,l
   57E4 C6 0D         [ 7] 3205 	add	a, #0x0D
   57E6 DD 77 FC      [19] 3206 	ld	-4 (ix),a
   57E9 7C            [ 4] 3207 	ld	a,h
   57EA CE 00         [ 7] 3208 	adc	a, #0x00
   57EC DD 77 FD      [19] 3209 	ld	-3 (ix),a
   57EF DD 7E F6      [19] 3210 	ld	a,-10 (ix)
   57F2 B7            [ 4] 3211 	or	a, a
   57F3 28 06         [12] 3212 	jr	Z,00115$
   57F5 DD 5E FC      [19] 3213 	ld	e,-4 (ix)
   57F8 DD 56 FD      [19] 3214 	ld	d,-3 (ix)
   57FB                    3215 00115$:
   57FB CB 2A         [ 8] 3216 	sra	d
   57FD CB 1B         [ 8] 3217 	rr	e
   57FF CB 2A         [ 8] 3218 	sra	d
   5801 CB 1B         [ 8] 3219 	rr	e
   5803 CB 2A         [ 8] 3220 	sra	d
   5805 CB 1B         [ 8] 3221 	rr	e
   5807 CB 2A         [ 8] 3222 	sra	d
   5809 CB 1B         [ 8] 3223 	rr	e
   580B 6B            [ 4] 3224 	ld	l, e
   580C 62            [ 4] 3225 	ld	h, d
   580D 29            [11] 3226 	add	hl, hl
   580E 29            [11] 3227 	add	hl, hl
   580F 19            [11] 3228 	add	hl, de
   5810 29            [11] 3229 	add	hl, hl
   5811 29            [11] 3230 	add	hl, hl
   5812 11 C8 6C      [10] 3231 	ld	de,#_scene
   5815 19            [11] 3232 	add	hl,de
   5816 DD 5E FF      [19] 3233 	ld	e,-1 (ix)
   5819 16 00         [ 7] 3234 	ld	d,#0x00
   581B 19            [11] 3235 	add	hl,de
   581C 7E            [ 7] 3236 	ld	a,(hl)
   581D 3D            [ 4] 3237 	dec	a
   581E 28 56         [12] 3238 	jr	Z,00106$
                           3239 ;src/main.c:162: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5820 69            [ 4] 3240 	ld	l, c
   5821 60            [ 4] 3241 	ld	h, b
   5822 DD 7E F6      [19] 3242 	ld	a,-10 (ix)
   5825 B7            [ 4] 3243 	or	a, a
   5826 28 06         [12] 3244 	jr	Z,00116$
   5828 DD 6E FC      [19] 3245 	ld	l,-4 (ix)
   582B DD 66 FD      [19] 3246 	ld	h,-3 (ix)
   582E                    3247 00116$:
   582E CB 2C         [ 8] 3248 	sra	h
   5830 CB 1D         [ 8] 3249 	rr	l
   5832 CB 2C         [ 8] 3250 	sra	h
   5834 CB 1D         [ 8] 3251 	rr	l
   5836 CB 2C         [ 8] 3252 	sra	h
   5838 CB 1D         [ 8] 3253 	rr	l
   583A CB 2C         [ 8] 3254 	sra	h
   583C CB 1D         [ 8] 3255 	rr	l
   583E 5D            [ 4] 3256 	ld	e, l
   583F 54            [ 4] 3257 	ld	d, h
   5840 29            [11] 3258 	add	hl, hl
   5841 29            [11] 3259 	add	hl, hl
   5842 19            [11] 3260 	add	hl, de
   5843 29            [11] 3261 	add	hl, hl
   5844 29            [11] 3262 	add	hl, hl
   5845 3E C8         [ 7] 3263 	ld	a,#<(_scene)
   5847 85            [ 4] 3264 	add	a, l
   5848 DD 77 F4      [19] 3265 	ld	-12 (ix),a
   584B 3E 6C         [ 7] 3266 	ld	a,#>(_scene)
   584D 8C            [ 4] 3267 	adc	a, h
   584E DD 77 F5      [19] 3268 	ld	-11 (ix),a
   5851 DD 6E F0      [19] 3269 	ld	l,-16 (ix)
   5854 DD 66 F1      [19] 3270 	ld	h,-15 (ix)
   5857 DD 7E FE      [19] 3271 	ld	a,-2 (ix)
   585A B7            [ 4] 3272 	or	a, a
   585B 28 06         [12] 3273 	jr	Z,00117$
   585D DD 6E F2      [19] 3274 	ld	l,-14 (ix)
   5860 DD 66 F3      [19] 3275 	ld	h,-13 (ix)
   5863                    3276 00117$:
   5863 CB 2C         [ 8] 3277 	sra	h
   5865 CB 1D         [ 8] 3278 	rr	l
   5867 CB 2C         [ 8] 3279 	sra	h
   5869 CB 1D         [ 8] 3280 	rr	l
   586B DD 5E F4      [19] 3281 	ld	e,-12 (ix)
   586E DD 56 F5      [19] 3282 	ld	d,-11 (ix)
   5871 19            [11] 3283 	add	hl,de
   5872 7E            [ 7] 3284 	ld	a,(hl)
   5873 3D            [ 4] 3285 	dec	a
   5874 20 13         [12] 3286 	jr	NZ,00107$
   5876                    3287 00106$:
                           3288 ;src/main.c:164: *posX=lx;
   5876 DD 6E EE      [19] 3289 	ld	l,-18 (ix)
   5879 DD 66 EF      [19] 3290 	ld	h,-17 (ix)
   587C DD 7E 08      [19] 3291 	ld	a,8 (ix)
   587F 77            [ 7] 3292 	ld	(hl),a
                           3293 ;src/main.c:165: *posY=ly;
   5880 E1            [10] 3294 	pop	hl
   5881 E5            [11] 3295 	push	hl
   5882 DD 7E 09      [19] 3296 	ld	a,9 (ix)
   5885 77            [ 7] 3297 	ld	(hl),a
   5886 C3 51 59      [10] 3298 	jp	00112$
   5889                    3299 00107$:
                           3300 ;src/main.c:167: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   5889 DD 7E F8      [19] 3301 	ld	a,-8 (ix)
   588C D6 03         [ 7] 3302 	sub	a, #0x03
   588E C2 41 59      [10] 3303 	jp	NZ,00101$
                           3304 ;src/main.c:168: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5891 DD 6E F0      [19] 3305 	ld	l,-16 (ix)
   5894 DD 66 F1      [19] 3306 	ld	h,-15 (ix)
   5897 DD 7E FE      [19] 3307 	ld	a,-2 (ix)
   589A B7            [ 4] 3308 	or	a, a
   589B 28 06         [12] 3309 	jr	Z,00118$
   589D DD 6E F2      [19] 3310 	ld	l,-14 (ix)
   58A0 DD 66 F3      [19] 3311 	ld	h,-13 (ix)
   58A3                    3312 00118$:
   58A3 CB 2C         [ 8] 3313 	sra	h
   58A5 CB 1D         [ 8] 3314 	rr	l
   58A7 CB 2C         [ 8] 3315 	sra	h
   58A9 CB 1D         [ 8] 3316 	rr	l
   58AB DD 5E F9      [19] 3317 	ld	e,-7 (ix)
   58AE DD 56 FA      [19] 3318 	ld	d,-6 (ix)
   58B1 19            [11] 3319 	add	hl,de
   58B2 7E            [ 7] 3320 	ld	a,(hl)
   58B3 D6 03         [ 7] 3321 	sub	a, #0x03
   58B5 C2 41 59      [10] 3322 	jp	NZ,00101$
                           3323 ;src/main.c:169: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   58B8 69            [ 4] 3324 	ld	l, c
   58B9 60            [ 4] 3325 	ld	h, b
   58BA DD 7E F6      [19] 3326 	ld	a,-10 (ix)
   58BD B7            [ 4] 3327 	or	a, a
   58BE 28 06         [12] 3328 	jr	Z,00119$
   58C0 DD 6E FC      [19] 3329 	ld	l,-4 (ix)
   58C3 DD 66 FD      [19] 3330 	ld	h,-3 (ix)
   58C6                    3331 00119$:
   58C6 CB 2C         [ 8] 3332 	sra	h
   58C8 CB 1D         [ 8] 3333 	rr	l
   58CA CB 2C         [ 8] 3334 	sra	h
   58CC CB 1D         [ 8] 3335 	rr	l
   58CE CB 2C         [ 8] 3336 	sra	h
   58D0 CB 1D         [ 8] 3337 	rr	l
   58D2 CB 2C         [ 8] 3338 	sra	h
   58D4 CB 1D         [ 8] 3339 	rr	l
   58D6 5D            [ 4] 3340 	ld	e, l
   58D7 54            [ 4] 3341 	ld	d, h
   58D8 29            [11] 3342 	add	hl, hl
   58D9 29            [11] 3343 	add	hl, hl
   58DA 19            [11] 3344 	add	hl, de
   58DB 29            [11] 3345 	add	hl, hl
   58DC 29            [11] 3346 	add	hl, hl
   58DD 11 C8 6C      [10] 3347 	ld	de,#_scene
   58E0 19            [11] 3348 	add	hl,de
   58E1 DD 5E FF      [19] 3349 	ld	e,-1 (ix)
   58E4 16 00         [ 7] 3350 	ld	d,#0x00
   58E6 19            [11] 3351 	add	hl,de
   58E7 7E            [ 7] 3352 	ld	a,(hl)
   58E8 D6 03         [ 7] 3353 	sub	a, #0x03
   58EA 20 55         [12] 3354 	jr	NZ,00101$
                           3355 ;src/main.c:170: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   58EC DD 7E F6      [19] 3356 	ld	a,-10 (ix)
   58EF B7            [ 4] 3357 	or	a, a
   58F0 28 06         [12] 3358 	jr	Z,00120$
   58F2 DD 4E FC      [19] 3359 	ld	c,-4 (ix)
   58F5 DD 46 FD      [19] 3360 	ld	b,-3 (ix)
   58F8                    3361 00120$:
   58F8 CB 28         [ 8] 3362 	sra	b
   58FA CB 19         [ 8] 3363 	rr	c
   58FC CB 28         [ 8] 3364 	sra	b
   58FE CB 19         [ 8] 3365 	rr	c
   5900 CB 28         [ 8] 3366 	sra	b
   5902 CB 19         [ 8] 3367 	rr	c
   5904 CB 28         [ 8] 3368 	sra	b
   5906 CB 19         [ 8] 3369 	rr	c
   5908 69            [ 4] 3370 	ld	l, c
   5909 60            [ 4] 3371 	ld	h, b
   590A 29            [11] 3372 	add	hl, hl
   590B 29            [11] 3373 	add	hl, hl
   590C 09            [11] 3374 	add	hl, bc
   590D 29            [11] 3375 	add	hl, hl
   590E 29            [11] 3376 	add	hl, hl
   590F 3E C8         [ 7] 3377 	ld	a,#<(_scene)
   5911 85            [ 4] 3378 	add	a, l
   5912 DD 77 F4      [19] 3379 	ld	-12 (ix),a
   5915 3E 6C         [ 7] 3380 	ld	a,#>(_scene)
   5917 8C            [ 4] 3381 	adc	a, h
   5918 DD 77 F5      [19] 3382 	ld	-11 (ix),a
   591B DD 6E F0      [19] 3383 	ld	l,-16 (ix)
   591E DD 66 F1      [19] 3384 	ld	h,-15 (ix)
   5921 DD 7E FE      [19] 3385 	ld	a,-2 (ix)
   5924 B7            [ 4] 3386 	or	a, a
   5925 28 06         [12] 3387 	jr	Z,00121$
   5927 DD 6E F2      [19] 3388 	ld	l,-14 (ix)
   592A DD 66 F3      [19] 3389 	ld	h,-13 (ix)
   592D                    3390 00121$:
   592D CB 2C         [ 8] 3391 	sra	h
   592F CB 1D         [ 8] 3392 	rr	l
   5931 CB 2C         [ 8] 3393 	sra	h
   5933 CB 1D         [ 8] 3394 	rr	l
   5935 DD 5E F4      [19] 3395 	ld	e,-12 (ix)
   5938 DD 56 F5      [19] 3396 	ld	d,-11 (ix)
   593B 19            [11] 3397 	add	hl,de
   593C 7E            [ 7] 3398 	ld	a,(hl)
   593D D6 03         [ 7] 3399 	sub	a, #0x03
   593F 28 10         [12] 3400 	jr	Z,00112$
   5941                    3401 00101$:
                           3402 ;src/main.c:172: *posX=lx;
   5941 DD 6E EE      [19] 3403 	ld	l,-18 (ix)
   5944 DD 66 EF      [19] 3404 	ld	h,-17 (ix)
   5947 DD 7E 08      [19] 3405 	ld	a,8 (ix)
   594A 77            [ 7] 3406 	ld	(hl),a
                           3407 ;src/main.c:173: *posY=ly;
   594B E1            [10] 3408 	pop	hl
   594C E5            [11] 3409 	push	hl
   594D DD 7E 09      [19] 3410 	ld	a,9 (ix)
   5950 77            [ 7] 3411 	ld	(hl),a
   5951                    3412 00112$:
   5951 DD F9         [10] 3413 	ld	sp, ix
   5953 DD E1         [14] 3414 	pop	ix
   5955 C9            [10] 3415 	ret
                           3416 ;src/main.c:179: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3417 ;	---------------------------------
                           3418 ; Function checkBoundsCollisions
                           3419 ; ---------------------------------
   5956                    3420 _checkBoundsCollisions::
   5956 DD E5         [15] 3421 	push	ix
   5958 DD 21 00 00   [14] 3422 	ld	ix,#0
   595C DD 39         [15] 3423 	add	ix,sp
   595E 21 F2 FF      [10] 3424 	ld	hl,#-14
   5961 39            [11] 3425 	add	hl,sp
   5962 F9            [ 6] 3426 	ld	sp,hl
                           3427 ;src/main.c:180: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5963 3A CB 6D      [13] 3428 	ld	a,(#(_player + 0x0001) + 0)
   5966 DD 77 F8      [19] 3429 	ld	-8 (ix), a
   5969 07            [ 4] 3430 	rlca
   596A 07            [ 4] 3431 	rlca
   596B 07            [ 4] 3432 	rlca
   596C 07            [ 4] 3433 	rlca
   596D E6 0F         [ 7] 3434 	and	a,#0x0F
   596F 4F            [ 4] 3435 	ld	c,a
   5970 06 00         [ 7] 3436 	ld	b,#0x00
   5972 69            [ 4] 3437 	ld	l, c
   5973 60            [ 4] 3438 	ld	h, b
   5974 29            [11] 3439 	add	hl, hl
   5975 29            [11] 3440 	add	hl, hl
   5976 09            [11] 3441 	add	hl, bc
   5977 29            [11] 3442 	add	hl, hl
   5978 29            [11] 3443 	add	hl, hl
   5979 3E C8         [ 7] 3444 	ld	a,#<(_scene)
   597B 85            [ 4] 3445 	add	a, l
   597C DD 77 F4      [19] 3446 	ld	-12 (ix),a
   597F 3E 6C         [ 7] 3447 	ld	a,#>(_scene)
   5981 8C            [ 4] 3448 	adc	a, h
   5982 DD 77 F5      [19] 3449 	ld	-11 (ix),a
   5985 21 CA 6D      [10] 3450 	ld	hl, #_player + 0
   5988 4E            [ 7] 3451 	ld	c,(hl)
   5989 79            [ 4] 3452 	ld	a,c
   598A 0F            [ 4] 3453 	rrca
   598B 0F            [ 4] 3454 	rrca
   598C E6 3F         [ 7] 3455 	and	a,#0x3F
   598E DD 77 F7      [19] 3456 	ld	-9 (ix), a
   5991 DD 86 F4      [19] 3457 	add	a, -12 (ix)
   5994 6F            [ 4] 3458 	ld	l,a
   5995 3E 00         [ 7] 3459 	ld	a,#0x00
   5997 DD 8E F5      [19] 3460 	adc	a, -11 (ix)
   599A 67            [ 4] 3461 	ld	h,a
   599B 7E            [ 7] 3462 	ld	a,(hl)
   599C DD 77 F6      [19] 3463 	ld	-10 (ix), a
   599F 3D            [ 4] 3464 	dec	a
   59A0 CA B6 5A      [10] 3465 	jp	Z,00124$
                           3466 ;src/main.c:181: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   59A3 06 00         [ 7] 3467 	ld	b,#0x00
   59A5 21 03 00      [10] 3468 	ld	hl,#0x0003
   59A8 09            [11] 3469 	add	hl,bc
   59A9 DD 75 FB      [19] 3470 	ld	-5 (ix),l
   59AC DD 74 FC      [19] 3471 	ld	-4 (ix),h
   59AF DD 7E FB      [19] 3472 	ld	a,-5 (ix)
   59B2 DD 77 FE      [19] 3473 	ld	-2 (ix),a
   59B5 DD 7E FC      [19] 3474 	ld	a,-4 (ix)
   59B8 DD 77 FF      [19] 3475 	ld	-1 (ix),a
   59BB DD 7E FC      [19] 3476 	ld	a,-4 (ix)
   59BE 07            [ 4] 3477 	rlca
   59BF E6 01         [ 7] 3478 	and	a,#0x01
   59C1 DD 77 FD      [19] 3479 	ld	-3 (ix),a
   59C4 21 06 00      [10] 3480 	ld	hl,#0x0006
   59C7 09            [11] 3481 	add	hl,bc
   59C8 E3            [19] 3482 	ex	(sp), hl
   59C9 DD 7E FD      [19] 3483 	ld	a,-3 (ix)
   59CC B7            [ 4] 3484 	or	a, a
   59CD 28 0C         [12] 3485 	jr	Z,00132$
   59CF DD 7E F2      [19] 3486 	ld	a,-14 (ix)
   59D2 DD 77 FE      [19] 3487 	ld	-2 (ix),a
   59D5 DD 7E F3      [19] 3488 	ld	a,-13 (ix)
   59D8 DD 77 FF      [19] 3489 	ld	-1 (ix),a
   59DB                    3490 00132$:
   59DB DD 6E FE      [19] 3491 	ld	l,-2 (ix)
   59DE DD 66 FF      [19] 3492 	ld	h,-1 (ix)
   59E1 CB 2C         [ 8] 3493 	sra	h
   59E3 CB 1D         [ 8] 3494 	rr	l
   59E5 CB 2C         [ 8] 3495 	sra	h
   59E7 CB 1D         [ 8] 3496 	rr	l
   59E9 DD 5E F4      [19] 3497 	ld	e,-12 (ix)
   59EC DD 56 F5      [19] 3498 	ld	d,-11 (ix)
   59EF 19            [11] 3499 	add	hl,de
   59F0 7E            [ 7] 3500 	ld	a,(hl)
   59F1 3D            [ 4] 3501 	dec	a
   59F2 CA B6 5A      [10] 3502 	jp	Z,00124$
                           3503 ;src/main.c:182: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   59F5 DD 5E F8      [19] 3504 	ld	e,-8 (ix)
   59F8 16 00         [ 7] 3505 	ld	d,#0x00
   59FA 21 0E 00      [10] 3506 	ld	hl,#0x000E
   59FD 19            [11] 3507 	add	hl,de
   59FE 4D            [ 4] 3508 	ld	c,l
   59FF 44            [ 4] 3509 	ld	b,h
   5A00 DD 71 FE      [19] 3510 	ld	-2 (ix),c
   5A03 DD 70 FF      [19] 3511 	ld	-1 (ix),b
   5A06 78            [ 4] 3512 	ld	a,b
   5A07 07            [ 4] 3513 	rlca
   5A08 E6 01         [ 7] 3514 	and	a,#0x01
   5A0A DD 77 F8      [19] 3515 	ld	-8 (ix),a
   5A0D 21 1D 00      [10] 3516 	ld	hl,#0x001D
   5A10 19            [11] 3517 	add	hl,de
   5A11 DD 75 F9      [19] 3518 	ld	-7 (ix),l
   5A14 DD 74 FA      [19] 3519 	ld	-6 (ix),h
   5A17 DD 7E F8      [19] 3520 	ld	a,-8 (ix)
   5A1A B7            [ 4] 3521 	or	a, a
   5A1B 28 0C         [12] 3522 	jr	Z,00133$
   5A1D DD 7E F9      [19] 3523 	ld	a,-7 (ix)
   5A20 DD 77 FE      [19] 3524 	ld	-2 (ix),a
   5A23 DD 7E FA      [19] 3525 	ld	a,-6 (ix)
   5A26 DD 77 FF      [19] 3526 	ld	-1 (ix),a
   5A29                    3527 00133$:
   5A29 DD 6E FE      [19] 3528 	ld	l,-2 (ix)
   5A2C DD 66 FF      [19] 3529 	ld	h,-1 (ix)
   5A2F CB 2C         [ 8] 3530 	sra	h
   5A31 CB 1D         [ 8] 3531 	rr	l
   5A33 CB 2C         [ 8] 3532 	sra	h
   5A35 CB 1D         [ 8] 3533 	rr	l
   5A37 CB 2C         [ 8] 3534 	sra	h
   5A39 CB 1D         [ 8] 3535 	rr	l
   5A3B CB 2C         [ 8] 3536 	sra	h
   5A3D CB 1D         [ 8] 3537 	rr	l
   5A3F 5D            [ 4] 3538 	ld	e, l
   5A40 54            [ 4] 3539 	ld	d, h
   5A41 29            [11] 3540 	add	hl, hl
   5A42 29            [11] 3541 	add	hl, hl
   5A43 19            [11] 3542 	add	hl, de
   5A44 29            [11] 3543 	add	hl, hl
   5A45 29            [11] 3544 	add	hl, hl
   5A46 11 C8 6C      [10] 3545 	ld	de,#_scene
   5A49 19            [11] 3546 	add	hl,de
   5A4A DD 5E F7      [19] 3547 	ld	e,-9 (ix)
   5A4D 16 00         [ 7] 3548 	ld	d,#0x00
   5A4F 19            [11] 3549 	add	hl,de
   5A50 7E            [ 7] 3550 	ld	a,(hl)
   5A51 3D            [ 4] 3551 	dec	a
   5A52 28 62         [12] 3552 	jr	Z,00124$
                           3553 ;src/main.c:183: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5A54 DD 71 FE      [19] 3554 	ld	-2 (ix),c
   5A57 DD 70 FF      [19] 3555 	ld	-1 (ix),b
   5A5A DD 7E F8      [19] 3556 	ld	a,-8 (ix)
   5A5D B7            [ 4] 3557 	or	a, a
   5A5E 28 0C         [12] 3558 	jr	Z,00134$
   5A60 DD 7E F9      [19] 3559 	ld	a,-7 (ix)
   5A63 DD 77 FE      [19] 3560 	ld	-2 (ix),a
   5A66 DD 7E FA      [19] 3561 	ld	a,-6 (ix)
   5A69 DD 77 FF      [19] 3562 	ld	-1 (ix),a
   5A6C                    3563 00134$:
   5A6C DD 6E FE      [19] 3564 	ld	l,-2 (ix)
   5A6F DD 66 FF      [19] 3565 	ld	h,-1 (ix)
   5A72 CB 2C         [ 8] 3566 	sra	h
   5A74 CB 1D         [ 8] 3567 	rr	l
   5A76 CB 2C         [ 8] 3568 	sra	h
   5A78 CB 1D         [ 8] 3569 	rr	l
   5A7A CB 2C         [ 8] 3570 	sra	h
   5A7C CB 1D         [ 8] 3571 	rr	l
   5A7E CB 2C         [ 8] 3572 	sra	h
   5A80 CB 1D         [ 8] 3573 	rr	l
   5A82 5D            [ 4] 3574 	ld	e, l
   5A83 54            [ 4] 3575 	ld	d, h
   5A84 29            [11] 3576 	add	hl, hl
   5A85 29            [11] 3577 	add	hl, hl
   5A86 19            [11] 3578 	add	hl, de
   5A87 29            [11] 3579 	add	hl, hl
   5A88 29            [11] 3580 	add	hl, hl
   5A89 3E C8         [ 7] 3581 	ld	a,#<(_scene)
   5A8B 85            [ 4] 3582 	add	a, l
   5A8C DD 77 FE      [19] 3583 	ld	-2 (ix),a
   5A8F 3E 6C         [ 7] 3584 	ld	a,#>(_scene)
   5A91 8C            [ 4] 3585 	adc	a, h
   5A92 DD 77 FF      [19] 3586 	ld	-1 (ix),a
   5A95 DD 6E FB      [19] 3587 	ld	l,-5 (ix)
   5A98 DD 66 FC      [19] 3588 	ld	h,-4 (ix)
   5A9B DD 7E FD      [19] 3589 	ld	a,-3 (ix)
   5A9E B7            [ 4] 3590 	or	a, a
   5A9F 28 02         [12] 3591 	jr	Z,00135$
   5AA1 E1            [10] 3592 	pop	hl
   5AA2 E5            [11] 3593 	push	hl
   5AA3                    3594 00135$:
   5AA3 CB 2C         [ 8] 3595 	sra	h
   5AA5 CB 1D         [ 8] 3596 	rr	l
   5AA7 CB 2C         [ 8] 3597 	sra	h
   5AA9 CB 1D         [ 8] 3598 	rr	l
   5AAB DD 5E FE      [19] 3599 	ld	e,-2 (ix)
   5AAE DD 56 FF      [19] 3600 	ld	d,-1 (ix)
   5AB1 19            [11] 3601 	add	hl,de
   5AB2 7E            [ 7] 3602 	ld	a,(hl)
   5AB3 3D            [ 4] 3603 	dec	a
   5AB4 20 10         [12] 3604 	jr	NZ,00125$
   5AB6                    3605 00124$:
                           3606 ;src/main.c:185: player.x=player.lx;
   5AB6 3A CC 6D      [13] 3607 	ld	a, (#_player + 2)
   5AB9 21 CA 6D      [10] 3608 	ld	hl,#_player
   5ABC 77            [ 7] 3609 	ld	(hl),a
                           3610 ;src/main.c:186: player.y=player.ly;
   5ABD 3A CD 6D      [13] 3611 	ld	a, (#_player + 3)
   5AC0 32 CB 6D      [13] 3612 	ld	(#(_player + 0x0001)),a
   5AC3 C3 22 5D      [10] 3613 	jp	00130$
   5AC6                    3614 00125$:
                           3615 ;src/main.c:188: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5AC6 DD 7E F6      [19] 3616 	ld	a,-10 (ix)
   5AC9 D6 02         [ 7] 3617 	sub	a, #0x02
   5ACB CA 6E 5B      [10] 3618 	jp	Z,00118$
                           3619 ;src/main.c:189: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5ACE DD 6E FB      [19] 3620 	ld	l,-5 (ix)
   5AD1 DD 66 FC      [19] 3621 	ld	h,-4 (ix)
   5AD4 DD 7E FD      [19] 3622 	ld	a,-3 (ix)
   5AD7 B7            [ 4] 3623 	or	a, a
   5AD8 28 02         [12] 3624 	jr	Z,00136$
   5ADA E1            [10] 3625 	pop	hl
   5ADB E5            [11] 3626 	push	hl
   5ADC                    3627 00136$:
   5ADC CB 2C         [ 8] 3628 	sra	h
   5ADE CB 1D         [ 8] 3629 	rr	l
   5AE0 CB 2C         [ 8] 3630 	sra	h
   5AE2 CB 1D         [ 8] 3631 	rr	l
   5AE4 DD 5E F4      [19] 3632 	ld	e,-12 (ix)
   5AE7 DD 56 F5      [19] 3633 	ld	d,-11 (ix)
   5AEA 19            [11] 3634 	add	hl,de
   5AEB 7E            [ 7] 3635 	ld	a,(hl)
   5AEC D6 02         [ 7] 3636 	sub	a, #0x02
   5AEE CA 6E 5B      [10] 3637 	jp	Z,00118$
                           3638 ;src/main.c:190: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5AF1 69            [ 4] 3639 	ld	l, c
   5AF2 60            [ 4] 3640 	ld	h, b
   5AF3 DD 7E F8      [19] 3641 	ld	a,-8 (ix)
   5AF6 B7            [ 4] 3642 	or	a, a
   5AF7 28 06         [12] 3643 	jr	Z,00137$
   5AF9 DD 6E F9      [19] 3644 	ld	l,-7 (ix)
   5AFC DD 66 FA      [19] 3645 	ld	h,-6 (ix)
   5AFF                    3646 00137$:
   5AFF CB 2C         [ 8] 3647 	sra	h
   5B01 CB 1D         [ 8] 3648 	rr	l
   5B03 CB 2C         [ 8] 3649 	sra	h
   5B05 CB 1D         [ 8] 3650 	rr	l
   5B07 CB 2C         [ 8] 3651 	sra	h
   5B09 CB 1D         [ 8] 3652 	rr	l
   5B0B CB 2C         [ 8] 3653 	sra	h
   5B0D CB 1D         [ 8] 3654 	rr	l
   5B0F 5D            [ 4] 3655 	ld	e, l
   5B10 54            [ 4] 3656 	ld	d, h
   5B11 29            [11] 3657 	add	hl, hl
   5B12 29            [11] 3658 	add	hl, hl
   5B13 19            [11] 3659 	add	hl, de
   5B14 29            [11] 3660 	add	hl, hl
   5B15 29            [11] 3661 	add	hl, hl
   5B16 11 C8 6C      [10] 3662 	ld	de,#_scene
   5B19 19            [11] 3663 	add	hl,de
   5B1A DD 5E F7      [19] 3664 	ld	e,-9 (ix)
   5B1D 16 00         [ 7] 3665 	ld	d,#0x00
   5B1F 19            [11] 3666 	add	hl,de
   5B20 7E            [ 7] 3667 	ld	a,(hl)
   5B21 D6 02         [ 7] 3668 	sub	a, #0x02
   5B23 28 49         [12] 3669 	jr	Z,00118$
                           3670 ;src/main.c:191: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5B25 69            [ 4] 3671 	ld	l, c
   5B26 60            [ 4] 3672 	ld	h, b
   5B27 DD 7E F8      [19] 3673 	ld	a,-8 (ix)
   5B2A B7            [ 4] 3674 	or	a, a
   5B2B 28 06         [12] 3675 	jr	Z,00138$
   5B2D DD 6E F9      [19] 3676 	ld	l,-7 (ix)
   5B30 DD 66 FA      [19] 3677 	ld	h,-6 (ix)
   5B33                    3678 00138$:
   5B33 CB 2C         [ 8] 3679 	sra	h
   5B35 CB 1D         [ 8] 3680 	rr	l
   5B37 CB 2C         [ 8] 3681 	sra	h
   5B39 CB 1D         [ 8] 3682 	rr	l
   5B3B CB 2C         [ 8] 3683 	sra	h
   5B3D CB 1D         [ 8] 3684 	rr	l
   5B3F CB 2C         [ 8] 3685 	sra	h
   5B41 CB 1D         [ 8] 3686 	rr	l
   5B43 5D            [ 4] 3687 	ld	e, l
   5B44 54            [ 4] 3688 	ld	d, h
   5B45 29            [11] 3689 	add	hl, hl
   5B46 29            [11] 3690 	add	hl, hl
   5B47 19            [11] 3691 	add	hl, de
   5B48 29            [11] 3692 	add	hl, hl
   5B49 29            [11] 3693 	add	hl, hl
   5B4A 3E C8         [ 7] 3694 	ld	a,#<(_scene)
   5B4C 85            [ 4] 3695 	add	a, l
   5B4D 5F            [ 4] 3696 	ld	e,a
   5B4E 3E 6C         [ 7] 3697 	ld	a,#>(_scene)
   5B50 8C            [ 4] 3698 	adc	a, h
   5B51 57            [ 4] 3699 	ld	d,a
   5B52 DD 6E FB      [19] 3700 	ld	l,-5 (ix)
   5B55 DD 66 FC      [19] 3701 	ld	h,-4 (ix)
   5B58 DD 7E FD      [19] 3702 	ld	a,-3 (ix)
   5B5B B7            [ 4] 3703 	or	a, a
   5B5C 28 02         [12] 3704 	jr	Z,00139$
   5B5E E1            [10] 3705 	pop	hl
   5B5F E5            [11] 3706 	push	hl
   5B60                    3707 00139$:
   5B60 CB 2C         [ 8] 3708 	sra	h
   5B62 CB 1D         [ 8] 3709 	rr	l
   5B64 CB 2C         [ 8] 3710 	sra	h
   5B66 CB 1D         [ 8] 3711 	rr	l
   5B68 19            [11] 3712 	add	hl,de
   5B69 7E            [ 7] 3713 	ld	a,(hl)
   5B6A D6 02         [ 7] 3714 	sub	a, #0x02
   5B6C 20 21         [12] 3715 	jr	NZ,00119$
   5B6E                    3716 00118$:
                           3717 ;src/main.c:193: if(player.life < 3 && *corazon == 0){
   5B6E FD 21 D0 6D   [14] 3718 	ld	iy,#_player + 6
   5B72 FD 5E 00      [19] 3719 	ld	e, 0 (iy)
   5B75 7B            [ 4] 3720 	ld	a,e
   5B76 D6 03         [ 7] 3721 	sub	a, #0x03
   5B78 D2 22 5D      [10] 3722 	jp	NC,00130$
   5B7B DD 6E 04      [19] 3723 	ld	l,4 (ix)
   5B7E DD 66 05      [19] 3724 	ld	h,5 (ix)
   5B81 7E            [ 7] 3725 	ld	a,(hl)
   5B82 B7            [ 4] 3726 	or	a, a
   5B83 C2 22 5D      [10] 3727 	jp	NZ,00130$
                           3728 ;src/main.c:194: player.life += 1;
   5B86 1C            [ 4] 3729 	inc	e
   5B87 FD 73 00      [19] 3730 	ld	0 (iy), e
                           3731 ;src/main.c:195: *corazon = 1;
   5B8A 36 01         [10] 3732 	ld	(hl),#0x01
   5B8C C3 22 5D      [10] 3733 	jp	00130$
   5B8F                    3734 00119$:
                           3735 ;src/main.c:198: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5B8F DD 7E F6      [19] 3736 	ld	a,-10 (ix)
   5B92 D6 05         [ 7] 3737 	sub	a, #0x05
   5B94 CA 37 5C      [10] 3738 	jp	Z,00112$
                           3739 ;src/main.c:199: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5B97 DD 6E FB      [19] 3740 	ld	l,-5 (ix)
   5B9A DD 66 FC      [19] 3741 	ld	h,-4 (ix)
   5B9D DD 7E FD      [19] 3742 	ld	a,-3 (ix)
   5BA0 B7            [ 4] 3743 	or	a, a
   5BA1 28 02         [12] 3744 	jr	Z,00140$
   5BA3 E1            [10] 3745 	pop	hl
   5BA4 E5            [11] 3746 	push	hl
   5BA5                    3747 00140$:
   5BA5 CB 2C         [ 8] 3748 	sra	h
   5BA7 CB 1D         [ 8] 3749 	rr	l
   5BA9 CB 2C         [ 8] 3750 	sra	h
   5BAB CB 1D         [ 8] 3751 	rr	l
   5BAD DD 5E F4      [19] 3752 	ld	e,-12 (ix)
   5BB0 DD 56 F5      [19] 3753 	ld	d,-11 (ix)
   5BB3 19            [11] 3754 	add	hl,de
   5BB4 7E            [ 7] 3755 	ld	a,(hl)
   5BB5 D6 05         [ 7] 3756 	sub	a, #0x05
   5BB7 CA 37 5C      [10] 3757 	jp	Z,00112$
                           3758 ;src/main.c:200: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5BBA 69            [ 4] 3759 	ld	l, c
   5BBB 60            [ 4] 3760 	ld	h, b
   5BBC DD 7E F8      [19] 3761 	ld	a,-8 (ix)
   5BBF B7            [ 4] 3762 	or	a, a
   5BC0 28 06         [12] 3763 	jr	Z,00141$
   5BC2 DD 6E F9      [19] 3764 	ld	l,-7 (ix)
   5BC5 DD 66 FA      [19] 3765 	ld	h,-6 (ix)
   5BC8                    3766 00141$:
   5BC8 CB 2C         [ 8] 3767 	sra	h
   5BCA CB 1D         [ 8] 3768 	rr	l
   5BCC CB 2C         [ 8] 3769 	sra	h
   5BCE CB 1D         [ 8] 3770 	rr	l
   5BD0 CB 2C         [ 8] 3771 	sra	h
   5BD2 CB 1D         [ 8] 3772 	rr	l
   5BD4 CB 2C         [ 8] 3773 	sra	h
   5BD6 CB 1D         [ 8] 3774 	rr	l
   5BD8 5D            [ 4] 3775 	ld	e, l
   5BD9 54            [ 4] 3776 	ld	d, h
   5BDA 29            [11] 3777 	add	hl, hl
   5BDB 29            [11] 3778 	add	hl, hl
   5BDC 19            [11] 3779 	add	hl, de
   5BDD 29            [11] 3780 	add	hl, hl
   5BDE 29            [11] 3781 	add	hl, hl
   5BDF 11 C8 6C      [10] 3782 	ld	de,#_scene
   5BE2 19            [11] 3783 	add	hl,de
   5BE3 DD 5E F7      [19] 3784 	ld	e,-9 (ix)
   5BE6 16 00         [ 7] 3785 	ld	d,#0x00
   5BE8 19            [11] 3786 	add	hl,de
   5BE9 7E            [ 7] 3787 	ld	a,(hl)
   5BEA D6 05         [ 7] 3788 	sub	a, #0x05
   5BEC 28 49         [12] 3789 	jr	Z,00112$
                           3790 ;src/main.c:201: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5BEE 69            [ 4] 3791 	ld	l, c
   5BEF 60            [ 4] 3792 	ld	h, b
   5BF0 DD 7E F8      [19] 3793 	ld	a,-8 (ix)
   5BF3 B7            [ 4] 3794 	or	a, a
   5BF4 28 06         [12] 3795 	jr	Z,00142$
   5BF6 DD 6E F9      [19] 3796 	ld	l,-7 (ix)
   5BF9 DD 66 FA      [19] 3797 	ld	h,-6 (ix)
   5BFC                    3798 00142$:
   5BFC CB 2C         [ 8] 3799 	sra	h
   5BFE CB 1D         [ 8] 3800 	rr	l
   5C00 CB 2C         [ 8] 3801 	sra	h
   5C02 CB 1D         [ 8] 3802 	rr	l
   5C04 CB 2C         [ 8] 3803 	sra	h
   5C06 CB 1D         [ 8] 3804 	rr	l
   5C08 CB 2C         [ 8] 3805 	sra	h
   5C0A CB 1D         [ 8] 3806 	rr	l
   5C0C 5D            [ 4] 3807 	ld	e, l
   5C0D 54            [ 4] 3808 	ld	d, h
   5C0E 29            [11] 3809 	add	hl, hl
   5C0F 29            [11] 3810 	add	hl, hl
   5C10 19            [11] 3811 	add	hl, de
   5C11 29            [11] 3812 	add	hl, hl
   5C12 29            [11] 3813 	add	hl, hl
   5C13 3E C8         [ 7] 3814 	ld	a,#<(_scene)
   5C15 85            [ 4] 3815 	add	a, l
   5C16 5F            [ 4] 3816 	ld	e,a
   5C17 3E 6C         [ 7] 3817 	ld	a,#>(_scene)
   5C19 8C            [ 4] 3818 	adc	a, h
   5C1A 57            [ 4] 3819 	ld	d,a
   5C1B DD 6E FB      [19] 3820 	ld	l,-5 (ix)
   5C1E DD 66 FC      [19] 3821 	ld	h,-4 (ix)
   5C21 DD 7E FD      [19] 3822 	ld	a,-3 (ix)
   5C24 B7            [ 4] 3823 	or	a, a
   5C25 28 02         [12] 3824 	jr	Z,00143$
   5C27 E1            [10] 3825 	pop	hl
   5C28 E5            [11] 3826 	push	hl
   5C29                    3827 00143$:
   5C29 CB 2C         [ 8] 3828 	sra	h
   5C2B CB 1D         [ 8] 3829 	rr	l
   5C2D CB 2C         [ 8] 3830 	sra	h
   5C2F CB 1D         [ 8] 3831 	rr	l
   5C31 19            [11] 3832 	add	hl,de
   5C32 7E            [ 7] 3833 	ld	a,(hl)
   5C33 D6 05         [ 7] 3834 	sub	a, #0x05
   5C35 20 21         [12] 3835 	jr	NZ,00113$
   5C37                    3836 00112$:
                           3837 ;src/main.c:203: if(player.bullets < 3 && *flecha == 0){
   5C37 FD 21 D4 6D   [14] 3838 	ld	iy,#_player + 10
   5C3B FD 5E 00      [19] 3839 	ld	e, 0 (iy)
   5C3E 7B            [ 4] 3840 	ld	a,e
   5C3F D6 03         [ 7] 3841 	sub	a, #0x03
   5C41 D2 22 5D      [10] 3842 	jp	NC,00130$
   5C44 DD 6E 06      [19] 3843 	ld	l,6 (ix)
   5C47 DD 66 07      [19] 3844 	ld	h,7 (ix)
   5C4A 7E            [ 7] 3845 	ld	a,(hl)
   5C4B B7            [ 4] 3846 	or	a, a
   5C4C C2 22 5D      [10] 3847 	jp	NZ,00130$
                           3848 ;src/main.c:204: player.bullets += 1;
   5C4F 1C            [ 4] 3849 	inc	e
   5C50 FD 73 00      [19] 3850 	ld	0 (iy), e
                           3851 ;src/main.c:205: *flecha = 1;
   5C53 36 01         [10] 3852 	ld	(hl),#0x01
   5C55 C3 22 5D      [10] 3853 	jp	00130$
   5C58                    3854 00113$:
                           3855 ;src/main.c:207: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5C58 DD 7E F6      [19] 3856 	ld	a,-10 (ix)
   5C5B D6 09         [ 7] 3857 	sub	a, #0x09
   5C5D CA 08 5D      [10] 3858 	jp	Z,00107$
                           3859 ;src/main.c:208: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C60 DD 6E FB      [19] 3860 	ld	l,-5 (ix)
   5C63 DD 66 FC      [19] 3861 	ld	h,-4 (ix)
   5C66 DD 7E FD      [19] 3862 	ld	a,-3 (ix)
   5C69 B7            [ 4] 3863 	or	a, a
   5C6A 28 02         [12] 3864 	jr	Z,00144$
   5C6C E1            [10] 3865 	pop	hl
   5C6D E5            [11] 3866 	push	hl
   5C6E                    3867 00144$:
   5C6E CB 2C         [ 8] 3868 	sra	h
   5C70 CB 1D         [ 8] 3869 	rr	l
   5C72 CB 2C         [ 8] 3870 	sra	h
   5C74 CB 1D         [ 8] 3871 	rr	l
   5C76 DD 5E F4      [19] 3872 	ld	e,-12 (ix)
   5C79 DD 56 F5      [19] 3873 	ld	d,-11 (ix)
   5C7C 19            [11] 3874 	add	hl,de
   5C7D 7E            [ 7] 3875 	ld	a,(hl)
   5C7E D6 09         [ 7] 3876 	sub	a, #0x09
   5C80 CA 08 5D      [10] 3877 	jp	Z,00107$
                           3878 ;src/main.c:209: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5C83 69            [ 4] 3879 	ld	l, c
   5C84 60            [ 4] 3880 	ld	h, b
   5C85 DD 7E F8      [19] 3881 	ld	a,-8 (ix)
   5C88 B7            [ 4] 3882 	or	a, a
   5C89 28 06         [12] 3883 	jr	Z,00145$
   5C8B DD 6E F9      [19] 3884 	ld	l,-7 (ix)
   5C8E DD 66 FA      [19] 3885 	ld	h,-6 (ix)
   5C91                    3886 00145$:
   5C91 CB 2C         [ 8] 3887 	sra	h
   5C93 CB 1D         [ 8] 3888 	rr	l
   5C95 CB 2C         [ 8] 3889 	sra	h
   5C97 CB 1D         [ 8] 3890 	rr	l
   5C99 CB 2C         [ 8] 3891 	sra	h
   5C9B CB 1D         [ 8] 3892 	rr	l
   5C9D CB 2C         [ 8] 3893 	sra	h
   5C9F CB 1D         [ 8] 3894 	rr	l
   5CA1 5D            [ 4] 3895 	ld	e, l
   5CA2 54            [ 4] 3896 	ld	d, h
   5CA3 29            [11] 3897 	add	hl, hl
   5CA4 29            [11] 3898 	add	hl, hl
   5CA5 19            [11] 3899 	add	hl, de
   5CA6 29            [11] 3900 	add	hl, hl
   5CA7 29            [11] 3901 	add	hl, hl
   5CA8 11 C8 6C      [10] 3902 	ld	de,#_scene
   5CAB 19            [11] 3903 	add	hl,de
   5CAC DD 5E F7      [19] 3904 	ld	e,-9 (ix)
   5CAF 16 00         [ 7] 3905 	ld	d,#0x00
   5CB1 19            [11] 3906 	add	hl,de
   5CB2 7E            [ 7] 3907 	ld	a,(hl)
   5CB3 D6 09         [ 7] 3908 	sub	a, #0x09
   5CB5 28 51         [12] 3909 	jr	Z,00107$
                           3910 ;src/main.c:210: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5CB7 DD 7E F8      [19] 3911 	ld	a,-8 (ix)
   5CBA B7            [ 4] 3912 	or	a, a
   5CBB 28 06         [12] 3913 	jr	Z,00146$
   5CBD DD 4E F9      [19] 3914 	ld	c,-7 (ix)
   5CC0 DD 46 FA      [19] 3915 	ld	b,-6 (ix)
   5CC3                    3916 00146$:
   5CC3 CB 28         [ 8] 3917 	sra	b
   5CC5 CB 19         [ 8] 3918 	rr	c
   5CC7 CB 28         [ 8] 3919 	sra	b
   5CC9 CB 19         [ 8] 3920 	rr	c
   5CCB CB 28         [ 8] 3921 	sra	b
   5CCD CB 19         [ 8] 3922 	rr	c
   5CCF CB 28         [ 8] 3923 	sra	b
   5CD1 CB 19         [ 8] 3924 	rr	c
   5CD3 69            [ 4] 3925 	ld	l, c
   5CD4 60            [ 4] 3926 	ld	h, b
   5CD5 29            [11] 3927 	add	hl, hl
   5CD6 29            [11] 3928 	add	hl, hl
   5CD7 09            [11] 3929 	add	hl, bc
   5CD8 29            [11] 3930 	add	hl, hl
   5CD9 29            [11] 3931 	add	hl, hl
   5CDA 3E C8         [ 7] 3932 	ld	a,#<(_scene)
   5CDC 85            [ 4] 3933 	add	a, l
   5CDD DD 77 F9      [19] 3934 	ld	-7 (ix),a
   5CE0 3E 6C         [ 7] 3935 	ld	a,#>(_scene)
   5CE2 8C            [ 4] 3936 	adc	a, h
   5CE3 DD 77 FA      [19] 3937 	ld	-6 (ix),a
   5CE6 DD 6E FB      [19] 3938 	ld	l,-5 (ix)
   5CE9 DD 66 FC      [19] 3939 	ld	h,-4 (ix)
   5CEC DD 7E FD      [19] 3940 	ld	a,-3 (ix)
   5CEF B7            [ 4] 3941 	or	a, a
   5CF0 28 02         [12] 3942 	jr	Z,00147$
   5CF2 E1            [10] 3943 	pop	hl
   5CF3 E5            [11] 3944 	push	hl
   5CF4                    3945 00147$:
   5CF4 CB 2C         [ 8] 3946 	sra	h
   5CF6 CB 1D         [ 8] 3947 	rr	l
   5CF8 CB 2C         [ 8] 3948 	sra	h
   5CFA CB 1D         [ 8] 3949 	rr	l
   5CFC DD 5E F9      [19] 3950 	ld	e,-7 (ix)
   5CFF DD 56 FA      [19] 3951 	ld	d,-6 (ix)
   5D02 19            [11] 3952 	add	hl,de
   5D03 7E            [ 7] 3953 	ld	a,(hl)
   5D04 D6 09         [ 7] 3954 	sub	a, #0x09
   5D06 20 1A         [12] 3955 	jr	NZ,00130$
   5D08                    3956 00107$:
                           3957 ;src/main.c:213: cpct_clearScreen(0);
   5D08 21 00 40      [10] 3958 	ld	hl,#0x4000
   5D0B E5            [11] 3959 	push	hl
   5D0C AF            [ 4] 3960 	xor	a, a
   5D0D F5            [11] 3961 	push	af
   5D0E 33            [ 6] 3962 	inc	sp
   5D0F 26 C0         [ 7] 3963 	ld	h, #0xC0
   5D11 E5            [11] 3964 	push	hl
   5D12 CD 20 6B      [17] 3965 	call	_cpct_memset
                           3966 ;src/main.c:214: map+=1;
   5D15 21 B9 6D      [10] 3967 	ld	hl, #_map+0
   5D18 34            [11] 3968 	inc	(hl)
                           3969 ;src/main.c:215: drawMap(map);
   5D19 3A B9 6D      [13] 3970 	ld	a,(_map)
   5D1C F5            [11] 3971 	push	af
   5D1D 33            [ 6] 3972 	inc	sp
   5D1E CD C0 46      [17] 3973 	call	_drawMap
   5D21 33            [ 6] 3974 	inc	sp
   5D22                    3975 00130$:
   5D22 DD F9         [10] 3976 	ld	sp, ix
   5D24 DD E1         [14] 3977 	pop	ix
   5D26 C9            [10] 3978 	ret
                           3979 ;src/main.c:219: u8 checkArrowCollisions(){
                           3980 ;	---------------------------------
                           3981 ; Function checkArrowCollisions
                           3982 ; ---------------------------------
   5D27                    3983 _checkArrowCollisions::
   5D27 DD E5         [15] 3984 	push	ix
   5D29 DD 21 00 00   [14] 3985 	ld	ix,#0
   5D2D DD 39         [15] 3986 	add	ix,sp
   5D2F F5            [11] 3987 	push	af
   5D30 F5            [11] 3988 	push	af
                           3989 ;src/main.c:222: u8 bound =0;
   5D31 DD 36 FC 00   [19] 3990 	ld	-4 (ix),#0x00
                           3991 ;src/main.c:224: if(object.dir == 2 || object.dir == 8){
   5D35 3A C7 6D      [13] 3992 	ld	a,(#_object + 7)
   5D38 FE 02         [ 7] 3993 	cp	a,#0x02
   5D3A 28 04         [12] 3994 	jr	Z,00101$
   5D3C D6 08         [ 7] 3995 	sub	a, #0x08
   5D3E 20 06         [12] 3996 	jr	NZ,00102$
   5D40                    3997 00101$:
                           3998 ;src/main.c:225: auxX = 2;
   5D40 1E 02         [ 7] 3999 	ld	e,#0x02
                           4000 ;src/main.c:226: auxY = 8;
   5D42 0E 08         [ 7] 4001 	ld	c,#0x08
   5D44 18 04         [12] 4002 	jr	00103$
   5D46                    4003 00102$:
                           4004 ;src/main.c:228: auxX = 4;
   5D46 1E 04         [ 7] 4005 	ld	e,#0x04
                           4006 ;src/main.c:229: auxY = 4;
   5D48 0E 04         [ 7] 4007 	ld	c,#0x04
   5D4A                    4008 00103$:
                           4009 ;src/main.c:232: if(    scene[(object.y)/auxY][(object.x)/auxX] == 1
   5D4A 21 C1 6D      [10] 4010 	ld	hl, #(_object + 0x0001) + 0
   5D4D 46            [ 7] 4011 	ld	b,(hl)
   5D4E C5            [11] 4012 	push	bc
   5D4F D5            [11] 4013 	push	de
   5D50 79            [ 4] 4014 	ld	a,c
   5D51 F5            [11] 4015 	push	af
   5D52 33            [ 6] 4016 	inc	sp
   5D53 C5            [11] 4017 	push	bc
   5D54 33            [ 6] 4018 	inc	sp
   5D55 CD 5F 6A      [17] 4019 	call	__divuchar
   5D58 F1            [10] 4020 	pop	af
   5D59 D1            [10] 4021 	pop	de
   5D5A C1            [10] 4022 	pop	bc
   5D5B D5            [11] 4023 	push	de
   5D5C 5D            [ 4] 4024 	ld	e,l
   5D5D 16 00         [ 7] 4025 	ld	d,#0x00
   5D5F 6B            [ 4] 4026 	ld	l, e
   5D60 62            [ 4] 4027 	ld	h, d
   5D61 29            [11] 4028 	add	hl, hl
   5D62 29            [11] 4029 	add	hl, hl
   5D63 19            [11] 4030 	add	hl, de
   5D64 29            [11] 4031 	add	hl, hl
   5D65 29            [11] 4032 	add	hl, hl
   5D66 D1            [10] 4033 	pop	de
   5D67 3E C8         [ 7] 4034 	ld	a,#<(_scene)
   5D69 85            [ 4] 4035 	add	a, l
   5D6A DD 77 FD      [19] 4036 	ld	-3 (ix),a
   5D6D 3E 6C         [ 7] 4037 	ld	a,#>(_scene)
   5D6F 8C            [ 4] 4038 	adc	a, h
   5D70 DD 77 FE      [19] 4039 	ld	-2 (ix),a
   5D73 21 C0 6D      [10] 4040 	ld	hl, #_object + 0
   5D76 56            [ 7] 4041 	ld	d,(hl)
   5D77 C5            [11] 4042 	push	bc
   5D78 D5            [11] 4043 	push	de
   5D79 7B            [ 4] 4044 	ld	a,e
   5D7A F5            [11] 4045 	push	af
   5D7B 33            [ 6] 4046 	inc	sp
   5D7C D5            [11] 4047 	push	de
   5D7D 33            [ 6] 4048 	inc	sp
   5D7E CD 5F 6A      [17] 4049 	call	__divuchar
   5D81 F1            [10] 4050 	pop	af
   5D82 DD 75 FF      [19] 4051 	ld	-1 (ix),l
   5D85 D1            [10] 4052 	pop	de
   5D86 C1            [10] 4053 	pop	bc
   5D87 DD 7E FD      [19] 4054 	ld	a,-3 (ix)
   5D8A DD 86 FF      [19] 4055 	add	a, -1 (ix)
   5D8D 6F            [ 4] 4056 	ld	l,a
   5D8E DD 7E FE      [19] 4057 	ld	a,-2 (ix)
   5D91 CE 00         [ 7] 4058 	adc	a, #0x00
   5D93 67            [ 4] 4059 	ld	h,a
   5D94 7E            [ 7] 4060 	ld	a,(hl)
   5D95 3D            [ 4] 4061 	dec	a
   5D96 28 4D         [12] 4062 	jr	Z,00105$
                           4063 ;src/main.c:233: || scene[(object.y)/auxY][(object.x+auxX-1)/auxX] == 1
   5D98 6A            [ 4] 4064 	ld	l,d
   5D99 26 00         [ 7] 4065 	ld	h,#0x00
   5D9B 16 00         [ 7] 4066 	ld	d,#0x00
   5D9D 19            [11] 4067 	add	hl,de
   5D9E 2B            [ 6] 4068 	dec	hl
   5D9F C5            [11] 4069 	push	bc
   5DA0 D5            [11] 4070 	push	de
   5DA1 E5            [11] 4071 	push	hl
   5DA2 CD 64 6C      [17] 4072 	call	__divsint
   5DA5 F1            [10] 4073 	pop	af
   5DA6 F1            [10] 4074 	pop	af
   5DA7 EB            [ 4] 4075 	ex	de,hl
   5DA8 C1            [10] 4076 	pop	bc
   5DA9 DD 6E FD      [19] 4077 	ld	l,-3 (ix)
   5DAC DD 66 FE      [19] 4078 	ld	h,-2 (ix)
   5DAF 19            [11] 4079 	add	hl,de
   5DB0 7E            [ 7] 4080 	ld	a,(hl)
   5DB1 3D            [ 4] 4081 	dec	a
   5DB2 28 31         [12] 4082 	jr	Z,00105$
                           4083 ;src/main.c:234: || scene[(object.y+auxY-2)/auxY][(object.x)/auxX] == 1
   5DB4 68            [ 4] 4084 	ld	l,b
   5DB5 26 00         [ 7] 4085 	ld	h,#0x00
   5DB7 06 00         [ 7] 4086 	ld	b,#0x00
   5DB9 09            [11] 4087 	add	hl,bc
   5DBA 2B            [ 6] 4088 	dec	hl
   5DBB 2B            [ 6] 4089 	dec	hl
   5DBC D5            [11] 4090 	push	de
   5DBD C5            [11] 4091 	push	bc
   5DBE E5            [11] 4092 	push	hl
   5DBF CD 64 6C      [17] 4093 	call	__divsint
   5DC2 F1            [10] 4094 	pop	af
   5DC3 F1            [10] 4095 	pop	af
   5DC4 D1            [10] 4096 	pop	de
   5DC5 4D            [ 4] 4097 	ld	c, l
   5DC6 44            [ 4] 4098 	ld	b, h
   5DC7 29            [11] 4099 	add	hl, hl
   5DC8 29            [11] 4100 	add	hl, hl
   5DC9 09            [11] 4101 	add	hl, bc
   5DCA 29            [11] 4102 	add	hl, hl
   5DCB 29            [11] 4103 	add	hl, hl
   5DCC 3E C8         [ 7] 4104 	ld	a,#<(_scene)
   5DCE 85            [ 4] 4105 	add	a, l
   5DCF 4F            [ 4] 4106 	ld	c,a
   5DD0 3E 6C         [ 7] 4107 	ld	a,#>(_scene)
   5DD2 8C            [ 4] 4108 	adc	a, h
   5DD3 47            [ 4] 4109 	ld	b,a
   5DD4 DD 6E FF      [19] 4110 	ld	l,-1 (ix)
   5DD7 26 00         [ 7] 4111 	ld	h,#0x00
   5DD9 09            [11] 4112 	add	hl,bc
   5DDA 7E            [ 7] 4113 	ld	a,(hl)
   5DDB 3D            [ 4] 4114 	dec	a
   5DDC 28 07         [12] 4115 	jr	Z,00105$
                           4116 ;src/main.c:235: || scene[(object.y+auxY-2)/auxY][(object.x+auxX-1)/auxX] == 1
   5DDE 6B            [ 4] 4117 	ld	l, e
   5DDF 62            [ 4] 4118 	ld	h, d
   5DE0 09            [11] 4119 	add	hl,bc
   5DE1 7E            [ 7] 4120 	ld	a,(hl)
   5DE2 3D            [ 4] 4121 	dec	a
   5DE3 20 10         [12] 4122 	jr	NZ,00106$
   5DE5                    4123 00105$:
                           4124 ;src/main.c:237: object.x=object.lx;
   5DE5 3A C2 6D      [13] 4125 	ld	a, (#_object + 2)
   5DE8 32 C0 6D      [13] 4126 	ld	(#_object),a
                           4127 ;src/main.c:238: object.y=object.ly;
   5DEB 3A C3 6D      [13] 4128 	ld	a, (#_object + 3)
   5DEE 32 C1 6D      [13] 4129 	ld	(#(_object + 0x0001)),a
                           4130 ;src/main.c:239: bound = 1;
   5DF1 DD 36 FC 01   [19] 4131 	ld	-4 (ix),#0x01
   5DF5                    4132 00106$:
                           4133 ;src/main.c:242: return bound;
   5DF5 DD 6E FC      [19] 4134 	ld	l,-4 (ix)
   5DF8 DD F9         [10] 4135 	ld	sp, ix
   5DFA DD E1         [14] 4136 	pop	ix
   5DFC C9            [10] 4137 	ret
                           4138 ;src/main.c:248: void followPlayer(){
                           4139 ;	---------------------------------
                           4140 ; Function followPlayer
                           4141 ; ---------------------------------
   5DFD                    4142 _followPlayer::
   5DFD DD E5         [15] 4143 	push	ix
   5DFF DD 21 00 00   [14] 4144 	ld	ix,#0
   5E03 DD 39         [15] 4145 	add	ix,sp
   5E05 21 E5 FF      [10] 4146 	ld	hl,#-27
   5E08 39            [11] 4147 	add	hl,sp
   5E09 F9            [ 6] 4148 	ld	sp,hl
                           4149 ;src/main.c:251: if(detectPlayerRoom(player.x,player.y) != enemy.room){
   5E0A 21 CB 6D      [10] 4150 	ld	hl, #(_player + 0x0001) + 0
   5E0D 56            [ 7] 4151 	ld	d,(hl)
   5E0E 3A CA 6D      [13] 4152 	ld	a, (#_player + 0)
   5E11 D5            [11] 4153 	push	de
   5E12 33            [ 6] 4154 	inc	sp
   5E13 F5            [11] 4155 	push	af
   5E14 33            [ 6] 4156 	inc	sp
   5E15 CD 76 4F      [17] 4157 	call	_detectPlayerRoom
   5E18 F1            [10] 4158 	pop	af
   5E19 DD 75 FF      [19] 4159 	ld	-1 (ix),l
   5E1C 21 E0 6D      [10] 4160 	ld	hl, #_enemy + 11
   5E1F DD 7E FF      [19] 4161 	ld	a,-1 (ix)
   5E22 96            [ 7] 4162 	sub	a,(hl)
   5E23 28 0C         [12] 4163 	jr	Z,00102$
                           4164 ;src/main.c:252: auxX = enemy.seenX;
   5E25 3A E1 6D      [13] 4165 	ld	a,(#_enemy + 12)
   5E28 DD 77 E5      [19] 4166 	ld	-27 (ix),a
                           4167 ;src/main.c:253: auxY = enemy.seenY;
   5E2B 21 E2 6D      [10] 4168 	ld	hl, #_enemy + 13
   5E2E 56            [ 7] 4169 	ld	d,(hl)
   5E2F 18 0B         [12] 4170 	jr	00103$
   5E31                    4171 00102$:
                           4172 ;src/main.c:255: auxX = player.x;
   5E31 21 CA 6D      [10] 4173 	ld	hl, #_player + 0
   5E34 7E            [ 7] 4174 	ld	a,(hl)
   5E35 DD 77 E5      [19] 4175 	ld	-27 (ix),a
                           4176 ;src/main.c:256: auxY = player.y;
   5E38 21 CB 6D      [10] 4177 	ld	hl, #(_player + 0x0001) + 0
   5E3B 56            [ 7] 4178 	ld	d,(hl)
   5E3C                    4179 00103$:
                           4180 ;src/main.c:260: if(auxX < enemy.x){
   5E3C 3A D5 6D      [13] 4181 	ld	a,(#_enemy + 0)
                           4182 ;src/main.c:262: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E3F DD 77 FF      [19] 4183 	ld	-1 (ix), a
   5E42 DD 77 FD      [19] 4184 	ld	-3 (ix),a
   5E45 DD 36 FE 00   [19] 4185 	ld	-2 (ix),#0x00
                           4186 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5E49 DD 7E FF      [19] 4187 	ld	a,-1 (ix)
   5E4C 0F            [ 4] 4188 	rrca
   5E4D 0F            [ 4] 4189 	rrca
   5E4E E6 3F         [ 7] 4190 	and	a,#0x3F
   5E50 DD 77 FC      [19] 4191 	ld	-4 (ix),a
                           4192 ;src/main.c:262: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E53 21 D6 6D      [10] 4193 	ld	hl, #(_enemy + 0x0001) + 0
   5E56 5E            [ 7] 4194 	ld	e,(hl)
   5E57 DD 7E FD      [19] 4195 	ld	a,-3 (ix)
   5E5A C6 FF         [ 7] 4196 	add	a,#0xFF
   5E5C DD 77 FA      [19] 4197 	ld	-6 (ix),a
   5E5F DD 7E FE      [19] 4198 	ld	a,-2 (ix)
   5E62 CE FF         [ 7] 4199 	adc	a,#0xFF
   5E64 DD 77 FB      [19] 4200 	ld	-5 (ix),a
   5E67 DD 7E FD      [19] 4201 	ld	a,-3 (ix)
   5E6A C6 02         [ 7] 4202 	add	a, #0x02
   5E6C DD 77 F8      [19] 4203 	ld	-8 (ix),a
   5E6F DD 7E FE      [19] 4204 	ld	a,-2 (ix)
   5E72 CE 00         [ 7] 4205 	adc	a, #0x00
   5E74 DD 77 F9      [19] 4206 	ld	-7 (ix),a
   5E77 7B            [ 4] 4207 	ld	a,e
   5E78 07            [ 4] 4208 	rlca
   5E79 07            [ 4] 4209 	rlca
   5E7A 07            [ 4] 4210 	rlca
   5E7B 07            [ 4] 4211 	rlca
   5E7C E6 0F         [ 7] 4212 	and	a,#0x0F
   5E7E 67            [ 4] 4213 	ld	h,a
   5E7F DD 7E FB      [19] 4214 	ld	a,-5 (ix)
   5E82 07            [ 4] 4215 	rlca
   5E83 E6 01         [ 7] 4216 	and	a,#0x01
   5E85 DD 77 F7      [19] 4217 	ld	-9 (ix),a
                           4218 ;src/main.c:264: }else if(auxY < enemy.y){
   5E88 7A            [ 4] 4219 	ld	a,d
   5E89 93            [ 4] 4220 	sub	a, e
   5E8A 3E 00         [ 7] 4221 	ld	a,#0x00
   5E8C 17            [ 4] 4222 	rla
   5E8D DD 77 F6      [19] 4223 	ld	-10 (ix),a
                           4224 ;src/main.c:266: enemy.y-=1;
   5E90 7B            [ 4] 4225 	ld	a,e
   5E91 C6 FF         [ 7] 4226 	add	a,#0xFF
   5E93 DD 77 F5      [19] 4227 	ld	-11 (ix),a
                           4228 ;src/main.c:269: enemy.y+=1;
   5E96 7B            [ 4] 4229 	ld	a,e
   5E97 3C            [ 4] 4230 	inc	a
   5E98 DD 77 F4      [19] 4231 	ld	-12 (ix),a
                           4232 ;src/main.c:279: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5E9B 16 00         [ 7] 4233 	ld	d,#0x00
                           4234 ;src/main.c:262: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5E9D 4C            [ 4] 4235 	ld	c,h
   5E9E 06 00         [ 7] 4236 	ld	b,#0x00
   5EA0 69            [ 4] 4237 	ld	l, c
   5EA1 60            [ 4] 4238 	ld	h, b
   5EA2 29            [11] 4239 	add	hl, hl
   5EA3 29            [11] 4240 	add	hl, hl
   5EA4 09            [11] 4241 	add	hl, bc
   5EA5 29            [11] 4242 	add	hl, hl
   5EA6 29            [11] 4243 	add	hl, hl
   5EA7 DD 75 F2      [19] 4244 	ld	-14 (ix),l
   5EAA DD 74 F3      [19] 4245 	ld	-13 (ix),h
                           4246 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5EAD 7B            [ 4] 4247 	ld	a,e
   5EAE C6 FF         [ 7] 4248 	add	a,#0xFF
   5EB0 DD 77 F0      [19] 4249 	ld	-16 (ix),a
   5EB3 7A            [ 4] 4250 	ld	a,d
   5EB4 CE FF         [ 7] 4251 	adc	a,#0xFF
   5EB6 DD 77 F1      [19] 4252 	ld	-15 (ix),a
   5EB9 21 0E 00      [10] 4253 	ld	hl,#0x000E
   5EBC 19            [11] 4254 	add	hl,de
   5EBD DD 75 EE      [19] 4255 	ld	-18 (ix),l
   5EC0 DD 74 EF      [19] 4256 	ld	-17 (ix),h
                           4257 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5EC3 21 10 00      [10] 4258 	ld	hl,#0x0010
   5EC6 19            [11] 4259 	add	hl,de
   5EC7 DD 75 EC      [19] 4260 	ld	-20 (ix),l
   5ECA DD 74 ED      [19] 4261 	ld	-19 (ix),h
   5ECD 21 1F 00      [10] 4262 	ld	hl,#0x001F
   5ED0 19            [11] 4263 	add	hl,de
   5ED1 DD 75 EA      [19] 4264 	ld	-22 (ix),l
   5ED4 DD 74 EB      [19] 4265 	ld	-21 (ix),h
                           4266 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5ED7 DD 7E F1      [19] 4267 	ld	a,-15 (ix)
   5EDA 07            [ 4] 4268 	rlca
   5EDB E6 01         [ 7] 4269 	and	a,#0x01
   5EDD DD 77 E9      [19] 4270 	ld	-23 (ix),a
                           4271 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5EE0 DD 7E ED      [19] 4272 	ld	a,-19 (ix)
   5EE3 07            [ 4] 4273 	rlca
   5EE4 E6 01         [ 7] 4274 	and	a,#0x01
   5EE6 DD 77 E8      [19] 4275 	ld	-24 (ix),a
                           4276 ;src/main.c:260: if(auxX < enemy.x){
   5EE9 DD 7E E5      [19] 4277 	ld	a,-27 (ix)
   5EEC DD 96 FF      [19] 4278 	sub	a, -1 (ix)
   5EEF D2 B2 5F      [10] 4279 	jp	NC,00135$
                           4280 ;src/main.c:262: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1){
   5EF2 DD 7E F2      [19] 4281 	ld	a,-14 (ix)
   5EF5 C6 C8         [ 7] 4282 	add	a, #<(_scene)
   5EF7 6F            [ 4] 4283 	ld	l,a
   5EF8 DD 7E F3      [19] 4284 	ld	a,-13 (ix)
   5EFB CE 6C         [ 7] 4285 	adc	a, #>(_scene)
   5EFD 67            [ 4] 4286 	ld	h,a
   5EFE DD 5E FA      [19] 4287 	ld	e,-6 (ix)
   5F01 DD 56 FB      [19] 4288 	ld	d,-5 (ix)
   5F04 DD 7E F7      [19] 4289 	ld	a,-9 (ix)
   5F07 B7            [ 4] 4290 	or	a, a
   5F08 28 06         [12] 4291 	jr	Z,00139$
   5F0A DD 5E F8      [19] 4292 	ld	e,-8 (ix)
   5F0D DD 56 F9      [19] 4293 	ld	d,-7 (ix)
   5F10                    4294 00139$:
   5F10 CB 2A         [ 8] 4295 	sra	d
   5F12 CB 1B         [ 8] 4296 	rr	e
   5F14 CB 2A         [ 8] 4297 	sra	d
   5F16 CB 1B         [ 8] 4298 	rr	e
   5F18 19            [11] 4299 	add	hl,de
   5F19 7E            [ 7] 4300 	ld	a,(hl)
   5F1A 3D            [ 4] 4301 	dec	a
   5F1B 28 0B         [12] 4302 	jr	Z,00112$
                           4303 ;src/main.c:263: enemy.x-=1;
   5F1D DD 56 FF      [19] 4304 	ld	d,-1 (ix)
   5F20 15            [ 4] 4305 	dec	d
   5F21 21 D5 6D      [10] 4306 	ld	hl,#_enemy
   5F24 72            [ 7] 4307 	ld	(hl),d
   5F25 C3 10 61      [10] 4308 	jp	00137$
   5F28                    4309 00112$:
                           4310 ;src/main.c:264: }else if(auxY < enemy.y){
   5F28 DD 7E F6      [19] 4311 	ld	a,-10 (ix)
   5F2B B7            [ 4] 4312 	or	a, a
   5F2C 28 42         [12] 4313 	jr	Z,00109$
                           4314 ;src/main.c:265: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   5F2E DD 4E F0      [19] 4315 	ld	c,-16 (ix)
   5F31 DD 46 F1      [19] 4316 	ld	b,-15 (ix)
   5F34 DD 7E E9      [19] 4317 	ld	a,-23 (ix)
   5F37 B7            [ 4] 4318 	or	a, a
   5F38 28 06         [12] 4319 	jr	Z,00140$
   5F3A DD 4E EE      [19] 4320 	ld	c,-18 (ix)
   5F3D DD 46 EF      [19] 4321 	ld	b,-17 (ix)
   5F40                    4322 00140$:
   5F40 CB 28         [ 8] 4323 	sra	b
   5F42 CB 19         [ 8] 4324 	rr	c
   5F44 CB 28         [ 8] 4325 	sra	b
   5F46 CB 19         [ 8] 4326 	rr	c
   5F48 CB 28         [ 8] 4327 	sra	b
   5F4A CB 19         [ 8] 4328 	rr	c
   5F4C CB 28         [ 8] 4329 	sra	b
   5F4E CB 19         [ 8] 4330 	rr	c
   5F50 69            [ 4] 4331 	ld	l, c
   5F51 60            [ 4] 4332 	ld	h, b
   5F52 29            [11] 4333 	add	hl, hl
   5F53 29            [11] 4334 	add	hl, hl
   5F54 09            [11] 4335 	add	hl, bc
   5F55 29            [11] 4336 	add	hl, hl
   5F56 29            [11] 4337 	add	hl, hl
   5F57 11 C8 6C      [10] 4338 	ld	de,#_scene
   5F5A 19            [11] 4339 	add	hl,de
   5F5B DD 5E FC      [19] 4340 	ld	e,-4 (ix)
   5F5E 16 00         [ 7] 4341 	ld	d,#0x00
   5F60 19            [11] 4342 	add	hl,de
   5F61 7E            [ 7] 4343 	ld	a,(hl)
   5F62 3D            [ 4] 4344 	dec	a
   5F63 CA 10 61      [10] 4345 	jp	Z,00137$
                           4346 ;src/main.c:266: enemy.y-=1;
   5F66 21 D6 6D      [10] 4347 	ld	hl,#(_enemy + 0x0001)
   5F69 DD 7E F5      [19] 4348 	ld	a,-11 (ix)
   5F6C 77            [ 7] 4349 	ld	(hl),a
   5F6D C3 10 61      [10] 4350 	jp	00137$
   5F70                    4351 00109$:
                           4352 ;src/main.c:268: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   5F70 DD 4E EC      [19] 4353 	ld	c,-20 (ix)
   5F73 DD 46 ED      [19] 4354 	ld	b,-19 (ix)
   5F76 DD 7E E8      [19] 4355 	ld	a,-24 (ix)
   5F79 B7            [ 4] 4356 	or	a, a
   5F7A 28 06         [12] 4357 	jr	Z,00141$
   5F7C DD 4E EA      [19] 4358 	ld	c,-22 (ix)
   5F7F DD 46 EB      [19] 4359 	ld	b,-21 (ix)
   5F82                    4360 00141$:
   5F82 CB 28         [ 8] 4361 	sra	b
   5F84 CB 19         [ 8] 4362 	rr	c
   5F86 CB 28         [ 8] 4363 	sra	b
   5F88 CB 19         [ 8] 4364 	rr	c
   5F8A CB 28         [ 8] 4365 	sra	b
   5F8C CB 19         [ 8] 4366 	rr	c
   5F8E CB 28         [ 8] 4367 	sra	b
   5F90 CB 19         [ 8] 4368 	rr	c
   5F92 69            [ 4] 4369 	ld	l, c
   5F93 60            [ 4] 4370 	ld	h, b
   5F94 29            [11] 4371 	add	hl, hl
   5F95 29            [11] 4372 	add	hl, hl
   5F96 09            [11] 4373 	add	hl, bc
   5F97 29            [11] 4374 	add	hl, hl
   5F98 29            [11] 4375 	add	hl, hl
   5F99 11 C8 6C      [10] 4376 	ld	de,#_scene
   5F9C 19            [11] 4377 	add	hl,de
   5F9D DD 5E FC      [19] 4378 	ld	e,-4 (ix)
   5FA0 16 00         [ 7] 4379 	ld	d,#0x00
   5FA2 19            [11] 4380 	add	hl,de
   5FA3 7E            [ 7] 4381 	ld	a,(hl)
   5FA4 3D            [ 4] 4382 	dec	a
   5FA5 CA 10 61      [10] 4383 	jp	Z,00137$
                           4384 ;src/main.c:269: enemy.y+=1;
   5FA8 21 D6 6D      [10] 4385 	ld	hl,#(_enemy + 0x0001)
   5FAB DD 7E F4      [19] 4386 	ld	a,-12 (ix)
   5FAE 77            [ 7] 4387 	ld	(hl),a
   5FAF C3 10 61      [10] 4388 	jp	00137$
   5FB2                    4389 00135$:
                           4390 ;src/main.c:271: }else if(auxX > enemy.x){
   5FB2 DD 7E FF      [19] 4391 	ld	a,-1 (ix)
   5FB5 DD 96 E5      [19] 4392 	sub	a, -27 (ix)
   5FB8 D2 8C 60      [10] 4393 	jp	NC,00132$
                           4394 ;src/main.c:273: if(scene[(enemy.y)/tileheight][(enemy.x+tilewidth)/tilewidth] != 1){
   5FBB 3E C8         [ 7] 4395 	ld	a,#<(_scene)
   5FBD DD 86 F2      [19] 4396 	add	a, -14 (ix)
   5FC0 DD 77 F2      [19] 4397 	ld	-14 (ix),a
   5FC3 3E 6C         [ 7] 4398 	ld	a,#>(_scene)
   5FC5 DD 8E F3      [19] 4399 	adc	a, -13 (ix)
   5FC8 DD 77 F3      [19] 4400 	ld	-13 (ix),a
   5FCB DD 7E FD      [19] 4401 	ld	a,-3 (ix)
   5FCE C6 04         [ 7] 4402 	add	a, #0x04
   5FD0 67            [ 4] 4403 	ld	h,a
   5FD1 DD 7E FE      [19] 4404 	ld	a,-2 (ix)
   5FD4 CE 00         [ 7] 4405 	adc	a, #0x00
   5FD6 6F            [ 4] 4406 	ld	l,a
   5FD7 DD 74 E6      [19] 4407 	ld	-26 (ix),h
   5FDA DD 75 E7      [19] 4408 	ld	-25 (ix),l
   5FDD CB 7D         [ 8] 4409 	bit	7, l
   5FDF 28 10         [12] 4410 	jr	Z,00142$
   5FE1 DD 7E FD      [19] 4411 	ld	a,-3 (ix)
   5FE4 C6 07         [ 7] 4412 	add	a, #0x07
   5FE6 DD 77 E6      [19] 4413 	ld	-26 (ix),a
   5FE9 DD 7E FE      [19] 4414 	ld	a,-2 (ix)
   5FEC CE 00         [ 7] 4415 	adc	a, #0x00
   5FEE DD 77 E7      [19] 4416 	ld	-25 (ix),a
   5FF1                    4417 00142$:
   5FF1 DD 6E E6      [19] 4418 	ld	l,-26 (ix)
   5FF4 DD 66 E7      [19] 4419 	ld	h,-25 (ix)
   5FF7 CB 2C         [ 8] 4420 	sra	h
   5FF9 CB 1D         [ 8] 4421 	rr	l
   5FFB CB 2C         [ 8] 4422 	sra	h
   5FFD CB 1D         [ 8] 4423 	rr	l
   5FFF DD 5E F2      [19] 4424 	ld	e,-14 (ix)
   6002 DD 56 F3      [19] 4425 	ld	d,-13 (ix)
   6005 19            [11] 4426 	add	hl,de
   6006 7E            [ 7] 4427 	ld	a,(hl)
   6007 3D            [ 4] 4428 	dec	a
   6008 28 0A         [12] 4429 	jr	Z,00122$
                           4430 ;src/main.c:274: enemy.x+=1;
   600A DD 7E FF      [19] 4431 	ld	a,-1 (ix)
   600D 3C            [ 4] 4432 	inc	a
   600E 32 D5 6D      [13] 4433 	ld	(#_enemy),a
   6011 C3 10 61      [10] 4434 	jp	00137$
   6014                    4435 00122$:
                           4436 ;src/main.c:275: }else if(auxY < enemy.y){
   6014 DD 7E F6      [19] 4437 	ld	a,-10 (ix)
   6017 B7            [ 4] 4438 	or	a, a
   6018 28 30         [12] 4439 	jr	Z,00119$
                           4440 ;src/main.c:276: if(scene[(enemy.y)/tileheight][(enemy.x-1)/tilewidth] != 1)
   601A DD 4E FA      [19] 4441 	ld	c,-6 (ix)
   601D DD 46 FB      [19] 4442 	ld	b,-5 (ix)
   6020 DD 7E F7      [19] 4443 	ld	a,-9 (ix)
   6023 B7            [ 4] 4444 	or	a, a
   6024 28 06         [12] 4445 	jr	Z,00143$
   6026 DD 4E F8      [19] 4446 	ld	c,-8 (ix)
   6029 DD 46 F9      [19] 4447 	ld	b,-7 (ix)
   602C                    4448 00143$:
   602C CB 28         [ 8] 4449 	sra	b
   602E CB 19         [ 8] 4450 	rr	c
   6030 CB 28         [ 8] 4451 	sra	b
   6032 CB 19         [ 8] 4452 	rr	c
   6034 DD 6E F2      [19] 4453 	ld	l,-14 (ix)
   6037 DD 66 F3      [19] 4454 	ld	h,-13 (ix)
   603A 09            [11] 4455 	add	hl,bc
   603B 7E            [ 7] 4456 	ld	a,(hl)
   603C 3D            [ 4] 4457 	dec	a
   603D CA 10 61      [10] 4458 	jp	Z,00137$
                           4459 ;src/main.c:277: enemy.y-=1;
   6040 21 D6 6D      [10] 4460 	ld	hl,#(_enemy + 0x0001)
   6043 DD 7E F5      [19] 4461 	ld	a,-11 (ix)
   6046 77            [ 7] 4462 	ld	(hl),a
   6047 C3 10 61      [10] 4463 	jp	00137$
   604A                    4464 00119$:
                           4465 ;src/main.c:279: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   604A DD 4E EC      [19] 4466 	ld	c,-20 (ix)
   604D DD 46 ED      [19] 4467 	ld	b,-19 (ix)
   6050 DD 7E E8      [19] 4468 	ld	a,-24 (ix)
   6053 B7            [ 4] 4469 	or	a, a
   6054 28 06         [12] 4470 	jr	Z,00144$
   6056 DD 4E EA      [19] 4471 	ld	c,-22 (ix)
   6059 DD 46 EB      [19] 4472 	ld	b,-21 (ix)
   605C                    4473 00144$:
   605C CB 28         [ 8] 4474 	sra	b
   605E CB 19         [ 8] 4475 	rr	c
   6060 CB 28         [ 8] 4476 	sra	b
   6062 CB 19         [ 8] 4477 	rr	c
   6064 CB 28         [ 8] 4478 	sra	b
   6066 CB 19         [ 8] 4479 	rr	c
   6068 CB 28         [ 8] 4480 	sra	b
   606A CB 19         [ 8] 4481 	rr	c
   606C 69            [ 4] 4482 	ld	l, c
   606D 60            [ 4] 4483 	ld	h, b
   606E 29            [11] 4484 	add	hl, hl
   606F 29            [11] 4485 	add	hl, hl
   6070 09            [11] 4486 	add	hl, bc
   6071 29            [11] 4487 	add	hl, hl
   6072 29            [11] 4488 	add	hl, hl
   6073 11 C8 6C      [10] 4489 	ld	de,#_scene
   6076 19            [11] 4490 	add	hl,de
   6077 DD 5E FC      [19] 4491 	ld	e,-4 (ix)
   607A 16 00         [ 7] 4492 	ld	d,#0x00
   607C 19            [11] 4493 	add	hl,de
   607D 7E            [ 7] 4494 	ld	a,(hl)
   607E 3D            [ 4] 4495 	dec	a
   607F CA 10 61      [10] 4496 	jp	Z,00137$
                           4497 ;src/main.c:280: enemy.y+=1;
   6082 21 D6 6D      [10] 4498 	ld	hl,#(_enemy + 0x0001)
   6085 DD 7E F4      [19] 4499 	ld	a,-12 (ix)
   6088 77            [ 7] 4500 	ld	(hl),a
   6089 C3 10 61      [10] 4501 	jp	00137$
   608C                    4502 00132$:
                           4503 ;src/main.c:284: if(auxY < enemy.y){
   608C DD 7E F6      [19] 4504 	ld	a,-10 (ix)
   608F B7            [ 4] 4505 	or	a, a
   6090 28 40         [12] 4506 	jr	Z,00129$
                           4507 ;src/main.c:285: if(scene[(enemy.y-1)/tileheight][(enemy.x)/tilewidth] != 1)
   6092 DD 4E F0      [19] 4508 	ld	c,-16 (ix)
   6095 DD 46 F1      [19] 4509 	ld	b,-15 (ix)
   6098 DD 7E E9      [19] 4510 	ld	a,-23 (ix)
   609B B7            [ 4] 4511 	or	a, a
   609C 28 06         [12] 4512 	jr	Z,00145$
   609E DD 4E EE      [19] 4513 	ld	c,-18 (ix)
   60A1 DD 46 EF      [19] 4514 	ld	b,-17 (ix)
   60A4                    4515 00145$:
   60A4 CB 28         [ 8] 4516 	sra	b
   60A6 CB 19         [ 8] 4517 	rr	c
   60A8 CB 28         [ 8] 4518 	sra	b
   60AA CB 19         [ 8] 4519 	rr	c
   60AC CB 28         [ 8] 4520 	sra	b
   60AE CB 19         [ 8] 4521 	rr	c
   60B0 CB 28         [ 8] 4522 	sra	b
   60B2 CB 19         [ 8] 4523 	rr	c
   60B4 69            [ 4] 4524 	ld	l, c
   60B5 60            [ 4] 4525 	ld	h, b
   60B6 29            [11] 4526 	add	hl, hl
   60B7 29            [11] 4527 	add	hl, hl
   60B8 09            [11] 4528 	add	hl, bc
   60B9 29            [11] 4529 	add	hl, hl
   60BA 29            [11] 4530 	add	hl, hl
   60BB 11 C8 6C      [10] 4531 	ld	de,#_scene
   60BE 19            [11] 4532 	add	hl,de
   60BF DD 5E FC      [19] 4533 	ld	e,-4 (ix)
   60C2 16 00         [ 7] 4534 	ld	d,#0x00
   60C4 19            [11] 4535 	add	hl,de
   60C5 7E            [ 7] 4536 	ld	a,(hl)
   60C6 3D            [ 4] 4537 	dec	a
   60C7 28 47         [12] 4538 	jr	Z,00137$
                           4539 ;src/main.c:286: enemy.y-=1;
   60C9 21 D6 6D      [10] 4540 	ld	hl,#(_enemy + 0x0001)
   60CC DD 7E F5      [19] 4541 	ld	a,-11 (ix)
   60CF 77            [ 7] 4542 	ld	(hl),a
   60D0 18 3E         [12] 4543 	jr	00137$
   60D2                    4544 00129$:
                           4545 ;src/main.c:288: if(scene[(enemy.y+tileheight)/tileheight][(enemy.x)/tilewidth] != 1)
   60D2 DD 4E EC      [19] 4546 	ld	c,-20 (ix)
   60D5 DD 46 ED      [19] 4547 	ld	b,-19 (ix)
   60D8 DD 7E E8      [19] 4548 	ld	a,-24 (ix)
   60DB B7            [ 4] 4549 	or	a, a
   60DC 28 06         [12] 4550 	jr	Z,00146$
   60DE DD 4E EA      [19] 4551 	ld	c,-22 (ix)
   60E1 DD 46 EB      [19] 4552 	ld	b,-21 (ix)
   60E4                    4553 00146$:
   60E4 CB 28         [ 8] 4554 	sra	b
   60E6 CB 19         [ 8] 4555 	rr	c
   60E8 CB 28         [ 8] 4556 	sra	b
   60EA CB 19         [ 8] 4557 	rr	c
   60EC CB 28         [ 8] 4558 	sra	b
   60EE CB 19         [ 8] 4559 	rr	c
   60F0 CB 28         [ 8] 4560 	sra	b
   60F2 CB 19         [ 8] 4561 	rr	c
   60F4 69            [ 4] 4562 	ld	l, c
   60F5 60            [ 4] 4563 	ld	h, b
   60F6 29            [11] 4564 	add	hl, hl
   60F7 29            [11] 4565 	add	hl, hl
   60F8 09            [11] 4566 	add	hl, bc
   60F9 29            [11] 4567 	add	hl, hl
   60FA 29            [11] 4568 	add	hl, hl
   60FB 11 C8 6C      [10] 4569 	ld	de,#_scene
   60FE 19            [11] 4570 	add	hl,de
   60FF DD 5E FC      [19] 4571 	ld	e,-4 (ix)
   6102 16 00         [ 7] 4572 	ld	d,#0x00
   6104 19            [11] 4573 	add	hl,de
   6105 7E            [ 7] 4574 	ld	a,(hl)
   6106 3D            [ 4] 4575 	dec	a
   6107 28 07         [12] 4576 	jr	Z,00137$
                           4577 ;src/main.c:289: enemy.y+=1;
   6109 21 D6 6D      [10] 4578 	ld	hl,#(_enemy + 0x0001)
   610C DD 7E F4      [19] 4579 	ld	a,-12 (ix)
   610F 77            [ 7] 4580 	ld	(hl),a
   6110                    4581 00137$:
   6110 DD F9         [10] 4582 	ld	sp, ix
   6112 DD E1         [14] 4583 	pop	ix
   6114 C9            [10] 4584 	ret
                           4585 ;src/main.c:294: void patrol(){
                           4586 ;	---------------------------------
                           4587 ; Function patrol
                           4588 ; ---------------------------------
   6115                    4589 _patrol::
   6115 DD E5         [15] 4590 	push	ix
   6117 DD 21 00 00   [14] 4591 	ld	ix,#0
   611B DD 39         [15] 4592 	add	ix,sp
   611D 21 F4 FF      [10] 4593 	ld	hl,#-12
   6120 39            [11] 4594 	add	hl,sp
   6121 F9            [ 6] 4595 	ld	sp,hl
                           4596 ;src/main.c:297: movement(enemy.dir);
   6122 3A DE 6D      [13] 4597 	ld	a, (#(_enemy + 0x0009) + 0)
   6125 F5            [11] 4598 	push	af
   6126 33            [ 6] 4599 	inc	sp
   6127 CD 12 50      [17] 4600 	call	_movement
   612A 33            [ 6] 4601 	inc	sp
                           4602 ;src/main.c:299: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   612B 3A D6 6D      [13] 4603 	ld	a,(#_enemy + 1)
   612E DD 77 F6      [19] 4604 	ld	-10 (ix), a
   6131 07            [ 4] 4605 	rlca
   6132 07            [ 4] 4606 	rlca
   6133 07            [ 4] 4607 	rlca
   6134 07            [ 4] 4608 	rlca
   6135 E6 0F         [ 7] 4609 	and	a,#0x0F
   6137 4F            [ 4] 4610 	ld	c,a
   6138 06 00         [ 7] 4611 	ld	b,#0x00
   613A 69            [ 4] 4612 	ld	l, c
   613B 60            [ 4] 4613 	ld	h, b
   613C 29            [11] 4614 	add	hl, hl
   613D 29            [11] 4615 	add	hl, hl
   613E 09            [11] 4616 	add	hl, bc
   613F 29            [11] 4617 	add	hl, hl
   6140 29            [11] 4618 	add	hl, hl
   6141 3E C8         [ 7] 4619 	ld	a,#<(_scene)
   6143 85            [ 4] 4620 	add	a, l
   6144 DD 77 F4      [19] 4621 	ld	-12 (ix),a
   6147 3E 6C         [ 7] 4622 	ld	a,#>(_scene)
   6149 8C            [ 4] 4623 	adc	a, h
   614A DD 77 F5      [19] 4624 	ld	-11 (ix),a
   614D 3A D5 6D      [13] 4625 	ld	a,(#_enemy + 0)
   6150 DD 77 FC      [19] 4626 	ld	-4 (ix), a
   6153 0F            [ 4] 4627 	rrca
   6154 0F            [ 4] 4628 	rrca
   6155 E6 3F         [ 7] 4629 	and	a,#0x3F
   6157 DD 77 F9      [19] 4630 	ld	-7 (ix),a
   615A DD 7E F4      [19] 4631 	ld	a,-12 (ix)
   615D DD 86 F9      [19] 4632 	add	a, -7 (ix)
   6160 5F            [ 4] 4633 	ld	e,a
   6161 DD 7E F5      [19] 4634 	ld	a,-11 (ix)
   6164 CE 00         [ 7] 4635 	adc	a, #0x00
   6166 57            [ 4] 4636 	ld	d,a
   6167 3A E0 6D      [13] 4637 	ld	a,(#_enemy + 11)
   616A DD 77 FD      [19] 4638 	ld	-3 (ix),a
   616D 1A            [ 7] 4639 	ld	a,(de)
   616E 57            [ 4] 4640 	ld	d,a
   616F DD 7E FD      [19] 4641 	ld	a,-3 (ix)
   6172 92            [ 4] 4642 	sub	a, d
   6173 C2 6F 62      [10] 4643 	jp	NZ,00106$
                           4644 ;src/main.c:300: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   6176 DD 5E FC      [19] 4645 	ld	e,-4 (ix)
   6179 16 00         [ 7] 4646 	ld	d,#0x00
   617B 21 03 00      [10] 4647 	ld	hl,#0x0003
   617E 19            [11] 4648 	add	hl,de
   617F DD 75 F7      [19] 4649 	ld	-9 (ix),l
   6182 DD 74 F8      [19] 4650 	ld	-8 (ix),h
   6185 DD 7E F7      [19] 4651 	ld	a,-9 (ix)
   6188 DD 77 FE      [19] 4652 	ld	-2 (ix),a
   618B DD 7E F8      [19] 4653 	ld	a,-8 (ix)
   618E DD 77 FF      [19] 4654 	ld	-1 (ix),a
   6191 DD 7E F8      [19] 4655 	ld	a,-8 (ix)
   6194 07            [ 4] 4656 	rlca
   6195 E6 01         [ 7] 4657 	and	a,#0x01
   6197 DD 77 FC      [19] 4658 	ld	-4 (ix),a
   619A 21 06 00      [10] 4659 	ld	hl,#0x0006
   619D 19            [11] 4660 	add	hl,de
   619E DD 75 FA      [19] 4661 	ld	-6 (ix),l
   61A1 DD 74 FB      [19] 4662 	ld	-5 (ix),h
   61A4 DD 7E FC      [19] 4663 	ld	a,-4 (ix)
   61A7 B7            [ 4] 4664 	or	a, a
   61A8 28 0C         [12] 4665 	jr	Z,00113$
   61AA DD 7E FA      [19] 4666 	ld	a,-6 (ix)
   61AD DD 77 FE      [19] 4667 	ld	-2 (ix),a
   61B0 DD 7E FB      [19] 4668 	ld	a,-5 (ix)
   61B3 DD 77 FF      [19] 4669 	ld	-1 (ix),a
   61B6                    4670 00113$:
   61B6 DD 6E FE      [19] 4671 	ld	l,-2 (ix)
   61B9 DD 66 FF      [19] 4672 	ld	h,-1 (ix)
   61BC CB 2C         [ 8] 4673 	sra	h
   61BE CB 1D         [ 8] 4674 	rr	l
   61C0 CB 2C         [ 8] 4675 	sra	h
   61C2 CB 1D         [ 8] 4676 	rr	l
   61C4 D1            [10] 4677 	pop	de
   61C5 D5            [11] 4678 	push	de
   61C6 19            [11] 4679 	add	hl,de
   61C7 DD 7E FD      [19] 4680 	ld	a,-3 (ix)
   61CA 96            [ 7] 4681 	sub	a,(hl)
   61CB C2 6F 62      [10] 4682 	jp	NZ,00106$
                           4683 ;src/main.c:301: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   61CE DD 5E F6      [19] 4684 	ld	e,-10 (ix)
   61D1 16 00         [ 7] 4685 	ld	d,#0x00
   61D3 21 0E 00      [10] 4686 	ld	hl,#0x000E
   61D6 19            [11] 4687 	add	hl,de
   61D7 4D            [ 4] 4688 	ld	c,l
   61D8 44            [ 4] 4689 	ld	b,h
   61D9 69            [ 4] 4690 	ld	l, c
   61DA 78            [ 4] 4691 	ld	a,b
   61DB 67            [ 4] 4692 	ld	h,a
   61DC 07            [ 4] 4693 	rlca
   61DD E6 01         [ 7] 4694 	and	a,#0x01
   61DF DD 77 FE      [19] 4695 	ld	-2 (ix),a
   61E2 7B            [ 4] 4696 	ld	a,e
   61E3 C6 1D         [ 7] 4697 	add	a, #0x1D
   61E5 DD 77 F4      [19] 4698 	ld	-12 (ix),a
   61E8 7A            [ 4] 4699 	ld	a,d
   61E9 CE 00         [ 7] 4700 	adc	a, #0x00
   61EB DD 77 F5      [19] 4701 	ld	-11 (ix),a
   61EE DD 7E FE      [19] 4702 	ld	a,-2 (ix)
   61F1 B7            [ 4] 4703 	or	a, a
   61F2 28 02         [12] 4704 	jr	Z,00114$
   61F4 E1            [10] 4705 	pop	hl
   61F5 E5            [11] 4706 	push	hl
   61F6                    4707 00114$:
   61F6 CB 2C         [ 8] 4708 	sra	h
   61F8 CB 1D         [ 8] 4709 	rr	l
   61FA CB 2C         [ 8] 4710 	sra	h
   61FC CB 1D         [ 8] 4711 	rr	l
   61FE CB 2C         [ 8] 4712 	sra	h
   6200 CB 1D         [ 8] 4713 	rr	l
   6202 CB 2C         [ 8] 4714 	sra	h
   6204 CB 1D         [ 8] 4715 	rr	l
   6206 5D            [ 4] 4716 	ld	e, l
   6207 54            [ 4] 4717 	ld	d, h
   6208 29            [11] 4718 	add	hl, hl
   6209 29            [11] 4719 	add	hl, hl
   620A 19            [11] 4720 	add	hl, de
   620B 29            [11] 4721 	add	hl, hl
   620C 29            [11] 4722 	add	hl, hl
   620D 11 C8 6C      [10] 4723 	ld	de,#_scene
   6210 19            [11] 4724 	add	hl,de
   6211 DD 5E F9      [19] 4725 	ld	e,-7 (ix)
   6214 16 00         [ 7] 4726 	ld	d,#0x00
   6216 19            [11] 4727 	add	hl,de
   6217 DD 7E FD      [19] 4728 	ld	a,-3 (ix)
   621A 96            [ 7] 4729 	sub	a,(hl)
   621B 20 52         [12] 4730 	jr	NZ,00106$
                           4731 ;src/main.c:302: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   621D DD 7E FE      [19] 4732 	ld	a,-2 (ix)
   6220 B7            [ 4] 4733 	or	a, a
   6221 28 02         [12] 4734 	jr	Z,00115$
   6223 C1            [10] 4735 	pop	bc
   6224 C5            [11] 4736 	push	bc
   6225                    4737 00115$:
   6225 CB 28         [ 8] 4738 	sra	b
   6227 CB 19         [ 8] 4739 	rr	c
   6229 CB 28         [ 8] 4740 	sra	b
   622B CB 19         [ 8] 4741 	rr	c
   622D CB 28         [ 8] 4742 	sra	b
   622F CB 19         [ 8] 4743 	rr	c
   6231 CB 28         [ 8] 4744 	sra	b
   6233 CB 19         [ 8] 4745 	rr	c
   6235 69            [ 4] 4746 	ld	l, c
   6236 60            [ 4] 4747 	ld	h, b
   6237 29            [11] 4748 	add	hl, hl
   6238 29            [11] 4749 	add	hl, hl
   6239 09            [11] 4750 	add	hl, bc
   623A 29            [11] 4751 	add	hl, hl
   623B 29            [11] 4752 	add	hl, hl
   623C 3E C8         [ 7] 4753 	ld	a,#<(_scene)
   623E 85            [ 4] 4754 	add	a, l
   623F DD 77 FE      [19] 4755 	ld	-2 (ix),a
   6242 3E 6C         [ 7] 4756 	ld	a,#>(_scene)
   6244 8C            [ 4] 4757 	adc	a, h
   6245 DD 77 FF      [19] 4758 	ld	-1 (ix),a
   6248 DD 5E F7      [19] 4759 	ld	e,-9 (ix)
   624B DD 56 F8      [19] 4760 	ld	d,-8 (ix)
   624E DD 7E FC      [19] 4761 	ld	a,-4 (ix)
   6251 B7            [ 4] 4762 	or	a, a
   6252 28 06         [12] 4763 	jr	Z,00116$
   6254 DD 5E FA      [19] 4764 	ld	e,-6 (ix)
   6257 DD 56 FB      [19] 4765 	ld	d,-5 (ix)
   625A                    4766 00116$:
   625A CB 2A         [ 8] 4767 	sra	d
   625C CB 1B         [ 8] 4768 	rr	e
   625E CB 2A         [ 8] 4769 	sra	d
   6260 CB 1B         [ 8] 4770 	rr	e
   6262 DD 6E FE      [19] 4771 	ld	l,-2 (ix)
   6265 DD 66 FF      [19] 4772 	ld	h,-1 (ix)
   6268 19            [11] 4773 	add	hl,de
   6269 DD 7E FD      [19] 4774 	ld	a,-3 (ix)
   626C 96            [ 7] 4775 	sub	a,(hl)
   626D 28 3B         [12] 4776 	jr	Z,00111$
   626F                    4777 00106$:
                           4778 ;src/main.c:304: switch(enemy.dir){
   626F 3A DE 6D      [13] 4779 	ld	a,(#(_enemy + 0x0009) + 0)
   6272 FE 02         [ 7] 4780 	cp	a,#0x02
   6274 28 22         [12] 4781 	jr	Z,00103$
   6276 FE 04         [ 7] 4782 	cp	a,#0x04
   6278 28 0A         [12] 4783 	jr	Z,00101$
   627A FE 06         [ 7] 4784 	cp	a,#0x06
   627C 28 10         [12] 4785 	jr	Z,00102$
   627E D6 08         [ 7] 4786 	sub	a, #0x08
   6280 28 20         [12] 4787 	jr	Z,00104$
   6282 18 26         [12] 4788 	jr	00111$
                           4789 ;src/main.c:305: case 4:
   6284                    4790 00101$:
                           4791 ;src/main.c:306: movement(6);
   6284 3E 06         [ 7] 4792 	ld	a,#0x06
   6286 F5            [11] 4793 	push	af
   6287 33            [ 6] 4794 	inc	sp
   6288 CD 12 50      [17] 4795 	call	_movement
   628B 33            [ 6] 4796 	inc	sp
                           4797 ;src/main.c:307: break;
   628C 18 1C         [12] 4798 	jr	00111$
                           4799 ;src/main.c:308: case 6:
   628E                    4800 00102$:
                           4801 ;src/main.c:309: movement(4);
   628E 3E 04         [ 7] 4802 	ld	a,#0x04
   6290 F5            [11] 4803 	push	af
   6291 33            [ 6] 4804 	inc	sp
   6292 CD 12 50      [17] 4805 	call	_movement
   6295 33            [ 6] 4806 	inc	sp
                           4807 ;src/main.c:310: break;
   6296 18 12         [12] 4808 	jr	00111$
                           4809 ;src/main.c:311: case 2:
   6298                    4810 00103$:
                           4811 ;src/main.c:312: movement(8);
   6298 3E 08         [ 7] 4812 	ld	a,#0x08
   629A F5            [11] 4813 	push	af
   629B 33            [ 6] 4814 	inc	sp
   629C CD 12 50      [17] 4815 	call	_movement
   629F 33            [ 6] 4816 	inc	sp
                           4817 ;src/main.c:313: break;
   62A0 18 08         [12] 4818 	jr	00111$
                           4819 ;src/main.c:314: case 8:
   62A2                    4820 00104$:
                           4821 ;src/main.c:315: movement(2);
   62A2 3E 02         [ 7] 4822 	ld	a,#0x02
   62A4 F5            [11] 4823 	push	af
   62A5 33            [ 6] 4824 	inc	sp
   62A6 CD 12 50      [17] 4825 	call	_movement
   62A9 33            [ 6] 4826 	inc	sp
                           4827 ;src/main.c:317: }
   62AA                    4828 00111$:
   62AA DD F9         [10] 4829 	ld	sp, ix
   62AC DD E1         [14] 4830 	pop	ix
   62AE C9            [10] 4831 	ret
                           4832 ;src/main.c:322: u8 vissionSensor(){
                           4833 ;	---------------------------------
                           4834 ; Function vissionSensor
                           4835 ; ---------------------------------
   62AF                    4836 _vissionSensor::
   62AF DD E5         [15] 4837 	push	ix
   62B1 DD 21 00 00   [14] 4838 	ld	ix,#0
   62B5 DD 39         [15] 4839 	add	ix,sp
   62B7 21 F9 FF      [10] 4840 	ld	hl,#-7
   62BA 39            [11] 4841 	add	hl,sp
   62BB F9            [ 6] 4842 	ld	sp,hl
                           4843 ;src/main.c:323: u8 following = 0;
   62BC DD 36 FC 00   [19] 4844 	ld	-4 (ix),#0x00
                           4845 ;src/main.c:324: u8 cx = enemy.x/tilewidth;
   62C0 3A D5 6D      [13] 4846 	ld	a, (#_enemy + 0)
   62C3 0F            [ 4] 4847 	rrca
   62C4 0F            [ 4] 4848 	rrca
   62C5 E6 3F         [ 7] 4849 	and	a,#0x3F
   62C7 DD 77 FB      [19] 4850 	ld	-5 (ix),a
                           4851 ;src/main.c:325: u8 cy = enemy.y/tilewidth;
   62CA 3A D6 6D      [13] 4852 	ld	a, (#(_enemy + 0x0001) + 0)
   62CD 0F            [ 4] 4853 	rrca
   62CE 0F            [ 4] 4854 	rrca
   62CF E6 3F         [ 7] 4855 	and	a,#0x3F
   62D1 4F            [ 4] 4856 	ld	c,a
                           4857 ;src/main.c:326: u8 pcx = player.x/tilewidth;
   62D2 3A CA 6D      [13] 4858 	ld	a, (#_player + 0)
   62D5 0F            [ 4] 4859 	rrca
   62D6 0F            [ 4] 4860 	rrca
   62D7 E6 3F         [ 7] 4861 	and	a,#0x3F
   62D9 DD 77 FE      [19] 4862 	ld	-2 (ix),a
                           4863 ;src/main.c:327: u8 pcy = player.y/tilewidth;
   62DC 3A CB 6D      [13] 4864 	ld	a, (#(_player + 0x0001) + 0)
   62DF 0F            [ 4] 4865 	rrca
   62E0 0F            [ 4] 4866 	rrca
   62E1 E6 3F         [ 7] 4867 	and	a,#0x3F
   62E3 DD 77 FF      [19] 4868 	ld	-1 (ix),a
                           4869 ;src/main.c:330: for(i=0;i<3;i++){
   62E6 1E 00         [ 7] 4870 	ld	e,#0x00
   62E8                    4871 00107$:
                           4872 ;src/main.c:331: lex = cx - i;
   62E8 DD 7E FB      [19] 4873 	ld	a,-5 (ix)
   62EB 93            [ 4] 4874 	sub	a, e
   62EC DD 77 FA      [19] 4875 	ld	-6 (ix),a
                           4876 ;src/main.c:332: ley = cy - i;
   62EF 79            [ 4] 4877 	ld	a,c
   62F0 93            [ 4] 4878 	sub	a, e
   62F1 DD 77 FD      [19] 4879 	ld	-3 (ix),a
                           4880 ;src/main.c:333: mex = cx + i;
   62F4 DD 7E FB      [19] 4881 	ld	a,-5 (ix)
   62F7 83            [ 4] 4882 	add	a, e
   62F8 DD 77 F9      [19] 4883 	ld	-7 (ix),a
                           4884 ;src/main.c:334: mey = cy + i;
   62FB 79            [ 4] 4885 	ld	a,c
   62FC 83            [ 4] 4886 	add	a, e
   62FD 57            [ 4] 4887 	ld	d,a
                           4888 ;src/main.c:335: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
   62FE DD 7E FA      [19] 4889 	ld	a,-6 (ix)
   6301 DD 96 FE      [19] 4890 	sub	a, -2 (ix)
   6304 28 16         [12] 4891 	jr	Z,00101$
   6306 DD 7E FD      [19] 4892 	ld	a,-3 (ix)
   6309 DD 96 FF      [19] 4893 	sub	a, -1 (ix)
   630C 28 0E         [12] 4894 	jr	Z,00101$
   630E DD 7E F9      [19] 4895 	ld	a,-7 (ix)
   6311 DD 96 FE      [19] 4896 	sub	a, -2 (ix)
   6314 28 06         [12] 4897 	jr	Z,00101$
   6316 DD 7E FF      [19] 4898 	ld	a,-1 (ix)
   6319 92            [ 4] 4899 	sub	a, d
   631A 20 04         [12] 4900 	jr	NZ,00108$
   631C                    4901 00101$:
                           4902 ;src/main.c:336: following = 1;
   631C DD 36 FC 01   [19] 4903 	ld	-4 (ix),#0x01
   6320                    4904 00108$:
                           4905 ;src/main.c:330: for(i=0;i<3;i++){
   6320 1C            [ 4] 4906 	inc	e
   6321 7B            [ 4] 4907 	ld	a,e
   6322 D6 03         [ 7] 4908 	sub	a, #0x03
   6324 38 C2         [12] 4909 	jr	C,00107$
                           4910 ;src/main.c:340: return following;
   6326 DD 6E FC      [19] 4911 	ld	l,-4 (ix)
   6329 DD F9         [10] 4912 	ld	sp, ix
   632B DD E1         [14] 4913 	pop	ix
   632D C9            [10] 4914 	ret
                           4915 ;src/main.c:345: void move(){
                           4916 ;	---------------------------------
                           4917 ; Function move
                           4918 ; ---------------------------------
   632E                    4919 _move::
                           4920 ;src/main.c:347: if(temp > 10){
   632E 3E 0A         [ 7] 4921 	ld	a,#0x0A
   6330 FD 21 B8 6D   [14] 4922 	ld	iy,#_temp
   6334 FD 96 00      [19] 4923 	sub	a, 0 (iy)
   6337 D2 BB 63      [10] 4924 	jp	NC,00116$
                           4925 ;src/main.c:348: enemy.dir = chooseDirection();
   633A CD A3 4F      [17] 4926 	call	_chooseDirection
   633D 7D            [ 4] 4927 	ld	a,l
   633E 21 DE 6D      [10] 4928 	ld	hl,#(_enemy + 0x0009)
   6341 77            [ 7] 4929 	ld	(hl),a
                           4930 ;src/main.c:349: following = detectPlayerRoom(player.x,player.y);
   6342 3A CB 6D      [13] 4931 	ld	a, (#_player + 1)
   6345 21 CA 6D      [10] 4932 	ld	hl, #_player + 0
   6348 56            [ 7] 4933 	ld	d,(hl)
   6349 F5            [11] 4934 	push	af
   634A 33            [ 6] 4935 	inc	sp
   634B D5            [11] 4936 	push	de
   634C 33            [ 6] 4937 	inc	sp
   634D CD 76 4F      [17] 4938 	call	_detectPlayerRoom
   6350 F1            [10] 4939 	pop	af
   6351 FD 21 BD 6D   [14] 4940 	ld	iy,#_following
   6355 FD 75 00      [19] 4941 	ld	0 (iy),l
                           4942 ;src/main.c:350: memptr = cpct_getScreenPtr(VMEM,20,20);
   6358 21 14 14      [10] 4943 	ld	hl,#0x1414
   635B E5            [11] 4944 	push	hl
   635C 21 00 C0      [10] 4945 	ld	hl,#0xC000
   635F E5            [11] 4946 	push	hl
   6360 CD 13 6C      [17] 4947 	call	_cpct_getScreenPtr
                           4948 ;src/main.c:351: cpct_drawSolidBox(memptr, following, 2, 8);
   6363 EB            [ 4] 4949 	ex	de,hl
   6364 21 02 08      [10] 4950 	ld	hl,#0x0802
   6367 E5            [11] 4951 	push	hl
   6368 3A BD 6D      [13] 4952 	ld	a,(_following)
   636B F5            [11] 4953 	push	af
   636C 33            [ 6] 4954 	inc	sp
   636D D5            [11] 4955 	push	de
   636E CD 42 6B      [17] 4956 	call	_cpct_drawSolidBox
   6371 F1            [10] 4957 	pop	af
                           4958 ;src/main.c:352: memptr = cpct_getScreenPtr(VMEM,24,20);
   6372 33            [ 6] 4959 	inc	sp
   6373 21 18 14      [10] 4960 	ld	hl,#0x1418
   6376 E3            [19] 4961 	ex	(sp),hl
   6377 21 00 C0      [10] 4962 	ld	hl,#0xC000
   637A E5            [11] 4963 	push	hl
   637B CD 13 6C      [17] 4964 	call	_cpct_getScreenPtr
   637E EB            [ 4] 4965 	ex	de,hl
                           4966 ;src/main.c:353: cpct_drawSolidBox(memptr, enemy.room, 2, 8);
   637F 21 E0 6D      [10] 4967 	ld	hl, #(_enemy + 0x000b) + 0
   6382 46            [ 7] 4968 	ld	b,(hl)
   6383 21 02 08      [10] 4969 	ld	hl,#0x0802
   6386 E5            [11] 4970 	push	hl
   6387 C5            [11] 4971 	push	bc
   6388 33            [ 6] 4972 	inc	sp
   6389 D5            [11] 4973 	push	de
   638A CD 42 6B      [17] 4974 	call	_cpct_drawSolidBox
   638D F1            [10] 4975 	pop	af
   638E F1            [10] 4976 	pop	af
   638F 33            [ 6] 4977 	inc	sp
                           4978 ;src/main.c:354: if(following == enemy.room || enemy.pursue != 0){
   6390 21 E0 6D      [10] 4979 	ld	hl, #(_enemy + 0x000b) + 0
   6393 56            [ 7] 4980 	ld	d,(hl)
   6394 01 E3 6D      [10] 4981 	ld	bc,#_enemy + 14
   6397 0A            [ 7] 4982 	ld	a,(bc)
   6398 5F            [ 4] 4983 	ld	e,a
   6399 3A BD 6D      [13] 4984 	ld	a,(#_following + 0)
   639C 92            [ 4] 4985 	sub	a, d
   639D 28 04         [12] 4986 	jr	Z,00106$
   639F 7B            [ 4] 4987 	ld	a,e
   63A0 B7            [ 4] 4988 	or	a, a
   63A1 28 11         [12] 4989 	jr	Z,00107$
   63A3                    4990 00106$:
                           4991 ;src/main.c:355: if(enemy.pursue == 0)
   63A3 7B            [ 4] 4992 	ld	a,e
   63A4 B7            [ 4] 4993 	or	a, a
   63A5 20 05         [12] 4994 	jr	NZ,00104$
                           4995 ;src/main.c:356: enemy.pursue = 3;
   63A7 3E 03         [ 7] 4996 	ld	a,#0x03
   63A9 02            [ 7] 4997 	ld	(bc),a
   63AA 18 08         [12] 4998 	jr	00107$
   63AC                    4999 00104$:
                           5000 ;src/main.c:357: else if(enemy.pursue > 1)
   63AC 3E 01         [ 7] 5001 	ld	a,#0x01
   63AE 93            [ 4] 5002 	sub	a, e
   63AF 30 03         [12] 5003 	jr	NC,00107$
                           5004 ;src/main.c:358: enemy.pursue -=1;
   63B1 1D            [ 4] 5005 	dec	e
   63B2 7B            [ 4] 5006 	ld	a,e
   63B3 02            [ 7] 5007 	ld	(bc),a
   63B4                    5008 00107$:
                           5009 ;src/main.c:360: temp = 0;
   63B4 21 B8 6D      [10] 5010 	ld	hl,#_temp + 0
   63B7 36 00         [10] 5011 	ld	(hl), #0x00
   63B9 18 2C         [12] 5012 	jr	00117$
   63BB                    5013 00116$:
                           5014 ;src/main.c:362: if(enemy.pursue >= 1){
   63BB 3A E3 6D      [13] 5015 	ld	a,(#(_enemy + 0x000e) + 0)
   63BE D6 01         [ 7] 5016 	sub	a, #0x01
   63C0 38 22         [12] 5017 	jr	C,00113$
                           5018 ;src/main.c:363: followPlayer();
   63C2 CD FD 5D      [17] 5019 	call	_followPlayer
                           5020 ;src/main.c:364: if(enemy.seenX == enemy.x && enemy.seenY == enemy.y)
   63C5 21 E1 6D      [10] 5021 	ld	hl, #_enemy + 12
   63C8 56            [ 7] 5022 	ld	d,(hl)
   63C9 21 D5 6D      [10] 5023 	ld	hl, #_enemy + 0
   63CC 5E            [ 7] 5024 	ld	e,(hl)
   63CD 7A            [ 4] 5025 	ld	a,d
   63CE 93            [ 4] 5026 	sub	a, e
   63CF 20 16         [12] 5027 	jr	NZ,00117$
   63D1 21 E2 6D      [10] 5028 	ld	hl, #_enemy + 13
   63D4 56            [ 7] 5029 	ld	d,(hl)
   63D5 21 D6 6D      [10] 5030 	ld	hl, #_enemy + 1
   63D8 5E            [ 7] 5031 	ld	e,(hl)
   63D9 7A            [ 4] 5032 	ld	a,d
   63DA 93            [ 4] 5033 	sub	a, e
   63DB 20 0A         [12] 5034 	jr	NZ,00117$
                           5035 ;src/main.c:365: enemy.pursue = 0;
   63DD 21 E3 6D      [10] 5036 	ld	hl,#(_enemy + 0x000e)
   63E0 36 00         [10] 5037 	ld	(hl),#0x00
   63E2 18 03         [12] 5038 	jr	00117$
   63E4                    5039 00113$:
                           5040 ;src/main.c:367: patrol();
   63E4 CD 15 61      [17] 5041 	call	_patrol
   63E7                    5042 00117$:
                           5043 ;src/main.c:370: if((detectPlayerRoom(enemy.lx,enemy.ly) == detectPlayerRoom(player.x,player.y)) || enemy.pursue > 1){
   63E7 21 D8 6D      [10] 5044 	ld	hl, #_enemy + 3
   63EA 56            [ 7] 5045 	ld	d,(hl)
   63EB 3A D7 6D      [13] 5046 	ld	a, (#_enemy + 2)
   63EE D5            [11] 5047 	push	de
   63EF 33            [ 6] 5048 	inc	sp
   63F0 F5            [11] 5049 	push	af
   63F1 33            [ 6] 5050 	inc	sp
   63F2 CD 76 4F      [17] 5051 	call	_detectPlayerRoom
   63F5 F1            [10] 5052 	pop	af
   63F6 55            [ 4] 5053 	ld	d,l
   63F7 3A CB 6D      [13] 5054 	ld	a, (#(_player + 0x0001) + 0)
   63FA 21 CA 6D      [10] 5055 	ld	hl, #_player + 0
   63FD 46            [ 7] 5056 	ld	b,(hl)
   63FE D5            [11] 5057 	push	de
   63FF F5            [11] 5058 	push	af
   6400 33            [ 6] 5059 	inc	sp
   6401 C5            [11] 5060 	push	bc
   6402 33            [ 6] 5061 	inc	sp
   6403 CD 76 4F      [17] 5062 	call	_detectPlayerRoom
   6406 F1            [10] 5063 	pop	af
   6407 45            [ 4] 5064 	ld	b,l
   6408 D1            [10] 5065 	pop	de
   6409 7A            [ 4] 5066 	ld	a,d
   640A 90            [ 4] 5067 	sub	a, b
   640B 28 09         [12] 5068 	jr	Z,00118$
   640D 21 E3 6D      [10] 5069 	ld	hl, #_enemy + 14
   6410 66            [ 7] 5070 	ld	h,(hl)
   6411 3E 01         [ 7] 5071 	ld	a,#0x01
   6413 94            [ 4] 5072 	sub	a, h
   6414 30 0E         [12] 5073 	jr	NC,00119$
   6416                    5074 00118$:
                           5075 ;src/main.c:371: enemy.seenX = player.x;
   6416 11 E1 6D      [10] 5076 	ld	de,#_enemy + 12
   6419 3A CA 6D      [13] 5077 	ld	a, (#_player + 0)
   641C 12            [ 7] 5078 	ld	(de),a
                           5079 ;src/main.c:372: enemy.seenY = player.y;
   641D 11 E2 6D      [10] 5080 	ld	de,#_enemy + 13
   6420 3A CB 6D      [13] 5081 	ld	a, (#(_player + 0x0001) + 0)
   6423 12            [ 7] 5082 	ld	(de),a
   6424                    5083 00119$:
                           5084 ;src/main.c:374: enemy.room = detectPlayerRoom(enemy.x,enemy.y);
   6424 3A D6 6D      [13] 5085 	ld	a, (#_enemy + 1)
   6427 21 D5 6D      [10] 5086 	ld	hl, #_enemy + 0
   642A 56            [ 7] 5087 	ld	d,(hl)
   642B F5            [11] 5088 	push	af
   642C 33            [ 6] 5089 	inc	sp
   642D D5            [11] 5090 	push	de
   642E 33            [ 6] 5091 	inc	sp
   642F CD 76 4F      [17] 5092 	call	_detectPlayerRoom
   6432 F1            [10] 5093 	pop	af
   6433 7D            [ 4] 5094 	ld	a,l
   6434 32 E0 6D      [13] 5095 	ld	(#(_enemy + 0x000b)),a
                           5096 ;src/main.c:375: temp += 1;
   6437 21 B8 6D      [10] 5097 	ld	hl, #_temp+0
   643A 34            [11] 5098 	inc	(hl)
   643B C9            [10] 5099 	ret
                           5100 ;src/main.c:380: void game(){
                           5101 ;	---------------------------------
                           5102 ; Function game
                           5103 ; ---------------------------------
   643C                    5104 _game::
   643C DD E5         [15] 5105 	push	ix
   643E DD 21 00 00   [14] 5106 	ld	ix,#0
   6442 DD 39         [15] 5107 	add	ix,sp
   6444 21 F4 FF      [10] 5108 	ld	hl,#-12
   6447 39            [11] 5109 	add	hl,sp
   6448 F9            [ 6] 5110 	ld	sp,hl
                           5111 ;src/main.c:382: TNivel n = {0,0,0};
   6449 21 00 00      [10] 5112 	ld	hl,#0x0000
   644C 39            [11] 5113 	add	hl,sp
   644D 36 00         [10] 5114 	ld	(hl),#0x00
   644F 21 00 00      [10] 5115 	ld	hl,#0x0000
   6452 39            [11] 5116 	add	hl,sp
   6453 5D            [ 4] 5117 	ld	e, l
   6454 54            [ 4] 5118 	ld	d, h
   6455 23            [ 6] 5119 	inc	hl
   6456 DD 75 FD      [19] 5120 	ld	-3 (ix),l
   6459 DD 74 FE      [19] 5121 	ld	-2 (ix),h
   645C DD 6E FD      [19] 5122 	ld	l,-3 (ix)
   645F DD 66 FE      [19] 5123 	ld	h,-2 (ix)
   6462 36 00         [10] 5124 	ld	(hl),#0x00
   6464 13            [ 6] 5125 	inc	de
   6465 13            [ 6] 5126 	inc	de
   6466 DD 73 FB      [19] 5127 	ld	-5 (ix),e
   6469 DD 72 FC      [19] 5128 	ld	-4 (ix),d
   646C DD 6E FB      [19] 5129 	ld	l,-5 (ix)
   646F DD 66 FC      [19] 5130 	ld	h,-4 (ix)
   6472 36 00         [10] 5131 	ld	(hl),#0x00
                           5132 ;src/main.c:383: bound =0;
   6474 21 BE 6D      [10] 5133 	ld	hl,#_bound + 0
   6477 36 00         [10] 5134 	ld	(hl), #0x00
                           5135 ;src/main.c:384: temp = 0;
   6479 21 B8 6D      [10] 5136 	ld	hl,#_temp + 0
   647C 36 00         [10] 5137 	ld	(hl), #0x00
                           5138 ;src/main.c:385: map = 1;
   647E 21 B9 6D      [10] 5139 	ld	hl,#_map + 0
   6481 36 01         [10] 5140 	ld	(hl), #0x01
                           5141 ;src/main.c:386: arrow =0;
   6483 21 BC 6D      [10] 5142 	ld	hl,#_arrow + 0
   6486 36 00         [10] 5143 	ld	(hl), #0x00
                           5144 ;src/main.c:387: finish =0;
   6488 21 BB 6D      [10] 5145 	ld	hl,#_finish + 0
   648B 36 00         [10] 5146 	ld	(hl), #0x00
                           5147 ;src/main.c:388: following =0;
   648D 21 BD 6D      [10] 5148 	ld	hl,#_following + 0
   6490 36 00         [10] 5149 	ld	(hl), #0x00
                           5150 ;src/main.c:389: archer = 0;
   6492 21 BF 6D      [10] 5151 	ld	hl,#_archer + 0
   6495 36 00         [10] 5152 	ld	(hl), #0x00
                           5153 ;src/main.c:391: initPlayer();
   6497 CD 44 54      [17] 5154 	call	_initPlayer
                           5155 ;src/main.c:392: initEnemies();
   649A CD 7A 54      [17] 5156 	call	_initEnemies
                           5157 ;src/main.c:394: cpct_clearScreen(0);
   649D 21 00 40      [10] 5158 	ld	hl,#0x4000
   64A0 E5            [11] 5159 	push	hl
   64A1 AF            [ 4] 5160 	xor	a, a
   64A2 F5            [11] 5161 	push	af
   64A3 33            [ 6] 5162 	inc	sp
   64A4 26 C0         [ 7] 5163 	ld	h, #0xC0
   64A6 E5            [11] 5164 	push	hl
   64A7 CD 20 6B      [17] 5165 	call	_cpct_memset
                           5166 ;src/main.c:395: drawMap(map);
   64AA 3A B9 6D      [13] 5167 	ld	a,(_map)
   64AD F5            [11] 5168 	push	af
   64AE 33            [ 6] 5169 	inc	sp
   64AF CD C0 46      [17] 5170 	call	_drawMap
   64B2 33            [ 6] 5171 	inc	sp
                           5172 ;src/main.c:401: while (1){
   64B3 DD 7E FB      [19] 5173 	ld	a,-5 (ix)
   64B6 DD 77 F9      [19] 5174 	ld	-7 (ix),a
   64B9 DD 7E FC      [19] 5175 	ld	a,-4 (ix)
   64BC DD 77 FA      [19] 5176 	ld	-6 (ix),a
   64BF DD 7E FD      [19] 5177 	ld	a,-3 (ix)
   64C2 DD 77 F7      [19] 5178 	ld	-9 (ix),a
   64C5 DD 7E FE      [19] 5179 	ld	a,-2 (ix)
   64C8 DD 77 F8      [19] 5180 	ld	-8 (ix),a
   64CB                    5181 00134$:
                           5182 ;src/main.c:404: cpct_waitVSYNC();
   64CB CD 06 6B      [17] 5183 	call	_cpct_waitVSYNC
                           5184 ;src/main.c:407: erases();
   64CE CD 6D 4D      [17] 5185 	call	_erases
                           5186 ;src/main.c:410: if(temp == 10)
   64D1 3A B8 6D      [13] 5187 	ld	a,(#_temp + 0)
   64D4 D6 0A         [ 7] 5188 	sub	a, #0x0A
   64D6 20 1C         [12] 5189 	jr	NZ,00102$
                           5190 ;src/main.c:411: drawPickUps(n.corazon,n.bullet);
   64D8 DD 6E FB      [19] 5191 	ld	l,-5 (ix)
   64DB DD 66 FC      [19] 5192 	ld	h,-4 (ix)
   64DE 7E            [ 7] 5193 	ld	a,(hl)
   64DF DD 77 FF      [19] 5194 	ld	-1 (ix),a
   64E2 DD 6E FD      [19] 5195 	ld	l,-3 (ix)
   64E5 DD 66 FE      [19] 5196 	ld	h,-2 (ix)
   64E8 56            [ 7] 5197 	ld	d,(hl)
   64E9 DD 7E FF      [19] 5198 	ld	a,-1 (ix)
   64EC F5            [11] 5199 	push	af
   64ED 33            [ 6] 5200 	inc	sp
   64EE D5            [11] 5201 	push	de
   64EF 33            [ 6] 5202 	inc	sp
   64F0 CD 0E 4F      [17] 5203 	call	_drawPickUps
   64F3 F1            [10] 5204 	pop	af
   64F4                    5205 00102$:
                           5206 ;src/main.c:414: draws();
   64F4 CD AE 4C      [17] 5207 	call	_draws
                           5208 ;src/main.c:417: if(temp == 10){
   64F7 3A B8 6D      [13] 5209 	ld	a,(#_temp + 0)
   64FA D6 0A         [ 7] 5210 	sub	a, #0x0A
   64FC 20 2F         [12] 5211 	jr	NZ,00110$
                           5212 ;src/main.c:418: if(player.atk < 20) drawFatiga(player.atk,2);
   64FE 21 D2 6D      [10] 5213 	ld	hl, #(_player + 0x0008) + 0
   6501 56            [ 7] 5214 	ld	d,(hl)
   6502 7A            [ 4] 5215 	ld	a,d
   6503 D6 14         [ 7] 5216 	sub	a, #0x14
   6505 30 0C         [12] 5217 	jr	NC,00107$
   6507 3E 02         [ 7] 5218 	ld	a,#0x02
   6509 F5            [11] 5219 	push	af
   650A 33            [ 6] 5220 	inc	sp
   650B D5            [11] 5221 	push	de
   650C 33            [ 6] 5222 	inc	sp
   650D CD E8 4D      [17] 5223 	call	_drawFatiga
   6510 F1            [10] 5224 	pop	af
   6511 18 1A         [12] 5225 	jr	00110$
   6513                    5226 00107$:
                           5227 ;src/main.c:419: else if(player.atk > 20) drawFatiga(player.atk,1);
   6513 3E 14         [ 7] 5228 	ld	a,#0x14
   6515 92            [ 4] 5229 	sub	a, d
   6516 30 0C         [12] 5230 	jr	NC,00104$
   6518 3E 01         [ 7] 5231 	ld	a,#0x01
   651A F5            [11] 5232 	push	af
   651B 33            [ 6] 5233 	inc	sp
   651C D5            [11] 5234 	push	de
   651D 33            [ 6] 5235 	inc	sp
   651E CD E8 4D      [17] 5236 	call	_drawFatiga
   6521 F1            [10] 5237 	pop	af
   6522 18 09         [12] 5238 	jr	00110$
   6524                    5239 00104$:
                           5240 ;src/main.c:420: else drawFatiga(player.atk,0);
   6524 AF            [ 4] 5241 	xor	a, a
   6525 F5            [11] 5242 	push	af
   6526 33            [ 6] 5243 	inc	sp
   6527 D5            [11] 5244 	push	de
   6528 33            [ 6] 5245 	inc	sp
   6529 CD E8 4D      [17] 5246 	call	_drawFatiga
   652C F1            [10] 5247 	pop	af
   652D                    5248 00110$:
                           5249 ;src/main.c:425: if(temp%2 == 0){
   652D FD 21 B8 6D   [14] 5250 	ld	iy,#_temp
   6531 FD CB 00 46   [20] 5251 	bit	0, 0 (iy)
   6535 20 0D         [12] 5252 	jr	NZ,00112$
                           5253 ;src/main.c:426: player.lx = player.x;
   6537 3A CA 6D      [13] 5254 	ld	a, (#_player + 0)
   653A 21 CC 6D      [10] 5255 	ld	hl,#(_player + 0x0002)
   653D 77            [ 7] 5256 	ld	(hl),a
                           5257 ;src/main.c:427: player.ly = player.y;
   653E 3A CB 6D      [13] 5258 	ld	a, (#(_player + 0x0001) + 0)
   6541 32 CD 6D      [13] 5259 	ld	(#(_player + 0x0003)),a
   6544                    5260 00112$:
                           5261 ;src/main.c:430: if(enemy.life > 0){
   6544 21 DD 6D      [10] 5262 	ld	hl, #(_enemy + 0x0008) + 0
   6547 6E            [ 7] 5263 	ld	l,(hl)
                           5264 ;src/main.c:433: enemy.ly = enemy.y;
                           5265 ;src/main.c:430: if(enemy.life > 0){
   6548 7D            [ 4] 5266 	ld	a,l
   6549 B7            [ 4] 5267 	or	a, a
   654A 28 6F         [12] 5268 	jr	Z,00121$
                           5269 ;src/main.c:431: if(temp%2 == 1){
   654C 3A B8 6D      [13] 5270 	ld	a,(#_temp + 0)
   654F E6 01         [ 7] 5271 	and	a, #0x01
   6551 3D            [ 4] 5272 	dec	a
   6552 20 0D         [12] 5273 	jr	NZ,00114$
                           5274 ;src/main.c:432: enemy.lx = enemy.x;
   6554 3A D5 6D      [13] 5275 	ld	a, (#_enemy + 0)
   6557 32 D7 6D      [13] 5276 	ld	(#(_enemy + 0x0002)),a
                           5277 ;src/main.c:433: enemy.ly = enemy.y;
   655A 11 D8 6D      [10] 5278 	ld	de,#_enemy + 3
   655D 3A D6 6D      [13] 5279 	ld	a, (#(_enemy + 0x0001) + 0)
   6560 12            [ 7] 5280 	ld	(de),a
   6561                    5281 00114$:
                           5282 ;src/main.c:436: move();
   6561 CD 2E 63      [17] 5283 	call	_move
                           5284 ;src/main.c:438: switch(checkCollisions(player.x, player.y, enemy.x, enemy.y, player.atk)){
   6564 21 D2 6D      [10] 5285 	ld	hl, #(_player + 0x0008) + 0
   6567 56            [ 7] 5286 	ld	d,(hl)
   6568 3A D6 6D      [13] 5287 	ld	a, (#(_enemy + 0x0001) + 0)
   656B 21 D5 6D      [10] 5288 	ld	hl, #_enemy + 0
   656E 5E            [ 7] 5289 	ld	e,(hl)
   656F 21 CB 6D      [10] 5290 	ld	hl, #(_player + 0x0001) + 0
   6572 46            [ 7] 5291 	ld	b,(hl)
   6573 21 CA 6D      [10] 5292 	ld	hl, #_player + 0
   6576 4E            [ 7] 5293 	ld	c,(hl)
   6577 D5            [11] 5294 	push	de
   6578 33            [ 6] 5295 	inc	sp
   6579 57            [ 4] 5296 	ld	d,a
   657A D5            [11] 5297 	push	de
   657B C5            [11] 5298 	push	bc
   657C CD 52 50      [17] 5299 	call	_checkCollisions
   657F F1            [10] 5300 	pop	af
   6580 F1            [10] 5301 	pop	af
   6581 33            [ 6] 5302 	inc	sp
   6582 7D            [ 4] 5303 	ld	a,l
   6583 3D            [ 4] 5304 	dec	a
   6584 28 07         [12] 5305 	jr	Z,00115$
   6586 7D            [ 4] 5306 	ld	a,l
   6587 D6 02         [ 7] 5307 	sub	a, #0x02
   6589 28 19         [12] 5308 	jr	Z,00116$
   658B 18 2E         [12] 5309 	jr	00121$
                           5310 ;src/main.c:439: case 1:
   658D                    5311 00115$:
                           5312 ;src/main.c:440: enemy.x = enemy.ox;
   658D 3A D9 6D      [13] 5313 	ld	a, (#_enemy + 4)
   6590 32 D5 6D      [13] 5314 	ld	(#_enemy),a
                           5315 ;src/main.c:441: enemy.y = enemy.oy;
   6593 3A DA 6D      [13] 5316 	ld	a, (#_enemy + 5)
   6596 32 D6 6D      [13] 5317 	ld	(#(_enemy + 0x0001)),a
                           5318 ;src/main.c:442: enemy.life -= 1;
   6599 3A DD 6D      [13] 5319 	ld	a, (#(_enemy + 0x0008) + 0)
   659C C6 FF         [ 7] 5320 	add	a,#0xFF
   659E 21 DD 6D      [10] 5321 	ld	hl,#(_enemy + 0x0008)
   65A1 77            [ 7] 5322 	ld	(hl),a
                           5323 ;src/main.c:443: break;
   65A2 18 17         [12] 5324 	jr	00121$
                           5325 ;src/main.c:444: case 2:
   65A4                    5326 00116$:
                           5327 ;src/main.c:445: player.x = 0;
   65A4 21 CA 6D      [10] 5328 	ld	hl,#_player
   65A7 36 00         [10] 5329 	ld	(hl),#0x00
                           5330 ;src/main.c:446: player.y = 80;
   65A9 21 CB 6D      [10] 5331 	ld	hl,#(_player + 0x0001)
   65AC 36 50         [10] 5332 	ld	(hl),#0x50
                           5333 ;src/main.c:447: player.life -= 1;
   65AE 21 D0 6D      [10] 5334 	ld	hl,#_player + 6
   65B1 7E            [ 7] 5335 	ld	a,(hl)
   65B2 C6 FF         [ 7] 5336 	add	a,#0xFF
   65B4 77            [ 7] 5337 	ld	(hl),a
                           5338 ;src/main.c:448: if(player.life == 0){
   65B5 B7            [ 4] 5339 	or	a, a
   65B6 20 03         [12] 5340 	jr	NZ,00121$
                           5341 ;src/main.c:449: gameOver();
   65B8 CD B3 54      [17] 5342 	call	_gameOver
                           5343 ;src/main.c:452: }
   65BB                    5344 00121$:
                           5345 ;src/main.c:454: player.latk = player.atk;
   65BB 11 D3 6D      [10] 5346 	ld	de,#_player + 9
   65BE 3A D2 6D      [13] 5347 	ld	a, (#(_player + 0x0008) + 0)
   65C1 12            [ 7] 5348 	ld	(de),a
                           5349 ;src/main.c:459: cpct_scanKeyboard_f();
   65C2 CD 10 68      [17] 5350 	call	_cpct_scanKeyboard_f
                           5351 ;src/main.c:460: player.sprite = checkKeyboard();
   65C5 CD 73 51      [17] 5352 	call	_checkKeyboard
   65C8 5D            [ 4] 5353 	ld	e,l
   65C9 54            [ 4] 5354 	ld	d,h
   65CA ED 53 CE 6D   [20] 5355 	ld	((_player + 0x0004)), de
                           5356 ;src/main.c:461: checkBoundsCollisions(&n.corazon,&n.bullet);
   65CE DD 6E F9      [19] 5357 	ld	l,-7 (ix)
   65D1 DD 66 FA      [19] 5358 	ld	h,-6 (ix)
   65D4 DD 5E F7      [19] 5359 	ld	e,-9 (ix)
   65D7 DD 56 F8      [19] 5360 	ld	d,-8 (ix)
   65DA E5            [11] 5361 	push	hl
   65DB D5            [11] 5362 	push	de
   65DC CD 56 59      [17] 5363 	call	_checkBoundsCollisions
   65DF F1            [10] 5364 	pop	af
   65E0 F1            [10] 5365 	pop	af
                           5366 ;src/main.c:463: if(arrow == 1){
   65E1 3A BC 6D      [13] 5367 	ld	a,(#_arrow + 0)
   65E4 3D            [ 4] 5368 	dec	a
   65E5 20 55         [12] 5369 	jr	NZ,00130$
                           5370 ;src/main.c:464: moveObject();
   65E7 CD EA 53      [17] 5371 	call	_moveObject
                           5372 ;src/main.c:465: bound = checkArrowCollisions();
   65EA CD 27 5D      [17] 5373 	call	_checkArrowCollisions
   65ED FD 21 BE 6D   [14] 5374 	ld	iy,#_bound
   65F1 FD 75 00      [19] 5375 	ld	0 (iy),l
                           5376 ;src/main.c:466: if(object.dir == 2 || object.dir == 8)
   65F4 3A C7 6D      [13] 5377 	ld	a,(#_object + 7)
   65F7 FE 02         [ 7] 5378 	cp	a,#0x02
   65F9 28 04         [12] 5379 	jr	Z,00122$
   65FB D6 08         [ 7] 5380 	sub	a, #0x08
   65FD 20 04         [12] 5381 	jr	NZ,00123$
   65FF                    5382 00122$:
                           5383 ;src/main.c:467: atkObj = 21;
   65FF 06 15         [ 7] 5384 	ld	b,#0x15
   6601 18 02         [12] 5385 	jr	00124$
   6603                    5386 00123$:
                           5387 ;src/main.c:469: atkObj = 22;
   6603 06 16         [ 7] 5388 	ld	b,#0x16
   6605                    5389 00124$:
                           5390 ;src/main.c:470: if(enemy.life > 0 && checkCollisions(object.x, object.y, enemy.x, enemy.y, atkObj) == 1){
   6605 3A DD 6D      [13] 5391 	ld	a, (#(_enemy + 0x0008) + 0)
   6608 B7            [ 4] 5392 	or	a, a
   6609 28 31         [12] 5393 	jr	Z,00130$
   660B 3A D6 6D      [13] 5394 	ld	a, (#(_enemy + 0x0001) + 0)
   660E 21 D5 6D      [10] 5395 	ld	hl, #_enemy + 0
   6611 4E            [ 7] 5396 	ld	c,(hl)
   6612 21 C1 6D      [10] 5397 	ld	hl, #_object + 1
   6615 5E            [ 7] 5398 	ld	e,(hl)
   6616 21 C0 6D      [10] 5399 	ld	hl, #_object + 0
   6619 56            [ 7] 5400 	ld	d,(hl)
   661A C5            [11] 5401 	push	bc
   661B 33            [ 6] 5402 	inc	sp
   661C F5            [11] 5403 	push	af
   661D 33            [ 6] 5404 	inc	sp
   661E 79            [ 4] 5405 	ld	a,c
   661F F5            [11] 5406 	push	af
   6620 33            [ 6] 5407 	inc	sp
   6621 7B            [ 4] 5408 	ld	a,e
   6622 F5            [11] 5409 	push	af
   6623 33            [ 6] 5410 	inc	sp
   6624 D5            [11] 5411 	push	de
   6625 33            [ 6] 5412 	inc	sp
   6626 CD 52 50      [17] 5413 	call	_checkCollisions
   6629 F1            [10] 5414 	pop	af
   662A F1            [10] 5415 	pop	af
   662B 33            [ 6] 5416 	inc	sp
   662C 2D            [ 4] 5417 	dec	l
   662D 20 0D         [12] 5418 	jr	NZ,00130$
                           5419 ;src/main.c:471: enemy.life -= 1;
   662F 3A DD 6D      [13] 5420 	ld	a, (#(_enemy + 0x0008) + 0)
   6632 C6 FF         [ 7] 5421 	add	a,#0xFF
   6634 32 DD 6D      [13] 5422 	ld	(#(_enemy + 0x0008)),a
                           5423 ;src/main.c:472: object.vivo = 0;
   6637 21 C6 6D      [10] 5424 	ld	hl,#_object + 6
   663A 36 00         [10] 5425 	ld	(hl),#0x00
   663C                    5426 00130$:
                           5427 ;src/main.c:475: if(finish == 1) return;
   663C 3A BB 6D      [13] 5428 	ld	a,(#_finish + 0)
   663F 3D            [ 4] 5429 	dec	a
   6640 C2 CB 64      [10] 5430 	jp	NZ,00134$
   6643 DD F9         [10] 5431 	ld	sp, ix
   6645 DD E1         [14] 5432 	pop	ix
   6647 C9            [10] 5433 	ret
                           5434 ;src/main.c:482: void credits(){
                           5435 ;	---------------------------------
                           5436 ; Function credits
                           5437 ; ---------------------------------
   6648                    5438 _credits::
                           5439 ;src/main.c:484: cpct_clearScreen(0);
   6648 21 00 40      [10] 5440 	ld	hl,#0x4000
   664B E5            [11] 5441 	push	hl
   664C AF            [ 4] 5442 	xor	a, a
   664D F5            [11] 5443 	push	af
   664E 33            [ 6] 5444 	inc	sp
   664F 26 C0         [ 7] 5445 	ld	h, #0xC0
   6651 E5            [11] 5446 	push	hl
   6652 CD 20 6B      [17] 5447 	call	_cpct_memset
                           5448 ;src/main.c:485: memptr = cpct_getScreenPtr(VMEM,10,10);
   6655 21 0A 0A      [10] 5449 	ld	hl,#0x0A0A
   6658 E5            [11] 5450 	push	hl
   6659 21 00 C0      [10] 5451 	ld	hl,#0xC000
   665C E5            [11] 5452 	push	hl
   665D CD 13 6C      [17] 5453 	call	_cpct_getScreenPtr
                           5454 ;src/main.c:486: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6660 EB            [ 4] 5455 	ex	de,hl
   6661 01 AA 66      [10] 5456 	ld	bc,#___str_5
   6664 D5            [11] 5457 	push	de
   6665 21 01 00      [10] 5458 	ld	hl,#0x0001
   6668 E5            [11] 5459 	push	hl
   6669 D5            [11] 5460 	push	de
   666A C5            [11] 5461 	push	bc
   666B CD F1 68      [17] 5462 	call	_cpct_drawStringM0
   666E 21 06 00      [10] 5463 	ld	hl,#6
   6671 39            [11] 5464 	add	hl,sp
   6672 F9            [ 6] 5465 	ld	sp,hl
   6673 D1            [10] 5466 	pop	de
                           5467 ;src/main.c:488: while (1){
   6674                    5468 00104$:
                           5469 ;src/main.c:490: cpct_scanKeyboard_f();
   6674 D5            [11] 5470 	push	de
   6675 CD 10 68      [17] 5471 	call	_cpct_scanKeyboard_f
   6678 D1            [10] 5472 	pop	de
                           5473 ;src/main.c:491: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   6679 01 BB 66      [10] 5474 	ld	bc,#___str_6
   667C D5            [11] 5475 	push	de
   667D 21 01 00      [10] 5476 	ld	hl,#0x0001
   6680 E5            [11] 5477 	push	hl
   6681 D5            [11] 5478 	push	de
   6682 C5            [11] 5479 	push	bc
   6683 CD F1 68      [17] 5480 	call	_cpct_drawStringM0
   6686 21 06 00      [10] 5481 	ld	hl,#6
   6689 39            [11] 5482 	add	hl,sp
   668A F9            [ 6] 5483 	ld	sp,hl
   668B D1            [10] 5484 	pop	de
                           5485 ;src/main.c:492: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   668C 01 D1 66      [10] 5486 	ld	bc,#___str_7
   668F D5            [11] 5487 	push	de
   6690 21 01 00      [10] 5488 	ld	hl,#0x0001
   6693 E5            [11] 5489 	push	hl
   6694 D5            [11] 5490 	push	de
   6695 C5            [11] 5491 	push	bc
   6696 CD F1 68      [17] 5492 	call	_cpct_drawStringM0
   6699 21 06 00      [10] 5493 	ld	hl,#6
   669C 39            [11] 5494 	add	hl,sp
   669D F9            [ 6] 5495 	ld	sp,hl
   669E 21 08 04      [10] 5496 	ld	hl,#0x0408
   66A1 CD 04 68      [17] 5497 	call	_cpct_isKeyPressed
   66A4 7D            [ 4] 5498 	ld	a,l
   66A5 D1            [10] 5499 	pop	de
   66A6 B7            [ 4] 5500 	or	a, a
   66A7 28 CB         [12] 5501 	jr	Z,00104$
                           5502 ;src/main.c:496: return;
   66A9 C9            [10] 5503 	ret
   66AA                    5504 ___str_5:
   66AA 4C 6F 75 6E 67 65  5505 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   66BA 00                 5506 	.db 0x00
   66BB                    5507 ___str_6:
   66BB 4A 6F 73 65 70 20  5508 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   66D0 00                 5509 	.db 0x00
   66D1                    5510 ___str_7:
   66D1 41 6C 62 65 72 74  5511 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   66EA 00                 5512 	.db 0x00
                           5513 ;src/main.c:506: void main(void) {
                           5514 ;	---------------------------------
                           5515 ; Function main
                           5516 ; ---------------------------------
   66EB                    5517 _main::
                           5518 ;src/main.c:510: init();
   66EB CD 1F 54      [17] 5519 	call	_init
                           5520 ;src/main.c:513: while(1){
   66EE                    5521 00106$:
                           5522 ;src/main.c:514: x=menu();
   66EE CD F0 54      [17] 5523 	call	_menu
   66F1 5D            [ 4] 5524 	ld	e, l
   66F2 54            [ 4] 5525 	ld	d, h
                           5526 ;src/main.c:515: switch(x){
   66F3 CB 7A         [ 8] 5527 	bit	7, d
   66F5 20 F7         [12] 5528 	jr	NZ,00106$
   66F7 3E 02         [ 7] 5529 	ld	a,#0x02
   66F9 BB            [ 4] 5530 	cp	a, e
   66FA 3E 00         [ 7] 5531 	ld	a,#0x00
   66FC 9A            [ 4] 5532 	sbc	a, d
   66FD E2 02 67      [10] 5533 	jp	PO, 00122$
   6700 EE 80         [ 7] 5534 	xor	a, #0x80
   6702                    5535 00122$:
   6702 FA EE 66      [10] 5536 	jp	M,00106$
   6705 16 00         [ 7] 5537 	ld	d,#0x00
   6707 21 0D 67      [10] 5538 	ld	hl,#00123$
   670A 19            [11] 5539 	add	hl,de
   670B 19            [11] 5540 	add	hl,de
                           5541 ;src/main.c:516: case 0: return;break;
                           5542 ;src/main.c:517: case 1: game(); break;
   670C E9            [ 4] 5543 	jp	(hl)
   670D                    5544 00123$:
   670D 18 10         [12] 5545 	jr	00108$
   670F 18 04         [12] 5546 	jr	00102$
   6711 18 07         [12] 5547 	jr	00103$
   6713 18 0A         [12] 5548 	jr	00108$
   6715                    5549 00102$:
   6715 CD 3C 64      [17] 5550 	call	_game
   6718 18 D4         [12] 5551 	jr	00106$
                           5552 ;src/main.c:518: case 2: credits();break;
   671A                    5553 00103$:
   671A CD 48 66      [17] 5554 	call	_credits
                           5555 ;src/main.c:519: }
   671D 18 CF         [12] 5556 	jr	00106$
   671F                    5557 00108$:
   671F C9            [10] 5558 	ret
                           5559 	.area _CODE
                           5560 	.area _INITIALIZER
                           5561 	.area _CABS (ABS)
