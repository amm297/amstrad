                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct 20 18:35:11 2015
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
                             27 	.globl _movement
                             28 	.globl _setDirection
                             29 	.globl _chooseDirection
                             30 	.globl _detectPlayerRoom
                             31 	.globl _drawPickUps
                             32 	.globl _drawFatiga
                             33 	.globl _erases
                             34 	.globl _draws
                             35 	.globl _drawStats
                             36 	.globl _erase
                             37 	.globl _draw
                             38 	.globl _drawBullets
                             39 	.globl _drawVida
                             40 	.globl _drawMap
                             41 	.globl _cpct_getScreenPtr
                             42 	.globl _cpct_setPalette
                             43 	.globl _cpct_fw2hw
                             44 	.globl _cpct_waitVSYNC
                             45 	.globl _cpct_setVideoMode
                             46 	.globl _cpct_drawStringM0
                             47 	.globl _cpct_drawSolidBox
                             48 	.globl _cpct_drawSpriteMasked
                             49 	.globl _cpct_isKeyPressed
                             50 	.globl _cpct_scanKeyboard_f
                             51 	.globl _cpct_scanKeyboard
                             52 	.globl _cpct_memset
                             53 	.globl _cpct_disableFirmware
                             54 	.globl _rand
                             55 	.globl _enemy
                             56 	.globl _player
                             57 	.globl _object
                             58 	.globl _archer
                             59 	.globl _bound
                             60 	.globl _following
                             61 	.globl _arrow
                             62 	.globl _finish
                             63 	.globl _path
                             64 	.globl _map
                             65 	.globl _temp
                             66 	.globl _scene
                             67 	.globl _mapa2
                             68 	.globl _mapa1
                             69 	.globl _origins
                             70 	.globl _g_palette
                             71 ;--------------------------------------------------------
                             72 ; special function registers
                             73 ;--------------------------------------------------------
                             74 ;--------------------------------------------------------
                             75 ; ram data
                             76 ;--------------------------------------------------------
                             77 	.area _DATA
   6525                      78 _scene::
   6525                      79 	.ds 240
   6615                      80 _temp::
   6615                      81 	.ds 2
   6617                      82 _map::
   6617                      83 	.ds 1
   6618                      84 _path::
   6618                      85 	.ds 1
   6619                      86 _finish::
   6619                      87 	.ds 1
   661A                      88 _arrow::
   661A                      89 	.ds 1
   661B                      90 _following::
   661B                      91 	.ds 1
   661C                      92 _bound::
   661C                      93 	.ds 1
   661D                      94 _archer::
   661D                      95 	.ds 1
   661E                      96 _object::
   661E                      97 	.ds 10
   6628                      98 _player::
   6628                      99 	.ds 11
   6633                     100 _enemy::
   6633                     101 	.ds 15
                            102 ;--------------------------------------------------------
                            103 ; ram data
                            104 ;--------------------------------------------------------
                            105 	.area _INITIALIZED
                            106 ;--------------------------------------------------------
                            107 ; absolute external ram data
                            108 ;--------------------------------------------------------
                            109 	.area _DABS (ABS)
                            110 ;--------------------------------------------------------
                            111 ; global & static initialisations
                            112 ;--------------------------------------------------------
                            113 	.area _HOME
                            114 	.area _GSINIT
                            115 	.area _GSFINAL
                            116 	.area _GSINIT
                            117 ;--------------------------------------------------------
                            118 ; Home
                            119 ;--------------------------------------------------------
                            120 	.area _HOME
                            121 	.area _HOME
                            122 ;--------------------------------------------------------
                            123 ; code
                            124 ;--------------------------------------------------------
                            125 	.area _CODE
                            126 ;src/draws.h:14: void drawMap(u8 t){
                            127 ;	---------------------------------
                            128 ; Function drawMap
                            129 ; ---------------------------------
   46C0                     130 _drawMap::
   46C0 DD E5         [15]  131 	push	ix
   46C2 DD 21 00 00   [14]  132 	ld	ix,#0
   46C6 DD 39         [15]  133 	add	ix,sp
   46C8 21 EE FF      [10]  134 	ld	hl,#-18
   46CB 39            [11]  135 	add	hl,sp
   46CC F9            [ 6]  136 	ld	sp,hl
                            137 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  138 	ld	a,4 (ix)
   46D0 3D            [ 4]  139 	dec	a
   46D1 C2 79 47      [10]  140 	jp	NZ,00104$
                            141 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  142 	ld	hl,#0x0000
   46D7 E3            [19]  143 	ex	(sp), hl
   46D8 DD 36 FC 00   [19]  144 	ld	-4 (ix),#0x00
   46DC DD 36 FD 00   [19]  145 	ld	-3 (ix),#0x00
                            146 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     147 00130$:
   46E0 3E 25         [ 7]  148 	ld	a,#<(_scene)
   46E2 DD 86 FC      [19]  149 	add	a, -4 (ix)
   46E5 DD 77 F8      [19]  150 	ld	-8 (ix),a
   46E8 3E 65         [ 7]  151 	ld	a,#>(_scene)
   46EA DD 8E FD      [19]  152 	adc	a, -3 (ix)
   46ED DD 77 F9      [19]  153 	ld	-7 (ix),a
   46F0 3E E2         [ 7]  154 	ld	a,#<(_mapa1)
   46F2 DD 86 FC      [19]  155 	add	a, -4 (ix)
   46F5 DD 77 F6      [19]  156 	ld	-10 (ix),a
   46F8 3E 48         [ 7]  157 	ld	a,#>(_mapa1)
   46FA DD 8E FD      [19]  158 	adc	a, -3 (ix)
   46FD DD 77 F7      [19]  159 	ld	-9 (ix),a
   4700 DD 36 F0 00   [19]  160 	ld	-16 (ix),#0x00
   4704 DD 36 F1 00   [19]  161 	ld	-15 (ix),#0x00
   4708                     162 00115$:
                            163 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E F8      [19]  164 	ld	a,-8 (ix)
   470B DD 86 F0      [19]  165 	add	a, -16 (ix)
   470E DD 77 FA      [19]  166 	ld	-6 (ix),a
   4711 DD 7E F9      [19]  167 	ld	a,-7 (ix)
   4714 DD 8E F1      [19]  168 	adc	a, -15 (ix)
   4717 DD 77 FB      [19]  169 	ld	-5 (ix),a
   471A DD 7E F6      [19]  170 	ld	a,-10 (ix)
   471D DD 86 F0      [19]  171 	add	a, -16 (ix)
   4720 DD 77 FE      [19]  172 	ld	-2 (ix),a
   4723 DD 7E F7      [19]  173 	ld	a,-9 (ix)
   4726 DD 8E F1      [19]  174 	adc	a, -15 (ix)
   4729 DD 77 FF      [19]  175 	ld	-1 (ix),a
   472C DD 6E FE      [19]  176 	ld	l,-2 (ix)
   472F DD 66 FF      [19]  177 	ld	h,-1 (ix)
   4732 7E            [ 7]  178 	ld	a,(hl)
   4733 DD 6E FA      [19]  179 	ld	l,-6 (ix)
   4736 DD 66 FB      [19]  180 	ld	h,-5 (ix)
   4739 77            [ 7]  181 	ld	(hl),a
                            182 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F0      [23]  183 	inc	-16 (ix)
   473D 20 03         [12]  184 	jr	NZ,00189$
   473F DD 34 F1      [23]  185 	inc	-15 (ix)
   4742                     186 00189$:
   4742 DD 7E F0      [19]  187 	ld	a,-16 (ix)
   4745 D6 14         [ 7]  188 	sub	a, #0x14
   4747 DD 7E F1      [19]  189 	ld	a,-15 (ix)
   474A 17            [ 4]  190 	rla
   474B 3F            [ 4]  191 	ccf
   474C 1F            [ 4]  192 	rra
   474D DE 80         [ 7]  193 	sbc	a, #0x80
   474F 38 B7         [12]  194 	jr	C,00115$
                            195 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E FC      [19]  196 	ld	a,-4 (ix)
   4754 C6 14         [ 7]  197 	add	a, #0x14
   4756 DD 77 FC      [19]  198 	ld	-4 (ix),a
   4759 DD 7E FD      [19]  199 	ld	a,-3 (ix)
   475C CE 00         [ 7]  200 	adc	a, #0x00
   475E DD 77 FD      [19]  201 	ld	-3 (ix),a
   4761 DD 34 EE      [23]  202 	inc	-18 (ix)
   4764 20 03         [12]  203 	jr	NZ,00190$
   4766 DD 34 EF      [23]  204 	inc	-17 (ix)
   4769                     205 00190$:
   4769 DD 7E EE      [19]  206 	ld	a,-18 (ix)
   476C D6 0C         [ 7]  207 	sub	a, #0x0C
   476E DD 7E EF      [19]  208 	ld	a,-17 (ix)
   4771 17            [ 4]  209 	rla
   4772 3F            [ 4]  210 	ccf
   4773 1F            [ 4]  211 	rra
   4774 DE 80         [ 7]  212 	sbc	a, #0x80
   4776 DA E0 46      [10]  213 	jp	C,00130$
   4779                     214 00104$:
                            215 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  216 	ld	a,4 (ix)
   477C D6 02         [ 7]  217 	sub	a, #0x02
   477E 20 5F         [12]  218 	jr	NZ,00141$
                            219 ;src/draws.h:27: for(y=0;y<height;y++){
   4780 21 00 00      [10]  220 	ld	hl,#0x0000
   4783 E3            [19]  221 	ex	(sp), hl
   4784 11 00 00      [10]  222 	ld	de,#0x0000
                            223 ;src/draws.h:28: for(x=0;x<width;x++){
   4787                     224 00134$:
   4787 21 25 65      [10]  225 	ld	hl,#_scene
   478A 19            [11]  226 	add	hl,de
   478B DD 75 FE      [19]  227 	ld	-2 (ix),l
   478E DD 74 FF      [19]  228 	ld	-1 (ix),h
   4791 21 D2 49      [10]  229 	ld	hl,#_mapa2
   4794 19            [11]  230 	add	hl,de
   4795 DD 75 FA      [19]  231 	ld	-6 (ix),l
   4798 DD 74 FB      [19]  232 	ld	-5 (ix),h
   479B 01 00 00      [10]  233 	ld	bc,#0x0000
   479E                     234 00119$:
                            235 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   479E E5            [11]  236 	push	hl
   479F DD 6E FE      [19]  237 	ld	l,-2 (ix)
   47A2 DD 66 FF      [19]  238 	ld	h,-1 (ix)
   47A5 E5            [11]  239 	push	hl
   47A6 FD E1         [14]  240 	pop	iy
   47A8 E1            [10]  241 	pop	hl
   47A9 FD 09         [15]  242 	add	iy, bc
   47AB DD 6E FA      [19]  243 	ld	l,-6 (ix)
   47AE DD 66 FB      [19]  244 	ld	h,-5 (ix)
   47B1 09            [11]  245 	add	hl,bc
   47B2 7E            [ 7]  246 	ld	a,(hl)
   47B3 FD 77 00      [19]  247 	ld	0 (iy), a
                            248 ;src/draws.h:28: for(x=0;x<width;x++){
   47B6 03            [ 6]  249 	inc	bc
   47B7 79            [ 4]  250 	ld	a,c
   47B8 D6 14         [ 7]  251 	sub	a, #0x14
   47BA 78            [ 4]  252 	ld	a,b
   47BB 17            [ 4]  253 	rla
   47BC 3F            [ 4]  254 	ccf
   47BD 1F            [ 4]  255 	rra
   47BE DE 80         [ 7]  256 	sbc	a, #0x80
   47C0 38 DC         [12]  257 	jr	C,00119$
                            258 ;src/draws.h:27: for(y=0;y<height;y++){
   47C2 21 14 00      [10]  259 	ld	hl,#0x0014
   47C5 19            [11]  260 	add	hl,de
   47C6 5D            [ 4]  261 	ld	e,l
   47C7 54            [ 4]  262 	ld	d,h
   47C8 DD 34 EE      [23]  263 	inc	-18 (ix)
   47CB 20 03         [12]  264 	jr	NZ,00193$
   47CD DD 34 EF      [23]  265 	inc	-17 (ix)
   47D0                     266 00193$:
   47D0 DD 7E EE      [19]  267 	ld	a,-18 (ix)
   47D3 D6 0C         [ 7]  268 	sub	a, #0x0C
   47D5 DD 7E EF      [19]  269 	ld	a,-17 (ix)
   47D8 17            [ 4]  270 	rla
   47D9 3F            [ 4]  271 	ccf
   47DA 1F            [ 4]  272 	rra
   47DB DE 80         [ 7]  273 	sbc	a, #0x80
   47DD 38 A8         [12]  274 	jr	C,00134$
                            275 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   47DF                     276 00141$:
   47DF DD 36 F2 00   [19]  277 	ld	-14 (ix),#0x00
   47E3 DD 36 F3 00   [19]  278 	ld	-13 (ix),#0x00
   47E7 DD 36 FE 00   [19]  279 	ld	-2 (ix),#0x00
   47EB DD 36 FF 00   [19]  280 	ld	-1 (ix),#0x00
   47EF DD 36 FA 00   [19]  281 	ld	-6 (ix),#0x00
   47F3 DD 36 FB 00   [19]  282 	ld	-5 (ix),#0x00
                            283 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   47F7                     284 00139$:
   47F7 3E 25         [ 7]  285 	ld	a,#<(_scene)
   47F9 DD 86 FA      [19]  286 	add	a, -6 (ix)
   47FC DD 77 F6      [19]  287 	ld	-10 (ix),a
   47FF 3E 65         [ 7]  288 	ld	a,#>(_scene)
   4801 DD 8E FB      [19]  289 	adc	a, -5 (ix)
   4804 DD 77 F7      [19]  290 	ld	-9 (ix),a
   4807 DD 36 F4 00   [19]  291 	ld	-12 (ix),#0x00
   480B DD 36 F5 00   [19]  292 	ld	-11 (ix),#0x00
   480F                     293 00123$:
                            294 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   480F DD 7E F2      [19]  295 	ld	a,-14 (ix)
   4812 07            [ 4]  296 	rlca
   4813 07            [ 4]  297 	rlca
   4814 07            [ 4]  298 	rlca
   4815 07            [ 4]  299 	rlca
   4816 E6 F0         [ 7]  300 	and	a,#0xF0
   4818 67            [ 4]  301 	ld	h,a
   4819 DD 7E F4      [19]  302 	ld	a,-12 (ix)
   481C 87            [ 4]  303 	add	a, a
   481D 87            [ 4]  304 	add	a, a
   481E E5            [11]  305 	push	hl
   481F 33            [ 6]  306 	inc	sp
   4820 F5            [11]  307 	push	af
   4821 33            [ 6]  308 	inc	sp
   4822 21 00 C0      [10]  309 	ld	hl,#0xC000
   4825 E5            [11]  310 	push	hl
   4826 CD 2F 64      [17]  311 	call	_cpct_getScreenPtr
   4829 EB            [ 4]  312 	ex	de,hl
                            313 ;src/draws.h:37: if(scene[posY][posX] == 1){
   482A DD 7E F6      [19]  314 	ld	a,-10 (ix)
   482D DD 86 F4      [19]  315 	add	a, -12 (ix)
   4830 6F            [ 4]  316 	ld	l,a
   4831 DD 7E F7      [19]  317 	ld	a,-9 (ix)
   4834 DD 8E F5      [19]  318 	adc	a, -11 (ix)
   4837 67            [ 4]  319 	ld	h,a
   4838 66            [ 7]  320 	ld	h,(hl)
                            321 ;src/draws.h:38: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4839 DD 73 F8      [19]  322 	ld	-8 (ix),e
   483C DD 72 F9      [19]  323 	ld	-7 (ix),d
                            324 ;src/draws.h:37: if(scene[posY][posX] == 1){
   483F 25            [ 4]  325 	dec	h
   4840 20 15         [12]  326 	jr	NZ,00110$
                            327 ;src/draws.h:38: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4842 21 04 10      [10]  328 	ld	hl,#0x1004
   4845 E5            [11]  329 	push	hl
   4846 3E 03         [ 7]  330 	ld	a,#0x03
   4848 F5            [11]  331 	push	af
   4849 33            [ 6]  332 	inc	sp
   484A DD 6E F8      [19]  333 	ld	l,-8 (ix)
   484D DD 66 F9      [19]  334 	ld	h,-7 (ix)
   4850 E5            [11]  335 	push	hl
   4851 CD 5E 63      [17]  336 	call	_cpct_drawSolidBox
   4854 F1            [10]  337 	pop	af
   4855 F1            [10]  338 	pop	af
   4856 33            [ 6]  339 	inc	sp
   4857                     340 00110$:
                            341 ;src/draws.h:40: if(scene[posY][posX] == 9){
   4857 3E 25         [ 7]  342 	ld	a,#<(_scene)
   4859 DD 86 FE      [19]  343 	add	a, -2 (ix)
   485C 6F            [ 4]  344 	ld	l,a
   485D 3E 65         [ 7]  345 	ld	a,#>(_scene)
   485F DD 8E FF      [19]  346 	adc	a, -1 (ix)
   4862 67            [ 4]  347 	ld	h,a
   4863 DD 5E F4      [19]  348 	ld	e,-12 (ix)
   4866 DD 56 F5      [19]  349 	ld	d,-11 (ix)
   4869 19            [11]  350 	add	hl,de
   486A 7E            [ 7]  351 	ld	a,(hl)
   486B D6 09         [ 7]  352 	sub	a, #0x09
   486D 20 15         [12]  353 	jr	NZ,00124$
                            354 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   486F 21 04 10      [10]  355 	ld	hl,#0x1004
   4872 E5            [11]  356 	push	hl
   4873 3E 09         [ 7]  357 	ld	a,#0x09
   4875 F5            [11]  358 	push	af
   4876 33            [ 6]  359 	inc	sp
   4877 DD 6E F8      [19]  360 	ld	l,-8 (ix)
   487A DD 66 F9      [19]  361 	ld	h,-7 (ix)
   487D E5            [11]  362 	push	hl
   487E CD 5E 63      [17]  363 	call	_cpct_drawSolidBox
   4881 F1            [10]  364 	pop	af
   4882 F1            [10]  365 	pop	af
   4883 33            [ 6]  366 	inc	sp
   4884                     367 00124$:
                            368 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4884 DD 34 F4      [23]  369 	inc	-12 (ix)
   4887 20 03         [12]  370 	jr	NZ,00198$
   4889 DD 34 F5      [23]  371 	inc	-11 (ix)
   488C                     372 00198$:
   488C DD 7E F4      [19]  373 	ld	a,-12 (ix)
   488F D6 14         [ 7]  374 	sub	a, #0x14
   4891 DD 7E F5      [19]  375 	ld	a,-11 (ix)
   4894 17            [ 4]  376 	rla
   4895 3F            [ 4]  377 	ccf
   4896 1F            [ 4]  378 	rra
   4897 DE 80         [ 7]  379 	sbc	a, #0x80
   4899 DA 0F 48      [10]  380 	jp	C,00123$
                            381 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   489C DD 7E FE      [19]  382 	ld	a,-2 (ix)
   489F C6 14         [ 7]  383 	add	a, #0x14
   48A1 DD 77 FE      [19]  384 	ld	-2 (ix),a
   48A4 DD 7E FF      [19]  385 	ld	a,-1 (ix)
   48A7 CE 00         [ 7]  386 	adc	a, #0x00
   48A9 DD 77 FF      [19]  387 	ld	-1 (ix),a
   48AC DD 7E FA      [19]  388 	ld	a,-6 (ix)
   48AF C6 14         [ 7]  389 	add	a, #0x14
   48B1 DD 77 FA      [19]  390 	ld	-6 (ix),a
   48B4 DD 7E FB      [19]  391 	ld	a,-5 (ix)
   48B7 CE 00         [ 7]  392 	adc	a, #0x00
   48B9 DD 77 FB      [19]  393 	ld	-5 (ix),a
   48BC DD 34 F2      [23]  394 	inc	-14 (ix)
   48BF 20 03         [12]  395 	jr	NZ,00199$
   48C1 DD 34 F3      [23]  396 	inc	-13 (ix)
   48C4                     397 00199$:
   48C4 DD 7E F2      [19]  398 	ld	a,-14 (ix)
   48C7 D6 0C         [ 7]  399 	sub	a, #0x0C
   48C9 DD 7E F3      [19]  400 	ld	a,-13 (ix)
   48CC 17            [ 4]  401 	rla
   48CD 3F            [ 4]  402 	ccf
   48CE 1F            [ 4]  403 	rra
   48CF DE 80         [ 7]  404 	sbc	a, #0x80
   48D1 DA F7 47      [10]  405 	jp	C,00139$
   48D4 DD F9         [10]  406 	ld	sp, ix
   48D6 DD E1         [14]  407 	pop	ix
   48D8 C9            [10]  408 	ret
   48D9                     409 _g_palette:
   48D9 00                  410 	.db #0x00	; 0
   48DA 1A                  411 	.db #0x1A	; 26
   48DB 06                  412 	.db #0x06	; 6
   48DC 0D                  413 	.db #0x0D	; 13
   48DD 00                  414 	.db 0x00
   48DE                     415 _origins:
   48DE 00                  416 	.db #0x00	; 0
   48DF 50                  417 	.db #0x50	; 80	'P'
   48E0 34                  418 	.db #0x34	; 52	'4'
   48E1 50                  419 	.db #0x50	; 80	'P'
   48E2                     420 _mapa1:
   48E2 01                  421 	.db #0x01	; 1
   48E3 01                  422 	.db #0x01	; 1
   48E4 01                  423 	.db #0x01	; 1
   48E5 01                  424 	.db #0x01	; 1
   48E6 01                  425 	.db #0x01	; 1
   48E7 01                  426 	.db #0x01	; 1
   48E8 01                  427 	.db #0x01	; 1
   48E9 01                  428 	.db #0x01	; 1
   48EA 01                  429 	.db #0x01	; 1
   48EB 01                  430 	.db #0x01	; 1
   48EC 01                  431 	.db #0x01	; 1
   48ED 01                  432 	.db #0x01	; 1
   48EE 01                  433 	.db #0x01	; 1
   48EF 01                  434 	.db #0x01	; 1
   48F0 01                  435 	.db #0x01	; 1
   48F1 01                  436 	.db #0x01	; 1
   48F2 01                  437 	.db #0x01	; 1
   48F3 01                  438 	.db #0x01	; 1
   48F4 01                  439 	.db #0x01	; 1
   48F5 01                  440 	.db #0x01	; 1
   48F6 01                  441 	.db #0x01	; 1
   48F7 00                  442 	.db #0x00	; 0
   48F8 05                  443 	.db #0x05	; 5
   48F9 00                  444 	.db #0x00	; 0
   48FA 00                  445 	.db #0x00	; 0
   48FB 00                  446 	.db #0x00	; 0
   48FC 00                  447 	.db #0x00	; 0
   48FD 00                  448 	.db #0x00	; 0
   48FE 00                  449 	.db #0x00	; 0
   48FF 00                  450 	.db #0x00	; 0
   4900 00                  451 	.db #0x00	; 0
   4901 00                  452 	.db #0x00	; 0
   4902 00                  453 	.db #0x00	; 0
   4903 00                  454 	.db #0x00	; 0
   4904 00                  455 	.db #0x00	; 0
   4905 00                  456 	.db #0x00	; 0
   4906 00                  457 	.db #0x00	; 0
   4907 00                  458 	.db #0x00	; 0
   4908 00                  459 	.db #0x00	; 0
   4909 01                  460 	.db #0x01	; 1
   490A 01                  461 	.db #0x01	; 1
   490B 00                  462 	.db #0x00	; 0
   490C 00                  463 	.db #0x00	; 0
   490D 00                  464 	.db #0x00	; 0
   490E 00                  465 	.db #0x00	; 0
   490F 00                  466 	.db #0x00	; 0
   4910 00                  467 	.db #0x00	; 0
   4911 00                  468 	.db #0x00	; 0
   4912 00                  469 	.db #0x00	; 0
   4913 00                  470 	.db #0x00	; 0
   4914 00                  471 	.db #0x00	; 0
   4915 00                  472 	.db #0x00	; 0
   4916 00                  473 	.db #0x00	; 0
   4917 00                  474 	.db #0x00	; 0
   4918 00                  475 	.db #0x00	; 0
   4919 00                  476 	.db #0x00	; 0
   491A 00                  477 	.db #0x00	; 0
   491B 00                  478 	.db #0x00	; 0
   491C 00                  479 	.db #0x00	; 0
   491D 01                  480 	.db #0x01	; 1
   491E 01                  481 	.db #0x01	; 1
   491F 01                  482 	.db #0x01	; 1
   4920 01                  483 	.db #0x01	; 1
   4921 01                  484 	.db #0x01	; 1
   4922 01                  485 	.db #0x01	; 1
   4923 01                  486 	.db #0x01	; 1
   4924 01                  487 	.db #0x01	; 1
   4925 01                  488 	.db #0x01	; 1
   4926 01                  489 	.db #0x01	; 1
   4927 01                  490 	.db #0x01	; 1
   4928 01                  491 	.db #0x01	; 1
   4929 01                  492 	.db #0x01	; 1
   492A 01                  493 	.db #0x01	; 1
   492B 01                  494 	.db #0x01	; 1
   492C 01                  495 	.db #0x01	; 1
   492D 00                  496 	.db #0x00	; 0
   492E 00                  497 	.db #0x00	; 0
   492F 01                  498 	.db #0x01	; 1
   4930 01                  499 	.db #0x01	; 1
   4931 01                  500 	.db #0x01	; 1
   4932 01                  501 	.db #0x01	; 1
   4933 00                  502 	.db #0x00	; 0
   4934 00                  503 	.db #0x00	; 0
   4935 00                  504 	.db #0x00	; 0
   4936 00                  505 	.db #0x00	; 0
   4937 00                  506 	.db #0x00	; 0
   4938 00                  507 	.db #0x00	; 0
   4939 00                  508 	.db #0x00	; 0
   493A 00                  509 	.db #0x00	; 0
   493B 00                  510 	.db #0x00	; 0
   493C 00                  511 	.db #0x00	; 0
   493D 01                  512 	.db #0x01	; 1
   493E 03                  513 	.db #0x03	; 3
   493F 03                  514 	.db #0x03	; 3
   4940 03                  515 	.db #0x03	; 3
   4941 03                  516 	.db #0x03	; 3
   4942 03                  517 	.db #0x03	; 3
   4943 03                  518 	.db #0x03	; 3
   4944 03                  519 	.db #0x03	; 3
   4945 01                  520 	.db #0x01	; 1
   4946 00                  521 	.db #0x00	; 0
   4947 00                  522 	.db #0x00	; 0
   4948 01                  523 	.db #0x01	; 1
   4949 01                  524 	.db #0x01	; 1
   494A 00                  525 	.db #0x00	; 0
   494B 01                  526 	.db #0x01	; 1
   494C 01                  527 	.db #0x01	; 1
   494D 01                  528 	.db #0x01	; 1
   494E 00                  529 	.db #0x00	; 0
   494F 00                  530 	.db #0x00	; 0
   4950 00                  531 	.db #0x00	; 0
   4951 01                  532 	.db #0x01	; 1
   4952 03                  533 	.db #0x03	; 3
   4953 03                  534 	.db #0x03	; 3
   4954 03                  535 	.db #0x03	; 3
   4955 03                  536 	.db #0x03	; 3
   4956 03                  537 	.db #0x03	; 3
   4957 03                  538 	.db #0x03	; 3
   4958 03                  539 	.db #0x03	; 3
   4959 01                  540 	.db #0x01	; 1
   495A 01                  541 	.db #0x01	; 1
   495B 00                  542 	.db #0x00	; 0
   495C 01                  543 	.db #0x01	; 1
   495D 00                  544 	.db #0x00	; 0
   495E 00                  545 	.db #0x00	; 0
   495F 00                  546 	.db #0x00	; 0
   4960 00                  547 	.db #0x00	; 0
   4961 01                  548 	.db #0x01	; 1
   4962 00                  549 	.db #0x00	; 0
   4963 00                  550 	.db #0x00	; 0
   4964 00                  551 	.db #0x00	; 0
   4965 01                  552 	.db #0x01	; 1
   4966 03                  553 	.db #0x03	; 3
   4967 03                  554 	.db #0x03	; 3
   4968 03                  555 	.db #0x03	; 3
   4969 03                  556 	.db #0x03	; 3
   496A 03                  557 	.db #0x03	; 3
   496B 03                  558 	.db #0x03	; 3
   496C 03                  559 	.db #0x03	; 3
   496D 01                  560 	.db #0x01	; 1
   496E 01                  561 	.db #0x01	; 1
   496F 00                  562 	.db #0x00	; 0
   4970 01                  563 	.db #0x01	; 1
   4971 00                  564 	.db #0x00	; 0
   4972 00                  565 	.db #0x00	; 0
   4973 00                  566 	.db #0x00	; 0
   4974 00                  567 	.db #0x00	; 0
   4975 01                  568 	.db #0x01	; 1
   4976 00                  569 	.db #0x00	; 0
   4977 00                  570 	.db #0x00	; 0
   4978 00                  571 	.db #0x00	; 0
   4979 01                  572 	.db #0x01	; 1
   497A 03                  573 	.db #0x03	; 3
   497B 03                  574 	.db #0x03	; 3
   497C 03                  575 	.db #0x03	; 3
   497D 03                  576 	.db #0x03	; 3
   497E 03                  577 	.db #0x03	; 3
   497F 03                  578 	.db #0x03	; 3
   4980 03                  579 	.db #0x03	; 3
   4981 01                  580 	.db #0x01	; 1
   4982 01                  581 	.db #0x01	; 1
   4983 00                  582 	.db #0x00	; 0
   4984 01                  583 	.db #0x01	; 1
   4985 00                  584 	.db #0x00	; 0
   4986 00                  585 	.db #0x00	; 0
   4987 00                  586 	.db #0x00	; 0
   4988 00                  587 	.db #0x00	; 0
   4989 01                  588 	.db #0x01	; 1
   498A 00                  589 	.db #0x00	; 0
   498B 00                  590 	.db #0x00	; 0
   498C 00                  591 	.db #0x00	; 0
   498D 01                  592 	.db #0x01	; 1
   498E 03                  593 	.db #0x03	; 3
   498F 03                  594 	.db #0x03	; 3
   4990 03                  595 	.db #0x03	; 3
   4991 03                  596 	.db #0x03	; 3
   4992 03                  597 	.db #0x03	; 3
   4993 03                  598 	.db #0x03	; 3
   4994 03                  599 	.db #0x03	; 3
   4995 01                  600 	.db #0x01	; 1
   4996 01                  601 	.db #0x01	; 1
   4997 00                  602 	.db #0x00	; 0
   4998 01                  603 	.db #0x01	; 1
   4999 00                  604 	.db #0x00	; 0
   499A 00                  605 	.db #0x00	; 0
   499B 00                  606 	.db #0x00	; 0
   499C 00                  607 	.db #0x00	; 0
   499D 01                  608 	.db #0x01	; 1
   499E 00                  609 	.db #0x00	; 0
   499F 00                  610 	.db #0x00	; 0
   49A0 00                  611 	.db #0x00	; 0
   49A1 01                  612 	.db #0x01	; 1
   49A2 03                  613 	.db #0x03	; 3
   49A3 03                  614 	.db #0x03	; 3
   49A4 03                  615 	.db #0x03	; 3
   49A5 03                  616 	.db #0x03	; 3
   49A6 03                  617 	.db #0x03	; 3
   49A7 03                  618 	.db #0x03	; 3
   49A8 03                  619 	.db #0x03	; 3
   49A9 01                  620 	.db #0x01	; 1
   49AA 01                  621 	.db #0x01	; 1
   49AB 02                  622 	.db #0x02	; 2
   49AC 01                  623 	.db #0x01	; 1
   49AD 00                  624 	.db #0x00	; 0
   49AE 00                  625 	.db #0x00	; 0
   49AF 00                  626 	.db #0x00	; 0
   49B0 00                  627 	.db #0x00	; 0
   49B1 01                  628 	.db #0x01	; 1
   49B2 00                  629 	.db #0x00	; 0
   49B3 00                  630 	.db #0x00	; 0
   49B4 00                  631 	.db #0x00	; 0
   49B5 0A                  632 	.db #0x0A	; 10
   49B6 03                  633 	.db #0x03	; 3
   49B7 03                  634 	.db #0x03	; 3
   49B8 03                  635 	.db #0x03	; 3
   49B9 03                  636 	.db #0x03	; 3
   49BA 03                  637 	.db #0x03	; 3
   49BB 03                  638 	.db #0x03	; 3
   49BC 03                  639 	.db #0x03	; 3
   49BD 01                  640 	.db #0x01	; 1
   49BE 01                  641 	.db #0x01	; 1
   49BF 01                  642 	.db #0x01	; 1
   49C0 01                  643 	.db #0x01	; 1
   49C1 01                  644 	.db #0x01	; 1
   49C2 01                  645 	.db #0x01	; 1
   49C3 01                  646 	.db #0x01	; 1
   49C4 01                  647 	.db #0x01	; 1
   49C5 01                  648 	.db #0x01	; 1
   49C6 01                  649 	.db #0x01	; 1
   49C7 01                  650 	.db #0x01	; 1
   49C8 01                  651 	.db #0x01	; 1
   49C9 01                  652 	.db #0x01	; 1
   49CA 01                  653 	.db #0x01	; 1
   49CB 01                  654 	.db #0x01	; 1
   49CC 01                  655 	.db #0x01	; 1
   49CD 09                  656 	.db #0x09	; 9
   49CE 09                  657 	.db #0x09	; 9
   49CF 01                  658 	.db #0x01	; 1
   49D0 01                  659 	.db #0x01	; 1
   49D1 01                  660 	.db #0x01	; 1
   49D2                     661 _mapa2:
   49D2 01                  662 	.db #0x01	; 1
   49D3 01                  663 	.db #0x01	; 1
   49D4 01                  664 	.db #0x01	; 1
   49D5 01                  665 	.db #0x01	; 1
   49D6 01                  666 	.db #0x01	; 1
   49D7 01                  667 	.db #0x01	; 1
   49D8 01                  668 	.db #0x01	; 1
   49D9 01                  669 	.db #0x01	; 1
   49DA 01                  670 	.db #0x01	; 1
   49DB 01                  671 	.db #0x01	; 1
   49DC 01                  672 	.db #0x01	; 1
   49DD 01                  673 	.db #0x01	; 1
   49DE 01                  674 	.db #0x01	; 1
   49DF 01                  675 	.db #0x01	; 1
   49E0 01                  676 	.db #0x01	; 1
   49E1 01                  677 	.db #0x01	; 1
   49E2 01                  678 	.db #0x01	; 1
   49E3 01                  679 	.db #0x01	; 1
   49E4 01                  680 	.db #0x01	; 1
   49E5 01                  681 	.db #0x01	; 1
   49E6 01                  682 	.db #0x01	; 1
   49E7 00                  683 	.db #0x00	; 0
   49E8 00                  684 	.db #0x00	; 0
   49E9 00                  685 	.db #0x00	; 0
   49EA 00                  686 	.db #0x00	; 0
   49EB 01                  687 	.db #0x01	; 1
   49EC 00                  688 	.db #0x00	; 0
   49ED 00                  689 	.db #0x00	; 0
   49EE 00                  690 	.db #0x00	; 0
   49EF 00                  691 	.db #0x00	; 0
   49F0 00                  692 	.db #0x00	; 0
   49F1 00                  693 	.db #0x00	; 0
   49F2 00                  694 	.db #0x00	; 0
   49F3 00                  695 	.db #0x00	; 0
   49F4 00                  696 	.db #0x00	; 0
   49F5 00                  697 	.db #0x00	; 0
   49F6 00                  698 	.db #0x00	; 0
   49F7 00                  699 	.db #0x00	; 0
   49F8 00                  700 	.db #0x00	; 0
   49F9 06                  701 	.db #0x06	; 6
   49FA 01                  702 	.db #0x01	; 1
   49FB 00                  703 	.db #0x00	; 0
   49FC 00                  704 	.db #0x00	; 0
   49FD 01                  705 	.db #0x01	; 1
   49FE 00                  706 	.db #0x00	; 0
   49FF 00                  707 	.db #0x00	; 0
   4A00 00                  708 	.db #0x00	; 0
   4A01 00                  709 	.db #0x00	; 0
   4A02 00                  710 	.db #0x00	; 0
   4A03 00                  711 	.db #0x00	; 0
   4A04 00                  712 	.db #0x00	; 0
   4A05 00                  713 	.db #0x00	; 0
   4A06 00                  714 	.db #0x00	; 0
   4A07 00                  715 	.db #0x00	; 0
   4A08 00                  716 	.db #0x00	; 0
   4A09 00                  717 	.db #0x00	; 0
   4A0A 00                  718 	.db #0x00	; 0
   4A0B 00                  719 	.db #0x00	; 0
   4A0C 00                  720 	.db #0x00	; 0
   4A0D 01                  721 	.db #0x01	; 1
   4A0E 01                  722 	.db #0x01	; 1
   4A0F 00                  723 	.db #0x00	; 0
   4A10 01                  724 	.db #0x01	; 1
   4A11 01                  725 	.db #0x01	; 1
   4A12 01                  726 	.db #0x01	; 1
   4A13 01                  727 	.db #0x01	; 1
   4A14 00                  728 	.db #0x00	; 0
   4A15 00                  729 	.db #0x00	; 0
   4A16 01                  730 	.db #0x01	; 1
   4A17 01                  731 	.db #0x01	; 1
   4A18 01                  732 	.db #0x01	; 1
   4A19 01                  733 	.db #0x01	; 1
   4A1A 01                  734 	.db #0x01	; 1
   4A1B 01                  735 	.db #0x01	; 1
   4A1C 01                  736 	.db #0x01	; 1
   4A1D 01                  737 	.db #0x01	; 1
   4A1E 01                  738 	.db #0x01	; 1
   4A1F 01                  739 	.db #0x01	; 1
   4A20 01                  740 	.db #0x01	; 1
   4A21 01                  741 	.db #0x01	; 1
   4A22 01                  742 	.db #0x01	; 1
   4A23 00                  743 	.db #0x00	; 0
   4A24 05                  744 	.db #0x05	; 5
   4A25 01                  745 	.db #0x01	; 1
   4A26 00                  746 	.db #0x00	; 0
   4A27 00                  747 	.db #0x00	; 0
   4A28 00                  748 	.db #0x00	; 0
   4A29 00                  749 	.db #0x00	; 0
   4A2A 00                  750 	.db #0x00	; 0
   4A2B 00                  751 	.db #0x00	; 0
   4A2C 00                  752 	.db #0x00	; 0
   4A2D 01                  753 	.db #0x01	; 1
   4A2E 00                  754 	.db #0x00	; 0
   4A2F 00                  755 	.db #0x00	; 0
   4A30 00                  756 	.db #0x00	; 0
   4A31 00                  757 	.db #0x00	; 0
   4A32 00                  758 	.db #0x00	; 0
   4A33 00                  759 	.db #0x00	; 0
   4A34 00                  760 	.db #0x00	; 0
   4A35 01                  761 	.db #0x01	; 1
   4A36 01                  762 	.db #0x01	; 1
   4A37 00                  763 	.db #0x00	; 0
   4A38 01                  764 	.db #0x01	; 1
   4A39 01                  765 	.db #0x01	; 1
   4A3A 00                  766 	.db #0x00	; 0
   4A3B 01                  767 	.db #0x01	; 1
   4A3C 01                  768 	.db #0x01	; 1
   4A3D 01                  769 	.db #0x01	; 1
   4A3E 02                  770 	.db #0x02	; 2
   4A3F 02                  771 	.db #0x02	; 2
   4A40 02                  772 	.db #0x02	; 2
   4A41 01                  773 	.db #0x01	; 1
   4A42 00                  774 	.db #0x00	; 0
   4A43 00                  775 	.db #0x00	; 0
   4A44 00                  776 	.db #0x00	; 0
   4A45 05                  777 	.db #0x05	; 5
   4A46 00                  778 	.db #0x00	; 0
   4A47 00                  779 	.db #0x00	; 0
   4A48 00                  780 	.db #0x00	; 0
   4A49 01                  781 	.db #0x01	; 1
   4A4A 01                  782 	.db #0x01	; 1
   4A4B 00                  783 	.db #0x00	; 0
   4A4C 01                  784 	.db #0x01	; 1
   4A4D 02                  785 	.db #0x02	; 2
   4A4E 02                  786 	.db #0x02	; 2
   4A4F 02                  787 	.db #0x02	; 2
   4A50 02                  788 	.db #0x02	; 2
   4A51 01                  789 	.db #0x01	; 1
   4A52 00                  790 	.db #0x00	; 0
   4A53 00                  791 	.db #0x00	; 0
   4A54 00                  792 	.db #0x00	; 0
   4A55 01                  793 	.db #0x01	; 1
   4A56 00                  794 	.db #0x00	; 0
   4A57 00                  795 	.db #0x00	; 0
   4A58 00                  796 	.db #0x00	; 0
   4A59 05                  797 	.db #0x05	; 5
   4A5A 00                  798 	.db #0x00	; 0
   4A5B 00                  799 	.db #0x00	; 0
   4A5C 00                  800 	.db #0x00	; 0
   4A5D 01                  801 	.db #0x01	; 1
   4A5E 01                  802 	.db #0x01	; 1
   4A5F 00                  803 	.db #0x00	; 0
   4A60 01                  804 	.db #0x01	; 1
   4A61 02                  805 	.db #0x02	; 2
   4A62 02                  806 	.db #0x02	; 2
   4A63 02                  807 	.db #0x02	; 2
   4A64 02                  808 	.db #0x02	; 2
   4A65 01                  809 	.db #0x01	; 1
   4A66 02                  810 	.db #0x02	; 2
   4A67 02                  811 	.db #0x02	; 2
   4A68 02                  812 	.db #0x02	; 2
   4A69 01                  813 	.db #0x01	; 1
   4A6A 00                  814 	.db #0x00	; 0
   4A6B 00                  815 	.db #0x00	; 0
   4A6C 00                  816 	.db #0x00	; 0
   4A6D 05                  817 	.db #0x05	; 5
   4A6E 00                  818 	.db #0x00	; 0
   4A6F 00                  819 	.db #0x00	; 0
   4A70 00                  820 	.db #0x00	; 0
   4A71 01                  821 	.db #0x01	; 1
   4A72 01                  822 	.db #0x01	; 1
   4A73 00                  823 	.db #0x00	; 0
   4A74 01                  824 	.db #0x01	; 1
   4A75 02                  825 	.db #0x02	; 2
   4A76 02                  826 	.db #0x02	; 2
   4A77 02                  827 	.db #0x02	; 2
   4A78 02                  828 	.db #0x02	; 2
   4A79 01                  829 	.db #0x01	; 1
   4A7A 00                  830 	.db #0x00	; 0
   4A7B 00                  831 	.db #0x00	; 0
   4A7C 00                  832 	.db #0x00	; 0
   4A7D 01                  833 	.db #0x01	; 1
   4A7E 00                  834 	.db #0x00	; 0
   4A7F 00                  835 	.db #0x00	; 0
   4A80 00                  836 	.db #0x00	; 0
   4A81 00                  837 	.db #0x00	; 0
   4A82 00                  838 	.db #0x00	; 0
   4A83 00                  839 	.db #0x00	; 0
   4A84 00                  840 	.db #0x00	; 0
   4A85 01                  841 	.db #0x01	; 1
   4A86 01                  842 	.db #0x01	; 1
   4A87 00                  843 	.db #0x00	; 0
   4A88 01                  844 	.db #0x01	; 1
   4A89 02                  845 	.db #0x02	; 2
   4A8A 02                  846 	.db #0x02	; 2
   4A8B 02                  847 	.db #0x02	; 2
   4A8C 02                  848 	.db #0x02	; 2
   4A8D 01                  849 	.db #0x01	; 1
   4A8E 02                  850 	.db #0x02	; 2
   4A8F 02                  851 	.db #0x02	; 2
   4A90 02                  852 	.db #0x02	; 2
   4A91 01                  853 	.db #0x01	; 1
   4A92 00                  854 	.db #0x00	; 0
   4A93 00                  855 	.db #0x00	; 0
   4A94 00                  856 	.db #0x00	; 0
   4A95 00                  857 	.db #0x00	; 0
   4A96 00                  858 	.db #0x00	; 0
   4A97 00                  859 	.db #0x00	; 0
   4A98 00                  860 	.db #0x00	; 0
   4A99 01                  861 	.db #0x01	; 1
   4A9A 01                  862 	.db #0x01	; 1
   4A9B 05                  863 	.db #0x05	; 5
   4A9C 01                  864 	.db #0x01	; 1
   4A9D 02                  865 	.db #0x02	; 2
   4A9E 02                  866 	.db #0x02	; 2
   4A9F 02                  867 	.db #0x02	; 2
   4AA0 02                  868 	.db #0x02	; 2
   4AA1 01                  869 	.db #0x01	; 1
   4AA2 00                  870 	.db #0x00	; 0
   4AA3 00                  871 	.db #0x00	; 0
   4AA4 00                  872 	.db #0x00	; 0
   4AA5 00                  873 	.db #0x00	; 0
   4AA6 00                  874 	.db #0x00	; 0
   4AA7 00                  875 	.db #0x00	; 0
   4AA8 00                  876 	.db #0x00	; 0
   4AA9 00                  877 	.db #0x00	; 0
   4AAA 00                  878 	.db #0x00	; 0
   4AAB 00                  879 	.db #0x00	; 0
   4AAC 00                  880 	.db #0x00	; 0
   4AAD 01                  881 	.db #0x01	; 1
   4AAE 01                  882 	.db #0x01	; 1
   4AAF 01                  883 	.db #0x01	; 1
   4AB0 01                  884 	.db #0x01	; 1
   4AB1 01                  885 	.db #0x01	; 1
   4AB2 01                  886 	.db #0x01	; 1
   4AB3 01                  887 	.db #0x01	; 1
   4AB4 01                  888 	.db #0x01	; 1
   4AB5 01                  889 	.db #0x01	; 1
   4AB6 01                  890 	.db #0x01	; 1
   4AB7 01                  891 	.db #0x01	; 1
   4AB8 01                  892 	.db #0x01	; 1
   4AB9 01                  893 	.db #0x01	; 1
   4ABA 01                  894 	.db #0x01	; 1
   4ABB 01                  895 	.db #0x01	; 1
   4ABC 01                  896 	.db #0x01	; 1
   4ABD 00                  897 	.db #0x00	; 0
   4ABE 01                  898 	.db #0x01	; 1
   4ABF 01                  899 	.db #0x01	; 1
   4AC0 01                  900 	.db #0x01	; 1
   4AC1 01                  901 	.db #0x01	; 1
                            902 ;src/draws.h:48: void drawVida(u8 life,u8 pos){
                            903 ;	---------------------------------
                            904 ; Function drawVida
                            905 ; ---------------------------------
   4AC2                     906 _drawVida::
   4AC2 DD E5         [15]  907 	push	ix
   4AC4 DD 21 00 00   [14]  908 	ld	ix,#0
   4AC8 DD 39         [15]  909 	add	ix,sp
                            910 ;src/draws.h:51: u8 p = pos;
   4ACA DD 56 05      [19]  911 	ld	d,5 (ix)
                            912 ;src/draws.h:53: for(i=1;i<=3;i++){
   4ACD 1E 01         [ 7]  913 	ld	e,#0x01
   4ACF                     914 00105$:
                            915 ;src/draws.h:54: memptr = cpct_getScreenPtr(VMEM,p,192);
   4ACF D5            [11]  916 	push	de
   4AD0 3E C0         [ 7]  917 	ld	a,#0xC0
   4AD2 F5            [11]  918 	push	af
   4AD3 33            [ 6]  919 	inc	sp
   4AD4 D5            [11]  920 	push	de
   4AD5 33            [ 6]  921 	inc	sp
   4AD6 21 00 C0      [10]  922 	ld	hl,#0xC000
   4AD9 E5            [11]  923 	push	hl
   4ADA CD 2F 64      [17]  924 	call	_cpct_getScreenPtr
   4ADD D1            [10]  925 	pop	de
                            926 ;src/draws.h:55: p+=5;
   4ADE 7A            [ 4]  927 	ld	a,d
   4ADF C6 05         [ 7]  928 	add	a, #0x05
   4AE1 57            [ 4]  929 	ld	d,a
                            930 ;src/draws.h:56: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4AE2 4D            [ 4]  931 	ld	c, l
   4AE3 44            [ 4]  932 	ld	b, h
   4AE4 DD 7E 04      [19]  933 	ld	a,4 (ix)
   4AE7 93            [ 4]  934 	sub	a, e
   4AE8 38 10         [12]  935 	jr	C,00102$
   4AEA D5            [11]  936 	push	de
   4AEB 21 04 08      [10]  937 	ld	hl,#0x0804
   4AEE E5            [11]  938 	push	hl
   4AEF C5            [11]  939 	push	bc
   4AF0 21 00 46      [10]  940 	ld	hl,#_corazon_lleno
   4AF3 E5            [11]  941 	push	hl
   4AF4 CD D8 62      [17]  942 	call	_cpct_drawSpriteMasked
   4AF7 D1            [10]  943 	pop	de
   4AF8 18 20         [12]  944 	jr	00106$
   4AFA                     945 00102$:
                            946 ;src/draws.h:58: cpct_drawSolidBox(memptr,0,4,8);
   4AFA C5            [11]  947 	push	bc
   4AFB D5            [11]  948 	push	de
   4AFC 21 04 08      [10]  949 	ld	hl,#0x0804
   4AFF E5            [11]  950 	push	hl
   4B00 AF            [ 4]  951 	xor	a, a
   4B01 F5            [11]  952 	push	af
   4B02 33            [ 6]  953 	inc	sp
   4B03 C5            [11]  954 	push	bc
   4B04 CD 5E 63      [17]  955 	call	_cpct_drawSolidBox
   4B07 F1            [10]  956 	pop	af
   4B08 F1            [10]  957 	pop	af
   4B09 33            [ 6]  958 	inc	sp
   4B0A D1            [10]  959 	pop	de
   4B0B C1            [10]  960 	pop	bc
                            961 ;src/draws.h:59: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4B0C D5            [11]  962 	push	de
   4B0D 21 04 08      [10]  963 	ld	hl,#0x0804
   4B10 E5            [11]  964 	push	hl
   4B11 C5            [11]  965 	push	bc
   4B12 21 40 46      [10]  966 	ld	hl,#_corazon_roto
   4B15 E5            [11]  967 	push	hl
   4B16 CD D8 62      [17]  968 	call	_cpct_drawSpriteMasked
   4B19 D1            [10]  969 	pop	de
   4B1A                     970 00106$:
                            971 ;src/draws.h:53: for(i=1;i<=3;i++){
   4B1A 1C            [ 4]  972 	inc	e
   4B1B 3E 03         [ 7]  973 	ld	a,#0x03
   4B1D 93            [ 4]  974 	sub	a, e
   4B1E 30 AF         [12]  975 	jr	NC,00105$
   4B20 DD E1         [14]  976 	pop	ix
   4B22 C9            [10]  977 	ret
                            978 ;src/draws.h:65: void drawBullets(u8 bullet,u8 pos){
                            979 ;	---------------------------------
                            980 ; Function drawBullets
                            981 ; ---------------------------------
   4B23                     982 _drawBullets::
   4B23 DD E5         [15]  983 	push	ix
   4B25 DD 21 00 00   [14]  984 	ld	ix,#0
   4B29 DD 39         [15]  985 	add	ix,sp
   4B2B 3B            [ 6]  986 	dec	sp
                            987 ;src/draws.h:67: int p = pos;
   4B2C DD 4E 05      [19]  988 	ld	c,5 (ix)
   4B2F 06 00         [ 7]  989 	ld	b,#0x00
                            990 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B31 DD 36 FF 01   [19]  991 	ld	-1 (ix),#0x01
   4B35                     992 00105$:
                            993 ;src/draws.h:70: memptr = cpct_getScreenPtr(VMEM,p,192);
   4B35 51            [ 4]  994 	ld	d,c
   4B36 C5            [11]  995 	push	bc
   4B37 3E C0         [ 7]  996 	ld	a,#0xC0
   4B39 F5            [11]  997 	push	af
   4B3A 33            [ 6]  998 	inc	sp
   4B3B D5            [11]  999 	push	de
   4B3C 33            [ 6] 1000 	inc	sp
   4B3D 21 00 C0      [10] 1001 	ld	hl,#0xC000
   4B40 E5            [11] 1002 	push	hl
   4B41 CD 2F 64      [17] 1003 	call	_cpct_getScreenPtr
   4B44 C1            [10] 1004 	pop	bc
                           1005 ;src/draws.h:71: p+=3;
   4B45 03            [ 6] 1006 	inc	bc
   4B46 03            [ 6] 1007 	inc	bc
   4B47 03            [ 6] 1008 	inc	bc
                           1009 ;src/draws.h:72: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4B48 EB            [ 4] 1010 	ex	de,hl
   4B49 DD 7E 04      [19] 1011 	ld	a,4 (ix)
   4B4C DD 96 FF      [19] 1012 	sub	a, -1 (ix)
   4B4F 38 10         [12] 1013 	jr	C,00102$
   4B51 C5            [11] 1014 	push	bc
   4B52 21 02 08      [10] 1015 	ld	hl,#0x0802
   4B55 E5            [11] 1016 	push	hl
   4B56 D5            [11] 1017 	push	de
   4B57 21 62 60      [10] 1018 	ld	hl,#_flecha_arriba
   4B5A E5            [11] 1019 	push	hl
   4B5B CD D8 62      [17] 1020 	call	_cpct_drawSpriteMasked
   4B5E C1            [10] 1021 	pop	bc
   4B5F 18 10         [12] 1022 	jr	00106$
   4B61                    1023 00102$:
                           1024 ;src/draws.h:73: else  cpct_drawSolidBox(memptr,0,2,8);
   4B61 C5            [11] 1025 	push	bc
   4B62 21 02 08      [10] 1026 	ld	hl,#0x0802
   4B65 E5            [11] 1027 	push	hl
   4B66 AF            [ 4] 1028 	xor	a, a
   4B67 F5            [11] 1029 	push	af
   4B68 33            [ 6] 1030 	inc	sp
   4B69 D5            [11] 1031 	push	de
   4B6A CD 5E 63      [17] 1032 	call	_cpct_drawSolidBox
   4B6D F1            [10] 1033 	pop	af
   4B6E F1            [10] 1034 	pop	af
   4B6F 33            [ 6] 1035 	inc	sp
   4B70 C1            [10] 1036 	pop	bc
   4B71                    1037 00106$:
                           1038 ;src/draws.h:69: for(i=1;i<=3;i++){
   4B71 DD 34 FF      [23] 1039 	inc	-1 (ix)
   4B74 3E 03         [ 7] 1040 	ld	a,#0x03
   4B76 DD 96 FF      [19] 1041 	sub	a, -1 (ix)
   4B79 30 BA         [12] 1042 	jr	NC,00105$
   4B7B 33            [ 6] 1043 	inc	sp
   4B7C DD E1         [14] 1044 	pop	ix
   4B7E C9            [10] 1045 	ret
                           1046 ;src/draws.h:81: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                           1047 ;	---------------------------------
                           1048 ; Function draw
                           1049 ; ---------------------------------
   4B7F                    1050 _draw::
                           1051 ;src/draws.h:83: memptr = cpct_getScreenPtr(VMEM,x,y);
   4B7F 21 03 00      [10] 1052 	ld	hl, #3+0
   4B82 39            [11] 1053 	add	hl, sp
   4B83 7E            [ 7] 1054 	ld	a, (hl)
   4B84 F5            [11] 1055 	push	af
   4B85 33            [ 6] 1056 	inc	sp
   4B86 21 03 00      [10] 1057 	ld	hl, #3+0
   4B89 39            [11] 1058 	add	hl, sp
   4B8A 7E            [ 7] 1059 	ld	a, (hl)
   4B8B F5            [11] 1060 	push	af
   4B8C 33            [ 6] 1061 	inc	sp
   4B8D 21 00 C0      [10] 1062 	ld	hl,#0xC000
   4B90 E5            [11] 1063 	push	hl
   4B91 CD 2F 64      [17] 1064 	call	_cpct_getScreenPtr
   4B94 EB            [ 4] 1065 	ex	de,hl
                           1066 ;src/draws.h:84: switch(mode){
   4B95 3E 02         [ 7] 1067 	ld	a,#0x02
   4B97 FD 21 06 00   [14] 1068 	ld	iy,#6
   4B9B FD 39         [15] 1069 	add	iy,sp
   4B9D FD 96 00      [19] 1070 	sub	a, 0 (iy)
   4BA0 D8            [11] 1071 	ret	C
                           1072 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BA1 21 04 00      [10] 1073 	ld	hl, #4
   4BA4 39            [11] 1074 	add	hl, sp
   4BA5 4E            [ 7] 1075 	ld	c, (hl)
   4BA6 23            [ 6] 1076 	inc	hl
   4BA7 46            [ 7] 1077 	ld	b, (hl)
                           1078 ;src/draws.h:84: switch(mode){
   4BA8 D5            [11] 1079 	push	de
   4BA9 FD 21 08 00   [14] 1080 	ld	iy,#8
   4BAD FD 39         [15] 1081 	add	iy,sp
   4BAF FD 5E 00      [19] 1082 	ld	e,0 (iy)
   4BB2 16 00         [ 7] 1083 	ld	d,#0x00
   4BB4 21 BB 4B      [10] 1084 	ld	hl,#00111$
   4BB7 19            [11] 1085 	add	hl,de
   4BB8 19            [11] 1086 	add	hl,de
                           1087 ;src/draws.h:85: case 0:
   4BB9 D1            [10] 1088 	pop	de
   4BBA E9            [ 4] 1089 	jp	(hl)
   4BBB                    1090 00111$:
   4BBB 18 04         [12] 1091 	jr	00101$
   4BBD 18 0C         [12] 1092 	jr	00102$
   4BBF 18 14         [12] 1093 	jr	00103$
   4BC1                    1094 00101$:
                           1095 ;src/draws.h:86: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BC1 21 04 10      [10] 1096 	ld	hl,#0x1004
   4BC4 E5            [11] 1097 	push	hl
   4BC5 D5            [11] 1098 	push	de
   4BC6 C5            [11] 1099 	push	bc
   4BC7 CD D8 62      [17] 1100 	call	_cpct_drawSpriteMasked
                           1101 ;src/draws.h:87: break;
   4BCA C9            [10] 1102 	ret
                           1103 ;src/draws.h:88: case 1:
   4BCB                    1104 00102$:
                           1105 ;src/draws.h:89: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4BCB 21 02 08      [10] 1106 	ld	hl,#0x0802
   4BCE E5            [11] 1107 	push	hl
   4BCF D5            [11] 1108 	push	de
   4BD0 C5            [11] 1109 	push	bc
   4BD1 CD D8 62      [17] 1110 	call	_cpct_drawSpriteMasked
                           1111 ;src/draws.h:90: break;
   4BD4 C9            [10] 1112 	ret
                           1113 ;src/draws.h:91: case 2:
   4BD5                    1114 00103$:
                           1115 ;src/draws.h:92: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4BD5 21 04 04      [10] 1116 	ld	hl,#0x0404
   4BD8 E5            [11] 1117 	push	hl
   4BD9 D5            [11] 1118 	push	de
   4BDA C5            [11] 1119 	push	bc
   4BDB CD D8 62      [17] 1120 	call	_cpct_drawSpriteMasked
                           1121 ;src/draws.h:94: }
   4BDE C9            [10] 1122 	ret
                           1123 ;src/draws.h:98: void erase(u8 x,u8 y,u8 mode){
                           1124 ;	---------------------------------
                           1125 ; Function erase
                           1126 ; ---------------------------------
   4BDF                    1127 _erase::
                           1128 ;src/draws.h:101: memptr = cpct_getScreenPtr(VMEM,x,y);
   4BDF 21 03 00      [10] 1129 	ld	hl, #3+0
   4BE2 39            [11] 1130 	add	hl, sp
   4BE3 7E            [ 7] 1131 	ld	a, (hl)
   4BE4 F5            [11] 1132 	push	af
   4BE5 33            [ 6] 1133 	inc	sp
   4BE6 21 03 00      [10] 1134 	ld	hl, #3+0
   4BE9 39            [11] 1135 	add	hl, sp
   4BEA 7E            [ 7] 1136 	ld	a, (hl)
   4BEB F5            [11] 1137 	push	af
   4BEC 33            [ 6] 1138 	inc	sp
   4BED 21 00 C0      [10] 1139 	ld	hl,#0xC000
   4BF0 E5            [11] 1140 	push	hl
   4BF1 CD 2F 64      [17] 1141 	call	_cpct_getScreenPtr
   4BF4 4D            [ 4] 1142 	ld	c, l
   4BF5 44            [ 4] 1143 	ld	b, h
                           1144 ;src/draws.h:102: switch(mode){
   4BF6 3E 02         [ 7] 1145 	ld	a,#0x02
   4BF8 FD 21 04 00   [14] 1146 	ld	iy,#4
   4BFC FD 39         [15] 1147 	add	iy,sp
   4BFE FD 96 00      [19] 1148 	sub	a, 0 (iy)
   4C01 D8            [11] 1149 	ret	C
                           1150 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
                           1151 ;src/draws.h:102: switch(mode){
   4C02 FD 5E 00      [19] 1152 	ld	e,0 (iy)
   4C05 16 00         [ 7] 1153 	ld	d,#0x00
   4C07 21 0D 4C      [10] 1154 	ld	hl,#00111$
   4C0A 19            [11] 1155 	add	hl,de
   4C0B 19            [11] 1156 	add	hl,de
                           1157 ;src/draws.h:103: case 0:
   4C0C E9            [ 4] 1158 	jp	(hl)
   4C0D                    1159 00111$:
   4C0D 18 04         [12] 1160 	jr	00101$
   4C0F 18 11         [12] 1161 	jr	00102$
   4C11 18 1E         [12] 1162 	jr	00103$
   4C13                    1163 00101$:
                           1164 ;src/draws.h:104: cpct_drawSolidBox(memptr,0,4,16);
   4C13 21 04 10      [10] 1165 	ld	hl,#0x1004
   4C16 E5            [11] 1166 	push	hl
   4C17 AF            [ 4] 1167 	xor	a, a
   4C18 F5            [11] 1168 	push	af
   4C19 33            [ 6] 1169 	inc	sp
   4C1A C5            [11] 1170 	push	bc
   4C1B CD 5E 63      [17] 1171 	call	_cpct_drawSolidBox
   4C1E F1            [10] 1172 	pop	af
   4C1F F1            [10] 1173 	pop	af
   4C20 33            [ 6] 1174 	inc	sp
                           1175 ;src/draws.h:105: break;
   4C21 C9            [10] 1176 	ret
                           1177 ;src/draws.h:106: case 1:
   4C22                    1178 00102$:
                           1179 ;src/draws.h:107: cpct_drawSolidBox(memptr,0,2,8);
   4C22 21 02 08      [10] 1180 	ld	hl,#0x0802
   4C25 E5            [11] 1181 	push	hl
   4C26 AF            [ 4] 1182 	xor	a, a
   4C27 F5            [11] 1183 	push	af
   4C28 33            [ 6] 1184 	inc	sp
   4C29 C5            [11] 1185 	push	bc
   4C2A CD 5E 63      [17] 1186 	call	_cpct_drawSolidBox
   4C2D F1            [10] 1187 	pop	af
   4C2E F1            [10] 1188 	pop	af
   4C2F 33            [ 6] 1189 	inc	sp
                           1190 ;src/draws.h:108: break;
   4C30 C9            [10] 1191 	ret
                           1192 ;src/draws.h:109: case 2:
   4C31                    1193 00103$:
                           1194 ;src/draws.h:110: cpct_drawSolidBox(memptr,0,4,4);
   4C31 21 04 04      [10] 1195 	ld	hl,#0x0404
   4C34 E5            [11] 1196 	push	hl
   4C35 AF            [ 4] 1197 	xor	a, a
   4C36 F5            [11] 1198 	push	af
   4C37 33            [ 6] 1199 	inc	sp
   4C38 C5            [11] 1200 	push	bc
   4C39 CD 5E 63      [17] 1201 	call	_cpct_drawSolidBox
   4C3C F1            [10] 1202 	pop	af
   4C3D F1            [10] 1203 	pop	af
   4C3E 33            [ 6] 1204 	inc	sp
                           1205 ;src/draws.h:112: }
   4C3F C9            [10] 1206 	ret
                           1207 ;src/draws.h:115: void drawStats(){
                           1208 ;	---------------------------------
                           1209 ; Function drawStats
                           1210 ; ---------------------------------
   4C40                    1211 _drawStats::
                           1212 ;src/draws.h:116: drawVida(player.life,1);
   4C40 21 2E 66      [10] 1213 	ld	hl, #_player + 6
   4C43 56            [ 7] 1214 	ld	d,(hl)
   4C44 3E 01         [ 7] 1215 	ld	a,#0x01
   4C46 F5            [11] 1216 	push	af
   4C47 33            [ 6] 1217 	inc	sp
   4C48 D5            [11] 1218 	push	de
   4C49 33            [ 6] 1219 	inc	sp
   4C4A CD C2 4A      [17] 1220 	call	_drawVida
   4C4D F1            [10] 1221 	pop	af
                           1222 ;src/draws.h:117: drawBullets(player.bullets,16);
   4C4E 21 32 66      [10] 1223 	ld	hl, #_player + 10
   4C51 56            [ 7] 1224 	ld	d,(hl)
   4C52 3E 10         [ 7] 1225 	ld	a,#0x10
   4C54 F5            [11] 1226 	push	af
   4C55 33            [ 6] 1227 	inc	sp
   4C56 D5            [11] 1228 	push	de
   4C57 33            [ 6] 1229 	inc	sp
   4C58 CD 23 4B      [17] 1230 	call	_drawBullets
   4C5B F1            [10] 1231 	pop	af
                           1232 ;src/draws.h:118: drawBullets(enemy.bullets,56);
   4C5C 21 3D 66      [10] 1233 	ld	hl, #_enemy + 10
   4C5F 56            [ 7] 1234 	ld	d,(hl)
   4C60 3E 38         [ 7] 1235 	ld	a,#0x38
   4C62 F5            [11] 1236 	push	af
   4C63 33            [ 6] 1237 	inc	sp
   4C64 D5            [11] 1238 	push	de
   4C65 33            [ 6] 1239 	inc	sp
   4C66 CD 23 4B      [17] 1240 	call	_drawBullets
   4C69 F1            [10] 1241 	pop	af
                           1242 ;src/draws.h:119: drawVida(enemy.life,65);
   4C6A 21 3B 66      [10] 1243 	ld	hl, #_enemy + 8
   4C6D 56            [ 7] 1244 	ld	d,(hl)
   4C6E 3E 41         [ 7] 1245 	ld	a,#0x41
   4C70 F5            [11] 1246 	push	af
   4C71 33            [ 6] 1247 	inc	sp
   4C72 D5            [11] 1248 	push	de
   4C73 33            [ 6] 1249 	inc	sp
   4C74 CD C2 4A      [17] 1250 	call	_drawVida
   4C77 F1            [10] 1251 	pop	af
   4C78 C9            [10] 1252 	ret
                           1253 ;src/draws.h:124: void draws(){
                           1254 ;	---------------------------------
                           1255 ; Function draws
                           1256 ; ---------------------------------
   4C79                    1257 _draws::
   4C79 DD E5         [15] 1258 	push	ix
   4C7B DD 21 00 00   [14] 1259 	ld	ix,#0
   4C7F DD 39         [15] 1260 	add	ix,sp
   4C81 3B            [ 6] 1261 	dec	sp
                           1262 ;src/draws.h:126: draw(player.x,player.y,player.sprite,0);
   4C82 ED 5B 2C 66   [20] 1263 	ld	de, (#_player + 4)
   4C86 21 29 66      [10] 1264 	ld	hl, #_player + 1
   4C89 46            [ 7] 1265 	ld	b,(hl)
   4C8A 21 28 66      [10] 1266 	ld	hl, #_player + 0
   4C8D 4E            [ 7] 1267 	ld	c,(hl)
   4C8E AF            [ 4] 1268 	xor	a, a
   4C8F F5            [11] 1269 	push	af
   4C90 33            [ 6] 1270 	inc	sp
   4C91 D5            [11] 1271 	push	de
   4C92 C5            [11] 1272 	push	bc
   4C93 CD 7F 4B      [17] 1273 	call	_draw
   4C96 F1            [10] 1274 	pop	af
   4C97 F1            [10] 1275 	pop	af
   4C98 33            [ 6] 1276 	inc	sp
                           1277 ;src/draws.h:127: draw(enemy.x,enemy.y,enemy.sprite,0);
   4C99 ED 5B 39 66   [20] 1278 	ld	de, (#_enemy + 6)
   4C9D 21 34 66      [10] 1279 	ld	hl, #_enemy + 1
   4CA0 46            [ 7] 1280 	ld	b,(hl)
   4CA1 21 33 66      [10] 1281 	ld	hl, #_enemy + 0
   4CA4 4E            [ 7] 1282 	ld	c,(hl)
   4CA5 AF            [ 4] 1283 	xor	a, a
   4CA6 F5            [11] 1284 	push	af
   4CA7 33            [ 6] 1285 	inc	sp
   4CA8 D5            [11] 1286 	push	de
   4CA9 C5            [11] 1287 	push	bc
   4CAA CD 7F 4B      [17] 1288 	call	_draw
   4CAD F1            [10] 1289 	pop	af
   4CAE F1            [10] 1290 	pop	af
   4CAF 33            [ 6] 1291 	inc	sp
                           1292 ;src/draws.h:128: if(arrow == 1){
   4CB0 3A 1A 66      [13] 1293 	ld	a,(#_arrow + 0)
   4CB3 3D            [ 4] 1294 	dec	a
   4CB4 20 5C         [12] 1295 	jr	NZ,00111$
                           1296 ;src/draws.h:129: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CB6 21 25 66      [10] 1297 	ld	hl, #_object + 7
   4CB9 5E            [ 7] 1298 	ld	e,(hl)
                           1299 ;src/draws.h:130: draw(object.x,object.y,object.sprite,2);
   4CBA 01 1F 66      [10] 1300 	ld	bc,#_object + 1
                           1301 ;src/draws.h:129: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4CBD 7B            [ 4] 1302 	ld	a,e
   4CBE D6 04         [ 7] 1303 	sub	a, #0x04
   4CC0 28 0C         [12] 1304 	jr	Z,00105$
   4CC2 21 24 66      [10] 1305 	ld	hl,#_object + 6
   4CC5 7B            [ 4] 1306 	ld	a,e
   4CC6 D6 06         [ 7] 1307 	sub	a, #0x06
   4CC8 20 25         [12] 1308 	jr	NZ,00106$
   4CCA 7E            [ 7] 1309 	ld	a,(hl)
   4CCB 3D            [ 4] 1310 	dec	a
   4CCC 20 21         [12] 1311 	jr	NZ,00106$
   4CCE                    1312 00105$:
                           1313 ;src/draws.h:130: draw(object.x,object.y,object.sprite,2);
   4CCE ED 5B 22 66   [20] 1314 	ld	de, (#(_object + 0x0004) + 0)
   4CD2 0A            [ 7] 1315 	ld	a,(bc)
   4CD3 DD 77 FF      [19] 1316 	ld	-1 (ix),a
   4CD6 21 1E 66      [10] 1317 	ld	hl, #_object + 0
   4CD9 4E            [ 7] 1318 	ld	c,(hl)
   4CDA 3E 02         [ 7] 1319 	ld	a,#0x02
   4CDC F5            [11] 1320 	push	af
   4CDD 33            [ 6] 1321 	inc	sp
   4CDE D5            [11] 1322 	push	de
   4CDF DD 7E FF      [19] 1323 	ld	a,-1 (ix)
   4CE2 F5            [11] 1324 	push	af
   4CE3 33            [ 6] 1325 	inc	sp
   4CE4 79            [ 4] 1326 	ld	a,c
   4CE5 F5            [11] 1327 	push	af
   4CE6 33            [ 6] 1328 	inc	sp
   4CE7 CD 7F 4B      [17] 1329 	call	_draw
   4CEA F1            [10] 1330 	pop	af
   4CEB F1            [10] 1331 	pop	af
   4CEC 33            [ 6] 1332 	inc	sp
   4CED 18 23         [12] 1333 	jr	00111$
   4CEF                    1334 00106$:
                           1335 ;src/draws.h:131: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4CEF 7B            [ 4] 1336 	ld	a,e
   4CF0 FE 02         [ 7] 1337 	cp	a,#0x02
   4CF2 28 08         [12] 1338 	jr	Z,00101$
   4CF4 D6 08         [ 7] 1339 	sub	a, #0x08
   4CF6 20 1A         [12] 1340 	jr	NZ,00111$
   4CF8 7E            [ 7] 1341 	ld	a,(hl)
   4CF9 3D            [ 4] 1342 	dec	a
   4CFA 20 16         [12] 1343 	jr	NZ,00111$
   4CFC                    1344 00101$:
                           1345 ;src/draws.h:132: draw(object.x,object.y,object.sprite,1);
   4CFC ED 5B 22 66   [20] 1346 	ld	de, (#(_object + 0x0004) + 0)
   4D00 0A            [ 7] 1347 	ld	a,(bc)
   4D01 47            [ 4] 1348 	ld	b,a
   4D02 21 1E 66      [10] 1349 	ld	hl, #_object + 0
   4D05 4E            [ 7] 1350 	ld	c,(hl)
   4D06 3E 01         [ 7] 1351 	ld	a,#0x01
   4D08 F5            [11] 1352 	push	af
   4D09 33            [ 6] 1353 	inc	sp
   4D0A D5            [11] 1354 	push	de
   4D0B C5            [11] 1355 	push	bc
   4D0C CD 7F 4B      [17] 1356 	call	_draw
   4D0F F1            [10] 1357 	pop	af
   4D10 F1            [10] 1358 	pop	af
   4D11 33            [ 6] 1359 	inc	sp
   4D12                    1360 00111$:
                           1361 ;src/draws.h:134: drawStats();
   4D12 CD 40 4C      [17] 1362 	call	_drawStats
   4D15 33            [ 6] 1363 	inc	sp
   4D16 DD E1         [14] 1364 	pop	ix
   4D18 C9            [10] 1365 	ret
                           1366 ;src/draws.h:137: void erases(){
                           1367 ;	---------------------------------
                           1368 ; Function erases
                           1369 ; ---------------------------------
   4D19                    1370 _erases::
                           1371 ;src/draws.h:139: erase(player.lx,player.ly,0);
   4D19 21 2B 66      [10] 1372 	ld	hl, #_player + 3
   4D1C 46            [ 7] 1373 	ld	b,(hl)
   4D1D 21 2A 66      [10] 1374 	ld	hl, #_player + 2
   4D20 56            [ 7] 1375 	ld	d,(hl)
   4D21 AF            [ 4] 1376 	xor	a, a
   4D22 F5            [11] 1377 	push	af
   4D23 33            [ 6] 1378 	inc	sp
   4D24 4A            [ 4] 1379 	ld	c, d
   4D25 C5            [11] 1380 	push	bc
   4D26 CD DF 4B      [17] 1381 	call	_erase
   4D29 F1            [10] 1382 	pop	af
   4D2A 33            [ 6] 1383 	inc	sp
                           1384 ;src/draws.h:140: erase(enemy.lx,enemy.ly,0);
   4D2B 21 36 66      [10] 1385 	ld	hl, #_enemy + 3
   4D2E 46            [ 7] 1386 	ld	b,(hl)
   4D2F 21 35 66      [10] 1387 	ld	hl, #_enemy + 2
   4D32 56            [ 7] 1388 	ld	d,(hl)
   4D33 AF            [ 4] 1389 	xor	a, a
   4D34 F5            [11] 1390 	push	af
   4D35 33            [ 6] 1391 	inc	sp
   4D36 4A            [ 4] 1392 	ld	c, d
   4D37 C5            [11] 1393 	push	bc
   4D38 CD DF 4B      [17] 1394 	call	_erase
   4D3B F1            [10] 1395 	pop	af
   4D3C 33            [ 6] 1396 	inc	sp
                           1397 ;src/draws.h:141: if(arrow == 1){
   4D3D 3A 1A 66      [13] 1398 	ld	a,(#_arrow + 0)
   4D40 3D            [ 4] 1399 	dec	a
   4D41 C0            [11] 1400 	ret	NZ
                           1401 ;src/draws.h:142: if(object.dir == 4 || object.dir == 6)
   4D42 21 25 66      [10] 1402 	ld	hl, #_object + 7
   4D45 4E            [ 7] 1403 	ld	c,(hl)
                           1404 ;src/draws.h:143: erase(object.lx,object.ly,2);
   4D46 21 21 66      [10] 1405 	ld	hl, #_object + 3
   4D49 56            [ 7] 1406 	ld	d,(hl)
   4D4A 21 20 66      [10] 1407 	ld	hl, #_object + 2
   4D4D 46            [ 7] 1408 	ld	b,(hl)
                           1409 ;src/draws.h:142: if(object.dir == 4 || object.dir == 6)
   4D4E 79            [ 4] 1410 	ld	a,c
   4D4F FE 04         [ 7] 1411 	cp	a,#0x04
   4D51 28 04         [12] 1412 	jr	Z,00101$
   4D53 D6 06         [ 7] 1413 	sub	a, #0x06
   4D55 20 0F         [12] 1414 	jr	NZ,00102$
   4D57                    1415 00101$:
                           1416 ;src/draws.h:143: erase(object.lx,object.ly,2);
   4D57 3E 02         [ 7] 1417 	ld	a,#0x02
   4D59 F5            [11] 1418 	push	af
   4D5A 33            [ 6] 1419 	inc	sp
   4D5B D5            [11] 1420 	push	de
   4D5C 33            [ 6] 1421 	inc	sp
   4D5D C5            [11] 1422 	push	bc
   4D5E 33            [ 6] 1423 	inc	sp
   4D5F CD DF 4B      [17] 1424 	call	_erase
   4D62 F1            [10] 1425 	pop	af
   4D63 33            [ 6] 1426 	inc	sp
   4D64 18 0D         [12] 1427 	jr	00103$
   4D66                    1428 00102$:
                           1429 ;src/draws.h:145: erase(object.lx,object.ly,1);
   4D66 3E 01         [ 7] 1430 	ld	a,#0x01
   4D68 F5            [11] 1431 	push	af
   4D69 33            [ 6] 1432 	inc	sp
   4D6A D5            [11] 1433 	push	de
   4D6B 33            [ 6] 1434 	inc	sp
   4D6C C5            [11] 1435 	push	bc
   4D6D 33            [ 6] 1436 	inc	sp
   4D6E CD DF 4B      [17] 1437 	call	_erase
   4D71 F1            [10] 1438 	pop	af
   4D72 33            [ 6] 1439 	inc	sp
   4D73                    1440 00103$:
                           1441 ;src/draws.h:146: if(bound == 1) arrow = 0;
   4D73 3A 1C 66      [13] 1442 	ld	a,(#_bound + 0)
   4D76 3D            [ 4] 1443 	dec	a
   4D77 C0            [11] 1444 	ret	NZ
   4D78 21 1A 66      [10] 1445 	ld	hl,#_arrow + 0
   4D7B 36 00         [10] 1446 	ld	(hl), #0x00
   4D7D C9            [10] 1447 	ret
                           1448 ;src/draws.h:153: void drawFatiga(u8 atk, u8 col){
                           1449 ;	---------------------------------
                           1450 ; Function drawFatiga
                           1451 ; ---------------------------------
   4D7E                    1452 _drawFatiga::
   4D7E DD E5         [15] 1453 	push	ix
   4D80 DD 21 00 00   [14] 1454 	ld	ix,#0
   4D84 DD 39         [15] 1455 	add	ix,sp
   4D86 F5            [11] 1456 	push	af
                           1457 ;src/draws.h:155: if(atk < 20)
   4D87 DD 7E 04      [19] 1458 	ld	a,4 (ix)
   4D8A D6 14         [ 7] 1459 	sub	a, #0x14
   4D8C 30 04         [12] 1460 	jr	NC,00102$
                           1461 ;src/draws.h:156: col = 2;
   4D8E DD 36 05 02   [19] 1462 	ld	5 (ix),#0x02
   4D92                    1463 00102$:
                           1464 ;src/draws.h:157: if(atk > 30 || atk <= 20){
   4D92 3E 14         [ 7] 1465 	ld	a,#0x14
   4D94 DD 96 04      [19] 1466 	sub	a, 4 (ix)
   4D97 3E 00         [ 7] 1467 	ld	a,#0x00
   4D99 17            [ 4] 1468 	rla
   4D9A DD 77 FE      [19] 1469 	ld	-2 (ix),a
                           1470 ;src/draws.h:159: switch(col){
   4D9D 3E 02         [ 7] 1471 	ld	a,#0x02
   4D9F DD 96 05      [19] 1472 	sub	a, 5 (ix)
   4DA2 3E 00         [ 7] 1473 	ld	a,#0x00
   4DA4 17            [ 4] 1474 	rla
   4DA5 DD 77 FF      [19] 1475 	ld	-1 (ix),a
                           1476 ;src/draws.h:157: if(atk > 30 || atk <= 20){
   4DA8 3E 1E         [ 7] 1477 	ld	a,#0x1E
   4DAA DD 96 04      [19] 1478 	sub	a, 4 (ix)
   4DAD 38 06         [12] 1479 	jr	C,00107$
   4DAF DD 7E FE      [19] 1480 	ld	a,-2 (ix)
   4DB2 B7            [ 4] 1481 	or	a, a
   4DB3 20 4F         [12] 1482 	jr	NZ,00108$
   4DB5                    1483 00107$:
                           1484 ;src/draws.h:158: memptr = cpct_getScreenPtr(VMEM,28,192);
   4DB5 21 1C C0      [10] 1485 	ld	hl,#0xC01C
   4DB8 E5            [11] 1486 	push	hl
   4DB9 2E 00         [ 7] 1487 	ld	l, #0x00
   4DBB E5            [11] 1488 	push	hl
   4DBC CD 2F 64      [17] 1489 	call	_cpct_getScreenPtr
                           1490 ;src/draws.h:159: switch(col){
   4DBF DD 7E FF      [19] 1491 	ld	a,-1 (ix)
   4DC2 B7            [ 4] 1492 	or	a, a
   4DC3 20 3F         [12] 1493 	jr	NZ,00108$
                           1494 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4DC5 4D            [ 4] 1495 	ld	c, l
   4DC6 44            [ 4] 1496 	ld	b, h
                           1497 ;src/draws.h:159: switch(col){
   4DC7 DD 5E 05      [19] 1498 	ld	e,5 (ix)
   4DCA 16 00         [ 7] 1499 	ld	d,#0x00
   4DCC 21 D2 4D      [10] 1500 	ld	hl,#00156$
   4DCF 19            [11] 1501 	add	hl,de
   4DD0 19            [11] 1502 	add	hl,de
                           1503 ;src/draws.h:160: case 0:
   4DD1 E9            [ 4] 1504 	jp	(hl)
   4DD2                    1505 00156$:
   4DD2 18 04         [12] 1506 	jr	00103$
   4DD4 18 14         [12] 1507 	jr	00104$
   4DD6 18 20         [12] 1508 	jr	00105$
   4DD8                    1509 00103$:
                           1510 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4DD8 21 02 08      [10] 1511 	ld	hl,#0x0802
   4DDB E5            [11] 1512 	push	hl
   4DDC DD 7E 05      [19] 1513 	ld	a,5 (ix)
   4DDF F5            [11] 1514 	push	af
   4DE0 33            [ 6] 1515 	inc	sp
   4DE1 C5            [11] 1516 	push	bc
   4DE2 CD 5E 63      [17] 1517 	call	_cpct_drawSolidBox
   4DE5 F1            [10] 1518 	pop	af
   4DE6 F1            [10] 1519 	pop	af
   4DE7 33            [ 6] 1520 	inc	sp
                           1521 ;src/draws.h:162: break;
   4DE8 18 1A         [12] 1522 	jr	00108$
                           1523 ;src/draws.h:163: case 1:
   4DEA                    1524 00104$:
                           1525 ;src/draws.h:164: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4DEA 11 80 46      [10] 1526 	ld	de,#_fatiga_nor
   4DED 21 02 08      [10] 1527 	ld	hl,#0x0802
   4DF0 E5            [11] 1528 	push	hl
   4DF1 C5            [11] 1529 	push	bc
   4DF2 D5            [11] 1530 	push	de
   4DF3 CD D8 62      [17] 1531 	call	_cpct_drawSpriteMasked
                           1532 ;src/draws.h:165: break;
   4DF6 18 0C         [12] 1533 	jr	00108$
                           1534 ;src/draws.h:166: case 2:
   4DF8                    1535 00105$:
                           1536 ;src/draws.h:167: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4DF8 11 A0 46      [10] 1537 	ld	de,#_fatiga_full
   4DFB 21 02 08      [10] 1538 	ld	hl,#0x0802
   4DFE E5            [11] 1539 	push	hl
   4DFF C5            [11] 1540 	push	bc
   4E00 D5            [11] 1541 	push	de
   4E01 CD D8 62      [17] 1542 	call	_cpct_drawSpriteMasked
                           1543 ;src/draws.h:168: }
   4E04                    1544 00108$:
                           1545 ;src/draws.h:170: if(atk > 40 || atk <= 20){
   4E04 3E 28         [ 7] 1546 	ld	a,#0x28
   4E06 DD 96 04      [19] 1547 	sub	a, 4 (ix)
   4E09 38 06         [12] 1548 	jr	C,00114$
   4E0B DD 7E FE      [19] 1549 	ld	a,-2 (ix)
   4E0E B7            [ 4] 1550 	or	a, a
   4E0F 20 4F         [12] 1551 	jr	NZ,00115$
   4E11                    1552 00114$:
                           1553 ;src/draws.h:171: memptr = cpct_getScreenPtr(VMEM,31,192);
   4E11 21 1F C0      [10] 1554 	ld	hl,#0xC01F
   4E14 E5            [11] 1555 	push	hl
   4E15 2E 00         [ 7] 1556 	ld	l, #0x00
   4E17 E5            [11] 1557 	push	hl
   4E18 CD 2F 64      [17] 1558 	call	_cpct_getScreenPtr
                           1559 ;src/draws.h:172: switch(col){
   4E1B DD 7E FF      [19] 1560 	ld	a,-1 (ix)
   4E1E B7            [ 4] 1561 	or	a, a
   4E1F 20 3F         [12] 1562 	jr	NZ,00115$
                           1563 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4E21 4D            [ 4] 1564 	ld	c, l
   4E22 44            [ 4] 1565 	ld	b, h
                           1566 ;src/draws.h:172: switch(col){
   4E23 DD 5E 05      [19] 1567 	ld	e,5 (ix)
   4E26 16 00         [ 7] 1568 	ld	d,#0x00
   4E28 21 2E 4E      [10] 1569 	ld	hl,#00157$
   4E2B 19            [11] 1570 	add	hl,de
   4E2C 19            [11] 1571 	add	hl,de
                           1572 ;src/draws.h:173: case 0:
   4E2D E9            [ 4] 1573 	jp	(hl)
   4E2E                    1574 00157$:
   4E2E 18 04         [12] 1575 	jr	00110$
   4E30 18 14         [12] 1576 	jr	00111$
   4E32 18 20         [12] 1577 	jr	00112$
   4E34                    1578 00110$:
                           1579 ;src/draws.h:174: cpct_drawSolidBox(memptr, col, 2, 8);
   4E34 21 02 08      [10] 1580 	ld	hl,#0x0802
   4E37 E5            [11] 1581 	push	hl
   4E38 DD 7E 05      [19] 1582 	ld	a,5 (ix)
   4E3B F5            [11] 1583 	push	af
   4E3C 33            [ 6] 1584 	inc	sp
   4E3D C5            [11] 1585 	push	bc
   4E3E CD 5E 63      [17] 1586 	call	_cpct_drawSolidBox
   4E41 F1            [10] 1587 	pop	af
   4E42 F1            [10] 1588 	pop	af
   4E43 33            [ 6] 1589 	inc	sp
                           1590 ;src/draws.h:175: break;
   4E44 18 1A         [12] 1591 	jr	00115$
                           1592 ;src/draws.h:176: case 1:
   4E46                    1593 00111$:
                           1594 ;src/draws.h:177: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4E46 11 80 46      [10] 1595 	ld	de,#_fatiga_nor
   4E49 21 02 08      [10] 1596 	ld	hl,#0x0802
   4E4C E5            [11] 1597 	push	hl
   4E4D C5            [11] 1598 	push	bc
   4E4E D5            [11] 1599 	push	de
   4E4F CD D8 62      [17] 1600 	call	_cpct_drawSpriteMasked
                           1601 ;src/draws.h:178: break;
   4E52 18 0C         [12] 1602 	jr	00115$
                           1603 ;src/draws.h:179: case 2:
   4E54                    1604 00112$:
                           1605 ;src/draws.h:180: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E54 11 A0 46      [10] 1606 	ld	de,#_fatiga_full
   4E57 21 02 08      [10] 1607 	ld	hl,#0x0802
   4E5A E5            [11] 1608 	push	hl
   4E5B C5            [11] 1609 	push	bc
   4E5C D5            [11] 1610 	push	de
   4E5D CD D8 62      [17] 1611 	call	_cpct_drawSpriteMasked
                           1612 ;src/draws.h:181: }
   4E60                    1613 00115$:
                           1614 ;src/draws.h:183: if(atk <= 20){
   4E60 DD 7E FE      [19] 1615 	ld	a,-2 (ix)
   4E63 B7            [ 4] 1616 	or	a, a
   4E64 20 39         [12] 1617 	jr	NZ,00122$
                           1618 ;src/draws.h:184: memptr = cpct_getScreenPtr(VMEM,34,192);
   4E66 21 22 C0      [10] 1619 	ld	hl,#0xC022
   4E69 E5            [11] 1620 	push	hl
   4E6A 2E 00         [ 7] 1621 	ld	l, #0x00
   4E6C E5            [11] 1622 	push	hl
   4E6D CD 2F 64      [17] 1623 	call	_cpct_getScreenPtr
                           1624 ;src/draws.h:161: cpct_drawSolidBox(memptr, col, 2, 8);
   4E70 4D            [ 4] 1625 	ld	c, l
   4E71 44            [ 4] 1626 	ld	b, h
                           1627 ;src/draws.h:185: switch(col){
   4E72 DD 7E 05      [19] 1628 	ld	a,5 (ix)
   4E75 B7            [ 4] 1629 	or	a, a
   4E76 28 09         [12] 1630 	jr	Z,00117$
   4E78 DD 7E 05      [19] 1631 	ld	a,5 (ix)
   4E7B D6 02         [ 7] 1632 	sub	a, #0x02
   4E7D 28 14         [12] 1633 	jr	Z,00118$
   4E7F 18 1E         [12] 1634 	jr	00122$
                           1635 ;src/draws.h:186: case 0:
   4E81                    1636 00117$:
                           1637 ;src/draws.h:187: cpct_drawSolidBox(memptr, col, 2, 8);
   4E81 21 02 08      [10] 1638 	ld	hl,#0x0802
   4E84 E5            [11] 1639 	push	hl
   4E85 DD 7E 05      [19] 1640 	ld	a,5 (ix)
   4E88 F5            [11] 1641 	push	af
   4E89 33            [ 6] 1642 	inc	sp
   4E8A C5            [11] 1643 	push	bc
   4E8B CD 5E 63      [17] 1644 	call	_cpct_drawSolidBox
   4E8E F1            [10] 1645 	pop	af
   4E8F F1            [10] 1646 	pop	af
   4E90 33            [ 6] 1647 	inc	sp
                           1648 ;src/draws.h:188: break;
   4E91 18 0C         [12] 1649 	jr	00122$
                           1650 ;src/draws.h:189: case 2:
   4E93                    1651 00118$:
                           1652 ;src/draws.h:190: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4E93 11 A0 46      [10] 1653 	ld	de,#_fatiga_full
   4E96 21 02 08      [10] 1654 	ld	hl,#0x0802
   4E99 E5            [11] 1655 	push	hl
   4E9A C5            [11] 1656 	push	bc
   4E9B D5            [11] 1657 	push	de
   4E9C CD D8 62      [17] 1658 	call	_cpct_drawSpriteMasked
                           1659 ;src/draws.h:191: }
   4E9F                    1660 00122$:
   4E9F DD F9         [10] 1661 	ld	sp, ix
   4EA1 DD E1         [14] 1662 	pop	ix
   4EA3 C9            [10] 1663 	ret
                           1664 ;src/draws.h:196: void drawPickUps(u8 corazon, u8 bullet){
                           1665 ;	---------------------------------
                           1666 ; Function drawPickUps
                           1667 ; ---------------------------------
   4EA4                    1668 _drawPickUps::
   4EA4 DD E5         [15] 1669 	push	ix
   4EA6 DD 21 00 00   [14] 1670 	ld	ix,#0
   4EAA DD 39         [15] 1671 	add	ix,sp
                           1672 ;src/draws.h:199: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4EAC 21 04 A0      [10] 1673 	ld	hl,#0xA004
   4EAF E5            [11] 1674 	push	hl
   4EB0 21 00 C0      [10] 1675 	ld	hl,#0xC000
   4EB3 E5            [11] 1676 	push	hl
   4EB4 CD 2F 64      [17] 1677 	call	_cpct_getScreenPtr
                           1678 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EB7 4D            [ 4] 1679 	ld	c, l
   4EB8 44            [ 4] 1680 	ld	b, h
                           1681 ;src/draws.h:200: if(corazon == 0)
   4EB9 DD 7E 04      [19] 1682 	ld	a,4 (ix)
   4EBC B7            [ 4] 1683 	or	a, a
   4EBD 20 0E         [12] 1684 	jr	NZ,00102$
                           1685 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EBF 11 00 46      [10] 1686 	ld	de,#_corazon_lleno
   4EC2 21 04 08      [10] 1687 	ld	hl,#0x0804
   4EC5 E5            [11] 1688 	push	hl
   4EC6 C5            [11] 1689 	push	bc
   4EC7 D5            [11] 1690 	push	de
   4EC8 CD D8 62      [17] 1691 	call	_cpct_drawSpriteMasked
   4ECB 18 0E         [12] 1692 	jr	00103$
   4ECD                    1693 00102$:
                           1694 ;src/draws.h:203: cpct_drawSolidBox(memptr, 0, 4, 8);
   4ECD 21 04 08      [10] 1695 	ld	hl,#0x0804
   4ED0 E5            [11] 1696 	push	hl
   4ED1 AF            [ 4] 1697 	xor	a, a
   4ED2 F5            [11] 1698 	push	af
   4ED3 33            [ 6] 1699 	inc	sp
   4ED4 C5            [11] 1700 	push	bc
   4ED5 CD 5E 63      [17] 1701 	call	_cpct_drawSolidBox
   4ED8 F1            [10] 1702 	pop	af
   4ED9 F1            [10] 1703 	pop	af
   4EDA 33            [ 6] 1704 	inc	sp
   4EDB                    1705 00103$:
                           1706 ;src/draws.h:205: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4EDB 21 08 10      [10] 1707 	ld	hl,#0x1008
   4EDE E5            [11] 1708 	push	hl
   4EDF 21 00 C0      [10] 1709 	ld	hl,#0xC000
   4EE2 E5            [11] 1710 	push	hl
   4EE3 CD 2F 64      [17] 1711 	call	_cpct_getScreenPtr
                           1712 ;src/draws.h:201: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4EE6 EB            [ 4] 1713 	ex	de,hl
                           1714 ;src/draws.h:206: if(bullet == 0)
   4EE7 DD 7E 05      [19] 1715 	ld	a,5 (ix)
   4EEA B7            [ 4] 1716 	or	a, a
   4EEB 20 0E         [12] 1717 	jr	NZ,00105$
                           1718 ;src/draws.h:207: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4EED 01 62 60      [10] 1719 	ld	bc,#_flecha_arriba
   4EF0 21 02 08      [10] 1720 	ld	hl,#0x0802
   4EF3 E5            [11] 1721 	push	hl
   4EF4 D5            [11] 1722 	push	de
   4EF5 C5            [11] 1723 	push	bc
   4EF6 CD D8 62      [17] 1724 	call	_cpct_drawSpriteMasked
   4EF9 18 0E         [12] 1725 	jr	00107$
   4EFB                    1726 00105$:
                           1727 ;src/draws.h:209: cpct_drawSolidBox(memptr, 0, 2, 8);
   4EFB 21 02 08      [10] 1728 	ld	hl,#0x0802
   4EFE E5            [11] 1729 	push	hl
   4EFF AF            [ 4] 1730 	xor	a, a
   4F00 F5            [11] 1731 	push	af
   4F01 33            [ 6] 1732 	inc	sp
   4F02 D5            [11] 1733 	push	de
   4F03 CD 5E 63      [17] 1734 	call	_cpct_drawSolidBox
   4F06 F1            [10] 1735 	pop	af
   4F07 F1            [10] 1736 	pop	af
   4F08 33            [ 6] 1737 	inc	sp
   4F09                    1738 00107$:
   4F09 DD E1         [14] 1739 	pop	ix
   4F0B C9            [10] 1740 	ret
                           1741 ;src/ia.h:12: u8 detectPlayerRoom(u8 px,u8 py){
                           1742 ;	---------------------------------
                           1743 ; Function detectPlayerRoom
                           1744 ; ---------------------------------
   4F0C                    1745 _detectPlayerRoom::
   4F0C DD E5         [15] 1746 	push	ix
   4F0E DD 21 00 00   [14] 1747 	ld	ix,#0
   4F12 DD 39         [15] 1748 	add	ix,sp
                           1749 ;src/ia.h:13: return scene[py/tileheight][px/tilewidth];
   4F14 11 25 65      [10] 1750 	ld	de,#_scene+0
   4F17 DD 7E 05      [19] 1751 	ld	a,5 (ix)
   4F1A 07            [ 4] 1752 	rlca
   4F1B 07            [ 4] 1753 	rlca
   4F1C 07            [ 4] 1754 	rlca
   4F1D 07            [ 4] 1755 	rlca
   4F1E E6 0F         [ 7] 1756 	and	a,#0x0F
   4F20 4F            [ 4] 1757 	ld	c,a
   4F21 06 00         [ 7] 1758 	ld	b,#0x00
   4F23 69            [ 4] 1759 	ld	l, c
   4F24 60            [ 4] 1760 	ld	h, b
   4F25 29            [11] 1761 	add	hl, hl
   4F26 29            [11] 1762 	add	hl, hl
   4F27 09            [11] 1763 	add	hl, bc
   4F28 29            [11] 1764 	add	hl, hl
   4F29 29            [11] 1765 	add	hl, hl
   4F2A 19            [11] 1766 	add	hl,de
   4F2B DD 5E 04      [19] 1767 	ld	e,4 (ix)
   4F2E CB 3B         [ 8] 1768 	srl	e
   4F30 CB 3B         [ 8] 1769 	srl	e
   4F32 16 00         [ 7] 1770 	ld	d,#0x00
   4F34 19            [11] 1771 	add	hl,de
   4F35 6E            [ 7] 1772 	ld	l,(hl)
   4F36 DD E1         [14] 1773 	pop	ix
   4F38 C9            [10] 1774 	ret
                           1775 ;src/ia.h:16: u8 chooseDirection(){
                           1776 ;	---------------------------------
                           1777 ; Function chooseDirection
                           1778 ; ---------------------------------
   4F39                    1779 _chooseDirection::
                           1780 ;src/ia.h:18: u8 dir = 0;
   4F39 16 00         [ 7] 1781 	ld	d,#0x00
                           1782 ;src/ia.h:19: u8 rnd = (rand()%4)+1;
   4F3B D5            [11] 1783 	push	de
   4F3C CD 7C 61      [17] 1784 	call	_rand
   4F3F 01 04 00      [10] 1785 	ld	bc,#0x0004
   4F42 C5            [11] 1786 	push	bc
   4F43 E5            [11] 1787 	push	hl
   4F44 CD 23 64      [17] 1788 	call	__modsint
   4F47 F1            [10] 1789 	pop	af
   4F48 F1            [10] 1790 	pop	af
   4F49 D1            [10] 1791 	pop	de
   4F4A 5D            [ 4] 1792 	ld	e,l
   4F4B 1C            [ 4] 1793 	inc	e
                           1794 ;src/ia.h:20: switch(rnd){
   4F4C 7B            [ 4] 1795 	ld	a,e
   4F4D D6 01         [ 7] 1796 	sub	a, #0x01
   4F4F 38 24         [12] 1797 	jr	C,00105$
   4F51 3E 04         [ 7] 1798 	ld	a,#0x04
   4F53 93            [ 4] 1799 	sub	a, e
   4F54 38 1F         [12] 1800 	jr	C,00105$
   4F56 1D            [ 4] 1801 	dec	e
   4F57 16 00         [ 7] 1802 	ld	d,#0x00
   4F59 21 5F 4F      [10] 1803 	ld	hl,#00116$
   4F5C 19            [11] 1804 	add	hl,de
   4F5D 19            [11] 1805 	add	hl,de
                           1806 ;src/ia.h:21: case 4: dir = 6;break;
   4F5E E9            [ 4] 1807 	jp	(hl)
   4F5F                    1808 00116$:
   4F5F 18 12         [12] 1809 	jr	00104$
   4F61 18 0C         [12] 1810 	jr	00103$
   4F63 18 06         [12] 1811 	jr	00102$
   4F65 18 00         [12] 1812 	jr	00101$
   4F67                    1813 00101$:
   4F67 16 06         [ 7] 1814 	ld	d,#0x06
   4F69 18 0A         [12] 1815 	jr	00105$
                           1816 ;src/ia.h:22: case 3: dir = 4;break;
   4F6B                    1817 00102$:
   4F6B 16 04         [ 7] 1818 	ld	d,#0x04
   4F6D 18 06         [12] 1819 	jr	00105$
                           1820 ;src/ia.h:23: case 2: dir = 2;break;
   4F6F                    1821 00103$:
   4F6F 16 02         [ 7] 1822 	ld	d,#0x02
   4F71 18 02         [12] 1823 	jr	00105$
                           1824 ;src/ia.h:24: case 1: dir = 8;break;
   4F73                    1825 00104$:
   4F73 16 08         [ 7] 1826 	ld	d,#0x08
                           1827 ;src/ia.h:25: }
   4F75                    1828 00105$:
                           1829 ;src/ia.h:27: return dir;
   4F75 6A            [ 4] 1830 	ld	l,d
   4F76 C9            [10] 1831 	ret
                           1832 ;src/ia.h:31: u8 setDirection(u8 px,u8 py,u8 x,u8 y){
                           1833 ;	---------------------------------
                           1834 ; Function setDirection
                           1835 ; ---------------------------------
   4F77                    1836 _setDirection::
   4F77 DD E5         [15] 1837 	push	ix
   4F79 DD 21 00 00   [14] 1838 	ld	ix,#0
   4F7D DD 39         [15] 1839 	add	ix,sp
                           1840 ;src/ia.h:33: if(px < x) dir = 4;
   4F7F DD 7E 04      [19] 1841 	ld	a,4 (ix)
   4F82 DD 96 06      [19] 1842 	sub	a, 6 (ix)
   4F85 30 04         [12] 1843 	jr	NC,00108$
   4F87 2E 04         [ 7] 1844 	ld	l,#0x04
   4F89 18 1A         [12] 1845 	jr	00109$
   4F8B                    1846 00108$:
                           1847 ;src/ia.h:34: else if(py > y) dir = 2;
   4F8B DD 7E 07      [19] 1848 	ld	a,7 (ix)
   4F8E DD 96 05      [19] 1849 	sub	a, 5 (ix)
   4F91 30 04         [12] 1850 	jr	NC,00105$
   4F93 2E 02         [ 7] 1851 	ld	l,#0x02
   4F95 18 0E         [12] 1852 	jr	00109$
   4F97                    1853 00105$:
                           1854 ;src/ia.h:35: else if(px > x) dir = 6;
   4F97 DD 7E 06      [19] 1855 	ld	a,6 (ix)
   4F9A DD 96 04      [19] 1856 	sub	a, 4 (ix)
   4F9D 30 04         [12] 1857 	jr	NC,00102$
   4F9F 2E 06         [ 7] 1858 	ld	l,#0x06
   4FA1 18 02         [12] 1859 	jr	00109$
   4FA3                    1860 00102$:
                           1861 ;src/ia.h:36: else dir = 8;
   4FA3 2E 08         [ 7] 1862 	ld	l,#0x08
   4FA5                    1863 00109$:
                           1864 ;src/ia.h:37: return dir;
   4FA5 DD E1         [14] 1865 	pop	ix
   4FA7 C9            [10] 1866 	ret
                           1867 ;src/ia.h:40: void movement(u8 dir,u8 *x,u8 *y){
                           1868 ;	---------------------------------
                           1869 ; Function movement
                           1870 ; ---------------------------------
   4FA8                    1871 _movement::
   4FA8 DD E5         [15] 1872 	push	ix
   4FAA DD 21 00 00   [14] 1873 	ld	ix,#0
   4FAE DD 39         [15] 1874 	add	ix,sp
                           1875 ;src/ia.h:44: case 8: y[0] -= 2; break;
   4FB0 DD 5E 07      [19] 1876 	ld	e,7 (ix)
   4FB3 DD 56 08      [19] 1877 	ld	d,8 (ix)
                           1878 ;src/ia.h:41: switch(dir){
   4FB6 DD 7E 04      [19] 1879 	ld	a,4 (ix)
   4FB9 D6 02         [ 7] 1880 	sub	a, #0x02
   4FBB 28 2B         [12] 1881 	jr	Z,00104$
                           1882 ;src/ia.h:42: case 6: x[0] += 1; break;
   4FBD DD 6E 05      [19] 1883 	ld	l,5 (ix)
   4FC0 DD 66 06      [19] 1884 	ld	h,6 (ix)
                           1885 ;src/ia.h:41: switch(dir){
   4FC3 DD 7E 04      [19] 1886 	ld	a,4 (ix)
   4FC6 D6 04         [ 7] 1887 	sub	a, #0x04
   4FC8 28 13         [12] 1888 	jr	Z,00102$
   4FCA DD 7E 04      [19] 1889 	ld	a,4 (ix)
   4FCD D6 06         [ 7] 1890 	sub	a, #0x06
   4FCF 28 09         [12] 1891 	jr	Z,00101$
   4FD1 DD 7E 04      [19] 1892 	ld	a,4 (ix)
   4FD4 D6 08         [ 7] 1893 	sub	a, #0x08
   4FD6 28 0A         [12] 1894 	jr	Z,00103$
   4FD8 18 12         [12] 1895 	jr	00106$
                           1896 ;src/ia.h:42: case 6: x[0] += 1; break;
   4FDA                    1897 00101$:
   4FDA 34            [11] 1898 	inc	(hl)
   4FDB 18 0F         [12] 1899 	jr	00106$
                           1900 ;src/ia.h:43: case 4: x[0] -= 1; break;
   4FDD                    1901 00102$:
   4FDD 56            [ 7] 1902 	ld	d,(hl)
   4FDE 15            [ 4] 1903 	dec	d
   4FDF 72            [ 7] 1904 	ld	(hl),d
   4FE0 18 0A         [12] 1905 	jr	00106$
                           1906 ;src/ia.h:44: case 8: y[0] -= 2; break;
   4FE2                    1907 00103$:
   4FE2 1A            [ 7] 1908 	ld	a,(de)
   4FE3 C6 FE         [ 7] 1909 	add	a,#0xFE
   4FE5 12            [ 7] 1910 	ld	(de),a
   4FE6 18 04         [12] 1911 	jr	00106$
                           1912 ;src/ia.h:45: case 2: y[0] += 2; break;
   4FE8                    1913 00104$:
   4FE8 1A            [ 7] 1914 	ld	a,(de)
   4FE9 C6 02         [ 7] 1915 	add	a, #0x02
   4FEB 12            [ 7] 1916 	ld	(de),a
                           1917 ;src/ia.h:46: }
   4FEC                    1918 00106$:
   4FEC DD E1         [14] 1919 	pop	ix
   4FEE C9            [10] 1920 	ret
                           1921 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           1922 ;	---------------------------------
                           1923 ; Function checkCollisions
                           1924 ; ---------------------------------
   4FEF                    1925 _checkCollisions::
   4FEF DD E5         [15] 1926 	push	ix
   4FF1 DD 21 00 00   [14] 1927 	ld	ix,#0
   4FF5 DD 39         [15] 1928 	add	ix,sp
   4FF7 21 FA FF      [10] 1929 	ld	hl,#-6
   4FFA 39            [11] 1930 	add	hl,sp
   4FFB F9            [ 6] 1931 	ld	sp,hl
                           1932 ;src/CalcColision.h:8: u8 popX = pX + tilewidth;
   4FFC DD 6E 04      [19] 1933 	ld	l,4 (ix)
   4FFF 2C            [ 4] 1934 	inc	l
   5000 2C            [ 4] 1935 	inc	l
   5001 2C            [ 4] 1936 	inc	l
   5002 2C            [ 4] 1937 	inc	l
                           1938 ;src/CalcColision.h:9: u8 popY = pY + tileheight;
   5003 DD 7E 05      [19] 1939 	ld	a,5 (ix)
   5006 C6 10         [ 7] 1940 	add	a, #0x10
   5008 DD 77 FB      [19] 1941 	ld	-5 (ix),a
                           1942 ;src/CalcColision.h:10: u8 eopX = eX + tilewidth;
   500B DD 5E 06      [19] 1943 	ld	e,6 (ix)
   500E 1C            [ 4] 1944 	inc	e
   500F 1C            [ 4] 1945 	inc	e
   5010 1C            [ 4] 1946 	inc	e
   5011 1C            [ 4] 1947 	inc	e
                           1948 ;src/CalcColision.h:11: u8 eopY = eY + tileheight;
   5012 DD 7E 07      [19] 1949 	ld	a,7 (ix)
   5015 C6 10         [ 7] 1950 	add	a, #0x10
   5017 DD 77 FA      [19] 1951 	ld	-6 (ix),a
                           1952 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   501A 7B            [ 4] 1953 	ld	a,e
   501B DD 96 04      [19] 1954 	sub	a, 4 (ix)
   501E 3E 00         [ 7] 1955 	ld	a,#0x00
   5020 17            [ 4] 1956 	rla
   5021 DD 77 FF      [19] 1957 	ld	-1 (ix),a
   5024 7D            [ 4] 1958 	ld	a,l
   5025 93            [ 4] 1959 	sub	a, e
   5026 3E 00         [ 7] 1960 	ld	a,#0x00
   5028 17            [ 4] 1961 	rla
   5029 DD 77 FE      [19] 1962 	ld	-2 (ix),a
   502C DD 7E 07      [19] 1963 	ld	a,7 (ix)
   502F DD 96 05      [19] 1964 	sub	a, 5 (ix)
   5032 3E 00         [ 7] 1965 	ld	a,#0x00
   5034 17            [ 4] 1966 	rla
   5035 5F            [ 4] 1967 	ld	e,a
   5036 DD 7E FB      [19] 1968 	ld	a,-5 (ix)
   5039 DD 96 07      [19] 1969 	sub	a, 7 (ix)
   503C 3E 00         [ 7] 1970 	ld	a,#0x00
   503E 17            [ 4] 1971 	rla
   503F 4F            [ 4] 1972 	ld	c,a
                           1973 ;src/CalcColision.h:14: if(atk >= 21)
   5040 DD 7E 08      [19] 1974 	ld	a,8 (ix)
   5043 D6 15         [ 7] 1975 	sub	a, #0x15
   5045 3E 00         [ 7] 1976 	ld	a,#0x00
   5047 17            [ 4] 1977 	rla
   5048 DD 77 FD      [19] 1978 	ld	-3 (ix),a
                           1979 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   504B DD 7E FF      [19] 1980 	ld	a,-1 (ix)
   504E B7            [ 4] 1981 	or	a, a
   504F 20 1C         [12] 1982 	jr	NZ,00105$
   5051 DD 7E FE      [19] 1983 	ld	a,-2 (ix)
   5054 B7            [ 4] 1984 	or	a,a
   5055 20 16         [12] 1985 	jr	NZ,00105$
   5057 B3            [ 4] 1986 	or	a,e
   5058 20 13         [12] 1987 	jr	NZ,00105$
   505A B1            [ 4] 1988 	or	a,c
   505B 20 10         [12] 1989 	jr	NZ,00105$
                           1990 ;src/CalcColision.h:14: if(atk >= 21)
   505D DD 7E FD      [19] 1991 	ld	a,-3 (ix)
   5060 B7            [ 4] 1992 	or	a, a
   5061 20 05         [12] 1993 	jr	NZ,00102$
                           1994 ;src/CalcColision.h:15: return 1;
   5063 2E 01         [ 7] 1995 	ld	l,#0x01
   5065 C3 F1 50      [10] 1996 	jp	00133$
   5068                    1997 00102$:
                           1998 ;src/CalcColision.h:17: return 2;
   5068 2E 02         [ 7] 1999 	ld	l,#0x02
   506A C3 F1 50      [10] 2000 	jp	00133$
   506D                    2001 00105$:
                           2002 ;src/CalcColision.h:19: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   506D DD 7E 06      [19] 2003 	ld	a,6 (ix)
   5070 DD 96 04      [19] 2004 	sub	a, 4 (ix)
   5073 3E 00         [ 7] 2005 	ld	a,#0x00
   5075 17            [ 4] 2006 	rla
   5076 DD 77 FC      [19] 2007 	ld	-4 (ix),a
   5079 7D            [ 4] 2008 	ld	a,l
   507A DD 96 06      [19] 2009 	sub	a, 6 (ix)
   507D 3E 00         [ 7] 2010 	ld	a,#0x00
   507F 17            [ 4] 2011 	rla
   5080 6F            [ 4] 2012 	ld	l,a
   5081 DD 7E FC      [19] 2013 	ld	a,-4 (ix)
   5084 B7            [ 4] 2014 	or	a,a
   5085 20 17         [12] 2015 	jr	NZ,00113$
   5087 B5            [ 4] 2016 	or	a,l
   5088 20 14         [12] 2017 	jr	NZ,00113$
   508A B3            [ 4] 2018 	or	a,e
   508B 20 11         [12] 2019 	jr	NZ,00113$
   508D B1            [ 4] 2020 	or	a,c
   508E 20 0E         [12] 2021 	jr	NZ,00113$
                           2022 ;src/CalcColision.h:20: if(atk >= 21)
   5090 DD 7E FD      [19] 2023 	ld	a,-3 (ix)
   5093 B7            [ 4] 2024 	or	a, a
   5094 20 04         [12] 2025 	jr	NZ,00110$
                           2026 ;src/CalcColision.h:21: return 1;
   5096 2E 01         [ 7] 2027 	ld	l,#0x01
   5098 18 57         [12] 2028 	jr	00133$
   509A                    2029 00110$:
                           2030 ;src/CalcColision.h:23: return 2;
   509A 2E 02         [ 7] 2031 	ld	l,#0x02
   509C 18 53         [12] 2032 	jr	00133$
   509E                    2033 00113$:
                           2034 ;src/CalcColision.h:25: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   509E DD 7E FA      [19] 2035 	ld	a,-6 (ix)
   50A1 DD 96 05      [19] 2036 	sub	a, 5 (ix)
   50A4 3E 00         [ 7] 2037 	ld	a,#0x00
   50A6 17            [ 4] 2038 	rla
   50A7 5F            [ 4] 2039 	ld	e,a
   50A8 DD 7E FB      [19] 2040 	ld	a,-5 (ix)
   50AB DD 96 FA      [19] 2041 	sub	a, -6 (ix)
   50AE 3E 00         [ 7] 2042 	ld	a,#0x00
   50B0 17            [ 4] 2043 	rla
   50B1 67            [ 4] 2044 	ld	h,a
   50B2 DD 7E FC      [19] 2045 	ld	a,-4 (ix)
   50B5 B7            [ 4] 2046 	or	a,a
   50B6 20 17         [12] 2047 	jr	NZ,00121$
   50B8 B5            [ 4] 2048 	or	a,l
   50B9 20 14         [12] 2049 	jr	NZ,00121$
   50BB B3            [ 4] 2050 	or	a,e
   50BC 20 11         [12] 2051 	jr	NZ,00121$
   50BE B4            [ 4] 2052 	or	a,h
   50BF 20 0E         [12] 2053 	jr	NZ,00121$
                           2054 ;src/CalcColision.h:26: if(atk >= 21)
   50C1 DD 7E FD      [19] 2055 	ld	a,-3 (ix)
   50C4 B7            [ 4] 2056 	or	a, a
   50C5 20 04         [12] 2057 	jr	NZ,00118$
                           2058 ;src/CalcColision.h:27: return 1;
   50C7 2E 01         [ 7] 2059 	ld	l,#0x01
   50C9 18 26         [12] 2060 	jr	00133$
   50CB                    2061 00118$:
                           2062 ;src/CalcColision.h:29: return 2;
   50CB 2E 02         [ 7] 2063 	ld	l,#0x02
   50CD 18 22         [12] 2064 	jr	00133$
   50CF                    2065 00121$:
                           2066 ;src/CalcColision.h:31: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   50CF DD 7E FF      [19] 2067 	ld	a,-1 (ix)
   50D2 B7            [ 4] 2068 	or	a, a
   50D3 20 1A         [12] 2069 	jr	NZ,00129$
   50D5 DD 7E FE      [19] 2070 	ld	a,-2 (ix)
   50D8 B7            [ 4] 2071 	or	a,a
   50D9 20 14         [12] 2072 	jr	NZ,00129$
   50DB B3            [ 4] 2073 	or	a,e
   50DC 20 11         [12] 2074 	jr	NZ,00129$
   50DE B4            [ 4] 2075 	or	a,h
   50DF 20 0E         [12] 2076 	jr	NZ,00129$
                           2077 ;src/CalcColision.h:32: if(atk >= 21)
   50E1 DD 7E FD      [19] 2078 	ld	a,-3 (ix)
   50E4 B7            [ 4] 2079 	or	a, a
   50E5 20 04         [12] 2080 	jr	NZ,00126$
                           2081 ;src/CalcColision.h:33: return 1;
   50E7 2E 01         [ 7] 2082 	ld	l,#0x01
   50E9 18 06         [12] 2083 	jr	00133$
   50EB                    2084 00126$:
                           2085 ;src/CalcColision.h:35: return 2;
   50EB 2E 02         [ 7] 2086 	ld	l,#0x02
   50ED 18 02         [12] 2087 	jr	00133$
   50EF                    2088 00129$:
                           2089 ;src/CalcColision.h:37: return 0;
   50EF 2E 00         [ 7] 2090 	ld	l,#0x00
   50F1                    2091 00133$:
   50F1 DD F9         [10] 2092 	ld	sp, ix
   50F3 DD E1         [14] 2093 	pop	ix
   50F5 C9            [10] 2094 	ret
                           2095 ;src/keyboard.h:13: u8* checkKeyboard(){
                           2096 ;	---------------------------------
                           2097 ; Function checkKeyboard
                           2098 ; ---------------------------------
   50F6                    2099 _checkKeyboard::
   50F6 DD E5         [15] 2100 	push	ix
   50F8 DD 21 00 00   [14] 2101 	ld	ix,#0
   50FC DD 39         [15] 2102 	add	ix,sp
   50FE 21 FA FF      [10] 2103 	ld	hl,#-6
   5101 39            [11] 2104 	add	hl,sp
   5102 F9            [ 6] 2105 	ld	sp,hl
                           2106 ;src/keyboard.h:14: u8 *s = NULL;
   5103 DD 36 FE 00   [19] 2107 	ld	-2 (ix),#0x00
   5107 DD 36 FF 00   [19] 2108 	ld	-1 (ix),#0x00
                           2109 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   510B 21 05 80      [10] 2110 	ld	hl,#0x8005
   510E CD 06 61      [17] 2111 	call	_cpct_isKeyPressed
   5111 7D            [ 4] 2112 	ld	a,l
   5112 B7            [ 4] 2113 	or	a, a
   5113 28 68         [12] 2114 	jr	Z,00147$
   5115 21 30 66      [10] 2115 	ld	hl, #(_player + 0x0008) + 0
   5118 7E            [ 7] 2116 	ld	a,(hl)
   5119 DD 77 FD      [19] 2117 	ld	-3 (ix), a
   511C D6 14         [ 7] 2118 	sub	a, #0x14
   511E 38 5D         [12] 2119 	jr	C,00147$
                           2120 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   5120 DD 7E FD      [19] 2121 	ld	a,-3 (ix)
   5123 D6 32         [ 7] 2122 	sub	a, #0x32
   5125 38 07         [12] 2123 	jr	C,00102$
   5127 21 30 66      [10] 2124 	ld	hl,#(_player + 0x0008)
   512A 36 00         [10] 2125 	ld	(hl),#0x00
   512C 18 08         [12] 2126 	jr	00103$
   512E                    2127 00102$:
                           2128 ;src/keyboard.h:17: else player.atk += 1;
   512E DD 7E FD      [19] 2129 	ld	a,-3 (ix)
   5131 3C            [ 4] 2130 	inc	a
   5132 21 30 66      [10] 2131 	ld	hl,#(_player + 0x0008)
   5135 77            [ 7] 2132 	ld	(hl),a
   5136                    2133 00103$:
                           2134 ;src/keyboard.h:18: switch(player.dir){
   5136 21 2F 66      [10] 2135 	ld	hl, #_player + 7
   5139 66            [ 7] 2136 	ld	h,(hl)
   513A 7C            [ 4] 2137 	ld	a,h
   513B D6 02         [ 7] 2138 	sub	a, #0x02
   513D 28 33         [12] 2139 	jr	Z,00107$
   513F 7C            [ 4] 2140 	ld	a,h
   5140 D6 04         [ 7] 2141 	sub	a, #0x04
   5142 28 0D         [12] 2142 	jr	Z,00104$
   5144 7C            [ 4] 2143 	ld	a,h
   5145 D6 06         [ 7] 2144 	sub	a, #0x06
   5147 28 13         [12] 2145 	jr	Z,00105$
   5149 7C            [ 4] 2146 	ld	a,h
   514A D6 08         [ 7] 2147 	sub	a, #0x08
   514C 28 19         [12] 2148 	jr	Z,00106$
   514E C3 44 53      [10] 2149 	jp	00148$
                           2150 ;src/keyboard.h:19: case 4:
   5151                    2151 00104$:
                           2152 ;src/keyboard.h:20: s = gladis_atk_izda;
   5151 DD 36 FE 80   [19] 2153 	ld	-2 (ix),#<(_gladis_atk_izda)
   5155 DD 36 FF 41   [19] 2154 	ld	-1 (ix),#>(_gladis_atk_izda)
                           2155 ;src/keyboard.h:21: break;
   5159 C3 44 53      [10] 2156 	jp	00148$
                           2157 ;src/keyboard.h:22: case 6:
   515C                    2158 00105$:
                           2159 ;src/keyboard.h:23: s = gladis_atk_dcha;
   515C DD 36 FE 00   [19] 2160 	ld	-2 (ix),#<(_gladis_atk_dcha)
   5160 DD 36 FF 41   [19] 2161 	ld	-1 (ix),#>(_gladis_atk_dcha)
                           2162 ;src/keyboard.h:24: break;
   5164 C3 44 53      [10] 2163 	jp	00148$
                           2164 ;src/keyboard.h:25: case 8:
   5167                    2165 00106$:
                           2166 ;src/keyboard.h:26: s = gladis_atk_arriba;
   5167 DD 36 FE 80   [19] 2167 	ld	-2 (ix),#<(_gladis_atk_arriba)
   516B DD 36 FF 43   [19] 2168 	ld	-1 (ix),#>(_gladis_atk_arriba)
                           2169 ;src/keyboard.h:27: break;
   516F C3 44 53      [10] 2170 	jp	00148$
                           2171 ;src/keyboard.h:28: case 2:
   5172                    2172 00107$:
                           2173 ;src/keyboard.h:29: s = gladis_atk_abajo;
   5172 DD 36 FE 00   [19] 2174 	ld	-2 (ix),#<(_gladis_atk_abajo)
   5176 DD 36 FF 43   [19] 2175 	ld	-1 (ix),#>(_gladis_atk_abajo)
                           2176 ;src/keyboard.h:31: }
   517A C3 44 53      [10] 2177 	jp	00148$
   517D                    2178 00147$:
                           2179 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   517D 21 30 66      [10] 2180 	ld	hl, #(_player + 0x0008) + 0
   5180 56            [ 7] 2181 	ld	d,(hl)
   5181 7A            [ 4] 2182 	ld	a,d
   5182 D6 14         [ 7] 2183 	sub	a, #0x14
   5184 30 07         [12] 2184 	jr	NC,00110$
   5186 14            [ 4] 2185 	inc	d
   5187 21 30 66      [10] 2186 	ld	hl,#(_player + 0x0008)
   518A 72            [ 7] 2187 	ld	(hl),d
   518B 18 05         [12] 2188 	jr	00111$
   518D                    2189 00110$:
                           2190 ;src/keyboard.h:34: else player.atk = 20;
   518D 21 30 66      [10] 2191 	ld	hl,#(_player + 0x0008)
   5190 36 14         [10] 2192 	ld	(hl),#0x14
   5192                    2193 00111$:
                           2194 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5192 21 00 02      [10] 2195 	ld	hl,#0x0200
   5195 CD 06 61      [17] 2196 	call	_cpct_isKeyPressed
                           2197 ;src/keyboard.h:37: player.dir = 6;
                           2198 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5198 7D            [ 4] 2199 	ld	a,l
   5199 B7            [ 4] 2200 	or	a, a
   519A 28 1E         [12] 2201 	jr	Z,00143$
   519C 21 28 66      [10] 2202 	ld	hl, #_player + 0
   519F 56            [ 7] 2203 	ld	d,(hl)
   51A0 7A            [ 4] 2204 	ld	a,d
   51A1 D6 4C         [ 7] 2205 	sub	a, #0x4C
   51A3 30 15         [12] 2206 	jr	NC,00143$
                           2207 ;src/keyboard.h:36: player.x += 1;
   51A5 14            [ 4] 2208 	inc	d
   51A6 21 28 66      [10] 2209 	ld	hl,#_player
   51A9 72            [ 7] 2210 	ld	(hl),d
                           2211 ;src/keyboard.h:37: player.dir = 6;
   51AA 21 2F 66      [10] 2212 	ld	hl,#(_player + 0x0007)
   51AD 36 06         [10] 2213 	ld	(hl),#0x06
                           2214 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   51AF DD 36 FE 00   [19] 2215 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   51B3 DD 36 FF 40   [19] 2216 	ld	-1 (ix),#>(_gladis_quieto_dcha)
   51B7 C3 44 53      [10] 2217 	jp	00148$
   51BA                    2218 00143$:
                           2219 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   51BA 21 01 01      [10] 2220 	ld	hl,#0x0101
   51BD CD 06 61      [17] 2221 	call	_cpct_isKeyPressed
   51C0 7D            [ 4] 2222 	ld	a,l
   51C1 B7            [ 4] 2223 	or	a, a
   51C2 28 1B         [12] 2224 	jr	Z,00139$
   51C4 3A 28 66      [13] 2225 	ld	a, (#_player + 0)
   51C7 B7            [ 4] 2226 	or	a, a
   51C8 28 15         [12] 2227 	jr	Z,00139$
                           2228 ;src/keyboard.h:40: player.x -= 1;
   51CA C6 FF         [ 7] 2229 	add	a,#0xFF
   51CC 32 28 66      [13] 2230 	ld	(#_player),a
                           2231 ;src/keyboard.h:41: player.dir = 4;
   51CF 21 2F 66      [10] 2232 	ld	hl,#(_player + 0x0007)
   51D2 36 04         [10] 2233 	ld	(hl),#0x04
                           2234 ;src/keyboard.h:42: s = gladis_quieto_izda;
   51D4 DD 36 FE 80   [19] 2235 	ld	-2 (ix),#<(_gladis_quieto_izda)
   51D8 DD 36 FF 40   [19] 2236 	ld	-1 (ix),#>(_gladis_quieto_izda)
   51DC C3 44 53      [10] 2237 	jp	00148$
   51DF                    2238 00139$:
                           2239 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   51DF 21 00 04      [10] 2240 	ld	hl,#0x0400
   51E2 CD 06 61      [17] 2241 	call	_cpct_isKeyPressed
   51E5 01 29 66      [10] 2242 	ld	bc,#_player + 1
   51E8 7D            [ 4] 2243 	ld	a,l
   51E9 B7            [ 4] 2244 	or	a, a
   51EA 28 1A         [12] 2245 	jr	Z,00135$
   51EC 0A            [ 7] 2246 	ld	a,(bc)
   51ED 67            [ 4] 2247 	ld	h,a
   51EE D6 B4         [ 7] 2248 	sub	a, #0xB4
   51F0 30 14         [12] 2249 	jr	NC,00135$
                           2250 ;src/keyboard.h:44: player.y += 2;
   51F2 7C            [ 4] 2251 	ld	a,h
   51F3 C6 02         [ 7] 2252 	add	a, #0x02
   51F5 02            [ 7] 2253 	ld	(bc),a
                           2254 ;src/keyboard.h:45: player.dir = 2;
   51F6 21 2F 66      [10] 2255 	ld	hl,#(_player + 0x0007)
   51F9 36 02         [10] 2256 	ld	(hl),#0x02
                           2257 ;src/keyboard.h:46: s = gladis_abajo;
   51FB DD 36 FE 80   [19] 2258 	ld	-2 (ix),#<(_gladis_abajo)
   51FF DD 36 FF 42   [19] 2259 	ld	-1 (ix),#>(_gladis_abajo)
   5203 C3 44 53      [10] 2260 	jp	00148$
   5206                    2261 00135$:
                           2262 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   5206 C5            [11] 2263 	push	bc
   5207 21 00 01      [10] 2264 	ld	hl,#0x0100
   520A CD 06 61      [17] 2265 	call	_cpct_isKeyPressed
   520D 7D            [ 4] 2266 	ld	a,l
   520E C1            [10] 2267 	pop	bc
   520F B7            [ 4] 2268 	or	a, a
   5210 28 17         [12] 2269 	jr	Z,00131$
   5212 0A            [ 7] 2270 	ld	a,(bc)
   5213 B7            [ 4] 2271 	or	a, a
   5214 28 13         [12] 2272 	jr	Z,00131$
                           2273 ;src/keyboard.h:48: player.y -= 2;
   5216 C6 FE         [ 7] 2274 	add	a,#0xFE
   5218 02            [ 7] 2275 	ld	(bc),a
                           2276 ;src/keyboard.h:49: player.dir = 8;
   5219 21 2F 66      [10] 2277 	ld	hl,#(_player + 0x0007)
   521C 36 08         [10] 2278 	ld	(hl),#0x08
                           2279 ;src/keyboard.h:50: s = gladis_arriba;
   521E DD 36 FE 00   [19] 2280 	ld	-2 (ix),#<(_gladis_arriba)
   5222 DD 36 FF 42   [19] 2281 	ld	-1 (ix),#>(_gladis_arriba)
   5226 C3 44 53      [10] 2282 	jp	00148$
   5229                    2283 00131$:
                           2284 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20 && player.bullets >0){
   5229 C5            [11] 2285 	push	bc
   522A 21 07 80      [10] 2286 	ld	hl,#0x8007
   522D CD 06 61      [17] 2287 	call	_cpct_isKeyPressed
   5230 7D            [ 4] 2288 	ld	a,l
   5231 C1            [10] 2289 	pop	bc
   5232 B7            [ 4] 2290 	or	a, a
   5233 CA 04 53      [10] 2291 	jp	Z,00125$
   5236 3A 1A 66      [13] 2292 	ld	a,(#_arrow + 0)
   5239 B7            [ 4] 2293 	or	a, a
   523A C2 04 53      [10] 2294 	jp	NZ,00125$
   523D 3A 30 66      [13] 2295 	ld	a, (#(_player + 0x0008) + 0)
   5240 D6 14         [ 7] 2296 	sub	a, #0x14
   5242 C2 04 53      [10] 2297 	jp	NZ,00125$
   5245 3A 32 66      [13] 2298 	ld	a, (#(_player + 0x000a) + 0)
   5248 B7            [ 4] 2299 	or	a, a
   5249 CA 04 53      [10] 2300 	jp	Z,00125$
                           2301 ;src/keyboard.h:52: if(player.bullets> 0){
   524C B7            [ 4] 2302 	or	a, a
   524D CA FD 52      [10] 2303 	jp	Z,00118$
                           2304 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   5250 DD 36 FB A2   [19] 2305 	ld	-5 (ix),#<(_flecha_dcha)
   5254 DD 36 FC 60   [19] 2306 	ld	-4 (ix),#>(_flecha_dcha)
   5258 DD 36 FA 02   [19] 2307 	ld	-6 (ix),#0x02
   525C 1E 08         [ 7] 2308 	ld	e,#0x08
                           2309 ;src/keyboard.h:54: switch(player.dir){
   525E 21 2F 66      [10] 2310 	ld	hl, #(_player + 0x0007) + 0
   5261 56            [ 7] 2311 	ld	d,(hl)
   5262 7A            [ 4] 2312 	ld	a,d
   5263 D6 02         [ 7] 2313 	sub	a, #0x02
   5265 28 31         [12] 2314 	jr	Z,00114$
   5267 7A            [ 4] 2315 	ld	a,d
   5268 D6 04         [ 7] 2316 	sub	a, #0x04
   526A 28 1C         [12] 2317 	jr	Z,00113$
   526C 7A            [ 4] 2318 	ld	a,d
   526D D6 06         [ 7] 2319 	sub	a, #0x06
   526F 28 07         [12] 2320 	jr	Z,00112$
   5271 7A            [ 4] 2321 	ld	a,d
   5272 D6 08         [ 7] 2322 	sub	a, #0x08
   5274 28 32         [12] 2323 	jr	Z,00115$
   5276 18 3E         [12] 2324 	jr	00116$
                           2325 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   5278                    2326 00112$:
   5278 DD 36 FB A2   [19] 2327 	ld	-5 (ix),#<(_flecha_dcha)
   527C DD 36 FC 60   [19] 2328 	ld	-4 (ix),#>(_flecha_dcha)
   5280 DD 36 FA 04   [19] 2329 	ld	-6 (ix),#0x04
   5284 1E 04         [ 7] 2330 	ld	e,#0x04
   5286 18 2E         [12] 2331 	jr	00116$
                           2332 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   5288                    2333 00113$:
   5288 DD 36 FB C2   [19] 2334 	ld	-5 (ix),#<(_flecha_izda)
   528C DD 36 FC 60   [19] 2335 	ld	-4 (ix),#>(_flecha_izda)
   5290 DD 36 FA 04   [19] 2336 	ld	-6 (ix),#0x04
   5294 1E 04         [ 7] 2337 	ld	e,#0x04
   5296 18 1E         [12] 2338 	jr	00116$
                           2339 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   5298                    2340 00114$:
   5298 DD 36 FB 82   [19] 2341 	ld	-5 (ix),#<(_flecha_abajo)
   529C DD 36 FC 60   [19] 2342 	ld	-4 (ix),#>(_flecha_abajo)
   52A0 DD 36 FA 02   [19] 2343 	ld	-6 (ix),#0x02
   52A4 1E 08         [ 7] 2344 	ld	e,#0x08
   52A6 18 0E         [12] 2345 	jr	00116$
                           2346 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   52A8                    2347 00115$:
   52A8 DD 36 FB 62   [19] 2348 	ld	-5 (ix),#<(_flecha_arriba)
   52AC DD 36 FC 60   [19] 2349 	ld	-4 (ix),#>(_flecha_arriba)
   52B0 DD 36 FA 02   [19] 2350 	ld	-6 (ix),#0x02
   52B4 1E 08         [ 7] 2351 	ld	e,#0x08
                           2352 ;src/keyboard.h:59: }
   52B6                    2353 00116$:
                           2354 ;src/keyboard.h:60: player.atk = 0;
   52B6 21 30 66      [10] 2355 	ld	hl,#(_player + 0x0008)
   52B9 36 00         [10] 2356 	ld	(hl),#0x00
                           2357 ;src/keyboard.h:61: object.x = player.x;
   52BB 3A 28 66      [13] 2358 	ld	a, (#_player + 0)
   52BE 32 1E 66      [13] 2359 	ld	(#_object),a
                           2360 ;src/keyboard.h:62: object.y = player.y+8;
   52C1 0A            [ 7] 2361 	ld	a,(bc)
   52C2 C6 08         [ 7] 2362 	add	a, #0x08
   52C4 32 1F 66      [13] 2363 	ld	(#(_object + 0x0001)),a
                           2364 ;src/keyboard.h:63: object.x = object.x;
   52C7 21 1E 66      [10] 2365 	ld	hl, #_object + 0
   52CA 56            [ 7] 2366 	ld	d,(hl)
   52CB 21 1E 66      [10] 2367 	ld	hl,#_object
   52CE 72            [ 7] 2368 	ld	(hl),d
                           2369 ;src/keyboard.h:64: object.y = object.y;
   52CF 32 1F 66      [13] 2370 	ld	(#(_object + 0x0001)),a
                           2371 ;src/keyboard.h:65: object.sprite = spr;
   52D2 21 22 66      [10] 2372 	ld	hl,#_object + 4
   52D5 DD 7E FB      [19] 2373 	ld	a,-5 (ix)
   52D8 77            [ 7] 2374 	ld	(hl),a
   52D9 23            [ 6] 2375 	inc	hl
   52DA DD 7E FC      [19] 2376 	ld	a,-4 (ix)
   52DD 77            [ 7] 2377 	ld	(hl),a
                           2378 ;src/keyboard.h:66: object.vivo = 1;
   52DE 21 24 66      [10] 2379 	ld	hl,#_object + 6
   52E1 36 01         [10] 2380 	ld	(hl),#0x01
                           2381 ;src/keyboard.h:67: object.dir = player.dir;
   52E3 01 25 66      [10] 2382 	ld	bc,#_object + 7
   52E6 3A 2F 66      [13] 2383 	ld	a, (#(_player + 0x0007) + 0)
   52E9 02            [ 7] 2384 	ld	(bc),a
                           2385 ;src/keyboard.h:68: object.sizeX = xs;
   52EA 21 26 66      [10] 2386 	ld	hl,#_object + 8
   52ED DD 7E FA      [19] 2387 	ld	a,-6 (ix)
   52F0 77            [ 7] 2388 	ld	(hl),a
                           2389 ;src/keyboard.h:69: object.sizeY = ys;
   52F1 21 27 66      [10] 2390 	ld	hl,#_object + 9
   52F4 73            [ 7] 2391 	ld	(hl),e
                           2392 ;src/keyboard.h:70: player.bullets--;
   52F5 3A 32 66      [13] 2393 	ld	a, (#(_player + 0x000a) + 0)
   52F8 C6 FF         [ 7] 2394 	add	a,#0xFF
   52FA 32 32 66      [13] 2395 	ld	(#(_player + 0x000a)),a
   52FD                    2396 00118$:
                           2397 ;src/keyboard.h:72: arrow=1;
   52FD 21 1A 66      [10] 2398 	ld	hl,#_arrow + 0
   5300 36 01         [10] 2399 	ld	(hl), #0x01
   5302 18 40         [12] 2400 	jr	00148$
   5304                    2401 00125$:
                           2402 ;src/keyboard.h:74: switch(player.dir){
   5304 21 2F 66      [10] 2403 	ld	hl, #(_player + 0x0007) + 0
   5307 66            [ 7] 2404 	ld	h,(hl)
   5308 7C            [ 4] 2405 	ld	a,h
   5309 D6 02         [ 7] 2406 	sub	a, #0x02
   530B 28 2F         [12] 2407 	jr	Z,00122$
   530D 7C            [ 4] 2408 	ld	a,h
   530E D6 04         [ 7] 2409 	sub	a, #0x04
   5310 28 0C         [12] 2410 	jr	Z,00119$
   5312 7C            [ 4] 2411 	ld	a,h
   5313 D6 06         [ 7] 2412 	sub	a, #0x06
   5315 28 11         [12] 2413 	jr	Z,00120$
   5317 7C            [ 4] 2414 	ld	a,h
   5318 D6 08         [ 7] 2415 	sub	a, #0x08
   531A 28 16         [12] 2416 	jr	Z,00121$
   531C 18 26         [12] 2417 	jr	00148$
                           2418 ;src/keyboard.h:75: case 4:
   531E                    2419 00119$:
                           2420 ;src/keyboard.h:76: s = gladis_quieto_izda;
   531E DD 36 FE 80   [19] 2421 	ld	-2 (ix),#<(_gladis_quieto_izda)
   5322 DD 36 FF 40   [19] 2422 	ld	-1 (ix),#>(_gladis_quieto_izda)
                           2423 ;src/keyboard.h:77: break;
   5326 18 1C         [12] 2424 	jr	00148$
                           2425 ;src/keyboard.h:78: case 6:
   5328                    2426 00120$:
                           2427 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   5328 DD 36 FE 00   [19] 2428 	ld	-2 (ix),#<(_gladis_quieto_dcha)
   532C DD 36 FF 40   [19] 2429 	ld	-1 (ix),#>(_gladis_quieto_dcha)
                           2430 ;src/keyboard.h:80: break;
   5330 18 12         [12] 2431 	jr	00148$
                           2432 ;src/keyboard.h:81: case 8:
   5332                    2433 00121$:
                           2434 ;src/keyboard.h:82: s = gladis_arriba;
   5332 DD 36 FE 00   [19] 2435 	ld	-2 (ix),#<(_gladis_arriba)
   5336 DD 36 FF 42   [19] 2436 	ld	-1 (ix),#>(_gladis_arriba)
                           2437 ;src/keyboard.h:83: break;
   533A 18 08         [12] 2438 	jr	00148$
                           2439 ;src/keyboard.h:84: case 2:
   533C                    2440 00122$:
                           2441 ;src/keyboard.h:85: s = gladis_abajo;
   533C DD 36 FE 80   [19] 2442 	ld	-2 (ix),#<(_gladis_abajo)
   5340 DD 36 FF 42   [19] 2443 	ld	-1 (ix),#>(_gladis_abajo)
                           2444 ;src/keyboard.h:87: }
   5344                    2445 00148$:
                           2446 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   5344 21 04 10      [10] 2447 	ld	hl,#0x1004
   5347 CD 06 61      [17] 2448 	call	_cpct_isKeyPressed
   534A 7D            [ 4] 2449 	ld	a,l
   534B B7            [ 4] 2450 	or	a, a
   534C 28 05         [12] 2451 	jr	Z,00151$
                           2452 ;src/keyboard.h:94: arrow = 0;
   534E 21 1A 66      [10] 2453 	ld	hl,#_arrow + 0
   5351 36 00         [10] 2454 	ld	(hl), #0x00
   5353                    2455 00151$:
                           2456 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   5353 21 08 04      [10] 2457 	ld	hl,#0x0408
   5356 CD 06 61      [17] 2458 	call	_cpct_isKeyPressed
   5359 7D            [ 4] 2459 	ld	a,l
   535A B7            [ 4] 2460 	or	a, a
   535B 28 05         [12] 2461 	jr	Z,00153$
                           2462 ;src/keyboard.h:97: finish = 1;
   535D 21 19 66      [10] 2463 	ld	hl,#_finish + 0
   5360 36 01         [10] 2464 	ld	(hl), #0x01
   5362                    2465 00153$:
                           2466 ;src/keyboard.h:99: return s;
   5362 DD 6E FE      [19] 2467 	ld	l,-2 (ix)
   5365 DD 66 FF      [19] 2468 	ld	h,-1 (ix)
   5368 DD F9         [10] 2469 	ld	sp, ix
   536A DD E1         [14] 2470 	pop	ix
   536C C9            [10] 2471 	ret
                           2472 ;src/keyboard.h:102: void moveObject(){
                           2473 ;	---------------------------------
                           2474 ; Function moveObject
                           2475 ; ---------------------------------
   536D                    2476 _moveObject::
                           2477 ;src/keyboard.h:103: object.lx = object.x;
   536D 01 1E 66      [10] 2478 	ld	bc,#_object+0
   5370 0A            [ 7] 2479 	ld	a,(bc)
   5371 32 20 66      [13] 2480 	ld	(#(_object + 0x0002)),a
                           2481 ;src/keyboard.h:104: object.ly = object.y;
   5374 59            [ 4] 2482 	ld	e, c
   5375 50            [ 4] 2483 	ld	d, b
   5376 13            [ 6] 2484 	inc	de
   5377 1A            [ 7] 2485 	ld	a,(de)
   5378 32 21 66      [13] 2486 	ld	(#(_object + 0x0003)),a
                           2487 ;src/keyboard.h:105: switch(object.dir){
   537B 3A 25 66      [13] 2488 	ld	a,(#_object + 7)
   537E FE 02         [ 7] 2489 	cp	a,#0x02
   5380 28 16         [12] 2490 	jr	Z,00103$
   5382 FE 04         [ 7] 2491 	cp	a,#0x04
   5384 28 0D         [12] 2492 	jr	Z,00102$
   5386 FE 06         [ 7] 2493 	cp	a,#0x06
   5388 28 05         [12] 2494 	jr	Z,00101$
   538A D6 08         [ 7] 2495 	sub	a, #0x08
   538C 28 0F         [12] 2496 	jr	Z,00104$
   538E C9            [10] 2497 	ret
                           2498 ;src/keyboard.h:106: case 6: object.x += 1; break;
   538F                    2499 00101$:
   538F 0A            [ 7] 2500 	ld	a,(bc)
   5390 3C            [ 4] 2501 	inc	a
   5391 02            [ 7] 2502 	ld	(bc),a
   5392 C9            [10] 2503 	ret
                           2504 ;src/keyboard.h:107: case 4: object.x -= 1; break;
   5393                    2505 00102$:
   5393 0A            [ 7] 2506 	ld	a,(bc)
   5394 C6 FF         [ 7] 2507 	add	a,#0xFF
   5396 02            [ 7] 2508 	ld	(bc),a
   5397 C9            [10] 2509 	ret
                           2510 ;src/keyboard.h:108: case 2: object.y += 2; break;
   5398                    2511 00103$:
   5398 1A            [ 7] 2512 	ld	a,(de)
   5399 C6 02         [ 7] 2513 	add	a, #0x02
   539B 12            [ 7] 2514 	ld	(de),a
   539C C9            [10] 2515 	ret
                           2516 ;src/keyboard.h:109: case 8: object.y -= 2; break;
   539D                    2517 00104$:
   539D 1A            [ 7] 2518 	ld	a,(de)
   539E C6 FE         [ 7] 2519 	add	a,#0xFE
   53A0 12            [ 7] 2520 	ld	(de),a
                           2521 ;src/keyboard.h:110: }
   53A1 C9            [10] 2522 	ret
                           2523 ;src/main.c:36: void init(){
                           2524 ;	---------------------------------
                           2525 ; Function init
                           2526 ; ---------------------------------
   53A2                    2527 _init::
                           2528 ;src/main.c:37: cpct_disableFirmware();
   53A2 CD 4D 63      [17] 2529 	call	_cpct_disableFirmware
                           2530 ;src/main.c:38: cpct_setVideoMode(0);
   53A5 AF            [ 4] 2531 	xor	a, a
   53A6 F5            [11] 2532 	push	af
   53A7 33            [ 6] 2533 	inc	sp
   53A8 CD 2A 63      [17] 2534 	call	_cpct_setVideoMode
   53AB 33            [ 6] 2535 	inc	sp
                           2536 ;src/main.c:39: cpct_fw2hw(g_palette,4);
   53AC 11 D9 48      [10] 2537 	ld	de,#_g_palette
   53AF 3E 04         [ 7] 2538 	ld	a,#0x04
   53B1 F5            [11] 2539 	push	af
   53B2 33            [ 6] 2540 	inc	sp
   53B3 D5            [11] 2541 	push	de
   53B4 CD B4 62      [17] 2542 	call	_cpct_fw2hw
   53B7 F1            [10] 2543 	pop	af
   53B8 33            [ 6] 2544 	inc	sp
                           2545 ;src/main.c:40: cpct_setPalette(g_palette,4);
   53B9 11 D9 48      [10] 2546 	ld	de,#_g_palette
   53BC 3E 04         [ 7] 2547 	ld	a,#0x04
   53BE F5            [11] 2548 	push	af
   53BF 33            [ 6] 2549 	inc	sp
   53C0 D5            [11] 2550 	push	de
   53C1 CD E2 60      [17] 2551 	call	_cpct_setPalette
   53C4 F1            [10] 2552 	pop	af
   53C5 33            [ 6] 2553 	inc	sp
   53C6 C9            [10] 2554 	ret
                           2555 ;src/main.c:43: void initPlayer(){
                           2556 ;	---------------------------------
                           2557 ; Function initPlayer
                           2558 ; ---------------------------------
   53C7                    2559 _initPlayer::
                           2560 ;src/main.c:44: u8 *sprite = gladis_quieto_dcha;
                           2561 ;src/main.c:45: player.x = origins[0][0];
   53C7 01 DE 48      [10] 2562 	ld	bc,#_origins+0
   53CA 0A            [ 7] 2563 	ld	a,(bc)
   53CB 32 28 66      [13] 2564 	ld	(#_player),a
                           2565 ;src/main.c:46: player.y = origins[0][1];
   53CE 59            [ 4] 2566 	ld	e, c
   53CF 50            [ 4] 2567 	ld	d, b
   53D0 13            [ 6] 2568 	inc	de
   53D1 1A            [ 7] 2569 	ld	a,(de)
   53D2 32 29 66      [13] 2570 	ld	(#(_player + 0x0001)),a
                           2571 ;src/main.c:47: player.lx = origins[0][0];
   53D5 0A            [ 7] 2572 	ld	a,(bc)
   53D6 32 2A 66      [13] 2573 	ld	(#(_player + 0x0002)),a
                           2574 ;src/main.c:48: player.ly = origins[0][1];
   53D9 1A            [ 7] 2575 	ld	a,(de)
   53DA 32 2B 66      [13] 2576 	ld	(#(_player + 0x0003)),a
                           2577 ;src/main.c:49: player.sprite = sprite;
   53DD 21 00 40      [10] 2578 	ld	hl,#_gladis_quieto_dcha
   53E0 22 2C 66      [16] 2579 	ld	((_player + 0x0004)), hl
                           2580 ;src/main.c:50: player.life = 3;
   53E3 21 2E 66      [10] 2581 	ld	hl,#_player + 6
   53E6 36 03         [10] 2582 	ld	(hl),#0x03
                           2583 ;src/main.c:51: player.dir = 6;
   53E8 21 2F 66      [10] 2584 	ld	hl,#_player + 7
   53EB 36 06         [10] 2585 	ld	(hl),#0x06
                           2586 ;src/main.c:52: player.atk = 20;
   53ED 21 30 66      [10] 2587 	ld	hl,#_player + 8
   53F0 36 14         [10] 2588 	ld	(hl),#0x14
                           2589 ;src/main.c:53: player.latk = 20;
   53F2 21 31 66      [10] 2590 	ld	hl,#_player + 9
   53F5 36 14         [10] 2591 	ld	(hl),#0x14
                           2592 ;src/main.c:54: player.bullets = 3;
   53F7 21 32 66      [10] 2593 	ld	hl,#_player + 10
   53FA 36 03         [10] 2594 	ld	(hl),#0x03
   53FC C9            [10] 2595 	ret
                           2596 ;src/main.c:57: void initEnemies(){
                           2597 ;	---------------------------------
                           2598 ; Function initEnemies
                           2599 ; ---------------------------------
   53FD                    2600 _initEnemies::
                           2601 ;src/main.c:58: u8 *sprite = chacho_dcha;
                           2602 ;src/main.c:59: enemy.x = origins[1][0];
   53FD 01 E0 48      [10] 2603 	ld	bc,#_origins + 2
   5400 0A            [ 7] 2604 	ld	a,(bc)
   5401 32 33 66      [13] 2605 	ld	(#_enemy),a
                           2606 ;src/main.c:60: enemy.y = origins[1][1];
   5404 11 E1 48      [10] 2607 	ld	de,#_origins + 3
   5407 1A            [ 7] 2608 	ld	a,(de)
   5408 32 34 66      [13] 2609 	ld	(#(_enemy + 0x0001)),a
                           2610 ;src/main.c:61: enemy.lx = origins[1][0];
   540B 0A            [ 7] 2611 	ld	a,(bc)
   540C 32 35 66      [13] 2612 	ld	(#(_enemy + 0x0002)),a
                           2613 ;src/main.c:62: enemy.ly = origins[1][1];
   540F 1A            [ 7] 2614 	ld	a,(de)
   5410 32 36 66      [13] 2615 	ld	(#(_enemy + 0x0003)),a
                           2616 ;src/main.c:63: enemy.ox = origins[1][0];
   5413 0A            [ 7] 2617 	ld	a,(bc)
   5414 32 37 66      [13] 2618 	ld	(#(_enemy + 0x0004)),a
                           2619 ;src/main.c:64: enemy.oy = origins[1][1];
   5417 1A            [ 7] 2620 	ld	a,(de)
   5418 32 38 66      [13] 2621 	ld	(#(_enemy + 0x0005)),a
                           2622 ;src/main.c:65: enemy.sprite = sprite;
   541B 21 00 44      [10] 2623 	ld	hl,#_chacho_dcha
   541E 22 39 66      [16] 2624 	ld	((_enemy + 0x0006)), hl
                           2625 ;src/main.c:66: enemy.life = 3;
   5421 21 3B 66      [10] 2626 	ld	hl,#_enemy + 8
   5424 36 03         [10] 2627 	ld	(hl),#0x03
                           2628 ;src/main.c:67: enemy.dir = 6;
   5426 21 3C 66      [10] 2629 	ld	hl,#_enemy + 9
   5429 36 06         [10] 2630 	ld	(hl),#0x06
                           2631 ;src/main.c:68: enemy.bullets = 3;
   542B 21 3D 66      [10] 2632 	ld	hl,#_enemy + 10
   542E 36 03         [10] 2633 	ld	(hl),#0x03
                           2634 ;src/main.c:69: enemy.room = 3;
   5430 21 3E 66      [10] 2635 	ld	hl,#_enemy + 11
   5433 36 03         [10] 2636 	ld	(hl),#0x03
   5435 C9            [10] 2637 	ret
                           2638 ;src/main.c:74: void gameOver(){
                           2639 ;	---------------------------------
                           2640 ; Function gameOver
                           2641 ; ---------------------------------
   5436                    2642 _gameOver::
                           2643 ;src/main.c:76: cpct_clearScreen(0);
   5436 21 00 40      [10] 2644 	ld	hl,#0x4000
   5439 E5            [11] 2645 	push	hl
   543A AF            [ 4] 2646 	xor	a, a
   543B F5            [11] 2647 	push	af
   543C 33            [ 6] 2648 	inc	sp
   543D 26 C0         [ 7] 2649 	ld	h, #0xC0
   543F E5            [11] 2650 	push	hl
   5440 CD 3C 63      [17] 2651 	call	_cpct_memset
                           2652 ;src/main.c:77: memptr = cpct_getScreenPtr(VMEM,10,10);
   5443 21 0A 0A      [10] 2653 	ld	hl,#0x0A0A
   5446 E5            [11] 2654 	push	hl
   5447 21 00 C0      [10] 2655 	ld	hl,#0xC000
   544A E5            [11] 2656 	push	hl
   544B CD 2F 64      [17] 2657 	call	_cpct_getScreenPtr
                           2658 ;src/main.c:78: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   544E 4D            [ 4] 2659 	ld	c, l
   544F 44            [ 4] 2660 	ld	b, h
   5450 11 62 54      [10] 2661 	ld	de,#___str_0
   5453 21 01 00      [10] 2662 	ld	hl,#0x0001
   5456 E5            [11] 2663 	push	hl
   5457 C5            [11] 2664 	push	bc
   5458 D5            [11] 2665 	push	de
   5459 CD F3 61      [17] 2666 	call	_cpct_drawStringM0
   545C 21 06 00      [10] 2667 	ld	hl,#6
   545F 39            [11] 2668 	add	hl,sp
   5460 F9            [ 6] 2669 	ld	sp,hl
   5461 C9            [10] 2670 	ret
   5462                    2671 ___str_0:
   5462 4C 6F 75 6E 67 65  2672 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5472 00                 2673 	.db 0x00
                           2674 ;src/main.c:83: int menu(){
                           2675 ;	---------------------------------
                           2676 ; Function menu
                           2677 ; ---------------------------------
   5473                    2678 _menu::
   5473 DD E5         [15] 2679 	push	ix
   5475 DD 21 00 00   [14] 2680 	ld	ix,#0
   5479 DD 39         [15] 2681 	add	ix,sp
   547B 21 FA FF      [10] 2682 	ld	hl,#-6
   547E 39            [11] 2683 	add	hl,sp
   547F F9            [ 6] 2684 	ld	sp,hl
                           2685 ;src/main.c:85: int init = 50;
   5480 DD 36 FC 32   [19] 2686 	ld	-4 (ix),#0x32
   5484 DD 36 FD 00   [19] 2687 	ld	-3 (ix),#0x00
                           2688 ;src/main.c:86: int pushed =0;
   5488 21 00 00      [10] 2689 	ld	hl,#0x0000
   548B E3            [19] 2690 	ex	(sp), hl
                           2691 ;src/main.c:87: int cont =0;
   548C 11 00 00      [10] 2692 	ld	de,#0x0000
                           2693 ;src/main.c:88: cpct_clearScreen(0);
   548F D5            [11] 2694 	push	de
   5490 21 00 40      [10] 2695 	ld	hl,#0x4000
   5493 E5            [11] 2696 	push	hl
   5494 AF            [ 4] 2697 	xor	a, a
   5495 F5            [11] 2698 	push	af
   5496 33            [ 6] 2699 	inc	sp
   5497 26 C0         [ 7] 2700 	ld	h, #0xC0
   5499 E5            [11] 2701 	push	hl
   549A CD 3C 63      [17] 2702 	call	_cpct_memset
   549D 21 0A 0A      [10] 2703 	ld	hl,#0x0A0A
   54A0 E5            [11] 2704 	push	hl
   54A1 21 00 C0      [10] 2705 	ld	hl,#0xC000
   54A4 E5            [11] 2706 	push	hl
   54A5 CD 2F 64      [17] 2707 	call	_cpct_getScreenPtr
   54A8 D1            [10] 2708 	pop	de
                           2709 ;src/main.c:91: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   54A9 4D            [ 4] 2710 	ld	c, l
   54AA 44            [ 4] 2711 	ld	b, h
   54AB D5            [11] 2712 	push	de
   54AC 21 01 00      [10] 2713 	ld	hl,#0x0001
   54AF E5            [11] 2714 	push	hl
   54B0 C5            [11] 2715 	push	bc
   54B1 21 56 56      [10] 2716 	ld	hl,#___str_1
   54B4 E5            [11] 2717 	push	hl
   54B5 CD F3 61      [17] 2718 	call	_cpct_drawStringM0
   54B8 21 06 00      [10] 2719 	ld	hl,#6
   54BB 39            [11] 2720 	add	hl,sp
   54BC F9            [ 6] 2721 	ld	sp,hl
   54BD 21 14 32      [10] 2722 	ld	hl,#0x3214
   54C0 E5            [11] 2723 	push	hl
   54C1 21 00 C0      [10] 2724 	ld	hl,#0xC000
   54C4 E5            [11] 2725 	push	hl
   54C5 CD 2F 64      [17] 2726 	call	_cpct_getScreenPtr
   54C8 D1            [10] 2727 	pop	de
                           2728 ;src/main.c:95: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   54C9 4D            [ 4] 2729 	ld	c, l
   54CA 44            [ 4] 2730 	ld	b, h
   54CB D5            [11] 2731 	push	de
   54CC 21 01 00      [10] 2732 	ld	hl,#0x0001
   54CF E5            [11] 2733 	push	hl
   54D0 C5            [11] 2734 	push	bc
   54D1 21 67 56      [10] 2735 	ld	hl,#___str_2
   54D4 E5            [11] 2736 	push	hl
   54D5 CD F3 61      [17] 2737 	call	_cpct_drawStringM0
   54D8 21 06 00      [10] 2738 	ld	hl,#6
   54DB 39            [11] 2739 	add	hl,sp
   54DC F9            [ 6] 2740 	ld	sp,hl
   54DD 21 14 46      [10] 2741 	ld	hl,#0x4614
   54E0 E5            [11] 2742 	push	hl
   54E1 21 00 C0      [10] 2743 	ld	hl,#0xC000
   54E4 E5            [11] 2744 	push	hl
   54E5 CD 2F 64      [17] 2745 	call	_cpct_getScreenPtr
   54E8 D1            [10] 2746 	pop	de
                           2747 ;src/main.c:98: cpct_drawStringM0("Creditos",memptr,1,0);
   54E9 4D            [ 4] 2748 	ld	c, l
   54EA 44            [ 4] 2749 	ld	b, h
   54EB D5            [11] 2750 	push	de
   54EC 21 01 00      [10] 2751 	ld	hl,#0x0001
   54EF E5            [11] 2752 	push	hl
   54F0 C5            [11] 2753 	push	bc
   54F1 21 75 56      [10] 2754 	ld	hl,#___str_3
   54F4 E5            [11] 2755 	push	hl
   54F5 CD F3 61      [17] 2756 	call	_cpct_drawStringM0
   54F8 21 06 00      [10] 2757 	ld	hl,#6
   54FB 39            [11] 2758 	add	hl,sp
   54FC F9            [ 6] 2759 	ld	sp,hl
   54FD 21 14 5A      [10] 2760 	ld	hl,#0x5A14
   5500 E5            [11] 2761 	push	hl
   5501 21 00 C0      [10] 2762 	ld	hl,#0xC000
   5504 E5            [11] 2763 	push	hl
   5505 CD 2F 64      [17] 2764 	call	_cpct_getScreenPtr
   5508 D1            [10] 2765 	pop	de
                           2766 ;src/main.c:91: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5509 DD 75 FE      [19] 2767 	ld	-2 (ix),l
   550C DD 74 FF      [19] 2768 	ld	-1 (ix),h
                           2769 ;src/main.c:101: cpct_drawStringM0("Salir",memptr,1,0);
   550F 01 7E 56      [10] 2770 	ld	bc,#___str_4
   5512 D5            [11] 2771 	push	de
   5513 21 01 00      [10] 2772 	ld	hl,#0x0001
   5516 E5            [11] 2773 	push	hl
   5517 DD 6E FE      [19] 2774 	ld	l,-2 (ix)
   551A DD 66 FF      [19] 2775 	ld	h,-1 (ix)
   551D E5            [11] 2776 	push	hl
   551E C5            [11] 2777 	push	bc
   551F CD F3 61      [17] 2778 	call	_cpct_drawStringM0
   5522 21 06 00      [10] 2779 	ld	hl,#6
   5525 39            [11] 2780 	add	hl,sp
   5526 F9            [ 6] 2781 	ld	sp,hl
   5527 D1            [10] 2782 	pop	de
                           2783 ;src/main.c:107: while(1){
   5528                    2784 00118$:
                           2785 ;src/main.c:109: cpct_scanKeyboard();
   5528 D5            [11] 2786 	push	de
   5529 CD 4F 64      [17] 2787 	call	_cpct_scanKeyboard
   552C 21 00 04      [10] 2788 	ld	hl,#0x0400
   552F CD 06 61      [17] 2789 	call	_cpct_isKeyPressed
   5532 7D            [ 4] 2790 	ld	a,l
   5533 D1            [10] 2791 	pop	de
   5534 B7            [ 4] 2792 	or	a, a
   5535 28 2D         [12] 2793 	jr	Z,00102$
   5537 3E 96         [ 7] 2794 	ld	a,#0x96
   5539 BB            [ 4] 2795 	cp	a, e
   553A 3E 00         [ 7] 2796 	ld	a,#0x00
   553C 9A            [ 4] 2797 	sbc	a, d
   553D E2 42 55      [10] 2798 	jp	PO, 00162$
   5540 EE 80         [ 7] 2799 	xor	a, #0x80
   5542                    2800 00162$:
   5542 F2 64 55      [10] 2801 	jp	P,00102$
                           2802 ;src/main.c:111: cpct_drawSolidBox(memptr, 0, 2, 8);
   5545 21 02 08      [10] 2803 	ld	hl,#0x0802
   5548 E5            [11] 2804 	push	hl
   5549 AF            [ 4] 2805 	xor	a, a
   554A F5            [11] 2806 	push	af
   554B 33            [ 6] 2807 	inc	sp
   554C DD 6E FE      [19] 2808 	ld	l,-2 (ix)
   554F DD 66 FF      [19] 2809 	ld	h,-1 (ix)
   5552 E5            [11] 2810 	push	hl
   5553 CD 5E 63      [17] 2811 	call	_cpct_drawSolidBox
   5556 F1            [10] 2812 	pop	af
   5557 F1            [10] 2813 	pop	af
   5558 33            [ 6] 2814 	inc	sp
                           2815 ;src/main.c:112: pushed ++;
   5559 DD 34 FA      [23] 2816 	inc	-6 (ix)
   555C 20 03         [12] 2817 	jr	NZ,00163$
   555E DD 34 FB      [23] 2818 	inc	-5 (ix)
   5561                    2819 00163$:
                           2820 ;src/main.c:113: cont =0;
   5561 11 00 00      [10] 2821 	ld	de,#0x0000
   5564                    2822 00102$:
                           2823 ;src/main.c:115: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   5564 D5            [11] 2824 	push	de
   5565 21 00 01      [10] 2825 	ld	hl,#0x0100
   5568 CD 06 61      [17] 2826 	call	_cpct_isKeyPressed
   556B 7D            [ 4] 2827 	ld	a,l
   556C D1            [10] 2828 	pop	de
   556D B7            [ 4] 2829 	or	a, a
   556E 28 29         [12] 2830 	jr	Z,00105$
   5570 3E 96         [ 7] 2831 	ld	a,#0x96
   5572 BB            [ 4] 2832 	cp	a, e
   5573 3E 00         [ 7] 2833 	ld	a,#0x00
   5575 9A            [ 4] 2834 	sbc	a, d
   5576 E2 7B 55      [10] 2835 	jp	PO, 00164$
   5579 EE 80         [ 7] 2836 	xor	a, #0x80
   557B                    2837 00164$:
   557B F2 99 55      [10] 2838 	jp	P,00105$
                           2839 ;src/main.c:116: cpct_drawSolidBox(memptr, 0, 2, 8);
   557E 21 02 08      [10] 2840 	ld	hl,#0x0802
   5581 E5            [11] 2841 	push	hl
   5582 AF            [ 4] 2842 	xor	a, a
   5583 F5            [11] 2843 	push	af
   5584 33            [ 6] 2844 	inc	sp
   5585 DD 6E FE      [19] 2845 	ld	l,-2 (ix)
   5588 DD 66 FF      [19] 2846 	ld	h,-1 (ix)
   558B E5            [11] 2847 	push	hl
   558C CD 5E 63      [17] 2848 	call	_cpct_drawSolidBox
   558F F1            [10] 2849 	pop	af
   5590 F1            [10] 2850 	pop	af
   5591 33            [ 6] 2851 	inc	sp
                           2852 ;src/main.c:117: pushed --;
   5592 E1            [10] 2853 	pop	hl
   5593 E5            [11] 2854 	push	hl
   5594 2B            [ 6] 2855 	dec	hl
   5595 E3            [19] 2856 	ex	(sp), hl
                           2857 ;src/main.c:118: cont = 0;
   5596 11 00 00      [10] 2858 	ld	de,#0x0000
   5599                    2859 00105$:
                           2860 ;src/main.c:121: switch (pushed){
   5599 DD 7E FB      [19] 2861 	ld	a,-5 (ix)
   559C 07            [ 4] 2862 	rlca
   559D E6 01         [ 7] 2863 	and	a,#0x01
   559F 47            [ 4] 2864 	ld	b,a
   55A0 3E 02         [ 7] 2865 	ld	a,#0x02
   55A2 DD BE FA      [19] 2866 	cp	a, -6 (ix)
   55A5 3E 00         [ 7] 2867 	ld	a,#0x00
   55A7 DD 9E FB      [19] 2868 	sbc	a, -5 (ix)
   55AA E2 AF 55      [10] 2869 	jp	PO, 00165$
   55AD EE 80         [ 7] 2870 	xor	a, #0x80
   55AF                    2871 00165$:
   55AF 07            [ 4] 2872 	rlca
   55B0 E6 01         [ 7] 2873 	and	a,#0x01
   55B2 4F            [ 4] 2874 	ld	c,a
   55B3 78            [ 4] 2875 	ld	a,b
   55B4 B7            [ 4] 2876 	or	a,a
   55B5 20 32         [12] 2877 	jr	NZ,00110$
   55B7 B1            [ 4] 2878 	or	a,c
   55B8 20 2F         [12] 2879 	jr	NZ,00110$
   55BA D5            [11] 2880 	push	de
   55BB DD 5E FA      [19] 2881 	ld	e,-6 (ix)
   55BE 16 00         [ 7] 2882 	ld	d,#0x00
   55C0 21 C7 55      [10] 2883 	ld	hl,#00166$
   55C3 19            [11] 2884 	add	hl,de
   55C4 19            [11] 2885 	add	hl,de
                           2886 ;src/main.c:122: case 0: init = 50;break;
   55C5 D1            [10] 2887 	pop	de
   55C6 E9            [ 4] 2888 	jp	(hl)
   55C7                    2889 00166$:
   55C7 18 04         [12] 2890 	jr	00107$
   55C9 18 0C         [12] 2891 	jr	00108$
   55CB 18 14         [12] 2892 	jr	00109$
   55CD                    2893 00107$:
   55CD DD 36 FC 32   [19] 2894 	ld	-4 (ix),#0x32
   55D1 DD 36 FD 00   [19] 2895 	ld	-3 (ix),#0x00
   55D5 18 12         [12] 2896 	jr	00110$
                           2897 ;src/main.c:123: case 1: init = 70;break;
   55D7                    2898 00108$:
   55D7 DD 36 FC 46   [19] 2899 	ld	-4 (ix),#0x46
   55DB DD 36 FD 00   [19] 2900 	ld	-3 (ix),#0x00
   55DF 18 08         [12] 2901 	jr	00110$
                           2902 ;src/main.c:124: case 2: init = 90;break;
   55E1                    2903 00109$:
   55E1 DD 36 FC 5A   [19] 2904 	ld	-4 (ix),#0x5A
   55E5 DD 36 FD 00   [19] 2905 	ld	-3 (ix),#0x00
                           2906 ;src/main.c:125: }
   55E9                    2907 00110$:
                           2908 ;src/main.c:126: memptr = cpct_getScreenPtr(VMEM,15,init);
   55E9 DD 66 FC      [19] 2909 	ld	h,-4 (ix)
   55EC C5            [11] 2910 	push	bc
   55ED D5            [11] 2911 	push	de
   55EE E5            [11] 2912 	push	hl
   55EF 33            [ 6] 2913 	inc	sp
   55F0 3E 0F         [ 7] 2914 	ld	a,#0x0F
   55F2 F5            [11] 2915 	push	af
   55F3 33            [ 6] 2916 	inc	sp
   55F4 21 00 C0      [10] 2917 	ld	hl,#0xC000
   55F7 E5            [11] 2918 	push	hl
   55F8 CD 2F 64      [17] 2919 	call	_cpct_getScreenPtr
   55FB D1            [10] 2920 	pop	de
   55FC C1            [10] 2921 	pop	bc
                           2922 ;src/main.c:91: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   55FD DD 75 FE      [19] 2923 	ld	-2 (ix),l
   5600 DD 74 FF      [19] 2924 	ld	-1 (ix),h
                           2925 ;src/main.c:127: cpct_drawSolidBox(memptr, 3, 2, 8);
   5603 C5            [11] 2926 	push	bc
   5604 D5            [11] 2927 	push	de
   5605 21 02 08      [10] 2928 	ld	hl,#0x0802
   5608 E5            [11] 2929 	push	hl
   5609 3E 03         [ 7] 2930 	ld	a,#0x03
   560B F5            [11] 2931 	push	af
   560C 33            [ 6] 2932 	inc	sp
   560D DD 6E FE      [19] 2933 	ld	l,-2 (ix)
   5610 DD 66 FF      [19] 2934 	ld	h,-1 (ix)
   5613 E5            [11] 2935 	push	hl
   5614 CD 5E 63      [17] 2936 	call	_cpct_drawSolidBox
   5617 F1            [10] 2937 	pop	af
   5618 F1            [10] 2938 	pop	af
   5619 33            [ 6] 2939 	inc	sp
   561A 21 00 40      [10] 2940 	ld	hl,#0x4000
   561D CD 06 61      [17] 2941 	call	_cpct_isKeyPressed
   5620 7D            [ 4] 2942 	ld	a,l
   5621 D1            [10] 2943 	pop	de
   5622 C1            [10] 2944 	pop	bc
   5623 B7            [ 4] 2945 	or	a, a
   5624 28 27         [12] 2946 	jr	Z,00116$
                           2947 ;src/main.c:129: switch (pushed){
   5626 78            [ 4] 2948 	ld	a,b
   5627 B7            [ 4] 2949 	or	a,a
   5628 20 23         [12] 2950 	jr	NZ,00116$
   562A B1            [ 4] 2951 	or	a,c
   562B 20 20         [12] 2952 	jr	NZ,00116$
   562D DD 5E FA      [19] 2953 	ld	e,-6 (ix)
   5630 16 00         [ 7] 2954 	ld	d,#0x00
   5632 21 38 56      [10] 2955 	ld	hl,#00167$
   5635 19            [11] 2956 	add	hl,de
   5636 19            [11] 2957 	add	hl,de
                           2958 ;src/main.c:130: case 0: return 1;break;
   5637 E9            [ 4] 2959 	jp	(hl)
   5638                    2960 00167$:
   5638 18 04         [12] 2961 	jr	00111$
   563A 18 07         [12] 2962 	jr	00112$
   563C 18 0A         [12] 2963 	jr	00113$
   563E                    2964 00111$:
   563E 21 01 00      [10] 2965 	ld	hl,#0x0001
   5641 18 0E         [12] 2966 	jr	00120$
                           2967 ;src/main.c:131: case 1: return 2;break;
   5643                    2968 00112$:
   5643 21 02 00      [10] 2969 	ld	hl,#0x0002
   5646 18 09         [12] 2970 	jr	00120$
                           2971 ;src/main.c:132: case 2: return 0;break;
   5648                    2972 00113$:
   5648 21 00 00      [10] 2973 	ld	hl,#0x0000
   564B 18 04         [12] 2974 	jr	00120$
                           2975 ;src/main.c:133: }
   564D                    2976 00116$:
                           2977 ;src/main.c:135: cont++;
   564D 13            [ 6] 2978 	inc	de
   564E C3 28 55      [10] 2979 	jp	00118$
   5651                    2980 00120$:
   5651 DD F9         [10] 2981 	ld	sp, ix
   5653 DD E1         [14] 2982 	pop	ix
   5655 C9            [10] 2983 	ret
   5656                    2984 ___str_1:
   5656 4C 6F 75 6E 67 65  2985 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5666 00                 2986 	.db 0x00
   5667                    2987 ___str_2:
   5667 4E 75 65 76 61 20  2988 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   5674 00                 2989 	.db 0x00
   5675                    2990 ___str_3:
   5675 43 72 65 64 69 74  2991 	.ascii "Creditos"
        6F 73
   567D 00                 2992 	.db 0x00
   567E                    2993 ___str_4:
   567E 53 61 6C 69 72     2994 	.ascii "Salir"
   5683 00                 2995 	.db 0x00
                           2996 ;src/main.c:154: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           2997 ;	---------------------------------
                           2998 ; Function checkBoundsCollisionsEnemy
                           2999 ; ---------------------------------
   5684                    3000 _checkBoundsCollisionsEnemy::
   5684 DD E5         [15] 3001 	push	ix
   5686 DD 21 00 00   [14] 3002 	ld	ix,#0
   568A DD 39         [15] 3003 	add	ix,sp
   568C 21 EC FF      [10] 3004 	ld	hl,#-20
   568F 39            [11] 3005 	add	hl,sp
   5690 F9            [ 6] 3006 	ld	sp,hl
                           3007 ;src/main.c:156: u8 *posX = x;
   5691 DD 7E 04      [19] 3008 	ld	a,4 (ix)
   5694 DD 77 EE      [19] 3009 	ld	-18 (ix),a
   5697 DD 7E 05      [19] 3010 	ld	a,5 (ix)
   569A DD 77 EF      [19] 3011 	ld	-17 (ix),a
                           3012 ;src/main.c:157: u8 *posY = y;
   569D DD 7E 06      [19] 3013 	ld	a,6 (ix)
   56A0 DD 77 EC      [19] 3014 	ld	-20 (ix),a
   56A3 DD 7E 07      [19] 3015 	ld	a,7 (ix)
   56A6 DD 77 ED      [19] 3016 	ld	-19 (ix),a
                           3017 ;src/main.c:158: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   56A9 E1            [10] 3018 	pop	hl
   56AA E5            [11] 3019 	push	hl
   56AB 7E            [ 7] 3020 	ld	a,(hl)
   56AC DD 77 FB      [19] 3021 	ld	-5 (ix), a
   56AF 07            [ 4] 3022 	rlca
   56B0 07            [ 4] 3023 	rlca
   56B1 07            [ 4] 3024 	rlca
   56B2 07            [ 4] 3025 	rlca
   56B3 E6 0F         [ 7] 3026 	and	a,#0x0F
   56B5 4F            [ 4] 3027 	ld	c,a
   56B6 06 00         [ 7] 3028 	ld	b,#0x00
   56B8 69            [ 4] 3029 	ld	l, c
   56B9 60            [ 4] 3030 	ld	h, b
   56BA 29            [11] 3031 	add	hl, hl
   56BB 29            [11] 3032 	add	hl, hl
   56BC 09            [11] 3033 	add	hl, bc
   56BD 29            [11] 3034 	add	hl, hl
   56BE 29            [11] 3035 	add	hl, hl
   56BF 3E 25         [ 7] 3036 	ld	a,#<(_scene)
   56C1 85            [ 4] 3037 	add	a, l
   56C2 DD 77 F9      [19] 3038 	ld	-7 (ix),a
   56C5 3E 65         [ 7] 3039 	ld	a,#>(_scene)
   56C7 8C            [ 4] 3040 	adc	a, h
   56C8 DD 77 FA      [19] 3041 	ld	-6 (ix),a
   56CB DD 6E EE      [19] 3042 	ld	l,-18 (ix)
   56CE DD 66 EF      [19] 3043 	ld	h,-17 (ix)
   56D1 7E            [ 7] 3044 	ld	a,(hl)
   56D2 DD 77 FE      [19] 3045 	ld	-2 (ix), a
   56D5 0F            [ 4] 3046 	rrca
   56D6 0F            [ 4] 3047 	rrca
   56D7 E6 3F         [ 7] 3048 	and	a,#0x3F
   56D9 DD 77 FF      [19] 3049 	ld	-1 (ix), a
   56DC DD 86 F9      [19] 3050 	add	a, -7 (ix)
   56DF 6F            [ 4] 3051 	ld	l,a
   56E0 3E 00         [ 7] 3052 	ld	a,#0x00
   56E2 DD 8E FA      [19] 3053 	adc	a, -6 (ix)
   56E5 67            [ 4] 3054 	ld	h,a
   56E6 7E            [ 7] 3055 	ld	a,(hl)
   56E7 DD 77 F8      [19] 3056 	ld	-8 (ix), a
   56EA 3D            [ 4] 3057 	dec	a
   56EB CA F9 57      [10] 3058 	jp	Z,00106$
                           3059 ;src/main.c:159: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   56EE DD 6E FE      [19] 3060 	ld	l,-2 (ix)
   56F1 26 00         [ 7] 3061 	ld	h,#0x00
   56F3 DD 5E 0A      [19] 3062 	ld	e,10 (ix)
   56F6 16 00         [ 7] 3063 	ld	d,#0x00
   56F8 19            [11] 3064 	add	hl,de
   56F9 7D            [ 4] 3065 	ld	a,l
   56FA C6 FF         [ 7] 3066 	add	a,#0xFF
   56FC DD 77 F0      [19] 3067 	ld	-16 (ix),a
   56FF 7C            [ 4] 3068 	ld	a,h
   5700 CE FF         [ 7] 3069 	adc	a,#0xFF
   5702 DD 77 F1      [19] 3070 	ld	-15 (ix),a
   5705 DD 7E F0      [19] 3071 	ld	a,-16 (ix)
   5708 DD 77 F6      [19] 3072 	ld	-10 (ix),a
   570B DD 7E F1      [19] 3073 	ld	a,-15 (ix)
   570E DD 77 F7      [19] 3074 	ld	-9 (ix),a
   5711 DD 7E F1      [19] 3075 	ld	a,-15 (ix)
   5714 07            [ 4] 3076 	rlca
   5715 E6 01         [ 7] 3077 	and	a,#0x01
   5717 DD 77 FE      [19] 3078 	ld	-2 (ix),a
   571A 23            [ 6] 3079 	inc	hl
   571B 23            [ 6] 3080 	inc	hl
   571C DD 75 F2      [19] 3081 	ld	-14 (ix),l
   571F DD 74 F3      [19] 3082 	ld	-13 (ix),h
   5722 DD 7E FE      [19] 3083 	ld	a,-2 (ix)
   5725 B7            [ 4] 3084 	or	a, a
   5726 28 0C         [12] 3085 	jr	Z,00114$
   5728 DD 7E F2      [19] 3086 	ld	a,-14 (ix)
   572B DD 77 F6      [19] 3087 	ld	-10 (ix),a
   572E DD 7E F3      [19] 3088 	ld	a,-13 (ix)
   5731 DD 77 F7      [19] 3089 	ld	-9 (ix),a
   5734                    3090 00114$:
   5734 DD 6E F6      [19] 3091 	ld	l,-10 (ix)
   5737 DD 66 F7      [19] 3092 	ld	h,-9 (ix)
   573A CB 2C         [ 8] 3093 	sra	h
   573C CB 1D         [ 8] 3094 	rr	l
   573E CB 2C         [ 8] 3095 	sra	h
   5740 CB 1D         [ 8] 3096 	rr	l
   5742 DD 5E F9      [19] 3097 	ld	e,-7 (ix)
   5745 DD 56 FA      [19] 3098 	ld	d,-6 (ix)
   5748 19            [11] 3099 	add	hl,de
   5749 7E            [ 7] 3100 	ld	a,(hl)
   574A 3D            [ 4] 3101 	dec	a
   574B CA F9 57      [10] 3102 	jp	Z,00106$
                           3103 ;src/main.c:160: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   574E DD 6E FB      [19] 3104 	ld	l,-5 (ix)
   5751 26 00         [ 7] 3105 	ld	h,#0x00
   5753 DD 5E 0B      [19] 3106 	ld	e,11 (ix)
   5756 16 00         [ 7] 3107 	ld	d,#0x00
   5758 19            [11] 3108 	add	hl,de
   5759 4D            [ 4] 3109 	ld	c,l
   575A 44            [ 4] 3110 	ld	b,h
   575B 0B            [ 6] 3111 	dec	bc
   575C 0B            [ 6] 3112 	dec	bc
   575D 59            [ 4] 3113 	ld	e, c
   575E 78            [ 4] 3114 	ld	a,b
   575F 57            [ 4] 3115 	ld	d,a
   5760 07            [ 4] 3116 	rlca
   5761 E6 01         [ 7] 3117 	and	a,#0x01
   5763 DD 77 F6      [19] 3118 	ld	-10 (ix),a
   5766 7D            [ 4] 3119 	ld	a,l
   5767 C6 0D         [ 7] 3120 	add	a, #0x0D
   5769 DD 77 FC      [19] 3121 	ld	-4 (ix),a
   576C 7C            [ 4] 3122 	ld	a,h
   576D CE 00         [ 7] 3123 	adc	a, #0x00
   576F DD 77 FD      [19] 3124 	ld	-3 (ix),a
   5772 DD 7E F6      [19] 3125 	ld	a,-10 (ix)
   5775 B7            [ 4] 3126 	or	a, a
   5776 28 06         [12] 3127 	jr	Z,00115$
   5778 DD 5E FC      [19] 3128 	ld	e,-4 (ix)
   577B DD 56 FD      [19] 3129 	ld	d,-3 (ix)
   577E                    3130 00115$:
   577E CB 2A         [ 8] 3131 	sra	d
   5780 CB 1B         [ 8] 3132 	rr	e
   5782 CB 2A         [ 8] 3133 	sra	d
   5784 CB 1B         [ 8] 3134 	rr	e
   5786 CB 2A         [ 8] 3135 	sra	d
   5788 CB 1B         [ 8] 3136 	rr	e
   578A CB 2A         [ 8] 3137 	sra	d
   578C CB 1B         [ 8] 3138 	rr	e
   578E 6B            [ 4] 3139 	ld	l, e
   578F 62            [ 4] 3140 	ld	h, d
   5790 29            [11] 3141 	add	hl, hl
   5791 29            [11] 3142 	add	hl, hl
   5792 19            [11] 3143 	add	hl, de
   5793 29            [11] 3144 	add	hl, hl
   5794 29            [11] 3145 	add	hl, hl
   5795 11 25 65      [10] 3146 	ld	de,#_scene
   5798 19            [11] 3147 	add	hl,de
   5799 DD 5E FF      [19] 3148 	ld	e,-1 (ix)
   579C 16 00         [ 7] 3149 	ld	d,#0x00
   579E 19            [11] 3150 	add	hl,de
   579F 7E            [ 7] 3151 	ld	a,(hl)
   57A0 3D            [ 4] 3152 	dec	a
   57A1 28 56         [12] 3153 	jr	Z,00106$
                           3154 ;src/main.c:161: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   57A3 69            [ 4] 3155 	ld	l, c
   57A4 60            [ 4] 3156 	ld	h, b
   57A5 DD 7E F6      [19] 3157 	ld	a,-10 (ix)
   57A8 B7            [ 4] 3158 	or	a, a
   57A9 28 06         [12] 3159 	jr	Z,00116$
   57AB DD 6E FC      [19] 3160 	ld	l,-4 (ix)
   57AE DD 66 FD      [19] 3161 	ld	h,-3 (ix)
   57B1                    3162 00116$:
   57B1 CB 2C         [ 8] 3163 	sra	h
   57B3 CB 1D         [ 8] 3164 	rr	l
   57B5 CB 2C         [ 8] 3165 	sra	h
   57B7 CB 1D         [ 8] 3166 	rr	l
   57B9 CB 2C         [ 8] 3167 	sra	h
   57BB CB 1D         [ 8] 3168 	rr	l
   57BD CB 2C         [ 8] 3169 	sra	h
   57BF CB 1D         [ 8] 3170 	rr	l
   57C1 5D            [ 4] 3171 	ld	e, l
   57C2 54            [ 4] 3172 	ld	d, h
   57C3 29            [11] 3173 	add	hl, hl
   57C4 29            [11] 3174 	add	hl, hl
   57C5 19            [11] 3175 	add	hl, de
   57C6 29            [11] 3176 	add	hl, hl
   57C7 29            [11] 3177 	add	hl, hl
   57C8 3E 25         [ 7] 3178 	ld	a,#<(_scene)
   57CA 85            [ 4] 3179 	add	a, l
   57CB DD 77 F4      [19] 3180 	ld	-12 (ix),a
   57CE 3E 65         [ 7] 3181 	ld	a,#>(_scene)
   57D0 8C            [ 4] 3182 	adc	a, h
   57D1 DD 77 F5      [19] 3183 	ld	-11 (ix),a
   57D4 DD 6E F0      [19] 3184 	ld	l,-16 (ix)
   57D7 DD 66 F1      [19] 3185 	ld	h,-15 (ix)
   57DA DD 7E FE      [19] 3186 	ld	a,-2 (ix)
   57DD B7            [ 4] 3187 	or	a, a
   57DE 28 06         [12] 3188 	jr	Z,00117$
   57E0 DD 6E F2      [19] 3189 	ld	l,-14 (ix)
   57E3 DD 66 F3      [19] 3190 	ld	h,-13 (ix)
   57E6                    3191 00117$:
   57E6 CB 2C         [ 8] 3192 	sra	h
   57E8 CB 1D         [ 8] 3193 	rr	l
   57EA CB 2C         [ 8] 3194 	sra	h
   57EC CB 1D         [ 8] 3195 	rr	l
   57EE DD 5E F4      [19] 3196 	ld	e,-12 (ix)
   57F1 DD 56 F5      [19] 3197 	ld	d,-11 (ix)
   57F4 19            [11] 3198 	add	hl,de
   57F5 7E            [ 7] 3199 	ld	a,(hl)
   57F6 3D            [ 4] 3200 	dec	a
   57F7 20 13         [12] 3201 	jr	NZ,00107$
   57F9                    3202 00106$:
                           3203 ;src/main.c:163: *posX=lx;
   57F9 DD 6E EE      [19] 3204 	ld	l,-18 (ix)
   57FC DD 66 EF      [19] 3205 	ld	h,-17 (ix)
   57FF DD 7E 08      [19] 3206 	ld	a,8 (ix)
   5802 77            [ 7] 3207 	ld	(hl),a
                           3208 ;src/main.c:164: *posY=ly;
   5803 E1            [10] 3209 	pop	hl
   5804 E5            [11] 3210 	push	hl
   5805 DD 7E 09      [19] 3211 	ld	a,9 (ix)
   5808 77            [ 7] 3212 	ld	(hl),a
   5809 C3 D4 58      [10] 3213 	jp	00112$
   580C                    3214 00107$:
                           3215 ;src/main.c:166: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   580C DD 7E F8      [19] 3216 	ld	a,-8 (ix)
   580F D6 03         [ 7] 3217 	sub	a, #0x03
   5811 C2 C4 58      [10] 3218 	jp	NZ,00101$
                           3219 ;src/main.c:167: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5814 DD 6E F0      [19] 3220 	ld	l,-16 (ix)
   5817 DD 66 F1      [19] 3221 	ld	h,-15 (ix)
   581A DD 7E FE      [19] 3222 	ld	a,-2 (ix)
   581D B7            [ 4] 3223 	or	a, a
   581E 28 06         [12] 3224 	jr	Z,00118$
   5820 DD 6E F2      [19] 3225 	ld	l,-14 (ix)
   5823 DD 66 F3      [19] 3226 	ld	h,-13 (ix)
   5826                    3227 00118$:
   5826 CB 2C         [ 8] 3228 	sra	h
   5828 CB 1D         [ 8] 3229 	rr	l
   582A CB 2C         [ 8] 3230 	sra	h
   582C CB 1D         [ 8] 3231 	rr	l
   582E DD 5E F9      [19] 3232 	ld	e,-7 (ix)
   5831 DD 56 FA      [19] 3233 	ld	d,-6 (ix)
   5834 19            [11] 3234 	add	hl,de
   5835 7E            [ 7] 3235 	ld	a,(hl)
   5836 D6 03         [ 7] 3236 	sub	a, #0x03
   5838 C2 C4 58      [10] 3237 	jp	NZ,00101$
                           3238 ;src/main.c:168: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   583B 69            [ 4] 3239 	ld	l, c
   583C 60            [ 4] 3240 	ld	h, b
   583D DD 7E F6      [19] 3241 	ld	a,-10 (ix)
   5840 B7            [ 4] 3242 	or	a, a
   5841 28 06         [12] 3243 	jr	Z,00119$
   5843 DD 6E FC      [19] 3244 	ld	l,-4 (ix)
   5846 DD 66 FD      [19] 3245 	ld	h,-3 (ix)
   5849                    3246 00119$:
   5849 CB 2C         [ 8] 3247 	sra	h
   584B CB 1D         [ 8] 3248 	rr	l
   584D CB 2C         [ 8] 3249 	sra	h
   584F CB 1D         [ 8] 3250 	rr	l
   5851 CB 2C         [ 8] 3251 	sra	h
   5853 CB 1D         [ 8] 3252 	rr	l
   5855 CB 2C         [ 8] 3253 	sra	h
   5857 CB 1D         [ 8] 3254 	rr	l
   5859 5D            [ 4] 3255 	ld	e, l
   585A 54            [ 4] 3256 	ld	d, h
   585B 29            [11] 3257 	add	hl, hl
   585C 29            [11] 3258 	add	hl, hl
   585D 19            [11] 3259 	add	hl, de
   585E 29            [11] 3260 	add	hl, hl
   585F 29            [11] 3261 	add	hl, hl
   5860 11 25 65      [10] 3262 	ld	de,#_scene
   5863 19            [11] 3263 	add	hl,de
   5864 DD 5E FF      [19] 3264 	ld	e,-1 (ix)
   5867 16 00         [ 7] 3265 	ld	d,#0x00
   5869 19            [11] 3266 	add	hl,de
   586A 7E            [ 7] 3267 	ld	a,(hl)
   586B D6 03         [ 7] 3268 	sub	a, #0x03
   586D 20 55         [12] 3269 	jr	NZ,00101$
                           3270 ;src/main.c:169: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   586F DD 7E F6      [19] 3271 	ld	a,-10 (ix)
   5872 B7            [ 4] 3272 	or	a, a
   5873 28 06         [12] 3273 	jr	Z,00120$
   5875 DD 4E FC      [19] 3274 	ld	c,-4 (ix)
   5878 DD 46 FD      [19] 3275 	ld	b,-3 (ix)
   587B                    3276 00120$:
   587B CB 28         [ 8] 3277 	sra	b
   587D CB 19         [ 8] 3278 	rr	c
   587F CB 28         [ 8] 3279 	sra	b
   5881 CB 19         [ 8] 3280 	rr	c
   5883 CB 28         [ 8] 3281 	sra	b
   5885 CB 19         [ 8] 3282 	rr	c
   5887 CB 28         [ 8] 3283 	sra	b
   5889 CB 19         [ 8] 3284 	rr	c
   588B 69            [ 4] 3285 	ld	l, c
   588C 60            [ 4] 3286 	ld	h, b
   588D 29            [11] 3287 	add	hl, hl
   588E 29            [11] 3288 	add	hl, hl
   588F 09            [11] 3289 	add	hl, bc
   5890 29            [11] 3290 	add	hl, hl
   5891 29            [11] 3291 	add	hl, hl
   5892 3E 25         [ 7] 3292 	ld	a,#<(_scene)
   5894 85            [ 4] 3293 	add	a, l
   5895 DD 77 F4      [19] 3294 	ld	-12 (ix),a
   5898 3E 65         [ 7] 3295 	ld	a,#>(_scene)
   589A 8C            [ 4] 3296 	adc	a, h
   589B DD 77 F5      [19] 3297 	ld	-11 (ix),a
   589E DD 6E F0      [19] 3298 	ld	l,-16 (ix)
   58A1 DD 66 F1      [19] 3299 	ld	h,-15 (ix)
   58A4 DD 7E FE      [19] 3300 	ld	a,-2 (ix)
   58A7 B7            [ 4] 3301 	or	a, a
   58A8 28 06         [12] 3302 	jr	Z,00121$
   58AA DD 6E F2      [19] 3303 	ld	l,-14 (ix)
   58AD DD 66 F3      [19] 3304 	ld	h,-13 (ix)
   58B0                    3305 00121$:
   58B0 CB 2C         [ 8] 3306 	sra	h
   58B2 CB 1D         [ 8] 3307 	rr	l
   58B4 CB 2C         [ 8] 3308 	sra	h
   58B6 CB 1D         [ 8] 3309 	rr	l
   58B8 DD 5E F4      [19] 3310 	ld	e,-12 (ix)
   58BB DD 56 F5      [19] 3311 	ld	d,-11 (ix)
   58BE 19            [11] 3312 	add	hl,de
   58BF 7E            [ 7] 3313 	ld	a,(hl)
   58C0 D6 03         [ 7] 3314 	sub	a, #0x03
   58C2 28 10         [12] 3315 	jr	Z,00112$
   58C4                    3316 00101$:
                           3317 ;src/main.c:171: *posX=lx;
   58C4 DD 6E EE      [19] 3318 	ld	l,-18 (ix)
   58C7 DD 66 EF      [19] 3319 	ld	h,-17 (ix)
   58CA DD 7E 08      [19] 3320 	ld	a,8 (ix)
   58CD 77            [ 7] 3321 	ld	(hl),a
                           3322 ;src/main.c:172: *posY=ly;
   58CE E1            [10] 3323 	pop	hl
   58CF E5            [11] 3324 	push	hl
   58D0 DD 7E 09      [19] 3325 	ld	a,9 (ix)
   58D3 77            [ 7] 3326 	ld	(hl),a
   58D4                    3327 00112$:
   58D4 DD F9         [10] 3328 	ld	sp, ix
   58D6 DD E1         [14] 3329 	pop	ix
   58D8 C9            [10] 3330 	ret
                           3331 ;src/main.c:178: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3332 ;	---------------------------------
                           3333 ; Function checkBoundsCollisions
                           3334 ; ---------------------------------
   58D9                    3335 _checkBoundsCollisions::
   58D9 DD E5         [15] 3336 	push	ix
   58DB DD 21 00 00   [14] 3337 	ld	ix,#0
   58DF DD 39         [15] 3338 	add	ix,sp
   58E1 21 F2 FF      [10] 3339 	ld	hl,#-14
   58E4 39            [11] 3340 	add	hl,sp
   58E5 F9            [ 6] 3341 	ld	sp,hl
                           3342 ;src/main.c:179: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   58E6 3A 29 66      [13] 3343 	ld	a,(#(_player + 0x0001) + 0)
   58E9 DD 77 F8      [19] 3344 	ld	-8 (ix), a
   58EC 07            [ 4] 3345 	rlca
   58ED 07            [ 4] 3346 	rlca
   58EE 07            [ 4] 3347 	rlca
   58EF 07            [ 4] 3348 	rlca
   58F0 E6 0F         [ 7] 3349 	and	a,#0x0F
   58F2 4F            [ 4] 3350 	ld	c,a
   58F3 06 00         [ 7] 3351 	ld	b,#0x00
   58F5 69            [ 4] 3352 	ld	l, c
   58F6 60            [ 4] 3353 	ld	h, b
   58F7 29            [11] 3354 	add	hl, hl
   58F8 29            [11] 3355 	add	hl, hl
   58F9 09            [11] 3356 	add	hl, bc
   58FA 29            [11] 3357 	add	hl, hl
   58FB 29            [11] 3358 	add	hl, hl
   58FC 3E 25         [ 7] 3359 	ld	a,#<(_scene)
   58FE 85            [ 4] 3360 	add	a, l
   58FF DD 77 F4      [19] 3361 	ld	-12 (ix),a
   5902 3E 65         [ 7] 3362 	ld	a,#>(_scene)
   5904 8C            [ 4] 3363 	adc	a, h
   5905 DD 77 F5      [19] 3364 	ld	-11 (ix),a
   5908 21 28 66      [10] 3365 	ld	hl, #_player + 0
   590B 4E            [ 7] 3366 	ld	c,(hl)
   590C 79            [ 4] 3367 	ld	a,c
   590D 0F            [ 4] 3368 	rrca
   590E 0F            [ 4] 3369 	rrca
   590F E6 3F         [ 7] 3370 	and	a,#0x3F
   5911 DD 77 F7      [19] 3371 	ld	-9 (ix), a
   5914 DD 86 F4      [19] 3372 	add	a, -12 (ix)
   5917 6F            [ 4] 3373 	ld	l,a
   5918 3E 00         [ 7] 3374 	ld	a,#0x00
   591A DD 8E F5      [19] 3375 	adc	a, -11 (ix)
   591D 67            [ 4] 3376 	ld	h,a
   591E 7E            [ 7] 3377 	ld	a,(hl)
   591F DD 77 F6      [19] 3378 	ld	-10 (ix), a
   5922 3D            [ 4] 3379 	dec	a
   5923 CA 39 5A      [10] 3380 	jp	Z,00124$
                           3381 ;src/main.c:180: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   5926 06 00         [ 7] 3382 	ld	b,#0x00
   5928 21 03 00      [10] 3383 	ld	hl,#0x0003
   592B 09            [11] 3384 	add	hl,bc
   592C DD 75 FB      [19] 3385 	ld	-5 (ix),l
   592F DD 74 FC      [19] 3386 	ld	-4 (ix),h
   5932 DD 7E FB      [19] 3387 	ld	a,-5 (ix)
   5935 DD 77 FE      [19] 3388 	ld	-2 (ix),a
   5938 DD 7E FC      [19] 3389 	ld	a,-4 (ix)
   593B DD 77 FF      [19] 3390 	ld	-1 (ix),a
   593E DD 7E FC      [19] 3391 	ld	a,-4 (ix)
   5941 07            [ 4] 3392 	rlca
   5942 E6 01         [ 7] 3393 	and	a,#0x01
   5944 DD 77 FD      [19] 3394 	ld	-3 (ix),a
   5947 21 06 00      [10] 3395 	ld	hl,#0x0006
   594A 09            [11] 3396 	add	hl,bc
   594B E3            [19] 3397 	ex	(sp), hl
   594C DD 7E FD      [19] 3398 	ld	a,-3 (ix)
   594F B7            [ 4] 3399 	or	a, a
   5950 28 0C         [12] 3400 	jr	Z,00132$
   5952 DD 7E F2      [19] 3401 	ld	a,-14 (ix)
   5955 DD 77 FE      [19] 3402 	ld	-2 (ix),a
   5958 DD 7E F3      [19] 3403 	ld	a,-13 (ix)
   595B DD 77 FF      [19] 3404 	ld	-1 (ix),a
   595E                    3405 00132$:
   595E DD 6E FE      [19] 3406 	ld	l,-2 (ix)
   5961 DD 66 FF      [19] 3407 	ld	h,-1 (ix)
   5964 CB 2C         [ 8] 3408 	sra	h
   5966 CB 1D         [ 8] 3409 	rr	l
   5968 CB 2C         [ 8] 3410 	sra	h
   596A CB 1D         [ 8] 3411 	rr	l
   596C DD 5E F4      [19] 3412 	ld	e,-12 (ix)
   596F DD 56 F5      [19] 3413 	ld	d,-11 (ix)
   5972 19            [11] 3414 	add	hl,de
   5973 7E            [ 7] 3415 	ld	a,(hl)
   5974 3D            [ 4] 3416 	dec	a
   5975 CA 39 5A      [10] 3417 	jp	Z,00124$
                           3418 ;src/main.c:181: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   5978 DD 5E F8      [19] 3419 	ld	e,-8 (ix)
   597B 16 00         [ 7] 3420 	ld	d,#0x00
   597D 21 0E 00      [10] 3421 	ld	hl,#0x000E
   5980 19            [11] 3422 	add	hl,de
   5981 4D            [ 4] 3423 	ld	c,l
   5982 44            [ 4] 3424 	ld	b,h
   5983 DD 71 FE      [19] 3425 	ld	-2 (ix),c
   5986 DD 70 FF      [19] 3426 	ld	-1 (ix),b
   5989 78            [ 4] 3427 	ld	a,b
   598A 07            [ 4] 3428 	rlca
   598B E6 01         [ 7] 3429 	and	a,#0x01
   598D DD 77 F8      [19] 3430 	ld	-8 (ix),a
   5990 21 1D 00      [10] 3431 	ld	hl,#0x001D
   5993 19            [11] 3432 	add	hl,de
   5994 DD 75 F9      [19] 3433 	ld	-7 (ix),l
   5997 DD 74 FA      [19] 3434 	ld	-6 (ix),h
   599A DD 7E F8      [19] 3435 	ld	a,-8 (ix)
   599D B7            [ 4] 3436 	or	a, a
   599E 28 0C         [12] 3437 	jr	Z,00133$
   59A0 DD 7E F9      [19] 3438 	ld	a,-7 (ix)
   59A3 DD 77 FE      [19] 3439 	ld	-2 (ix),a
   59A6 DD 7E FA      [19] 3440 	ld	a,-6 (ix)
   59A9 DD 77 FF      [19] 3441 	ld	-1 (ix),a
   59AC                    3442 00133$:
   59AC DD 6E FE      [19] 3443 	ld	l,-2 (ix)
   59AF DD 66 FF      [19] 3444 	ld	h,-1 (ix)
   59B2 CB 2C         [ 8] 3445 	sra	h
   59B4 CB 1D         [ 8] 3446 	rr	l
   59B6 CB 2C         [ 8] 3447 	sra	h
   59B8 CB 1D         [ 8] 3448 	rr	l
   59BA CB 2C         [ 8] 3449 	sra	h
   59BC CB 1D         [ 8] 3450 	rr	l
   59BE CB 2C         [ 8] 3451 	sra	h
   59C0 CB 1D         [ 8] 3452 	rr	l
   59C2 5D            [ 4] 3453 	ld	e, l
   59C3 54            [ 4] 3454 	ld	d, h
   59C4 29            [11] 3455 	add	hl, hl
   59C5 29            [11] 3456 	add	hl, hl
   59C6 19            [11] 3457 	add	hl, de
   59C7 29            [11] 3458 	add	hl, hl
   59C8 29            [11] 3459 	add	hl, hl
   59C9 11 25 65      [10] 3460 	ld	de,#_scene
   59CC 19            [11] 3461 	add	hl,de
   59CD DD 5E F7      [19] 3462 	ld	e,-9 (ix)
   59D0 16 00         [ 7] 3463 	ld	d,#0x00
   59D2 19            [11] 3464 	add	hl,de
   59D3 7E            [ 7] 3465 	ld	a,(hl)
   59D4 3D            [ 4] 3466 	dec	a
   59D5 28 62         [12] 3467 	jr	Z,00124$
                           3468 ;src/main.c:182: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   59D7 DD 71 FE      [19] 3469 	ld	-2 (ix),c
   59DA DD 70 FF      [19] 3470 	ld	-1 (ix),b
   59DD DD 7E F8      [19] 3471 	ld	a,-8 (ix)
   59E0 B7            [ 4] 3472 	or	a, a
   59E1 28 0C         [12] 3473 	jr	Z,00134$
   59E3 DD 7E F9      [19] 3474 	ld	a,-7 (ix)
   59E6 DD 77 FE      [19] 3475 	ld	-2 (ix),a
   59E9 DD 7E FA      [19] 3476 	ld	a,-6 (ix)
   59EC DD 77 FF      [19] 3477 	ld	-1 (ix),a
   59EF                    3478 00134$:
   59EF DD 6E FE      [19] 3479 	ld	l,-2 (ix)
   59F2 DD 66 FF      [19] 3480 	ld	h,-1 (ix)
   59F5 CB 2C         [ 8] 3481 	sra	h
   59F7 CB 1D         [ 8] 3482 	rr	l
   59F9 CB 2C         [ 8] 3483 	sra	h
   59FB CB 1D         [ 8] 3484 	rr	l
   59FD CB 2C         [ 8] 3485 	sra	h
   59FF CB 1D         [ 8] 3486 	rr	l
   5A01 CB 2C         [ 8] 3487 	sra	h
   5A03 CB 1D         [ 8] 3488 	rr	l
   5A05 5D            [ 4] 3489 	ld	e, l
   5A06 54            [ 4] 3490 	ld	d, h
   5A07 29            [11] 3491 	add	hl, hl
   5A08 29            [11] 3492 	add	hl, hl
   5A09 19            [11] 3493 	add	hl, de
   5A0A 29            [11] 3494 	add	hl, hl
   5A0B 29            [11] 3495 	add	hl, hl
   5A0C 3E 25         [ 7] 3496 	ld	a,#<(_scene)
   5A0E 85            [ 4] 3497 	add	a, l
   5A0F DD 77 FE      [19] 3498 	ld	-2 (ix),a
   5A12 3E 65         [ 7] 3499 	ld	a,#>(_scene)
   5A14 8C            [ 4] 3500 	adc	a, h
   5A15 DD 77 FF      [19] 3501 	ld	-1 (ix),a
   5A18 DD 6E FB      [19] 3502 	ld	l,-5 (ix)
   5A1B DD 66 FC      [19] 3503 	ld	h,-4 (ix)
   5A1E DD 7E FD      [19] 3504 	ld	a,-3 (ix)
   5A21 B7            [ 4] 3505 	or	a, a
   5A22 28 02         [12] 3506 	jr	Z,00135$
   5A24 E1            [10] 3507 	pop	hl
   5A25 E5            [11] 3508 	push	hl
   5A26                    3509 00135$:
   5A26 CB 2C         [ 8] 3510 	sra	h
   5A28 CB 1D         [ 8] 3511 	rr	l
   5A2A CB 2C         [ 8] 3512 	sra	h
   5A2C CB 1D         [ 8] 3513 	rr	l
   5A2E DD 5E FE      [19] 3514 	ld	e,-2 (ix)
   5A31 DD 56 FF      [19] 3515 	ld	d,-1 (ix)
   5A34 19            [11] 3516 	add	hl,de
   5A35 7E            [ 7] 3517 	ld	a,(hl)
   5A36 3D            [ 4] 3518 	dec	a
   5A37 20 10         [12] 3519 	jr	NZ,00125$
   5A39                    3520 00124$:
                           3521 ;src/main.c:184: player.x=player.lx;
   5A39 3A 2A 66      [13] 3522 	ld	a, (#_player + 2)
   5A3C 21 28 66      [10] 3523 	ld	hl,#_player
   5A3F 77            [ 7] 3524 	ld	(hl),a
                           3525 ;src/main.c:185: player.y=player.ly;
   5A40 3A 2B 66      [13] 3526 	ld	a, (#_player + 3)
   5A43 32 29 66      [13] 3527 	ld	(#(_player + 0x0001)),a
   5A46 C3 A5 5C      [10] 3528 	jp	00130$
   5A49                    3529 00125$:
                           3530 ;src/main.c:187: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   5A49 DD 7E F6      [19] 3531 	ld	a,-10 (ix)
   5A4C D6 02         [ 7] 3532 	sub	a, #0x02
   5A4E CA F1 5A      [10] 3533 	jp	Z,00118$
                           3534 ;src/main.c:188: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5A51 DD 6E FB      [19] 3535 	ld	l,-5 (ix)
   5A54 DD 66 FC      [19] 3536 	ld	h,-4 (ix)
   5A57 DD 7E FD      [19] 3537 	ld	a,-3 (ix)
   5A5A B7            [ 4] 3538 	or	a, a
   5A5B 28 02         [12] 3539 	jr	Z,00136$
   5A5D E1            [10] 3540 	pop	hl
   5A5E E5            [11] 3541 	push	hl
   5A5F                    3542 00136$:
   5A5F CB 2C         [ 8] 3543 	sra	h
   5A61 CB 1D         [ 8] 3544 	rr	l
   5A63 CB 2C         [ 8] 3545 	sra	h
   5A65 CB 1D         [ 8] 3546 	rr	l
   5A67 DD 5E F4      [19] 3547 	ld	e,-12 (ix)
   5A6A DD 56 F5      [19] 3548 	ld	d,-11 (ix)
   5A6D 19            [11] 3549 	add	hl,de
   5A6E 7E            [ 7] 3550 	ld	a,(hl)
   5A6F D6 02         [ 7] 3551 	sub	a, #0x02
   5A71 CA F1 5A      [10] 3552 	jp	Z,00118$
                           3553 ;src/main.c:189: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5A74 69            [ 4] 3554 	ld	l, c
   5A75 60            [ 4] 3555 	ld	h, b
   5A76 DD 7E F8      [19] 3556 	ld	a,-8 (ix)
   5A79 B7            [ 4] 3557 	or	a, a
   5A7A 28 06         [12] 3558 	jr	Z,00137$
   5A7C DD 6E F9      [19] 3559 	ld	l,-7 (ix)
   5A7F DD 66 FA      [19] 3560 	ld	h,-6 (ix)
   5A82                    3561 00137$:
   5A82 CB 2C         [ 8] 3562 	sra	h
   5A84 CB 1D         [ 8] 3563 	rr	l
   5A86 CB 2C         [ 8] 3564 	sra	h
   5A88 CB 1D         [ 8] 3565 	rr	l
   5A8A CB 2C         [ 8] 3566 	sra	h
   5A8C CB 1D         [ 8] 3567 	rr	l
   5A8E CB 2C         [ 8] 3568 	sra	h
   5A90 CB 1D         [ 8] 3569 	rr	l
   5A92 5D            [ 4] 3570 	ld	e, l
   5A93 54            [ 4] 3571 	ld	d, h
   5A94 29            [11] 3572 	add	hl, hl
   5A95 29            [11] 3573 	add	hl, hl
   5A96 19            [11] 3574 	add	hl, de
   5A97 29            [11] 3575 	add	hl, hl
   5A98 29            [11] 3576 	add	hl, hl
   5A99 11 25 65      [10] 3577 	ld	de,#_scene
   5A9C 19            [11] 3578 	add	hl,de
   5A9D DD 5E F7      [19] 3579 	ld	e,-9 (ix)
   5AA0 16 00         [ 7] 3580 	ld	d,#0x00
   5AA2 19            [11] 3581 	add	hl,de
   5AA3 7E            [ 7] 3582 	ld	a,(hl)
   5AA4 D6 02         [ 7] 3583 	sub	a, #0x02
   5AA6 28 49         [12] 3584 	jr	Z,00118$
                           3585 ;src/main.c:190: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5AA8 69            [ 4] 3586 	ld	l, c
   5AA9 60            [ 4] 3587 	ld	h, b
   5AAA DD 7E F8      [19] 3588 	ld	a,-8 (ix)
   5AAD B7            [ 4] 3589 	or	a, a
   5AAE 28 06         [12] 3590 	jr	Z,00138$
   5AB0 DD 6E F9      [19] 3591 	ld	l,-7 (ix)
   5AB3 DD 66 FA      [19] 3592 	ld	h,-6 (ix)
   5AB6                    3593 00138$:
   5AB6 CB 2C         [ 8] 3594 	sra	h
   5AB8 CB 1D         [ 8] 3595 	rr	l
   5ABA CB 2C         [ 8] 3596 	sra	h
   5ABC CB 1D         [ 8] 3597 	rr	l
   5ABE CB 2C         [ 8] 3598 	sra	h
   5AC0 CB 1D         [ 8] 3599 	rr	l
   5AC2 CB 2C         [ 8] 3600 	sra	h
   5AC4 CB 1D         [ 8] 3601 	rr	l
   5AC6 5D            [ 4] 3602 	ld	e, l
   5AC7 54            [ 4] 3603 	ld	d, h
   5AC8 29            [11] 3604 	add	hl, hl
   5AC9 29            [11] 3605 	add	hl, hl
   5ACA 19            [11] 3606 	add	hl, de
   5ACB 29            [11] 3607 	add	hl, hl
   5ACC 29            [11] 3608 	add	hl, hl
   5ACD 3E 25         [ 7] 3609 	ld	a,#<(_scene)
   5ACF 85            [ 4] 3610 	add	a, l
   5AD0 5F            [ 4] 3611 	ld	e,a
   5AD1 3E 65         [ 7] 3612 	ld	a,#>(_scene)
   5AD3 8C            [ 4] 3613 	adc	a, h
   5AD4 57            [ 4] 3614 	ld	d,a
   5AD5 DD 6E FB      [19] 3615 	ld	l,-5 (ix)
   5AD8 DD 66 FC      [19] 3616 	ld	h,-4 (ix)
   5ADB DD 7E FD      [19] 3617 	ld	a,-3 (ix)
   5ADE B7            [ 4] 3618 	or	a, a
   5ADF 28 02         [12] 3619 	jr	Z,00139$
   5AE1 E1            [10] 3620 	pop	hl
   5AE2 E5            [11] 3621 	push	hl
   5AE3                    3622 00139$:
   5AE3 CB 2C         [ 8] 3623 	sra	h
   5AE5 CB 1D         [ 8] 3624 	rr	l
   5AE7 CB 2C         [ 8] 3625 	sra	h
   5AE9 CB 1D         [ 8] 3626 	rr	l
   5AEB 19            [11] 3627 	add	hl,de
   5AEC 7E            [ 7] 3628 	ld	a,(hl)
   5AED D6 02         [ 7] 3629 	sub	a, #0x02
   5AEF 20 21         [12] 3630 	jr	NZ,00119$
   5AF1                    3631 00118$:
                           3632 ;src/main.c:192: if(player.life < 3 && *corazon == 0){
   5AF1 FD 21 2E 66   [14] 3633 	ld	iy,#_player + 6
   5AF5 FD 5E 00      [19] 3634 	ld	e, 0 (iy)
   5AF8 7B            [ 4] 3635 	ld	a,e
   5AF9 D6 03         [ 7] 3636 	sub	a, #0x03
   5AFB D2 A5 5C      [10] 3637 	jp	NC,00130$
   5AFE DD 6E 04      [19] 3638 	ld	l,4 (ix)
   5B01 DD 66 05      [19] 3639 	ld	h,5 (ix)
   5B04 7E            [ 7] 3640 	ld	a,(hl)
   5B05 B7            [ 4] 3641 	or	a, a
   5B06 C2 A5 5C      [10] 3642 	jp	NZ,00130$
                           3643 ;src/main.c:193: player.life += 1;
   5B09 1C            [ 4] 3644 	inc	e
   5B0A FD 73 00      [19] 3645 	ld	0 (iy), e
                           3646 ;src/main.c:194: *corazon = 1;
   5B0D 36 01         [10] 3647 	ld	(hl),#0x01
   5B0F C3 A5 5C      [10] 3648 	jp	00130$
   5B12                    3649 00119$:
                           3650 ;src/main.c:197: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   5B12 DD 7E F6      [19] 3651 	ld	a,-10 (ix)
   5B15 D6 05         [ 7] 3652 	sub	a, #0x05
   5B17 CA BA 5B      [10] 3653 	jp	Z,00112$
                           3654 ;src/main.c:198: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5B1A DD 6E FB      [19] 3655 	ld	l,-5 (ix)
   5B1D DD 66 FC      [19] 3656 	ld	h,-4 (ix)
   5B20 DD 7E FD      [19] 3657 	ld	a,-3 (ix)
   5B23 B7            [ 4] 3658 	or	a, a
   5B24 28 02         [12] 3659 	jr	Z,00140$
   5B26 E1            [10] 3660 	pop	hl
   5B27 E5            [11] 3661 	push	hl
   5B28                    3662 00140$:
   5B28 CB 2C         [ 8] 3663 	sra	h
   5B2A CB 1D         [ 8] 3664 	rr	l
   5B2C CB 2C         [ 8] 3665 	sra	h
   5B2E CB 1D         [ 8] 3666 	rr	l
   5B30 DD 5E F4      [19] 3667 	ld	e,-12 (ix)
   5B33 DD 56 F5      [19] 3668 	ld	d,-11 (ix)
   5B36 19            [11] 3669 	add	hl,de
   5B37 7E            [ 7] 3670 	ld	a,(hl)
   5B38 D6 05         [ 7] 3671 	sub	a, #0x05
   5B3A CA BA 5B      [10] 3672 	jp	Z,00112$
                           3673 ;src/main.c:199: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5B3D 69            [ 4] 3674 	ld	l, c
   5B3E 60            [ 4] 3675 	ld	h, b
   5B3F DD 7E F8      [19] 3676 	ld	a,-8 (ix)
   5B42 B7            [ 4] 3677 	or	a, a
   5B43 28 06         [12] 3678 	jr	Z,00141$
   5B45 DD 6E F9      [19] 3679 	ld	l,-7 (ix)
   5B48 DD 66 FA      [19] 3680 	ld	h,-6 (ix)
   5B4B                    3681 00141$:
   5B4B CB 2C         [ 8] 3682 	sra	h
   5B4D CB 1D         [ 8] 3683 	rr	l
   5B4F CB 2C         [ 8] 3684 	sra	h
   5B51 CB 1D         [ 8] 3685 	rr	l
   5B53 CB 2C         [ 8] 3686 	sra	h
   5B55 CB 1D         [ 8] 3687 	rr	l
   5B57 CB 2C         [ 8] 3688 	sra	h
   5B59 CB 1D         [ 8] 3689 	rr	l
   5B5B 5D            [ 4] 3690 	ld	e, l
   5B5C 54            [ 4] 3691 	ld	d, h
   5B5D 29            [11] 3692 	add	hl, hl
   5B5E 29            [11] 3693 	add	hl, hl
   5B5F 19            [11] 3694 	add	hl, de
   5B60 29            [11] 3695 	add	hl, hl
   5B61 29            [11] 3696 	add	hl, hl
   5B62 11 25 65      [10] 3697 	ld	de,#_scene
   5B65 19            [11] 3698 	add	hl,de
   5B66 DD 5E F7      [19] 3699 	ld	e,-9 (ix)
   5B69 16 00         [ 7] 3700 	ld	d,#0x00
   5B6B 19            [11] 3701 	add	hl,de
   5B6C 7E            [ 7] 3702 	ld	a,(hl)
   5B6D D6 05         [ 7] 3703 	sub	a, #0x05
   5B6F 28 49         [12] 3704 	jr	Z,00112$
                           3705 ;src/main.c:200: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5B71 69            [ 4] 3706 	ld	l, c
   5B72 60            [ 4] 3707 	ld	h, b
   5B73 DD 7E F8      [19] 3708 	ld	a,-8 (ix)
   5B76 B7            [ 4] 3709 	or	a, a
   5B77 28 06         [12] 3710 	jr	Z,00142$
   5B79 DD 6E F9      [19] 3711 	ld	l,-7 (ix)
   5B7C DD 66 FA      [19] 3712 	ld	h,-6 (ix)
   5B7F                    3713 00142$:
   5B7F CB 2C         [ 8] 3714 	sra	h
   5B81 CB 1D         [ 8] 3715 	rr	l
   5B83 CB 2C         [ 8] 3716 	sra	h
   5B85 CB 1D         [ 8] 3717 	rr	l
   5B87 CB 2C         [ 8] 3718 	sra	h
   5B89 CB 1D         [ 8] 3719 	rr	l
   5B8B CB 2C         [ 8] 3720 	sra	h
   5B8D CB 1D         [ 8] 3721 	rr	l
   5B8F 5D            [ 4] 3722 	ld	e, l
   5B90 54            [ 4] 3723 	ld	d, h
   5B91 29            [11] 3724 	add	hl, hl
   5B92 29            [11] 3725 	add	hl, hl
   5B93 19            [11] 3726 	add	hl, de
   5B94 29            [11] 3727 	add	hl, hl
   5B95 29            [11] 3728 	add	hl, hl
   5B96 3E 25         [ 7] 3729 	ld	a,#<(_scene)
   5B98 85            [ 4] 3730 	add	a, l
   5B99 5F            [ 4] 3731 	ld	e,a
   5B9A 3E 65         [ 7] 3732 	ld	a,#>(_scene)
   5B9C 8C            [ 4] 3733 	adc	a, h
   5B9D 57            [ 4] 3734 	ld	d,a
   5B9E DD 6E FB      [19] 3735 	ld	l,-5 (ix)
   5BA1 DD 66 FC      [19] 3736 	ld	h,-4 (ix)
   5BA4 DD 7E FD      [19] 3737 	ld	a,-3 (ix)
   5BA7 B7            [ 4] 3738 	or	a, a
   5BA8 28 02         [12] 3739 	jr	Z,00143$
   5BAA E1            [10] 3740 	pop	hl
   5BAB E5            [11] 3741 	push	hl
   5BAC                    3742 00143$:
   5BAC CB 2C         [ 8] 3743 	sra	h
   5BAE CB 1D         [ 8] 3744 	rr	l
   5BB0 CB 2C         [ 8] 3745 	sra	h
   5BB2 CB 1D         [ 8] 3746 	rr	l
   5BB4 19            [11] 3747 	add	hl,de
   5BB5 7E            [ 7] 3748 	ld	a,(hl)
   5BB6 D6 05         [ 7] 3749 	sub	a, #0x05
   5BB8 20 21         [12] 3750 	jr	NZ,00113$
   5BBA                    3751 00112$:
                           3752 ;src/main.c:202: if(player.bullets < 3 && *flecha == 0){
   5BBA FD 21 32 66   [14] 3753 	ld	iy,#_player + 10
   5BBE FD 5E 00      [19] 3754 	ld	e, 0 (iy)
   5BC1 7B            [ 4] 3755 	ld	a,e
   5BC2 D6 03         [ 7] 3756 	sub	a, #0x03
   5BC4 D2 A5 5C      [10] 3757 	jp	NC,00130$
   5BC7 DD 6E 06      [19] 3758 	ld	l,6 (ix)
   5BCA DD 66 07      [19] 3759 	ld	h,7 (ix)
   5BCD 7E            [ 7] 3760 	ld	a,(hl)
   5BCE B7            [ 4] 3761 	or	a, a
   5BCF C2 A5 5C      [10] 3762 	jp	NZ,00130$
                           3763 ;src/main.c:203: player.bullets += 1;
   5BD2 1C            [ 4] 3764 	inc	e
   5BD3 FD 73 00      [19] 3765 	ld	0 (iy), e
                           3766 ;src/main.c:204: *flecha = 1;
   5BD6 36 01         [10] 3767 	ld	(hl),#0x01
   5BD8 C3 A5 5C      [10] 3768 	jp	00130$
   5BDB                    3769 00113$:
                           3770 ;src/main.c:206: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5BDB DD 7E F6      [19] 3771 	ld	a,-10 (ix)
   5BDE D6 09         [ 7] 3772 	sub	a, #0x09
   5BE0 CA 8B 5C      [10] 3773 	jp	Z,00107$
                           3774 ;src/main.c:207: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5BE3 DD 6E FB      [19] 3775 	ld	l,-5 (ix)
   5BE6 DD 66 FC      [19] 3776 	ld	h,-4 (ix)
   5BE9 DD 7E FD      [19] 3777 	ld	a,-3 (ix)
   5BEC B7            [ 4] 3778 	or	a, a
   5BED 28 02         [12] 3779 	jr	Z,00144$
   5BEF E1            [10] 3780 	pop	hl
   5BF0 E5            [11] 3781 	push	hl
   5BF1                    3782 00144$:
   5BF1 CB 2C         [ 8] 3783 	sra	h
   5BF3 CB 1D         [ 8] 3784 	rr	l
   5BF5 CB 2C         [ 8] 3785 	sra	h
   5BF7 CB 1D         [ 8] 3786 	rr	l
   5BF9 DD 5E F4      [19] 3787 	ld	e,-12 (ix)
   5BFC DD 56 F5      [19] 3788 	ld	d,-11 (ix)
   5BFF 19            [11] 3789 	add	hl,de
   5C00 7E            [ 7] 3790 	ld	a,(hl)
   5C01 D6 09         [ 7] 3791 	sub	a, #0x09
   5C03 CA 8B 5C      [10] 3792 	jp	Z,00107$
                           3793 ;src/main.c:208: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5C06 69            [ 4] 3794 	ld	l, c
   5C07 60            [ 4] 3795 	ld	h, b
   5C08 DD 7E F8      [19] 3796 	ld	a,-8 (ix)
   5C0B B7            [ 4] 3797 	or	a, a
   5C0C 28 06         [12] 3798 	jr	Z,00145$
   5C0E DD 6E F9      [19] 3799 	ld	l,-7 (ix)
   5C11 DD 66 FA      [19] 3800 	ld	h,-6 (ix)
   5C14                    3801 00145$:
   5C14 CB 2C         [ 8] 3802 	sra	h
   5C16 CB 1D         [ 8] 3803 	rr	l
   5C18 CB 2C         [ 8] 3804 	sra	h
   5C1A CB 1D         [ 8] 3805 	rr	l
   5C1C CB 2C         [ 8] 3806 	sra	h
   5C1E CB 1D         [ 8] 3807 	rr	l
   5C20 CB 2C         [ 8] 3808 	sra	h
   5C22 CB 1D         [ 8] 3809 	rr	l
   5C24 5D            [ 4] 3810 	ld	e, l
   5C25 54            [ 4] 3811 	ld	d, h
   5C26 29            [11] 3812 	add	hl, hl
   5C27 29            [11] 3813 	add	hl, hl
   5C28 19            [11] 3814 	add	hl, de
   5C29 29            [11] 3815 	add	hl, hl
   5C2A 29            [11] 3816 	add	hl, hl
   5C2B 11 25 65      [10] 3817 	ld	de,#_scene
   5C2E 19            [11] 3818 	add	hl,de
   5C2F DD 5E F7      [19] 3819 	ld	e,-9 (ix)
   5C32 16 00         [ 7] 3820 	ld	d,#0x00
   5C34 19            [11] 3821 	add	hl,de
   5C35 7E            [ 7] 3822 	ld	a,(hl)
   5C36 D6 09         [ 7] 3823 	sub	a, #0x09
   5C38 28 51         [12] 3824 	jr	Z,00107$
                           3825 ;src/main.c:209: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5C3A DD 7E F8      [19] 3826 	ld	a,-8 (ix)
   5C3D B7            [ 4] 3827 	or	a, a
   5C3E 28 06         [12] 3828 	jr	Z,00146$
   5C40 DD 4E F9      [19] 3829 	ld	c,-7 (ix)
   5C43 DD 46 FA      [19] 3830 	ld	b,-6 (ix)
   5C46                    3831 00146$:
   5C46 CB 28         [ 8] 3832 	sra	b
   5C48 CB 19         [ 8] 3833 	rr	c
   5C4A CB 28         [ 8] 3834 	sra	b
   5C4C CB 19         [ 8] 3835 	rr	c
   5C4E CB 28         [ 8] 3836 	sra	b
   5C50 CB 19         [ 8] 3837 	rr	c
   5C52 CB 28         [ 8] 3838 	sra	b
   5C54 CB 19         [ 8] 3839 	rr	c
   5C56 69            [ 4] 3840 	ld	l, c
   5C57 60            [ 4] 3841 	ld	h, b
   5C58 29            [11] 3842 	add	hl, hl
   5C59 29            [11] 3843 	add	hl, hl
   5C5A 09            [11] 3844 	add	hl, bc
   5C5B 29            [11] 3845 	add	hl, hl
   5C5C 29            [11] 3846 	add	hl, hl
   5C5D 3E 25         [ 7] 3847 	ld	a,#<(_scene)
   5C5F 85            [ 4] 3848 	add	a, l
   5C60 DD 77 F9      [19] 3849 	ld	-7 (ix),a
   5C63 3E 65         [ 7] 3850 	ld	a,#>(_scene)
   5C65 8C            [ 4] 3851 	adc	a, h
   5C66 DD 77 FA      [19] 3852 	ld	-6 (ix),a
   5C69 DD 6E FB      [19] 3853 	ld	l,-5 (ix)
   5C6C DD 66 FC      [19] 3854 	ld	h,-4 (ix)
   5C6F DD 7E FD      [19] 3855 	ld	a,-3 (ix)
   5C72 B7            [ 4] 3856 	or	a, a
   5C73 28 02         [12] 3857 	jr	Z,00147$
   5C75 E1            [10] 3858 	pop	hl
   5C76 E5            [11] 3859 	push	hl
   5C77                    3860 00147$:
   5C77 CB 2C         [ 8] 3861 	sra	h
   5C79 CB 1D         [ 8] 3862 	rr	l
   5C7B CB 2C         [ 8] 3863 	sra	h
   5C7D CB 1D         [ 8] 3864 	rr	l
   5C7F DD 5E F9      [19] 3865 	ld	e,-7 (ix)
   5C82 DD 56 FA      [19] 3866 	ld	d,-6 (ix)
   5C85 19            [11] 3867 	add	hl,de
   5C86 7E            [ 7] 3868 	ld	a,(hl)
   5C87 D6 09         [ 7] 3869 	sub	a, #0x09
   5C89 20 1A         [12] 3870 	jr	NZ,00130$
   5C8B                    3871 00107$:
                           3872 ;src/main.c:212: cpct_clearScreen(0);
   5C8B 21 00 40      [10] 3873 	ld	hl,#0x4000
   5C8E E5            [11] 3874 	push	hl
   5C8F AF            [ 4] 3875 	xor	a, a
   5C90 F5            [11] 3876 	push	af
   5C91 33            [ 6] 3877 	inc	sp
   5C92 26 C0         [ 7] 3878 	ld	h, #0xC0
   5C94 E5            [11] 3879 	push	hl
   5C95 CD 3C 63      [17] 3880 	call	_cpct_memset
                           3881 ;src/main.c:213: map+=1;
   5C98 21 17 66      [10] 3882 	ld	hl, #_map+0
   5C9B 34            [11] 3883 	inc	(hl)
                           3884 ;src/main.c:214: drawMap(map);
   5C9C 3A 17 66      [13] 3885 	ld	a,(_map)
   5C9F F5            [11] 3886 	push	af
   5CA0 33            [ 6] 3887 	inc	sp
   5CA1 CD C0 46      [17] 3888 	call	_drawMap
   5CA4 33            [ 6] 3889 	inc	sp
   5CA5                    3890 00130$:
   5CA5 DD F9         [10] 3891 	ld	sp, ix
   5CA7 DD E1         [14] 3892 	pop	ix
   5CA9 C9            [10] 3893 	ret
                           3894 ;src/main.c:218: u8 checkArrowCollisions(){
                           3895 ;	---------------------------------
                           3896 ; Function checkArrowCollisions
                           3897 ; ---------------------------------
   5CAA                    3898 _checkArrowCollisions::
   5CAA DD E5         [15] 3899 	push	ix
   5CAC DD 21 00 00   [14] 3900 	ld	ix,#0
   5CB0 DD 39         [15] 3901 	add	ix,sp
   5CB2 21 F4 FF      [10] 3902 	ld	hl,#-12
   5CB5 39            [11] 3903 	add	hl,sp
   5CB6 F9            [ 6] 3904 	ld	sp,hl
                           3905 ;src/main.c:219: u8 bound =0;
   5CB7 DD 36 F4 00   [19] 3906 	ld	-12 (ix),#0x00
                           3907 ;src/main.c:220: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5CBB 3A 1F 66      [13] 3908 	ld	a,(#(_object + 0x0001) + 0)
   5CBE DD 77 FD      [19] 3909 	ld	-3 (ix), a
   5CC1 07            [ 4] 3910 	rlca
   5CC2 07            [ 4] 3911 	rlca
   5CC3 07            [ 4] 3912 	rlca
   5CC4 07            [ 4] 3913 	rlca
   5CC5 E6 0F         [ 7] 3914 	and	a,#0x0F
   5CC7 4F            [ 4] 3915 	ld	c,a
   5CC8 06 00         [ 7] 3916 	ld	b,#0x00
   5CCA 69            [ 4] 3917 	ld	l, c
   5CCB 60            [ 4] 3918 	ld	h, b
   5CCC 29            [11] 3919 	add	hl, hl
   5CCD 29            [11] 3920 	add	hl, hl
   5CCE 09            [11] 3921 	add	hl, bc
   5CCF 29            [11] 3922 	add	hl, hl
   5CD0 29            [11] 3923 	add	hl, hl
   5CD1 3E 25         [ 7] 3924 	ld	a,#<(_scene)
   5CD3 85            [ 4] 3925 	add	a, l
   5CD4 DD 77 FE      [19] 3926 	ld	-2 (ix),a
   5CD7 3E 65         [ 7] 3927 	ld	a,#>(_scene)
   5CD9 8C            [ 4] 3928 	adc	a, h
   5CDA DD 77 FF      [19] 3929 	ld	-1 (ix),a
   5CDD 21 1E 66      [10] 3930 	ld	hl, #_object + 0
   5CE0 4E            [ 7] 3931 	ld	c,(hl)
   5CE1 79            [ 4] 3932 	ld	a,c
   5CE2 0F            [ 4] 3933 	rrca
   5CE3 0F            [ 4] 3934 	rrca
   5CE4 E6 3F         [ 7] 3935 	and	a,#0x3F
   5CE6 DD 77 FA      [19] 3936 	ld	-6 (ix),a
   5CE9 DD 7E FE      [19] 3937 	ld	a,-2 (ix)
   5CEC DD 86 FA      [19] 3938 	add	a, -6 (ix)
   5CEF 6F            [ 4] 3939 	ld	l,a
   5CF0 DD 7E FF      [19] 3940 	ld	a,-1 (ix)
   5CF3 CE 00         [ 7] 3941 	adc	a, #0x00
   5CF5 67            [ 4] 3942 	ld	h,a
   5CF6 7E            [ 7] 3943 	ld	a,(hl)
   5CF7 3D            [ 4] 3944 	dec	a
   5CF8 CA F5 5D      [10] 3945 	jp	Z,00101$
                           3946 ;src/main.c:221: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5CFB 06 00         [ 7] 3947 	ld	b,#0x00
   5CFD 21 03 00      [10] 3948 	ld	hl,#0x0003
   5D00 09            [11] 3949 	add	hl,bc
   5D01 DD 75 F8      [19] 3950 	ld	-8 (ix),l
   5D04 DD 74 F9      [19] 3951 	ld	-7 (ix),h
   5D07 DD 7E F8      [19] 3952 	ld	a,-8 (ix)
   5D0A DD 77 FB      [19] 3953 	ld	-5 (ix),a
   5D0D DD 7E F9      [19] 3954 	ld	a,-7 (ix)
   5D10 DD 77 FC      [19] 3955 	ld	-4 (ix),a
   5D13 DD 7E F9      [19] 3956 	ld	a,-7 (ix)
   5D16 07            [ 4] 3957 	rlca
   5D17 E6 01         [ 7] 3958 	and	a,#0x01
   5D19 DD 77 F5      [19] 3959 	ld	-11 (ix),a
   5D1C 21 06 00      [10] 3960 	ld	hl,#0x0006
   5D1F 09            [11] 3961 	add	hl,bc
   5D20 DD 75 F6      [19] 3962 	ld	-10 (ix),l
   5D23 DD 74 F7      [19] 3963 	ld	-9 (ix),h
   5D26 DD 7E F5      [19] 3964 	ld	a,-11 (ix)
   5D29 B7            [ 4] 3965 	or	a, a
   5D2A 28 0C         [12] 3966 	jr	Z,00108$
   5D2C DD 7E F6      [19] 3967 	ld	a,-10 (ix)
   5D2F DD 77 FB      [19] 3968 	ld	-5 (ix),a
   5D32 DD 7E F7      [19] 3969 	ld	a,-9 (ix)
   5D35 DD 77 FC      [19] 3970 	ld	-4 (ix),a
   5D38                    3971 00108$:
   5D38 DD 6E FB      [19] 3972 	ld	l,-5 (ix)
   5D3B DD 66 FC      [19] 3973 	ld	h,-4 (ix)
   5D3E CB 2C         [ 8] 3974 	sra	h
   5D40 CB 1D         [ 8] 3975 	rr	l
   5D42 CB 2C         [ 8] 3976 	sra	h
   5D44 CB 1D         [ 8] 3977 	rr	l
   5D46 DD 5E FE      [19] 3978 	ld	e,-2 (ix)
   5D49 DD 56 FF      [19] 3979 	ld	d,-1 (ix)
   5D4C 19            [11] 3980 	add	hl,de
   5D4D 7E            [ 7] 3981 	ld	a,(hl)
   5D4E 3D            [ 4] 3982 	dec	a
   5D4F CA F5 5D      [10] 3983 	jp	Z,00101$
                           3984 ;src/main.c:222: || scene[(object.y+tileheight-2)/tileheight][(object.x)/tilewidth] == 1
   5D52 DD 5E FD      [19] 3985 	ld	e,-3 (ix)
   5D55 16 00         [ 7] 3986 	ld	d,#0x00
   5D57 21 0E 00      [10] 3987 	ld	hl,#0x000E
   5D5A 19            [11] 3988 	add	hl,de
   5D5B 4D            [ 4] 3989 	ld	c,l
   5D5C 44            [ 4] 3990 	ld	b,h
   5D5D 69            [ 4] 3991 	ld	l, c
   5D5E 78            [ 4] 3992 	ld	a,b
   5D5F 67            [ 4] 3993 	ld	h,a
   5D60 07            [ 4] 3994 	rlca
   5D61 E6 01         [ 7] 3995 	and	a,#0x01
   5D63 DD 77 FB      [19] 3996 	ld	-5 (ix),a
   5D66 7B            [ 4] 3997 	ld	a,e
   5D67 C6 1D         [ 7] 3998 	add	a, #0x1D
   5D69 DD 77 FE      [19] 3999 	ld	-2 (ix),a
   5D6C 7A            [ 4] 4000 	ld	a,d
   5D6D CE 00         [ 7] 4001 	adc	a, #0x00
   5D6F DD 77 FF      [19] 4002 	ld	-1 (ix),a
   5D72 DD 7E FB      [19] 4003 	ld	a,-5 (ix)
   5D75 B7            [ 4] 4004 	or	a, a
   5D76 28 06         [12] 4005 	jr	Z,00109$
   5D78 DD 6E FE      [19] 4006 	ld	l,-2 (ix)
   5D7B DD 66 FF      [19] 4007 	ld	h,-1 (ix)
   5D7E                    4008 00109$:
   5D7E CB 2C         [ 8] 4009 	sra	h
   5D80 CB 1D         [ 8] 4010 	rr	l
   5D82 CB 2C         [ 8] 4011 	sra	h
   5D84 CB 1D         [ 8] 4012 	rr	l
   5D86 CB 2C         [ 8] 4013 	sra	h
   5D88 CB 1D         [ 8] 4014 	rr	l
   5D8A CB 2C         [ 8] 4015 	sra	h
   5D8C CB 1D         [ 8] 4016 	rr	l
   5D8E 5D            [ 4] 4017 	ld	e, l
   5D8F 54            [ 4] 4018 	ld	d, h
   5D90 29            [11] 4019 	add	hl, hl
   5D91 29            [11] 4020 	add	hl, hl
   5D92 19            [11] 4021 	add	hl, de
   5D93 29            [11] 4022 	add	hl, hl
   5D94 29            [11] 4023 	add	hl, hl
   5D95 11 25 65      [10] 4024 	ld	de,#_scene
   5D98 19            [11] 4025 	add	hl,de
   5D99 DD 5E FA      [19] 4026 	ld	e,-6 (ix)
   5D9C 16 00         [ 7] 4027 	ld	d,#0x00
   5D9E 19            [11] 4028 	add	hl,de
   5D9F 7E            [ 7] 4029 	ld	a,(hl)
   5DA0 3D            [ 4] 4030 	dec	a
   5DA1 28 52         [12] 4031 	jr	Z,00101$
                           4032 ;src/main.c:223: || scene[(object.y+tileheight-2)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5DA3 DD 7E FB      [19] 4033 	ld	a,-5 (ix)
   5DA6 B7            [ 4] 4034 	or	a, a
   5DA7 28 06         [12] 4035 	jr	Z,00110$
   5DA9 DD 4E FE      [19] 4036 	ld	c,-2 (ix)
   5DAC DD 46 FF      [19] 4037 	ld	b,-1 (ix)
   5DAF                    4038 00110$:
   5DAF CB 28         [ 8] 4039 	sra	b
   5DB1 CB 19         [ 8] 4040 	rr	c
   5DB3 CB 28         [ 8] 4041 	sra	b
   5DB5 CB 19         [ 8] 4042 	rr	c
   5DB7 CB 28         [ 8] 4043 	sra	b
   5DB9 CB 19         [ 8] 4044 	rr	c
   5DBB CB 28         [ 8] 4045 	sra	b
   5DBD CB 19         [ 8] 4046 	rr	c
   5DBF 69            [ 4] 4047 	ld	l, c
   5DC0 60            [ 4] 4048 	ld	h, b
   5DC1 29            [11] 4049 	add	hl, hl
   5DC2 29            [11] 4050 	add	hl, hl
   5DC3 09            [11] 4051 	add	hl, bc
   5DC4 29            [11] 4052 	add	hl, hl
   5DC5 29            [11] 4053 	add	hl, hl
   5DC6 3E 25         [ 7] 4054 	ld	a,#<(_scene)
   5DC8 85            [ 4] 4055 	add	a, l
   5DC9 DD 77 FB      [19] 4056 	ld	-5 (ix),a
   5DCC 3E 65         [ 7] 4057 	ld	a,#>(_scene)
   5DCE 8C            [ 4] 4058 	adc	a, h
   5DCF DD 77 FC      [19] 4059 	ld	-4 (ix),a
   5DD2 DD 6E F8      [19] 4060 	ld	l,-8 (ix)
   5DD5 DD 66 F9      [19] 4061 	ld	h,-7 (ix)
   5DD8 DD 7E F5      [19] 4062 	ld	a,-11 (ix)
   5DDB B7            [ 4] 4063 	or	a, a
   5DDC 28 04         [12] 4064 	jr	Z,00111$
   5DDE C1            [10] 4065 	pop	bc
   5DDF E1            [10] 4066 	pop	hl
   5DE0 E5            [11] 4067 	push	hl
   5DE1 C5            [11] 4068 	push	bc
   5DE2                    4069 00111$:
   5DE2 CB 2C         [ 8] 4070 	sra	h
   5DE4 CB 1D         [ 8] 4071 	rr	l
   5DE6 CB 2C         [ 8] 4072 	sra	h
   5DE8 CB 1D         [ 8] 4073 	rr	l
   5DEA DD 5E FB      [19] 4074 	ld	e,-5 (ix)
   5DED DD 56 FC      [19] 4075 	ld	d,-4 (ix)
   5DF0 19            [11] 4076 	add	hl,de
   5DF1 7E            [ 7] 4077 	ld	a,(hl)
   5DF2 3D            [ 4] 4078 	dec	a
   5DF3 20 10         [12] 4079 	jr	NZ,00102$
   5DF5                    4080 00101$:
                           4081 ;src/main.c:225: object.x=object.lx;
   5DF5 3A 20 66      [13] 4082 	ld	a, (#_object + 2)
   5DF8 32 1E 66      [13] 4083 	ld	(#_object),a
                           4084 ;src/main.c:226: object.y=object.ly;
   5DFB 3A 21 66      [13] 4085 	ld	a, (#_object + 3)
   5DFE 32 1F 66      [13] 4086 	ld	(#(_object + 0x0001)),a
                           4087 ;src/main.c:227: bound = 1;
   5E01 DD 36 F4 01   [19] 4088 	ld	-12 (ix),#0x01
   5E05                    4089 00102$:
                           4090 ;src/main.c:230: return bound;
   5E05 DD 6E F4      [19] 4091 	ld	l,-12 (ix)
   5E08 DD F9         [10] 4092 	ld	sp, ix
   5E0A DD E1         [14] 4093 	pop	ix
   5E0C C9            [10] 4094 	ret
                           4095 ;src/main.c:236: void move(){
                           4096 ;	---------------------------------
                           4097 ; Function move
                           4098 ; ---------------------------------
   5E0D                    4099 _move::
                           4100 ;src/main.c:239: }
   5E0D C9            [10] 4101 	ret
                           4102 ;src/main.c:243: void game(){
                           4103 ;	---------------------------------
                           4104 ; Function game
                           4105 ; ---------------------------------
   5E0E                    4106 _game::
   5E0E DD E5         [15] 4107 	push	ix
   5E10 DD 21 00 00   [14] 4108 	ld	ix,#0
   5E14 DD 39         [15] 4109 	add	ix,sp
   5E16 21 F5 FF      [10] 4110 	ld	hl,#-11
   5E19 39            [11] 4111 	add	hl,sp
   5E1A F9            [ 6] 4112 	ld	sp,hl
                           4113 ;src/main.c:244: TNivel n = {0,0,0};
   5E1B 21 00 00      [10] 4114 	ld	hl,#0x0000
   5E1E 39            [11] 4115 	add	hl,sp
   5E1F 36 00         [10] 4116 	ld	(hl),#0x00
   5E21 21 00 00      [10] 4117 	ld	hl,#0x0000
   5E24 39            [11] 4118 	add	hl,sp
   5E25 5D            [ 4] 4119 	ld	e, l
   5E26 54            [ 4] 4120 	ld	d, h
   5E27 23            [ 6] 4121 	inc	hl
   5E28 DD 75 FA      [19] 4122 	ld	-6 (ix),l
   5E2B DD 74 FB      [19] 4123 	ld	-5 (ix),h
   5E2E DD 6E FA      [19] 4124 	ld	l,-6 (ix)
   5E31 DD 66 FB      [19] 4125 	ld	h,-5 (ix)
   5E34 36 00         [10] 4126 	ld	(hl),#0x00
   5E36 13            [ 6] 4127 	inc	de
   5E37 13            [ 6] 4128 	inc	de
   5E38 DD 73 FC      [19] 4129 	ld	-4 (ix),e
   5E3B DD 72 FD      [19] 4130 	ld	-3 (ix),d
   5E3E DD 6E FC      [19] 4131 	ld	l,-4 (ix)
   5E41 DD 66 FD      [19] 4132 	ld	h,-3 (ix)
   5E44 36 00         [10] 4133 	ld	(hl),#0x00
                           4134 ;src/main.c:245: bound =0;
   5E46 21 1C 66      [10] 4135 	ld	hl,#_bound + 0
   5E49 36 00         [10] 4136 	ld	(hl), #0x00
                           4137 ;src/main.c:246: temp = 0;
   5E4B 21 00 00      [10] 4138 	ld	hl,#0x0000
   5E4E 22 15 66      [16] 4139 	ld	(_temp),hl
                           4140 ;src/main.c:247: map = 1;
   5E51 21 17 66      [10] 4141 	ld	hl,#_map + 0
   5E54 36 01         [10] 4142 	ld	(hl), #0x01
                           4143 ;src/main.c:248: arrow =0;
   5E56 21 1A 66      [10] 4144 	ld	hl,#_arrow + 0
   5E59 36 00         [10] 4145 	ld	(hl), #0x00
                           4146 ;src/main.c:249: finish =0;
   5E5B 21 19 66      [10] 4147 	ld	hl,#_finish + 0
   5E5E 36 00         [10] 4148 	ld	(hl), #0x00
                           4149 ;src/main.c:250: following =0;
   5E60 21 1B 66      [10] 4150 	ld	hl,#_following + 0
   5E63 36 00         [10] 4151 	ld	(hl), #0x00
                           4152 ;src/main.c:251: archer = 0;
   5E65 21 1D 66      [10] 4153 	ld	hl,#_archer + 0
   5E68 36 00         [10] 4154 	ld	(hl), #0x00
                           4155 ;src/main.c:253: initPlayer();
   5E6A CD C7 53      [17] 4156 	call	_initPlayer
                           4157 ;src/main.c:254: initEnemies();
   5E6D CD FD 53      [17] 4158 	call	_initEnemies
                           4159 ;src/main.c:256: cpct_clearScreen(0);
   5E70 21 00 40      [10] 4160 	ld	hl,#0x4000
   5E73 E5            [11] 4161 	push	hl
   5E74 AF            [ 4] 4162 	xor	a, a
   5E75 F5            [11] 4163 	push	af
   5E76 33            [ 6] 4164 	inc	sp
   5E77 26 C0         [ 7] 4165 	ld	h, #0xC0
   5E79 E5            [11] 4166 	push	hl
   5E7A CD 3C 63      [17] 4167 	call	_cpct_memset
                           4168 ;src/main.c:257: drawMap(map);
   5E7D 3A 17 66      [13] 4169 	ld	a,(_map)
   5E80 F5            [11] 4170 	push	af
   5E81 33            [ 6] 4171 	inc	sp
   5E82 CD C0 46      [17] 4172 	call	_drawMap
   5E85 33            [ 6] 4173 	inc	sp
                           4174 ;src/main.c:263: while (1){
   5E86 DD 7E FC      [19] 4175 	ld	a,-4 (ix)
   5E89 DD 77 F8      [19] 4176 	ld	-8 (ix),a
   5E8C DD 7E FD      [19] 4177 	ld	a,-3 (ix)
   5E8F DD 77 F9      [19] 4178 	ld	-7 (ix),a
   5E92 DD 7E FA      [19] 4179 	ld	a,-6 (ix)
   5E95 DD 77 FE      [19] 4180 	ld	-2 (ix),a
   5E98 DD 7E FB      [19] 4181 	ld	a,-5 (ix)
   5E9B DD 77 FF      [19] 4182 	ld	-1 (ix),a
   5E9E                    4183 00112$:
                           4184 ;src/main.c:266: cpct_waitVSYNC();
   5E9E CD 22 63      [17] 4185 	call	_cpct_waitVSYNC
                           4186 ;src/main.c:269: erases();
   5EA1 CD 19 4D      [17] 4187 	call	_erases
                           4188 ;src/main.c:272: drawPickUps(n.corazon,n.bullet);
   5EA4 DD 6E FC      [19] 4189 	ld	l,-4 (ix)
   5EA7 DD 66 FD      [19] 4190 	ld	h,-3 (ix)
   5EAA 46            [ 7] 4191 	ld	b,(hl)
   5EAB DD 6E FA      [19] 4192 	ld	l,-6 (ix)
   5EAE DD 66 FB      [19] 4193 	ld	h,-5 (ix)
   5EB1 4E            [ 7] 4194 	ld	c, (hl)
   5EB2 C5            [11] 4195 	push	bc
   5EB3 CD A4 4E      [17] 4196 	call	_drawPickUps
   5EB6 F1            [10] 4197 	pop	af
                           4198 ;src/main.c:275: draws();
   5EB7 CD 79 4C      [17] 4199 	call	_draws
                           4200 ;src/main.c:278: if(player.atk < 20) drawFatiga(player.atk,2);
   5EBA 21 30 66      [10] 4201 	ld	hl, #(_player + 0x0008) + 0
   5EBD 56            [ 7] 4202 	ld	d,(hl)
   5EBE 7A            [ 4] 4203 	ld	a,d
   5EBF D6 14         [ 7] 4204 	sub	a, #0x14
   5EC1 30 0C         [12] 4205 	jr	NC,00105$
   5EC3 3E 02         [ 7] 4206 	ld	a,#0x02
   5EC5 F5            [11] 4207 	push	af
   5EC6 33            [ 6] 4208 	inc	sp
   5EC7 D5            [11] 4209 	push	de
   5EC8 33            [ 6] 4210 	inc	sp
   5EC9 CD 7E 4D      [17] 4211 	call	_drawFatiga
   5ECC F1            [10] 4212 	pop	af
   5ECD 18 1A         [12] 4213 	jr	00106$
   5ECF                    4214 00105$:
                           4215 ;src/main.c:279: else if(player.atk > 20) drawFatiga(player.atk,1);
   5ECF 3E 14         [ 7] 4216 	ld	a,#0x14
   5ED1 92            [ 4] 4217 	sub	a, d
   5ED2 30 0C         [12] 4218 	jr	NC,00102$
   5ED4 3E 01         [ 7] 4219 	ld	a,#0x01
   5ED6 F5            [11] 4220 	push	af
   5ED7 33            [ 6] 4221 	inc	sp
   5ED8 D5            [11] 4222 	push	de
   5ED9 33            [ 6] 4223 	inc	sp
   5EDA CD 7E 4D      [17] 4224 	call	_drawFatiga
   5EDD F1            [10] 4225 	pop	af
   5EDE 18 09         [12] 4226 	jr	00106$
   5EE0                    4227 00102$:
                           4228 ;src/main.c:280: else drawFatiga(player.atk,0);
   5EE0 AF            [ 4] 4229 	xor	a, a
   5EE1 F5            [11] 4230 	push	af
   5EE2 33            [ 6] 4231 	inc	sp
   5EE3 D5            [11] 4232 	push	de
   5EE4 33            [ 6] 4233 	inc	sp
   5EE5 CD 7E 4D      [17] 4234 	call	_drawFatiga
   5EE8 F1            [10] 4235 	pop	af
   5EE9                    4236 00106$:
                           4237 ;src/main.c:283: player.lx = player.x;
   5EE9 3A 28 66      [13] 4238 	ld	a, (#_player + 0)
   5EEC 21 2A 66      [10] 4239 	ld	hl,#(_player + 0x0002)
   5EEF 77            [ 7] 4240 	ld	(hl),a
                           4241 ;src/main.c:284: player.ly = player.y;
   5EF0 3A 29 66      [13] 4242 	ld	a, (#_player + 1)
   5EF3 32 2B 66      [13] 4243 	ld	(#(_player + 0x0003)),a
                           4244 ;src/main.c:285: enemy.lx = enemy.x;
   5EF6 3A 33 66      [13] 4245 	ld	a, (#_enemy + 0)
   5EF9 32 35 66      [13] 4246 	ld	(#(_enemy + 0x0002)),a
                           4247 ;src/main.c:286: enemy.ly = enemy.y;
   5EFC 3A 34 66      [13] 4248 	ld	a, (#_enemy + 1)
   5EFF 21 36 66      [10] 4249 	ld	hl,#(_enemy + 0x0003)
   5F02 77            [ 7] 4250 	ld	(hl),a
                           4251 ;src/main.c:287: player.latk = player.atk;
   5F03 3A 30 66      [13] 4252 	ld	a, (#(_player + 0x0008) + 0)
   5F06 32 31 66      [13] 4253 	ld	(#(_player + 0x0009)),a
                           4254 ;src/main.c:292: cpct_scanKeyboard_f();
   5F09 CD 12 61      [17] 4255 	call	_cpct_scanKeyboard_f
                           4256 ;src/main.c:293: player.sprite = checkKeyboard();
   5F0C CD F6 50      [17] 4257 	call	_checkKeyboard
   5F0F 5D            [ 4] 4258 	ld	e,l
   5F10 54            [ 4] 4259 	ld	d,h
   5F11 ED 53 2C 66   [20] 4260 	ld	((_player + 0x0004)), de
                           4261 ;src/main.c:294: checkBoundsCollisions(&n.corazon,&n.bullet);
   5F15 DD 5E F8      [19] 4262 	ld	e,-8 (ix)
   5F18 DD 56 F9      [19] 4263 	ld	d,-7 (ix)
   5F1B DD 6E FE      [19] 4264 	ld	l,-2 (ix)
   5F1E DD 66 FF      [19] 4265 	ld	h,-1 (ix)
   5F21 D5            [11] 4266 	push	de
   5F22 E5            [11] 4267 	push	hl
   5F23 CD D9 58      [17] 4268 	call	_checkBoundsCollisions
   5F26 F1            [10] 4269 	pop	af
   5F27 F1            [10] 4270 	pop	af
                           4271 ;src/main.c:296: move();
   5F28 CD 0D 5E      [17] 4272 	call	_move
                           4273 ;src/main.c:298: if(arrow == 1){
   5F2B 3A 1A 66      [13] 4274 	ld	a,(#_arrow + 0)
   5F2E 3D            [ 4] 4275 	dec	a
   5F2F 20 0D         [12] 4276 	jr	NZ,00108$
                           4277 ;src/main.c:299: moveObject();
   5F31 CD 6D 53      [17] 4278 	call	_moveObject
                           4279 ;src/main.c:300: bound = checkArrowCollisions();
   5F34 CD AA 5C      [17] 4280 	call	_checkArrowCollisions
   5F37 FD 21 1C 66   [14] 4281 	ld	iy,#_bound
   5F3B FD 75 00      [19] 4282 	ld	0 (iy),l
   5F3E                    4283 00108$:
                           4284 ;src/main.c:305: if(finish == 1) return;
   5F3E 3A 19 66      [13] 4285 	ld	a,(#_finish + 0)
   5F41 3D            [ 4] 4286 	dec	a
   5F42 C2 9E 5E      [10] 4287 	jp	NZ,00112$
   5F45 DD F9         [10] 4288 	ld	sp, ix
   5F47 DD E1         [14] 4289 	pop	ix
   5F49 C9            [10] 4290 	ret
                           4291 ;src/main.c:312: void credits(){
                           4292 ;	---------------------------------
                           4293 ; Function credits
                           4294 ; ---------------------------------
   5F4A                    4295 _credits::
                           4296 ;src/main.c:314: cpct_clearScreen(0);
   5F4A 21 00 40      [10] 4297 	ld	hl,#0x4000
   5F4D E5            [11] 4298 	push	hl
   5F4E AF            [ 4] 4299 	xor	a, a
   5F4F F5            [11] 4300 	push	af
   5F50 33            [ 6] 4301 	inc	sp
   5F51 26 C0         [ 7] 4302 	ld	h, #0xC0
   5F53 E5            [11] 4303 	push	hl
   5F54 CD 3C 63      [17] 4304 	call	_cpct_memset
                           4305 ;src/main.c:315: memptr = cpct_getScreenPtr(VMEM,10,10);
   5F57 21 0A 0A      [10] 4306 	ld	hl,#0x0A0A
   5F5A E5            [11] 4307 	push	hl
   5F5B 21 00 C0      [10] 4308 	ld	hl,#0xC000
   5F5E E5            [11] 4309 	push	hl
   5F5F CD 2F 64      [17] 4310 	call	_cpct_getScreenPtr
                           4311 ;src/main.c:316: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5F62 EB            [ 4] 4312 	ex	de,hl
   5F63 01 AC 5F      [10] 4313 	ld	bc,#___str_5
   5F66 D5            [11] 4314 	push	de
   5F67 21 01 00      [10] 4315 	ld	hl,#0x0001
   5F6A E5            [11] 4316 	push	hl
   5F6B D5            [11] 4317 	push	de
   5F6C C5            [11] 4318 	push	bc
   5F6D CD F3 61      [17] 4319 	call	_cpct_drawStringM0
   5F70 21 06 00      [10] 4320 	ld	hl,#6
   5F73 39            [11] 4321 	add	hl,sp
   5F74 F9            [ 6] 4322 	ld	sp,hl
   5F75 D1            [10] 4323 	pop	de
                           4324 ;src/main.c:318: while (1){
   5F76                    4325 00104$:
                           4326 ;src/main.c:320: cpct_scanKeyboard_f();
   5F76 D5            [11] 4327 	push	de
   5F77 CD 12 61      [17] 4328 	call	_cpct_scanKeyboard_f
   5F7A D1            [10] 4329 	pop	de
                           4330 ;src/main.c:321: cpct_drawStringM0("Josep Domenech Mingot",memptr,1,0);
   5F7B 01 BD 5F      [10] 4331 	ld	bc,#___str_6
   5F7E D5            [11] 4332 	push	de
   5F7F 21 01 00      [10] 4333 	ld	hl,#0x0001
   5F82 E5            [11] 4334 	push	hl
   5F83 D5            [11] 4335 	push	de
   5F84 C5            [11] 4336 	push	bc
   5F85 CD F3 61      [17] 4337 	call	_cpct_drawStringM0
   5F88 21 06 00      [10] 4338 	ld	hl,#6
   5F8B 39            [11] 4339 	add	hl,sp
   5F8C F9            [ 6] 4340 	ld	sp,hl
   5F8D D1            [10] 4341 	pop	de
                           4342 ;src/main.c:322: cpct_drawStringM0("Alberto Martinez Martinez",memptr,1,0);
   5F8E 01 D3 5F      [10] 4343 	ld	bc,#___str_7
   5F91 D5            [11] 4344 	push	de
   5F92 21 01 00      [10] 4345 	ld	hl,#0x0001
   5F95 E5            [11] 4346 	push	hl
   5F96 D5            [11] 4347 	push	de
   5F97 C5            [11] 4348 	push	bc
   5F98 CD F3 61      [17] 4349 	call	_cpct_drawStringM0
   5F9B 21 06 00      [10] 4350 	ld	hl,#6
   5F9E 39            [11] 4351 	add	hl,sp
   5F9F F9            [ 6] 4352 	ld	sp,hl
   5FA0 21 08 04      [10] 4353 	ld	hl,#0x0408
   5FA3 CD 06 61      [17] 4354 	call	_cpct_isKeyPressed
   5FA6 7D            [ 4] 4355 	ld	a,l
   5FA7 D1            [10] 4356 	pop	de
   5FA8 B7            [ 4] 4357 	or	a, a
   5FA9 28 CB         [12] 4358 	jr	Z,00104$
                           4359 ;src/main.c:326: return;
   5FAB C9            [10] 4360 	ret
   5FAC                    4361 ___str_5:
   5FAC 4C 6F 75 6E 67 65  4362 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5FBC 00                 4363 	.db 0x00
   5FBD                    4364 ___str_6:
   5FBD 4A 6F 73 65 70 20  4365 	.ascii "Josep Domenech Mingot"
        44 6F 6D 65 6E 65
        63 68 20 4D 69 6E
        67 6F 74
   5FD2 00                 4366 	.db 0x00
   5FD3                    4367 ___str_7:
   5FD3 41 6C 62 65 72 74  4368 	.ascii "Alberto Martinez Martinez"
        6F 20 4D 61 72 74
        69 6E 65 7A 20 4D
        61 72 74 69 6E 65
        7A
   5FEC 00                 4369 	.db 0x00
                           4370 ;src/main.c:336: void main(void) {
                           4371 ;	---------------------------------
                           4372 ; Function main
                           4373 ; ---------------------------------
   5FED                    4374 _main::
                           4375 ;src/main.c:340: init();
   5FED CD A2 53      [17] 4376 	call	_init
                           4377 ;src/main.c:343: while(1){
   5FF0                    4378 00106$:
                           4379 ;src/main.c:344: x=menu();
   5FF0 CD 73 54      [17] 4380 	call	_menu
   5FF3 5D            [ 4] 4381 	ld	e, l
   5FF4 54            [ 4] 4382 	ld	d, h
                           4383 ;src/main.c:345: switch(x){
   5FF5 CB 7A         [ 8] 4384 	bit	7, d
   5FF7 20 F7         [12] 4385 	jr	NZ,00106$
   5FF9 3E 02         [ 7] 4386 	ld	a,#0x02
   5FFB BB            [ 4] 4387 	cp	a, e
   5FFC 3E 00         [ 7] 4388 	ld	a,#0x00
   5FFE 9A            [ 4] 4389 	sbc	a, d
   5FFF E2 04 60      [10] 4390 	jp	PO, 00122$
   6002 EE 80         [ 7] 4391 	xor	a, #0x80
   6004                    4392 00122$:
   6004 FA F0 5F      [10] 4393 	jp	M,00106$
   6007 16 00         [ 7] 4394 	ld	d,#0x00
   6009 21 0F 60      [10] 4395 	ld	hl,#00123$
   600C 19            [11] 4396 	add	hl,de
   600D 19            [11] 4397 	add	hl,de
                           4398 ;src/main.c:346: case 0: return;break;
                           4399 ;src/main.c:347: case 1: game(); break;
   600E E9            [ 4] 4400 	jp	(hl)
   600F                    4401 00123$:
   600F 18 10         [12] 4402 	jr	00108$
   6011 18 04         [12] 4403 	jr	00102$
   6013 18 07         [12] 4404 	jr	00103$
   6015 18 0A         [12] 4405 	jr	00108$
   6017                    4406 00102$:
   6017 CD 0E 5E      [17] 4407 	call	_game
   601A 18 D4         [12] 4408 	jr	00106$
                           4409 ;src/main.c:348: case 2: credits();break;
   601C                    4410 00103$:
   601C CD 4A 5F      [17] 4411 	call	_credits
                           4412 ;src/main.c:349: }
   601F 18 CF         [12] 4413 	jr	00106$
   6021                    4414 00108$:
   6021 C9            [10] 4415 	ret
                           4416 	.area _CODE
                           4417 	.area _INITIALIZER
                           4418 	.area _CABS (ABS)
