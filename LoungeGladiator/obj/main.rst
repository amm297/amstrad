                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct 20 12:46:27 2015
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
                             16 	.globl _checkArrowCollisions
                             17 	.globl _checkBoundsCollisions
                             18 	.globl _checkBoundsCollisionsEnemy
                             19 	.globl _menu
                             20 	.globl _gameOver
                             21 	.globl _initEnemies
                             22 	.globl _initPlayer
                             23 	.globl _init
                             24 	.globl _moveObject
                             25 	.globl _checkKeyboard
                             26 	.globl _checkCollisions
                             27 	.globl _vissionSensor
                             28 	.globl _patrol
                             29 	.globl _followPlayer
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
   6ADC                      81 _scene::
   6ADC                      82 	.ds 240
   6BCC                      83 _temp::
   6BCC                      84 	.ds 2
   6BCE                      85 _map::
   6BCE                      86 	.ds 1
   6BCF                      87 _path::
   6BCF                      88 	.ds 1
   6BD0                      89 _finish::
   6BD0                      90 	.ds 1
   6BD1                      91 _arrow::
   6BD1                      92 	.ds 1
   6BD2                      93 _following::
   6BD2                      94 	.ds 1
   6BD3                      95 _bound::
   6BD3                      96 	.ds 1
   6BD4                      97 _archer::
   6BD4                      98 	.ds 1
   6BD5                      99 _object::
   6BD5                     100 	.ds 10
   6BDF                     101 _player::
   6BDF                     102 	.ds 11
   6BEA                     103 _enemy::
   6BEA                     104 	.ds 12
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
   46C8 21 EE FF      [10]  137 	ld	hl,#-18
   46CB 39            [11]  138 	add	hl,sp
   46CC F9            [ 6]  139 	ld	sp,hl
                            140 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  141 	ld	a,4 (ix)
   46D0 3D            [ 4]  142 	dec	a
   46D1 C2 79 47      [10]  143 	jp	NZ,00104$
                            144 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  145 	ld	hl,#0x0000
   46D7 E3            [19]  146 	ex	(sp), hl
   46D8 DD 36 FC 00   [19]  147 	ld	-4 (ix),#0x00
   46DC DD 36 FD 00   [19]  148 	ld	-3 (ix),#0x00
                            149 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     150 00130$:
   46E0 3E DC         [ 7]  151 	ld	a,#<(_scene)
   46E2 DD 86 FC      [19]  152 	add	a, -4 (ix)
   46E5 DD 77 F8      [19]  153 	ld	-8 (ix),a
   46E8 3E 6A         [ 7]  154 	ld	a,#>(_scene)
   46EA DD 8E FD      [19]  155 	adc	a, -3 (ix)
   46ED DD 77 F9      [19]  156 	ld	-7 (ix),a
   46F0 3E E2         [ 7]  157 	ld	a,#<(_mapa1)
   46F2 DD 86 FC      [19]  158 	add	a, -4 (ix)
   46F5 DD 77 F6      [19]  159 	ld	-10 (ix),a
   46F8 3E 48         [ 7]  160 	ld	a,#>(_mapa1)
   46FA DD 8E FD      [19]  161 	adc	a, -3 (ix)
   46FD DD 77 F7      [19]  162 	ld	-9 (ix),a
   4700 DD 36 F0 00   [19]  163 	ld	-16 (ix),#0x00
   4704 DD 36 F1 00   [19]  164 	ld	-15 (ix),#0x00
   4708                     165 00115$:
                            166 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E F8      [19]  167 	ld	a,-8 (ix)
   470B DD 86 F0      [19]  168 	add	a, -16 (ix)
   470E DD 77 FA      [19]  169 	ld	-6 (ix),a
   4711 DD 7E F9      [19]  170 	ld	a,-7 (ix)
   4714 DD 8E F1      [19]  171 	adc	a, -15 (ix)
   4717 DD 77 FB      [19]  172 	ld	-5 (ix),a
   471A DD 7E F6      [19]  173 	ld	a,-10 (ix)
   471D DD 86 F0      [19]  174 	add	a, -16 (ix)
   4720 DD 77 FE      [19]  175 	ld	-2 (ix),a
   4723 DD 7E F7      [19]  176 	ld	a,-9 (ix)
   4726 DD 8E F1      [19]  177 	adc	a, -15 (ix)
   4729 DD 77 FF      [19]  178 	ld	-1 (ix),a
   472C DD 6E FE      [19]  179 	ld	l,-2 (ix)
   472F DD 66 FF      [19]  180 	ld	h,-1 (ix)
   4732 7E            [ 7]  181 	ld	a,(hl)
   4733 DD 6E FA      [19]  182 	ld	l,-6 (ix)
   4736 DD 66 FB      [19]  183 	ld	h,-5 (ix)
   4739 77            [ 7]  184 	ld	(hl),a
                            185 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F0      [23]  186 	inc	-16 (ix)
   473D 20 03         [12]  187 	jr	NZ,00189$
   473F DD 34 F1      [23]  188 	inc	-15 (ix)
   4742                     189 00189$:
   4742 DD 7E F0      [19]  190 	ld	a,-16 (ix)
   4745 D6 14         [ 7]  191 	sub	a, #0x14
   4747 DD 7E F1      [19]  192 	ld	a,-15 (ix)
   474A 17            [ 4]  193 	rla
   474B 3F            [ 4]  194 	ccf
   474C 1F            [ 4]  195 	rra
   474D DE 80         [ 7]  196 	sbc	a, #0x80
   474F 38 B7         [12]  197 	jr	C,00115$
                            198 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E FC      [19]  199 	ld	a,-4 (ix)
   4754 C6 14         [ 7]  200 	add	a, #0x14
   4756 DD 77 FC      [19]  201 	ld	-4 (ix),a
   4759 DD 7E FD      [19]  202 	ld	a,-3 (ix)
   475C CE 00         [ 7]  203 	adc	a, #0x00
   475E DD 77 FD      [19]  204 	ld	-3 (ix),a
   4761 DD 34 EE      [23]  205 	inc	-18 (ix)
   4764 20 03         [12]  206 	jr	NZ,00190$
   4766 DD 34 EF      [23]  207 	inc	-17 (ix)
   4769                     208 00190$:
   4769 DD 7E EE      [19]  209 	ld	a,-18 (ix)
   476C D6 0C         [ 7]  210 	sub	a, #0x0C
   476E DD 7E EF      [19]  211 	ld	a,-17 (ix)
   4771 17            [ 4]  212 	rla
   4772 3F            [ 4]  213 	ccf
   4773 1F            [ 4]  214 	rra
   4774 DE 80         [ 7]  215 	sbc	a, #0x80
   4776 DA E0 46      [10]  216 	jp	C,00130$
   4779                     217 00104$:
                            218 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  219 	ld	a,4 (ix)
   477C D6 02         [ 7]  220 	sub	a, #0x02
   477E 20 5F         [12]  221 	jr	NZ,00141$
                            222 ;src/draws.h:27: for(y=0;y<height;y++){
   4780 21 00 00      [10]  223 	ld	hl,#0x0000
   4783 E3            [19]  224 	ex	(sp), hl
   4784 11 00 00      [10]  225 	ld	de,#0x0000
                            226 ;src/draws.h:28: for(x=0;x<width;x++){
   4787                     227 00134$:
   4787 21 DC 6A      [10]  228 	ld	hl,#_scene
   478A 19            [11]  229 	add	hl,de
   478B DD 75 FE      [19]  230 	ld	-2 (ix),l
   478E DD 74 FF      [19]  231 	ld	-1 (ix),h
   4791 21 D2 49      [10]  232 	ld	hl,#_mapa2
   4794 19            [11]  233 	add	hl,de
   4795 DD 75 FA      [19]  234 	ld	-6 (ix),l
   4798 DD 74 FB      [19]  235 	ld	-5 (ix),h
   479B 01 00 00      [10]  236 	ld	bc,#0x0000
   479E                     237 00119$:
                            238 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   479E E5            [11]  239 	push	hl
   479F DD 6E FE      [19]  240 	ld	l,-2 (ix)
   47A2 DD 66 FF      [19]  241 	ld	h,-1 (ix)
   47A5 E5            [11]  242 	push	hl
   47A6 FD E1         [14]  243 	pop	iy
   47A8 E1            [10]  244 	pop	hl
   47A9 FD 09         [15]  245 	add	iy, bc
   47AB DD 6E FA      [19]  246 	ld	l,-6 (ix)
   47AE DD 66 FB      [19]  247 	ld	h,-5 (ix)
   47B1 09            [11]  248 	add	hl,bc
   47B2 7E            [ 7]  249 	ld	a,(hl)
   47B3 FD 77 00      [19]  250 	ld	0 (iy), a
                            251 ;src/draws.h:28: for(x=0;x<width;x++){
   47B6 03            [ 6]  252 	inc	bc
   47B7 79            [ 4]  253 	ld	a,c
   47B8 D6 14         [ 7]  254 	sub	a, #0x14
   47BA 78            [ 4]  255 	ld	a,b
   47BB 17            [ 4]  256 	rla
   47BC 3F            [ 4]  257 	ccf
   47BD 1F            [ 4]  258 	rra
   47BE DE 80         [ 7]  259 	sbc	a, #0x80
   47C0 38 DC         [12]  260 	jr	C,00119$
                            261 ;src/draws.h:27: for(y=0;y<height;y++){
   47C2 21 14 00      [10]  262 	ld	hl,#0x0014
   47C5 19            [11]  263 	add	hl,de
   47C6 5D            [ 4]  264 	ld	e,l
   47C7 54            [ 4]  265 	ld	d,h
   47C8 DD 34 EE      [23]  266 	inc	-18 (ix)
   47CB 20 03         [12]  267 	jr	NZ,00193$
   47CD DD 34 EF      [23]  268 	inc	-17 (ix)
   47D0                     269 00193$:
   47D0 DD 7E EE      [19]  270 	ld	a,-18 (ix)
   47D3 D6 0C         [ 7]  271 	sub	a, #0x0C
   47D5 DD 7E EF      [19]  272 	ld	a,-17 (ix)
   47D8 17            [ 4]  273 	rla
   47D9 3F            [ 4]  274 	ccf
   47DA 1F            [ 4]  275 	rra
   47DB DE 80         [ 7]  276 	sbc	a, #0x80
   47DD 38 A8         [12]  277 	jr	C,00134$
                            278 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   47DF                     279 00141$:
   47DF DD 36 F2 00   [19]  280 	ld	-14 (ix),#0x00
   47E3 DD 36 F3 00   [19]  281 	ld	-13 (ix),#0x00
   47E7 DD 36 FE 00   [19]  282 	ld	-2 (ix),#0x00
   47EB DD 36 FF 00   [19]  283 	ld	-1 (ix),#0x00
   47EF DD 36 FA 00   [19]  284 	ld	-6 (ix),#0x00
   47F3 DD 36 FB 00   [19]  285 	ld	-5 (ix),#0x00
                            286 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   47F7                     287 00139$:
   47F7 3E DC         [ 7]  288 	ld	a,#<(_scene)
   47F9 DD 86 FA      [19]  289 	add	a, -6 (ix)
   47FC DD 77 F6      [19]  290 	ld	-10 (ix),a
   47FF 3E 6A         [ 7]  291 	ld	a,#>(_scene)
   4801 DD 8E FB      [19]  292 	adc	a, -5 (ix)
   4804 DD 77 F7      [19]  293 	ld	-9 (ix),a
   4807 DD 36 F4 00   [19]  294 	ld	-12 (ix),#0x00
   480B DD 36 F5 00   [19]  295 	ld	-11 (ix),#0x00
   480F                     296 00123$:
                            297 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   480F DD 7E F2      [19]  298 	ld	a,-14 (ix)
   4812 07            [ 4]  299 	rlca
   4813 07            [ 4]  300 	rlca
   4814 07            [ 4]  301 	rlca
   4815 07            [ 4]  302 	rlca
   4816 E6 F0         [ 7]  303 	and	a,#0xF0
   4818 67            [ 4]  304 	ld	h,a
   4819 DD 7E F4      [19]  305 	ld	a,-12 (ix)
   481C 87            [ 4]  306 	add	a, a
   481D 87            [ 4]  307 	add	a, a
   481E E5            [11]  308 	push	hl
   481F 33            [ 6]  309 	inc	sp
   4820 F5            [11]  310 	push	af
   4821 33            [ 6]  311 	inc	sp
   4822 21 00 C0      [10]  312 	ld	hl,#0xC000
   4825 E5            [11]  313 	push	hl
   4826 CD E6 69      [17]  314 	call	_cpct_getScreenPtr
   4829 EB            [ 4]  315 	ex	de,hl
                            316 ;src/draws.h:37: if(scene[posY][posX] == 1){
   482A DD 7E F6      [19]  317 	ld	a,-10 (ix)
   482D DD 86 F4      [19]  318 	add	a, -12 (ix)
   4830 6F            [ 4]  319 	ld	l,a
   4831 DD 7E F7      [19]  320 	ld	a,-9 (ix)
   4834 DD 8E F5      [19]  321 	adc	a, -11 (ix)
   4837 67            [ 4]  322 	ld	h,a
   4838 66            [ 7]  323 	ld	h,(hl)
                            324 ;src/draws.h:38: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4839 DD 73 F8      [19]  325 	ld	-8 (ix),e
   483C DD 72 F9      [19]  326 	ld	-7 (ix),d
                            327 ;src/draws.h:37: if(scene[posY][posX] == 1){
   483F 25            [ 4]  328 	dec	h
   4840 20 15         [12]  329 	jr	NZ,00110$
                            330 ;src/draws.h:38: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4842 21 04 10      [10]  331 	ld	hl,#0x1004
   4845 E5            [11]  332 	push	hl
   4846 3E 03         [ 7]  333 	ld	a,#0x03
   4848 F5            [11]  334 	push	af
   4849 33            [ 6]  335 	inc	sp
   484A DD 6E F8      [19]  336 	ld	l,-8 (ix)
   484D DD 66 F9      [19]  337 	ld	h,-7 (ix)
   4850 E5            [11]  338 	push	hl
   4851 CD 15 69      [17]  339 	call	_cpct_drawSolidBox
   4854 F1            [10]  340 	pop	af
   4855 F1            [10]  341 	pop	af
   4856 33            [ 6]  342 	inc	sp
   4857                     343 00110$:
                            344 ;src/draws.h:40: if(scene[posY][posX] == 9){
   4857 3E DC         [ 7]  345 	ld	a,#<(_scene)
   4859 DD 86 FE      [19]  346 	add	a, -2 (ix)
   485C 6F            [ 4]  347 	ld	l,a
   485D 3E 6A         [ 7]  348 	ld	a,#>(_scene)
   485F DD 8E FF      [19]  349 	adc	a, -1 (ix)
   4862 67            [ 4]  350 	ld	h,a
   4863 DD 5E F4      [19]  351 	ld	e,-12 (ix)
   4866 DD 56 F5      [19]  352 	ld	d,-11 (ix)
   4869 19            [11]  353 	add	hl,de
   486A 7E            [ 7]  354 	ld	a,(hl)
   486B D6 09         [ 7]  355 	sub	a, #0x09
   486D 20 15         [12]  356 	jr	NZ,00124$
                            357 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   486F 21 04 10      [10]  358 	ld	hl,#0x1004
   4872 E5            [11]  359 	push	hl
   4873 3E 09         [ 7]  360 	ld	a,#0x09
   4875 F5            [11]  361 	push	af
   4876 33            [ 6]  362 	inc	sp
   4877 DD 6E F8      [19]  363 	ld	l,-8 (ix)
   487A DD 66 F9      [19]  364 	ld	h,-7 (ix)
   487D E5            [11]  365 	push	hl
   487E CD 15 69      [17]  366 	call	_cpct_drawSolidBox
   4881 F1            [10]  367 	pop	af
   4882 F1            [10]  368 	pop	af
   4883 33            [ 6]  369 	inc	sp
   4884                     370 00124$:
                            371 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4884 DD 34 F4      [23]  372 	inc	-12 (ix)
   4887 20 03         [12]  373 	jr	NZ,00198$
   4889 DD 34 F5      [23]  374 	inc	-11 (ix)
   488C                     375 00198$:
   488C DD 7E F4      [19]  376 	ld	a,-12 (ix)
   488F D6 14         [ 7]  377 	sub	a, #0x14
   4891 DD 7E F5      [19]  378 	ld	a,-11 (ix)
   4894 17            [ 4]  379 	rla
   4895 3F            [ 4]  380 	ccf
   4896 1F            [ 4]  381 	rra
   4897 DE 80         [ 7]  382 	sbc	a, #0x80
   4899 DA 0F 48      [10]  383 	jp	C,00123$
                            384 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   489C DD 7E FE      [19]  385 	ld	a,-2 (ix)
   489F C6 14         [ 7]  386 	add	a, #0x14
   48A1 DD 77 FE      [19]  387 	ld	-2 (ix),a
   48A4 DD 7E FF      [19]  388 	ld	a,-1 (ix)
   48A7 CE 00         [ 7]  389 	adc	a, #0x00
   48A9 DD 77 FF      [19]  390 	ld	-1 (ix),a
   48AC DD 7E FA      [19]  391 	ld	a,-6 (ix)
   48AF C6 14         [ 7]  392 	add	a, #0x14
   48B1 DD 77 FA      [19]  393 	ld	-6 (ix),a
   48B4 DD 7E FB      [19]  394 	ld	a,-5 (ix)
   48B7 CE 00         [ 7]  395 	adc	a, #0x00
   48B9 DD 77 FB      [19]  396 	ld	-5 (ix),a
   48BC DD 34 F2      [23]  397 	inc	-14 (ix)
   48BF 20 03         [12]  398 	jr	NZ,00199$
   48C1 DD 34 F3      [23]  399 	inc	-13 (ix)
   48C4                     400 00199$:
   48C4 DD 7E F2      [19]  401 	ld	a,-14 (ix)
   48C7 D6 0C         [ 7]  402 	sub	a, #0x0C
   48C9 DD 7E F3      [19]  403 	ld	a,-13 (ix)
   48CC 17            [ 4]  404 	rla
   48CD 3F            [ 4]  405 	ccf
   48CE 1F            [ 4]  406 	rra
   48CF DE 80         [ 7]  407 	sbc	a, #0x80
   48D1 DA F7 47      [10]  408 	jp	C,00139$
   48D4 DD F9         [10]  409 	ld	sp, ix
   48D6 DD E1         [14]  410 	pop	ix
   48D8 C9            [10]  411 	ret
   48D9                     412 _g_palette:
   48D9 00                  413 	.db #0x00	; 0
   48DA 1A                  414 	.db #0x1A	; 26
   48DB 06                  415 	.db #0x06	; 6
   48DC 0D                  416 	.db #0x0D	; 13
   48DD 00                  417 	.db 0x00
   48DE                     418 _origins:
   48DE 00                  419 	.db #0x00	; 0
   48DF 50                  420 	.db #0x50	; 80	'P'
   48E0 34                  421 	.db #0x34	; 52	'4'
   48E1 50                  422 	.db #0x50	; 80	'P'
   48E2                     423 _mapa1:
   48E2 01                  424 	.db #0x01	; 1
   48E3 01                  425 	.db #0x01	; 1
   48E4 01                  426 	.db #0x01	; 1
   48E5 01                  427 	.db #0x01	; 1
   48E6 01                  428 	.db #0x01	; 1
   48E7 01                  429 	.db #0x01	; 1
   48E8 01                  430 	.db #0x01	; 1
   48E9 01                  431 	.db #0x01	; 1
   48EA 01                  432 	.db #0x01	; 1
   48EB 01                  433 	.db #0x01	; 1
   48EC 01                  434 	.db #0x01	; 1
   48ED 01                  435 	.db #0x01	; 1
   48EE 01                  436 	.db #0x01	; 1
   48EF 01                  437 	.db #0x01	; 1
   48F0 01                  438 	.db #0x01	; 1
   48F1 01                  439 	.db #0x01	; 1
   48F2 01                  440 	.db #0x01	; 1
   48F3 01                  441 	.db #0x01	; 1
   48F4 01                  442 	.db #0x01	; 1
   48F5 01                  443 	.db #0x01	; 1
   48F6 01                  444 	.db #0x01	; 1
   48F7 00                  445 	.db #0x00	; 0
   48F8 05                  446 	.db #0x05	; 5
   48F9 00                  447 	.db #0x00	; 0
   48FA 00                  448 	.db #0x00	; 0
   48FB 00                  449 	.db #0x00	; 0
   48FC 00                  450 	.db #0x00	; 0
   48FD 00                  451 	.db #0x00	; 0
   48FE 00                  452 	.db #0x00	; 0
   48FF 00                  453 	.db #0x00	; 0
   4900 00                  454 	.db #0x00	; 0
   4901 00                  455 	.db #0x00	; 0
   4902 00                  456 	.db #0x00	; 0
   4903 00                  457 	.db #0x00	; 0
   4904 00                  458 	.db #0x00	; 0
   4905 00                  459 	.db #0x00	; 0
   4906 00                  460 	.db #0x00	; 0
   4907 00                  461 	.db #0x00	; 0
   4908 00                  462 	.db #0x00	; 0
   4909 01                  463 	.db #0x01	; 1
   490A 01                  464 	.db #0x01	; 1
   490B 00                  465 	.db #0x00	; 0
   490C 00                  466 	.db #0x00	; 0
   490D 00                  467 	.db #0x00	; 0
   490E 00                  468 	.db #0x00	; 0
   490F 00                  469 	.db #0x00	; 0
   4910 00                  470 	.db #0x00	; 0
   4911 00                  471 	.db #0x00	; 0
   4912 00                  472 	.db #0x00	; 0
   4913 00                  473 	.db #0x00	; 0
   4914 00                  474 	.db #0x00	; 0
   4915 00                  475 	.db #0x00	; 0
   4916 00                  476 	.db #0x00	; 0
   4917 00                  477 	.db #0x00	; 0
   4918 00                  478 	.db #0x00	; 0
   4919 00                  479 	.db #0x00	; 0
   491A 00                  480 	.db #0x00	; 0
   491B 00                  481 	.db #0x00	; 0
   491C 00                  482 	.db #0x00	; 0
   491D 01                  483 	.db #0x01	; 1
   491E 01                  484 	.db #0x01	; 1
   491F 01                  485 	.db #0x01	; 1
   4920 01                  486 	.db #0x01	; 1
   4921 01                  487 	.db #0x01	; 1
   4922 01                  488 	.db #0x01	; 1
   4923 01                  489 	.db #0x01	; 1
   4924 01                  490 	.db #0x01	; 1
   4925 01                  491 	.db #0x01	; 1
   4926 01                  492 	.db #0x01	; 1
   4927 01                  493 	.db #0x01	; 1
   4928 01                  494 	.db #0x01	; 1
   4929 01                  495 	.db #0x01	; 1
   492A 01                  496 	.db #0x01	; 1
   492B 01                  497 	.db #0x01	; 1
   492C 01                  498 	.db #0x01	; 1
   492D 00                  499 	.db #0x00	; 0
   492E 00                  500 	.db #0x00	; 0
   492F 01                  501 	.db #0x01	; 1
   4930 01                  502 	.db #0x01	; 1
   4931 01                  503 	.db #0x01	; 1
   4932 01                  504 	.db #0x01	; 1
   4933 00                  505 	.db #0x00	; 0
   4934 00                  506 	.db #0x00	; 0
   4935 00                  507 	.db #0x00	; 0
   4936 00                  508 	.db #0x00	; 0
   4937 00                  509 	.db #0x00	; 0
   4938 00                  510 	.db #0x00	; 0
   4939 00                  511 	.db #0x00	; 0
   493A 00                  512 	.db #0x00	; 0
   493B 00                  513 	.db #0x00	; 0
   493C 00                  514 	.db #0x00	; 0
   493D 01                  515 	.db #0x01	; 1
   493E 03                  516 	.db #0x03	; 3
   493F 03                  517 	.db #0x03	; 3
   4940 03                  518 	.db #0x03	; 3
   4941 03                  519 	.db #0x03	; 3
   4942 03                  520 	.db #0x03	; 3
   4943 03                  521 	.db #0x03	; 3
   4944 03                  522 	.db #0x03	; 3
   4945 01                  523 	.db #0x01	; 1
   4946 00                  524 	.db #0x00	; 0
   4947 00                  525 	.db #0x00	; 0
   4948 01                  526 	.db #0x01	; 1
   4949 01                  527 	.db #0x01	; 1
   494A 00                  528 	.db #0x00	; 0
   494B 01                  529 	.db #0x01	; 1
   494C 01                  530 	.db #0x01	; 1
   494D 01                  531 	.db #0x01	; 1
   494E 00                  532 	.db #0x00	; 0
   494F 00                  533 	.db #0x00	; 0
   4950 00                  534 	.db #0x00	; 0
   4951 01                  535 	.db #0x01	; 1
   4952 03                  536 	.db #0x03	; 3
   4953 03                  537 	.db #0x03	; 3
   4954 03                  538 	.db #0x03	; 3
   4955 03                  539 	.db #0x03	; 3
   4956 03                  540 	.db #0x03	; 3
   4957 03                  541 	.db #0x03	; 3
   4958 03                  542 	.db #0x03	; 3
   4959 01                  543 	.db #0x01	; 1
   495A 01                  544 	.db #0x01	; 1
   495B 00                  545 	.db #0x00	; 0
   495C 01                  546 	.db #0x01	; 1
   495D 00                  547 	.db #0x00	; 0
   495E 00                  548 	.db #0x00	; 0
   495F 00                  549 	.db #0x00	; 0
   4960 00                  550 	.db #0x00	; 0
   4961 01                  551 	.db #0x01	; 1
   4962 00                  552 	.db #0x00	; 0
   4963 00                  553 	.db #0x00	; 0
   4964 00                  554 	.db #0x00	; 0
   4965 01                  555 	.db #0x01	; 1
   4966 03                  556 	.db #0x03	; 3
   4967 03                  557 	.db #0x03	; 3
   4968 03                  558 	.db #0x03	; 3
   4969 03                  559 	.db #0x03	; 3
   496A 03                  560 	.db #0x03	; 3
   496B 03                  561 	.db #0x03	; 3
   496C 03                  562 	.db #0x03	; 3
   496D 01                  563 	.db #0x01	; 1
   496E 01                  564 	.db #0x01	; 1
   496F 00                  565 	.db #0x00	; 0
   4970 01                  566 	.db #0x01	; 1
   4971 00                  567 	.db #0x00	; 0
   4972 00                  568 	.db #0x00	; 0
   4973 00                  569 	.db #0x00	; 0
   4974 00                  570 	.db #0x00	; 0
   4975 01                  571 	.db #0x01	; 1
   4976 00                  572 	.db #0x00	; 0
   4977 00                  573 	.db #0x00	; 0
   4978 00                  574 	.db #0x00	; 0
   4979 01                  575 	.db #0x01	; 1
   497A 03                  576 	.db #0x03	; 3
   497B 03                  577 	.db #0x03	; 3
   497C 03                  578 	.db #0x03	; 3
   497D 03                  579 	.db #0x03	; 3
   497E 03                  580 	.db #0x03	; 3
   497F 03                  581 	.db #0x03	; 3
   4980 03                  582 	.db #0x03	; 3
   4981 01                  583 	.db #0x01	; 1
   4982 01                  584 	.db #0x01	; 1
   4983 00                  585 	.db #0x00	; 0
   4984 01                  586 	.db #0x01	; 1
   4985 00                  587 	.db #0x00	; 0
   4986 00                  588 	.db #0x00	; 0
   4987 00                  589 	.db #0x00	; 0
   4988 00                  590 	.db #0x00	; 0
   4989 01                  591 	.db #0x01	; 1
   498A 00                  592 	.db #0x00	; 0
   498B 00                  593 	.db #0x00	; 0
   498C 00                  594 	.db #0x00	; 0
   498D 01                  595 	.db #0x01	; 1
   498E 03                  596 	.db #0x03	; 3
   498F 03                  597 	.db #0x03	; 3
   4990 03                  598 	.db #0x03	; 3
   4991 03                  599 	.db #0x03	; 3
   4992 03                  600 	.db #0x03	; 3
   4993 03                  601 	.db #0x03	; 3
   4994 03                  602 	.db #0x03	; 3
   4995 01                  603 	.db #0x01	; 1
   4996 01                  604 	.db #0x01	; 1
   4997 00                  605 	.db #0x00	; 0
   4998 01                  606 	.db #0x01	; 1
   4999 00                  607 	.db #0x00	; 0
   499A 00                  608 	.db #0x00	; 0
   499B 00                  609 	.db #0x00	; 0
   499C 00                  610 	.db #0x00	; 0
   499D 01                  611 	.db #0x01	; 1
   499E 00                  612 	.db #0x00	; 0
   499F 00                  613 	.db #0x00	; 0
   49A0 00                  614 	.db #0x00	; 0
   49A1 01                  615 	.db #0x01	; 1
   49A2 03                  616 	.db #0x03	; 3
   49A3 03                  617 	.db #0x03	; 3
   49A4 03                  618 	.db #0x03	; 3
   49A5 03                  619 	.db #0x03	; 3
   49A6 03                  620 	.db #0x03	; 3
   49A7 03                  621 	.db #0x03	; 3
   49A8 03                  622 	.db #0x03	; 3
   49A9 01                  623 	.db #0x01	; 1
   49AA 01                  624 	.db #0x01	; 1
   49AB 02                  625 	.db #0x02	; 2
   49AC 01                  626 	.db #0x01	; 1
   49AD 00                  627 	.db #0x00	; 0
   49AE 00                  628 	.db #0x00	; 0
   49AF 00                  629 	.db #0x00	; 0
   49B0 00                  630 	.db #0x00	; 0
   49B1 01                  631 	.db #0x01	; 1
   49B2 00                  632 	.db #0x00	; 0
   49B3 00                  633 	.db #0x00	; 0
   49B4 00                  634 	.db #0x00	; 0
   49B5 0A                  635 	.db #0x0A	; 10
   49B6 03                  636 	.db #0x03	; 3
   49B7 03                  637 	.db #0x03	; 3
   49B8 03                  638 	.db #0x03	; 3
   49B9 03                  639 	.db #0x03	; 3
   49BA 03                  640 	.db #0x03	; 3
   49BB 03                  641 	.db #0x03	; 3
   49BC 03                  642 	.db #0x03	; 3
   49BD 01                  643 	.db #0x01	; 1
   49BE 01                  644 	.db #0x01	; 1
   49BF 01                  645 	.db #0x01	; 1
   49C0 01                  646 	.db #0x01	; 1
   49C1 01                  647 	.db #0x01	; 1
   49C2 01                  648 	.db #0x01	; 1
   49C3 01                  649 	.db #0x01	; 1
   49C4 01                  650 	.db #0x01	; 1
   49C5 01                  651 	.db #0x01	; 1
   49C6 01                  652 	.db #0x01	; 1
   49C7 01                  653 	.db #0x01	; 1
   49C8 01                  654 	.db #0x01	; 1
   49C9 01                  655 	.db #0x01	; 1
   49CA 01                  656 	.db #0x01	; 1
   49CB 01                  657 	.db #0x01	; 1
   49CC 01                  658 	.db #0x01	; 1
   49CD 09                  659 	.db #0x09	; 9
   49CE 09                  660 	.db #0x09	; 9
   49CF 01                  661 	.db #0x01	; 1
   49D0 01                  662 	.db #0x01	; 1
   49D1 01                  663 	.db #0x01	; 1
   49D2                     664 _mapa2:
   49D2 01                  665 	.db #0x01	; 1
   49D3 01                  666 	.db #0x01	; 1
   49D4 01                  667 	.db #0x01	; 1
   49D5 01                  668 	.db #0x01	; 1
   49D6 01                  669 	.db #0x01	; 1
   49D7 01                  670 	.db #0x01	; 1
   49D8 01                  671 	.db #0x01	; 1
   49D9 01                  672 	.db #0x01	; 1
   49DA 01                  673 	.db #0x01	; 1
   49DB 01                  674 	.db #0x01	; 1
   49DC 01                  675 	.db #0x01	; 1
   49DD 01                  676 	.db #0x01	; 1
   49DE 01                  677 	.db #0x01	; 1
   49DF 01                  678 	.db #0x01	; 1
   49E0 01                  679 	.db #0x01	; 1
   49E1 01                  680 	.db #0x01	; 1
   49E2 01                  681 	.db #0x01	; 1
   49E3 01                  682 	.db #0x01	; 1
   49E4 01                  683 	.db #0x01	; 1
   49E5 01                  684 	.db #0x01	; 1
   49E6 01                  685 	.db #0x01	; 1
   49E7 00                  686 	.db #0x00	; 0
   49E8 00                  687 	.db #0x00	; 0
   49E9 00                  688 	.db #0x00	; 0
   49EA 00                  689 	.db #0x00	; 0
   49EB 01                  690 	.db #0x01	; 1
   49EC 00                  691 	.db #0x00	; 0
   49ED 00                  692 	.db #0x00	; 0
   49EE 00                  693 	.db #0x00	; 0
   49EF 00                  694 	.db #0x00	; 0
   49F0 00                  695 	.db #0x00	; 0
   49F1 00                  696 	.db #0x00	; 0
   49F2 00                  697 	.db #0x00	; 0
   49F3 00                  698 	.db #0x00	; 0
   49F4 00                  699 	.db #0x00	; 0
   49F5 00                  700 	.db #0x00	; 0
   49F6 00                  701 	.db #0x00	; 0
   49F7 00                  702 	.db #0x00	; 0
   49F8 00                  703 	.db #0x00	; 0
   49F9 06                  704 	.db #0x06	; 6
   49FA 01                  705 	.db #0x01	; 1
   49FB 00                  706 	.db #0x00	; 0
   49FC 00                  707 	.db #0x00	; 0
   49FD 01                  708 	.db #0x01	; 1
   49FE 00                  709 	.db #0x00	; 0
   49FF 00                  710 	.db #0x00	; 0
   4A00 00                  711 	.db #0x00	; 0
   4A01 00                  712 	.db #0x00	; 0
   4A02 00                  713 	.db #0x00	; 0
   4A03 00                  714 	.db #0x00	; 0
   4A04 00                  715 	.db #0x00	; 0
   4A05 00                  716 	.db #0x00	; 0
   4A06 00                  717 	.db #0x00	; 0
   4A07 00                  718 	.db #0x00	; 0
   4A08 00                  719 	.db #0x00	; 0
   4A09 00                  720 	.db #0x00	; 0
   4A0A 00                  721 	.db #0x00	; 0
   4A0B 00                  722 	.db #0x00	; 0
   4A0C 00                  723 	.db #0x00	; 0
   4A0D 01                  724 	.db #0x01	; 1
   4A0E 01                  725 	.db #0x01	; 1
   4A0F 00                  726 	.db #0x00	; 0
   4A10 01                  727 	.db #0x01	; 1
   4A11 01                  728 	.db #0x01	; 1
   4A12 01                  729 	.db #0x01	; 1
   4A13 01                  730 	.db #0x01	; 1
   4A14 00                  731 	.db #0x00	; 0
   4A15 00                  732 	.db #0x00	; 0
   4A16 01                  733 	.db #0x01	; 1
   4A17 01                  734 	.db #0x01	; 1
   4A18 01                  735 	.db #0x01	; 1
   4A19 01                  736 	.db #0x01	; 1
   4A1A 01                  737 	.db #0x01	; 1
   4A1B 01                  738 	.db #0x01	; 1
   4A1C 01                  739 	.db #0x01	; 1
   4A1D 01                  740 	.db #0x01	; 1
   4A1E 01                  741 	.db #0x01	; 1
   4A1F 01                  742 	.db #0x01	; 1
   4A20 01                  743 	.db #0x01	; 1
   4A21 01                  744 	.db #0x01	; 1
   4A22 01                  745 	.db #0x01	; 1
   4A23 00                  746 	.db #0x00	; 0
   4A24 05                  747 	.db #0x05	; 5
   4A25 01                  748 	.db #0x01	; 1
   4A26 00                  749 	.db #0x00	; 0
   4A27 00                  750 	.db #0x00	; 0
   4A28 00                  751 	.db #0x00	; 0
   4A29 00                  752 	.db #0x00	; 0
   4A2A 00                  753 	.db #0x00	; 0
   4A2B 00                  754 	.db #0x00	; 0
   4A2C 00                  755 	.db #0x00	; 0
   4A2D 01                  756 	.db #0x01	; 1
   4A2E 00                  757 	.db #0x00	; 0
   4A2F 00                  758 	.db #0x00	; 0
   4A30 00                  759 	.db #0x00	; 0
   4A31 00                  760 	.db #0x00	; 0
   4A32 00                  761 	.db #0x00	; 0
   4A33 00                  762 	.db #0x00	; 0
   4A34 00                  763 	.db #0x00	; 0
   4A35 01                  764 	.db #0x01	; 1
   4A36 01                  765 	.db #0x01	; 1
   4A37 00                  766 	.db #0x00	; 0
   4A38 01                  767 	.db #0x01	; 1
   4A39 01                  768 	.db #0x01	; 1
   4A3A 00                  769 	.db #0x00	; 0
   4A3B 01                  770 	.db #0x01	; 1
   4A3C 01                  771 	.db #0x01	; 1
   4A3D 01                  772 	.db #0x01	; 1
   4A3E 02                  773 	.db #0x02	; 2
   4A3F 02                  774 	.db #0x02	; 2
   4A40 02                  775 	.db #0x02	; 2
   4A41 01                  776 	.db #0x01	; 1
   4A42 00                  777 	.db #0x00	; 0
   4A43 00                  778 	.db #0x00	; 0
   4A44 00                  779 	.db #0x00	; 0
   4A45 05                  780 	.db #0x05	; 5
   4A46 00                  781 	.db #0x00	; 0
   4A47 00                  782 	.db #0x00	; 0
   4A48 00                  783 	.db #0x00	; 0
   4A49 01                  784 	.db #0x01	; 1
   4A4A 01                  785 	.db #0x01	; 1
   4A4B 00                  786 	.db #0x00	; 0
   4A4C 01                  787 	.db #0x01	; 1
   4A4D 02                  788 	.db #0x02	; 2
   4A4E 02                  789 	.db #0x02	; 2
   4A4F 02                  790 	.db #0x02	; 2
   4A50 02                  791 	.db #0x02	; 2
   4A51 01                  792 	.db #0x01	; 1
   4A52 00                  793 	.db #0x00	; 0
   4A53 00                  794 	.db #0x00	; 0
   4A54 00                  795 	.db #0x00	; 0
   4A55 01                  796 	.db #0x01	; 1
   4A56 00                  797 	.db #0x00	; 0
   4A57 00                  798 	.db #0x00	; 0
   4A58 00                  799 	.db #0x00	; 0
   4A59 05                  800 	.db #0x05	; 5
   4A5A 00                  801 	.db #0x00	; 0
   4A5B 00                  802 	.db #0x00	; 0
   4A5C 00                  803 	.db #0x00	; 0
   4A5D 01                  804 	.db #0x01	; 1
   4A5E 01                  805 	.db #0x01	; 1
   4A5F 00                  806 	.db #0x00	; 0
   4A60 01                  807 	.db #0x01	; 1
   4A61 02                  808 	.db #0x02	; 2
   4A62 02                  809 	.db #0x02	; 2
   4A63 02                  810 	.db #0x02	; 2
   4A64 02                  811 	.db #0x02	; 2
   4A65 01                  812 	.db #0x01	; 1
   4A66 02                  813 	.db #0x02	; 2
   4A67 02                  814 	.db #0x02	; 2
   4A68 02                  815 	.db #0x02	; 2
   4A69 01                  816 	.db #0x01	; 1
   4A6A 00                  817 	.db #0x00	; 0
   4A6B 00                  818 	.db #0x00	; 0
   4A6C 00                  819 	.db #0x00	; 0
   4A6D 05                  820 	.db #0x05	; 5
   4A6E 00                  821 	.db #0x00	; 0
   4A6F 00                  822 	.db #0x00	; 0
   4A70 00                  823 	.db #0x00	; 0
   4A71 01                  824 	.db #0x01	; 1
   4A72 01                  825 	.db #0x01	; 1
   4A73 00                  826 	.db #0x00	; 0
   4A74 01                  827 	.db #0x01	; 1
   4A75 02                  828 	.db #0x02	; 2
   4A76 02                  829 	.db #0x02	; 2
   4A77 02                  830 	.db #0x02	; 2
   4A78 02                  831 	.db #0x02	; 2
   4A79 01                  832 	.db #0x01	; 1
   4A7A 00                  833 	.db #0x00	; 0
   4A7B 00                  834 	.db #0x00	; 0
   4A7C 00                  835 	.db #0x00	; 0
   4A7D 01                  836 	.db #0x01	; 1
   4A7E 00                  837 	.db #0x00	; 0
   4A7F 00                  838 	.db #0x00	; 0
   4A80 00                  839 	.db #0x00	; 0
   4A81 00                  840 	.db #0x00	; 0
   4A82 00                  841 	.db #0x00	; 0
   4A83 00                  842 	.db #0x00	; 0
   4A84 00                  843 	.db #0x00	; 0
   4A85 01                  844 	.db #0x01	; 1
   4A86 01                  845 	.db #0x01	; 1
   4A87 00                  846 	.db #0x00	; 0
   4A88 01                  847 	.db #0x01	; 1
   4A89 02                  848 	.db #0x02	; 2
   4A8A 02                  849 	.db #0x02	; 2
   4A8B 02                  850 	.db #0x02	; 2
   4A8C 02                  851 	.db #0x02	; 2
   4A8D 01                  852 	.db #0x01	; 1
   4A8E 02                  853 	.db #0x02	; 2
   4A8F 02                  854 	.db #0x02	; 2
   4A90 02                  855 	.db #0x02	; 2
   4A91 01                  856 	.db #0x01	; 1
   4A92 00                  857 	.db #0x00	; 0
   4A93 00                  858 	.db #0x00	; 0
   4A94 00                  859 	.db #0x00	; 0
   4A95 00                  860 	.db #0x00	; 0
   4A96 00                  861 	.db #0x00	; 0
   4A97 00                  862 	.db #0x00	; 0
   4A98 00                  863 	.db #0x00	; 0
   4A99 01                  864 	.db #0x01	; 1
   4A9A 01                  865 	.db #0x01	; 1
   4A9B 05                  866 	.db #0x05	; 5
   4A9C 01                  867 	.db #0x01	; 1
   4A9D 02                  868 	.db #0x02	; 2
   4A9E 02                  869 	.db #0x02	; 2
   4A9F 02                  870 	.db #0x02	; 2
   4AA0 02                  871 	.db #0x02	; 2
   4AA1 01                  872 	.db #0x01	; 1
   4AA2 00                  873 	.db #0x00	; 0
   4AA3 00                  874 	.db #0x00	; 0
   4AA4 00                  875 	.db #0x00	; 0
   4AA5 00                  876 	.db #0x00	; 0
   4AA6 00                  877 	.db #0x00	; 0
   4AA7 00                  878 	.db #0x00	; 0
   4AA8 00                  879 	.db #0x00	; 0
   4AA9 00                  880 	.db #0x00	; 0
   4AAA 00                  881 	.db #0x00	; 0
   4AAB 00                  882 	.db #0x00	; 0
   4AAC 00                  883 	.db #0x00	; 0
   4AAD 01                  884 	.db #0x01	; 1
   4AAE 01                  885 	.db #0x01	; 1
   4AAF 01                  886 	.db #0x01	; 1
   4AB0 01                  887 	.db #0x01	; 1
   4AB1 01                  888 	.db #0x01	; 1
   4AB2 01                  889 	.db #0x01	; 1
   4AB3 01                  890 	.db #0x01	; 1
   4AB4 01                  891 	.db #0x01	; 1
   4AB5 01                  892 	.db #0x01	; 1
   4AB6 01                  893 	.db #0x01	; 1
   4AB7 01                  894 	.db #0x01	; 1
   4AB8 01                  895 	.db #0x01	; 1
   4AB9 01                  896 	.db #0x01	; 1
   4ABA 01                  897 	.db #0x01	; 1
   4ABB 01                  898 	.db #0x01	; 1
   4ABC 01                  899 	.db #0x01	; 1
   4ABD 00                  900 	.db #0x00	; 0
   4ABE 01                  901 	.db #0x01	; 1
   4ABF 01                  902 	.db #0x01	; 1
   4AC0 01                  903 	.db #0x01	; 1
   4AC1 01                  904 	.db #0x01	; 1
                            905 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            906 ;	---------------------------------
                            907 ; Function drawVida
                            908 ; ---------------------------------
   4AC2                     909 _drawVida::
   4AC2 DD E5         [15]  910 	push	ix
   4AC4 DD 21 00 00   [14]  911 	ld	ix,#0
   4AC8 DD 39         [15]  912 	add	ix,sp
                            913 ;src/draws.h:51: u8 p = pos;
   4ACA DD 56 05      [19]  914 	ld	d,5 (ix)
                            915 ;src/draws.h:53: for(i=1;i<=3;i++){
   4ACD 1E 01         [ 7]  916 	ld	e,#0x01
   4ACF                     917 00105$:
                            918 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4ACF D5            [11]  919 	push	de
   4AD0 3E C0         [ 7]  920 	ld	a,#0xC0
   4AD2 F5            [11]  921 	push	af
   4AD3 33            [ 6]  922 	inc	sp
   4AD4 D5            [11]  923 	push	de
   4AD5 33            [ 6]  924 	inc	sp
   4AD6 21 00 C0      [10]  925 	ld	hl,#0xC000
   4AD9 E5            [11]  926 	push	hl
   4ADA CD E6 69      [17]  927 	call	_cpct_getScreenPtr
   4ADD D1            [10]  928 	pop	de
                            929 ;src/draws.h:55: p+=5;
   4ADE 7A            [ 4]  930 	ld	a,d
   4ADF C6 05         [ 7]  931 	add	a, #0x05
   4AE1 57            [ 4]  932 	ld	d,a
                            933 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4AE2 4D            [ 4]  934 	ld	c, l
   4AE3 44            [ 4]  935 	ld	b, h
   4AE4 DD 7E 04      [19]  936 	ld	a,4 (ix)
   4AE7 93            [ 4]  937 	sub	a, e
   4AE8 38 10         [12]  938 	jr	C,00102$
   4AEA D5            [11]  939 	push	de
   4AEB 21 04 08      [10]  940 	ld	hl,#0x0804
   4AEE E5            [11]  941 	push	hl
   4AEF C5            [11]  942 	push	bc
   4AF0 21 00 46      [10]  943 	ld	hl,#_corazon_lleno
   4AF3 E5            [11]  944 	push	hl
   4AF4 CD 8F 68      [17]  945 	call	_cpct_drawSpriteMasked
   4AF7 D1            [10]  946 	pop	de
   4AF8 18 20         [12]  947 	jr	00106$
   4AFA                     948 00102$:
                            949 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4AFA C5            [11]  950 	push	bc
   4AFB D5            [11]  951 	push	de
   4AFC 21 04 08      [10]  952 	ld	hl,#0x0804
   4AFF E5            [11]  953 	push	hl
   4B00 AF            [ 4]  954 	xor	a, a
   4B01 F5            [11]  955 	push	af
   4B02 33            [ 6]  956 	inc	sp
   4B03 C5            [11]  957 	push	bc
   4B04 CD 15 69      [17]  958 	call	_cpct_drawSolidBox
   4B07 F1            [10]  959 	pop	af
   4B08 F1            [10]  960 	pop	af
   4B09 33            [ 6]  961 	inc	sp
   4B0A D1            [10]  962 	pop	de
   4B0B C1            [10]  963 	pop	bc
                            964 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B0C D5            [11]  965 	push	de
   4B0D 21 04 08      [10]  966 	ld	hl,#0x0804
   4B10 E5            [11]  967 	push	hl
   4B11 C5            [11]  968 	push	bc
   4B12 21 40 46      [10]  969 	ld	hl,#_corazon_roto
   4B15 E5            [11]  970 	push	hl
   4B16 CD 8F 68      [17]  971 	call	_cpct_drawSpriteMasked
   4B19 D1            [10]  972 	pop	de
   4B1A                     973 00106$:
                            974 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B1A 1C            [ 4]  975 	inc	e
   4B1B 3E 03         [ 7]  976 	ld	a,#0x03
   4B1D 93            [ 4]  977 	sub	a, e
   4B1E 30 AF         [12]  978 	jr	NC,00105$
   4B20 DD E1         [14]  979 	pop	ix
   4B22 C9            [10]  980 	ret
                            981 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                            982 ;	---------------------------------
                            983 ; Function drawBullets
                            984 ; ---------------------------------
   4B23                     985 _drawBullets::
   4B23 DD E5         [15]  986 	push	ix
   4B25 DD 21 00 00   [14]  987 	ld	ix,#0
   4B29 DD 39         [15]  988 	add	ix,sp
   4B2B 3B            [ 6]  989 	dec	sp
                            990 ;src/draws.h:67: int p = pos;
   4B2C DD 4E 05      [19]  991 	ld	c,5 (ix)
   4B2F 06 00         [ 7]  992 	ld	b,#0x00
                            993 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B31 DD 36 FF 01   [19]  994 	ld	-1 (ix),#0x01
   4B35                     995 00105$:
                            996 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B35 51            [ 4]  997 	ld	d,c
   4B36 C5            [11]  998 	push	bc
   4B37 3E C0         [ 7]  999 	ld	a,#0xC0
   4B39 F5            [11] 1000 	push	af
   4B3A 33            [ 6] 1001 	inc	sp
   4B3B D5            [11] 1002 	push	de
   4B3C 33            [ 6] 1003 	inc	sp
   4B3D 21 00 C0      [10] 1004 	ld	hl,#0xC000
   4B40 E5            [11] 1005 	push	hl
   4B41 CD E6 69      [17] 1006 	call	_cpct_getScreenPtr
   4B44 C1            [10] 1007 	pop	bc
                           1008 ;src/draws.h:71: p+=3;
   4B45 03            [ 6] 1009 	inc	bc
   4B46 03            [ 6] 1010 	inc	bc
   4B47 03            [ 6] 1011 	inc	bc
                           1012 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B48 EB            [ 4] 1013 	ex	de,hl
   4B49 DD 7E 04      [19] 1014 	ld	a,4 (ix)
   4B4C DD 96 FF      [19] 1015 	sub	a, -1 (ix)
   4B4F 38 10         [12] 1016 	jr	C,00102$
   4B51 C5            [11] 1017 	push	bc
   4B52 21 02 08      [10] 1018 	ld	hl,#0x0802
   4B55 E5            [11] 1019 	push	hl
   4B56 D5            [11] 1020 	push	de
   4B57 21 19 66      [10] 1021 	ld	hl,#_flecha_arriba
   4B5A E5            [11] 1022 	push	hl
   4B5B CD 8F 68      [17] 1023 	call	_cpct_drawSpriteMasked
   4B5E C1            [10] 1024 	pop	bc
   4B5F 18 10         [12] 1025 	jr	00106$
   4B61                    1026 00102$:
                           1027 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B61 C5            [11] 1028 	push	bc
   4B62 21 02 08      [10] 1029 	ld	hl,#0x0802
   4B65 E5            [11] 1030 	push	hl
   4B66 AF            [ 4] 1031 	xor	a, a
   4B67 F5            [11] 1032 	push	af
   4B68 33            [ 6] 1033 	inc	sp
   4B69 D5            [11] 1034 	push	de
   4B6A CD 15 69      [17] 1035 	call	_cpct_drawSolidBox
   4B6D F1            [10] 1036 	pop	af
   4B6E F1            [10] 1037 	pop	af
   4B6F 33            [ 6] 1038 	inc	sp
   4B70 C1            [10] 1039 	pop	bc
   4B71                    1040 00106$:
                           1041 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B71 DD 34 FF      [23] 1042 	inc	-1 (ix)
   4B74 3E 03         [ 7] 1043 	ld	a,#0x03
   4B76 DD 96 FF      [19] 1044 	sub	a, -1 (ix)
   4B79 30 BA         [12] 1045 	jr	NC,00105$
   4B7B 33            [ 6] 1046 	inc	sp
   4B7C DD E1         [14] 1047 	pop	ix
   4B7E C9            [10] 1048 	ret
                           1049 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1050 ;	---------------------------------
                           1051 ; Function draw
                           1052 ; ---------------------------------
   4B7F                    1053 _draw::
                           1054 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4B7F 21 03 00      [10] 1055 	ld	hl, #3+0
   4B82 39            [11] 1056 	add	hl, sp
   4B83 7E            [ 7] 1057 	ld	a, (hl)
   4B84 F5            [11] 1058 	push	af
   4B85 33            [ 6] 1059 	inc	sp
   4B86 21 03 00      [10] 1060 	ld	hl, #3+0
   4B89 39            [11] 1061 	add	hl, sp
   4B8A 7E            [ 7] 1062 	ld	a, (hl)
   4B8B F5            [11] 1063 	push	af
   4B8C 33            [ 6] 1064 	inc	sp
   4B8D 21 00 C0      [10] 1065 	ld	hl,#0xC000
   4B90 E5            [11] 1066 	push	hl
   4B91 CD E6 69      [17] 1067 	call	_cpct_getScreenPtr
   4B94 EB            [ 4] 1068 	ex	de,hl
                           1069 ;src/draws.h:84: switch(mode){
   4B95 3E 02         [ 7] 1070 	ld	a,#0x02
   4B97 FD 21 06 00   [14] 1071 	ld	iy,#6
   4B9B FD 39         [15] 1072 	add	iy,sp
   4B9D FD 96 00      [19] 1073 	sub	a, 0 (iy)
   4BA0 D8            [11] 1074 	ret	C
                           1075 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BA1 21 04 00      [10] 1076 	ld	hl, #4
   4BA4 39            [11] 1077 	add	hl, sp
   4BA5 4E            [ 7] 1078 	ld	c, (hl)
   4BA6 23            [ 6] 1079 	inc	hl
   4BA7 46            [ 7] 1080 	ld	b, (hl)
                           1081 ;src/draws.h:84: switch(mode){
   4BA8 D5            [11] 1082 	push	de
   4BA9 FD 21 08 00   [14] 1083 	ld	iy,#8
   4BAD FD 39         [15] 1084 	add	iy,sp
   4BAF FD 5E 00      [19] 1085 	ld	e,0 (iy)
   4BB2 16 00         [ 7] 1086 	ld	d,#0x00
   4BB4 21 BB 4B      [10] 1087 	ld	hl,#00111$
   4BB7 19            [11] 1088 	add	hl,de
   4BB8 19            [11] 1089 	add	hl,de
                           1090 ;src/draws.h:85: case 0:
   4BB9 D1            [10] 1091 	pop	de
   4BBA E9            [ 4] 1092 	jp	(hl)
   4BBB                    1093 00111$:
   4BBB 18 04         [12] 1094 	jr	00101$
   4BBD 18 0C         [12] 1095 	jr	00102$
   4BBF 18 14         [12] 1096 	jr	00103$
   4BC1                    1097 00101$:
                           1098 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BC1 21 04 10      [10] 1099 	ld	hl,#0x1004
   4BC4 E5            [11] 1100 	push	hl
   4BC5 D5            [11] 1101 	push	de
   4BC6 C5            [11] 1102 	push	bc
   4BC7 CD 8F 68      [17] 1103 	call	_cpct_drawSpriteMasked
                           1104 ;src/draws.h:87: break;
   4BCA C9            [10] 1105 	ret
                           1106 ;src/draws.h:88: case 1:
   4BCB                    1107 00102$:
                           1108 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4BCB 21 02 08      [10] 1109 	ld	hl,#0x0802
   4BCE E5            [11] 1110 	push	hl
   4BCF D5            [11] 1111 	push	de
   4BD0 C5            [11] 1112 	push	bc
   4BD1 CD 8F 68      [17] 1113 	call	_cpct_drawSpriteMasked
                           1114 ;src/draws.h:90: break;
   4BD4 C9            [10] 1115 	ret
                           1116 ;src/draws.h:91: case 2:
   4BD5                    1117 00103$:
                           1118 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4BD5 21 04 04      [10] 1119 	ld	hl,#0x0404
   4BD8 E5            [11] 1120 	push	hl
   4BD9 D5            [11] 1121 	push	de
   4BDA C5            [11] 1122 	push	bc
   4BDB CD 8F 68      [17] 1123 	call	_cpct_drawSpriteMasked
                           1124 ;src/draws.h:94: }
   4BDE C9            [10] 1125 	ret
                           1126 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1127 ;	---------------------------------
                           1128 ; Function erase
                           1129 ; ---------------------------------
   4BDF                    1130 _erase::
                           1131 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BDF 21 03 00      [10] 1132 	ld	hl, #3+0
   4BE2 39            [11] 1133 	add	hl, sp
   4BE3 7E            [ 7] 1134 	ld	a, (hl)
   4BE4 F5            [11] 1135 	push	af
   4BE5 33            [ 6] 1136 	inc	sp
   4BE6 21 03 00      [10] 1137 	ld	hl, #3+0
   4BE9 39            [11] 1138 	add	hl, sp
   4BEA 7E            [ 7] 1139 	ld	a, (hl)
   4BEB F5            [11] 1140 	push	af
   4BEC 33            [ 6] 1141 	inc	sp
   4BED 21 00 C0      [10] 1142 	ld	hl,#0xC000
   4BF0 E5            [11] 1143 	push	hl
   4BF1 CD E6 69      [17] 1144 	call	_cpct_getScreenPtr
   4BF4 4D            [ 4] 1145 	ld	c, l
   4BF5 44            [ 4] 1146 	ld	b, h
                           1147 ;src/draws.h:102: switch(mode){
   4BF6 3E 02         [ 7] 1148 	ld	a,#0x02
   4BF8 FD 21 04 00   [14] 1149 	ld	iy,#4
   4BFC FD 39         [15] 1150 	add	iy,sp
   4BFE FD 96 00      [19] 1151 	sub	a, 0 (iy)
   4C01 D8            [11] 1152 	ret	C
                           1153 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1154 ;src/draws.h:102: switch(mode){
   4C02 FD 5E 00      [19] 1155 	ld	e,0 (iy)
   4C05 16 00         [ 7] 1156 	ld	d,#0x00
   4C07 21 0D 4C      [10] 1157 	ld	hl,#00111$
   4C0A 19            [11] 1158 	add	hl,de
   4C0B 19            [11] 1159 	add	hl,de
                           1160 ;src/draws.h:103: case 0:
   4C0C E9            [ 4] 1161 	jp	(hl)
   4C0D                    1162 00111$:
   4C0D 18 04         [12] 1163 	jr	00101$
   4C0F 18 11         [12] 1164 	jr	00102$
   4C11 18 1E         [12] 1165 	jr	00103$
   4C13                    1166 00101$:
                           1167 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C13 21 04 10      [10] 1168 	ld	hl,#0x1004
   4C16 E5            [11] 1169 	push	hl
   4C17 AF            [ 4] 1170 	xor	a, a
   4C18 F5            [11] 1171 	push	af
   4C19 33            [ 6] 1172 	inc	sp
   4C1A C5            [11] 1173 	push	bc
   4C1B CD 15 69      [17] 1174 	call	_cpct_drawSolidBox
   4C1E F1            [10] 1175 	pop	af
   4C1F F1            [10] 1176 	pop	af
   4C20 33            [ 6] 1177 	inc	sp
                           1178 ;src/draws.h:105: break;
   4C21 C9            [10] 1179 	ret
                           1180 ;src/draws.h:106: case 1:
   4C22                    1181 00102$:
                           1182 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C22 21 02 08      [10] 1183 	ld	hl,#0x0802
   4C25 E5            [11] 1184 	push	hl
   4C26 AF            [ 4] 1185 	xor	a, a
   4C27 F5            [11] 1186 	push	af
   4C28 33            [ 6] 1187 	inc	sp
   4C29 C5            [11] 1188 	push	bc
   4C2A CD 15 69      [17] 1189 	call	_cpct_drawSolidBox
   4C2D F1            [10] 1190 	pop	af
   4C2E F1            [10] 1191 	pop	af
   4C2F 33            [ 6] 1192 	inc	sp
                           1193 ;src/draws.h:108: break;
   4C30 C9            [10] 1194 	ret
                           1195 ;src/draws.h:109: case 2:
   4C31                    1196 00103$:
                           1197 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C31 21 04 04      [10] 1198 	ld	hl,#0x0404
   4C34 E5            [11] 1199 	push	hl
   4C35 AF            [ 4] 1200 	xor	a, a
   4C36 F5            [11] 1201 	push	af
   4C37 33            [ 6] 1202 	inc	sp
   4C38 C5            [11] 1203 	push	bc
   4C39 CD 15 69      [17] 1204 	call	_cpct_drawSolidBox
   4C3C F1            [10] 1205 	pop	af
   4C3D F1            [10] 1206 	pop	af
   4C3E 33            [ 6] 1207 	inc	sp
                           1208 ;src/draws.h:112: }
   4C3F C9            [10] 1209 	ret
                           1210 ;src/draws.h:115: void drawStats(){
                           1211 ;	---------------------------------
                           1212 ; Function drawStats
                           1213 ; ---------------------------------
   4C40                    1214 _drawStats::
                           1215 ;src/draws.h:116: drawVida(player.life,1);
   4C40 21 E5 6B      [10] 1216 	ld	hl, #_player + 6
   4C43 56            [ 7] 1217 	ld	d,(hl)
   4C44 3E 01         [ 7] 1218 	ld	a,#0x01
   4C46 F5            [11] 1219 	push	af
   4C47 33            [ 6] 1220 	inc	sp
   4C48 D5            [11] 1221 	push	de
   4C49 33            [ 6] 1222 	inc	sp
   4C4A CD C2 4A      [17] 1223 	call	_drawVida
   4C4D F1            [10] 1224 	pop	af
                           1225 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C4E 21 E9 6B      [10] 1226 	ld	hl, #_player + 10
   4C51 56            [ 7] 1227 	ld	d,(hl)
   4C52 3E 10         [ 7] 1228 	ld	a,#0x10
   4C54 F5            [11] 1229 	push	af
   4C55 33            [ 6] 1230 	inc	sp
   4C56 D5            [11] 1231 	push	de
   4C57 33            [ 6] 1232 	inc	sp
   4C58 CD 23 4B      [17] 1233 	call	_drawBullets
   4C5B F1            [10] 1234 	pop	af
                           1235 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C5C 21 F4 6B      [10] 1236 	ld	hl, #_enemy + 10
   4C5F 56            [ 7] 1237 	ld	d,(hl)
   4C60 3E 38         [ 7] 1238 	ld	a,#0x38
   4C62 F5            [11] 1239 	push	af
   4C63 33            [ 6] 1240 	inc	sp
   4C64 D5            [11] 1241 	push	de
   4C65 33            [ 6] 1242 	inc	sp
   4C66 CD 23 4B      [17] 1243 	call	_drawBullets
   4C69 F1            [10] 1244 	pop	af
                           1245 ;src/draws.h:119: drawVida(enemy.life,65);
   4C6A 21 F2 6B      [10] 1246 	ld	hl, #_enemy + 8
   4C6D 56            [ 7] 1247 	ld	d,(hl)
   4C6E 3E 41         [ 7] 1248 	ld	a,#0x41
   4C70 F5            [11] 1249 	push	af
   4C71 33            [ 6] 1250 	inc	sp
   4C72 D5            [11] 1251 	push	de
   4C73 33            [ 6] 1252 	inc	sp
   4C74 CD C2 4A      [17] 1253 	call	_drawVida
   4C77 F1            [10] 1254 	pop	af
   4C78 C9            [10] 1255 	ret
                           1256 ;src/draws.h:124: void draws(){
                           1257 ;	---------------------------------
                           1258 ; Function draws
                           1259 ; ---------------------------------
   4C79                    1260 _draws::
   4C79 DD E5         [15] 1261 	push	ix
   4C7B DD 21 00 00   [14] 1262 	ld	ix,#0
   4C7F DD 39         [15] 1263 	add	ix,sp
   4C81 3B            [ 6] 1264 	dec	sp
                           1265 ;src/draws.h:126: draw(player.x,player.y,player.sprite,0);
   4C82 ED 5B E3 6B   [20] 1266 	ld	de, (#_player + 4)
   4C86 21 E0 6B      [10] 1267 	ld	hl, #_player + 1
   4C89 46            [ 7] 1268 	ld	b,(hl)
   4C8A 21 DF 6B      [10] 1269 	ld	hl, #_player + 0
   4C8D 4E            [ 7] 1270 	ld	c,(hl)
   4C8E AF            [ 4] 1271 	xor	a, a
   4C8F F5            [11] 1272 	push	af
   4C90 33            [ 6] 1273 	inc	sp
   4C91 D5            [11] 1274 	push	de
   4C92 C5            [11] 1275 	push	bc
   4C93 CD 7F 4B      [17] 1276 	call	_draw
   4C96 F1            [10] 1277 	pop	af
   4C97 F1            [10] 1278 	pop	af
   4C98 33            [ 6] 1279 	inc	sp
                           1280 ;src/draws.h:127: draw(enemy.x,enemy.y,enemy.sprite,0);
   4C99 ED 5B F0 6B   [20] 1281 	ld	de, (#_enemy + 6)
   4C9D 21 EB 6B      [10] 1282 	ld	hl, #_enemy + 1
   4CA0 46            [ 7] 1283 	ld	b,(hl)
   4CA1 21 EA 6B      [10] 1284 	ld	hl, #_enemy + 0
   4CA4 4E            [ 7] 1285 	ld	c,(hl)
   4CA5 AF            [ 4] 1286 	xor	a, a
   4CA6 F5            [11] 1287 	push	af
   4CA7 33            [ 6] 1288 	inc	sp
   4CA8 D5            [11] 1289 	push	de
   4CA9 C5            [11] 1290 	push	bc
   4CAA CD 7F 4B      [17] 1291 	call	_draw
   4CAD F1            [10] 1292 	pop	af
   4CAE F1            [10] 1293 	pop	af
   4CAF 33            [ 6] 1294 	inc	sp
                           1295 ;src/draws.h:128: if(arrow == 1){
   4CB0 3A D1 6B      [13] 1296 	ld	a,(#_arrow + 0)
   4CB3 3D            [ 4] 1297 	dec	a
   4CB4 20 5C         [12] 1298 	jr	NZ,00111$
                           1299 ;src/draws.h:129: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CB6 21 DC 6B      [10] 1300 	ld	hl, #_object + 7
   4CB9 5E            [ 7] 1301 	ld	e,(hl)
                           1302 ;src/draws.h:130: draw(object.x,object.y,object.sprite,2);
   4CBA 01 D6 6B      [10] 1303 	ld	bc,#_object + 1
                           1304 ;src/draws.h:129: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CBD 7B            [ 4] 1305 	ld	a,e
   4CBE D6 04         [ 7] 1306 	sub	a, #0x04
   4CC0 28 0C         [12] 1307 	jr	Z,00105$
   4CC2 21 DB 6B      [10] 1308 	ld	hl,#_object + 6
   4CC5 7B            [ 4] 1309 	ld	a,e
   4CC6 D6 06         [ 7] 1310 	sub	a, #0x06
   4CC8 20 25         [12] 1311 	jr	NZ,00106$
   4CCA 7E            [ 7] 1312 	ld	a,(hl)
   4CCB 3D            [ 4] 1313 	dec	a
   4CCC 20 21         [12] 1314 	jr	NZ,00106$
   4CCE                    1315 00105$:
                           1316 ;src/draws.h:130: draw(object.x,object.y,object.sprite,2);
   4CCE ED 5B D9 6B   [20] 1317 	ld	de, (#(_object + 0x0004) + 0)
   4CD2 0A            [ 7] 1318 	ld	a,(bc)
   4CD3 DD 77 FF      [19] 1319 	ld	-1 (ix),a
   4CD6 21 D5 6B      [10] 1320 	ld	hl, #_object + 0
   4CD9 4E            [ 7] 1321 	ld	c,(hl)
   4CDA 3E 02         [ 7] 1322 	ld	a,#0x02
   4CDC F5            [11] 1323 	push	af
   4CDD 33            [ 6] 1324 	inc	sp
   4CDE D5            [11] 1325 	push	de
   4CDF DD 7E FF      [19] 1326 	ld	a,-1 (ix)
   4CE2 F5            [11] 1327 	push	af
   4CE3 33            [ 6] 1328 	inc	sp
   4CE4 79            [ 4] 1329 	ld	a,c
   4CE5 F5            [11] 1330 	push	af
   4CE6 33            [ 6] 1331 	inc	sp
   4CE7 CD 7F 4B      [17] 1332 	call	_draw
   4CEA F1            [10] 1333 	pop	af
   4CEB F1            [10] 1334 	pop	af
   4CEC 33            [ 6] 1335 	inc	sp
   4CED 18 23         [12] 1336 	jr	00111$
   4CEF                    1337 00106$:
                           1338 ;src/draws.h:131: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4CEF 7B            [ 4] 1339 	ld	a,e
   4CF0 FE 02         [ 7] 1340 	cp	a,#0x02
   4CF2 28 08         [12] 1341 	jr	Z,00101$
   4CF4 D6 08         [ 7] 1342 	sub	a, #0x08
   4CF6 20 1A         [12] 1343 	jr	NZ,00111$
   4CF8 7E            [ 7] 1344 	ld	a,(hl)
   4CF9 3D            [ 4] 1345 	dec	a
   4CFA 20 16         [12] 1346 	jr	NZ,00111$
   4CFC                    1347 00101$:
                           1348 ;src/draws.h:132: draw(object.x,object.y,object.sprite,1);
   4CFC ED 5B D9 6B   [20] 1349 	ld	de, (#(_object + 0x0004) + 0)
   4D00 0A            [ 7] 1350 	ld	a,(bc)
   4D01 47            [ 4] 1351 	ld	b,a
   4D02 21 D5 6B      [10] 1352 	ld	hl, #_object + 0
   4D05 4E            [ 7] 1353 	ld	c,(hl)
   4D06 3E 01         [ 7] 1354 	ld	a,#0x01
   4D08 F5            [11] 1355 	push	af
   4D09 33            [ 6] 1356 	inc	sp
   4D0A D5            [11] 1357 	push	de
   4D0B C5            [11] 1358 	push	bc
   4D0C CD 7F 4B      [17] 1359 	call	_draw
   4D0F F1            [10] 1360 	pop	af
   4D10 F1            [10] 1361 	pop	af
   4D11 33            [ 6] 1362 	inc	sp
   4D12                    1363 00111$:
                           1364 ;src/draws.h:134: drawStats();
   4D12 CD 40 4C      [17] 1365 	call	_drawStats
   4D15 33            [ 6] 1366 	inc	sp
   4D16 DD E1         [14] 1367 	pop	ix
   4D18 C9            [10] 1368 	ret
                           1369 ;src/draws.h:137: void erases(){
                           1370 ;	---------------------------------
                           1371 ; Function erases
                           1372 ; ---------------------------------
   4D19                    1373 _erases::
                           1374 ;src/draws.h:139: erase(player.lx,player.ly,0);
   4D19 21 E2 6B      [10] 1375 	ld	hl, #_player + 3
   4D1C 46            [ 7] 1376 	ld	b,(hl)
   4D1D 21 E1 6B      [10] 1377 	ld	hl, #_player + 2
   4D20 56            [ 7] 1378 	ld	d,(hl)
   4D21 AF            [ 4] 1379 	xor	a, a
   4D22 F5            [11] 1380 	push	af
   4D23 33            [ 6] 1381 	inc	sp
   4D24 4A            [ 4] 1382 	ld	c, d
   4D25 C5            [11] 1383 	push	bc
   4D26 CD DF 4B      [17] 1384 	call	_erase
   4D29 F1            [10] 1385 	pop	af
   4D2A 33            [ 6] 1386 	inc	sp
                           1387 ;src/draws.h:140: erase(enemy.lx,enemy.ly,0);
   4D2B 21 ED 6B      [10] 1388 	ld	hl, #_enemy + 3
   4D2E 46            [ 7] 1389 	ld	b,(hl)
   4D2F 21 EC 6B      [10] 1390 	ld	hl, #_enemy + 2
   4D32 56            [ 7] 1391 	ld	d,(hl)
   4D33 AF            [ 4] 1392 	xor	a, a
   4D34 F5            [11] 1393 	push	af
   4D35 33            [ 6] 1394 	inc	sp
   4D36 4A            [ 4] 1395 	ld	c, d
   4D37 C5            [11] 1396 	push	bc
   4D38 CD DF 4B      [17] 1397 	call	_erase
   4D3B F1            [10] 1398 	pop	af
   4D3C 33            [ 6] 1399 	inc	sp
                           1400 ;src/draws.h:141: if(arrow == 1){
   4D3D 3A D1 6B      [13] 1401 	ld	a,(#_arrow + 0)
   4D40 3D            [ 4] 1402 	dec	a
   4D41 C0            [11] 1403 	ret	NZ
                           1404 ;src/draws.h:142: if(object.dir == 4 || object.dir == 6)
   4D42 21 DC 6B      [10] 1405 	ld	hl, #_object + 7
   4D45 4E            [ 7] 1406 	ld	c,(hl)
                           1407 ;src/draws.h:143: erase(object.lx,object.ly,2);
   4D46 21 D8 6B      [10] 1408 	ld	hl, #_object + 3
   4D49 56            [ 7] 1409 	ld	d,(hl)
   4D4A 21 D7 6B      [10] 1410 	ld	hl, #_object + 2
   4D4D 46            [ 7] 1411 	ld	b,(hl)
                           1412 ;src/draws.h:142: if(object.dir == 4 || object.dir == 6)
   4D4E 79            [ 4] 1413 	ld	a,c
   4D4F FE 04         [ 7] 1414 	cp	a,#0x04
   4D51 28 04         [12] 1415 	jr	Z,00101$
   4D53 D6 06         [ 7] 1416 	sub	a, #0x06
   4D55 20 0F         [12] 1417 	jr	NZ,00102$
   4D57                    1418 00101$:
                           1419 ;src/draws.h:143: erase(object.lx,object.ly,2);
   4D57 3E 02         [ 7] 1420 	ld	a,#0x02
   4D59 F5            [11] 1421 	push	af
   4D5A 33            [ 6] 1422 	inc	sp
   4D5B D5            [11] 1423 	push	de
   4D5C 33            [ 6] 1424 	inc	sp
   4D5D C5            [11] 1425 	push	bc
   4D5E 33            [ 6] 1426 	inc	sp
   4D5F CD DF 4B      [17] 1427 	call	_erase
   4D62 F1            [10] 1428 	pop	af
   4D63 33            [ 6] 1429 	inc	sp
   4D64 18 0D         [12] 1430 	jr	00103$
   4D66                    1431 00102$:
                           1432 ;src/draws.h:145: erase(object.lx,object.ly,1);
   4D66 3E 01         [ 7] 1433 	ld	a,#0x01
   4D68 F5            [11] 1434 	push	af
   4D69 33            [ 6] 1435 	inc	sp
   4D6A D5            [11] 1436 	push	de
   4D6B 33            [ 6] 1437 	inc	sp
   4D6C C5            [11] 1438 	push	bc
   4D6D 33            [ 6] 1439 	inc	sp
   4D6E CD DF 4B      [17] 1440 	call	_erase
   4D71 F1            [10] 1441 	pop	af
   4D72 33            [ 6] 1442 	inc	sp
   4D73                    1443 00103$:
                           1444 ;src/draws.h:146: if(bound == 1) arrow = 0;
   4D73 3A D3 6B      [13] 1445 	ld	a,(#_bound + 0)
   4D76 3D            [ 4] 1446 	dec	a
   4D77 C0            [11] 1447 	ret	NZ
   4D78 21 D1 6B      [10] 1448 	ld	hl,#_arrow + 0
   4D7B 36 00         [10] 1449 	ld	(hl), #0x00
   4D7D C9            [10] 1450 	ret
                           1451 ;src/draws.h:153: void drawFatiga(u8 atk, u8 col){
                           1452 ;	---------------------------------
                           1453 ; Function drawFatiga
                           1454 ; ---------------------------------
   4D7E                    1455 _drawFatiga::
   4D7E DD E5         [15] 1456 	push	ix
   4D80 DD 21 00 00   [14] 1457 	ld	ix,#0
   4D84 DD 39         [15] 1458 	add	ix,sp
   4D86 F5            [11] 1459 	push	af
                           1460 ;src/draws.h:155: if(atk < 20)
   4D87 DD 7E 04      [19] 1461 	ld	a,4 (ix)
   4D8A D6 14         [ 7] 1462 	sub	a, #0x14
   4D8C 30 04         [12] 1463 	jr	NC,00102$
                           1464 ;src/draws.h:156: col = 2;
   4D8E DD 36 05 02   [19] 1465 	ld	5 (ix),#0x02
   4D92                    1466 00102$:
                           1467 ;src/draws.h:157: if(atk > 30 || atk <= 20){
   4D92 3E 14         [ 7] 1468 	ld	a,#0x14
   4D94 DD 96 04      [19] 1469 	sub	a, 4 (ix)
   4D97 3E 00         [ 7] 1470 	ld	a,#0x00
   4D99 17            [ 4] 1471 	rla
   4D9A DD 77 FE      [19] 1472 	ld	-2 (ix),a
                           1473 ;src/draws.h:159: switch(col){
   4D9D 3E 02         [ 7] 1474 	ld	a,#0x02
   4D9F DD 96 05      [19] 1475 	sub	a, 5 (ix)
   4DA2 3E 00         [ 7] 1476 	ld	a,#0x00
   4DA4 17            [ 4] 1477 	rla
   4DA5 DD 77 FF      [19] 1478 	ld	-1 (ix),a
                           1479 ;src/draws.h:157: if(atk > 30 || atk <= 20){
   4DA8 3E 1E         [ 7] 1480 	ld	a,#0x1E
   4DAA DD 96 04      [19] 1481 	sub	a, 4 (ix)
   4DAD 38 06         [12] 1482 	jr	C,00107$
   4DAF DD 7E FE      [19] 1483 	ld	a,-2 (ix)
   4DB2 B7            [ 4] 1484 	or	a, a
   4DB3 20 4F         [12] 1485 	jr	NZ,00108$
   4DB5                    1486 00107$:
                           1487 ;src/draws.h:158: memptr = cpct_getScreenPtr(VMEM,28,192);
   4DB5 21 1C C0      [10] 1488 	ld	hl,#0xC01C
   4DB8 E5            [11] 1489 	push	hl
   4DB9 2E 00         [ 7] 1490 	ld	l, #0x00
   4DBB E5            [11] 1491 	push	hl
   4DBC CD E6 69      [17] 1492 	call	_cpct_getScreenPtr
                           1493 ;src/draws.h:159: switch(col){
   4DBF DD 7E FF      [19] 1494 	ld	a,-1 (ix)
   4DC2 B7            [ 4] 1495 	or	a, a
   4DC3 20 3F         [12] 1496 	jr	NZ,00108$
                           1497 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4DC5 4D            [ 4] 1498 	ld	c, l
   4DC6 44            [ 4] 1499 	ld	b, h
                           1500 ;src/draws.h:159: switch(col){
   4DC7 DD 5E 05      [19] 1501 	ld	e,5 (ix)
   4DCA 16 00         [ 7] 1502 	ld	d,#0x00
   4DCC 21 D2 4D      [10] 1503 	ld	hl,#00156$
   4DCF 19            [11] 1504 	add	hl,de
   4DD0 19            [11] 1505 	add	hl,de
                           1506 ;src/draws.h:160: case 0:
   4DD1 E9            [ 4] 1507 	jp	(hl)
   4DD2                    1508 00156$:
   4DD2 18 04         [12] 1509 	jr	00103$
   4DD4 18 14         [12] 1510 	jr	00104$
   4DD6 18 20         [12] 1511 	jr	00105$
   4DD8                    1512 00103$:
                           1513 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4DD8 21 02 08      [10] 1514 	ld	hl,#0x0802
   4DDB E5            [11] 1515 	push	hl
   4DDC DD 7E 05      [19] 1516 	ld	a,5 (ix)
   4DDF F5            [11] 1517 	push	af
   4DE0 33            [ 6] 1518 	inc	sp
   4DE1 C5            [11] 1519 	push	bc
   4DE2 CD 15 69      [17] 1520 	call	_cpct_drawSolidBox
   4DE5 F1            [10] 1521 	pop	af
   4DE6 F1            [10] 1522 	pop	af
   4DE7 33            [ 6] 1523 	inc	sp
                           1524 ;src/draws.h:162: break;
   4DE8 18 1A         [12] 1525 	jr	00108$
                           1526 ;src/draws.h:163: case 1:
   4DEA                    1527 00104$:
                           1528 ;src/draws.h:164: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4DEA 11 80 46      [10] 1529 	ld	de,#_fatiga_nor
   4DED 21 02 08      [10] 1530 	ld	hl,#0x0802
   4DF0 E5            [11] 1531 	push	hl
   4DF1 C5            [11] 1532 	push	bc
   4DF2 D5            [11] 1533 	push	de
   4DF3 CD 8F 68      [17] 1534 	call	_cpct_drawSpriteMasked
                           1535 ;src/draws.h:165: break;
   4DF6 18 0C         [12] 1536 	jr	00108$
                           1537 ;src/draws.h:166: case 2:
   4DF8                    1538 00105$:
                           1539 ;src/draws.h:167: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4DF8 11 A0 46      [10] 1540 	ld	de,#_fatiga_full
   4DFB 21 02 08      [10] 1541 	ld	hl,#0x0802
   4DFE E5            [11] 1542 	push	hl
   4DFF C5            [11] 1543 	push	bc
   4E00 D5            [11] 1544 	push	de
   4E01 CD 8F 68      [17] 1545 	call	_cpct_drawSpriteMasked
                           1546 ;src/draws.h:168: }
   4E04                    1547 00108$:
                           1548 ;src/draws.h:170: if(atk > 40 || atk <= 20){
   4E04 3E 28         [ 7] 1549 	ld	a,#0x28
   4E06 DD 96 04      [19] 1550 	sub	a, 4 (ix)
   4E09 38 06         [12] 1551 	jr	C,00114$
   4E0B DD 7E FE      [19] 1552 	ld	a,-2 (ix)
   4E0E B7            [ 4] 1553 	or	a, a
   4E0F 20 4F         [12] 1554 	jr	NZ,00115$
   4E11                    1555 00114$:
                           1556 ;src/draws.h:171: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E11 21 1F C0      [10] 1557 	ld	hl,#0xC01F
   4E14 E5            [11] 1558 	push	hl
   4E15 2E 00         [ 7] 1559 	ld	l, #0x00
   4E17 E5            [11] 1560 	push	hl
   4E18 CD E6 69      [17] 1561 	call	_cpct_getScreenPtr
                           1562 ;src/draws.h:172: switch(col){
   4E1B DD 7E FF      [19] 1563 	ld	a,-1 (ix)
   4E1E B7            [ 4] 1564 	or	a, a
   4E1F 20 3F         [12] 1565 	jr	NZ,00115$
                           1566 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4E21 4D            [ 4] 1567 	ld	c, l
   4E22 44            [ 4] 1568 	ld	b, h
                           1569 ;src/draws.h:172: switch(col){
   4E23 DD 5E 05      [19] 1570 	ld	e,5 (ix)
   4E26 16 00         [ 7] 1571 	ld	d,#0x00
   4E28 21 2E 4E      [10] 1572 	ld	hl,#00157$
   4E2B 19            [11] 1573 	add	hl,de
   4E2C 19            [11] 1574 	add	hl,de
                           1575 ;src/draws.h:173: case 0:
   4E2D E9            [ 4] 1576 	jp	(hl)
   4E2E                    1577 00157$:
   4E2E 18 04         [12] 1578 	jr	00110$
   4E30 18 14         [12] 1579 	jr	00111$
   4E32 18 20         [12] 1580 	jr	00112$
   4E34                    1581 00110$:
                           1582 ;src/draws.h:174: cpct_drawSolidBox(memptr, col, 2, 8);
   4E34 21 02 08      [10] 1583 	ld	hl,#0x0802
   4E37 E5            [11] 1584 	push	hl
   4E38 DD 7E 05      [19] 1585 	ld	a,5 (ix)
   4E3B F5            [11] 1586 	push	af
   4E3C 33            [ 6] 1587 	inc	sp
   4E3D C5            [11] 1588 	push	bc
   4E3E CD 15 69      [17] 1589 	call	_cpct_drawSolidBox
   4E41 F1            [10] 1590 	pop	af
   4E42 F1            [10] 1591 	pop	af
   4E43 33            [ 6] 1592 	inc	sp
                           1593 ;src/draws.h:175: break;
   4E44 18 1A         [12] 1594 	jr	00115$
                           1595 ;src/draws.h:176: case 1:
   4E46                    1596 00111$:
                           1597 ;src/draws.h:177: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E46 11 80 46      [10] 1598 	ld	de,#_fatiga_nor
   4E49 21 02 08      [10] 1599 	ld	hl,#0x0802
   4E4C E5            [11] 1600 	push	hl
   4E4D C5            [11] 1601 	push	bc
   4E4E D5            [11] 1602 	push	de
   4E4F CD 8F 68      [17] 1603 	call	_cpct_drawSpriteMasked
                           1604 ;src/draws.h:178: break;
   4E52 18 0C         [12] 1605 	jr	00115$
                           1606 ;src/draws.h:179: case 2:
   4E54                    1607 00112$:
                           1608 ;src/draws.h:180: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E54 11 A0 46      [10] 1609 	ld	de,#_fatiga_full
   4E57 21 02 08      [10] 1610 	ld	hl,#0x0802
   4E5A E5            [11] 1611 	push	hl
   4E5B C5            [11] 1612 	push	bc
   4E5C D5            [11] 1613 	push	de
   4E5D CD 8F 68      [17] 1614 	call	_cpct_drawSpriteMasked
                           1615 ;src/draws.h:181: }
   4E60                    1616 00115$:
                           1617 ;src/draws.h:183: if(atk <= 20){
   4E60 DD 7E FE      [19] 1618 	ld	a,-2 (ix)
   4E63 B7            [ 4] 1619 	or	a, a
   4E64 20 39         [12] 1620 	jr	NZ,00122$
                           1621 ;src/draws.h:184: memptr = cpct_getScreenPtr(VMEM,34,192);
   4E66 21 22 C0      [10] 1622 	ld	hl,#0xC022
   4E69 E5            [11] 1623 	push	hl
   4E6A 2E 00         [ 7] 1624 	ld	l, #0x00
   4E6C E5            [11] 1625 	push	hl
   4E6D CD E6 69      [17] 1626 	call	_cpct_getScreenPtr
                           1627 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4E70 4D            [ 4] 1628 	ld	c, l
   4E71 44            [ 4] 1629 	ld	b, h
                           1630 ;src/draws.h:185: switch(col){
   4E72 DD 7E 05      [19] 1631 	ld	a,5 (ix)
   4E75 B7            [ 4] 1632 	or	a, a
   4E76 28 09         [12] 1633 	jr	Z,00117$
   4E78 DD 7E 05      [19] 1634 	ld	a,5 (ix)
   4E7B D6 02         [ 7] 1635 	sub	a, #0x02
   4E7D 28 14         [12] 1636 	jr	Z,00118$
   4E7F 18 1E         [12] 1637 	jr	00122$
                           1638 ;src/draws.h:186: case 0:
   4E81                    1639 00117$:
                           1640 ;src/draws.h:187: cpct_drawSolidBox(memptr, col, 2, 8);
   4E81 21 02 08      [10] 1641 	ld	hl,#0x0802
   4E84 E5            [11] 1642 	push	hl
   4E85 DD 7E 05      [19] 1643 	ld	a,5 (ix)
   4E88 F5            [11] 1644 	push	af
   4E89 33            [ 6] 1645 	inc	sp
   4E8A C5            [11] 1646 	push	bc
   4E8B CD 15 69      [17] 1647 	call	_cpct_drawSolidBox
   4E8E F1            [10] 1648 	pop	af
   4E8F F1            [10] 1649 	pop	af
   4E90 33            [ 6] 1650 	inc	sp
                           1651 ;src/draws.h:188: break;
   4E91 18 0C         [12] 1652 	jr	00122$
                           1653 ;src/draws.h:189: case 2:
   4E93                    1654 00118$:
                           1655 ;src/draws.h:190: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E93 11 A0 46      [10] 1656 	ld	de,#_fatiga_full
   4E96 21 02 08      [10] 1657 	ld	hl,#0x0802
   4E99 E5            [11] 1658 	push	hl
   4E9A C5            [11] 1659 	push	bc
   4E9B D5            [11] 1660 	push	de
   4E9C CD 8F 68      [17] 1661 	call	_cpct_drawSpriteMasked
                           1662 ;src/draws.h:191: }
   4E9F                    1663 00122$:
   4E9F DD F9         [10] 1664 	ld	sp, ix
   4EA1 DD E1         [14] 1665 	pop	ix
   4EA3 C9            [10] 1666 	ret
                           1667 ;src/draws.h:196: void drawPickUps(u8 corazon, u8 bullet){
                           1668 ;	---------------------------------
                           1669 ; Function drawPickUps
                           1670 ; ---------------------------------
   4EA4                    1671 _drawPickUps::
   4EA4 DD E5         [15] 1672 	push	ix
   4EA6 DD 21 00 00   [14] 1673 	ld	ix,#0
   4EAA DD 39         [15] 1674 	add	ix,sp
                           1675 ;src/draws.h:199: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4EAC 21 04 A0      [10] 1676 	ld	hl,#0xA004
   4EAF E5            [11] 1677 	push	hl
   4EB0 21 00 C0      [10] 1678 	ld	hl,#0xC000
   4EB3 E5            [11] 1679 	push	hl
   4EB4 CD E6 69      [17] 1680 	call	_cpct_getScreenPtr
                           1681 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EB7 4D            [ 4] 1682 	ld	c, l
   4EB8 44            [ 4] 1683 	ld	b, h
                           1684 ;src/draws.h:200: if(corazon == 0)
   4EB9 DD 7E 04      [19] 1685 	ld	a,4 (ix)
   4EBC B7            [ 4] 1686 	or	a, a
   4EBD 20 0E         [12] 1687 	jr	NZ,00102$
                           1688 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EBF 11 00 46      [10] 1689 	ld	de,#_corazon_lleno
   4EC2 21 04 08      [10] 1690 	ld	hl,#0x0804
   4EC5 E5            [11] 1691 	push	hl
   4EC6 C5            [11] 1692 	push	bc
   4EC7 D5            [11] 1693 	push	de
   4EC8 CD 8F 68      [17] 1694 	call	_cpct_drawSpriteMasked
   4ECB 18 0E         [12] 1695 	jr	00103$
   4ECD                    1696 00102$:
                           1697 ;src/draws.h:203: cpct_drawSolidBox(memptr, 0, 4, 8);
   4ECD 21 04 08      [10] 1698 	ld	hl,#0x0804
   4ED0 E5            [11] 1699 	push	hl
   4ED1 AF            [ 4] 1700 	xor	a, a
   4ED2 F5            [11] 1701 	push	af
   4ED3 33            [ 6] 1702 	inc	sp
   4ED4 C5            [11] 1703 	push	bc
   4ED5 CD 15 69      [17] 1704 	call	_cpct_drawSolidBox
   4ED8 F1            [10] 1705 	pop	af
   4ED9 F1            [10] 1706 	pop	af
   4EDA 33            [ 6] 1707 	inc	sp
   4EDB                    1708 00103$:
                           1709 ;src/draws.h:205: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4EDB 21 08 10      [10] 1710 	ld	hl,#0x1008
   4EDE E5            [11] 1711 	push	hl
   4EDF 21 00 C0      [10] 1712 	ld	hl,#0xC000
   4EE2 E5            [11] 1713 	push	hl
   4EE3 CD E6 69      [17] 1714 	call	_cpct_getScreenPtr
                           1715 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EE6 EB            [ 4] 1716 	ex	de,hl
                           1717 ;src/draws.h:206: if(bullet == 0)
   4EE7 DD 7E 05      [19] 1718 	ld	a,5 (ix)
   4EEA B7            [ 4] 1719 	or	a, a
   4EEB 20 0E         [12] 1720 	jr	NZ,00105$
                           1721 ;src/draws.h:207: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4EED 01 19 66      [10] 1722 	ld	bc,#_flecha_arriba
   4EF0 21 02 08      [10] 1723 	ld	hl,#0x0802
   4EF3 E5            [11] 1724 	push	hl
   4EF4 D5            [11] 1725 	push	de
   4EF5 C5            [11] 1726 	push	bc
   4EF6 CD 8F 68      [17] 1727 	call	_cpct_drawSpriteMasked
   4EF9 18 0E         [12] 1728 	jr	00107$
   4EFB                    1729 00105$:
                           1730 ;src/draws.h:209: cpct_drawSolidBox(memptr, 0, 2, 8);
   4EFB 21 02 08      [10] 1731 	ld	hl,#0x0802
   4EFE E5            [11] 1732 	push	hl
   4EFF AF            [ 4] 1733 	xor	a, a
   4F00 F5            [11] 1734 	push	af
   4F01 33            [ 6] 1735 	inc	sp
   4F02 D5            [11] 1736 	push	de
   4F03 CD 15 69      [17] 1737 	call	_cpct_drawSolidBox
   4F06 F1            [10] 1738 	pop	af
   4F07 F1            [10] 1739 	pop	af
   4F08 33            [ 6] 1740 	inc	sp
   4F09                    1741 00107$:
   4F09 DD E1         [14] 1742 	pop	ix
   4F0B C9            [10] 1743 	ret
                           1744 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py,u8 room){
                           1745 ;	---------------------------------
                           1746 ; Function detectPlayerRoom
                           1747 ; ---------------------------------
   4F0C                    1748 _detectPlayerRoom::
   4F0C DD E5         [15] 1749 	push	ix
   4F0E DD 21 00 00   [14] 1750 	ld	ix,#0
   4F12 DD 39         [15] 1751 	add	ix,sp
                           1752 ;src/ia.h:13: u8 detected = 0; // no detectado
   4F14 16 00         [ 7] 1753 	ld	d,#0x00
                           1754 ;src/ia.h:14: if (scene[py/tileheight][px/tilewidth] == room) detected = 1;
   4F16 DD 7E 05      [19] 1755 	ld	a,5 (ix)
   4F19 07            [ 4] 1756 	rlca
   4F1A 07            [ 4] 1757 	rlca
   4F1B 07            [ 4] 1758 	rlca
   4F1C 07            [ 4] 1759 	rlca
   4F1D E6 0F         [ 7] 1760 	and	a,#0x0F
   4F1F 4F            [ 4] 1761 	ld	c,a
   4F20 06 00         [ 7] 1762 	ld	b,#0x00
   4F22 69            [ 4] 1763 	ld	l, c
   4F23 60            [ 4] 1764 	ld	h, b
   4F24 29            [11] 1765 	add	hl, hl
   4F25 29            [11] 1766 	add	hl, hl
   4F26 09            [11] 1767 	add	hl, bc
   4F27 29            [11] 1768 	add	hl, hl
   4F28 29            [11] 1769 	add	hl, hl
   4F29 01 DC 6A      [10] 1770 	ld	bc,#_scene
   4F2C 09            [11] 1771 	add	hl,bc
   4F2D DD 5E 04      [19] 1772 	ld	e,4 (ix)
   4F30 CB 3B         [ 8] 1773 	srl	e
   4F32 CB 3B         [ 8] 1774 	srl	e
   4F34 4B            [ 4] 1775 	ld	c,e
   4F35 06 00         [ 7] 1776 	ld	b,#0x00
   4F37 09            [11] 1777 	add	hl,bc
   4F38 DD 7E 06      [19] 1778 	ld	a,6 (ix)
   4F3B 96            [ 7] 1779 	sub	a,(hl)
   4F3C 20 02         [12] 1780 	jr	NZ,00102$
   4F3E 16 01         [ 7] 1781 	ld	d,#0x01
   4F40                    1782 00102$:
                           1783 ;src/ia.h:15: return detected;
   4F40 6A            [ 4] 1784 	ld	l,d
   4F41 DD E1         [14] 1785 	pop	ix
   4F43 C9            [10] 1786 	ret
                           1787 ;src/ia.h:18: u8 chooseDirection(u8 d){
                           1788 ;	---------------------------------
                           1789 ; Function chooseDirection
                           1790 ; ---------------------------------
   4F44                    1791 _chooseDirection::
                           1792 ;src/ia.h:20: u8 dir = 0;
   4F44 16 00         [ 7] 1793 	ld	d,#0x00
                           1794 ;src/ia.h:21: u8 rnd = (rand()%4)+1;
   4F46 D5            [11] 1795 	push	de
   4F47 CD 33 67      [17] 1796 	call	_rand
   4F4A 01 04 00      [10] 1797 	ld	bc,#0x0004
   4F4D C5            [11] 1798 	push	bc
   4F4E E5            [11] 1799 	push	hl
   4F4F CD DA 69      [17] 1800 	call	__modsint
   4F52 F1            [10] 1801 	pop	af
   4F53 F1            [10] 1802 	pop	af
   4F54 D1            [10] 1803 	pop	de
   4F55 5D            [ 4] 1804 	ld	e,l
   4F56 1C            [ 4] 1805 	inc	e
                           1806 ;src/ia.h:22: switch(rnd){
   4F57 7B            [ 4] 1807 	ld	a,e
   4F58 D6 01         [ 7] 1808 	sub	a, #0x01
   4F5A 38 24         [12] 1809 	jr	C,00105$
   4F5C 3E 04         [ 7] 1810 	ld	a,#0x04
   4F5E 93            [ 4] 1811 	sub	a, e
   4F5F 38 1F         [12] 1812 	jr	C,00105$
   4F61 1D            [ 4] 1813 	dec	e
   4F62 16 00         [ 7] 1814 	ld	d,#0x00
   4F64 21 6A 4F      [10] 1815 	ld	hl,#00116$
   4F67 19            [11] 1816 	add	hl,de
   4F68 19            [11] 1817 	add	hl,de
                           1818 ;src/ia.h:23: case 4: dir = 6;break;
   4F69 E9            [ 4] 1819 	jp	(hl)
   4F6A                    1820 00116$:
   4F6A 18 12         [12] 1821 	jr	00104$
   4F6C 18 0C         [12] 1822 	jr	00103$
   4F6E 18 06         [12] 1823 	jr	00102$
   4F70 18 00         [12] 1824 	jr	00101$
   4F72                    1825 00101$:
   4F72 16 06         [ 7] 1826 	ld	d,#0x06
   4F74 18 0A         [12] 1827 	jr	00105$
                           1828 ;src/ia.h:24: case 3: dir = 4;break;
   4F76                    1829 00102$:
   4F76 16 04         [ 7] 1830 	ld	d,#0x04
   4F78 18 06         [12] 1831 	jr	00105$
                           1832 ;src/ia.h:25: case 2: dir = 2;break;
   4F7A                    1833 00103$:
   4F7A 16 02         [ 7] 1834 	ld	d,#0x02
   4F7C 18 02         [12] 1835 	jr	00105$
                           1836 ;src/ia.h:26: case 1: dir = 8;break;
   4F7E                    1837 00104$:
   4F7E 16 08         [ 7] 1838 	ld	d,#0x08
                           1839 ;src/ia.h:27: }
   4F80                    1840 00105$:
                           1841 ;src/ia.h:29: return dir;
   4F80 6A            [ 4] 1842 	ld	l,d
   4F81 C9            [10] 1843 	ret
                           1844 ;src/ia.h:33: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           1845 ;	---------------------------------
                           1846 ; Function setDirection
                           1847 ; ---------------------------------
   4F82                    1848 _setDirection::
   4F82 DD E5         [15] 1849 	push	ix
   4F84 DD 21 00 00   [14] 1850 	ld	ix,#0
   4F88 DD 39         [15] 1851 	add	ix,sp
                           1852 ;src/ia.h:35: if(px < x) dir = 4;
   4F8A DD 7E 04      [19] 1853 	ld	a,4 (ix)
   4F8D DD 96 06      [19] 1854 	sub	a, 6 (ix)
   4F90 30 04         [12] 1855 	jr	NC,00108$
   4F92 2E 04         [ 7] 1856 	ld	l,#0x04
   4F94 18 1A         [12] 1857 	jr	00109$
   4F96                    1858 00108$:
                           1859 ;src/ia.h:36: else if(py > y) dir = 2;
   4F96 DD 7E 07      [19] 1860 	ld	a,7 (ix)
   4F99 DD 96 05      [19] 1861 	sub	a, 5 (ix)
   4F9C 30 04         [12] 1862 	jr	NC,00105$
   4F9E 2E 02         [ 7] 1863 	ld	l,#0x02
   4FA0 18 0E         [12] 1864 	jr	00109$
   4FA2                    1865 00105$:
                           1866 ;src/ia.h:37: else if(px > x) dir = 6;
   4FA2 DD 7E 06      [19] 1867 	ld	a,6 (ix)
   4FA5 DD 96 04      [19] 1868 	sub	a, 4 (ix)
   4FA8 30 04         [12] 1869 	jr	NC,00102$
   4FAA 2E 06         [ 7] 1870 	ld	l,#0x06
   4FAC 18 02         [12] 1871 	jr	00109$
   4FAE                    1872 00102$:
                           1873 ;src/ia.h:38: else dir = 8;
   4FAE 2E 08         [ 7] 1874 	ld	l,#0x08
   4FB0                    1875 00109$:
                           1876 ;src/ia.h:39: return dir;
   4FB0 DD E1         [14] 1877 	pop	ix
   4FB2 C9            [10] 1878 	ret
                           1879 ;src/ia.h:42: void movement(u8 dir,u8 *x,u8 *y){
                           1880 ;	---------------------------------
                           1881 ; Function movement
                           1882 ; ---------------------------------
   4FB3                    1883 _movement::
   4FB3 DD E5         [15] 1884 	push	ix
   4FB5 DD 21 00 00   [14] 1885 	ld	ix,#0
   4FB9 DD 39         [15] 1886 	add	ix,sp
                           1887 ;src/ia.h:46: case 8: y[0] -= 2; break;
   4FBB DD 5E 07      [19] 1888 	ld	e,7 (ix)
   4FBE DD 56 08      [19] 1889 	ld	d,8 (ix)
                           1890 ;src/ia.h:43: switch(dir){
   4FC1 DD 7E 04      [19] 1891 	ld	a,4 (ix)
   4FC4 D6 02         [ 7] 1892 	sub	a, #0x02
   4FC6 28 2B         [12] 1893 	jr	Z,00104$
                           1894 ;src/ia.h:44: case 6: x[0] += 1; break;
   4FC8 DD 6E 05      [19] 1895 	ld	l,5 (ix)
   4FCB DD 66 06      [19] 1896 	ld	h,6 (ix)
                           1897 ;src/ia.h:43: switch(dir){
   4FCE DD 7E 04      [19] 1898 	ld	a,4 (ix)
   4FD1 D6 04         [ 7] 1899 	sub	a, #0x04
   4FD3 28 13         [12] 1900 	jr	Z,00102$
   4FD5 DD 7E 04      [19] 1901 	ld	a,4 (ix)
   4FD8 D6 06         [ 7] 1902 	sub	a, #0x06
   4FDA 28 09         [12] 1903 	jr	Z,00101$
   4FDC DD 7E 04      [19] 1904 	ld	a,4 (ix)
   4FDF D6 08         [ 7] 1905 	sub	a, #0x08
   4FE1 28 0A         [12] 1906 	jr	Z,00103$
   4FE3 18 12         [12] 1907 	jr	00106$
                           1908 ;src/ia.h:44: case 6: x[0] += 1; break;
   4FE5                    1909 00101$:
   4FE5 34            [11] 1910 	inc	(hl)
   4FE6 18 0F         [12] 1911 	jr	00106$
                           1912 ;src/ia.h:45: case 4: x[0] -= 1; break;
   4FE8                    1913 00102$:
   4FE8 56            [ 7] 1914 	ld	d,(hl)
   4FE9 15            [ 4] 1915 	dec	d
   4FEA 72            [ 7] 1916 	ld	(hl),d
   4FEB 18 0A         [12] 1917 	jr	00106$
                           1918 ;src/ia.h:46: case 8: y[0] -= 2; break;
   4FED                    1919 00103$:
   4FED 1A            [ 7] 1920 	ld	a,(de)
   4FEE C6 FE         [ 7] 1921 	add	a,#0xFE
   4FF0 12            [ 7] 1922 	ld	(de),a
   4FF1 18 04         [12] 1923 	jr	00106$
                           1924 ;src/ia.h:47: case 2: y[0] += 2; break;
   4FF3                    1925 00104$:
   4FF3 1A            [ 7] 1926 	ld	a,(de)
   4FF4 C6 02         [ 7] 1927 	add	a, #0x02
   4FF6 12            [ 7] 1928 	ld	(de),a
                           1929 ;src/ia.h:48: }
   4FF7                    1930 00106$:
   4FF7 DD E1         [14] 1931 	pop	ix
   4FF9 C9            [10] 1932 	ret
                           1933 ;src/ia.h:53: u8 followPlayer(){
                           1934 ;	---------------------------------
                           1935 ; Function followPlayer
                           1936 ; ---------------------------------
   4FFA                    1937 _followPlayer::
   4FFA DD E5         [15] 1938 	push	ix
   4FFC DD 21 00 00   [14] 1939 	ld	ix,#0
   5000 DD 39         [15] 1940 	add	ix,sp
   5002 21 F5 FF      [10] 1941 	ld	hl,#-11
   5005 39            [11] 1942 	add	hl,sp
   5006 F9            [ 6] 1943 	ld	sp,hl
                           1944 ;src/ia.h:55: enemy.dir = setDirection(player.x,player.y,enemy.x,enemy.y);
   5007 21 EB 6B      [10] 1945 	ld	hl, #(_enemy + 0x0001) + 0
   500A 4E            [ 7] 1946 	ld	c,(hl)
   500B 21 EA 6B      [10] 1947 	ld	hl, #_enemy + 0
   500E 46            [ 7] 1948 	ld	b,(hl)
   500F 21 E0 6B      [10] 1949 	ld	hl, #_player + 1
   5012 5E            [ 7] 1950 	ld	e,(hl)
   5013 21 DF 6B      [10] 1951 	ld	hl, #_player + 0
   5016 56            [ 7] 1952 	ld	d,(hl)
   5017 79            [ 4] 1953 	ld	a,c
   5018 F5            [11] 1954 	push	af
   5019 33            [ 6] 1955 	inc	sp
   501A C5            [11] 1956 	push	bc
   501B 33            [ 6] 1957 	inc	sp
   501C 7B            [ 4] 1958 	ld	a,e
   501D F5            [11] 1959 	push	af
   501E 33            [ 6] 1960 	inc	sp
   501F D5            [11] 1961 	push	de
   5020 33            [ 6] 1962 	inc	sp
   5021 CD 82 4F      [17] 1963 	call	_setDirection
   5024 F1            [10] 1964 	pop	af
   5025 F1            [10] 1965 	pop	af
   5026 55            [ 4] 1966 	ld	d,l
   5027 21 F3 6B      [10] 1967 	ld	hl,#(_enemy + 0x0009)
   502A 72            [ 7] 1968 	ld	(hl),d
                           1969 ;src/ia.h:56: movement(enemy.dir,&enemy.x,&enemy.y);
   502B 21 EA 6B      [10] 1970 	ld	hl,#_enemy
   502E 01 EB 6B      [10] 1971 	ld	bc,#(_enemy + 0x0001)
   5031 C5            [11] 1972 	push	bc
   5032 E5            [11] 1973 	push	hl
   5033 D5            [11] 1974 	push	de
   5034 33            [ 6] 1975 	inc	sp
   5035 CD B3 4F      [17] 1976 	call	_movement
   5038 F1            [10] 1977 	pop	af
   5039 F1            [10] 1978 	pop	af
   503A 33            [ 6] 1979 	inc	sp
                           1980 ;src/ia.h:57: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] == 1
   503B 3A EB 6B      [13] 1981 	ld	a,(#(_enemy + 0x0001) + 0)
   503E DD 77 F8      [19] 1982 	ld	-8 (ix), a
   5041 07            [ 4] 1983 	rlca
   5042 07            [ 4] 1984 	rlca
   5043 07            [ 4] 1985 	rlca
   5044 07            [ 4] 1986 	rlca
   5045 E6 0F         [ 7] 1987 	and	a,#0x0F
   5047 4F            [ 4] 1988 	ld	c,a
   5048 06 00         [ 7] 1989 	ld	b,#0x00
   504A 69            [ 4] 1990 	ld	l, c
   504B 60            [ 4] 1991 	ld	h, b
   504C 29            [11] 1992 	add	hl, hl
   504D 29            [11] 1993 	add	hl, hl
   504E 09            [11] 1994 	add	hl, bc
   504F 29            [11] 1995 	add	hl, hl
   5050 29            [11] 1996 	add	hl, hl
   5051 3E DC         [ 7] 1997 	ld	a,#<(_scene)
   5053 85            [ 4] 1998 	add	a, l
   5054 DD 77 FA      [19] 1999 	ld	-6 (ix),a
   5057 3E 6A         [ 7] 2000 	ld	a,#>(_scene)
   5059 8C            [ 4] 2001 	adc	a, h
   505A DD 77 FB      [19] 2002 	ld	-5 (ix),a
   505D 21 EA 6B      [10] 2003 	ld	hl, #_enemy + 0
   5060 4E            [ 7] 2004 	ld	c,(hl)
   5061 79            [ 4] 2005 	ld	a,c
   5062 0F            [ 4] 2006 	rrca
   5063 0F            [ 4] 2007 	rrca
   5064 E6 3F         [ 7] 2008 	and	a,#0x3F
   5066 DD 77 F9      [19] 2009 	ld	-7 (ix), a
   5069 DD 86 FA      [19] 2010 	add	a, -6 (ix)
   506C 6F            [ 4] 2011 	ld	l,a
   506D 3E 00         [ 7] 2012 	ld	a,#0x00
   506F DD 8E FB      [19] 2013 	adc	a, -5 (ix)
   5072 67            [ 4] 2014 	ld	h,a
   5073 7E            [ 7] 2015 	ld	a,(hl)
   5074 3D            [ 4] 2016 	dec	a
   5075 CA 6C 51      [10] 2017 	jp	Z,00101$
                           2018 ;src/ia.h:58: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] == 1
   5078 06 00         [ 7] 2019 	ld	b,#0x00
   507A 21 03 00      [10] 2020 	ld	hl,#0x0003
   507D 09            [11] 2021 	add	hl,bc
   507E DD 75 FC      [19] 2022 	ld	-4 (ix),l
   5081 DD 74 FD      [19] 2023 	ld	-3 (ix),h
   5084 DD 7E FC      [19] 2024 	ld	a,-4 (ix)
   5087 DD 77 F5      [19] 2025 	ld	-11 (ix),a
   508A DD 7E FD      [19] 2026 	ld	a,-3 (ix)
   508D DD 77 F6      [19] 2027 	ld	-10 (ix),a
   5090 DD 7E FD      [19] 2028 	ld	a,-3 (ix)
   5093 07            [ 4] 2029 	rlca
   5094 E6 01         [ 7] 2030 	and	a,#0x01
   5096 DD 77 F7      [19] 2031 	ld	-9 (ix),a
   5099 21 06 00      [10] 2032 	ld	hl,#0x0006
   509C 09            [11] 2033 	add	hl,bc
   509D DD 75 FE      [19] 2034 	ld	-2 (ix),l
   50A0 DD 74 FF      [19] 2035 	ld	-1 (ix),h
   50A3 DD 7E F7      [19] 2036 	ld	a,-9 (ix)
   50A6 B7            [ 4] 2037 	or	a, a
   50A7 28 0C         [12] 2038 	jr	Z,00108$
   50A9 DD 7E FE      [19] 2039 	ld	a,-2 (ix)
   50AC DD 77 F5      [19] 2040 	ld	-11 (ix),a
   50AF DD 7E FF      [19] 2041 	ld	a,-1 (ix)
   50B2 DD 77 F6      [19] 2042 	ld	-10 (ix),a
   50B5                    2043 00108$:
   50B5 E1            [10] 2044 	pop	hl
   50B6 E5            [11] 2045 	push	hl
   50B7 CB 2C         [ 8] 2046 	sra	h
   50B9 CB 1D         [ 8] 2047 	rr	l
   50BB CB 2C         [ 8] 2048 	sra	h
   50BD CB 1D         [ 8] 2049 	rr	l
   50BF DD 5E FA      [19] 2050 	ld	e,-6 (ix)
   50C2 DD 56 FB      [19] 2051 	ld	d,-5 (ix)
   50C5 19            [11] 2052 	add	hl,de
   50C6 7E            [ 7] 2053 	ld	a,(hl)
   50C7 3D            [ 4] 2054 	dec	a
   50C8 CA 6C 51      [10] 2055 	jp	Z,00101$
                           2056 ;src/ia.h:59: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] == 1
   50CB DD 5E F8      [19] 2057 	ld	e,-8 (ix)
   50CE 16 00         [ 7] 2058 	ld	d,#0x00
   50D0 21 0E 00      [10] 2059 	ld	hl,#0x000E
   50D3 19            [11] 2060 	add	hl,de
   50D4 4D            [ 4] 2061 	ld	c,l
   50D5 44            [ 4] 2062 	ld	b,h
   50D6 69            [ 4] 2063 	ld	l, c
   50D7 78            [ 4] 2064 	ld	a,b
   50D8 67            [ 4] 2065 	ld	h,a
   50D9 07            [ 4] 2066 	rlca
   50DA E6 01         [ 7] 2067 	and	a,#0x01
   50DC DD 77 F5      [19] 2068 	ld	-11 (ix),a
   50DF 7B            [ 4] 2069 	ld	a,e
   50E0 C6 1D         [ 7] 2070 	add	a, #0x1D
   50E2 DD 77 FA      [19] 2071 	ld	-6 (ix),a
   50E5 7A            [ 4] 2072 	ld	a,d
   50E6 CE 00         [ 7] 2073 	adc	a, #0x00
   50E8 DD 77 FB      [19] 2074 	ld	-5 (ix),a
   50EB DD 7E F5      [19] 2075 	ld	a,-11 (ix)
   50EE B7            [ 4] 2076 	or	a, a
   50EF 28 06         [12] 2077 	jr	Z,00109$
   50F1 DD 6E FA      [19] 2078 	ld	l,-6 (ix)
   50F4 DD 66 FB      [19] 2079 	ld	h,-5 (ix)
   50F7                    2080 00109$:
   50F7 CB 2C         [ 8] 2081 	sra	h
   50F9 CB 1D         [ 8] 2082 	rr	l
   50FB CB 2C         [ 8] 2083 	sra	h
   50FD CB 1D         [ 8] 2084 	rr	l
   50FF CB 2C         [ 8] 2085 	sra	h
   5101 CB 1D         [ 8] 2086 	rr	l
   5103 CB 2C         [ 8] 2087 	sra	h
   5105 CB 1D         [ 8] 2088 	rr	l
   5107 5D            [ 4] 2089 	ld	e, l
   5108 54            [ 4] 2090 	ld	d, h
   5109 29            [11] 2091 	add	hl, hl
   510A 29            [11] 2092 	add	hl, hl
   510B 19            [11] 2093 	add	hl, de
   510C 29            [11] 2094 	add	hl, hl
   510D 29            [11] 2095 	add	hl, hl
   510E 11 DC 6A      [10] 2096 	ld	de,#_scene
   5111 19            [11] 2097 	add	hl,de
   5112 DD 5E F9      [19] 2098 	ld	e,-7 (ix)
   5115 16 00         [ 7] 2099 	ld	d,#0x00
   5117 19            [11] 2100 	add	hl,de
   5118 7E            [ 7] 2101 	ld	a,(hl)
   5119 3D            [ 4] 2102 	dec	a
   511A 28 50         [12] 2103 	jr	Z,00101$
                           2104 ;src/ia.h:60: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] == 1
   511C DD 7E F5      [19] 2105 	ld	a,-11 (ix)
   511F B7            [ 4] 2106 	or	a, a
   5120 28 06         [12] 2107 	jr	Z,00110$
   5122 DD 4E FA      [19] 2108 	ld	c,-6 (ix)
   5125 DD 46 FB      [19] 2109 	ld	b,-5 (ix)
   5128                    2110 00110$:
   5128 CB 28         [ 8] 2111 	sra	b
   512A CB 19         [ 8] 2112 	rr	c
   512C CB 28         [ 8] 2113 	sra	b
   512E CB 19         [ 8] 2114 	rr	c
   5130 CB 28         [ 8] 2115 	sra	b
   5132 CB 19         [ 8] 2116 	rr	c
   5134 CB 28         [ 8] 2117 	sra	b
   5136 CB 19         [ 8] 2118 	rr	c
   5138 69            [ 4] 2119 	ld	l, c
   5139 60            [ 4] 2120 	ld	h, b
   513A 29            [11] 2121 	add	hl, hl
   513B 29            [11] 2122 	add	hl, hl
   513C 09            [11] 2123 	add	hl, bc
   513D 29            [11] 2124 	add	hl, hl
   513E 29            [11] 2125 	add	hl, hl
   513F 3E DC         [ 7] 2126 	ld	a,#<(_scene)
   5141 85            [ 4] 2127 	add	a, l
   5142 DD 77 F5      [19] 2128 	ld	-11 (ix),a
   5145 3E 6A         [ 7] 2129 	ld	a,#>(_scene)
   5147 8C            [ 4] 2130 	adc	a, h
   5148 DD 77 F6      [19] 2131 	ld	-10 (ix),a
   514B DD 6E FC      [19] 2132 	ld	l,-4 (ix)
   514E DD 66 FD      [19] 2133 	ld	h,-3 (ix)
   5151 DD 7E F7      [19] 2134 	ld	a,-9 (ix)
   5154 B7            [ 4] 2135 	or	a, a
   5155 28 06         [12] 2136 	jr	Z,00111$
   5157 DD 6E FE      [19] 2137 	ld	l,-2 (ix)
   515A DD 66 FF      [19] 2138 	ld	h,-1 (ix)
   515D                    2139 00111$:
   515D CB 2C         [ 8] 2140 	sra	h
   515F CB 1D         [ 8] 2141 	rr	l
   5161 CB 2C         [ 8] 2142 	sra	h
   5163 CB 1D         [ 8] 2143 	rr	l
   5165 D1            [10] 2144 	pop	de
   5166 D5            [11] 2145 	push	de
   5167 19            [11] 2146 	add	hl,de
   5168 7E            [ 7] 2147 	ld	a,(hl)
   5169 3D            [ 4] 2148 	dec	a
   516A 20 0C         [12] 2149 	jr	NZ,00102$
   516C                    2150 00101$:
                           2151 ;src/ia.h:62: enemy.x=enemy.lx;
   516C 3A EC 6B      [13] 2152 	ld	a, (#_enemy + 2)
   516F 32 EA 6B      [13] 2153 	ld	(#_enemy),a
                           2154 ;src/ia.h:63: enemy.y=enemy.ly;
   5172 3A ED 6B      [13] 2155 	ld	a, (#_enemy + 3)
   5175 32 EB 6B      [13] 2156 	ld	(#(_enemy + 0x0001)),a
   5178                    2157 00102$:
                           2158 ;src/ia.h:66: return following;
   5178 2E 01         [ 7] 2159 	ld	l,#0x01
   517A DD F9         [10] 2160 	ld	sp, ix
   517C DD E1         [14] 2161 	pop	ix
   517E C9            [10] 2162 	ret
                           2163 ;src/ia.h:70: void patrol(){
                           2164 ;	---------------------------------
                           2165 ; Function patrol
                           2166 ; ---------------------------------
   517F                    2167 _patrol::
   517F DD E5         [15] 2168 	push	ix
   5181 DD 21 00 00   [14] 2169 	ld	ix,#0
   5185 DD 39         [15] 2170 	add	ix,sp
   5187 21 F4 FF      [10] 2171 	ld	hl,#-12
   518A 39            [11] 2172 	add	hl,sp
   518B F9            [ 6] 2173 	ld	sp,hl
                           2174 ;src/ia.h:71: movement(enemy.dir,&enemy.x,&enemy.y);
   518C 01 EB 6B      [10] 2175 	ld	bc,#(_enemy + 0x0001)
   518F 11 EA 6B      [10] 2176 	ld	de,#_enemy
   5192 3A F3 6B      [13] 2177 	ld	a, (#_enemy + 9)
   5195 C5            [11] 2178 	push	bc
   5196 D5            [11] 2179 	push	de
   5197 F5            [11] 2180 	push	af
   5198 33            [ 6] 2181 	inc	sp
   5199 CD B3 4F      [17] 2182 	call	_movement
   519C F1            [10] 2183 	pop	af
   519D F1            [10] 2184 	pop	af
   519E 33            [ 6] 2185 	inc	sp
                           2186 ;src/ia.h:72: if(scene[(enemy.y)/tileheight][(enemy.x)/tilewidth] != enemy.room
   519F 3A EB 6B      [13] 2187 	ld	a,(#(_enemy + 0x0001) + 0)
   51A2 DD 77 FF      [19] 2188 	ld	-1 (ix), a
   51A5 07            [ 4] 2189 	rlca
   51A6 07            [ 4] 2190 	rlca
   51A7 07            [ 4] 2191 	rlca
   51A8 07            [ 4] 2192 	rlca
   51A9 E6 0F         [ 7] 2193 	and	a,#0x0F
   51AB 4F            [ 4] 2194 	ld	c,a
   51AC 06 00         [ 7] 2195 	ld	b,#0x00
   51AE 69            [ 4] 2196 	ld	l, c
   51AF 60            [ 4] 2197 	ld	h, b
   51B0 29            [11] 2198 	add	hl, hl
   51B1 29            [11] 2199 	add	hl, hl
   51B2 09            [11] 2200 	add	hl, bc
   51B3 29            [11] 2201 	add	hl, hl
   51B4 29            [11] 2202 	add	hl, hl
   51B5 3E DC         [ 7] 2203 	ld	a,#<(_scene)
   51B7 85            [ 4] 2204 	add	a, l
   51B8 DD 77 FB      [19] 2205 	ld	-5 (ix),a
   51BB 3E 6A         [ 7] 2206 	ld	a,#>(_scene)
   51BD 8C            [ 4] 2207 	adc	a, h
   51BE DD 77 FC      [19] 2208 	ld	-4 (ix),a
   51C1 3A EA 6B      [13] 2209 	ld	a,(#_enemy + 0)
   51C4 DD 77 F9      [19] 2210 	ld	-7 (ix), a
   51C7 0F            [ 4] 2211 	rrca
   51C8 0F            [ 4] 2212 	rrca
   51C9 E6 3F         [ 7] 2213 	and	a,#0x3F
   51CB DD 77 FA      [19] 2214 	ld	-6 (ix), a
   51CE DD 86 FB      [19] 2215 	add	a, -5 (ix)
   51D1 5F            [ 4] 2216 	ld	e,a
   51D2 3E 00         [ 7] 2217 	ld	a,#0x00
   51D4 DD 8E FC      [19] 2218 	adc	a, -4 (ix)
   51D7 57            [ 4] 2219 	ld	d,a
   51D8 3A F5 6B      [13] 2220 	ld	a,(#_enemy + 11)
   51DB DD 77 F6      [19] 2221 	ld	-10 (ix),a
   51DE 1A            [ 7] 2222 	ld	a,(de)
   51DF 57            [ 4] 2223 	ld	d,a
   51E0 DD 7E F6      [19] 2224 	ld	a,-10 (ix)
   51E3 92            [ 4] 2225 	sub	a, d
   51E4 C2 E3 52      [10] 2226 	jp	NZ,00101$
                           2227 ;src/ia.h:73: || scene[(enemy.y)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   51E7 DD 5E F9      [19] 2228 	ld	e,-7 (ix)
   51EA 16 00         [ 7] 2229 	ld	d,#0x00
   51EC 21 03 00      [10] 2230 	ld	hl,#0x0003
   51EF 19            [11] 2231 	add	hl,de
   51F0 E3            [19] 2232 	ex	(sp), hl
   51F1 DD 7E F4      [19] 2233 	ld	a,-12 (ix)
   51F4 DD 77 FD      [19] 2234 	ld	-3 (ix),a
   51F7 DD 7E F5      [19] 2235 	ld	a,-11 (ix)
   51FA DD 77 FE      [19] 2236 	ld	-2 (ix),a
   51FD DD 7E F5      [19] 2237 	ld	a,-11 (ix)
   5200 07            [ 4] 2238 	rlca
   5201 E6 01         [ 7] 2239 	and	a,#0x01
   5203 DD 77 F9      [19] 2240 	ld	-7 (ix),a
   5206 21 06 00      [10] 2241 	ld	hl,#0x0006
   5209 19            [11] 2242 	add	hl,de
   520A DD 75 F7      [19] 2243 	ld	-9 (ix),l
   520D DD 74 F8      [19] 2244 	ld	-8 (ix),h
   5210 DD 7E F9      [19] 2245 	ld	a,-7 (ix)
   5213 B7            [ 4] 2246 	or	a, a
   5214 28 0C         [12] 2247 	jr	Z,00108$
   5216 DD 7E F7      [19] 2248 	ld	a,-9 (ix)
   5219 DD 77 FD      [19] 2249 	ld	-3 (ix),a
   521C DD 7E F8      [19] 2250 	ld	a,-8 (ix)
   521F DD 77 FE      [19] 2251 	ld	-2 (ix),a
   5222                    2252 00108$:
   5222 DD 6E FD      [19] 2253 	ld	l,-3 (ix)
   5225 DD 66 FE      [19] 2254 	ld	h,-2 (ix)
   5228 CB 2C         [ 8] 2255 	sra	h
   522A CB 1D         [ 8] 2256 	rr	l
   522C CB 2C         [ 8] 2257 	sra	h
   522E CB 1D         [ 8] 2258 	rr	l
   5230 DD 5E FB      [19] 2259 	ld	e,-5 (ix)
   5233 DD 56 FC      [19] 2260 	ld	d,-4 (ix)
   5236 19            [11] 2261 	add	hl,de
   5237 DD 7E F6      [19] 2262 	ld	a,-10 (ix)
   523A 96            [ 7] 2263 	sub	a,(hl)
   523B C2 E3 52      [10] 2264 	jp	NZ,00101$
                           2265 ;src/ia.h:74: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x)/tilewidth] != enemy.room
   523E DD 5E FF      [19] 2266 	ld	e,-1 (ix)
   5241 16 00         [ 7] 2267 	ld	d,#0x00
   5243 21 0E 00      [10] 2268 	ld	hl,#0x000E
   5246 19            [11] 2269 	add	hl,de
   5247 4D            [ 4] 2270 	ld	c,l
   5248 44            [ 4] 2271 	ld	b,h
   5249 69            [ 4] 2272 	ld	l, c
   524A 78            [ 4] 2273 	ld	a,b
   524B 67            [ 4] 2274 	ld	h,a
   524C 07            [ 4] 2275 	rlca
   524D E6 01         [ 7] 2276 	and	a,#0x01
   524F DD 77 FD      [19] 2277 	ld	-3 (ix),a
   5252 7B            [ 4] 2278 	ld	a,e
   5253 C6 1D         [ 7] 2279 	add	a, #0x1D
   5255 DD 77 FB      [19] 2280 	ld	-5 (ix),a
   5258 7A            [ 4] 2281 	ld	a,d
   5259 CE 00         [ 7] 2282 	adc	a, #0x00
   525B DD 77 FC      [19] 2283 	ld	-4 (ix),a
   525E DD 7E FD      [19] 2284 	ld	a,-3 (ix)
   5261 B7            [ 4] 2285 	or	a, a
   5262 28 06         [12] 2286 	jr	Z,00109$
   5264 DD 6E FB      [19] 2287 	ld	l,-5 (ix)
   5267 DD 66 FC      [19] 2288 	ld	h,-4 (ix)
   526A                    2289 00109$:
   526A CB 2C         [ 8] 2290 	sra	h
   526C CB 1D         [ 8] 2291 	rr	l
   526E CB 2C         [ 8] 2292 	sra	h
   5270 CB 1D         [ 8] 2293 	rr	l
   5272 CB 2C         [ 8] 2294 	sra	h
   5274 CB 1D         [ 8] 2295 	rr	l
   5276 CB 2C         [ 8] 2296 	sra	h
   5278 CB 1D         [ 8] 2297 	rr	l
   527A 5D            [ 4] 2298 	ld	e, l
   527B 54            [ 4] 2299 	ld	d, h
   527C 29            [11] 2300 	add	hl, hl
   527D 29            [11] 2301 	add	hl, hl
   527E 19            [11] 2302 	add	hl, de
   527F 29            [11] 2303 	add	hl, hl
   5280 29            [11] 2304 	add	hl, hl
   5281 11 DC 6A      [10] 2305 	ld	de,#_scene
   5284 19            [11] 2306 	add	hl,de
   5285 DD 5E FA      [19] 2307 	ld	e,-6 (ix)
   5288 16 00         [ 7] 2308 	ld	d,#0x00
   528A 19            [11] 2309 	add	hl,de
   528B DD 7E F6      [19] 2310 	ld	a,-10 (ix)
   528E 96            [ 7] 2311 	sub	a,(hl)
   528F 20 52         [12] 2312 	jr	NZ,00101$
                           2313 ;src/ia.h:75: || scene[(enemy.y+tileheight-2)/tileheight][(enemy.x+tilewidth-1)/tilewidth] != enemy.room
   5291 DD 7E FD      [19] 2314 	ld	a,-3 (ix)
   5294 B7            [ 4] 2315 	or	a, a
   5295 28 06         [12] 2316 	jr	Z,00110$
   5297 DD 4E FB      [19] 2317 	ld	c,-5 (ix)
   529A DD 46 FC      [19] 2318 	ld	b,-4 (ix)
   529D                    2319 00110$:
   529D CB 28         [ 8] 2320 	sra	b
   529F CB 19         [ 8] 2321 	rr	c
   52A1 CB 28         [ 8] 2322 	sra	b
   52A3 CB 19         [ 8] 2323 	rr	c
   52A5 CB 28         [ 8] 2324 	sra	b
   52A7 CB 19         [ 8] 2325 	rr	c
   52A9 CB 28         [ 8] 2326 	sra	b
   52AB CB 19         [ 8] 2327 	rr	c
   52AD 69            [ 4] 2328 	ld	l, c
   52AE 60            [ 4] 2329 	ld	h, b
   52AF 29            [11] 2330 	add	hl, hl
   52B0 29            [11] 2331 	add	hl, hl
   52B1 09            [11] 2332 	add	hl, bc
   52B2 29            [11] 2333 	add	hl, hl
   52B3 29            [11] 2334 	add	hl, hl
   52B4 3E DC         [ 7] 2335 	ld	a,#<(_scene)
   52B6 85            [ 4] 2336 	add	a, l
   52B7 DD 77 FD      [19] 2337 	ld	-3 (ix),a
   52BA 3E 6A         [ 7] 2338 	ld	a,#>(_scene)
   52BC 8C            [ 4] 2339 	adc	a, h
   52BD DD 77 FE      [19] 2340 	ld	-2 (ix),a
   52C0 D1            [10] 2341 	pop	de
   52C1 D5            [11] 2342 	push	de
   52C2 DD 7E F9      [19] 2343 	ld	a,-7 (ix)
   52C5 B7            [ 4] 2344 	or	a, a
   52C6 28 06         [12] 2345 	jr	Z,00111$
   52C8 DD 5E F7      [19] 2346 	ld	e,-9 (ix)
   52CB DD 56 F8      [19] 2347 	ld	d,-8 (ix)
   52CE                    2348 00111$:
   52CE CB 2A         [ 8] 2349 	sra	d
   52D0 CB 1B         [ 8] 2350 	rr	e
   52D2 CB 2A         [ 8] 2351 	sra	d
   52D4 CB 1B         [ 8] 2352 	rr	e
   52D6 DD 6E FD      [19] 2353 	ld	l,-3 (ix)
   52D9 DD 66 FE      [19] 2354 	ld	h,-2 (ix)
   52DC 19            [11] 2355 	add	hl,de
   52DD DD 7E F6      [19] 2356 	ld	a,-10 (ix)
   52E0 96            [ 7] 2357 	sub	a,(hl)
   52E1 28 0C         [12] 2358 	jr	Z,00106$
   52E3                    2359 00101$:
                           2360 ;src/ia.h:77: enemy.x=enemy.lx;
   52E3 3A EC 6B      [13] 2361 	ld	a, (#_enemy + 2)
   52E6 32 EA 6B      [13] 2362 	ld	(#_enemy),a
                           2363 ;src/ia.h:78: enemy.y=enemy.ly;
   52E9 3A ED 6B      [13] 2364 	ld	a, (#_enemy + 3)
   52EC 32 EB 6B      [13] 2365 	ld	(#(_enemy + 0x0001)),a
   52EF                    2366 00106$:
   52EF DD F9         [10] 2367 	ld	sp, ix
   52F1 DD E1         [14] 2368 	pop	ix
   52F3 C9            [10] 2369 	ret
                           2370 ;src/ia.h:82: u8 vissionSensor(){
                           2371 ;	---------------------------------
                           2372 ; Function vissionSensor
                           2373 ; ---------------------------------
   52F4                    2374 _vissionSensor::
   52F4 DD E5         [15] 2375 	push	ix
   52F6 DD 21 00 00   [14] 2376 	ld	ix,#0
   52FA DD 39         [15] 2377 	add	ix,sp
   52FC 21 F9 FF      [10] 2378 	ld	hl,#-7
   52FF 39            [11] 2379 	add	hl,sp
   5300 F9            [ 6] 2380 	ld	sp,hl
                           2381 ;src/ia.h:83: u8 following = 0;
   5301 DD 36 FB 00   [19] 2382 	ld	-5 (ix),#0x00
                           2383 ;src/ia.h:84: u8 cx = enemy.x/tilewidth;
   5305 3A EA 6B      [13] 2384 	ld	a, (#_enemy + 0)
   5308 0F            [ 4] 2385 	rrca
   5309 0F            [ 4] 2386 	rrca
   530A E6 3F         [ 7] 2387 	and	a,#0x3F
   530C DD 77 FC      [19] 2388 	ld	-4 (ix),a
                           2389 ;src/ia.h:85: u8 cy = enemy.y/tilewidth;
   530F 3A EB 6B      [13] 2390 	ld	a, (#(_enemy + 0x0001) + 0)
   5312 0F            [ 4] 2391 	rrca
   5313 0F            [ 4] 2392 	rrca
   5314 E6 3F         [ 7] 2393 	and	a,#0x3F
   5316 4F            [ 4] 2394 	ld	c,a
                           2395 ;src/ia.h:86: u8 pcx = player.x/tilewidth;
   5317 3A DF 6B      [13] 2396 	ld	a, (#_player + 0)
   531A 0F            [ 4] 2397 	rrca
   531B 0F            [ 4] 2398 	rrca
   531C E6 3F         [ 7] 2399 	and	a,#0x3F
   531E DD 77 FE      [19] 2400 	ld	-2 (ix),a
                           2401 ;src/ia.h:87: u8 pcy = player.y/tilewidth;
   5321 3A E0 6B      [13] 2402 	ld	a, (#(_player + 0x0001) + 0)
   5324 0F            [ 4] 2403 	rrca
   5325 0F            [ 4] 2404 	rrca
   5326 E6 3F         [ 7] 2405 	and	a,#0x3F
   5328 DD 77 FD      [19] 2406 	ld	-3 (ix),a
                           2407 ;src/ia.h:90: for(i=0;i<3;i++){
   532B 1E 00         [ 7] 2408 	ld	e,#0x00
   532D                    2409 00107$:
                           2410 ;src/ia.h:91: lex = cx - i;
   532D DD 7E FC      [19] 2411 	ld	a,-4 (ix)
   5330 93            [ 4] 2412 	sub	a, e
   5331 DD 77 FA      [19] 2413 	ld	-6 (ix),a
                           2414 ;src/ia.h:92: ley = cy - i;
   5334 79            [ 4] 2415 	ld	a,c
   5335 93            [ 4] 2416 	sub	a, e
   5336 DD 77 FF      [19] 2417 	ld	-1 (ix),a
                           2418 ;src/ia.h:93: mex = cx + i;
   5339 DD 7E FC      [19] 2419 	ld	a,-4 (ix)
   533C 83            [ 4] 2420 	add	a, e
   533D DD 77 F9      [19] 2421 	ld	-7 (ix),a
                           2422 ;src/ia.h:94: mey = cy + i;
   5340 79            [ 4] 2423 	ld	a,c
   5341 83            [ 4] 2424 	add	a, e
   5342 57            [ 4] 2425 	ld	d,a
                           2426 ;src/ia.h:95: if(lex == pcx || ley == pcy || mex == pcx || mey == pcy){
   5343 DD 7E FA      [19] 2427 	ld	a,-6 (ix)
   5346 DD 96 FE      [19] 2428 	sub	a, -2 (ix)
   5349 28 16         [12] 2429 	jr	Z,00101$
   534B DD 7E FF      [19] 2430 	ld	a,-1 (ix)
   534E DD 96 FD      [19] 2431 	sub	a, -3 (ix)
   5351 28 0E         [12] 2432 	jr	Z,00101$
   5353 DD 7E F9      [19] 2433 	ld	a,-7 (ix)
   5356 DD 96 FE      [19] 2434 	sub	a, -2 (ix)
   5359 28 06         [12] 2435 	jr	Z,00101$
   535B DD 7E FD      [19] 2436 	ld	a,-3 (ix)
   535E 92            [ 4] 2437 	sub	a, d
   535F 20 04         [12] 2438 	jr	NZ,00108$
   5361                    2439 00101$:
                           2440 ;src/ia.h:96: following = 1;
   5361 DD 36 FB 01   [19] 2441 	ld	-5 (ix),#0x01
   5365                    2442 00108$:
                           2443 ;src/ia.h:90: for(i=0;i<3;i++){
   5365 1C            [ 4] 2444 	inc	e
   5366 7B            [ 4] 2445 	ld	a,e
   5367 D6 03         [ 7] 2446 	sub	a, #0x03
   5369 38 C2         [12] 2447 	jr	C,00107$
                           2448 ;src/ia.h:100: return following;
   536B DD 6E FB      [19] 2449 	ld	l,-5 (ix)
   536E DD F9         [10] 2450 	ld	sp, ix
   5370 DD E1         [14] 2451 	pop	ix
   5372 C9            [10] 2452 	ret
                           2453 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           2454 ;	---------------------------------
                           2455 ; Function checkCollisions
                           2456 ; ---------------------------------
   5373                    2457 _checkCollisions::
   5373 DD E5         [15] 2458 	push	ix
   5375 DD 21 00 00   [14] 2459 	ld	ix,#0
   5379 DD 39         [15] 2460 	add	ix,sp
   537B 21 FA FF      [10] 2461 	ld	hl,#-6
   537E 39            [11] 2462 	add	hl,sp
   537F F9            [ 6] 2463 	ld	sp,hl
                           2464 ;src/CalcColision.h:8: u8 popX = pX + tilewidth;
   5380 DD 6E 04      [19] 2465 	ld	l,4 (ix)
   5383 2C            [ 4] 2466 	inc	l
   5384 2C            [ 4] 2467 	inc	l
   5385 2C            [ 4] 2468 	inc	l
   5386 2C            [ 4] 2469 	inc	l
                           2470 ;src/CalcColision.h:9: u8 popY = pY + tileheight;
   5387 DD 7E 05      [19] 2471 	ld	a,5 (ix)
   538A C6 10         [ 7] 2472 	add	a, #0x10
   538C DD 77 FB      [19] 2473 	ld	-5 (ix),a
                           2474 ;src/CalcColision.h:10: u8 eopX = eX + tilewidth;
   538F DD 5E 06      [19] 2475 	ld	e,6 (ix)
   5392 1C            [ 4] 2476 	inc	e
   5393 1C            [ 4] 2477 	inc	e
   5394 1C            [ 4] 2478 	inc	e
   5395 1C            [ 4] 2479 	inc	e
                           2480 ;src/CalcColision.h:11: u8 eopY = eY + tileheight;
   5396 DD 7E 07      [19] 2481 	ld	a,7 (ix)
   5399 C6 10         [ 7] 2482 	add	a, #0x10
   539B DD 77 FA      [19] 2483 	ld	-6 (ix),a
                           2484 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   539E 7B            [ 4] 2485 	ld	a,e
   539F DD 96 04      [19] 2486 	sub	a, 4 (ix)
   53A2 3E 00         [ 7] 2487 	ld	a,#0x00
   53A4 17            [ 4] 2488 	rla
   53A5 DD 77 FF      [19] 2489 	ld	-1 (ix),a
   53A8 7D            [ 4] 2490 	ld	a,l
   53A9 93            [ 4] 2491 	sub	a, e
   53AA 3E 00         [ 7] 2492 	ld	a,#0x00
   53AC 17            [ 4] 2493 	rla
   53AD DD 77 FE      [19] 2494 	ld	-2 (ix),a
   53B0 DD 7E 07      [19] 2495 	ld	a,7 (ix)
   53B3 DD 96 05      [19] 2496 	sub	a, 5 (ix)
   53B6 3E 00         [ 7] 2497 	ld	a,#0x00
   53B8 17            [ 4] 2498 	rla
   53B9 5F            [ 4] 2499 	ld	e,a
   53BA DD 7E FB      [19] 2500 	ld	a,-5 (ix)
   53BD DD 96 07      [19] 2501 	sub	a, 7 (ix)
   53C0 3E 00         [ 7] 2502 	ld	a,#0x00
   53C2 17            [ 4] 2503 	rla
   53C3 4F            [ 4] 2504 	ld	c,a
                           2505 ;src/CalcColision.h:14: if(atk >= 21)
   53C4 DD 7E 08      [19] 2506 	ld	a,8 (ix)
   53C7 D6 15         [ 7] 2507 	sub	a, #0x15
   53C9 3E 00         [ 7] 2508 	ld	a,#0x00
   53CB 17            [ 4] 2509 	rla
   53CC DD 77 FD      [19] 2510 	ld	-3 (ix),a
                           2511 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   53CF DD 7E FF      [19] 2512 	ld	a,-1 (ix)
   53D2 B7            [ 4] 2513 	or	a, a
   53D3 20 1C         [12] 2514 	jr	NZ,00105$
   53D5 DD 7E FE      [19] 2515 	ld	a,-2 (ix)
   53D8 B7            [ 4] 2516 	or	a,a
   53D9 20 16         [12] 2517 	jr	NZ,00105$
   53DB B3            [ 4] 2518 	or	a,e
   53DC 20 13         [12] 2519 	jr	NZ,00105$
   53DE B1            [ 4] 2520 	or	a,c
   53DF 20 10         [12] 2521 	jr	NZ,00105$
                           2522 ;src/CalcColision.h:14: if(atk >= 21)
   53E1 DD 7E FD      [19] 2523 	ld	a,-3 (ix)
   53E4 B7            [ 4] 2524 	or	a, a
   53E5 20 05         [12] 2525 	jr	NZ,00102$
                           2526 ;src/CalcColision.h:15: return 1;
   53E7 2E 01         [ 7] 2527 	ld	l,#0x01
   53E9 C3 75 54      [10] 2528 	jp	00133$
   53EC                    2529 00102$:
                           2530 ;src/CalcColision.h:17: return 2;
   53EC 2E 02         [ 7] 2531 	ld	l,#0x02
   53EE C3 75 54      [10] 2532 	jp	00133$
   53F1                    2533 00105$:
                           2534 ;src/CalcColision.h:19: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   53F1 DD 7E 06      [19] 2535 	ld	a,6 (ix)
   53F4 DD 96 04      [19] 2536 	sub	a, 4 (ix)
   53F7 3E 00         [ 7] 2537 	ld	a,#0x00
   53F9 17            [ 4] 2538 	rla
   53FA DD 77 FC      [19] 2539 	ld	-4 (ix),a
   53FD 7D            [ 4] 2540 	ld	a,l
   53FE DD 96 06      [19] 2541 	sub	a, 6 (ix)
   5401 3E 00         [ 7] 2542 	ld	a,#0x00
   5403 17            [ 4] 2543 	rla
   5404 6F            [ 4] 2544 	ld	l,a
   5405 DD 7E FC      [19] 2545 	ld	a,-4 (ix)
   5408 B7            [ 4] 2546 	or	a,a
   5409 20 17         [12] 2547 	jr	NZ,00113$
   540B B5            [ 4] 2548 	or	a,l
   540C 20 14         [12] 2549 	jr	NZ,00113$
   540E B3            [ 4] 2550 	or	a,e
   540F 20 11         [12] 2551 	jr	NZ,00113$
   5411 B1            [ 4] 2552 	or	a,c
   5412 20 0E         [12] 2553 	jr	NZ,00113$
                           2554 ;src/CalcColision.h:20: if(atk >= 21)
   5414 DD 7E FD      [19] 2555 	ld	a,-3 (ix)
   5417 B7            [ 4] 2556 	or	a, a
   5418 20 04         [12] 2557 	jr	NZ,00110$
                           2558 ;src/CalcColision.h:21: return 1;
   541A 2E 01         [ 7] 2559 	ld	l,#0x01
   541C 18 57         [12] 2560 	jr	00133$
   541E                    2561 00110$:
                           2562 ;src/CalcColision.h:23: return 2;
   541E 2E 02         [ 7] 2563 	ld	l,#0x02
   5420 18 53         [12] 2564 	jr	00133$
   5422                    2565 00113$:
                           2566 ;src/CalcColision.h:25: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   5422 DD 7E FA      [19] 2567 	ld	a,-6 (ix)
   5425 DD 96 05      [19] 2568 	sub	a, 5 (ix)
   5428 3E 00         [ 7] 2569 	ld	a,#0x00
   542A 17            [ 4] 2570 	rla
   542B 5F            [ 4] 2571 	ld	e,a
   542C DD 7E FB      [19] 2572 	ld	a,-5 (ix)
   542F DD 96 FA      [19] 2573 	sub	a, -6 (ix)
   5432 3E 00         [ 7] 2574 	ld	a,#0x00
   5434 17            [ 4] 2575 	rla
   5435 67            [ 4] 2576 	ld	h,a
   5436 DD 7E FC      [19] 2577 	ld	a,-4 (ix)
   5439 B7            [ 4] 2578 	or	a,a
   543A 20 17         [12] 2579 	jr	NZ,00121$
   543C B5            [ 4] 2580 	or	a,l
   543D 20 14         [12] 2581 	jr	NZ,00121$
   543F B3            [ 4] 2582 	or	a,e
   5440 20 11         [12] 2583 	jr	NZ,00121$
   5442 B4            [ 4] 2584 	or	a,h
   5443 20 0E         [12] 2585 	jr	NZ,00121$
                           2586 ;src/CalcColision.h:26: if(atk >= 21)
   5445 DD 7E FD      [19] 2587 	ld	a,-3 (ix)
   5448 B7            [ 4] 2588 	or	a, a
   5449 20 04         [12] 2589 	jr	NZ,00118$
                           2590 ;src/CalcColision.h:27: return 1;
   544B 2E 01         [ 7] 2591 	ld	l,#0x01
   544D 18 26         [12] 2592 	jr	00133$
   544F                    2593 00118$:
                           2594 ;src/CalcColision.h:29: return 2;
   544F 2E 02         [ 7] 2595 	ld	l,#0x02
   5451 18 22         [12] 2596 	jr	00133$
   5453                    2597 00121$:
                           2598 ;src/CalcColision.h:31: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   5453 DD 7E FF      [19] 2599 	ld	a,-1 (ix)
   5456 B7            [ 4] 2600 	or	a, a
   5457 20 1A         [12] 2601 	jr	NZ,00129$
   5459 DD 7E FE      [19] 2602 	ld	a,-2 (ix)
   545C B7            [ 4] 2603 	or	a,a
   545D 20 14         [12] 2604 	jr	NZ,00129$
   545F B3            [ 4] 2605 	or	a,e
   5460 20 11         [12] 2606 	jr	NZ,00129$
   5462 B4            [ 4] 2607 	or	a,h
   5463 20 0E         [12] 2608 	jr	NZ,00129$
                           2609 ;src/CalcColision.h:32: if(atk >= 21)
   5465 DD 7E FD      [19] 2610 	ld	a,-3 (ix)
   5468 B7            [ 4] 2611 	or	a, a
   5469 20 04         [12] 2612 	jr	NZ,00126$
                           2613 ;src/CalcColision.h:33: return 1;
   546B 2E 01         [ 7] 2614 	ld	l,#0x01
   546D 18 06         [12] 2615 	jr	00133$
   546F                    2616 00126$:
                           2617 ;src/CalcColision.h:35: return 2;
   546F 2E 02         [ 7] 2618 	ld	l,#0x02
   5471 18 02         [12] 2619 	jr	00133$
   5473                    2620 00129$:
                           2621 ;src/CalcColision.h:37: return 0;
   5473 2E 00         [ 7] 2622 	ld	l,#0x00
   5475                    2623 00133$:
   5475 DD F9         [10] 2624 	ld	sp, ix
   5477 DD E1         [14] 2625 	pop	ix
   5479 C9            [10] 2626 	ret
                           2627 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2628 ;	---------------------------------
                           2629 ; Function checkKeyboard
                           2630 ; ---------------------------------
   547A                    2631 _checkKeyboard::
   547A DD E5         [15] 2632 	push	ix
   547C DD 21 00 00   [14] 2633 	ld	ix,#0
   5480 DD 39         [15] 2634 	add	ix,sp
   5482 21 FA FF      [10] 2635 	ld	hl,#-6
   5485 39            [11] 2636 	add	hl,sp
   5486 F9            [ 6] 2637 	ld	sp,hl
                           2638 ;src/keyboard.h:14: u8 *s = NULL;
   5487 DD 36 FE 00   [19] 2639 	ld	-2 (ix),#0x00
   548B DD 36 FF 00   [19] 2640 	ld	-1 (ix),#0x00
                           2641 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   548F 21 05 80      [10] 2642 	ld	hl,#0x8005
   5492 CD BD 66      [17] 2643 	call	_cpct_isKeyPressed
   5495 7D            [ 4] 2644 	ld	a,l
   5496 B7            [ 4] 2645 	or	a, a
   5497 28 68         [12] 2646 	jr	Z,00147$
   5499 21 E7 6B      [10] 2647 	ld	hl, #(_player + 0x0008) + 0
   549C 7E            [ 7] 2648 	ld	a,(hl)
   549D DD 77 FD      [19] 2649 	ld	-3 (ix), a
   54A0 D6 14         [ 7] 2650 	sub	a, #0x14
   54A2 38 5D         [12] 2651 	jr	C,00147$
                           2652 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   54A4 DD 7E FD      [19] 2653 	ld	a,-3 (ix)
   54A7 D6 32         [ 7] 2654 	sub	a, #0x32
   54A9 38 07         [12] 2655 	jr	C,00102$
   54AB 21 E7 6B      [10] 2656 	ld	hl,#(_player + 0x0008)
   54AE 36 00         [10] 2657 	ld	(hl),#0x00
   54B0 18 08         [12] 2658 	jr	00103$
   54B2                    2659 00102$:
                           2660 ;src/keyboard.h:17: else player.atk += 1;
   54B2 DD 7E FD      [19] 2661 	ld	a,-3 (ix)
   54B5 3C            [ 4] 2662 	inc	a
   54B6 21 E7 6B      [10] 2663 	ld	hl,#(_player + 0x0008)
   54B9 77            [ 7] 2664 	ld	(hl),a
   54BA                    2665 00103$:
                           2666 ;src/keyboard.h:18: switch(player.dir){
   54BA 21 E6 6B      [10] 2667 	ld	hl, #_player + 7
   54BD 66            [ 7] 2668 	ld	h,(hl)
   54BE 7C            [ 4] 2669 	ld	a,h
   54BF D6 02         [ 7] 2670 	sub	a, #0x02
   54C1 28 33         [12] 2671 	jr	Z,00107$
   54C3 7C            [ 4] 2672 	ld	a,h
   54C4 D6 04         [ 7] 2673 	sub	a, #0x04
   54C6 28 0D         [12] 2674 	jr	Z,00104$
   54C8 7C            [ 4] 2675 	ld	a,h
   54C9 D6 06         [ 7] 2676 	sub	a, #0x06
   54CB 28 13         [12] 2677 	jr	Z,00105$
   54CD 7C            [ 4] 2678 	ld	a,h
   54CE D6 08         [ 7] 2679 	sub	a, #0x08
   54D0 28 19         [12] 2680 	jr	Z,00106$
   54D2 C3 C8 56      [10] 2681 	jp	00148$
                           2682 ;src/keyboard.h:19: case 4:
   54D5                    2683 00104$:
                           2684 ;src/keyboard.h:20: s = gladis_atk_izda;
   54D5 DD 36 FE 80   [19] 2685 	ld	-2 (ix),#<(_gladis_atk_izda)
   54D9 DD 36 FF 41   [19] 2686 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2687 ;src/keyboard.h:21: break;
   54DD C3 C8 56      [10] 2688 	jp	00148$
                           2689 ;src/keyboard.h:22: case 6:
   54E0                    2690 00105$:
                           2691 ;src/keyboard.h:23: s = gladis_atk_dcha;
   54E0 DD 36 FE 00   [19] 2692 	ld	-2 (ix),#<(_gladis_atk_dcha)
   54E4 DD 36 FF 41   [19] 2693 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2694 ;src/keyboard.h:24: break;
   54E8 C3 C8 56      [10] 2695 	jp	00148$
                           2696 ;src/keyboard.h:25: case 8:
   54EB                    2697 00106$:
                           2698 ;src/keyboard.h:26: s = gladis_atk_arriba;
   54EB DD 36 FE 80   [19] 2699 	ld	-2 (ix),#<(_gladis_atk_arriba)
   54EF DD 36 FF 43   [19] 2700 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2701 ;src/keyboard.h:27: break;
   54F3 C3 C8 56      [10] 2702 	jp	00148$
                           2703 ;src/keyboard.h:28: case 2:
   54F6                    2704 00107$:
                           2705 ;src/keyboard.h:29: s = gladis_atk_abajo;
   54F6 DD 36 FE 00   [19] 2706 	ld	-2 (ix),#<(_gladis_atk_abajo)
   54FA DD 36 FF 43   [19] 2707 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2708 ;src/keyboard.h:31: }
   54FE C3 C8 56      [10] 2709 	jp	00148$
   5501                    2710 00147$:
                           2711 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   5501 21 E7 6B      [10] 2712 	ld	hl, #(_player + 0x0008) + 0
   5504 56            [ 7] 2713 	ld	d,(hl)
   5505 7A            [ 4] 2714 	ld	a,d
   5506 D6 14         [ 7] 2715 	sub	a, #0x14
   5508 30 07         [12] 2716 	jr	NC,00110$
   550A 14            [ 4] 2717 	inc	d
   550B 21 E7 6B      [10] 2718 	ld	hl,#(_player + 0x0008)
   550E 72            [ 7] 2719 	ld	(hl),d
   550F 18 05         [12] 2720 	jr	00111$
   5511                    2721 00110$:
                           2722 ;src/keyboard.h:34: else player.atk = 20;
   5511 21 E7 6B      [10] 2723 	ld	hl,#(_player + 0x0008)
   5514 36 14         [10] 2724 	ld	(hl),#0x14
   5516                    2725 00111$:
                           2726 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5516 21 00 02      [10] 2727 	ld	hl,#0x0200
   5519 CD BD 66      [17] 2728 	call	_cpct_isKeyPressed
                           2729 ;src/keyboard.h:37: player.dir = 6;
                           2730 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   551C 7D            [ 4] 2731 	ld	a,l
   551D B7            [ 4] 2732 	or	a, a
   551E 28 1E         [12] 2733 	jr	Z,00143$
   5520 21 DF 6B      [10] 2734 	ld	hl, #_player + 0
   5523 56            [ 7] 2735 	ld	d,(hl)
   5524 7A            [ 4] 2736 	ld	a,d
   5525 D6 4C         [ 7] 2737 	sub	a, #0x4C
   5527 30 15         [12] 2738 	jr	NC,00143$
                           2739 ;src/keyboard.h:36: player.x += 1;
   5529 14            [ 4] 2740 	inc	d
   552A 21 DF 6B      [10] 2741 	ld	hl,#_player
   552D 72            [ 7] 2742 	ld	(hl),d
                           2743 ;src/keyboard.h:37: player.dir = 6;
   552E 21 E6 6B      [10] 2744 	ld	hl,#(_player + 0x0007)
   5531 36 06         [10] 2745 	ld	(hl),#0x06
                           2746 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   5533 DD 36 FE 00   [19] 2747 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   5537 DD 36 FF 40   [19] 2748 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   553B C3 C8 56      [10] 2749 	jp	00148$
   553E                    2750 00143$:
                           2751 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   553E 21 01 01      [10] 2752 	ld	hl,#0x0101
   5541 CD BD 66      [17] 2753 	call	_cpct_isKeyPressed
   5544 7D            [ 4] 2754 	ld	a,l
   5545 B7            [ 4] 2755 	or	a, a
   5546 28 1B         [12] 2756 	jr	Z,00139$
   5548 3A DF 6B      [13] 2757 	ld	a, (#_player + 0)
   554B B7            [ 4] 2758 	or	a, a
   554C 28 15         [12] 2759 	jr	Z,00139$
                           2760 ;src/keyboard.h:40: player.x -= 1;
   554E C6 FF         [ 7] 2761 	add	a,#0xFF
   5550 32 DF 6B      [13] 2762 	ld	(#_player),a
                           2763 ;src/keyboard.h:41: player.dir = 4;
   5553 21 E6 6B      [10] 2764 	ld	hl,#(_player + 0x0007)
   5556 36 04         [10] 2765 	ld	(hl),#0x04
                           2766 ;src/keyboard.h:42: s = gladis_quieto_izda;
   5558 DD 36 FE 80   [19] 2767 	ld	-2 (ix),#<(_gladis_quieto_izda)
   555C DD 36 FF 40   [19] 2768 	ld	-1 (ix),#>(_gladis_quieto_izda)
   5560 C3 C8 56      [10] 2769 	jp	00148$
   5563                    2770 00139$:
                           2771 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   5563 21 00 04      [10] 2772 	ld	hl,#0x0400
   5566 CD BD 66      [17] 2773 	call	_cpct_isKeyPressed
   5569 01 E0 6B      [10] 2774 	ld	bc,#_player + 1
   556C 7D            [ 4] 2775 	ld	a,l
   556D B7            [ 4] 2776 	or	a, a
   556E 28 1A         [12] 2777 	jr	Z,00135$
   5570 0A            [ 7] 2778 	ld	a,(bc)
   5571 67            [ 4] 2779 	ld	h,a
   5572 D6 B4         [ 7] 2780 	sub	a, #0xB4
   5574 30 14         [12] 2781 	jr	NC,00135$
                           2782 ;src/keyboard.h:44: player.y += 2;
   5576 7C            [ 4] 2783 	ld	a,h
   5577 C6 02         [ 7] 2784 	add	a, #0x02
   5579 02            [ 7] 2785 	ld	(bc),a
                           2786 ;src/keyboard.h:45: player.dir = 2;
   557A 21 E6 6B      [10] 2787 	ld	hl,#(_player + 0x0007)
   557D 36 02         [10] 2788 	ld	(hl),#0x02
                           2789 ;src/keyboard.h:46: s = gladis_abajo;
   557F DD 36 FE 80   [19] 2790 	ld	-2 (ix),#<(_gladis_abajo)
   5583 DD 36 FF 42   [19] 2791 	ld	-1 (ix),#>(_gladis_abajo)
   5587 C3 C8 56      [10] 2792 	jp	00148$
   558A                    2793 00135$:
                           2794 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   558A C5            [11] 2795 	push	bc
   558B 21 00 01      [10] 2796 	ld	hl,#0x0100
   558E CD BD 66      [17] 2797 	call	_cpct_isKeyPressed
   5591 7D            [ 4] 2798 	ld	a,l
   5592 C1            [10] 2799 	pop	bc
   5593 B7            [ 4] 2800 	or	a, a
   5594 28 17         [12] 2801 	jr	Z,00131$
   5596 0A            [ 7] 2802 	ld	a,(bc)
   5597 B7            [ 4] 2803 	or	a, a
   5598 28 13         [12] 2804 	jr	Z,00131$
                           2805 ;src/keyboard.h:48: player.y -= 2;
   559A C6 FE         [ 7] 2806 	add	a,#0xFE
   559C 02            [ 7] 2807 	ld	(bc),a
                           2808 ;src/keyboard.h:49: player.dir = 8;
   559D 21 E6 6B      [10] 2809 	ld	hl,#(_player + 0x0007)
   55A0 36 08         [10] 2810 	ld	(hl),#0x08
                           2811 ;src/keyboard.h:50: s = gladis_arriba;
   55A2 DD 36 FE 00   [19] 2812 	ld	-2 (ix),#<(_gladis_arriba)
   55A6 DD 36 FF 42   [19] 2813 	ld	-1 (ix),#>(_gladis_arriba)
   55AA C3 C8 56      [10] 2814 	jp	00148$
   55AD                    2815 00131$:
                           2816 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   55AD C5            [11] 2817 	push	bc
   55AE 21 07 80      [10] 2818 	ld	hl,#0x8007
   55B1 CD BD 66      [17] 2819 	call	_cpct_isKeyPressed
   55B4 7D            [ 4] 2820 	ld	a,l
   55B5 C1            [10] 2821 	pop	bc
   55B6 B7            [ 4] 2822 	or	a, a
   55B7 CA 88 56      [10] 2823 	jp	Z,00125$
   55BA 3A D1 6B      [13] 2824 	ld	a,(#_arrow + 0)
   55BD B7            [ 4] 2825 	or	a, a
   55BE C2 88 56      [10] 2826 	jp	NZ,00125$
   55C1 3A E7 6B      [13] 2827 	ld	a, (#(_player + 0x0008) + 0)
   55C4 D6 14         [ 7] 2828 	sub	a, #0x14
   55C6 C2 88 56      [10] 2829 	jp	NZ,00125$
   55C9 3A E9 6B      [13] 2830 	ld	a, (#(_player + 0x000a) + 0)
   55CC B7            [ 4] 2831 	or	a, a
   55CD CA 88 56      [10] 2832 	jp	Z,00125$
                           2833 ;src/keyboard.h:52: if(player.bullets> 0){
   55D0 B7            [ 4] 2834 	or	a, a
   55D1 CA 81 56      [10] 2835 	jp	Z,00118$
                           2836 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   55D4 DD 36 FB 59   [19] 2837 	ld	-5 (ix),#<(_flecha_dcha)
   55D8 DD 36 FC 66   [19] 2838 	ld	-4 (ix),#>(_flecha_dcha)
   55DC DD 36 FA 02   [19] 2839 	ld	-6 (ix),#0x02
   55E0 1E 08         [ 7] 2840 	ld	e,#0x08
                           2841 ;src/keyboard.h:54: switch(player.dir){
   55E2 21 E6 6B      [10] 2842 	ld	hl, #(_player + 0x0007) + 0
   55E5 56            [ 7] 2843 	ld	d,(hl)
   55E6 7A            [ 4] 2844 	ld	a,d
   55E7 D6 02         [ 7] 2845 	sub	a, #0x02
   55E9 28 31         [12] 2846 	jr	Z,00114$
   55EB 7A            [ 4] 2847 	ld	a,d
   55EC D6 04         [ 7] 2848 	sub	a, #0x04
   55EE 28 1C         [12] 2849 	jr	Z,00113$
   55F0 7A            [ 4] 2850 	ld	a,d
   55F1 D6 06         [ 7] 2851 	sub	a, #0x06
   55F3 28 07         [12] 2852 	jr	Z,00112$
   55F5 7A            [ 4] 2853 	ld	a,d
   55F6 D6 08         [ 7] 2854 	sub	a, #0x08
   55F8 28 32         [12] 2855 	jr	Z,00115$
   55FA 18 3E         [12] 2856 	jr	00116$
                           2857 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   55FC                    2858 00112$:
   55FC DD 36 FB 59   [19] 2859 	ld	-5 (ix),#<(_flecha_dcha)
   5600 DD 36 FC 66   [19] 2860 	ld	-4 (ix),#>(_flecha_dcha)
   5604 DD 36 FA 04   [19] 2861 	ld	-6 (ix),#0x04
   5608 1E 04         [ 7] 2862 	ld	e,#0x04
   560A 18 2E         [12] 2863 	jr	00116$
                           2864 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   560C                    2865 00113$:
   560C DD 36 FB 79   [19] 2866 	ld	-5 (ix),#<(_flecha_izda)
   5610 DD 36 FC 66   [19] 2867 	ld	-4 (ix),#>(_flecha_izda)
   5614 DD 36 FA 04   [19] 2868 	ld	-6 (ix),#0x04
   5618 1E 04         [ 7] 2869 	ld	e,#0x04
   561A 18 1E         [12] 2870 	jr	00116$
                           2871 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   561C                    2872 00114$:
   561C DD 36 FB 39   [19] 2873 	ld	-5 (ix),#<(_flecha_abajo)
   5620 DD 36 FC 66   [19] 2874 	ld	-4 (ix),#>(_flecha_abajo)
   5624 DD 36 FA 02   [19] 2875 	ld	-6 (ix),#0x02
   5628 1E 08         [ 7] 2876 	ld	e,#0x08
   562A 18 0E         [12] 2877 	jr	00116$
                           2878 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   562C                    2879 00115$:
   562C DD 36 FB 19   [19] 2880 	ld	-5 (ix),#<(_flecha_arriba)
   5630 DD 36 FC 66   [19] 2881 	ld	-4 (ix),#>(_flecha_arriba)
   5634 DD 36 FA 02   [19] 2882 	ld	-6 (ix),#0x02
   5638 1E 08         [ 7] 2883 	ld	e,#0x08
                           2884 ;src/keyboard.h:59: }
   563A                    2885 00116$:
                           2886 ;src/keyboard.h:60: player.atk = 0;
   563A 21 E7 6B      [10] 2887 	ld	hl,#(_player + 0x0008)
   563D 36 00         [10] 2888 	ld	(hl),#0x00
                           2889 ;src/keyboard.h:61: object.x = player.x;
   563F 3A DF 6B      [13] 2890 	ld	a, (#_player + 0)
   5642 32 D5 6B      [13] 2891 	ld	(#_object),a
                           2892 ;src/keyboard.h:62: object.y = player.y+8;
   5645 0A            [ 7] 2893 	ld	a,(bc)
   5646 C6 08         [ 7] 2894 	add	a, #0x08
   5648 32 D6 6B      [13] 2895 	ld	(#(_object + 0x0001)),a
                           2896 ;src/keyboard.h:63: object.x = object.x;
   564B 21 D5 6B      [10] 2897 	ld	hl, #_object + 0
   564E 56            [ 7] 2898 	ld	d,(hl)
   564F 21 D5 6B      [10] 2899 	ld	hl,#_object
   5652 72            [ 7] 2900 	ld	(hl),d
                           2901 ;src/keyboard.h:64: object.y = object.y;
   5653 32 D6 6B      [13] 2902 	ld	(#(_object + 0x0001)),a
                           2903 ;src/keyboard.h:65: object.sprite = spr;
   5656 21 D9 6B      [10] 2904 	ld	hl,#_object + 4
   5659 DD 7E FB      [19] 2905 	ld	a,-5 (ix)
   565C 77            [ 7] 2906 	ld	(hl),a
   565D 23            [ 6] 2907 	inc	hl
   565E DD 7E FC      [19] 2908 	ld	a,-4 (ix)
   5661 77            [ 7] 2909 	ld	(hl),a
                           2910 ;src/keyboard.h:66: object.vivo = 1;
   5662 21 DB 6B      [10] 2911 	ld	hl,#_object + 6
   5665 36 01         [10] 2912 	ld	(hl),#0x01
                           2913 ;src/keyboard.h:67: object.dir = player.dir;
   5667 01 DC 6B      [10] 2914 	ld	bc,#_object + 7
   566A 3A E6 6B      [13] 2915 	ld	a, (#(_player + 0x0007) + 0)
   566D 02            [ 7] 2916 	ld	(bc),a
                           2917 ;src/keyboard.h:68: object.sizeX = xs;
   566E 21 DD 6B      [10] 2918 	ld	hl,#_object + 8
   5671 DD 7E FA      [19] 2919 	ld	a,-6 (ix)
   5674 77            [ 7] 2920 	ld	(hl),a
                           2921 ;src/keyboard.h:69: object.sizeY = ys;
   5675 21 DE 6B      [10] 2922 	ld	hl,#_object + 9
   5678 73            [ 7] 2923 	ld	(hl),e
                           2924 ;src/keyboard.h:70: player.bullets--;
   5679 3A E9 6B      [13] 2925 	ld	a, (#(_player + 0x000a) + 0)
   567C C6 FF         [ 7] 2926 	add	a,#0xFF
   567E 32 E9 6B      [13] 2927 	ld	(#(_player + 0x000a)),a
   5681                    2928 00118$:
                           2929 ;src/keyboard.h:72: arrow=1;
   5681 21 D1 6B      [10] 2930 	ld	hl,#_arrow + 0
   5684 36 01         [10] 2931 	ld	(hl), #0x01
   5686 18 40         [12] 2932 	jr	00148$
   5688                    2933 00125$:
                           2934 ;src/keyboard.h:74: switch(player.dir){
   5688 21 E6 6B      [10] 2935 	ld	hl, #(_player + 0x0007) + 0
   568B 66            [ 7] 2936 	ld	h,(hl)
   568C 7C            [ 4] 2937 	ld	a,h
   568D D6 02         [ 7] 2938 	sub	a, #0x02
   568F 28 2F         [12] 2939 	jr	Z,00122$
   5691 7C            [ 4] 2940 	ld	a,h
   5692 D6 04         [ 7] 2941 	sub	a, #0x04
   5694 28 0C         [12] 2942 	jr	Z,00119$
   5696 7C            [ 4] 2943 	ld	a,h
   5697 D6 06         [ 7] 2944 	sub	a, #0x06
   5699 28 11         [12] 2945 	jr	Z,00120$
   569B 7C            [ 4] 2946 	ld	a,h
   569C D6 08         [ 7] 2947 	sub	a, #0x08
   569E 28 16         [12] 2948 	jr	Z,00121$
   56A0 18 26         [12] 2949 	jr	00148$
                           2950 ;src/keyboard.h:75: case 4:
   56A2                    2951 00119$:
                           2952 ;src/keyboard.h:76: s = gladis_quieto_izda;
   56A2 DD 36 FE 80   [19] 2953 	ld	-2 (ix),#<(_gladis_quieto_izda)
   56A6 DD 36 FF 40   [19] 2954 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           2955 ;src/keyboard.h:77: break;
   56AA 18 1C         [12] 2956 	jr	00148$
                           2957 ;src/keyboard.h:78: case 6:
   56AC                    2958 00120$:
                           2959 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   56AC DD 36 FE 00   [19] 2960 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   56B0 DD 36 FF 40   [19] 2961 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           2962 ;src/keyboard.h:80: break;
   56B4 18 12         [12] 2963 	jr	00148$
                           2964 ;src/keyboard.h:81: case 8:
   56B6                    2965 00121$:
                           2966 ;src/keyboard.h:82: s = gladis_arriba;
   56B6 DD 36 FE 00   [19] 2967 	ld	-2 (ix),#<(_gladis_arriba)
   56BA DD 36 FF 42   [19] 2968 	ld	-1 (ix),#>(_gladis_arriba)
                           2969 ;src/keyboard.h:83: break;
   56BE 18 08         [12] 2970 	jr	00148$
                           2971 ;src/keyboard.h:84: case 2:
   56C0                    2972 00122$:
                           2973 ;src/keyboard.h:85: s = gladis_abajo;
   56C0 DD 36 FE 80   [19] 2974 	ld	-2 (ix),#<(_gladis_abajo)
   56C4 DD 36 FF 42   [19] 2975 	ld	-1 (ix),#>(_gladis_abajo)
                           2976 ;src/keyboard.h:87: }
   56C8                    2977 00148$:
                           2978 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   56C8 21 04 10      [10] 2979 	ld	hl,#0x1004
   56CB CD BD 66      [17] 2980 	call	_cpct_isKeyPressed
   56CE 7D            [ 4] 2981 	ld	a,l
   56CF B7            [ 4] 2982 	or	a, a
   56D0 28 05         [12] 2983 	jr	Z,00151$
                           2984 ;src/keyboard.h:94: arrow = 0;
   56D2 21 D1 6B      [10] 2985 	ld	hl,#_arrow + 0
   56D5 36 00         [10] 2986 	ld	(hl), #0x00
   56D7                    2987 00151$:
                           2988 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   56D7 21 08 04      [10] 2989 	ld	hl,#0x0408
   56DA CD BD 66      [17] 2990 	call	_cpct_isKeyPressed
   56DD 7D            [ 4] 2991 	ld	a,l
   56DE B7            [ 4] 2992 	or	a, a
   56DF 28 05         [12] 2993 	jr	Z,00153$
                           2994 ;src/keyboard.h:97: finish = 1;
   56E1 21 D0 6B      [10] 2995 	ld	hl,#_finish + 0
   56E4 36 01         [10] 2996 	ld	(hl), #0x01
   56E6                    2997 00153$:
                           2998 ;src/keyboard.h:99: return s;
   56E6 DD 6E FE      [19] 2999 	ld	l,-2 (ix)
   56E9 DD 66 FF      [19] 3000 	ld	h,-1 (ix)
   56EC DD F9         [10] 3001 	ld	sp, ix
   56EE DD E1         [14] 3002 	pop	ix
   56F0 C9            [10] 3003 	ret
                           3004 ;src/keyboard.h:102: void moveObject(){
                           3005 ;	---------------------------------
                           3006 ; Function moveObject
                           3007 ; ---------------------------------
   56F1                    3008 _moveObject::
                           3009 ;src/keyboard.h:103: object.lx = object.x;
   56F1 01 D5 6B      [10] 3010 	ld	bc,#_object+0
   56F4 0A            [ 7] 3011 	ld	a,(bc)
   56F5 32 D7 6B      [13] 3012 	ld	(#(_object + 0x0002)),a
                           3013 ;src/keyboard.h:104: object.ly = object.y;
   56F8 59            [ 4] 3014 	ld	e, c
   56F9 50            [ 4] 3015 	ld	d, b
   56FA 13            [ 6] 3016 	inc	de
   56FB 1A            [ 7] 3017 	ld	a,(de)
   56FC 32 D8 6B      [13] 3018 	ld	(#(_object + 0x0003)),a
                           3019 ;src/keyboard.h:105: switch(object.dir){
   56FF 3A DC 6B      [13] 3020 	ld	a,(#_object + 7)
   5702 FE 02         [ 7] 3021 	cp	a,#0x02
   5704 28 16         [12] 3022 	jr	Z,00103$
   5706 FE 04         [ 7] 3023 	cp	a,#0x04
   5708 28 0D         [12] 3024 	jr	Z,00102$
   570A FE 06         [ 7] 3025 	cp	a,#0x06
   570C 28 05         [12] 3026 	jr	Z,00101$
   570E D6 08         [ 7] 3027 	sub	a, #0x08
   5710 28 0F         [12] 3028 	jr	Z,00104$
   5712 C9            [10] 3029 	ret
                           3030 ;src/keyboard.h:106: case 6: object.x += 1; break;
   5713                    3031 00101$:
   5713 0A            [ 7] 3032 	ld	a,(bc)
   5714 3C            [ 4] 3033 	inc	a
   5715 02            [ 7] 3034 	ld	(bc),a
   5716 C9            [10] 3035 	ret
                           3036 ;src/keyboard.h:107: case 4: object.x -= 1; break;
   5717                    3037 00102$:
   5717 0A            [ 7] 3038 	ld	a,(bc)
   5718 C6 FF         [ 7] 3039 	add	a,#0xFF
   571A 02            [ 7] 3040 	ld	(bc),a
   571B C9            [10] 3041 	ret
                           3042 ;src/keyboard.h:108: case 2: object.y += 2; break;
   571C                    3043 00103$:
   571C 1A            [ 7] 3044 	ld	a,(de)
   571D C6 02         [ 7] 3045 	add	a, #0x02
   571F 12            [ 7] 3046 	ld	(de),a
   5720 C9            [10] 3047 	ret
                           3048 ;src/keyboard.h:109: case 8: object.y -= 2; break;
   5721                    3049 00104$:
   5721 1A            [ 7] 3050 	ld	a,(de)
   5722 C6 FE         [ 7] 3051 	add	a,#0xFE
   5724 12            [ 7] 3052 	ld	(de),a
                           3053 ;src/keyboard.h:110: }
   5725 C9            [10] 3054 	ret
                           3055 ;src/main.c:36: void init(){
                           3056 ;	---------------------------------
                           3057 ; Function init
                           3058 ; ---------------------------------
   5726                    3059 _init::
                           3060 ;src/main.c:37: cpct_disableFirmware();
   5726 CD 04 69      [17] 3061 	call	_cpct_disableFirmware
                           3062 ;src/main.c:38: cpct_setVideoMode(0);
   5729 AF            [ 4] 3063 	xor	a, a
   572A F5            [11] 3064 	push	af
   572B 33            [ 6] 3065 	inc	sp
   572C CD E1 68      [17] 3066 	call	_cpct_setVideoMode
   572F 33            [ 6] 3067 	inc	sp
                           3068 ;src/main.c:39: cpct_fw2hw(g_palette,4);
   5730 11 D9 48      [10] 3069 	ld	de,#_g_palette
   5733 3E 04         [ 7] 3070 	ld	a,#0x04
   5735 F5            [11] 3071 	push	af
   5736 33            [ 6] 3072 	inc	sp
   5737 D5            [11] 3073 	push	de
   5738 CD 6B 68      [17] 3074 	call	_cpct_fw2hw
   573B F1            [10] 3075 	pop	af
   573C 33            [ 6] 3076 	inc	sp
                           3077 ;src/main.c:40: cpct_setPalette(g_palette,4);
   573D 11 D9 48      [10] 3078 	ld	de,#_g_palette
   5740 3E 04         [ 7] 3079 	ld	a,#0x04
   5742 F5            [11] 3080 	push	af
   5743 33            [ 6] 3081 	inc	sp
   5744 D5            [11] 3082 	push	de
   5745 CD 99 66      [17] 3083 	call	_cpct_setPalette
   5748 F1            [10] 3084 	pop	af
   5749 33            [ 6] 3085 	inc	sp
   574A C9            [10] 3086 	ret
                           3087 ;src/main.c:43: void initPlayer(){
                           3088 ;	---------------------------------
                           3089 ; Function initPlayer
                           3090 ; ---------------------------------
   574B                    3091 _initPlayer::
                           3092 ;src/main.c:44: u8 *sprite = gladis_quieto_dcha;
                           3093 ;src/main.c:45: player.x = origins[0][0];
   574B 01 DE 48      [10] 3094 	ld	bc,#_origins+0
   574E 0A            [ 7] 3095 	ld	a,(bc)
   574F 32 DF 6B      [13] 3096 	ld	(#_player),a
                           3097 ;src/main.c:46: player.y = origins[0][1];
   5752 59            [ 4] 3098 	ld	e, c
   5753 50            [ 4] 3099 	ld	d, b
   5754 13            [ 6] 3100 	inc	de
   5755 1A            [ 7] 3101 	ld	a,(de)
   5756 32 E0 6B      [13] 3102 	ld	(#(_player + 0x0001)),a
                           3103 ;src/main.c:47: player.lx = origins[0][0];
   5759 0A            [ 7] 3104 	ld	a,(bc)
   575A 32 E1 6B      [13] 3105 	ld	(#(_player + 0x0002)),a
                           3106 ;src/main.c:48: player.ly = origins[0][1];
   575D 1A            [ 7] 3107 	ld	a,(de)
   575E 32 E2 6B      [13] 3108 	ld	(#(_player + 0x0003)),a
                           3109 ;src/main.c:49: player.sprite = sprite;
   5761 21 00 40      [10] 3110 	ld	hl,#_gladis_quieto_dcha
   5764 22 E3 6B      [16] 3111 	ld	((_player + 0x0004)), hl
                           3112 ;src/main.c:50: player.life = 3;
   5767 21 E5 6B      [10] 3113 	ld	hl,#_player + 6
   576A 36 03         [10] 3114 	ld	(hl),#0x03
                           3115 ;src/main.c:51: player.dir = 6;
   576C 21 E6 6B      [10] 3116 	ld	hl,#_player + 7
   576F 36 06         [10] 3117 	ld	(hl),#0x06
                           3118 ;src/main.c:52: player.atk = 20;
   5771 21 E7 6B      [10] 3119 	ld	hl,#_player + 8
   5774 36 14         [10] 3120 	ld	(hl),#0x14
                           3121 ;src/main.c:53: player.latk = 20;
   5776 21 E8 6B      [10] 3122 	ld	hl,#_player + 9
   5779 36 14         [10] 3123 	ld	(hl),#0x14
                           3124 ;src/main.c:54: player.bullets = 3;
   577B 21 E9 6B      [10] 3125 	ld	hl,#_player + 10
   577E 36 03         [10] 3126 	ld	(hl),#0x03
   5780 C9            [10] 3127 	ret
                           3128 ;src/main.c:57: void initEnemies(){
                           3129 ;	---------------------------------
                           3130 ; Function initEnemies
                           3131 ; ---------------------------------
   5781                    3132 _initEnemies::
                           3133 ;src/main.c:58: u8 *sprite = chacho_dcha;
                           3134 ;src/main.c:59: enemy.x = origins[1][0];
   5781 01 E0 48      [10] 3135 	ld	bc,#_origins + 2
   5784 0A            [ 7] 3136 	ld	a,(bc)
   5785 32 EA 6B      [13] 3137 	ld	(#_enemy),a
                           3138 ;src/main.c:60: enemy.y = origins[1][1];
   5788 11 E1 48      [10] 3139 	ld	de,#_origins + 3
   578B 1A            [ 7] 3140 	ld	a,(de)
   578C 32 EB 6B      [13] 3141 	ld	(#(_enemy + 0x0001)),a
                           3142 ;src/main.c:61: enemy.lx = origins[1][0];
   578F 0A            [ 7] 3143 	ld	a,(bc)
   5790 32 EC 6B      [13] 3144 	ld	(#(_enemy + 0x0002)),a
                           3145 ;src/main.c:62: enemy.ly = origins[1][1];
   5793 1A            [ 7] 3146 	ld	a,(de)
   5794 32 ED 6B      [13] 3147 	ld	(#(_enemy + 0x0003)),a
                           3148 ;src/main.c:63: enemy.ox = origins[1][0];
   5797 0A            [ 7] 3149 	ld	a,(bc)
   5798 32 EE 6B      [13] 3150 	ld	(#(_enemy + 0x0004)),a
                           3151 ;src/main.c:64: enemy.oy = origins[1][1];
   579B 1A            [ 7] 3152 	ld	a,(de)
   579C 32 EF 6B      [13] 3153 	ld	(#(_enemy + 0x0005)),a
                           3154 ;src/main.c:65: enemy.sprite = sprite;
   579F 21 00 44      [10] 3155 	ld	hl,#_chacho_dcha
   57A2 22 F0 6B      [16] 3156 	ld	((_enemy + 0x0006)), hl
                           3157 ;src/main.c:66: enemy.life = 3;
   57A5 21 F2 6B      [10] 3158 	ld	hl,#_enemy + 8
   57A8 36 03         [10] 3159 	ld	(hl),#0x03
                           3160 ;src/main.c:67: enemy.dir = 6;
   57AA 21 F3 6B      [10] 3161 	ld	hl,#_enemy + 9
   57AD 36 06         [10] 3162 	ld	(hl),#0x06
                           3163 ;src/main.c:68: enemy.bullets = 3;
   57AF 21 F4 6B      [10] 3164 	ld	hl,#_enemy + 10
   57B2 36 03         [10] 3165 	ld	(hl),#0x03
                           3166 ;src/main.c:69: enemy.room = 3;
   57B4 21 F5 6B      [10] 3167 	ld	hl,#_enemy + 11
   57B7 36 03         [10] 3168 	ld	(hl),#0x03
   57B9 C9            [10] 3169 	ret
                           3170 ;src/main.c:74: void gameOver(){
                           3171 ;	---------------------------------
                           3172 ; Function gameOver
                           3173 ; ---------------------------------
   57BA                    3174 _gameOver::
                           3175 ;src/main.c:76: cpct_clearScreen(0);
   57BA 21 00 40      [10] 3176 	ld	hl,#0x4000
   57BD E5            [11] 3177 	push	hl
   57BE AF            [ 4] 3178 	xor	a, a
   57BF F5            [11] 3179 	push	af
   57C0 33            [ 6] 3180 	inc	sp
   57C1 26 C0         [ 7] 3181 	ld	h, #0xC0
   57C3 E5            [11] 3182 	push	hl
   57C4 CD F3 68      [17] 3183 	call	_cpct_memset
                           3184 ;src/main.c:77: memptr = cpct_getScreenPtr(VMEM,10,10);
   57C7 21 0A 0A      [10] 3185 	ld	hl,#0x0A0A
   57CA E5            [11] 3186 	push	hl
   57CB 21 00 C0      [10] 3187 	ld	hl,#0xC000
   57CE E5            [11] 3188 	push	hl
   57CF CD E6 69      [17] 3189 	call	_cpct_getScreenPtr
                           3190 ;src/main.c:78: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   57D2 4D            [ 4] 3191 	ld	c, l
   57D3 44            [ 4] 3192 	ld	b, h
   57D4 11 E6 57      [10] 3193 	ld	de,#___str_0
   57D7 21 01 00      [10] 3194 	ld	hl,#0x0001
   57DA E5            [11] 3195 	push	hl
   57DB C5            [11] 3196 	push	bc
   57DC D5            [11] 3197 	push	de
   57DD CD AA 67      [17] 3198 	call	_cpct_drawStringM0
   57E0 21 06 00      [10] 3199 	ld	hl,#6
   57E3 39            [11] 3200 	add	hl,sp
   57E4 F9            [ 6] 3201 	ld	sp,hl
   57E5 C9            [10] 3202 	ret
   57E6                    3203 ___str_0:
   57E6 4C 6F 75 6E 67 65  3204 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   57F6 00                 3205 	.db 0x00
                           3206 ;src/main.c:83: int menu(){
                           3207 ;	---------------------------------
                           3208 ; Function menu
                           3209 ; ---------------------------------
   57F7                    3210 _menu::
   57F7 DD E5         [15] 3211 	push	ix
   57F9 DD 21 00 00   [14] 3212 	ld	ix,#0
   57FD DD 39         [15] 3213 	add	ix,sp
   57FF 21 FA FF      [10] 3214 	ld	hl,#-6
   5802 39            [11] 3215 	add	hl,sp
   5803 F9            [ 6] 3216 	ld	sp,hl
                           3217 ;src/main.c:85: int init = 50;
   5804 DD 36 FC 32   [19] 3218 	ld	-4 (ix),#0x32
   5808 DD 36 FD 00   [19] 3219 	ld	-3 (ix),#0x00
                           3220 ;src/main.c:86: int pushed =0;
   580C 21 00 00      [10] 3221 	ld	hl,#0x0000
   580F E3            [19] 3222 	ex	(sp), hl
                           3223 ;src/main.c:87: int cont =0;
   5810 11 00 00      [10] 3224 	ld	de,#0x0000
                           3225 ;src/main.c:88: cpct_clearScreen(0);
   5813 D5            [11] 3226 	push	de
   5814 21 00 40      [10] 3227 	ld	hl,#0x4000
   5817 E5            [11] 3228 	push	hl
   5818 AF            [ 4] 3229 	xor	a, a
   5819 F5            [11] 3230 	push	af
   581A 33            [ 6] 3231 	inc	sp
   581B 26 C0         [ 7] 3232 	ld	h, #0xC0
   581D E5            [11] 3233 	push	hl
   581E CD F3 68      [17] 3234 	call	_cpct_memset
   5821 21 0A 0A      [10] 3235 	ld	hl,#0x0A0A
   5824 E5            [11] 3236 	push	hl
   5825 21 00 C0      [10] 3237 	ld	hl,#0xC000
   5828 E5            [11] 3238 	push	hl
   5829 CD E6 69      [17] 3239 	call	_cpct_getScreenPtr
   582C D1            [10] 3240 	pop	de
                           3241 ;src/main.c:91: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   582D 4D            [ 4] 3242 	ld	c, l
   582E 44            [ 4] 3243 	ld	b, h
   582F D5            [11] 3244 	push	de
   5830 21 01 00      [10] 3245 	ld	hl,#0x0001
   5833 E5            [11] 3246 	push	hl
   5834 C5            [11] 3247 	push	bc
   5835 21 DA 59      [10] 3248 	ld	hl,#___str_1
   5838 E5            [11] 3249 	push	hl
   5839 CD AA 67      [17] 3250 	call	_cpct_drawStringM0
   583C 21 06 00      [10] 3251 	ld	hl,#6
   583F 39            [11] 3252 	add	hl,sp
   5840 F9            [ 6] 3253 	ld	sp,hl
   5841 21 14 32      [10] 3254 	ld	hl,#0x3214
   5844 E5            [11] 3255 	push	hl
   5845 21 00 C0      [10] 3256 	ld	hl,#0xC000
   5848 E5            [11] 3257 	push	hl
   5849 CD E6 69      [17] 3258 	call	_cpct_getScreenPtr
   584C D1            [10] 3259 	pop	de
                           3260 ;src/main.c:95: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   584D 4D            [ 4] 3261 	ld	c, l
   584E 44            [ 4] 3262 	ld	b, h
   584F D5            [11] 3263 	push	de
   5850 21 01 00      [10] 3264 	ld	hl,#0x0001
   5853 E5            [11] 3265 	push	hl
   5854 C5            [11] 3266 	push	bc
   5855 21 EB 59      [10] 3267 	ld	hl,#___str_2
   5858 E5            [11] 3268 	push	hl
   5859 CD AA 67      [17] 3269 	call	_cpct_drawStringM0
   585C 21 06 00      [10] 3270 	ld	hl,#6
   585F 39            [11] 3271 	add	hl,sp
   5860 F9            [ 6] 3272 	ld	sp,hl
   5861 21 14 46      [10] 3273 	ld	hl,#0x4614
   5864 E5            [11] 3274 	push	hl
   5865 21 00 C0      [10] 3275 	ld	hl,#0xC000
   5868 E5            [11] 3276 	push	hl
   5869 CD E6 69      [17] 3277 	call	_cpct_getScreenPtr
   586C D1            [10] 3278 	pop	de
                           3279 ;src/main.c:98: cpct_drawStringM0("Creditos",memptr,1,0);
   586D 4D            [ 4] 3280 	ld	c, l
   586E 44            [ 4] 3281 	ld	b, h
   586F D5            [11] 3282 	push	de
   5870 21 01 00      [10] 3283 	ld	hl,#0x0001
   5873 E5            [11] 3284 	push	hl
   5874 C5            [11] 3285 	push	bc
   5875 21 F9 59      [10] 3286 	ld	hl,#___str_3
   5878 E5            [11] 3287 	push	hl
   5879 CD AA 67      [17] 3288 	call	_cpct_drawStringM0
   587C 21 06 00      [10] 3289 	ld	hl,#6
   587F 39            [11] 3290 	add	hl,sp
   5880 F9            [ 6] 3291 	ld	sp,hl
   5881 21 14 5A      [10] 3292 	ld	hl,#0x5A14
   5884 E5            [11] 3293 	push	hl
   5885 21 00 C0      [10] 3294 	ld	hl,#0xC000
   5888 E5            [11] 3295 	push	hl
   5889 CD E6 69      [17] 3296 	call	_cpct_getScreenPtr
   588C D1            [10] 3297 	pop	de
                           3298 ;src/main.c:91: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   588D DD 75 FE      [19] 3299 	ld	-2 (ix),l
   5890 DD 74 FF      [19] 3300 	ld	-1 (ix),h
                           3301 ;src/main.c:101: cpct_drawStringM0("Salir",memptr,1,0);
   5893 01 02 5A      [10] 3302 	ld	bc,#___str_4
   5896 D5            [11] 3303 	push	de
   5897 21 01 00      [10] 3304 	ld	hl,#0x0001
   589A E5            [11] 3305 	push	hl
   589B DD 6E FE      [19] 3306 	ld	l,-2 (ix)
   589E DD 66 FF      [19] 3307 	ld	h,-1 (ix)
   58A1 E5            [11] 3308 	push	hl
   58A2 C5            [11] 3309 	push	bc
   58A3 CD AA 67      [17] 3310 	call	_cpct_drawStringM0
   58A6 21 06 00      [10] 3311 	ld	hl,#6
   58A9 39            [11] 3312 	add	hl,sp
   58AA F9            [ 6] 3313 	ld	sp,hl
   58AB D1            [10] 3314 	pop	de
                           3315 ;src/main.c:107: while(1){
   58AC                    3316 00118$:
                           3317 ;src/main.c:109: cpct_scanKeyboard();
   58AC D5            [11] 3318 	push	de
   58AD CD 06 6A      [17] 3319 	call	_cpct_scanKeyboard
   58B0 21 00 04      [10] 3320 	ld	hl,#0x0400
   58B3 CD BD 66      [17] 3321 	call	_cpct_isKeyPressed
   58B6 7D            [ 4] 3322 	ld	a,l
   58B7 D1            [10] 3323 	pop	de
   58B8 B7            [ 4] 3324 	or	a, a
   58B9 28 2D         [12] 3325 	jr	Z,00102$
   58BB 3E 96         [ 7] 3326 	ld	a,#0x96
   58BD BB            [ 4] 3327 	cp	a, e
   58BE 3E 00         [ 7] 3328 	ld	a,#0x00
   58C0 9A            [ 4] 3329 	sbc	a, d
   58C1 E2 C6 58      [10] 3330 	jp	PO, 00162$
   58C4 EE 80         [ 7] 3331 	xor	a, #0x80
   58C6                    3332 00162$:
   58C6 F2 E8 58      [10] 3333 	jp	P,00102$
                           3334 ;src/main.c:111: cpct_drawSolidBox(memptr, 0, 2, 8);
   58C9 21 02 08      [10] 3335 	ld	hl,#0x0802
   58CC E5            [11] 3336 	push	hl
   58CD AF            [ 4] 3337 	xor	a, a
   58CE F5            [11] 3338 	push	af
   58CF 33            [ 6] 3339 	inc	sp
   58D0 DD 6E FE      [19] 3340 	ld	l,-2 (ix)
   58D3 DD 66 FF      [19] 3341 	ld	h,-1 (ix)
   58D6 E5            [11] 3342 	push	hl
   58D7 CD 15 69      [17] 3343 	call	_cpct_drawSolidBox
   58DA F1            [10] 3344 	pop	af
   58DB F1            [10] 3345 	pop	af
   58DC 33            [ 6] 3346 	inc	sp
                           3347 ;src/main.c:112: pushed ++;
   58DD DD 34 FA      [23] 3348 	inc	-6 (ix)
   58E0 20 03         [12] 3349 	jr	NZ,00163$
   58E2 DD 34 FB      [23] 3350 	inc	-5 (ix)
   58E5                    3351 00163$:
                           3352 ;src/main.c:113: cont =0;
   58E5 11 00 00      [10] 3353 	ld	de,#0x0000
   58E8                    3354 00102$:
                           3355 ;src/main.c:115: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   58E8 D5            [11] 3356 	push	de
   58E9 21 00 01      [10] 3357 	ld	hl,#0x0100
   58EC CD BD 66      [17] 3358 	call	_cpct_isKeyPressed
   58EF 7D            [ 4] 3359 	ld	a,l
   58F0 D1            [10] 3360 	pop	de
   58F1 B7            [ 4] 3361 	or	a, a
   58F2 28 29         [12] 3362 	jr	Z,00105$
   58F4 3E 96         [ 7] 3363 	ld	a,#0x96
   58F6 BB            [ 4] 3364 	cp	a, e
   58F7 3E 00         [ 7] 3365 	ld	a,#0x00
   58F9 9A            [ 4] 3366 	sbc	a, d
   58FA E2 FF 58      [10] 3367 	jp	PO, 00164$
   58FD EE 80         [ 7] 3368 	xor	a, #0x80
   58FF                    3369 00164$:
   58FF F2 1D 59      [10] 3370 	jp	P,00105$
                           3371 ;src/main.c:116: cpct_drawSolidBox(memptr, 0, 2, 8);
   5902 21 02 08      [10] 3372 	ld	hl,#0x0802
   5905 E5            [11] 3373 	push	hl
   5906 AF            [ 4] 3374 	xor	a, a
   5907 F5            [11] 3375 	push	af
   5908 33            [ 6] 3376 	inc	sp
   5909 DD 6E FE      [19] 3377 	ld	l,-2 (ix)
   590C DD 66 FF      [19] 3378 	ld	h,-1 (ix)
   590F E5            [11] 3379 	push	hl
   5910 CD 15 69      [17] 3380 	call	_cpct_drawSolidBox
   5913 F1            [10] 3381 	pop	af
   5914 F1            [10] 3382 	pop	af
   5915 33            [ 6] 3383 	inc	sp
                           3384 ;src/main.c:117: pushed --;
   5916 E1            [10] 3385 	pop	hl
   5917 E5            [11] 3386 	push	hl
   5918 2B            [ 6] 3387 	dec	hl
   5919 E3            [19] 3388 	ex	(sp), hl
                           3389 ;src/main.c:118: cont = 0;
   591A 11 00 00      [10] 3390 	ld	de,#0x0000
   591D                    3391 00105$:
                           3392 ;src/main.c:121: switch (pushed){
   591D DD 7E FB      [19] 3393 	ld	a,-5 (ix)
   5920 07            [ 4] 3394 	rlca
   5921 E6 01         [ 7] 3395 	and	a,#0x01
   5923 47            [ 4] 3396 	ld	b,a
   5924 3E 02         [ 7] 3397 	ld	a,#0x02
   5926 DD BE FA      [19] 3398 	cp	a, -6 (ix)
   5929 3E 00         [ 7] 3399 	ld	a,#0x00
   592B DD 9E FB      [19] 3400 	sbc	a, -5 (ix)
   592E E2 33 59      [10] 3401 	jp	PO, 00165$
   5931 EE 80         [ 7] 3402 	xor	a, #0x80
   5933                    3403 00165$:
   5933 07            [ 4] 3404 	rlca
   5934 E6 01         [ 7] 3405 	and	a,#0x01
   5936 4F            [ 4] 3406 	ld	c,a
   5937 78            [ 4] 3407 	ld	a,b
   5938 B7            [ 4] 3408 	or	a,a
   5939 20 32         [12] 3409 	jr	NZ,00110$
   593B B1            [ 4] 3410 	or	a,c
   593C 20 2F         [12] 3411 	jr	NZ,00110$
   593E D5            [11] 3412 	push	de
   593F DD 5E FA      [19] 3413 	ld	e,-6 (ix)
   5942 16 00         [ 7] 3414 	ld	d,#0x00
   5944 21 4B 59      [10] 3415 	ld	hl,#00166$
   5947 19            [11] 3416 	add	hl,de
   5948 19            [11] 3417 	add	hl,de
                           3418 ;src/main.c:122: case 0: init = 50;break;
   5949 D1            [10] 3419 	pop	de
   594A E9            [ 4] 3420 	jp	(hl)
   594B                    3421 00166$:
   594B 18 04         [12] 3422 	jr	00107$
   594D 18 0C         [12] 3423 	jr	00108$
   594F 18 14         [12] 3424 	jr	00109$
   5951                    3425 00107$:
   5951 DD 36 FC 32   [19] 3426 	ld	-4 (ix),#0x32
   5955 DD 36 FD 00   [19] 3427 	ld	-3 (ix),#0x00
   5959 18 12         [12] 3428 	jr	00110$
                           3429 ;src/main.c:123: case 1: init = 70;break;
   595B                    3430 00108$:
   595B DD 36 FC 46   [19] 3431 	ld	-4 (ix),#0x46
   595F DD 36 FD 00   [19] 3432 	ld	-3 (ix),#0x00
   5963 18 08         [12] 3433 	jr	00110$
                           3434 ;src/main.c:124: case 2: init = 90;break;
   5965                    3435 00109$:
   5965 DD 36 FC 5A   [19] 3436 	ld	-4 (ix),#0x5A
   5969 DD 36 FD 00   [19] 3437 	ld	-3 (ix),#0x00
                           3438 ;src/main.c:125: }
   596D                    3439 00110$:
                           3440 ;src/main.c:126: memptr = cpct_getScreenPtr(VMEM,15,init);
   596D DD 66 FC      [19] 3441 	ld	h,-4 (ix)
   5970 C5            [11] 3442 	push	bc
   5971 D5            [11] 3443 	push	de
   5972 E5            [11] 3444 	push	hl
   5973 33            [ 6] 3445 	inc	sp
   5974 3E 0F         [ 7] 3446 	ld	a,#0x0F
   5976 F5            [11] 3447 	push	af
   5977 33            [ 6] 3448 	inc	sp
   5978 21 00 C0      [10] 3449 	ld	hl,#0xC000
   597B E5            [11] 3450 	push	hl
   597C CD E6 69      [17] 3451 	call	_cpct_getScreenPtr
   597F D1            [10] 3452 	pop	de
   5980 C1            [10] 3453 	pop	bc
                           3454 ;src/main.c:91: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5981 DD 75 FE      [19] 3455 	ld	-2 (ix),l
   5984 DD 74 FF      [19] 3456 	ld	-1 (ix),h
                           3457 ;src/main.c:127: cpct_drawSolidBox(memptr, 3, 2, 8);
   5987 C5            [11] 3458 	push	bc
   5988 D5            [11] 3459 	push	de
   5989 21 02 08      [10] 3460 	ld	hl,#0x0802
   598C E5            [11] 3461 	push	hl
   598D 3E 03         [ 7] 3462 	ld	a,#0x03
   598F F5            [11] 3463 	push	af
   5990 33            [ 6] 3464 	inc	sp
   5991 DD 6E FE      [19] 3465 	ld	l,-2 (ix)
   5994 DD 66 FF      [19] 3466 	ld	h,-1 (ix)
   5997 E5            [11] 3467 	push	hl
   5998 CD 15 69      [17] 3468 	call	_cpct_drawSolidBox
   599B F1            [10] 3469 	pop	af
   599C F1            [10] 3470 	pop	af
   599D 33            [ 6] 3471 	inc	sp
   599E 21 00 40      [10] 3472 	ld	hl,#0x4000
   59A1 CD BD 66      [17] 3473 	call	_cpct_isKeyPressed
   59A4 7D            [ 4] 3474 	ld	a,l
   59A5 D1            [10] 3475 	pop	de
   59A6 C1            [10] 3476 	pop	bc
   59A7 B7            [ 4] 3477 	or	a, a
   59A8 28 27         [12] 3478 	jr	Z,00116$
                           3479 ;src/main.c:129: switch (pushed){
   59AA 78            [ 4] 3480 	ld	a,b
   59AB B7            [ 4] 3481 	or	a,a
   59AC 20 23         [12] 3482 	jr	NZ,00116$
   59AE B1            [ 4] 3483 	or	a,c
   59AF 20 20         [12] 3484 	jr	NZ,00116$
   59B1 DD 5E FA      [19] 3485 	ld	e,-6 (ix)
   59B4 16 00         [ 7] 3486 	ld	d,#0x00
   59B6 21 BC 59      [10] 3487 	ld	hl,#00167$
   59B9 19            [11] 3488 	add	hl,de
   59BA 19            [11] 3489 	add	hl,de
                           3490 ;src/main.c:130: case 0: return 1;break;
   59BB E9            [ 4] 3491 	jp	(hl)
   59BC                    3492 00167$:
   59BC 18 04         [12] 3493 	jr	00111$
   59BE 18 07         [12] 3494 	jr	00112$
   59C0 18 0A         [12] 3495 	jr	00113$
   59C2                    3496 00111$:
   59C2 21 01 00      [10] 3497 	ld	hl,#0x0001
   59C5 18 0E         [12] 3498 	jr	00120$
                           3499 ;src/main.c:131: case 1: return 2;break;
   59C7                    3500 00112$:
   59C7 21 02 00      [10] 3501 	ld	hl,#0x0002
   59CA 18 09         [12] 3502 	jr	00120$
                           3503 ;src/main.c:132: case 2: return 0;break;
   59CC                    3504 00113$:
   59CC 21 00 00      [10] 3505 	ld	hl,#0x0000
   59CF 18 04         [12] 3506 	jr	00120$
                           3507 ;src/main.c:133: }
   59D1                    3508 00116$:
                           3509 ;src/main.c:135: cont++;
   59D1 13            [ 6] 3510 	inc	de
   59D2 C3 AC 58      [10] 3511 	jp	00118$
   59D5                    3512 00120$:
   59D5 DD F9         [10] 3513 	ld	sp, ix
   59D7 DD E1         [14] 3514 	pop	ix
   59D9 C9            [10] 3515 	ret
   59DA                    3516 ___str_1:
   59DA 4C 6F 75 6E 67 65  3517 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   59EA 00                 3518 	.db 0x00
   59EB                    3519 ___str_2:
   59EB 4E 75 65 76 61 20  3520 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   59F8 00                 3521 	.db 0x00
   59F9                    3522 ___str_3:
   59F9 43 72 65 64 69 74  3523 	.ascii "Creditos"
        6F 73
   5A01 00                 3524 	.db 0x00
   5A02                    3525 ___str_4:
   5A02 53 61 6C 69 72     3526 	.ascii "Salir"
   5A07 00                 3527 	.db 0x00
                           3528 ;src/main.c:154: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           3529 ;	---------------------------------
                           3530 ; Function checkBoundsCollisionsEnemy
                           3531 ; ---------------------------------
   5A08                    3532 _checkBoundsCollisionsEnemy::
   5A08 DD E5         [15] 3533 	push	ix
   5A0A DD 21 00 00   [14] 3534 	ld	ix,#0
   5A0E DD 39         [15] 3535 	add	ix,sp
   5A10 21 EC FF      [10] 3536 	ld	hl,#-20
   5A13 39            [11] 3537 	add	hl,sp
   5A14 F9            [ 6] 3538 	ld	sp,hl
                           3539 ;src/main.c:156: u8 *posX = x;
   5A15 DD 7E 04      [19] 3540 	ld	a,4 (ix)
   5A18 DD 77 EE      [19] 3541 	ld	-18 (ix),a
   5A1B DD 7E 05      [19] 3542 	ld	a,5 (ix)
   5A1E DD 77 EF      [19] 3543 	ld	-17 (ix),a
                           3544 ;src/main.c:157: u8 *posY = y;
   5A21 DD 7E 06      [19] 3545 	ld	a,6 (ix)
   5A24 DD 77 EC      [19] 3546 	ld	-20 (ix),a
   5A27 DD 7E 07      [19] 3547 	ld	a,7 (ix)
   5A2A DD 77 ED      [19] 3548 	ld	-19 (ix),a
                           3549 ;src/main.c:158: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   5A2D E1            [10] 3550 	pop	hl
   5A2E E5            [11] 3551 	push	hl
   5A2F 7E            [ 7] 3552 	ld	a,(hl)
   5A30 DD 77 FB      [19] 3553 	ld	-5 (ix), a
   5A33 07            [ 4] 3554 	rlca
   5A34 07            [ 4] 3555 	rlca
   5A35 07            [ 4] 3556 	rlca
   5A36 07            [ 4] 3557 	rlca
   5A37 E6 0F         [ 7] 3558 	and	a,#0x0F
   5A39 4F            [ 4] 3559 	ld	c,a
   5A3A 06 00         [ 7] 3560 	ld	b,#0x00
   5A3C 69            [ 4] 3561 	ld	l, c
   5A3D 60            [ 4] 3562 	ld	h, b
   5A3E 29            [11] 3563 	add	hl, hl
   5A3F 29            [11] 3564 	add	hl, hl
   5A40 09            [11] 3565 	add	hl, bc
   5A41 29            [11] 3566 	add	hl, hl
   5A42 29            [11] 3567 	add	hl, hl
   5A43 3E DC         [ 7] 3568 	ld	a,#<(_scene)
   5A45 85            [ 4] 3569 	add	a, l
   5A46 DD 77 F9      [19] 3570 	ld	-7 (ix),a
   5A49 3E 6A         [ 7] 3571 	ld	a,#>(_scene)
   5A4B 8C            [ 4] 3572 	adc	a, h
   5A4C DD 77 FA      [19] 3573 	ld	-6 (ix),a
   5A4F DD 6E EE      [19] 3574 	ld	l,-18 (ix)
   5A52 DD 66 EF      [19] 3575 	ld	h,-17 (ix)
   5A55 7E            [ 7] 3576 	ld	a,(hl)
   5A56 DD 77 FE      [19] 3577 	ld	-2 (ix), a
   5A59 0F            [ 4] 3578 	rrca
   5A5A 0F            [ 4] 3579 	rrca
   5A5B E6 3F         [ 7] 3580 	and	a,#0x3F
   5A5D DD 77 FF      [19] 3581 	ld	-1 (ix), a
   5A60 DD 86 F9      [19] 3582 	add	a, -7 (ix)
   5A63 6F            [ 4] 3583 	ld	l,a
   5A64 3E 00         [ 7] 3584 	ld	a,#0x00
   5A66 DD 8E FA      [19] 3585 	adc	a, -6 (ix)
   5A69 67            [ 4] 3586 	ld	h,a
   5A6A 7E            [ 7] 3587 	ld	a,(hl)
   5A6B DD 77 F8      [19] 3588 	ld	-8 (ix), a
   5A6E 3D            [ 4] 3589 	dec	a
   5A6F CA 7D 5B      [10] 3590 	jp	Z,00106$
                           3591 ;src/main.c:159: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5A72 DD 6E FE      [19] 3592 	ld	l,-2 (ix)
   5A75 26 00         [ 7] 3593 	ld	h,#0x00
   5A77 DD 5E 0A      [19] 3594 	ld	e,10 (ix)
   5A7A 16 00         [ 7] 3595 	ld	d,#0x00
   5A7C 19            [11] 3596 	add	hl,de
   5A7D 7D            [ 4] 3597 	ld	a,l
   5A7E C6 FF         [ 7] 3598 	add	a,#0xFF
   5A80 DD 77 F0      [19] 3599 	ld	-16 (ix),a
   5A83 7C            [ 4] 3600 	ld	a,h
   5A84 CE FF         [ 7] 3601 	adc	a,#0xFF
   5A86 DD 77 F1      [19] 3602 	ld	-15 (ix),a
   5A89 DD 7E F0      [19] 3603 	ld	a,-16 (ix)
   5A8C DD 77 F6      [19] 3604 	ld	-10 (ix),a
   5A8F DD 7E F1      [19] 3605 	ld	a,-15 (ix)
   5A92 DD 77 F7      [19] 3606 	ld	-9 (ix),a
   5A95 DD 7E F1      [19] 3607 	ld	a,-15 (ix)
   5A98 07            [ 4] 3608 	rlca
   5A99 E6 01         [ 7] 3609 	and	a,#0x01
   5A9B DD 77 FE      [19] 3610 	ld	-2 (ix),a
   5A9E 23            [ 6] 3611 	inc	hl
   5A9F 23            [ 6] 3612 	inc	hl
   5AA0 DD 75 F2      [19] 3613 	ld	-14 (ix),l
   5AA3 DD 74 F3      [19] 3614 	ld	-13 (ix),h
   5AA6 DD 7E FE      [19] 3615 	ld	a,-2 (ix)
   5AA9 B7            [ 4] 3616 	or	a, a
   5AAA 28 0C         [12] 3617 	jr	Z,00114$
   5AAC DD 7E F2      [19] 3618 	ld	a,-14 (ix)
   5AAF DD 77 F6      [19] 3619 	ld	-10 (ix),a
   5AB2 DD 7E F3      [19] 3620 	ld	a,-13 (ix)
   5AB5 DD 77 F7      [19] 3621 	ld	-9 (ix),a
   5AB8                    3622 00114$:
   5AB8 DD 6E F6      [19] 3623 	ld	l,-10 (ix)
   5ABB DD 66 F7      [19] 3624 	ld	h,-9 (ix)
   5ABE CB 2C         [ 8] 3625 	sra	h
   5AC0 CB 1D         [ 8] 3626 	rr	l
   5AC2 CB 2C         [ 8] 3627 	sra	h
   5AC4 CB 1D         [ 8] 3628 	rr	l
   5AC6 DD 5E F9      [19] 3629 	ld	e,-7 (ix)
   5AC9 DD 56 FA      [19] 3630 	ld	d,-6 (ix)
   5ACC 19            [11] 3631 	add	hl,de
   5ACD 7E            [ 7] 3632 	ld	a,(hl)
   5ACE 3D            [ 4] 3633 	dec	a
   5ACF CA 7D 5B      [10] 3634 	jp	Z,00106$
                           3635 ;src/main.c:160: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   5AD2 DD 6E FB      [19] 3636 	ld	l,-5 (ix)
   5AD5 26 00         [ 7] 3637 	ld	h,#0x00
   5AD7 DD 5E 0B      [19] 3638 	ld	e,11 (ix)
   5ADA 16 00         [ 7] 3639 	ld	d,#0x00
   5ADC 19            [11] 3640 	add	hl,de
   5ADD 4D            [ 4] 3641 	ld	c,l
   5ADE 44            [ 4] 3642 	ld	b,h
   5ADF 0B            [ 6] 3643 	dec	bc
   5AE0 0B            [ 6] 3644 	dec	bc
   5AE1 59            [ 4] 3645 	ld	e, c
   5AE2 78            [ 4] 3646 	ld	a,b
   5AE3 57            [ 4] 3647 	ld	d,a
   5AE4 07            [ 4] 3648 	rlca
   5AE5 E6 01         [ 7] 3649 	and	a,#0x01
   5AE7 DD 77 F6      [19] 3650 	ld	-10 (ix),a
   5AEA 7D            [ 4] 3651 	ld	a,l
   5AEB C6 0D         [ 7] 3652 	add	a, #0x0D
   5AED DD 77 FC      [19] 3653 	ld	-4 (ix),a
   5AF0 7C            [ 4] 3654 	ld	a,h
   5AF1 CE 00         [ 7] 3655 	adc	a, #0x00
   5AF3 DD 77 FD      [19] 3656 	ld	-3 (ix),a
   5AF6 DD 7E F6      [19] 3657 	ld	a,-10 (ix)
   5AF9 B7            [ 4] 3658 	or	a, a
   5AFA 28 06         [12] 3659 	jr	Z,00115$
   5AFC DD 5E FC      [19] 3660 	ld	e,-4 (ix)
   5AFF DD 56 FD      [19] 3661 	ld	d,-3 (ix)
   5B02                    3662 00115$:
   5B02 CB 2A         [ 8] 3663 	sra	d
   5B04 CB 1B         [ 8] 3664 	rr	e
   5B06 CB 2A         [ 8] 3665 	sra	d
   5B08 CB 1B         [ 8] 3666 	rr	e
   5B0A CB 2A         [ 8] 3667 	sra	d
   5B0C CB 1B         [ 8] 3668 	rr	e
   5B0E CB 2A         [ 8] 3669 	sra	d
   5B10 CB 1B         [ 8] 3670 	rr	e
   5B12 6B            [ 4] 3671 	ld	l, e
   5B13 62            [ 4] 3672 	ld	h, d
   5B14 29            [11] 3673 	add	hl, hl
   5B15 29            [11] 3674 	add	hl, hl
   5B16 19            [11] 3675 	add	hl, de
   5B17 29            [11] 3676 	add	hl, hl
   5B18 29            [11] 3677 	add	hl, hl
   5B19 11 DC 6A      [10] 3678 	ld	de,#_scene
   5B1C 19            [11] 3679 	add	hl,de
   5B1D DD 5E FF      [19] 3680 	ld	e,-1 (ix)
   5B20 16 00         [ 7] 3681 	ld	d,#0x00
   5B22 19            [11] 3682 	add	hl,de
   5B23 7E            [ 7] 3683 	ld	a,(hl)
   5B24 3D            [ 4] 3684 	dec	a
   5B25 28 56         [12] 3685 	jr	Z,00106$
                           3686 ;src/main.c:161: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5B27 69            [ 4] 3687 	ld	l, c
   5B28 60            [ 4] 3688 	ld	h, b
   5B29 DD 7E F6      [19] 3689 	ld	a,-10 (ix)
   5B2C B7            [ 4] 3690 	or	a, a
   5B2D 28 06         [12] 3691 	jr	Z,00116$
   5B2F DD 6E FC      [19] 3692 	ld	l,-4 (ix)
   5B32 DD 66 FD      [19] 3693 	ld	h,-3 (ix)
   5B35                    3694 00116$:
   5B35 CB 2C         [ 8] 3695 	sra	h
   5B37 CB 1D         [ 8] 3696 	rr	l
   5B39 CB 2C         [ 8] 3697 	sra	h
   5B3B CB 1D         [ 8] 3698 	rr	l
   5B3D CB 2C         [ 8] 3699 	sra	h
   5B3F CB 1D         [ 8] 3700 	rr	l
   5B41 CB 2C         [ 8] 3701 	sra	h
   5B43 CB 1D         [ 8] 3702 	rr	l
   5B45 5D            [ 4] 3703 	ld	e, l
   5B46 54            [ 4] 3704 	ld	d, h
   5B47 29            [11] 3705 	add	hl, hl
   5B48 29            [11] 3706 	add	hl, hl
   5B49 19            [11] 3707 	add	hl, de
   5B4A 29            [11] 3708 	add	hl, hl
   5B4B 29            [11] 3709 	add	hl, hl
   5B4C 3E DC         [ 7] 3710 	ld	a,#<(_scene)
   5B4E 85            [ 4] 3711 	add	a, l
   5B4F DD 77 F4      [19] 3712 	ld	-12 (ix),a
   5B52 3E 6A         [ 7] 3713 	ld	a,#>(_scene)
   5B54 8C            [ 4] 3714 	adc	a, h
   5B55 DD 77 F5      [19] 3715 	ld	-11 (ix),a
   5B58 DD 6E F0      [19] 3716 	ld	l,-16 (ix)
   5B5B DD 66 F1      [19] 3717 	ld	h,-15 (ix)
   5B5E DD 7E FE      [19] 3718 	ld	a,-2 (ix)
   5B61 B7            [ 4] 3719 	or	a, a
   5B62 28 06         [12] 3720 	jr	Z,00117$
   5B64 DD 6E F2      [19] 3721 	ld	l,-14 (ix)
   5B67 DD 66 F3      [19] 3722 	ld	h,-13 (ix)
   5B6A                    3723 00117$:
   5B6A CB 2C         [ 8] 3724 	sra	h
   5B6C CB 1D         [ 8] 3725 	rr	l
   5B6E CB 2C         [ 8] 3726 	sra	h
   5B70 CB 1D         [ 8] 3727 	rr	l
   5B72 DD 5E F4      [19] 3728 	ld	e,-12 (ix)
   5B75 DD 56 F5      [19] 3729 	ld	d,-11 (ix)
   5B78 19            [11] 3730 	add	hl,de
   5B79 7E            [ 7] 3731 	ld	a,(hl)
   5B7A 3D            [ 4] 3732 	dec	a
   5B7B 20 13         [12] 3733 	jr	NZ,00107$
   5B7D                    3734 00106$:
                           3735 ;src/main.c:163: *posX=lx;
   5B7D DD 6E EE      [19] 3736 	ld	l,-18 (ix)
   5B80 DD 66 EF      [19] 3737 	ld	h,-17 (ix)
   5B83 DD 7E 08      [19] 3738 	ld	a,8 (ix)
   5B86 77            [ 7] 3739 	ld	(hl),a
                           3740 ;src/main.c:164: *posY=ly;
   5B87 E1            [10] 3741 	pop	hl
   5B88 E5            [11] 3742 	push	hl
   5B89 DD 7E 09      [19] 3743 	ld	a,9 (ix)
   5B8C 77            [ 7] 3744 	ld	(hl),a
   5B8D C3 58 5C      [10] 3745 	jp	00112$
   5B90                    3746 00107$:
                           3747 ;src/main.c:166: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   5B90 DD 7E F8      [19] 3748 	ld	a,-8 (ix)
   5B93 D6 03         [ 7] 3749 	sub	a, #0x03
   5B95 C2 48 5C      [10] 3750 	jp	NZ,00101$
                           3751 ;src/main.c:167: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5B98 DD 6E F0      [19] 3752 	ld	l,-16 (ix)
   5B9B DD 66 F1      [19] 3753 	ld	h,-15 (ix)
   5B9E DD 7E FE      [19] 3754 	ld	a,-2 (ix)
   5BA1 B7            [ 4] 3755 	or	a, a
   5BA2 28 06         [12] 3756 	jr	Z,00118$
   5BA4 DD 6E F2      [19] 3757 	ld	l,-14 (ix)
   5BA7 DD 66 F3      [19] 3758 	ld	h,-13 (ix)
   5BAA                    3759 00118$:
   5BAA CB 2C         [ 8] 3760 	sra	h
   5BAC CB 1D         [ 8] 3761 	rr	l
   5BAE CB 2C         [ 8] 3762 	sra	h
   5BB0 CB 1D         [ 8] 3763 	rr	l
   5BB2 DD 5E F9      [19] 3764 	ld	e,-7 (ix)
   5BB5 DD 56 FA      [19] 3765 	ld	d,-6 (ix)
   5BB8 19            [11] 3766 	add	hl,de
   5BB9 7E            [ 7] 3767 	ld	a,(hl)
   5BBA D6 03         [ 7] 3768 	sub	a, #0x03
   5BBC C2 48 5C      [10] 3769 	jp	NZ,00101$
                           3770 ;src/main.c:168: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   5BBF 69            [ 4] 3771 	ld	l, c
   5BC0 60            [ 4] 3772 	ld	h, b
   5BC1 DD 7E F6      [19] 3773 	ld	a,-10 (ix)
   5BC4 B7            [ 4] 3774 	or	a, a
   5BC5 28 06         [12] 3775 	jr	Z,00119$
   5BC7 DD 6E FC      [19] 3776 	ld	l,-4 (ix)
   5BCA DD 66 FD      [19] 3777 	ld	h,-3 (ix)
   5BCD                    3778 00119$:
   5BCD CB 2C         [ 8] 3779 	sra	h
   5BCF CB 1D         [ 8] 3780 	rr	l
   5BD1 CB 2C         [ 8] 3781 	sra	h
   5BD3 CB 1D         [ 8] 3782 	rr	l
   5BD5 CB 2C         [ 8] 3783 	sra	h
   5BD7 CB 1D         [ 8] 3784 	rr	l
   5BD9 CB 2C         [ 8] 3785 	sra	h
   5BDB CB 1D         [ 8] 3786 	rr	l
   5BDD 5D            [ 4] 3787 	ld	e, l
   5BDE 54            [ 4] 3788 	ld	d, h
   5BDF 29            [11] 3789 	add	hl, hl
   5BE0 29            [11] 3790 	add	hl, hl
   5BE1 19            [11] 3791 	add	hl, de
   5BE2 29            [11] 3792 	add	hl, hl
   5BE3 29            [11] 3793 	add	hl, hl
   5BE4 11 DC 6A      [10] 3794 	ld	de,#_scene
   5BE7 19            [11] 3795 	add	hl,de
   5BE8 DD 5E FF      [19] 3796 	ld	e,-1 (ix)
   5BEB 16 00         [ 7] 3797 	ld	d,#0x00
   5BED 19            [11] 3798 	add	hl,de
   5BEE 7E            [ 7] 3799 	ld	a,(hl)
   5BEF D6 03         [ 7] 3800 	sub	a, #0x03
   5BF1 20 55         [12] 3801 	jr	NZ,00101$
                           3802 ;src/main.c:169: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5BF3 DD 7E F6      [19] 3803 	ld	a,-10 (ix)
   5BF6 B7            [ 4] 3804 	or	a, a
   5BF7 28 06         [12] 3805 	jr	Z,00120$
   5BF9 DD 4E FC      [19] 3806 	ld	c,-4 (ix)
   5BFC DD 46 FD      [19] 3807 	ld	b,-3 (ix)
   5BFF                    3808 00120$:
   5BFF CB 28         [ 8] 3809 	sra	b
   5C01 CB 19         [ 8] 3810 	rr	c
   5C03 CB 28         [ 8] 3811 	sra	b
   5C05 CB 19         [ 8] 3812 	rr	c
   5C07 CB 28         [ 8] 3813 	sra	b
   5C09 CB 19         [ 8] 3814 	rr	c
   5C0B CB 28         [ 8] 3815 	sra	b
   5C0D CB 19         [ 8] 3816 	rr	c
   5C0F 69            [ 4] 3817 	ld	l, c
   5C10 60            [ 4] 3818 	ld	h, b
   5C11 29            [11] 3819 	add	hl, hl
   5C12 29            [11] 3820 	add	hl, hl
   5C13 09            [11] 3821 	add	hl, bc
   5C14 29            [11] 3822 	add	hl, hl
   5C15 29            [11] 3823 	add	hl, hl
   5C16 3E DC         [ 7] 3824 	ld	a,#<(_scene)
   5C18 85            [ 4] 3825 	add	a, l
   5C19 DD 77 F4      [19] 3826 	ld	-12 (ix),a
   5C1C 3E 6A         [ 7] 3827 	ld	a,#>(_scene)
   5C1E 8C            [ 4] 3828 	adc	a, h
   5C1F DD 77 F5      [19] 3829 	ld	-11 (ix),a
   5C22 DD 6E F0      [19] 3830 	ld	l,-16 (ix)
   5C25 DD 66 F1      [19] 3831 	ld	h,-15 (ix)
   5C28 DD 7E FE      [19] 3832 	ld	a,-2 (ix)
   5C2B B7            [ 4] 3833 	or	a, a
   5C2C 28 06         [12] 3834 	jr	Z,00121$
   5C2E DD 6E F2      [19] 3835 	ld	l,-14 (ix)
   5C31 DD 66 F3      [19] 3836 	ld	h,-13 (ix)
   5C34                    3837 00121$:
   5C34 CB 2C         [ 8] 3838 	sra	h
   5C36 CB 1D         [ 8] 3839 	rr	l
   5C38 CB 2C         [ 8] 3840 	sra	h
   5C3A CB 1D         [ 8] 3841 	rr	l
   5C3C DD 5E F4      [19] 3842 	ld	e,-12 (ix)
   5C3F DD 56 F5      [19] 3843 	ld	d,-11 (ix)
   5C42 19            [11] 3844 	add	hl,de
   5C43 7E            [ 7] 3845 	ld	a,(hl)
   5C44 D6 03         [ 7] 3846 	sub	a, #0x03
   5C46 28 10         [12] 3847 	jr	Z,00112$
   5C48                    3848 00101$:
                           3849 ;src/main.c:171: *posX=lx;
   5C48 DD 6E EE      [19] 3850 	ld	l,-18 (ix)
   5C4B DD 66 EF      [19] 3851 	ld	h,-17 (ix)
   5C4E DD 7E 08      [19] 3852 	ld	a,8 (ix)
   5C51 77            [ 7] 3853 	ld	(hl),a
                           3854 ;src/main.c:172: *posY=ly;
   5C52 E1            [10] 3855 	pop	hl
   5C53 E5            [11] 3856 	push	hl
   5C54 DD 7E 09      [19] 3857 	ld	a,9 (ix)
   5C57 77            [ 7] 3858 	ld	(hl),a
   5C58                    3859 00112$:
   5C58 DD F9         [10] 3860 	ld	sp, ix
   5C5A DD E1         [14] 3861 	pop	ix
   5C5C C9            [10] 3862 	ret
                           3863 ;src/main.c:178: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3864 ;	---------------------------------
                           3865 ; Function checkBoundsCollisions
                           3866 ; ---------------------------------
   5C5D                    3867 _checkBoundsCollisions::
   5C5D DD E5         [15] 3868 	push	ix
   5C5F DD 21 00 00   [14] 3869 	ld	ix,#0
   5C63 DD 39         [15] 3870 	add	ix,sp
   5C65 21 F2 FF      [10] 3871 	ld	hl,#-14
   5C68 39            [11] 3872 	add	hl,sp
   5C69 F9            [ 6] 3873 	ld	sp,hl
                           3874 ;src/main.c:179: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   5C6A 3A E0 6B      [13] 3875 	ld	a,(#(_player + 0x0001) + 0)
   5C6D DD 77 F8      [19] 3876 	ld	-8 (ix), a
   5C70 07            [ 4] 3877 	rlca
   5C71 07            [ 4] 3878 	rlca
   5C72 07            [ 4] 3879 	rlca
   5C73 07            [ 4] 3880 	rlca
   5C74 E6 0F         [ 7] 3881 	and	a,#0x0F
   5C76 4F            [ 4] 3882 	ld	c,a
   5C77 06 00         [ 7] 3883 	ld	b,#0x00
   5C79 69            [ 4] 3884 	ld	l, c
   5C7A 60            [ 4] 3885 	ld	h, b
   5C7B 29            [11] 3886 	add	hl, hl
   5C7C 29            [11] 3887 	add	hl, hl
   5C7D 09            [11] 3888 	add	hl, bc
   5C7E 29            [11] 3889 	add	hl, hl
   5C7F 29            [11] 3890 	add	hl, hl
   5C80 3E DC         [ 7] 3891 	ld	a,#<(_scene)
   5C82 85            [ 4] 3892 	add	a, l
   5C83 DD 77 F4      [19] 3893 	ld	-12 (ix),a
   5C86 3E 6A         [ 7] 3894 	ld	a,#>(_scene)
   5C88 8C            [ 4] 3895 	adc	a, h
   5C89 DD 77 F5      [19] 3896 	ld	-11 (ix),a
   5C8C 21 DF 6B      [10] 3897 	ld	hl, #_player + 0
   5C8F 4E            [ 7] 3898 	ld	c,(hl)
   5C90 79            [ 4] 3899 	ld	a,c
   5C91 0F            [ 4] 3900 	rrca
   5C92 0F            [ 4] 3901 	rrca
   5C93 E6 3F         [ 7] 3902 	and	a,#0x3F
   5C95 DD 77 F7      [19] 3903 	ld	-9 (ix), a
   5C98 DD 86 F4      [19] 3904 	add	a, -12 (ix)
   5C9B 6F            [ 4] 3905 	ld	l,a
   5C9C 3E 00         [ 7] 3906 	ld	a,#0x00
   5C9E DD 8E F5      [19] 3907 	adc	a, -11 (ix)
   5CA1 67            [ 4] 3908 	ld	h,a
   5CA2 7E            [ 7] 3909 	ld	a,(hl)
   5CA3 DD 77 F6      [19] 3910 	ld	-10 (ix), a
   5CA6 3D            [ 4] 3911 	dec	a
   5CA7 CA BD 5D      [10] 3912 	jp	Z,00124$
                           3913 ;src/main.c:180: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5CAA 06 00         [ 7] 3914 	ld	b,#0x00
   5CAC 21 03 00      [10] 3915 	ld	hl,#0x0003
   5CAF 09            [11] 3916 	add	hl,bc
   5CB0 DD 75 FB      [19] 3917 	ld	-5 (ix),l
   5CB3 DD 74 FC      [19] 3918 	ld	-4 (ix),h
   5CB6 DD 7E FB      [19] 3919 	ld	a,-5 (ix)
   5CB9 DD 77 FE      [19] 3920 	ld	-2 (ix),a
   5CBC DD 7E FC      [19] 3921 	ld	a,-4 (ix)
   5CBF DD 77 FF      [19] 3922 	ld	-1 (ix),a
   5CC2 DD 7E FC      [19] 3923 	ld	a,-4 (ix)
   5CC5 07            [ 4] 3924 	rlca
   5CC6 E6 01         [ 7] 3925 	and	a,#0x01
   5CC8 DD 77 FD      [19] 3926 	ld	-3 (ix),a
   5CCB 21 06 00      [10] 3927 	ld	hl,#0x0006
   5CCE 09            [11] 3928 	add	hl,bc
   5CCF E3            [19] 3929 	ex	(sp), hl
   5CD0 DD 7E FD      [19] 3930 	ld	a,-3 (ix)
   5CD3 B7            [ 4] 3931 	or	a, a
   5CD4 28 0C         [12] 3932 	jr	Z,00132$
   5CD6 DD 7E F2      [19] 3933 	ld	a,-14 (ix)
   5CD9 DD 77 FE      [19] 3934 	ld	-2 (ix),a
   5CDC DD 7E F3      [19] 3935 	ld	a,-13 (ix)
   5CDF DD 77 FF      [19] 3936 	ld	-1 (ix),a
   5CE2                    3937 00132$:
   5CE2 DD 6E FE      [19] 3938 	ld	l,-2 (ix)
   5CE5 DD 66 FF      [19] 3939 	ld	h,-1 (ix)
   5CE8 CB 2C         [ 8] 3940 	sra	h
   5CEA CB 1D         [ 8] 3941 	rr	l
   5CEC CB 2C         [ 8] 3942 	sra	h
   5CEE CB 1D         [ 8] 3943 	rr	l
   5CF0 DD 5E F4      [19] 3944 	ld	e,-12 (ix)
   5CF3 DD 56 F5      [19] 3945 	ld	d,-11 (ix)
   5CF6 19            [11] 3946 	add	hl,de
   5CF7 7E            [ 7] 3947 	ld	a,(hl)
   5CF8 3D            [ 4] 3948 	dec	a
   5CF9 CA BD 5D      [10] 3949 	jp	Z,00124$
                           3950 ;src/main.c:181: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   5CFC DD 5E F8      [19] 3951 	ld	e,-8 (ix)
   5CFF 16 00         [ 7] 3952 	ld	d,#0x00
   5D01 21 0E 00      [10] 3953 	ld	hl,#0x000E
   5D04 19            [11] 3954 	add	hl,de
   5D05 4D            [ 4] 3955 	ld	c,l
   5D06 44            [ 4] 3956 	ld	b,h
   5D07 DD 71 FE      [19] 3957 	ld	-2 (ix),c
   5D0A DD 70 FF      [19] 3958 	ld	-1 (ix),b
   5D0D 78            [ 4] 3959 	ld	a,b
   5D0E 07            [ 4] 3960 	rlca
   5D0F E6 01         [ 7] 3961 	and	a,#0x01
   5D11 DD 77 F8      [19] 3962 	ld	-8 (ix),a
   5D14 21 1D 00      [10] 3963 	ld	hl,#0x001D
   5D17 19            [11] 3964 	add	hl,de
   5D18 DD 75 F9      [19] 3965 	ld	-7 (ix),l
   5D1B DD 74 FA      [19] 3966 	ld	-6 (ix),h
   5D1E DD 7E F8      [19] 3967 	ld	a,-8 (ix)
   5D21 B7            [ 4] 3968 	or	a, a
   5D22 28 0C         [12] 3969 	jr	Z,00133$
   5D24 DD 7E F9      [19] 3970 	ld	a,-7 (ix)
   5D27 DD 77 FE      [19] 3971 	ld	-2 (ix),a
   5D2A DD 7E FA      [19] 3972 	ld	a,-6 (ix)
   5D2D DD 77 FF      [19] 3973 	ld	-1 (ix),a
   5D30                    3974 00133$:
   5D30 DD 6E FE      [19] 3975 	ld	l,-2 (ix)
   5D33 DD 66 FF      [19] 3976 	ld	h,-1 (ix)
   5D36 CB 2C         [ 8] 3977 	sra	h
   5D38 CB 1D         [ 8] 3978 	rr	l
   5D3A CB 2C         [ 8] 3979 	sra	h
   5D3C CB 1D         [ 8] 3980 	rr	l
   5D3E CB 2C         [ 8] 3981 	sra	h
   5D40 CB 1D         [ 8] 3982 	rr	l
   5D42 CB 2C         [ 8] 3983 	sra	h
   5D44 CB 1D         [ 8] 3984 	rr	l
   5D46 5D            [ 4] 3985 	ld	e, l
   5D47 54            [ 4] 3986 	ld	d, h
   5D48 29            [11] 3987 	add	hl, hl
   5D49 29            [11] 3988 	add	hl, hl
   5D4A 19            [11] 3989 	add	hl, de
   5D4B 29            [11] 3990 	add	hl, hl
   5D4C 29            [11] 3991 	add	hl, hl
   5D4D 11 DC 6A      [10] 3992 	ld	de,#_scene
   5D50 19            [11] 3993 	add	hl,de
   5D51 DD 5E F7      [19] 3994 	ld	e,-9 (ix)
   5D54 16 00         [ 7] 3995 	ld	d,#0x00
   5D56 19            [11] 3996 	add	hl,de
   5D57 7E            [ 7] 3997 	ld	a,(hl)
   5D58 3D            [ 4] 3998 	dec	a
   5D59 28 62         [12] 3999 	jr	Z,00124$
                           4000 ;src/main.c:182: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5D5B DD 71 FE      [19] 4001 	ld	-2 (ix),c
   5D5E DD 70 FF      [19] 4002 	ld	-1 (ix),b
   5D61 DD 7E F8      [19] 4003 	ld	a,-8 (ix)
   5D64 B7            [ 4] 4004 	or	a, a
   5D65 28 0C         [12] 4005 	jr	Z,00134$
   5D67 DD 7E F9      [19] 4006 	ld	a,-7 (ix)
   5D6A DD 77 FE      [19] 4007 	ld	-2 (ix),a
   5D6D DD 7E FA      [19] 4008 	ld	a,-6 (ix)
   5D70 DD 77 FF      [19] 4009 	ld	-1 (ix),a
   5D73                    4010 00134$:
   5D73 DD 6E FE      [19] 4011 	ld	l,-2 (ix)
   5D76 DD 66 FF      [19] 4012 	ld	h,-1 (ix)
   5D79 CB 2C         [ 8] 4013 	sra	h
   5D7B CB 1D         [ 8] 4014 	rr	l
   5D7D CB 2C         [ 8] 4015 	sra	h
   5D7F CB 1D         [ 8] 4016 	rr	l
   5D81 CB 2C         [ 8] 4017 	sra	h
   5D83 CB 1D         [ 8] 4018 	rr	l
   5D85 CB 2C         [ 8] 4019 	sra	h
   5D87 CB 1D         [ 8] 4020 	rr	l
   5D89 5D            [ 4] 4021 	ld	e, l
   5D8A 54            [ 4] 4022 	ld	d, h
   5D8B 29            [11] 4023 	add	hl, hl
   5D8C 29            [11] 4024 	add	hl, hl
   5D8D 19            [11] 4025 	add	hl, de
   5D8E 29            [11] 4026 	add	hl, hl
   5D8F 29            [11] 4027 	add	hl, hl
   5D90 3E DC         [ 7] 4028 	ld	a,#<(_scene)
   5D92 85            [ 4] 4029 	add	a, l
   5D93 DD 77 FE      [19] 4030 	ld	-2 (ix),a
   5D96 3E 6A         [ 7] 4031 	ld	a,#>(_scene)
   5D98 8C            [ 4] 4032 	adc	a, h
   5D99 DD 77 FF      [19] 4033 	ld	-1 (ix),a
   5D9C DD 6E FB      [19] 4034 	ld	l,-5 (ix)
   5D9F DD 66 FC      [19] 4035 	ld	h,-4 (ix)
   5DA2 DD 7E FD      [19] 4036 	ld	a,-3 (ix)
   5DA5 B7            [ 4] 4037 	or	a, a
   5DA6 28 02         [12] 4038 	jr	Z,00135$
   5DA8 E1            [10] 4039 	pop	hl
   5DA9 E5            [11] 4040 	push	hl
   5DAA                    4041 00135$:
   5DAA CB 2C         [ 8] 4042 	sra	h
   5DAC CB 1D         [ 8] 4043 	rr	l
   5DAE CB 2C         [ 8] 4044 	sra	h
   5DB0 CB 1D         [ 8] 4045 	rr	l
   5DB2 DD 5E FE      [19] 4046 	ld	e,-2 (ix)
   5DB5 DD 56 FF      [19] 4047 	ld	d,-1 (ix)
   5DB8 19            [11] 4048 	add	hl,de
   5DB9 7E            [ 7] 4049 	ld	a,(hl)
   5DBA 3D            [ 4] 4050 	dec	a
   5DBB 20 10         [12] 4051 	jr	NZ,00125$
   5DBD                    4052 00124$:
                           4053 ;src/main.c:184: player.x=player.lx;
   5DBD 3A E1 6B      [13] 4054 	ld	a, (#_player + 2)
   5DC0 21 DF 6B      [10] 4055 	ld	hl,#_player
   5DC3 77            [ 7] 4056 	ld	(hl),a
                           4057 ;src/main.c:185: player.y=player.ly;
   5DC4 3A E2 6B      [13] 4058 	ld	a, (#_player + 3)
   5DC7 32 E0 6B      [13] 4059 	ld	(#(_player + 0x0001)),a
   5DCA C3 29 60      [10] 4060 	jp	00130$
   5DCD                    4061 00125$:
                           4062 ;src/main.c:187: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5DCD DD 7E F6      [19] 4063 	ld	a,-10 (ix)
   5DD0 D6 02         [ 7] 4064 	sub	a, #0x02
   5DD2 CA 75 5E      [10] 4065 	jp	Z,00118$
                           4066 ;src/main.c:188: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5DD5 DD 6E FB      [19] 4067 	ld	l,-5 (ix)
   5DD8 DD 66 FC      [19] 4068 	ld	h,-4 (ix)
   5DDB DD 7E FD      [19] 4069 	ld	a,-3 (ix)
   5DDE B7            [ 4] 4070 	or	a, a
   5DDF 28 02         [12] 4071 	jr	Z,00136$
   5DE1 E1            [10] 4072 	pop	hl
   5DE2 E5            [11] 4073 	push	hl
   5DE3                    4074 00136$:
   5DE3 CB 2C         [ 8] 4075 	sra	h
   5DE5 CB 1D         [ 8] 4076 	rr	l
   5DE7 CB 2C         [ 8] 4077 	sra	h
   5DE9 CB 1D         [ 8] 4078 	rr	l
   5DEB DD 5E F4      [19] 4079 	ld	e,-12 (ix)
   5DEE DD 56 F5      [19] 4080 	ld	d,-11 (ix)
   5DF1 19            [11] 4081 	add	hl,de
   5DF2 7E            [ 7] 4082 	ld	a,(hl)
   5DF3 D6 02         [ 7] 4083 	sub	a, #0x02
   5DF5 CA 75 5E      [10] 4084 	jp	Z,00118$
                           4085 ;src/main.c:189: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5DF8 69            [ 4] 4086 	ld	l, c
   5DF9 60            [ 4] 4087 	ld	h, b
   5DFA DD 7E F8      [19] 4088 	ld	a,-8 (ix)
   5DFD B7            [ 4] 4089 	or	a, a
   5DFE 28 06         [12] 4090 	jr	Z,00137$
   5E00 DD 6E F9      [19] 4091 	ld	l,-7 (ix)
   5E03 DD 66 FA      [19] 4092 	ld	h,-6 (ix)
   5E06                    4093 00137$:
   5E06 CB 2C         [ 8] 4094 	sra	h
   5E08 CB 1D         [ 8] 4095 	rr	l
   5E0A CB 2C         [ 8] 4096 	sra	h
   5E0C CB 1D         [ 8] 4097 	rr	l
   5E0E CB 2C         [ 8] 4098 	sra	h
   5E10 CB 1D         [ 8] 4099 	rr	l
   5E12 CB 2C         [ 8] 4100 	sra	h
   5E14 CB 1D         [ 8] 4101 	rr	l
   5E16 5D            [ 4] 4102 	ld	e, l
   5E17 54            [ 4] 4103 	ld	d, h
   5E18 29            [11] 4104 	add	hl, hl
   5E19 29            [11] 4105 	add	hl, hl
   5E1A 19            [11] 4106 	add	hl, de
   5E1B 29            [11] 4107 	add	hl, hl
   5E1C 29            [11] 4108 	add	hl, hl
   5E1D 11 DC 6A      [10] 4109 	ld	de,#_scene
   5E20 19            [11] 4110 	add	hl,de
   5E21 DD 5E F7      [19] 4111 	ld	e,-9 (ix)
   5E24 16 00         [ 7] 4112 	ld	d,#0x00
   5E26 19            [11] 4113 	add	hl,de
   5E27 7E            [ 7] 4114 	ld	a,(hl)
   5E28 D6 02         [ 7] 4115 	sub	a, #0x02
   5E2A 28 49         [12] 4116 	jr	Z,00118$
                           4117 ;src/main.c:190: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5E2C 69            [ 4] 4118 	ld	l, c
   5E2D 60            [ 4] 4119 	ld	h, b
   5E2E DD 7E F8      [19] 4120 	ld	a,-8 (ix)
   5E31 B7            [ 4] 4121 	or	a, a
   5E32 28 06         [12] 4122 	jr	Z,00138$
   5E34 DD 6E F9      [19] 4123 	ld	l,-7 (ix)
   5E37 DD 66 FA      [19] 4124 	ld	h,-6 (ix)
   5E3A                    4125 00138$:
   5E3A CB 2C         [ 8] 4126 	sra	h
   5E3C CB 1D         [ 8] 4127 	rr	l
   5E3E CB 2C         [ 8] 4128 	sra	h
   5E40 CB 1D         [ 8] 4129 	rr	l
   5E42 CB 2C         [ 8] 4130 	sra	h
   5E44 CB 1D         [ 8] 4131 	rr	l
   5E46 CB 2C         [ 8] 4132 	sra	h
   5E48 CB 1D         [ 8] 4133 	rr	l
   5E4A 5D            [ 4] 4134 	ld	e, l
   5E4B 54            [ 4] 4135 	ld	d, h
   5E4C 29            [11] 4136 	add	hl, hl
   5E4D 29            [11] 4137 	add	hl, hl
   5E4E 19            [11] 4138 	add	hl, de
   5E4F 29            [11] 4139 	add	hl, hl
   5E50 29            [11] 4140 	add	hl, hl
   5E51 3E DC         [ 7] 4141 	ld	a,#<(_scene)
   5E53 85            [ 4] 4142 	add	a, l
   5E54 5F            [ 4] 4143 	ld	e,a
   5E55 3E 6A         [ 7] 4144 	ld	a,#>(_scene)
   5E57 8C            [ 4] 4145 	adc	a, h
   5E58 57            [ 4] 4146 	ld	d,a
   5E59 DD 6E FB      [19] 4147 	ld	l,-5 (ix)
   5E5C DD 66 FC      [19] 4148 	ld	h,-4 (ix)
   5E5F DD 7E FD      [19] 4149 	ld	a,-3 (ix)
   5E62 B7            [ 4] 4150 	or	a, a
   5E63 28 02         [12] 4151 	jr	Z,00139$
   5E65 E1            [10] 4152 	pop	hl
   5E66 E5            [11] 4153 	push	hl
   5E67                    4154 00139$:
   5E67 CB 2C         [ 8] 4155 	sra	h
   5E69 CB 1D         [ 8] 4156 	rr	l
   5E6B CB 2C         [ 8] 4157 	sra	h
   5E6D CB 1D         [ 8] 4158 	rr	l
   5E6F 19            [11] 4159 	add	hl,de
   5E70 7E            [ 7] 4160 	ld	a,(hl)
   5E71 D6 02         [ 7] 4161 	sub	a, #0x02
   5E73 20 21         [12] 4162 	jr	NZ,00119$
   5E75                    4163 00118$:
                           4164 ;src/main.c:192: if(player.life < 3 && *corazon == 0){
   5E75 FD 21 E5 6B   [14] 4165 	ld	iy,#_player + 6
   5E79 FD 5E 00      [19] 4166 	ld	e, 0 (iy)
   5E7C 7B            [ 4] 4167 	ld	a,e
   5E7D D6 03         [ 7] 4168 	sub	a, #0x03
   5E7F D2 29 60      [10] 4169 	jp	NC,00130$
   5E82 DD 6E 04      [19] 4170 	ld	l,4 (ix)
   5E85 DD 66 05      [19] 4171 	ld	h,5 (ix)
   5E88 7E            [ 7] 4172 	ld	a,(hl)
   5E89 B7            [ 4] 4173 	or	a, a
   5E8A C2 29 60      [10] 4174 	jp	NZ,00130$
                           4175 ;src/main.c:193: player.life += 1;
   5E8D 1C            [ 4] 4176 	inc	e
   5E8E FD 73 00      [19] 4177 	ld	0 (iy), e
                           4178 ;src/main.c:194: *corazon = 1;
   5E91 36 01         [10] 4179 	ld	(hl),#0x01
   5E93 C3 29 60      [10] 4180 	jp	00130$
   5E96                    4181 00119$:
                           4182 ;src/main.c:197: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5E96 DD 7E F6      [19] 4183 	ld	a,-10 (ix)
   5E99 D6 05         [ 7] 4184 	sub	a, #0x05
   5E9B CA 3E 5F      [10] 4185 	jp	Z,00112$
                           4186 ;src/main.c:198: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5E9E DD 6E FB      [19] 4187 	ld	l,-5 (ix)
   5EA1 DD 66 FC      [19] 4188 	ld	h,-4 (ix)
   5EA4 DD 7E FD      [19] 4189 	ld	a,-3 (ix)
   5EA7 B7            [ 4] 4190 	or	a, a
   5EA8 28 02         [12] 4191 	jr	Z,00140$
   5EAA E1            [10] 4192 	pop	hl
   5EAB E5            [11] 4193 	push	hl
   5EAC                    4194 00140$:
   5EAC CB 2C         [ 8] 4195 	sra	h
   5EAE CB 1D         [ 8] 4196 	rr	l
   5EB0 CB 2C         [ 8] 4197 	sra	h
   5EB2 CB 1D         [ 8] 4198 	rr	l
   5EB4 DD 5E F4      [19] 4199 	ld	e,-12 (ix)
   5EB7 DD 56 F5      [19] 4200 	ld	d,-11 (ix)
   5EBA 19            [11] 4201 	add	hl,de
   5EBB 7E            [ 7] 4202 	ld	a,(hl)
   5EBC D6 05         [ 7] 4203 	sub	a, #0x05
   5EBE CA 3E 5F      [10] 4204 	jp	Z,00112$
                           4205 ;src/main.c:199: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5EC1 69            [ 4] 4206 	ld	l, c
   5EC2 60            [ 4] 4207 	ld	h, b
   5EC3 DD 7E F8      [19] 4208 	ld	a,-8 (ix)
   5EC6 B7            [ 4] 4209 	or	a, a
   5EC7 28 06         [12] 4210 	jr	Z,00141$
   5EC9 DD 6E F9      [19] 4211 	ld	l,-7 (ix)
   5ECC DD 66 FA      [19] 4212 	ld	h,-6 (ix)
   5ECF                    4213 00141$:
   5ECF CB 2C         [ 8] 4214 	sra	h
   5ED1 CB 1D         [ 8] 4215 	rr	l
   5ED3 CB 2C         [ 8] 4216 	sra	h
   5ED5 CB 1D         [ 8] 4217 	rr	l
   5ED7 CB 2C         [ 8] 4218 	sra	h
   5ED9 CB 1D         [ 8] 4219 	rr	l
   5EDB CB 2C         [ 8] 4220 	sra	h
   5EDD CB 1D         [ 8] 4221 	rr	l
   5EDF 5D            [ 4] 4222 	ld	e, l
   5EE0 54            [ 4] 4223 	ld	d, h
   5EE1 29            [11] 4224 	add	hl, hl
   5EE2 29            [11] 4225 	add	hl, hl
   5EE3 19            [11] 4226 	add	hl, de
   5EE4 29            [11] 4227 	add	hl, hl
   5EE5 29            [11] 4228 	add	hl, hl
   5EE6 11 DC 6A      [10] 4229 	ld	de,#_scene
   5EE9 19            [11] 4230 	add	hl,de
   5EEA DD 5E F7      [19] 4231 	ld	e,-9 (ix)
   5EED 16 00         [ 7] 4232 	ld	d,#0x00
   5EEF 19            [11] 4233 	add	hl,de
   5EF0 7E            [ 7] 4234 	ld	a,(hl)
   5EF1 D6 05         [ 7] 4235 	sub	a, #0x05
   5EF3 28 49         [12] 4236 	jr	Z,00112$
                           4237 ;src/main.c:200: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5EF5 69            [ 4] 4238 	ld	l, c
   5EF6 60            [ 4] 4239 	ld	h, b
   5EF7 DD 7E F8      [19] 4240 	ld	a,-8 (ix)
   5EFA B7            [ 4] 4241 	or	a, a
   5EFB 28 06         [12] 4242 	jr	Z,00142$
   5EFD DD 6E F9      [19] 4243 	ld	l,-7 (ix)
   5F00 DD 66 FA      [19] 4244 	ld	h,-6 (ix)
   5F03                    4245 00142$:
   5F03 CB 2C         [ 8] 4246 	sra	h
   5F05 CB 1D         [ 8] 4247 	rr	l
   5F07 CB 2C         [ 8] 4248 	sra	h
   5F09 CB 1D         [ 8] 4249 	rr	l
   5F0B CB 2C         [ 8] 4250 	sra	h
   5F0D CB 1D         [ 8] 4251 	rr	l
   5F0F CB 2C         [ 8] 4252 	sra	h
   5F11 CB 1D         [ 8] 4253 	rr	l
   5F13 5D            [ 4] 4254 	ld	e, l
   5F14 54            [ 4] 4255 	ld	d, h
   5F15 29            [11] 4256 	add	hl, hl
   5F16 29            [11] 4257 	add	hl, hl
   5F17 19            [11] 4258 	add	hl, de
   5F18 29            [11] 4259 	add	hl, hl
   5F19 29            [11] 4260 	add	hl, hl
   5F1A 3E DC         [ 7] 4261 	ld	a,#<(_scene)
   5F1C 85            [ 4] 4262 	add	a, l
   5F1D 5F            [ 4] 4263 	ld	e,a
   5F1E 3E 6A         [ 7] 4264 	ld	a,#>(_scene)
   5F20 8C            [ 4] 4265 	adc	a, h
   5F21 57            [ 4] 4266 	ld	d,a
   5F22 DD 6E FB      [19] 4267 	ld	l,-5 (ix)
   5F25 DD 66 FC      [19] 4268 	ld	h,-4 (ix)
   5F28 DD 7E FD      [19] 4269 	ld	a,-3 (ix)
   5F2B B7            [ 4] 4270 	or	a, a
   5F2C 28 02         [12] 4271 	jr	Z,00143$
   5F2E E1            [10] 4272 	pop	hl
   5F2F E5            [11] 4273 	push	hl
   5F30                    4274 00143$:
   5F30 CB 2C         [ 8] 4275 	sra	h
   5F32 CB 1D         [ 8] 4276 	rr	l
   5F34 CB 2C         [ 8] 4277 	sra	h
   5F36 CB 1D         [ 8] 4278 	rr	l
   5F38 19            [11] 4279 	add	hl,de
   5F39 7E            [ 7] 4280 	ld	a,(hl)
   5F3A D6 05         [ 7] 4281 	sub	a, #0x05
   5F3C 20 21         [12] 4282 	jr	NZ,00113$
   5F3E                    4283 00112$:
                           4284 ;src/main.c:202: if(player.bullets < 3 && *flecha == 0){
   5F3E FD 21 E9 6B   [14] 4285 	ld	iy,#_player + 10
   5F42 FD 5E 00      [19] 4286 	ld	e, 0 (iy)
   5F45 7B            [ 4] 4287 	ld	a,e
   5F46 D6 03         [ 7] 4288 	sub	a, #0x03
   5F48 D2 29 60      [10] 4289 	jp	NC,00130$
   5F4B DD 6E 06      [19] 4290 	ld	l,6 (ix)
   5F4E DD 66 07      [19] 4291 	ld	h,7 (ix)
   5F51 7E            [ 7] 4292 	ld	a,(hl)
   5F52 B7            [ 4] 4293 	or	a, a
   5F53 C2 29 60      [10] 4294 	jp	NZ,00130$
                           4295 ;src/main.c:203: player.bullets += 1;
   5F56 1C            [ 4] 4296 	inc	e
   5F57 FD 73 00      [19] 4297 	ld	0 (iy), e
                           4298 ;src/main.c:204: *flecha = 1;
   5F5A 36 01         [10] 4299 	ld	(hl),#0x01
   5F5C C3 29 60      [10] 4300 	jp	00130$
   5F5F                    4301 00113$:
                           4302 ;src/main.c:206: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5F5F DD 7E F6      [19] 4303 	ld	a,-10 (ix)
   5F62 D6 09         [ 7] 4304 	sub	a, #0x09
   5F64 CA 0F 60      [10] 4305 	jp	Z,00107$
                           4306 ;src/main.c:207: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5F67 DD 6E FB      [19] 4307 	ld	l,-5 (ix)
   5F6A DD 66 FC      [19] 4308 	ld	h,-4 (ix)
   5F6D DD 7E FD      [19] 4309 	ld	a,-3 (ix)
   5F70 B7            [ 4] 4310 	or	a, a
   5F71 28 02         [12] 4311 	jr	Z,00144$
   5F73 E1            [10] 4312 	pop	hl
   5F74 E5            [11] 4313 	push	hl
   5F75                    4314 00144$:
   5F75 CB 2C         [ 8] 4315 	sra	h
   5F77 CB 1D         [ 8] 4316 	rr	l
   5F79 CB 2C         [ 8] 4317 	sra	h
   5F7B CB 1D         [ 8] 4318 	rr	l
   5F7D DD 5E F4      [19] 4319 	ld	e,-12 (ix)
   5F80 DD 56 F5      [19] 4320 	ld	d,-11 (ix)
   5F83 19            [11] 4321 	add	hl,de
   5F84 7E            [ 7] 4322 	ld	a,(hl)
   5F85 D6 09         [ 7] 4323 	sub	a, #0x09
   5F87 CA 0F 60      [10] 4324 	jp	Z,00107$
                           4325 ;src/main.c:208: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5F8A 69            [ 4] 4326 	ld	l, c
   5F8B 60            [ 4] 4327 	ld	h, b
   5F8C DD 7E F8      [19] 4328 	ld	a,-8 (ix)
   5F8F B7            [ 4] 4329 	or	a, a
   5F90 28 06         [12] 4330 	jr	Z,00145$
   5F92 DD 6E F9      [19] 4331 	ld	l,-7 (ix)
   5F95 DD 66 FA      [19] 4332 	ld	h,-6 (ix)
   5F98                    4333 00145$:
   5F98 CB 2C         [ 8] 4334 	sra	h
   5F9A CB 1D         [ 8] 4335 	rr	l
   5F9C CB 2C         [ 8] 4336 	sra	h
   5F9E CB 1D         [ 8] 4337 	rr	l
   5FA0 CB 2C         [ 8] 4338 	sra	h
   5FA2 CB 1D         [ 8] 4339 	rr	l
   5FA4 CB 2C         [ 8] 4340 	sra	h
   5FA6 CB 1D         [ 8] 4341 	rr	l
   5FA8 5D            [ 4] 4342 	ld	e, l
   5FA9 54            [ 4] 4343 	ld	d, h
   5FAA 29            [11] 4344 	add	hl, hl
   5FAB 29            [11] 4345 	add	hl, hl
   5FAC 19            [11] 4346 	add	hl, de
   5FAD 29            [11] 4347 	add	hl, hl
   5FAE 29            [11] 4348 	add	hl, hl
   5FAF 11 DC 6A      [10] 4349 	ld	de,#_scene
   5FB2 19            [11] 4350 	add	hl,de
   5FB3 DD 5E F7      [19] 4351 	ld	e,-9 (ix)
   5FB6 16 00         [ 7] 4352 	ld	d,#0x00
   5FB8 19            [11] 4353 	add	hl,de
   5FB9 7E            [ 7] 4354 	ld	a,(hl)
   5FBA D6 09         [ 7] 4355 	sub	a, #0x09
   5FBC 28 51         [12] 4356 	jr	Z,00107$
                           4357 ;src/main.c:209: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5FBE DD 7E F8      [19] 4358 	ld	a,-8 (ix)
   5FC1 B7            [ 4] 4359 	or	a, a
   5FC2 28 06         [12] 4360 	jr	Z,00146$
   5FC4 DD 4E F9      [19] 4361 	ld	c,-7 (ix)
   5FC7 DD 46 FA      [19] 4362 	ld	b,-6 (ix)
   5FCA                    4363 00146$:
   5FCA CB 28         [ 8] 4364 	sra	b
   5FCC CB 19         [ 8] 4365 	rr	c
   5FCE CB 28         [ 8] 4366 	sra	b
   5FD0 CB 19         [ 8] 4367 	rr	c
   5FD2 CB 28         [ 8] 4368 	sra	b
   5FD4 CB 19         [ 8] 4369 	rr	c
   5FD6 CB 28         [ 8] 4370 	sra	b
   5FD8 CB 19         [ 8] 4371 	rr	c
   5FDA 69            [ 4] 4372 	ld	l, c
   5FDB 60            [ 4] 4373 	ld	h, b
   5FDC 29            [11] 4374 	add	hl, hl
   5FDD 29            [11] 4375 	add	hl, hl
   5FDE 09            [11] 4376 	add	hl, bc
   5FDF 29            [11] 4377 	add	hl, hl
   5FE0 29            [11] 4378 	add	hl, hl
   5FE1 3E DC         [ 7] 4379 	ld	a,#<(_scene)
   5FE3 85            [ 4] 4380 	add	a, l
   5FE4 DD 77 F9      [19] 4381 	ld	-7 (ix),a
   5FE7 3E 6A         [ 7] 4382 	ld	a,#>(_scene)
   5FE9 8C            [ 4] 4383 	adc	a, h
   5FEA DD 77 FA      [19] 4384 	ld	-6 (ix),a
   5FED DD 6E FB      [19] 4385 	ld	l,-5 (ix)
   5FF0 DD 66 FC      [19] 4386 	ld	h,-4 (ix)
   5FF3 DD 7E FD      [19] 4387 	ld	a,-3 (ix)
   5FF6 B7            [ 4] 4388 	or	a, a
   5FF7 28 02         [12] 4389 	jr	Z,00147$
   5FF9 E1            [10] 4390 	pop	hl
   5FFA E5            [11] 4391 	push	hl
   5FFB                    4392 00147$:
   5FFB CB 2C         [ 8] 4393 	sra	h
   5FFD CB 1D         [ 8] 4394 	rr	l
   5FFF CB 2C         [ 8] 4395 	sra	h
   6001 CB 1D         [ 8] 4396 	rr	l
   6003 DD 5E F9      [19] 4397 	ld	e,-7 (ix)
   6006 DD 56 FA      [19] 4398 	ld	d,-6 (ix)
   6009 19            [11] 4399 	add	hl,de
   600A 7E            [ 7] 4400 	ld	a,(hl)
   600B D6 09         [ 7] 4401 	sub	a, #0x09
   600D 20 1A         [12] 4402 	jr	NZ,00130$
   600F                    4403 00107$:
                           4404 ;src/main.c:212: cpct_clearScreen(0);
   600F 21 00 40      [10] 4405 	ld	hl,#0x4000
   6012 E5            [11] 4406 	push	hl
   6013 AF            [ 4] 4407 	xor	a, a
   6014 F5            [11] 4408 	push	af
   6015 33            [ 6] 4409 	inc	sp
   6016 26 C0         [ 7] 4410 	ld	h, #0xC0
   6018 E5            [11] 4411 	push	hl
   6019 CD F3 68      [17] 4412 	call	_cpct_memset
                           4413 ;src/main.c:213: map+=1;
   601C 21 CE 6B      [10] 4414 	ld	hl, #_map+0
   601F 34            [11] 4415 	inc	(hl)
                           4416 ;src/main.c:214: drawMap(map);
   6020 3A CE 6B      [13] 4417 	ld	a,(_map)
   6023 F5            [11] 4418 	push	af
   6024 33            [ 6] 4419 	inc	sp
   6025 CD C0 46      [17] 4420 	call	_drawMap
   6028 33            [ 6] 4421 	inc	sp
   6029                    4422 00130$:
   6029 DD F9         [10] 4423 	ld	sp, ix
   602B DD E1         [14] 4424 	pop	ix
   602D C9            [10] 4425 	ret
                           4426 ;src/main.c:218: u8 checkArrowCollisions(){
                           4427 ;	---------------------------------
                           4428 ; Function checkArrowCollisions
                           4429 ; ---------------------------------
   602E                    4430 _checkArrowCollisions::
   602E DD E5         [15] 4431 	push	ix
   6030 DD 21 00 00   [14] 4432 	ld	ix,#0
   6034 DD 39         [15] 4433 	add	ix,sp
   6036 21 F4 FF      [10] 4434 	ld	hl,#-12
   6039 39            [11] 4435 	add	hl,sp
   603A F9            [ 6] 4436 	ld	sp,hl
                           4437 ;src/main.c:219: u8 bound =0;
   603B DD 36 F4 00   [19] 4438 	ld	-12 (ix),#0x00
                           4439 ;src/main.c:220: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   603F 3A D6 6B      [13] 4440 	ld	a,(#(_object + 0x0001) + 0)
   6042 DD 77 F6      [19] 4441 	ld	-10 (ix), a
   6045 07            [ 4] 4442 	rlca
   6046 07            [ 4] 4443 	rlca
   6047 07            [ 4] 4444 	rlca
   6048 07            [ 4] 4445 	rlca
   6049 E6 0F         [ 7] 4446 	and	a,#0x0F
   604B 4F            [ 4] 4447 	ld	c,a
   604C 06 00         [ 7] 4448 	ld	b,#0x00
   604E 69            [ 4] 4449 	ld	l, c
   604F 60            [ 4] 4450 	ld	h, b
   6050 29            [11] 4451 	add	hl, hl
   6051 29            [11] 4452 	add	hl, hl
   6052 09            [11] 4453 	add	hl, bc
   6053 29            [11] 4454 	add	hl, hl
   6054 29            [11] 4455 	add	hl, hl
   6055 3E DC         [ 7] 4456 	ld	a,#<(_scene)
   6057 85            [ 4] 4457 	add	a, l
   6058 DD 77 F7      [19] 4458 	ld	-9 (ix),a
   605B 3E 6A         [ 7] 4459 	ld	a,#>(_scene)
   605D 8C            [ 4] 4460 	adc	a, h
   605E DD 77 F8      [19] 4461 	ld	-8 (ix),a
   6061 21 D5 6B      [10] 4462 	ld	hl, #_object + 0
   6064 4E            [ 7] 4463 	ld	c,(hl)
   6065 79            [ 4] 4464 	ld	a,c
   6066 0F            [ 4] 4465 	rrca
   6067 0F            [ 4] 4466 	rrca
   6068 E6 3F         [ 7] 4467 	and	a,#0x3F
   606A DD 77 F5      [19] 4468 	ld	-11 (ix),a
   606D DD 7E F7      [19] 4469 	ld	a,-9 (ix)
   6070 DD 86 F5      [19] 4470 	add	a, -11 (ix)
   6073 6F            [ 4] 4471 	ld	l,a
   6074 DD 7E F8      [19] 4472 	ld	a,-8 (ix)
   6077 CE 00         [ 7] 4473 	adc	a, #0x00
   6079 67            [ 4] 4474 	ld	h,a
   607A 7E            [ 7] 4475 	ld	a,(hl)
   607B 3D            [ 4] 4476 	dec	a
   607C CA 7B 61      [10] 4477 	jp	Z,00101$
                           4478 ;src/main.c:221: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   607F 06 00         [ 7] 4479 	ld	b,#0x00
   6081 21 03 00      [10] 4480 	ld	hl,#0x0003
   6084 09            [11] 4481 	add	hl,bc
   6085 DD 75 F9      [19] 4482 	ld	-7 (ix),l
   6088 DD 74 FA      [19] 4483 	ld	-6 (ix),h
   608B DD 7E F9      [19] 4484 	ld	a,-7 (ix)
   608E DD 77 FB      [19] 4485 	ld	-5 (ix),a
   6091 DD 7E FA      [19] 4486 	ld	a,-6 (ix)
   6094 DD 77 FC      [19] 4487 	ld	-4 (ix),a
   6097 DD 7E FA      [19] 4488 	ld	a,-6 (ix)
   609A 07            [ 4] 4489 	rlca
   609B E6 01         [ 7] 4490 	and	a,#0x01
   609D DD 77 FF      [19] 4491 	ld	-1 (ix),a
   60A0 21 06 00      [10] 4492 	ld	hl,#0x0006
   60A3 09            [11] 4493 	add	hl,bc
   60A4 DD 75 FD      [19] 4494 	ld	-3 (ix),l
   60A7 DD 74 FE      [19] 4495 	ld	-2 (ix),h
   60AA DD 7E FF      [19] 4496 	ld	a,-1 (ix)
   60AD B7            [ 4] 4497 	or	a, a
   60AE 28 0C         [12] 4498 	jr	Z,00108$
   60B0 DD 7E FD      [19] 4499 	ld	a,-3 (ix)
   60B3 DD 77 FB      [19] 4500 	ld	-5 (ix),a
   60B6 DD 7E FE      [19] 4501 	ld	a,-2 (ix)
   60B9 DD 77 FC      [19] 4502 	ld	-4 (ix),a
   60BC                    4503 00108$:
   60BC DD 6E FB      [19] 4504 	ld	l,-5 (ix)
   60BF DD 66 FC      [19] 4505 	ld	h,-4 (ix)
   60C2 CB 2C         [ 8] 4506 	sra	h
   60C4 CB 1D         [ 8] 4507 	rr	l
   60C6 CB 2C         [ 8] 4508 	sra	h
   60C8 CB 1D         [ 8] 4509 	rr	l
   60CA DD 5E F7      [19] 4510 	ld	e,-9 (ix)
   60CD DD 56 F8      [19] 4511 	ld	d,-8 (ix)
   60D0 19            [11] 4512 	add	hl,de
   60D1 7E            [ 7] 4513 	ld	a,(hl)
   60D2 3D            [ 4] 4514 	dec	a
   60D3 CA 7B 61      [10] 4515 	jp	Z,00101$
                           4516 ;src/main.c:222: || scene[(object.y+tileheight-2)/tileheight][(object.x)/tilewidth] == 1
   60D6 DD 5E F6      [19] 4517 	ld	e,-10 (ix)
   60D9 16 00         [ 7] 4518 	ld	d,#0x00
   60DB 21 0E 00      [10] 4519 	ld	hl,#0x000E
   60DE 19            [11] 4520 	add	hl,de
   60DF 4D            [ 4] 4521 	ld	c,l
   60E0 44            [ 4] 4522 	ld	b,h
   60E1 69            [ 4] 4523 	ld	l, c
   60E2 78            [ 4] 4524 	ld	a,b
   60E3 67            [ 4] 4525 	ld	h,a
   60E4 07            [ 4] 4526 	rlca
   60E5 E6 01         [ 7] 4527 	and	a,#0x01
   60E7 DD 77 FB      [19] 4528 	ld	-5 (ix),a
   60EA 7B            [ 4] 4529 	ld	a,e
   60EB C6 1D         [ 7] 4530 	add	a, #0x1D
   60ED DD 77 F7      [19] 4531 	ld	-9 (ix),a
   60F0 7A            [ 4] 4532 	ld	a,d
   60F1 CE 00         [ 7] 4533 	adc	a, #0x00
   60F3 DD 77 F8      [19] 4534 	ld	-8 (ix),a
   60F6 DD 7E FB      [19] 4535 	ld	a,-5 (ix)
   60F9 B7            [ 4] 4536 	or	a, a
   60FA 28 06         [12] 4537 	jr	Z,00109$
   60FC DD 6E F7      [19] 4538 	ld	l,-9 (ix)
   60FF DD 66 F8      [19] 4539 	ld	h,-8 (ix)
   6102                    4540 00109$:
   6102 CB 2C         [ 8] 4541 	sra	h
   6104 CB 1D         [ 8] 4542 	rr	l
   6106 CB 2C         [ 8] 4543 	sra	h
   6108 CB 1D         [ 8] 4544 	rr	l
   610A CB 2C         [ 8] 4545 	sra	h
   610C CB 1D         [ 8] 4546 	rr	l
   610E CB 2C         [ 8] 4547 	sra	h
   6110 CB 1D         [ 8] 4548 	rr	l
   6112 5D            [ 4] 4549 	ld	e, l
   6113 54            [ 4] 4550 	ld	d, h
   6114 29            [11] 4551 	add	hl, hl
   6115 29            [11] 4552 	add	hl, hl
   6116 19            [11] 4553 	add	hl, de
   6117 29            [11] 4554 	add	hl, hl
   6118 29            [11] 4555 	add	hl, hl
   6119 11 DC 6A      [10] 4556 	ld	de,#_scene
   611C 19            [11] 4557 	add	hl,de
   611D DD 5E F5      [19] 4558 	ld	e,-11 (ix)
   6120 16 00         [ 7] 4559 	ld	d,#0x00
   6122 19            [11] 4560 	add	hl,de
   6123 7E            [ 7] 4561 	ld	a,(hl)
   6124 3D            [ 4] 4562 	dec	a
   6125 28 54         [12] 4563 	jr	Z,00101$
                           4564 ;src/main.c:223: || scene[(object.y+tileheight-2)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   6127 DD 7E FB      [19] 4565 	ld	a,-5 (ix)
   612A B7            [ 4] 4566 	or	a, a
   612B 28 06         [12] 4567 	jr	Z,00110$
   612D DD 4E F7      [19] 4568 	ld	c,-9 (ix)
   6130 DD 46 F8      [19] 4569 	ld	b,-8 (ix)
   6133                    4570 00110$:
   6133 CB 28         [ 8] 4571 	sra	b
   6135 CB 19         [ 8] 4572 	rr	c
   6137 CB 28         [ 8] 4573 	sra	b
   6139 CB 19         [ 8] 4574 	rr	c
   613B CB 28         [ 8] 4575 	sra	b
   613D CB 19         [ 8] 4576 	rr	c
   613F CB 28         [ 8] 4577 	sra	b
   6141 CB 19         [ 8] 4578 	rr	c
   6143 69            [ 4] 4579 	ld	l, c
   6144 60            [ 4] 4580 	ld	h, b
   6145 29            [11] 4581 	add	hl, hl
   6146 29            [11] 4582 	add	hl, hl
   6147 09            [11] 4583 	add	hl, bc
   6148 29            [11] 4584 	add	hl, hl
   6149 29            [11] 4585 	add	hl, hl
   614A 3E DC         [ 7] 4586 	ld	a,#<(_scene)
   614C 85            [ 4] 4587 	add	a, l
   614D DD 77 FB      [19] 4588 	ld	-5 (ix),a
   6150 3E 6A         [ 7] 4589 	ld	a,#>(_scene)
   6152 8C            [ 4] 4590 	adc	a, h
   6153 DD 77 FC      [19] 4591 	ld	-4 (ix),a
   6156 DD 6E F9      [19] 4592 	ld	l,-7 (ix)
   6159 DD 66 FA      [19] 4593 	ld	h,-6 (ix)
   615C DD 7E FF      [19] 4594 	ld	a,-1 (ix)
   615F B7            [ 4] 4595 	or	a, a
   6160 28 06         [12] 4596 	jr	Z,00111$
   6162 DD 6E FD      [19] 4597 	ld	l,-3 (ix)
   6165 DD 66 FE      [19] 4598 	ld	h,-2 (ix)
   6168                    4599 00111$:
   6168 CB 2C         [ 8] 4600 	sra	h
   616A CB 1D         [ 8] 4601 	rr	l
   616C CB 2C         [ 8] 4602 	sra	h
   616E CB 1D         [ 8] 4603 	rr	l
   6170 DD 5E FB      [19] 4604 	ld	e,-5 (ix)
   6173 DD 56 FC      [19] 4605 	ld	d,-4 (ix)
   6176 19            [11] 4606 	add	hl,de
   6177 7E            [ 7] 4607 	ld	a,(hl)
   6178 3D            [ 4] 4608 	dec	a
   6179 20 10         [12] 4609 	jr	NZ,00102$
   617B                    4610 00101$:
                           4611 ;src/main.c:225: object.x=object.lx;
   617B 3A D7 6B      [13] 4612 	ld	a, (#_object + 2)
   617E 32 D5 6B      [13] 4613 	ld	(#_object),a
                           4614 ;src/main.c:226: object.y=object.ly;
   6181 3A D8 6B      [13] 4615 	ld	a, (#_object + 3)
   6184 32 D6 6B      [13] 4616 	ld	(#(_object + 0x0001)),a
                           4617 ;src/main.c:227: bound = 1;
   6187 DD 36 F4 01   [19] 4618 	ld	-12 (ix),#0x01
   618B                    4619 00102$:
                           4620 ;src/main.c:230: return bound;
   618B DD 6E F4      [19] 4621 	ld	l,-12 (ix)
   618E DD F9         [10] 4622 	ld	sp, ix
   6190 DD E1         [14] 4623 	pop	ix
   6192 C9            [10] 4624 	ret
                           4625 ;src/main.c:236: void move(){
                           4626 ;	---------------------------------
                           4627 ; Function move
                           4628 ; ---------------------------------
   6193                    4629 _move::
                           4630 ;src/main.c:237: if(temp > 30){
   6193 3E 1E         [ 7] 4631 	ld	a,#0x1E
   6195 FD 21 CC 6B   [14] 4632 	ld	iy,#_temp
   6199 FD BE 00      [19] 4633 	cp	a, 0 (iy)
   619C 3E 00         [ 7] 4634 	ld	a,#0x00
   619E FD 21 CC 6B   [14] 4635 	ld	iy,#_temp
   61A2 FD 9E 01      [19] 4636 	sbc	a, 1 (iy)
   61A5 E2 AA 61      [10] 4637 	jp	PO, 00122$
   61A8 EE 80         [ 7] 4638 	xor	a, #0x80
   61AA                    4639 00122$:
   61AA F2 DC 61      [10] 4640 	jp	P,00102$
                           4641 ;src/main.c:238: enemy.dir = chooseDirection(enemy.dir);
   61AD 21 F3 6B      [10] 4642 	ld	hl,#_enemy + 9
   61B0 56            [ 7] 4643 	ld	d,(hl)
   61B1 E5            [11] 4644 	push	hl
   61B2 D5            [11] 4645 	push	de
   61B3 33            [ 6] 4646 	inc	sp
   61B4 CD 44 4F      [17] 4647 	call	_chooseDirection
   61B7 33            [ 6] 4648 	inc	sp
   61B8 7D            [ 4] 4649 	ld	a,l
   61B9 E1            [10] 4650 	pop	hl
   61BA 77            [ 7] 4651 	ld	(hl),a
                           4652 ;src/main.c:239: following = detectPlayerRoom(player.x,player.y,enemy.room);
   61BB 21 F5 6B      [10] 4653 	ld	hl, #_enemy + 11
   61BE 56            [ 7] 4654 	ld	d,(hl)
   61BF 3A E0 6B      [13] 4655 	ld	a, (#_player + 1)
   61C2 21 DF 6B      [10] 4656 	ld	hl, #_player + 0
   61C5 5E            [ 7] 4657 	ld	e,(hl)
   61C6 D5            [11] 4658 	push	de
   61C7 33            [ 6] 4659 	inc	sp
   61C8 57            [ 4] 4660 	ld	d,a
   61C9 D5            [11] 4661 	push	de
   61CA CD 0C 4F      [17] 4662 	call	_detectPlayerRoom
   61CD F1            [10] 4663 	pop	af
   61CE 33            [ 6] 4664 	inc	sp
   61CF FD 21 D2 6B   [14] 4665 	ld	iy,#_following
   61D3 FD 75 00      [19] 4666 	ld	0 (iy),l
                           4667 ;src/main.c:240: temp = 0;
   61D6 21 00 00      [10] 4668 	ld	hl,#0x0000
   61D9 22 CC 6B      [16] 4669 	ld	(_temp),hl
   61DC                    4670 00102$:
                           4671 ;src/main.c:242: if(temp%6 == 0){
   61DC 21 06 00      [10] 4672 	ld	hl,#0x0006
   61DF E5            [11] 4673 	push	hl
   61E0 2A CC 6B      [16] 4674 	ld	hl,(_temp)
   61E3 E5            [11] 4675 	push	hl
   61E4 CD DA 69      [17] 4676 	call	__modsint
   61E7 F1            [10] 4677 	pop	af
   61E8 F1            [10] 4678 	pop	af
   61E9 7C            [ 4] 4679 	ld	a,h
   61EA B5            [ 4] 4680 	or	a,l
   61EB 20 0E         [12] 4681 	jr	NZ,00107$
                           4682 ;src/main.c:243: if(following == 0){
   61ED 3A D2 6B      [13] 4683 	ld	a,(#_following + 0)
   61F0 B7            [ 4] 4684 	or	a, a
   61F1 20 05         [12] 4685 	jr	NZ,00104$
                           4686 ;src/main.c:244: patrol();
   61F3 CD 7F 51      [17] 4687 	call	_patrol
   61F6 18 03         [12] 4688 	jr	00107$
   61F8                    4689 00104$:
                           4690 ;src/main.c:247: followPlayer();
   61F8 CD FA 4F      [17] 4691 	call	_followPlayer
   61FB                    4692 00107$:
                           4693 ;src/main.c:250: temp += 1;
   61FB 21 CC 6B      [10] 4694 	ld	hl, #_temp+0
   61FE 34            [11] 4695 	inc	(hl)
   61FF C0            [11] 4696 	ret	NZ
   6200 21 CD 6B      [10] 4697 	ld	hl, #_temp+1
   6203 34            [11] 4698 	inc	(hl)
   6204 C9            [10] 4699 	ret
                           4700 ;src/main.c:256: void game(){
                           4701 ;	---------------------------------
                           4702 ; Function game
                           4703 ; ---------------------------------
   6205                    4704 _game::
   6205 DD E5         [15] 4705 	push	ix
   6207 DD 21 00 00   [14] 4706 	ld	ix,#0
   620B DD 39         [15] 4707 	add	ix,sp
   620D 21 F5 FF      [10] 4708 	ld	hl,#-11
   6210 39            [11] 4709 	add	hl,sp
   6211 F9            [ 6] 4710 	ld	sp,hl
                           4711 ;src/main.c:257: TNivel n = {0,0,0};
   6212 21 00 00      [10] 4712 	ld	hl,#0x0000
   6215 39            [11] 4713 	add	hl,sp
   6216 36 00         [10] 4714 	ld	(hl),#0x00
   6218 21 00 00      [10] 4715 	ld	hl,#0x0000
   621B 39            [11] 4716 	add	hl,sp
   621C 5D            [ 4] 4717 	ld	e, l
   621D 54            [ 4] 4718 	ld	d, h
   621E 23            [ 6] 4719 	inc	hl
   621F DD 75 FA      [19] 4720 	ld	-6 (ix),l
   6222 DD 74 FB      [19] 4721 	ld	-5 (ix),h
   6225 DD 6E FA      [19] 4722 	ld	l,-6 (ix)
   6228 DD 66 FB      [19] 4723 	ld	h,-5 (ix)
   622B 36 00         [10] 4724 	ld	(hl),#0x00
   622D 13            [ 6] 4725 	inc	de
   622E 13            [ 6] 4726 	inc	de
   622F DD 73 FC      [19] 4727 	ld	-4 (ix),e
   6232 DD 72 FD      [19] 4728 	ld	-3 (ix),d
   6235 DD 6E FC      [19] 4729 	ld	l,-4 (ix)
   6238 DD 66 FD      [19] 4730 	ld	h,-3 (ix)
   623B 36 00         [10] 4731 	ld	(hl),#0x00
                           4732 ;src/main.c:258: bound =0;
   623D 21 D3 6B      [10] 4733 	ld	hl,#_bound + 0
   6240 36 00         [10] 4734 	ld	(hl), #0x00
                           4735 ;src/main.c:259: temp = 0;
   6242 21 00 00      [10] 4736 	ld	hl,#0x0000
   6245 22 CC 6B      [16] 4737 	ld	(_temp),hl
                           4738 ;src/main.c:260: map = 1;
   6248 21 CE 6B      [10] 4739 	ld	hl,#_map + 0
   624B 36 01         [10] 4740 	ld	(hl), #0x01
                           4741 ;src/main.c:261: arrow =0;
   624D 21 D1 6B      [10] 4742 	ld	hl,#_arrow + 0
   6250 36 00         [10] 4743 	ld	(hl), #0x00
                           4744 ;src/main.c:262: finish =0;
   6252 21 D0 6B      [10] 4745 	ld	hl,#_finish + 0
   6255 36 00         [10] 4746 	ld	(hl), #0x00
                           4747 ;src/main.c:263: following =0;
   6257 21 D2 6B      [10] 4748 	ld	hl,#_following + 0
   625A 36 00         [10] 4749 	ld	(hl), #0x00
                           4750 ;src/main.c:264: archer = 0;
   625C 21 D4 6B      [10] 4751 	ld	hl,#_archer + 0
   625F 36 00         [10] 4752 	ld	(hl), #0x00
                           4753 ;src/main.c:266: initPlayer();
   6261 CD 4B 57      [17] 4754 	call	_initPlayer
                           4755 ;src/main.c:267: initEnemies();
   6264 CD 81 57      [17] 4756 	call	_initEnemies
                           4757 ;src/main.c:269: cpct_clearScreen(0);
   6267 21 00 40      [10] 4758 	ld	hl,#0x4000
   626A E5            [11] 4759 	push	hl
   626B AF            [ 4] 4760 	xor	a, a
   626C F5            [11] 4761 	push	af
   626D 33            [ 6] 4762 	inc	sp
   626E 26 C0         [ 7] 4763 	ld	h, #0xC0
   6270 E5            [11] 4764 	push	hl
   6271 CD F3 68      [17] 4765 	call	_cpct_memset
                           4766 ;src/main.c:270: drawMap(map);
   6274 3A CE 6B      [13] 4767 	ld	a,(_map)
   6277 F5            [11] 4768 	push	af
   6278 33            [ 6] 4769 	inc	sp
   6279 CD C0 46      [17] 4770 	call	_drawMap
   627C 33            [ 6] 4771 	inc	sp
                           4772 ;src/main.c:276: while (1){
   627D DD 7E FC      [19] 4773 	ld	a,-4 (ix)
   6280 DD 77 F8      [19] 4774 	ld	-8 (ix),a
   6283 DD 7E FD      [19] 4775 	ld	a,-3 (ix)
   6286 DD 77 F9      [19] 4776 	ld	-7 (ix),a
   6289 DD 7E FA      [19] 4777 	ld	a,-6 (ix)
   628C DD 77 FE      [19] 4778 	ld	-2 (ix),a
   628F DD 7E FB      [19] 4779 	ld	a,-5 (ix)
   6292 DD 77 FF      [19] 4780 	ld	-1 (ix),a
   6295                    4781 00112$:
                           4782 ;src/main.c:279: cpct_waitVSYNC();
   6295 CD D9 68      [17] 4783 	call	_cpct_waitVSYNC
                           4784 ;src/main.c:282: erases();
   6298 CD 19 4D      [17] 4785 	call	_erases
                           4786 ;src/main.c:285: drawPickUps(n.corazon,n.bullet);
   629B DD 6E FC      [19] 4787 	ld	l,-4 (ix)
   629E DD 66 FD      [19] 4788 	ld	h,-3 (ix)
   62A1 46            [ 7] 4789 	ld	b,(hl)
   62A2 DD 6E FA      [19] 4790 	ld	l,-6 (ix)
   62A5 DD 66 FB      [19] 4791 	ld	h,-5 (ix)
   62A8 4E            [ 7] 4792 	ld	c, (hl)
   62A9 C5            [11] 4793 	push	bc
   62AA CD A4 4E      [17] 4794 	call	_drawPickUps
   62AD F1            [10] 4795 	pop	af
                           4796 ;src/main.c:288: draws();
   62AE CD 79 4C      [17] 4797 	call	_draws
                           4798 ;src/main.c:291: if(player.atk < 20) drawFatiga(player.atk,2);
   62B1 21 E7 6B      [10] 4799 	ld	hl, #(_player + 0x0008) + 0
   62B4 56            [ 7] 4800 	ld	d,(hl)
   62B5 7A            [ 4] 4801 	ld	a,d
   62B6 D6 14         [ 7] 4802 	sub	a, #0x14
   62B8 30 0C         [12] 4803 	jr	NC,00105$
   62BA 3E 02         [ 7] 4804 	ld	a,#0x02
   62BC F5            [11] 4805 	push	af
   62BD 33            [ 6] 4806 	inc	sp
   62BE D5            [11] 4807 	push	de
   62BF 33            [ 6] 4808 	inc	sp
   62C0 CD 7E 4D      [17] 4809 	call	_drawFatiga
   62C3 F1            [10] 4810 	pop	af
   62C4 18 1A         [12] 4811 	jr	00106$
   62C6                    4812 00105$:
                           4813 ;src/main.c:292: else if(player.atk > 20) drawFatiga(player.atk,1);
   62C6 3E 14         [ 7] 4814 	ld	a,#0x14
   62C8 92            [ 4] 4815 	sub	a, d
   62C9 30 0C         [12] 4816 	jr	NC,00102$
   62CB 3E 01         [ 7] 4817 	ld	a,#0x01
   62CD F5            [11] 4818 	push	af
   62CE 33            [ 6] 4819 	inc	sp
   62CF D5            [11] 4820 	push	de
   62D0 33            [ 6] 4821 	inc	sp
   62D1 CD 7E 4D      [17] 4822 	call	_drawFatiga
   62D4 F1            [10] 4823 	pop	af
   62D5 18 09         [12] 4824 	jr	00106$
   62D7                    4825 00102$:
                           4826 ;src/main.c:293: else drawFatiga(player.atk,0);
   62D7 AF            [ 4] 4827 	xor	a, a
   62D8 F5            [11] 4828 	push	af
   62D9 33            [ 6] 4829 	inc	sp
   62DA D5            [11] 4830 	push	de
   62DB 33            [ 6] 4831 	inc	sp
   62DC CD 7E 4D      [17] 4832 	call	_drawFatiga
   62DF F1            [10] 4833 	pop	af
   62E0                    4834 00106$:
                           4835 ;src/main.c:296: player.lx = player.x;
   62E0 3A DF 6B      [13] 4836 	ld	a, (#_player + 0)
   62E3 21 E1 6B      [10] 4837 	ld	hl,#(_player + 0x0002)
   62E6 77            [ 7] 4838 	ld	(hl),a
                           4839 ;src/main.c:297: player.ly = player.y;
   62E7 3A E0 6B      [13] 4840 	ld	a, (#_player + 1)
   62EA 32 E2 6B      [13] 4841 	ld	(#(_player + 0x0003)),a
                           4842 ;src/main.c:298: enemy.lx = enemy.x;
   62ED 3A EA 6B      [13] 4843 	ld	a, (#_enemy + 0)
   62F0 32 EC 6B      [13] 4844 	ld	(#(_enemy + 0x0002)),a
                           4845 ;src/main.c:299: enemy.ly = enemy.y;
   62F3 3A EB 6B      [13] 4846 	ld	a, (#_enemy + 1)
   62F6 21 ED 6B      [10] 4847 	ld	hl,#(_enemy + 0x0003)
   62F9 77            [ 7] 4848 	ld	(hl),a
                           4849 ;src/main.c:300: player.latk = player.atk;
   62FA 3A E7 6B      [13] 4850 	ld	a, (#(_player + 0x0008) + 0)
   62FD 32 E8 6B      [13] 4851 	ld	(#(_player + 0x0009)),a
                           4852 ;src/main.c:305: cpct_scanKeyboard_f();
   6300 CD C9 66      [17] 4853 	call	_cpct_scanKeyboard_f
                           4854 ;src/main.c:306: player.sprite = checkKeyboard();
   6303 CD 7A 54      [17] 4855 	call	_checkKeyboard
   6306 5D            [ 4] 4856 	ld	e,l
   6307 54            [ 4] 4857 	ld	d,h
   6308 ED 53 E3 6B   [20] 4858 	ld	((_player + 0x0004)), de
                           4859 ;src/main.c:307: checkBoundsCollisions(&n.corazon,&n.bullet);
   630C DD 5E F8      [19] 4860 	ld	e,-8 (ix)
   630F DD 56 F9      [19] 4861 	ld	d,-7 (ix)
   6312 DD 6E FE      [19] 4862 	ld	l,-2 (ix)
   6315 DD 66 FF      [19] 4863 	ld	h,-1 (ix)
   6318 D5            [11] 4864 	push	de
   6319 E5            [11] 4865 	push	hl
   631A CD 5D 5C      [17] 4866 	call	_checkBoundsCollisions
   631D F1            [10] 4867 	pop	af
   631E F1            [10] 4868 	pop	af
                           4869 ;src/main.c:309: move();
   631F CD 93 61      [17] 4870 	call	_move
                           4871 ;src/main.c:311: if(arrow == 1){
   6322 3A D1 6B      [13] 4872 	ld	a,(#_arrow + 0)
   6325 3D            [ 4] 4873 	dec	a
   6326 20 0D         [12] 4874 	jr	NZ,00108$
                           4875 ;src/main.c:312: moveObject();
   6328 CD F1 56      [17] 4876 	call	_moveObject
                           4877 ;src/main.c:313: bound = checkArrowCollisions();
   632B CD 2E 60      [17] 4878 	call	_checkArrowCollisions
   632E FD 21 D3 6B   [14] 4879 	ld	iy,#_bound
   6332 FD 75 00      [19] 4880 	ld	0 (iy),l
   6335                    4881 00108$:
                           4882 ;src/main.c:318: if(finish == 1) return;
   6335 3A D0 6B      [13] 4883 	ld	a,(#_finish + 0)
   6338 3D            [ 4] 4884 	dec	a
   6339 C2 95 62      [10] 4885 	jp	NZ,00112$
   633C DD F9         [10] 4886 	ld	sp, ix
   633E DD E1         [14] 4887 	pop	ix
   6340 C9            [10] 4888 	ret
                           4889 ;src/main.c:325: void credits(){
                           4890 ;	---------------------------------
                           4891 ; Function credits
                           4892 ; ---------------------------------
   6341                    4893 _credits::
                           4894 ;src/main.c:327: cpct_clearScreen(0);
   6341 21 00 40      [10] 4895 	ld	hl,#0x4000
   6344 E5            [11] 4896 	push	hl
   6345 AF            [ 4] 4897 	xor	a, a
   6346 F5            [11] 4898 	push	af
   6347 33            [ 6] 4899 	inc	sp
   6348 26 C0         [ 7] 4900 	ld	h, #0xC0
   634A E5            [11] 4901 	push	hl
   634B CD F3 68      [17] 4902 	call	_cpct_memset
                           4903 ;src/main.c:328: memptr = cpct_getScreenPtr(VMEM,10,10);
   634E 21 0A 0A      [10] 4904 	ld	hl,#0x0A0A
   6351 E5            [11] 4905 	push	hl
   6352 21 00 C0      [10] 4906 	ld	hl,#0xC000
   6355 E5            [11] 4907 	push	hl
   6356 CD E6 69      [17] 4908 	call	_cpct_getScreenPtr
                           4909 ;src/main.c:329: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   6359 EB            [ 4] 4910 	ex	de,hl
   635A 01 A3 63      [10] 4911 	ld	bc,#___str_5
   635D D5            [11] 4912 	push	de
   635E 21 01 00      [10] 4913 	ld	hl,#0x0001
   6361 E5            [11] 4914 	push	hl
   6362 D5            [11] 4915 	push	de
   6363 C5            [11] 4916 	push	bc
   6364 CD AA 67      [17] 4917 	call	_cpct_drawStringM0
   6367 21 06 00      [10] 4918 	ld	hl,#6
   636A 39            [11] 4919 	add	hl,sp
   636B F9            [ 6] 4920 	ld	sp,hl
   636C D1            [10] 4921 	pop	de
                           4922 ;src/main.c:331: while (1){
   636D                    4923 00104$:
                           4924 ;src/main.c:333: cpct_scanKeyboard_f();
   636D D5            [11] 4925 	push	de
   636E CD C9 66      [17] 4926 	call	_cpct_scanKeyboard_f
   6371 D1            [10] 4927 	pop	de
                           4928 ;src/main.c:334: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   6372 01 B4 63      [10] 4929 	ld	bc,#___str_6
   6375 D5            [11] 4930 	push	de
   6376 21 01 00      [10] 4931 	ld	hl,#0x0001
   6379 E5            [11] 4932 	push	hl
   637A D5            [11] 4933 	push	de
   637B C5            [11] 4934 	push	bc
   637C CD AA 67      [17] 4935 	call	_cpct_drawStringM0
   637F 21 06 00      [10] 4936 	ld	hl,#6
   6382 39            [11] 4937 	add	hl,sp
   6383 F9            [ 6] 4938 	ld	sp,hl
   6384 D1            [10] 4939 	pop	de
                           4940 ;src/main.c:335: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   6385 01 CA 63      [10] 4941 	ld	bc,#___str_7
   6388 D5            [11] 4942 	push	de
   6389 21 01 00      [10] 4943 	ld	hl,#0x0001
   638C E5            [11] 4944 	push	hl
   638D D5            [11] 4945 	push	de
   638E C5            [11] 4946 	push	bc
   638F CD AA 67      [17] 4947 	call	_cpct_drawStringM0
   6392 21 06 00      [10] 4948 	ld	hl,#6
   6395 39            [11] 4949 	add	hl,sp
   6396 F9            [ 6] 4950 	ld	sp,hl
   6397 21 08 04      [10] 4951 	ld	hl,#0x0408
   639A CD BD 66      [17] 4952 	call	_cpct_isKeyPressed
   639D 7D            [ 4] 4953 	ld	a,l
   639E D1            [10] 4954 	pop	de
   639F B7            [ 4] 4955 	or	a, a
   63A0 28 CB         [12] 4956 	jr	Z,00104$
                           4957 ;src/main.c:339: return;
   63A2 C9            [10] 4958 	ret
   63A3                    4959 ___str_5:
   63A3 4C 6F 75 6E 67 65  4960 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   63B3 00                 4961 	.db 0x00
   63B4                    4962 ___str_6:
   63B4 4A 6F 73 65 70 20  4963 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   63C9 00                 4964 	.db 0x00
   63CA                    4965 ___str_7:
   63CA 41 6C 62 65 72 74  4966 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   63E3 00                 4967 	.db 0x00
                           4968 ;src/main.c:349: void main(void) {
                           4969 ;	---------------------------------
                           4970 ; Function main
                           4971 ; ---------------------------------
   63E4                    4972 _main::
                           4973 ;src/main.c:353: init();
   63E4 CD 26 57      [17] 4974 	call	_init
                           4975 ;src/main.c:356: while(1){
   63E7                    4976 00106$:
                           4977 ;src/main.c:357: x=menu();
   63E7 CD F7 57      [17] 4978 	call	_menu
   63EA 5D            [ 4] 4979 	ld	e, l
   63EB 54            [ 4] 4980 	ld	d, h
                           4981 ;src/main.c:358: switch(x){
   63EC CB 7A         [ 8] 4982 	bit	7, d
   63EE 20 F7         [12] 4983 	jr	NZ,00106$
   63F0 3E 02         [ 7] 4984 	ld	a,#0x02
   63F2 BB            [ 4] 4985 	cp	a, e
   63F3 3E 00         [ 7] 4986 	ld	a,#0x00
   63F5 9A            [ 4] 4987 	sbc	a, d
   63F6 E2 FB 63      [10] 4988 	jp	PO, 00122$
   63F9 EE 80         [ 7] 4989 	xor	a, #0x80
   63FB                    4990 00122$:
   63FB FA E7 63      [10] 4991 	jp	M,00106$
   63FE 16 00         [ 7] 4992 	ld	d,#0x00
   6400 21 06 64      [10] 4993 	ld	hl,#00123$
   6403 19            [11] 4994 	add	hl,de
   6404 19            [11] 4995 	add	hl,de
                           4996 ;src/main.c:359: case 0: return;break;
                           4997 ;src/main.c:360: case 1: game(); break;
   6405 E9            [ 4] 4998 	jp	(hl)
   6406                    4999 00123$:
   6406 18 10         [12] 5000 	jr	00108$
   6408 18 04         [12] 5001 	jr	00102$
   640A 18 07         [12] 5002 	jr	00103$
   640C 18 0A         [12] 5003 	jr	00108$
   640E                    5004 00102$:
   640E CD 05 62      [17] 5005 	call	_game
   6411 18 D4         [12] 5006 	jr	00106$
                           5007 ;src/main.c:361: case 2: credits();break;
   6413                    5008 00103$:
   6413 CD 41 63      [17] 5009 	call	_credits
                           5010 ;src/main.c:362: }
   6416 18 CF         [12] 5011 	jr	00106$
   6418                    5012 00108$:
   6418 C9            [10] 5013 	ret
                           5014 	.area _CODE
                           5015 	.area _INITIALIZER
                           5016 	.area _CABS (ABS)
