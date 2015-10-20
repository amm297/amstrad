                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct 20 10:19:59 2015
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
                             15 	.globl _checkArrowCollisions
                             16 	.globl _checkBoundsCollisions
                             17 	.globl _checkBoundsCollisionsEnemy
                             18 	.globl _menu
                             19 	.globl _gameOver
                             20 	.globl _initEnemies
                             21 	.globl _initPlayer
                             22 	.globl _init
                             23 	.globl _moveObject
                             24 	.globl _checkKeyboard
                             25 	.globl _checkCollisions
                             26 	.globl _drawBullets
                             27 	.globl _drawVida
                             28 	.globl _drawPickUps
                             29 	.globl _drawFatiga
                             30 	.globl _erases
                             31 	.globl _draws
                             32 	.globl _erase
                             33 	.globl _draw
                             34 	.globl _drawMap
                             35 	.globl _cpct_getScreenPtr
                             36 	.globl _cpct_setPalette
                             37 	.globl _cpct_fw2hw
                             38 	.globl _cpct_waitVSYNC
                             39 	.globl _cpct_setVideoMode
                             40 	.globl _cpct_drawStringM0
                             41 	.globl _cpct_drawSolidBox
                             42 	.globl _cpct_drawSpriteMasked
                             43 	.globl _cpct_isKeyPressed
                             44 	.globl _cpct_scanKeyboard_f
                             45 	.globl _cpct_scanKeyboard
                             46 	.globl _cpct_memset
                             47 	.globl _cpct_disableFirmware
                             48 	.globl _enemy
                             49 	.globl _player
                             50 	.globl _object
                             51 	.globl _archer
                             52 	.globl _bound
                             53 	.globl _following
                             54 	.globl _arrow
                             55 	.globl _finish
                             56 	.globl _path
                             57 	.globl _map
                             58 	.globl _temp
                             59 	.globl _scene
                             60 	.globl _mapa2
                             61 	.globl _mapa1
                             62 	.globl _origins
                             63 	.globl _g_palette
                             64 ;--------------------------------------------------------
                             65 ; special function registers
                             66 ;--------------------------------------------------------
                             67 ;--------------------------------------------------------
                             68 ; ram data
                             69 ;--------------------------------------------------------
                             70 	.area _DATA
   643C                      71 _scene::
   643C                      72 	.ds 240
   652C                      73 _temp::
   652C                      74 	.ds 2
   652E                      75 _map::
   652E                      76 	.ds 1
   652F                      77 _path::
   652F                      78 	.ds 1
   6530                      79 _finish::
   6530                      80 	.ds 1
   6531                      81 _arrow::
   6531                      82 	.ds 1
   6532                      83 _following::
   6532                      84 	.ds 1
   6533                      85 _bound::
   6533                      86 	.ds 1
   6534                      87 _archer::
   6534                      88 	.ds 1
   6535                      89 _object::
   6535                      90 	.ds 10
   653F                      91 _player::
   653F                      92 	.ds 11
   654A                      93 _enemy::
   654A                      94 	.ds 12
                             95 ;--------------------------------------------------------
                             96 ; ram data
                             97 ;--------------------------------------------------------
                             98 	.area _INITIALIZED
                             99 ;--------------------------------------------------------
                            100 ; absolute external ram data
                            101 ;--------------------------------------------------------
                            102 	.area _DABS (ABS)
                            103 ;--------------------------------------------------------
                            104 ; global & static initialisations
                            105 ;--------------------------------------------------------
                            106 	.area _HOME
                            107 	.area _GSINIT
                            108 	.area _GSFINAL
                            109 	.area _GSINIT
                            110 ;--------------------------------------------------------
                            111 ; Home
                            112 ;--------------------------------------------------------
                            113 	.area _HOME
                            114 	.area _HOME
                            115 ;--------------------------------------------------------
                            116 ; code
                            117 ;--------------------------------------------------------
                            118 	.area _CODE
                            119 ;src/draws.h:14: void drawMap(u8 t){
                            120 ;	---------------------------------
                            121 ; Function drawMap
                            122 ; ---------------------------------
   46C0                     123 _drawMap::
   46C0 DD E5         [15]  124 	push	ix
   46C2 DD 21 00 00   [14]  125 	ld	ix,#0
   46C6 DD 39         [15]  126 	add	ix,sp
   46C8 21 EE FF      [10]  127 	ld	hl,#-18
   46CB 39            [11]  128 	add	hl,sp
   46CC F9            [ 6]  129 	ld	sp,hl
                            130 ;src/draws.h:18: if(t == 1){
   46CD DD 7E 04      [19]  131 	ld	a,4 (ix)
   46D0 3D            [ 4]  132 	dec	a
   46D1 C2 79 47      [10]  133 	jp	NZ,00104$
                            134 ;src/draws.h:19: for(y=0;y<height;y++){
   46D4 21 00 00      [10]  135 	ld	hl,#0x0000
   46D7 E3            [19]  136 	ex	(sp), hl
   46D8 DD 36 FC 00   [19]  137 	ld	-4 (ix),#0x00
   46DC DD 36 FD 00   [19]  138 	ld	-3 (ix),#0x00
                            139 ;src/draws.h:20: for(x=0;x<width;x++){
   46E0                     140 00130$:
   46E0 3E 3C         [ 7]  141 	ld	a,#<(_scene)
   46E2 DD 86 FC      [19]  142 	add	a, -4 (ix)
   46E5 DD 77 F8      [19]  143 	ld	-8 (ix),a
   46E8 3E 64         [ 7]  144 	ld	a,#>(_scene)
   46EA DD 8E FD      [19]  145 	adc	a, -3 (ix)
   46ED DD 77 F9      [19]  146 	ld	-7 (ix),a
   46F0 3E E2         [ 7]  147 	ld	a,#<(_mapa1)
   46F2 DD 86 FC      [19]  148 	add	a, -4 (ix)
   46F5 DD 77 F6      [19]  149 	ld	-10 (ix),a
   46F8 3E 48         [ 7]  150 	ld	a,#>(_mapa1)
   46FA DD 8E FD      [19]  151 	adc	a, -3 (ix)
   46FD DD 77 F7      [19]  152 	ld	-9 (ix),a
   4700 DD 36 F0 00   [19]  153 	ld	-16 (ix),#0x00
   4704 DD 36 F1 00   [19]  154 	ld	-15 (ix),#0x00
   4708                     155 00115$:
                            156 ;src/draws.h:21: scene[y][x] = mapa1[y][x];
   4708 DD 7E F8      [19]  157 	ld	a,-8 (ix)
   470B DD 86 F0      [19]  158 	add	a, -16 (ix)
   470E DD 77 FA      [19]  159 	ld	-6 (ix),a
   4711 DD 7E F9      [19]  160 	ld	a,-7 (ix)
   4714 DD 8E F1      [19]  161 	adc	a, -15 (ix)
   4717 DD 77 FB      [19]  162 	ld	-5 (ix),a
   471A DD 7E F6      [19]  163 	ld	a,-10 (ix)
   471D DD 86 F0      [19]  164 	add	a, -16 (ix)
   4720 DD 77 FE      [19]  165 	ld	-2 (ix),a
   4723 DD 7E F7      [19]  166 	ld	a,-9 (ix)
   4726 DD 8E F1      [19]  167 	adc	a, -15 (ix)
   4729 DD 77 FF      [19]  168 	ld	-1 (ix),a
   472C DD 6E FE      [19]  169 	ld	l,-2 (ix)
   472F DD 66 FF      [19]  170 	ld	h,-1 (ix)
   4732 7E            [ 7]  171 	ld	a,(hl)
   4733 DD 6E FA      [19]  172 	ld	l,-6 (ix)
   4736 DD 66 FB      [19]  173 	ld	h,-5 (ix)
   4739 77            [ 7]  174 	ld	(hl),a
                            175 ;src/draws.h:20: for(x=0;x<width;x++){
   473A DD 34 F0      [23]  176 	inc	-16 (ix)
   473D 20 03         [12]  177 	jr	NZ,00189$
   473F DD 34 F1      [23]  178 	inc	-15 (ix)
   4742                     179 00189$:
   4742 DD 7E F0      [19]  180 	ld	a,-16 (ix)
   4745 D6 14         [ 7]  181 	sub	a, #0x14
   4747 DD 7E F1      [19]  182 	ld	a,-15 (ix)
   474A 17            [ 4]  183 	rla
   474B 3F            [ 4]  184 	ccf
   474C 1F            [ 4]  185 	rra
   474D DE 80         [ 7]  186 	sbc	a, #0x80
   474F 38 B7         [12]  187 	jr	C,00115$
                            188 ;src/draws.h:19: for(y=0;y<height;y++){
   4751 DD 7E FC      [19]  189 	ld	a,-4 (ix)
   4754 C6 14         [ 7]  190 	add	a, #0x14
   4756 DD 77 FC      [19]  191 	ld	-4 (ix),a
   4759 DD 7E FD      [19]  192 	ld	a,-3 (ix)
   475C CE 00         [ 7]  193 	adc	a, #0x00
   475E DD 77 FD      [19]  194 	ld	-3 (ix),a
   4761 DD 34 EE      [23]  195 	inc	-18 (ix)
   4764 20 03         [12]  196 	jr	NZ,00190$
   4766 DD 34 EF      [23]  197 	inc	-17 (ix)
   4769                     198 00190$:
   4769 DD 7E EE      [19]  199 	ld	a,-18 (ix)
   476C D6 0C         [ 7]  200 	sub	a, #0x0C
   476E DD 7E EF      [19]  201 	ld	a,-17 (ix)
   4771 17            [ 4]  202 	rla
   4772 3F            [ 4]  203 	ccf
   4773 1F            [ 4]  204 	rra
   4774 DE 80         [ 7]  205 	sbc	a, #0x80
   4776 DA E0 46      [10]  206 	jp	C,00130$
   4779                     207 00104$:
                            208 ;src/draws.h:26: if(t == 2){
   4779 DD 7E 04      [19]  209 	ld	a,4 (ix)
   477C D6 02         [ 7]  210 	sub	a, #0x02
   477E 20 5F         [12]  211 	jr	NZ,00141$
                            212 ;src/draws.h:27: for(y=0;y<height;y++){
   4780 21 00 00      [10]  213 	ld	hl,#0x0000
   4783 E3            [19]  214 	ex	(sp), hl
   4784 11 00 00      [10]  215 	ld	de,#0x0000
                            216 ;src/draws.h:28: for(x=0;x<width;x++){
   4787                     217 00134$:
   4787 21 3C 64      [10]  218 	ld	hl,#_scene
   478A 19            [11]  219 	add	hl,de
   478B DD 75 FE      [19]  220 	ld	-2 (ix),l
   478E DD 74 FF      [19]  221 	ld	-1 (ix),h
   4791 21 D2 49      [10]  222 	ld	hl,#_mapa2
   4794 19            [11]  223 	add	hl,de
   4795 DD 75 FA      [19]  224 	ld	-6 (ix),l
   4798 DD 74 FB      [19]  225 	ld	-5 (ix),h
   479B 01 00 00      [10]  226 	ld	bc,#0x0000
   479E                     227 00119$:
                            228 ;src/draws.h:29: scene[y][x] = mapa2[y][x];
   479E E5            [11]  229 	push	hl
   479F DD 6E FE      [19]  230 	ld	l,-2 (ix)
   47A2 DD 66 FF      [19]  231 	ld	h,-1 (ix)
   47A5 E5            [11]  232 	push	hl
   47A6 FD E1         [14]  233 	pop	iy
   47A8 E1            [10]  234 	pop	hl
   47A9 FD 09         [15]  235 	add	iy, bc
   47AB DD 6E FA      [19]  236 	ld	l,-6 (ix)
   47AE DD 66 FB      [19]  237 	ld	h,-5 (ix)
   47B1 09            [11]  238 	add	hl,bc
   47B2 7E            [ 7]  239 	ld	a,(hl)
   47B3 FD 77 00      [19]  240 	ld	0 (iy), a
                            241 ;src/draws.h:28: for(x=0;x<width;x++){
   47B6 03            [ 6]  242 	inc	bc
   47B7 79            [ 4]  243 	ld	a,c
   47B8 D6 14         [ 7]  244 	sub	a, #0x14
   47BA 78            [ 4]  245 	ld	a,b
   47BB 17            [ 4]  246 	rla
   47BC 3F            [ 4]  247 	ccf
   47BD 1F            [ 4]  248 	rra
   47BE DE 80         [ 7]  249 	sbc	a, #0x80
   47C0 38 DC         [12]  250 	jr	C,00119$
                            251 ;src/draws.h:27: for(y=0;y<height;y++){
   47C2 21 14 00      [10]  252 	ld	hl,#0x0014
   47C5 19            [11]  253 	add	hl,de
   47C6 5D            [ 4]  254 	ld	e,l
   47C7 54            [ 4]  255 	ld	d,h
   47C8 DD 34 EE      [23]  256 	inc	-18 (ix)
   47CB 20 03         [12]  257 	jr	NZ,00193$
   47CD DD 34 EF      [23]  258 	inc	-17 (ix)
   47D0                     259 00193$:
   47D0 DD 7E EE      [19]  260 	ld	a,-18 (ix)
   47D3 D6 0C         [ 7]  261 	sub	a, #0x0C
   47D5 DD 7E EF      [19]  262 	ld	a,-17 (ix)
   47D8 17            [ 4]  263 	rla
   47D9 3F            [ 4]  264 	ccf
   47DA 1F            [ 4]  265 	rra
   47DB DE 80         [ 7]  266 	sbc	a, #0x80
   47DD 38 A8         [12]  267 	jr	C,00134$
                            268 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   47DF                     269 00141$:
   47DF DD 36 F2 00   [19]  270 	ld	-14 (ix),#0x00
   47E3 DD 36 F3 00   [19]  271 	ld	-13 (ix),#0x00
   47E7 DD 36 FE 00   [19]  272 	ld	-2 (ix),#0x00
   47EB DD 36 FF 00   [19]  273 	ld	-1 (ix),#0x00
   47EF DD 36 FA 00   [19]  274 	ld	-6 (ix),#0x00
   47F3 DD 36 FB 00   [19]  275 	ld	-5 (ix),#0x00
                            276 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   47F7                     277 00139$:
   47F7 3E 3C         [ 7]  278 	ld	a,#<(_scene)
   47F9 DD 86 FA      [19]  279 	add	a, -6 (ix)
   47FC DD 77 F6      [19]  280 	ld	-10 (ix),a
   47FF 3E 64         [ 7]  281 	ld	a,#>(_scene)
   4801 DD 8E FB      [19]  282 	adc	a, -5 (ix)
   4804 DD 77 F7      [19]  283 	ld	-9 (ix),a
   4807 DD 36 F4 00   [19]  284 	ld	-12 (ix),#0x00
   480B DD 36 F5 00   [19]  285 	ld	-11 (ix),#0x00
   480F                     286 00123$:
                            287 ;src/draws.h:36: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   480F DD 7E F2      [19]  288 	ld	a,-14 (ix)
   4812 07            [ 4]  289 	rlca
   4813 07            [ 4]  290 	rlca
   4814 07            [ 4]  291 	rlca
   4815 07            [ 4]  292 	rlca
   4816 E6 F0         [ 7]  293 	and	a,#0xF0
   4818 67            [ 4]  294 	ld	h,a
   4819 DD 7E F4      [19]  295 	ld	a,-12 (ix)
   481C 87            [ 4]  296 	add	a, a
   481D 87            [ 4]  297 	add	a, a
   481E E5            [11]  298 	push	hl
   481F 33            [ 6]  299 	inc	sp
   4820 F5            [11]  300 	push	af
   4821 33            [ 6]  301 	inc	sp
   4822 21 00 C0      [10]  302 	ld	hl,#0xC000
   4825 E5            [11]  303 	push	hl
   4826 CD EB 63      [17]  304 	call	_cpct_getScreenPtr
   4829 EB            [ 4]  305 	ex	de,hl
                            306 ;src/draws.h:37: if(scene[posY][posX] == 1){
   482A DD 7E F6      [19]  307 	ld	a,-10 (ix)
   482D DD 86 F4      [19]  308 	add	a, -12 (ix)
   4830 6F            [ 4]  309 	ld	l,a
   4831 DD 7E F7      [19]  310 	ld	a,-9 (ix)
   4834 DD 8E F5      [19]  311 	adc	a, -11 (ix)
   4837 67            [ 4]  312 	ld	h,a
   4838 66            [ 7]  313 	ld	h,(hl)
                            314 ;src/draws.h:38: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4839 DD 73 F8      [19]  315 	ld	-8 (ix),e
   483C DD 72 F9      [19]  316 	ld	-7 (ix),d
                            317 ;src/draws.h:37: if(scene[posY][posX] == 1){
   483F 25            [ 4]  318 	dec	h
   4840 20 15         [12]  319 	jr	NZ,00110$
                            320 ;src/draws.h:38: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4842 21 04 10      [10]  321 	ld	hl,#0x1004
   4845 E5            [11]  322 	push	hl
   4846 3E 03         [ 7]  323 	ld	a,#0x03
   4848 F5            [11]  324 	push	af
   4849 33            [ 6]  325 	inc	sp
   484A DD 6E F8      [19]  326 	ld	l,-8 (ix)
   484D DD 66 F9      [19]  327 	ld	h,-7 (ix)
   4850 E5            [11]  328 	push	hl
   4851 CD 33 63      [17]  329 	call	_cpct_drawSolidBox
   4854 F1            [10]  330 	pop	af
   4855 F1            [10]  331 	pop	af
   4856 33            [ 6]  332 	inc	sp
   4857                     333 00110$:
                            334 ;src/draws.h:40: if(scene[posY][posX] == 9){
   4857 3E 3C         [ 7]  335 	ld	a,#<(_scene)
   4859 DD 86 FE      [19]  336 	add	a, -2 (ix)
   485C 6F            [ 4]  337 	ld	l,a
   485D 3E 64         [ 7]  338 	ld	a,#>(_scene)
   485F DD 8E FF      [19]  339 	adc	a, -1 (ix)
   4862 67            [ 4]  340 	ld	h,a
   4863 DD 5E F4      [19]  341 	ld	e,-12 (ix)
   4866 DD 56 F5      [19]  342 	ld	d,-11 (ix)
   4869 19            [11]  343 	add	hl,de
   486A 7E            [ 7]  344 	ld	a,(hl)
   486B D6 09         [ 7]  345 	sub	a, #0x09
   486D 20 15         [12]  346 	jr	NZ,00124$
                            347 ;src/draws.h:41: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   486F 21 04 10      [10]  348 	ld	hl,#0x1004
   4872 E5            [11]  349 	push	hl
   4873 3E 09         [ 7]  350 	ld	a,#0x09
   4875 F5            [11]  351 	push	af
   4876 33            [ 6]  352 	inc	sp
   4877 DD 6E F8      [19]  353 	ld	l,-8 (ix)
   487A DD 66 F9      [19]  354 	ld	h,-7 (ix)
   487D E5            [11]  355 	push	hl
   487E CD 33 63      [17]  356 	call	_cpct_drawSolidBox
   4881 F1            [10]  357 	pop	af
   4882 F1            [10]  358 	pop	af
   4883 33            [ 6]  359 	inc	sp
   4884                     360 00124$:
                            361 ;src/draws.h:35: for(posX=0; posX<width;posX++){
   4884 DD 34 F4      [23]  362 	inc	-12 (ix)
   4887 20 03         [12]  363 	jr	NZ,00198$
   4889 DD 34 F5      [23]  364 	inc	-11 (ix)
   488C                     365 00198$:
   488C DD 7E F4      [19]  366 	ld	a,-12 (ix)
   488F D6 14         [ 7]  367 	sub	a, #0x14
   4891 DD 7E F5      [19]  368 	ld	a,-11 (ix)
   4894 17            [ 4]  369 	rla
   4895 3F            [ 4]  370 	ccf
   4896 1F            [ 4]  371 	rra
   4897 DE 80         [ 7]  372 	sbc	a, #0x80
   4899 DA 0F 48      [10]  373 	jp	C,00123$
                            374 ;src/draws.h:34: for(posY=0; posY<height;posY++){
   489C DD 7E FE      [19]  375 	ld	a,-2 (ix)
   489F C6 14         [ 7]  376 	add	a, #0x14
   48A1 DD 77 FE      [19]  377 	ld	-2 (ix),a
   48A4 DD 7E FF      [19]  378 	ld	a,-1 (ix)
   48A7 CE 00         [ 7]  379 	adc	a, #0x00
   48A9 DD 77 FF      [19]  380 	ld	-1 (ix),a
   48AC DD 7E FA      [19]  381 	ld	a,-6 (ix)
   48AF C6 14         [ 7]  382 	add	a, #0x14
   48B1 DD 77 FA      [19]  383 	ld	-6 (ix),a
   48B4 DD 7E FB      [19]  384 	ld	a,-5 (ix)
   48B7 CE 00         [ 7]  385 	adc	a, #0x00
   48B9 DD 77 FB      [19]  386 	ld	-5 (ix),a
   48BC DD 34 F2      [23]  387 	inc	-14 (ix)
   48BF 20 03         [12]  388 	jr	NZ,00199$
   48C1 DD 34 F3      [23]  389 	inc	-13 (ix)
   48C4                     390 00199$:
   48C4 DD 7E F2      [19]  391 	ld	a,-14 (ix)
   48C7 D6 0C         [ 7]  392 	sub	a, #0x0C
   48C9 DD 7E F3      [19]  393 	ld	a,-13 (ix)
   48CC 17            [ 4]  394 	rla
   48CD 3F            [ 4]  395 	ccf
   48CE 1F            [ 4]  396 	rra
   48CF DE 80         [ 7]  397 	sbc	a, #0x80
   48D1 DA F7 47      [10]  398 	jp	C,00139$
   48D4 DD F9         [10]  399 	ld	sp, ix
   48D6 DD E1         [14]  400 	pop	ix
   48D8 C9            [10]  401 	ret
   48D9                     402 _g_palette:
   48D9 00                  403 	.db #0x00	; 0
   48DA 1A                  404 	.db #0x1A	; 26
   48DB 06                  405 	.db #0x06	; 6
   48DC 0D                  406 	.db #0x0D	; 13
   48DD 00                  407 	.db 0x00
   48DE                     408 _origins:
   48DE 00                  409 	.db #0x00	; 0
   48DF 50                  410 	.db #0x50	; 80	'P'
   48E0 34                  411 	.db #0x34	; 52	'4'
   48E1 50                  412 	.db #0x50	; 80	'P'
   48E2                     413 _mapa1:
   48E2 01                  414 	.db #0x01	; 1
   48E3 01                  415 	.db #0x01	; 1
   48E4 01                  416 	.db #0x01	; 1
   48E5 01                  417 	.db #0x01	; 1
   48E6 01                  418 	.db #0x01	; 1
   48E7 01                  419 	.db #0x01	; 1
   48E8 01                  420 	.db #0x01	; 1
   48E9 01                  421 	.db #0x01	; 1
   48EA 01                  422 	.db #0x01	; 1
   48EB 01                  423 	.db #0x01	; 1
   48EC 01                  424 	.db #0x01	; 1
   48ED 01                  425 	.db #0x01	; 1
   48EE 01                  426 	.db #0x01	; 1
   48EF 01                  427 	.db #0x01	; 1
   48F0 01                  428 	.db #0x01	; 1
   48F1 01                  429 	.db #0x01	; 1
   48F2 01                  430 	.db #0x01	; 1
   48F3 01                  431 	.db #0x01	; 1
   48F4 01                  432 	.db #0x01	; 1
   48F5 01                  433 	.db #0x01	; 1
   48F6 01                  434 	.db #0x01	; 1
   48F7 00                  435 	.db #0x00	; 0
   48F8 05                  436 	.db #0x05	; 5
   48F9 00                  437 	.db #0x00	; 0
   48FA 00                  438 	.db #0x00	; 0
   48FB 00                  439 	.db #0x00	; 0
   48FC 00                  440 	.db #0x00	; 0
   48FD 00                  441 	.db #0x00	; 0
   48FE 00                  442 	.db #0x00	; 0
   48FF 00                  443 	.db #0x00	; 0
   4900 00                  444 	.db #0x00	; 0
   4901 00                  445 	.db #0x00	; 0
   4902 00                  446 	.db #0x00	; 0
   4903 00                  447 	.db #0x00	; 0
   4904 00                  448 	.db #0x00	; 0
   4905 00                  449 	.db #0x00	; 0
   4906 00                  450 	.db #0x00	; 0
   4907 00                  451 	.db #0x00	; 0
   4908 00                  452 	.db #0x00	; 0
   4909 01                  453 	.db #0x01	; 1
   490A 01                  454 	.db #0x01	; 1
   490B 00                  455 	.db #0x00	; 0
   490C 00                  456 	.db #0x00	; 0
   490D 00                  457 	.db #0x00	; 0
   490E 00                  458 	.db #0x00	; 0
   490F 00                  459 	.db #0x00	; 0
   4910 00                  460 	.db #0x00	; 0
   4911 00                  461 	.db #0x00	; 0
   4912 00                  462 	.db #0x00	; 0
   4913 00                  463 	.db #0x00	; 0
   4914 00                  464 	.db #0x00	; 0
   4915 00                  465 	.db #0x00	; 0
   4916 00                  466 	.db #0x00	; 0
   4917 00                  467 	.db #0x00	; 0
   4918 00                  468 	.db #0x00	; 0
   4919 00                  469 	.db #0x00	; 0
   491A 00                  470 	.db #0x00	; 0
   491B 00                  471 	.db #0x00	; 0
   491C 00                  472 	.db #0x00	; 0
   491D 01                  473 	.db #0x01	; 1
   491E 01                  474 	.db #0x01	; 1
   491F 01                  475 	.db #0x01	; 1
   4920 01                  476 	.db #0x01	; 1
   4921 01                  477 	.db #0x01	; 1
   4922 01                  478 	.db #0x01	; 1
   4923 01                  479 	.db #0x01	; 1
   4924 01                  480 	.db #0x01	; 1
   4925 01                  481 	.db #0x01	; 1
   4926 01                  482 	.db #0x01	; 1
   4927 01                  483 	.db #0x01	; 1
   4928 01                  484 	.db #0x01	; 1
   4929 01                  485 	.db #0x01	; 1
   492A 01                  486 	.db #0x01	; 1
   492B 01                  487 	.db #0x01	; 1
   492C 01                  488 	.db #0x01	; 1
   492D 00                  489 	.db #0x00	; 0
   492E 01                  490 	.db #0x01	; 1
   492F 01                  491 	.db #0x01	; 1
   4930 01                  492 	.db #0x01	; 1
   4931 01                  493 	.db #0x01	; 1
   4932 01                  494 	.db #0x01	; 1
   4933 00                  495 	.db #0x00	; 0
   4934 00                  496 	.db #0x00	; 0
   4935 00                  497 	.db #0x00	; 0
   4936 00                  498 	.db #0x00	; 0
   4937 00                  499 	.db #0x00	; 0
   4938 00                  500 	.db #0x00	; 0
   4939 00                  501 	.db #0x00	; 0
   493A 00                  502 	.db #0x00	; 0
   493B 00                  503 	.db #0x00	; 0
   493C 00                  504 	.db #0x00	; 0
   493D 01                  505 	.db #0x01	; 1
   493E 03                  506 	.db #0x03	; 3
   493F 03                  507 	.db #0x03	; 3
   4940 03                  508 	.db #0x03	; 3
   4941 03                  509 	.db #0x03	; 3
   4942 03                  510 	.db #0x03	; 3
   4943 03                  511 	.db #0x03	; 3
   4944 03                  512 	.db #0x03	; 3
   4945 01                  513 	.db #0x01	; 1
   4946 00                  514 	.db #0x00	; 0
   4947 00                  515 	.db #0x00	; 0
   4948 01                  516 	.db #0x01	; 1
   4949 01                  517 	.db #0x01	; 1
   494A 00                  518 	.db #0x00	; 0
   494B 01                  519 	.db #0x01	; 1
   494C 01                  520 	.db #0x01	; 1
   494D 01                  521 	.db #0x01	; 1
   494E 00                  522 	.db #0x00	; 0
   494F 00                  523 	.db #0x00	; 0
   4950 00                  524 	.db #0x00	; 0
   4951 01                  525 	.db #0x01	; 1
   4952 03                  526 	.db #0x03	; 3
   4953 03                  527 	.db #0x03	; 3
   4954 03                  528 	.db #0x03	; 3
   4955 03                  529 	.db #0x03	; 3
   4956 03                  530 	.db #0x03	; 3
   4957 03                  531 	.db #0x03	; 3
   4958 03                  532 	.db #0x03	; 3
   4959 01                  533 	.db #0x01	; 1
   495A 01                  534 	.db #0x01	; 1
   495B 00                  535 	.db #0x00	; 0
   495C 01                  536 	.db #0x01	; 1
   495D 00                  537 	.db #0x00	; 0
   495E 00                  538 	.db #0x00	; 0
   495F 00                  539 	.db #0x00	; 0
   4960 00                  540 	.db #0x00	; 0
   4961 01                  541 	.db #0x01	; 1
   4962 00                  542 	.db #0x00	; 0
   4963 00                  543 	.db #0x00	; 0
   4964 00                  544 	.db #0x00	; 0
   4965 01                  545 	.db #0x01	; 1
   4966 03                  546 	.db #0x03	; 3
   4967 03                  547 	.db #0x03	; 3
   4968 03                  548 	.db #0x03	; 3
   4969 03                  549 	.db #0x03	; 3
   496A 03                  550 	.db #0x03	; 3
   496B 03                  551 	.db #0x03	; 3
   496C 03                  552 	.db #0x03	; 3
   496D 01                  553 	.db #0x01	; 1
   496E 01                  554 	.db #0x01	; 1
   496F 00                  555 	.db #0x00	; 0
   4970 01                  556 	.db #0x01	; 1
   4971 00                  557 	.db #0x00	; 0
   4972 00                  558 	.db #0x00	; 0
   4973 00                  559 	.db #0x00	; 0
   4974 00                  560 	.db #0x00	; 0
   4975 01                  561 	.db #0x01	; 1
   4976 00                  562 	.db #0x00	; 0
   4977 00                  563 	.db #0x00	; 0
   4978 00                  564 	.db #0x00	; 0
   4979 01                  565 	.db #0x01	; 1
   497A 03                  566 	.db #0x03	; 3
   497B 03                  567 	.db #0x03	; 3
   497C 03                  568 	.db #0x03	; 3
   497D 03                  569 	.db #0x03	; 3
   497E 03                  570 	.db #0x03	; 3
   497F 03                  571 	.db #0x03	; 3
   4980 03                  572 	.db #0x03	; 3
   4981 01                  573 	.db #0x01	; 1
   4982 01                  574 	.db #0x01	; 1
   4983 00                  575 	.db #0x00	; 0
   4984 01                  576 	.db #0x01	; 1
   4985 00                  577 	.db #0x00	; 0
   4986 00                  578 	.db #0x00	; 0
   4987 00                  579 	.db #0x00	; 0
   4988 00                  580 	.db #0x00	; 0
   4989 01                  581 	.db #0x01	; 1
   498A 00                  582 	.db #0x00	; 0
   498B 00                  583 	.db #0x00	; 0
   498C 00                  584 	.db #0x00	; 0
   498D 01                  585 	.db #0x01	; 1
   498E 03                  586 	.db #0x03	; 3
   498F 03                  587 	.db #0x03	; 3
   4990 03                  588 	.db #0x03	; 3
   4991 03                  589 	.db #0x03	; 3
   4992 03                  590 	.db #0x03	; 3
   4993 03                  591 	.db #0x03	; 3
   4994 03                  592 	.db #0x03	; 3
   4995 01                  593 	.db #0x01	; 1
   4996 01                  594 	.db #0x01	; 1
   4997 00                  595 	.db #0x00	; 0
   4998 01                  596 	.db #0x01	; 1
   4999 00                  597 	.db #0x00	; 0
   499A 00                  598 	.db #0x00	; 0
   499B 00                  599 	.db #0x00	; 0
   499C 00                  600 	.db #0x00	; 0
   499D 01                  601 	.db #0x01	; 1
   499E 00                  602 	.db #0x00	; 0
   499F 00                  603 	.db #0x00	; 0
   49A0 00                  604 	.db #0x00	; 0
   49A1 01                  605 	.db #0x01	; 1
   49A2 03                  606 	.db #0x03	; 3
   49A3 03                  607 	.db #0x03	; 3
   49A4 03                  608 	.db #0x03	; 3
   49A5 03                  609 	.db #0x03	; 3
   49A6 03                  610 	.db #0x03	; 3
   49A7 03                  611 	.db #0x03	; 3
   49A8 03                  612 	.db #0x03	; 3
   49A9 01                  613 	.db #0x01	; 1
   49AA 01                  614 	.db #0x01	; 1
   49AB 02                  615 	.db #0x02	; 2
   49AC 01                  616 	.db #0x01	; 1
   49AD 00                  617 	.db #0x00	; 0
   49AE 00                  618 	.db #0x00	; 0
   49AF 00                  619 	.db #0x00	; 0
   49B0 00                  620 	.db #0x00	; 0
   49B1 01                  621 	.db #0x01	; 1
   49B2 00                  622 	.db #0x00	; 0
   49B3 00                  623 	.db #0x00	; 0
   49B4 00                  624 	.db #0x00	; 0
   49B5 0A                  625 	.db #0x0A	; 10
   49B6 03                  626 	.db #0x03	; 3
   49B7 03                  627 	.db #0x03	; 3
   49B8 03                  628 	.db #0x03	; 3
   49B9 03                  629 	.db #0x03	; 3
   49BA 03                  630 	.db #0x03	; 3
   49BB 03                  631 	.db #0x03	; 3
   49BC 03                  632 	.db #0x03	; 3
   49BD 01                  633 	.db #0x01	; 1
   49BE 01                  634 	.db #0x01	; 1
   49BF 01                  635 	.db #0x01	; 1
   49C0 01                  636 	.db #0x01	; 1
   49C1 01                  637 	.db #0x01	; 1
   49C2 01                  638 	.db #0x01	; 1
   49C3 01                  639 	.db #0x01	; 1
   49C4 01                  640 	.db #0x01	; 1
   49C5 01                  641 	.db #0x01	; 1
   49C6 01                  642 	.db #0x01	; 1
   49C7 01                  643 	.db #0x01	; 1
   49C8 01                  644 	.db #0x01	; 1
   49C9 01                  645 	.db #0x01	; 1
   49CA 01                  646 	.db #0x01	; 1
   49CB 01                  647 	.db #0x01	; 1
   49CC 01                  648 	.db #0x01	; 1
   49CD 09                  649 	.db #0x09	; 9
   49CE 09                  650 	.db #0x09	; 9
   49CF 01                  651 	.db #0x01	; 1
   49D0 01                  652 	.db #0x01	; 1
   49D1 01                  653 	.db #0x01	; 1
   49D2                     654 _mapa2:
   49D2 01                  655 	.db #0x01	; 1
   49D3 01                  656 	.db #0x01	; 1
   49D4 01                  657 	.db #0x01	; 1
   49D5 01                  658 	.db #0x01	; 1
   49D6 01                  659 	.db #0x01	; 1
   49D7 01                  660 	.db #0x01	; 1
   49D8 01                  661 	.db #0x01	; 1
   49D9 01                  662 	.db #0x01	; 1
   49DA 01                  663 	.db #0x01	; 1
   49DB 01                  664 	.db #0x01	; 1
   49DC 01                  665 	.db #0x01	; 1
   49DD 01                  666 	.db #0x01	; 1
   49DE 01                  667 	.db #0x01	; 1
   49DF 01                  668 	.db #0x01	; 1
   49E0 01                  669 	.db #0x01	; 1
   49E1 01                  670 	.db #0x01	; 1
   49E2 01                  671 	.db #0x01	; 1
   49E3 01                  672 	.db #0x01	; 1
   49E4 01                  673 	.db #0x01	; 1
   49E5 01                  674 	.db #0x01	; 1
   49E6 01                  675 	.db #0x01	; 1
   49E7 00                  676 	.db #0x00	; 0
   49E8 00                  677 	.db #0x00	; 0
   49E9 00                  678 	.db #0x00	; 0
   49EA 00                  679 	.db #0x00	; 0
   49EB 01                  680 	.db #0x01	; 1
   49EC 00                  681 	.db #0x00	; 0
   49ED 00                  682 	.db #0x00	; 0
   49EE 00                  683 	.db #0x00	; 0
   49EF 00                  684 	.db #0x00	; 0
   49F0 00                  685 	.db #0x00	; 0
   49F1 00                  686 	.db #0x00	; 0
   49F2 00                  687 	.db #0x00	; 0
   49F3 00                  688 	.db #0x00	; 0
   49F4 00                  689 	.db #0x00	; 0
   49F5 00                  690 	.db #0x00	; 0
   49F6 00                  691 	.db #0x00	; 0
   49F7 00                  692 	.db #0x00	; 0
   49F8 00                  693 	.db #0x00	; 0
   49F9 06                  694 	.db #0x06	; 6
   49FA 01                  695 	.db #0x01	; 1
   49FB 00                  696 	.db #0x00	; 0
   49FC 00                  697 	.db #0x00	; 0
   49FD 01                  698 	.db #0x01	; 1
   49FE 00                  699 	.db #0x00	; 0
   49FF 00                  700 	.db #0x00	; 0
   4A00 00                  701 	.db #0x00	; 0
   4A01 00                  702 	.db #0x00	; 0
   4A02 00                  703 	.db #0x00	; 0
   4A03 00                  704 	.db #0x00	; 0
   4A04 00                  705 	.db #0x00	; 0
   4A05 00                  706 	.db #0x00	; 0
   4A06 00                  707 	.db #0x00	; 0
   4A07 00                  708 	.db #0x00	; 0
   4A08 00                  709 	.db #0x00	; 0
   4A09 00                  710 	.db #0x00	; 0
   4A0A 00                  711 	.db #0x00	; 0
   4A0B 00                  712 	.db #0x00	; 0
   4A0C 00                  713 	.db #0x00	; 0
   4A0D 01                  714 	.db #0x01	; 1
   4A0E 01                  715 	.db #0x01	; 1
   4A0F 00                  716 	.db #0x00	; 0
   4A10 01                  717 	.db #0x01	; 1
   4A11 01                  718 	.db #0x01	; 1
   4A12 01                  719 	.db #0x01	; 1
   4A13 01                  720 	.db #0x01	; 1
   4A14 00                  721 	.db #0x00	; 0
   4A15 00                  722 	.db #0x00	; 0
   4A16 01                  723 	.db #0x01	; 1
   4A17 01                  724 	.db #0x01	; 1
   4A18 01                  725 	.db #0x01	; 1
   4A19 01                  726 	.db #0x01	; 1
   4A1A 01                  727 	.db #0x01	; 1
   4A1B 01                  728 	.db #0x01	; 1
   4A1C 01                  729 	.db #0x01	; 1
   4A1D 01                  730 	.db #0x01	; 1
   4A1E 01                  731 	.db #0x01	; 1
   4A1F 01                  732 	.db #0x01	; 1
   4A20 01                  733 	.db #0x01	; 1
   4A21 01                  734 	.db #0x01	; 1
   4A22 01                  735 	.db #0x01	; 1
   4A23 00                  736 	.db #0x00	; 0
   4A24 05                  737 	.db #0x05	; 5
   4A25 01                  738 	.db #0x01	; 1
   4A26 00                  739 	.db #0x00	; 0
   4A27 00                  740 	.db #0x00	; 0
   4A28 00                  741 	.db #0x00	; 0
   4A29 00                  742 	.db #0x00	; 0
   4A2A 00                  743 	.db #0x00	; 0
   4A2B 00                  744 	.db #0x00	; 0
   4A2C 00                  745 	.db #0x00	; 0
   4A2D 01                  746 	.db #0x01	; 1
   4A2E 00                  747 	.db #0x00	; 0
   4A2F 00                  748 	.db #0x00	; 0
   4A30 00                  749 	.db #0x00	; 0
   4A31 00                  750 	.db #0x00	; 0
   4A32 00                  751 	.db #0x00	; 0
   4A33 00                  752 	.db #0x00	; 0
   4A34 00                  753 	.db #0x00	; 0
   4A35 01                  754 	.db #0x01	; 1
   4A36 01                  755 	.db #0x01	; 1
   4A37 00                  756 	.db #0x00	; 0
   4A38 01                  757 	.db #0x01	; 1
   4A39 01                  758 	.db #0x01	; 1
   4A3A 00                  759 	.db #0x00	; 0
   4A3B 01                  760 	.db #0x01	; 1
   4A3C 01                  761 	.db #0x01	; 1
   4A3D 01                  762 	.db #0x01	; 1
   4A3E 02                  763 	.db #0x02	; 2
   4A3F 02                  764 	.db #0x02	; 2
   4A40 02                  765 	.db #0x02	; 2
   4A41 01                  766 	.db #0x01	; 1
   4A42 00                  767 	.db #0x00	; 0
   4A43 00                  768 	.db #0x00	; 0
   4A44 00                  769 	.db #0x00	; 0
   4A45 05                  770 	.db #0x05	; 5
   4A46 00                  771 	.db #0x00	; 0
   4A47 00                  772 	.db #0x00	; 0
   4A48 00                  773 	.db #0x00	; 0
   4A49 01                  774 	.db #0x01	; 1
   4A4A 01                  775 	.db #0x01	; 1
   4A4B 00                  776 	.db #0x00	; 0
   4A4C 01                  777 	.db #0x01	; 1
   4A4D 02                  778 	.db #0x02	; 2
   4A4E 02                  779 	.db #0x02	; 2
   4A4F 02                  780 	.db #0x02	; 2
   4A50 02                  781 	.db #0x02	; 2
   4A51 01                  782 	.db #0x01	; 1
   4A52 00                  783 	.db #0x00	; 0
   4A53 00                  784 	.db #0x00	; 0
   4A54 00                  785 	.db #0x00	; 0
   4A55 01                  786 	.db #0x01	; 1
   4A56 00                  787 	.db #0x00	; 0
   4A57 00                  788 	.db #0x00	; 0
   4A58 00                  789 	.db #0x00	; 0
   4A59 05                  790 	.db #0x05	; 5
   4A5A 00                  791 	.db #0x00	; 0
   4A5B 00                  792 	.db #0x00	; 0
   4A5C 00                  793 	.db #0x00	; 0
   4A5D 01                  794 	.db #0x01	; 1
   4A5E 01                  795 	.db #0x01	; 1
   4A5F 00                  796 	.db #0x00	; 0
   4A60 01                  797 	.db #0x01	; 1
   4A61 02                  798 	.db #0x02	; 2
   4A62 02                  799 	.db #0x02	; 2
   4A63 02                  800 	.db #0x02	; 2
   4A64 02                  801 	.db #0x02	; 2
   4A65 01                  802 	.db #0x01	; 1
   4A66 02                  803 	.db #0x02	; 2
   4A67 02                  804 	.db #0x02	; 2
   4A68 02                  805 	.db #0x02	; 2
   4A69 01                  806 	.db #0x01	; 1
   4A6A 00                  807 	.db #0x00	; 0
   4A6B 00                  808 	.db #0x00	; 0
   4A6C 00                  809 	.db #0x00	; 0
   4A6D 05                  810 	.db #0x05	; 5
   4A6E 00                  811 	.db #0x00	; 0
   4A6F 00                  812 	.db #0x00	; 0
   4A70 00                  813 	.db #0x00	; 0
   4A71 01                  814 	.db #0x01	; 1
   4A72 01                  815 	.db #0x01	; 1
   4A73 00                  816 	.db #0x00	; 0
   4A74 01                  817 	.db #0x01	; 1
   4A75 02                  818 	.db #0x02	; 2
   4A76 02                  819 	.db #0x02	; 2
   4A77 02                  820 	.db #0x02	; 2
   4A78 02                  821 	.db #0x02	; 2
   4A79 01                  822 	.db #0x01	; 1
   4A7A 00                  823 	.db #0x00	; 0
   4A7B 00                  824 	.db #0x00	; 0
   4A7C 00                  825 	.db #0x00	; 0
   4A7D 01                  826 	.db #0x01	; 1
   4A7E 00                  827 	.db #0x00	; 0
   4A7F 00                  828 	.db #0x00	; 0
   4A80 00                  829 	.db #0x00	; 0
   4A81 00                  830 	.db #0x00	; 0
   4A82 00                  831 	.db #0x00	; 0
   4A83 00                  832 	.db #0x00	; 0
   4A84 00                  833 	.db #0x00	; 0
   4A85 01                  834 	.db #0x01	; 1
   4A86 01                  835 	.db #0x01	; 1
   4A87 00                  836 	.db #0x00	; 0
   4A88 01                  837 	.db #0x01	; 1
   4A89 02                  838 	.db #0x02	; 2
   4A8A 02                  839 	.db #0x02	; 2
   4A8B 02                  840 	.db #0x02	; 2
   4A8C 02                  841 	.db #0x02	; 2
   4A8D 01                  842 	.db #0x01	; 1
   4A8E 02                  843 	.db #0x02	; 2
   4A8F 02                  844 	.db #0x02	; 2
   4A90 02                  845 	.db #0x02	; 2
   4A91 01                  846 	.db #0x01	; 1
   4A92 00                  847 	.db #0x00	; 0
   4A93 00                  848 	.db #0x00	; 0
   4A94 00                  849 	.db #0x00	; 0
   4A95 00                  850 	.db #0x00	; 0
   4A96 00                  851 	.db #0x00	; 0
   4A97 00                  852 	.db #0x00	; 0
   4A98 00                  853 	.db #0x00	; 0
   4A99 01                  854 	.db #0x01	; 1
   4A9A 01                  855 	.db #0x01	; 1
   4A9B 05                  856 	.db #0x05	; 5
   4A9C 01                  857 	.db #0x01	; 1
   4A9D 02                  858 	.db #0x02	; 2
   4A9E 02                  859 	.db #0x02	; 2
   4A9F 02                  860 	.db #0x02	; 2
   4AA0 02                  861 	.db #0x02	; 2
   4AA1 01                  862 	.db #0x01	; 1
   4AA2 00                  863 	.db #0x00	; 0
   4AA3 00                  864 	.db #0x00	; 0
   4AA4 00                  865 	.db #0x00	; 0
   4AA5 00                  866 	.db #0x00	; 0
   4AA6 00                  867 	.db #0x00	; 0
   4AA7 00                  868 	.db #0x00	; 0
   4AA8 00                  869 	.db #0x00	; 0
   4AA9 00                  870 	.db #0x00	; 0
   4AAA 00                  871 	.db #0x00	; 0
   4AAB 00                  872 	.db #0x00	; 0
   4AAC 00                  873 	.db #0x00	; 0
   4AAD 01                  874 	.db #0x01	; 1
   4AAE 01                  875 	.db #0x01	; 1
   4AAF 01                  876 	.db #0x01	; 1
   4AB0 01                  877 	.db #0x01	; 1
   4AB1 01                  878 	.db #0x01	; 1
   4AB2 01                  879 	.db #0x01	; 1
   4AB3 01                  880 	.db #0x01	; 1
   4AB4 01                  881 	.db #0x01	; 1
   4AB5 01                  882 	.db #0x01	; 1
   4AB6 01                  883 	.db #0x01	; 1
   4AB7 01                  884 	.db #0x01	; 1
   4AB8 01                  885 	.db #0x01	; 1
   4AB9 01                  886 	.db #0x01	; 1
   4ABA 01                  887 	.db #0x01	; 1
   4ABB 01                  888 	.db #0x01	; 1
   4ABC 01                  889 	.db #0x01	; 1
   4ABD 00                  890 	.db #0x00	; 0
   4ABE 01                  891 	.db #0x01	; 1
   4ABF 01                  892 	.db #0x01	; 1
   4AC0 01                  893 	.db #0x01	; 1
   4AC1 01                  894 	.db #0x01	; 1
                            895 ;src/draws.h:49: void draw(u8 x,u8 y,u8 *sprite,u8 mode){
                            896 ;	---------------------------------
                            897 ; Function draw
                            898 ; ---------------------------------
   4AC2                     899 _draw::
                            900 ;src/draws.h:51: memptr = cpct_getScreenPtr(VMEM,x,y);
   4AC2 21 03 00      [10]  901 	ld	hl, #3+0
   4AC5 39            [11]  902 	add	hl, sp
   4AC6 7E            [ 7]  903 	ld	a, (hl)
   4AC7 F5            [11]  904 	push	af
   4AC8 33            [ 6]  905 	inc	sp
   4AC9 21 03 00      [10]  906 	ld	hl, #3+0
   4ACC 39            [11]  907 	add	hl, sp
   4ACD 7E            [ 7]  908 	ld	a, (hl)
   4ACE F5            [11]  909 	push	af
   4ACF 33            [ 6]  910 	inc	sp
   4AD0 21 00 C0      [10]  911 	ld	hl,#0xC000
   4AD3 E5            [11]  912 	push	hl
   4AD4 CD EB 63      [17]  913 	call	_cpct_getScreenPtr
   4AD7 EB            [ 4]  914 	ex	de,hl
                            915 ;src/draws.h:52: switch(mode){
   4AD8 3E 02         [ 7]  916 	ld	a,#0x02
   4ADA FD 21 06 00   [14]  917 	ld	iy,#6
   4ADE FD 39         [15]  918 	add	iy,sp
   4AE0 FD 96 00      [19]  919 	sub	a, 0 (iy)
   4AE3 D8            [11]  920 	ret	C
                            921 ;src/draws.h:54: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4AE4 21 04 00      [10]  922 	ld	hl, #4
   4AE7 39            [11]  923 	add	hl, sp
   4AE8 4E            [ 7]  924 	ld	c, (hl)
   4AE9 23            [ 6]  925 	inc	hl
   4AEA 46            [ 7]  926 	ld	b, (hl)
                            927 ;src/draws.h:52: switch(mode){
   4AEB D5            [11]  928 	push	de
   4AEC FD 21 08 00   [14]  929 	ld	iy,#8
   4AF0 FD 39         [15]  930 	add	iy,sp
   4AF2 FD 5E 00      [19]  931 	ld	e,0 (iy)
   4AF5 16 00         [ 7]  932 	ld	d,#0x00
   4AF7 21 FE 4A      [10]  933 	ld	hl,#00111$
   4AFA 19            [11]  934 	add	hl,de
   4AFB 19            [11]  935 	add	hl,de
                            936 ;src/draws.h:53: case 0:
   4AFC D1            [10]  937 	pop	de
   4AFD E9            [ 4]  938 	jp	(hl)
   4AFE                     939 00111$:
   4AFE 18 04         [12]  940 	jr	00101$
   4B00 18 0C         [12]  941 	jr	00102$
   4B02 18 14         [12]  942 	jr	00103$
   4B04                     943 00101$:
                            944 ;src/draws.h:54: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4B04 21 04 10      [10]  945 	ld	hl,#0x1004
   4B07 E5            [11]  946 	push	hl
   4B08 D5            [11]  947 	push	de
   4B09 C5            [11]  948 	push	bc
   4B0A CD AD 62      [17]  949 	call	_cpct_drawSpriteMasked
                            950 ;src/draws.h:55: break;
   4B0D C9            [10]  951 	ret
                            952 ;src/draws.h:56: case 1:
   4B0E                     953 00102$:
                            954 ;src/draws.h:57: cpct_drawSpriteMasked(sprite, memptr, 2, 8);
   4B0E 21 02 08      [10]  955 	ld	hl,#0x0802
   4B11 E5            [11]  956 	push	hl
   4B12 D5            [11]  957 	push	de
   4B13 C5            [11]  958 	push	bc
   4B14 CD AD 62      [17]  959 	call	_cpct_drawSpriteMasked
                            960 ;src/draws.h:58: break;
   4B17 C9            [10]  961 	ret
                            962 ;src/draws.h:59: case 2:
   4B18                     963 00103$:
                            964 ;src/draws.h:60: cpct_drawSpriteMasked(sprite, memptr, 4, 4);
   4B18 21 04 04      [10]  965 	ld	hl,#0x0404
   4B1B E5            [11]  966 	push	hl
   4B1C D5            [11]  967 	push	de
   4B1D C5            [11]  968 	push	bc
   4B1E CD AD 62      [17]  969 	call	_cpct_drawSpriteMasked
                            970 ;src/draws.h:62: }
   4B21 C9            [10]  971 	ret
                            972 ;src/draws.h:66: void erase(u8 x,u8 y,u8 mode){
                            973 ;	---------------------------------
                            974 ; Function erase
                            975 ; ---------------------------------
   4B22                     976 _erase::
                            977 ;src/draws.h:69: memptr = cpct_getScreenPtr(VMEM,x,y);
   4B22 21 03 00      [10]  978 	ld	hl, #3+0
   4B25 39            [11]  979 	add	hl, sp
   4B26 7E            [ 7]  980 	ld	a, (hl)
   4B27 F5            [11]  981 	push	af
   4B28 33            [ 6]  982 	inc	sp
   4B29 21 03 00      [10]  983 	ld	hl, #3+0
   4B2C 39            [11]  984 	add	hl, sp
   4B2D 7E            [ 7]  985 	ld	a, (hl)
   4B2E F5            [11]  986 	push	af
   4B2F 33            [ 6]  987 	inc	sp
   4B30 21 00 C0      [10]  988 	ld	hl,#0xC000
   4B33 E5            [11]  989 	push	hl
   4B34 CD EB 63      [17]  990 	call	_cpct_getScreenPtr
   4B37 4D            [ 4]  991 	ld	c, l
   4B38 44            [ 4]  992 	ld	b, h
                            993 ;src/draws.h:70: switch(mode){
   4B39 3E 02         [ 7]  994 	ld	a,#0x02
   4B3B FD 21 04 00   [14]  995 	ld	iy,#4
   4B3F FD 39         [15]  996 	add	iy,sp
   4B41 FD 96 00      [19]  997 	sub	a, 0 (iy)
   4B44 D8            [11]  998 	ret	C
                            999 ;src/draws.h:72: cpct_drawSolidBox(memptr,0,4,16);
                           1000 ;src/draws.h:70: switch(mode){
   4B45 FD 5E 00      [19] 1001 	ld	e,0 (iy)
   4B48 16 00         [ 7] 1002 	ld	d,#0x00
   4B4A 21 50 4B      [10] 1003 	ld	hl,#00111$
   4B4D 19            [11] 1004 	add	hl,de
   4B4E 19            [11] 1005 	add	hl,de
                           1006 ;src/draws.h:71: case 0:
   4B4F E9            [ 4] 1007 	jp	(hl)
   4B50                    1008 00111$:
   4B50 18 04         [12] 1009 	jr	00101$
   4B52 18 11         [12] 1010 	jr	00102$
   4B54 18 1E         [12] 1011 	jr	00103$
   4B56                    1012 00101$:
                           1013 ;src/draws.h:72: cpct_drawSolidBox(memptr,0,4,16);
   4B56 21 04 10      [10] 1014 	ld	hl,#0x1004
   4B59 E5            [11] 1015 	push	hl
   4B5A AF            [ 4] 1016 	xor	a, a
   4B5B F5            [11] 1017 	push	af
   4B5C 33            [ 6] 1018 	inc	sp
   4B5D C5            [11] 1019 	push	bc
   4B5E CD 33 63      [17] 1020 	call	_cpct_drawSolidBox
   4B61 F1            [10] 1021 	pop	af
   4B62 F1            [10] 1022 	pop	af
   4B63 33            [ 6] 1023 	inc	sp
                           1024 ;src/draws.h:73: break;
   4B64 C9            [10] 1025 	ret
                           1026 ;src/draws.h:74: case 1:
   4B65                    1027 00102$:
                           1028 ;src/draws.h:75: cpct_drawSolidBox(memptr,0,2,8);
   4B65 21 02 08      [10] 1029 	ld	hl,#0x0802
   4B68 E5            [11] 1030 	push	hl
   4B69 AF            [ 4] 1031 	xor	a, a
   4B6A F5            [11] 1032 	push	af
   4B6B 33            [ 6] 1033 	inc	sp
   4B6C C5            [11] 1034 	push	bc
   4B6D CD 33 63      [17] 1035 	call	_cpct_drawSolidBox
   4B70 F1            [10] 1036 	pop	af
   4B71 F1            [10] 1037 	pop	af
   4B72 33            [ 6] 1038 	inc	sp
                           1039 ;src/draws.h:76: break;
   4B73 C9            [10] 1040 	ret
                           1041 ;src/draws.h:77: case 2:
   4B74                    1042 00103$:
                           1043 ;src/draws.h:78: cpct_drawSolidBox(memptr,0,4,4);
   4B74 21 04 04      [10] 1044 	ld	hl,#0x0404
   4B77 E5            [11] 1045 	push	hl
   4B78 AF            [ 4] 1046 	xor	a, a
   4B79 F5            [11] 1047 	push	af
   4B7A 33            [ 6] 1048 	inc	sp
   4B7B C5            [11] 1049 	push	bc
   4B7C CD 33 63      [17] 1050 	call	_cpct_drawSolidBox
   4B7F F1            [10] 1051 	pop	af
   4B80 F1            [10] 1052 	pop	af
   4B81 33            [ 6] 1053 	inc	sp
                           1054 ;src/draws.h:80: }
   4B82 C9            [10] 1055 	ret
                           1056 ;src/draws.h:84: void draws(){
                           1057 ;	---------------------------------
                           1058 ; Function draws
                           1059 ; ---------------------------------
   4B83                    1060 _draws::
   4B83 DD E5         [15] 1061 	push	ix
   4B85 DD 21 00 00   [14] 1062 	ld	ix,#0
   4B89 DD 39         [15] 1063 	add	ix,sp
   4B8B 3B            [ 6] 1064 	dec	sp
                           1065 ;src/draws.h:86: draw(player.x,player.y,player.sprite,0);
   4B8C ED 5B 43 65   [20] 1066 	ld	de, (#_player + 4)
   4B90 21 40 65      [10] 1067 	ld	hl, #_player + 1
   4B93 46            [ 7] 1068 	ld	b,(hl)
   4B94 21 3F 65      [10] 1069 	ld	hl, #_player + 0
   4B97 4E            [ 7] 1070 	ld	c,(hl)
   4B98 AF            [ 4] 1071 	xor	a, a
   4B99 F5            [11] 1072 	push	af
   4B9A 33            [ 6] 1073 	inc	sp
   4B9B D5            [11] 1074 	push	de
   4B9C C5            [11] 1075 	push	bc
   4B9D CD C2 4A      [17] 1076 	call	_draw
   4BA0 F1            [10] 1077 	pop	af
   4BA1 F1            [10] 1078 	pop	af
   4BA2 33            [ 6] 1079 	inc	sp
                           1080 ;src/draws.h:87: draw(enemy.x,enemy.y,enemy.sprite,0);
   4BA3 ED 5B 50 65   [20] 1081 	ld	de, (#_enemy + 6)
   4BA7 21 4B 65      [10] 1082 	ld	hl, #_enemy + 1
   4BAA 46            [ 7] 1083 	ld	b,(hl)
   4BAB 21 4A 65      [10] 1084 	ld	hl, #_enemy + 0
   4BAE 4E            [ 7] 1085 	ld	c,(hl)
   4BAF AF            [ 4] 1086 	xor	a, a
   4BB0 F5            [11] 1087 	push	af
   4BB1 33            [ 6] 1088 	inc	sp
   4BB2 D5            [11] 1089 	push	de
   4BB3 C5            [11] 1090 	push	bc
   4BB4 CD C2 4A      [17] 1091 	call	_draw
   4BB7 F1            [10] 1092 	pop	af
   4BB8 F1            [10] 1093 	pop	af
   4BB9 33            [ 6] 1094 	inc	sp
                           1095 ;src/draws.h:88: if(arrow == 1){
   4BBA 3A 31 65      [13] 1096 	ld	a,(#_arrow + 0)
   4BBD 3D            [ 4] 1097 	dec	a
   4BBE 20 5C         [12] 1098 	jr	NZ,00112$
                           1099 ;src/draws.h:89: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4BC0 21 3C 65      [10] 1100 	ld	hl, #_object + 7
   4BC3 5E            [ 7] 1101 	ld	e,(hl)
                           1102 ;src/draws.h:90: draw(object.x,object.y,object.sprite,2);
   4BC4 01 36 65      [10] 1103 	ld	bc,#_object + 1
                           1104 ;src/draws.h:89: if(object.dir == 4 || object.dir == 6 && object.vivo == 1)
   4BC7 7B            [ 4] 1105 	ld	a,e
   4BC8 D6 04         [ 7] 1106 	sub	a, #0x04
   4BCA 28 0C         [12] 1107 	jr	Z,00105$
   4BCC 21 3B 65      [10] 1108 	ld	hl,#_object + 6
   4BCF 7B            [ 4] 1109 	ld	a,e
   4BD0 D6 06         [ 7] 1110 	sub	a, #0x06
   4BD2 20 25         [12] 1111 	jr	NZ,00106$
   4BD4 7E            [ 7] 1112 	ld	a,(hl)
   4BD5 3D            [ 4] 1113 	dec	a
   4BD6 20 21         [12] 1114 	jr	NZ,00106$
   4BD8                    1115 00105$:
                           1116 ;src/draws.h:90: draw(object.x,object.y,object.sprite,2);
   4BD8 ED 5B 39 65   [20] 1117 	ld	de, (#(_object + 0x0004) + 0)
   4BDC 0A            [ 7] 1118 	ld	a,(bc)
   4BDD DD 77 FF      [19] 1119 	ld	-1 (ix),a
   4BE0 21 35 65      [10] 1120 	ld	hl, #_object + 0
   4BE3 4E            [ 7] 1121 	ld	c,(hl)
   4BE4 3E 02         [ 7] 1122 	ld	a,#0x02
   4BE6 F5            [11] 1123 	push	af
   4BE7 33            [ 6] 1124 	inc	sp
   4BE8 D5            [11] 1125 	push	de
   4BE9 DD 7E FF      [19] 1126 	ld	a,-1 (ix)
   4BEC F5            [11] 1127 	push	af
   4BED 33            [ 6] 1128 	inc	sp
   4BEE 79            [ 4] 1129 	ld	a,c
   4BEF F5            [11] 1130 	push	af
   4BF0 33            [ 6] 1131 	inc	sp
   4BF1 CD C2 4A      [17] 1132 	call	_draw
   4BF4 F1            [10] 1133 	pop	af
   4BF5 F1            [10] 1134 	pop	af
   4BF6 33            [ 6] 1135 	inc	sp
   4BF7 18 23         [12] 1136 	jr	00112$
   4BF9                    1137 00106$:
                           1138 ;src/draws.h:91: else if(object.dir == 2 || object.dir == 8 && object.vivo == 1)
   4BF9 7B            [ 4] 1139 	ld	a,e
   4BFA FE 02         [ 7] 1140 	cp	a,#0x02
   4BFC 28 08         [12] 1141 	jr	Z,00101$
   4BFE D6 08         [ 7] 1142 	sub	a, #0x08
   4C00 20 1A         [12] 1143 	jr	NZ,00112$
   4C02 7E            [ 7] 1144 	ld	a,(hl)
   4C03 3D            [ 4] 1145 	dec	a
   4C04 20 16         [12] 1146 	jr	NZ,00112$
   4C06                    1147 00101$:
                           1148 ;src/draws.h:92: draw(object.x,object.y,object.sprite,1);
   4C06 ED 5B 39 65   [20] 1149 	ld	de, (#(_object + 0x0004) + 0)
   4C0A 0A            [ 7] 1150 	ld	a,(bc)
   4C0B 47            [ 4] 1151 	ld	b,a
   4C0C 21 35 65      [10] 1152 	ld	hl, #_object + 0
   4C0F 4E            [ 7] 1153 	ld	c,(hl)
   4C10 3E 01         [ 7] 1154 	ld	a,#0x01
   4C12 F5            [11] 1155 	push	af
   4C13 33            [ 6] 1156 	inc	sp
   4C14 D5            [11] 1157 	push	de
   4C15 C5            [11] 1158 	push	bc
   4C16 CD C2 4A      [17] 1159 	call	_draw
   4C19 F1            [10] 1160 	pop	af
   4C1A F1            [10] 1161 	pop	af
   4C1B 33            [ 6] 1162 	inc	sp
   4C1C                    1163 00112$:
   4C1C 33            [ 6] 1164 	inc	sp
   4C1D DD E1         [14] 1165 	pop	ix
   4C1F C9            [10] 1166 	ret
                           1167 ;src/draws.h:97: void erases(){
                           1168 ;	---------------------------------
                           1169 ; Function erases
                           1170 ; ---------------------------------
   4C20                    1171 _erases::
                           1172 ;src/draws.h:99: erase(player.lx,player.ly,0);
   4C20 21 42 65      [10] 1173 	ld	hl, #_player + 3
   4C23 46            [ 7] 1174 	ld	b,(hl)
   4C24 21 41 65      [10] 1175 	ld	hl, #_player + 2
   4C27 56            [ 7] 1176 	ld	d,(hl)
   4C28 AF            [ 4] 1177 	xor	a, a
   4C29 F5            [11] 1178 	push	af
   4C2A 33            [ 6] 1179 	inc	sp
   4C2B 4A            [ 4] 1180 	ld	c, d
   4C2C C5            [11] 1181 	push	bc
   4C2D CD 22 4B      [17] 1182 	call	_erase
   4C30 F1            [10] 1183 	pop	af
   4C31 33            [ 6] 1184 	inc	sp
                           1185 ;src/draws.h:100: erase(enemy.lx,enemy.ly,0);
   4C32 21 4D 65      [10] 1186 	ld	hl, #_enemy + 3
   4C35 46            [ 7] 1187 	ld	b,(hl)
   4C36 21 4C 65      [10] 1188 	ld	hl, #_enemy + 2
   4C39 56            [ 7] 1189 	ld	d,(hl)
   4C3A AF            [ 4] 1190 	xor	a, a
   4C3B F5            [11] 1191 	push	af
   4C3C 33            [ 6] 1192 	inc	sp
   4C3D 4A            [ 4] 1193 	ld	c, d
   4C3E C5            [11] 1194 	push	bc
   4C3F CD 22 4B      [17] 1195 	call	_erase
   4C42 F1            [10] 1196 	pop	af
   4C43 33            [ 6] 1197 	inc	sp
                           1198 ;src/draws.h:101: if(arrow == 1){
   4C44 3A 31 65      [13] 1199 	ld	a,(#_arrow + 0)
   4C47 3D            [ 4] 1200 	dec	a
   4C48 C0            [11] 1201 	ret	NZ
                           1202 ;src/draws.h:102: if(object.dir == 4 || object.dir == 6)
   4C49 21 3C 65      [10] 1203 	ld	hl, #_object + 7
   4C4C 4E            [ 7] 1204 	ld	c,(hl)
                           1205 ;src/draws.h:103: erase(object.lx,object.ly,2);
   4C4D 21 38 65      [10] 1206 	ld	hl, #_object + 3
   4C50 56            [ 7] 1207 	ld	d,(hl)
   4C51 21 37 65      [10] 1208 	ld	hl, #_object + 2
   4C54 46            [ 7] 1209 	ld	b,(hl)
                           1210 ;src/draws.h:102: if(object.dir == 4 || object.dir == 6)
   4C55 79            [ 4] 1211 	ld	a,c
   4C56 FE 04         [ 7] 1212 	cp	a,#0x04
   4C58 28 04         [12] 1213 	jr	Z,00101$
   4C5A D6 06         [ 7] 1214 	sub	a, #0x06
   4C5C 20 0F         [12] 1215 	jr	NZ,00102$
   4C5E                    1216 00101$:
                           1217 ;src/draws.h:103: erase(object.lx,object.ly,2);
   4C5E 3E 02         [ 7] 1218 	ld	a,#0x02
   4C60 F5            [11] 1219 	push	af
   4C61 33            [ 6] 1220 	inc	sp
   4C62 D5            [11] 1221 	push	de
   4C63 33            [ 6] 1222 	inc	sp
   4C64 C5            [11] 1223 	push	bc
   4C65 33            [ 6] 1224 	inc	sp
   4C66 CD 22 4B      [17] 1225 	call	_erase
   4C69 F1            [10] 1226 	pop	af
   4C6A 33            [ 6] 1227 	inc	sp
   4C6B 18 0D         [12] 1228 	jr	00103$
   4C6D                    1229 00102$:
                           1230 ;src/draws.h:105: erase(object.lx,object.ly,1);
   4C6D 3E 01         [ 7] 1231 	ld	a,#0x01
   4C6F F5            [11] 1232 	push	af
   4C70 33            [ 6] 1233 	inc	sp
   4C71 D5            [11] 1234 	push	de
   4C72 33            [ 6] 1235 	inc	sp
   4C73 C5            [11] 1236 	push	bc
   4C74 33            [ 6] 1237 	inc	sp
   4C75 CD 22 4B      [17] 1238 	call	_erase
   4C78 F1            [10] 1239 	pop	af
   4C79 33            [ 6] 1240 	inc	sp
   4C7A                    1241 00103$:
                           1242 ;src/draws.h:106: if(bound == 1) arrow = 0;
   4C7A 3A 33 65      [13] 1243 	ld	a,(#_bound + 0)
   4C7D 3D            [ 4] 1244 	dec	a
   4C7E C0            [11] 1245 	ret	NZ
   4C7F 21 31 65      [10] 1246 	ld	hl,#_arrow + 0
   4C82 36 00         [10] 1247 	ld	(hl), #0x00
   4C84 C9            [10] 1248 	ret
                           1249 ;src/draws.h:113: void drawFatiga(u8 atk, u8 col){
                           1250 ;	---------------------------------
                           1251 ; Function drawFatiga
                           1252 ; ---------------------------------
   4C85                    1253 _drawFatiga::
   4C85 DD E5         [15] 1254 	push	ix
   4C87 DD 21 00 00   [14] 1255 	ld	ix,#0
   4C8B DD 39         [15] 1256 	add	ix,sp
   4C8D F5            [11] 1257 	push	af
                           1258 ;src/draws.h:115: if(atk < 20)
   4C8E DD 7E 04      [19] 1259 	ld	a,4 (ix)
   4C91 D6 14         [ 7] 1260 	sub	a, #0x14
   4C93 30 04         [12] 1261 	jr	NC,00102$
                           1262 ;src/draws.h:116: col = 2;
   4C95 DD 36 05 02   [19] 1263 	ld	5 (ix),#0x02
   4C99                    1264 00102$:
                           1265 ;src/draws.h:117: if(atk > 30 || atk <= 20){
   4C99 3E 14         [ 7] 1266 	ld	a,#0x14
   4C9B DD 96 04      [19] 1267 	sub	a, 4 (ix)
   4C9E 3E 00         [ 7] 1268 	ld	a,#0x00
   4CA0 17            [ 4] 1269 	rla
   4CA1 DD 77 FE      [19] 1270 	ld	-2 (ix),a
                           1271 ;src/draws.h:119: switch(col){
   4CA4 3E 02         [ 7] 1272 	ld	a,#0x02
   4CA6 DD 96 05      [19] 1273 	sub	a, 5 (ix)
   4CA9 3E 00         [ 7] 1274 	ld	a,#0x00
   4CAB 17            [ 4] 1275 	rla
   4CAC DD 77 FF      [19] 1276 	ld	-1 (ix),a
                           1277 ;src/draws.h:117: if(atk > 30 || atk <= 20){
   4CAF 3E 1E         [ 7] 1278 	ld	a,#0x1E
   4CB1 DD 96 04      [19] 1279 	sub	a, 4 (ix)
   4CB4 38 06         [12] 1280 	jr	C,00107$
   4CB6 DD 7E FE      [19] 1281 	ld	a,-2 (ix)
   4CB9 B7            [ 4] 1282 	or	a, a
   4CBA 20 4F         [12] 1283 	jr	NZ,00108$
   4CBC                    1284 00107$:
                           1285 ;src/draws.h:118: memptr = cpct_getScreenPtr(VMEM,4,192);
   4CBC 21 04 C0      [10] 1286 	ld	hl,#0xC004
   4CBF E5            [11] 1287 	push	hl
   4CC0 2E 00         [ 7] 1288 	ld	l, #0x00
   4CC2 E5            [11] 1289 	push	hl
   4CC3 CD EB 63      [17] 1290 	call	_cpct_getScreenPtr
                           1291 ;src/draws.h:119: switch(col){
   4CC6 DD 7E FF      [19] 1292 	ld	a,-1 (ix)
   4CC9 B7            [ 4] 1293 	or	a, a
   4CCA 20 3F         [12] 1294 	jr	NZ,00108$
                           1295 ;src/draws.h:121: cpct_drawSolidBox(memptr, col, 2, 8);
   4CCC 4D            [ 4] 1296 	ld	c, l
   4CCD 44            [ 4] 1297 	ld	b, h
                           1298 ;src/draws.h:119: switch(col){
   4CCE DD 5E 05      [19] 1299 	ld	e,5 (ix)
   4CD1 16 00         [ 7] 1300 	ld	d,#0x00
   4CD3 21 D9 4C      [10] 1301 	ld	hl,#00156$
   4CD6 19            [11] 1302 	add	hl,de
   4CD7 19            [11] 1303 	add	hl,de
                           1304 ;src/draws.h:120: case 0:
   4CD8 E9            [ 4] 1305 	jp	(hl)
   4CD9                    1306 00156$:
   4CD9 18 04         [12] 1307 	jr	00103$
   4CDB 18 14         [12] 1308 	jr	00104$
   4CDD 18 20         [12] 1309 	jr	00105$
   4CDF                    1310 00103$:
                           1311 ;src/draws.h:121: cpct_drawSolidBox(memptr, col, 2, 8);
   4CDF 21 02 08      [10] 1312 	ld	hl,#0x0802
   4CE2 E5            [11] 1313 	push	hl
   4CE3 DD 7E 05      [19] 1314 	ld	a,5 (ix)
   4CE6 F5            [11] 1315 	push	af
   4CE7 33            [ 6] 1316 	inc	sp
   4CE8 C5            [11] 1317 	push	bc
   4CE9 CD 33 63      [17] 1318 	call	_cpct_drawSolidBox
   4CEC F1            [10] 1319 	pop	af
   4CED F1            [10] 1320 	pop	af
   4CEE 33            [ 6] 1321 	inc	sp
                           1322 ;src/draws.h:122: break;
   4CEF 18 1A         [12] 1323 	jr	00108$
                           1324 ;src/draws.h:123: case 1:
   4CF1                    1325 00104$:
                           1326 ;src/draws.h:124: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4CF1 11 80 46      [10] 1327 	ld	de,#_fatiga_nor
   4CF4 21 02 08      [10] 1328 	ld	hl,#0x0802
   4CF7 E5            [11] 1329 	push	hl
   4CF8 C5            [11] 1330 	push	bc
   4CF9 D5            [11] 1331 	push	de
   4CFA CD AD 62      [17] 1332 	call	_cpct_drawSpriteMasked
                           1333 ;src/draws.h:125: break;
   4CFD 18 0C         [12] 1334 	jr	00108$
                           1335 ;src/draws.h:126: case 2:
   4CFF                    1336 00105$:
                           1337 ;src/draws.h:127: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4CFF 11 A0 46      [10] 1338 	ld	de,#_fatiga_full
   4D02 21 02 08      [10] 1339 	ld	hl,#0x0802
   4D05 E5            [11] 1340 	push	hl
   4D06 C5            [11] 1341 	push	bc
   4D07 D5            [11] 1342 	push	de
   4D08 CD AD 62      [17] 1343 	call	_cpct_drawSpriteMasked
                           1344 ;src/draws.h:128: }
   4D0B                    1345 00108$:
                           1346 ;src/draws.h:130: if(atk > 40 || atk <= 20){
   4D0B 3E 28         [ 7] 1347 	ld	a,#0x28
   4D0D DD 96 04      [19] 1348 	sub	a, 4 (ix)
   4D10 38 06         [12] 1349 	jr	C,00114$
   4D12 DD 7E FE      [19] 1350 	ld	a,-2 (ix)
   4D15 B7            [ 4] 1351 	or	a, a
   4D16 20 4F         [12] 1352 	jr	NZ,00115$
   4D18                    1353 00114$:
                           1354 ;src/draws.h:131: memptr = cpct_getScreenPtr(VMEM,7,192);
   4D18 21 07 C0      [10] 1355 	ld	hl,#0xC007
   4D1B E5            [11] 1356 	push	hl
   4D1C 2E 00         [ 7] 1357 	ld	l, #0x00
   4D1E E5            [11] 1358 	push	hl
   4D1F CD EB 63      [17] 1359 	call	_cpct_getScreenPtr
                           1360 ;src/draws.h:132: switch(col){
   4D22 DD 7E FF      [19] 1361 	ld	a,-1 (ix)
   4D25 B7            [ 4] 1362 	or	a, a
   4D26 20 3F         [12] 1363 	jr	NZ,00115$
                           1364 ;src/draws.h:121: cpct_drawSolidBox(memptr, col, 2, 8);
   4D28 4D            [ 4] 1365 	ld	c, l
   4D29 44            [ 4] 1366 	ld	b, h
                           1367 ;src/draws.h:132: switch(col){
   4D2A DD 5E 05      [19] 1368 	ld	e,5 (ix)
   4D2D 16 00         [ 7] 1369 	ld	d,#0x00
   4D2F 21 35 4D      [10] 1370 	ld	hl,#00157$
   4D32 19            [11] 1371 	add	hl,de
   4D33 19            [11] 1372 	add	hl,de
                           1373 ;src/draws.h:133: case 0:
   4D34 E9            [ 4] 1374 	jp	(hl)
   4D35                    1375 00157$:
   4D35 18 04         [12] 1376 	jr	00110$
   4D37 18 14         [12] 1377 	jr	00111$
   4D39 18 20         [12] 1378 	jr	00112$
   4D3B                    1379 00110$:
                           1380 ;src/draws.h:134: cpct_drawSolidBox(memptr, col, 2, 8);
   4D3B 21 02 08      [10] 1381 	ld	hl,#0x0802
   4D3E E5            [11] 1382 	push	hl
   4D3F DD 7E 05      [19] 1383 	ld	a,5 (ix)
   4D42 F5            [11] 1384 	push	af
   4D43 33            [ 6] 1385 	inc	sp
   4D44 C5            [11] 1386 	push	bc
   4D45 CD 33 63      [17] 1387 	call	_cpct_drawSolidBox
   4D48 F1            [10] 1388 	pop	af
   4D49 F1            [10] 1389 	pop	af
   4D4A 33            [ 6] 1390 	inc	sp
                           1391 ;src/draws.h:135: break;
   4D4B 18 1A         [12] 1392 	jr	00115$
                           1393 ;src/draws.h:136: case 1:
   4D4D                    1394 00111$:
                           1395 ;src/draws.h:137: cpct_drawSpriteMasked(fatiga_nor, memptr, 2, 8);
   4D4D 11 80 46      [10] 1396 	ld	de,#_fatiga_nor
   4D50 21 02 08      [10] 1397 	ld	hl,#0x0802
   4D53 E5            [11] 1398 	push	hl
   4D54 C5            [11] 1399 	push	bc
   4D55 D5            [11] 1400 	push	de
   4D56 CD AD 62      [17] 1401 	call	_cpct_drawSpriteMasked
                           1402 ;src/draws.h:138: break;
   4D59 18 0C         [12] 1403 	jr	00115$
                           1404 ;src/draws.h:139: case 2:
   4D5B                    1405 00112$:
                           1406 ;src/draws.h:140: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4D5B 11 A0 46      [10] 1407 	ld	de,#_fatiga_full
   4D5E 21 02 08      [10] 1408 	ld	hl,#0x0802
   4D61 E5            [11] 1409 	push	hl
   4D62 C5            [11] 1410 	push	bc
   4D63 D5            [11] 1411 	push	de
   4D64 CD AD 62      [17] 1412 	call	_cpct_drawSpriteMasked
                           1413 ;src/draws.h:141: }
   4D67                    1414 00115$:
                           1415 ;src/draws.h:143: if(atk <= 20){
   4D67 DD 7E FE      [19] 1416 	ld	a,-2 (ix)
   4D6A B7            [ 4] 1417 	or	a, a
   4D6B 20 39         [12] 1418 	jr	NZ,00122$
                           1419 ;src/draws.h:144: memptr = cpct_getScreenPtr(VMEM,10,192);
   4D6D 21 0A C0      [10] 1420 	ld	hl,#0xC00A
   4D70 E5            [11] 1421 	push	hl
   4D71 2E 00         [ 7] 1422 	ld	l, #0x00
   4D73 E5            [11] 1423 	push	hl
   4D74 CD EB 63      [17] 1424 	call	_cpct_getScreenPtr
                           1425 ;src/draws.h:121: cpct_drawSolidBox(memptr, col, 2, 8);
   4D77 4D            [ 4] 1426 	ld	c, l
   4D78 44            [ 4] 1427 	ld	b, h
                           1428 ;src/draws.h:145: switch(col){
   4D79 DD 7E 05      [19] 1429 	ld	a,5 (ix)
   4D7C B7            [ 4] 1430 	or	a, a
   4D7D 28 09         [12] 1431 	jr	Z,00117$
   4D7F DD 7E 05      [19] 1432 	ld	a,5 (ix)
   4D82 D6 02         [ 7] 1433 	sub	a, #0x02
   4D84 28 14         [12] 1434 	jr	Z,00118$
   4D86 18 1E         [12] 1435 	jr	00122$
                           1436 ;src/draws.h:146: case 0:
   4D88                    1437 00117$:
                           1438 ;src/draws.h:147: cpct_drawSolidBox(memptr, col, 2, 8);
   4D88 21 02 08      [10] 1439 	ld	hl,#0x0802
   4D8B E5            [11] 1440 	push	hl
   4D8C DD 7E 05      [19] 1441 	ld	a,5 (ix)
   4D8F F5            [11] 1442 	push	af
   4D90 33            [ 6] 1443 	inc	sp
   4D91 C5            [11] 1444 	push	bc
   4D92 CD 33 63      [17] 1445 	call	_cpct_drawSolidBox
   4D95 F1            [10] 1446 	pop	af
   4D96 F1            [10] 1447 	pop	af
   4D97 33            [ 6] 1448 	inc	sp
                           1449 ;src/draws.h:148: break;
   4D98 18 0C         [12] 1450 	jr	00122$
                           1451 ;src/draws.h:149: case 2:
   4D9A                    1452 00118$:
                           1453 ;src/draws.h:150: cpct_drawSpriteMasked(fatiga_full, memptr, 2, 8);
   4D9A 11 A0 46      [10] 1454 	ld	de,#_fatiga_full
   4D9D 21 02 08      [10] 1455 	ld	hl,#0x0802
   4DA0 E5            [11] 1456 	push	hl
   4DA1 C5            [11] 1457 	push	bc
   4DA2 D5            [11] 1458 	push	de
   4DA3 CD AD 62      [17] 1459 	call	_cpct_drawSpriteMasked
                           1460 ;src/draws.h:151: }
   4DA6                    1461 00122$:
   4DA6 DD F9         [10] 1462 	ld	sp, ix
   4DA8 DD E1         [14] 1463 	pop	ix
   4DAA C9            [10] 1464 	ret
                           1465 ;src/draws.h:156: void drawPickUps(u8 corazon, u8 bullet){
                           1466 ;	---------------------------------
                           1467 ; Function drawPickUps
                           1468 ; ---------------------------------
   4DAB                    1469 _drawPickUps::
   4DAB DD E5         [15] 1470 	push	ix
   4DAD DD 21 00 00   [14] 1471 	ld	ix,#0
   4DB1 DD 39         [15] 1472 	add	ix,sp
                           1473 ;src/draws.h:159: memptr = cpct_getScreenPtr(VMEM, 1*tilewidth, 10*tileheight);
   4DB3 21 04 A0      [10] 1474 	ld	hl,#0xA004
   4DB6 E5            [11] 1475 	push	hl
   4DB7 21 00 C0      [10] 1476 	ld	hl,#0xC000
   4DBA E5            [11] 1477 	push	hl
   4DBB CD EB 63      [17] 1478 	call	_cpct_getScreenPtr
                           1479 ;src/draws.h:161: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4DBE 4D            [ 4] 1480 	ld	c, l
   4DBF 44            [ 4] 1481 	ld	b, h
                           1482 ;src/draws.h:160: if(corazon == 0)
   4DC0 DD 7E 04      [19] 1483 	ld	a,4 (ix)
   4DC3 B7            [ 4] 1484 	or	a, a
   4DC4 20 0E         [12] 1485 	jr	NZ,00102$
                           1486 ;src/draws.h:161: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4DC6 11 00 46      [10] 1487 	ld	de,#_corazon_lleno
   4DC9 21 04 08      [10] 1488 	ld	hl,#0x0804
   4DCC E5            [11] 1489 	push	hl
   4DCD C5            [11] 1490 	push	bc
   4DCE D5            [11] 1491 	push	de
   4DCF CD AD 62      [17] 1492 	call	_cpct_drawSpriteMasked
   4DD2 18 0E         [12] 1493 	jr	00103$
   4DD4                    1494 00102$:
                           1495 ;src/draws.h:163: cpct_drawSolidBox(memptr, 0, 4, 8);
   4DD4 21 04 08      [10] 1496 	ld	hl,#0x0804
   4DD7 E5            [11] 1497 	push	hl
   4DD8 AF            [ 4] 1498 	xor	a, a
   4DD9 F5            [11] 1499 	push	af
   4DDA 33            [ 6] 1500 	inc	sp
   4DDB C5            [11] 1501 	push	bc
   4DDC CD 33 63      [17] 1502 	call	_cpct_drawSolidBox
   4DDF F1            [10] 1503 	pop	af
   4DE0 F1            [10] 1504 	pop	af
   4DE1 33            [ 6] 1505 	inc	sp
   4DE2                    1506 00103$:
                           1507 ;src/draws.h:165: memptr = cpct_getScreenPtr(VMEM, 2*tilewidth, 1*tileheight);
   4DE2 21 08 10      [10] 1508 	ld	hl,#0x1008
   4DE5 E5            [11] 1509 	push	hl
   4DE6 21 00 C0      [10] 1510 	ld	hl,#0xC000
   4DE9 E5            [11] 1511 	push	hl
   4DEA CD EB 63      [17] 1512 	call	_cpct_getScreenPtr
                           1513 ;src/draws.h:161: cpct_drawSpriteMasked(corazon_lleno,memptr,4,8);
   4DED EB            [ 4] 1514 	ex	de,hl
                           1515 ;src/draws.h:166: if(bullet == 0)
   4DEE DD 7E 05      [19] 1516 	ld	a,5 (ix)
   4DF1 B7            [ 4] 1517 	or	a, a
   4DF2 20 0E         [12] 1518 	jr	NZ,00105$
                           1519 ;src/draws.h:167: cpct_drawSpriteMasked(flecha_arriba,memptr,2,8);
   4DF4 01 AE 60      [10] 1520 	ld	bc,#_flecha_arriba
   4DF7 21 02 08      [10] 1521 	ld	hl,#0x0802
   4DFA E5            [11] 1522 	push	hl
   4DFB D5            [11] 1523 	push	de
   4DFC C5            [11] 1524 	push	bc
   4DFD CD AD 62      [17] 1525 	call	_cpct_drawSpriteMasked
   4E00 18 0E         [12] 1526 	jr	00107$
   4E02                    1527 00105$:
                           1528 ;src/draws.h:169: cpct_drawSolidBox(memptr, 0, 2, 8);
   4E02 21 02 08      [10] 1529 	ld	hl,#0x0802
   4E05 E5            [11] 1530 	push	hl
   4E06 AF            [ 4] 1531 	xor	a, a
   4E07 F5            [11] 1532 	push	af
   4E08 33            [ 6] 1533 	inc	sp
   4E09 D5            [11] 1534 	push	de
   4E0A CD 33 63      [17] 1535 	call	_cpct_drawSolidBox
   4E0D F1            [10] 1536 	pop	af
   4E0E F1            [10] 1537 	pop	af
   4E0F 33            [ 6] 1538 	inc	sp
   4E10                    1539 00107$:
   4E10 DD E1         [14] 1540 	pop	ix
   4E12 C9            [10] 1541 	ret
                           1542 ;src/draws.h:174: void drawVida(u8 life){
                           1543 ;	---------------------------------
                           1544 ; Function drawVida
                           1545 ; ---------------------------------
   4E13                    1546 _drawVida::
   4E13 DD E5         [15] 1547 	push	ix
   4E15 DD 21 00 00   [14] 1548 	ld	ix,#0
   4E19 DD 39         [15] 1549 	add	ix,sp
   4E1B 3B            [ 6] 1550 	dec	sp
                           1551 ;src/draws.h:179: for(i=1;i<=3;i++){
   4E1C DD 36 FF 01   [19] 1552 	ld	-1 (ix),#0x01
   4E20 01 41 00      [10] 1553 	ld	bc,#0x0041
   4E23                    1554 00105$:
                           1555 ;src/draws.h:180: memptr = cpct_getScreenPtr(VMEM,p,192);
   4E23 51            [ 4] 1556 	ld	d,c
   4E24 C5            [11] 1557 	push	bc
   4E25 3E C0         [ 7] 1558 	ld	a,#0xC0
   4E27 F5            [11] 1559 	push	af
   4E28 33            [ 6] 1560 	inc	sp
   4E29 D5            [11] 1561 	push	de
   4E2A 33            [ 6] 1562 	inc	sp
   4E2B 21 00 C0      [10] 1563 	ld	hl,#0xC000
   4E2E E5            [11] 1564 	push	hl
   4E2F CD EB 63      [17] 1565 	call	_cpct_getScreenPtr
   4E32 C1            [10] 1566 	pop	bc
                           1567 ;src/draws.h:181: p+=5;
   4E33 03            [ 6] 1568 	inc	bc
   4E34 03            [ 6] 1569 	inc	bc
   4E35 03            [ 6] 1570 	inc	bc
   4E36 03            [ 6] 1571 	inc	bc
   4E37 03            [ 6] 1572 	inc	bc
                           1573 ;src/draws.h:182: if(i<=life)  cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4E38 EB            [ 4] 1574 	ex	de,hl
   4E39 DD 7E 04      [19] 1575 	ld	a,4 (ix)
   4E3C DD 96 FF      [19] 1576 	sub	a, -1 (ix)
   4E3F 38 10         [12] 1577 	jr	C,00102$
   4E41 C5            [11] 1578 	push	bc
   4E42 21 04 08      [10] 1579 	ld	hl,#0x0804
   4E45 E5            [11] 1580 	push	hl
   4E46 D5            [11] 1581 	push	de
   4E47 21 00 46      [10] 1582 	ld	hl,#_corazon_lleno
   4E4A E5            [11] 1583 	push	hl
   4E4B CD AD 62      [17] 1584 	call	_cpct_drawSpriteMasked
   4E4E C1            [10] 1585 	pop	bc
   4E4F 18 1E         [12] 1586 	jr	00106$
   4E51                    1587 00102$:
                           1588 ;src/draws.h:184: cpct_drawSolidBox(memptr,0,4,8);
   4E51 C5            [11] 1589 	push	bc
   4E52 D5            [11] 1590 	push	de
   4E53 21 04 08      [10] 1591 	ld	hl,#0x0804
   4E56 E5            [11] 1592 	push	hl
   4E57 AF            [ 4] 1593 	xor	a, a
   4E58 F5            [11] 1594 	push	af
   4E59 33            [ 6] 1595 	inc	sp
   4E5A D5            [11] 1596 	push	de
   4E5B CD 33 63      [17] 1597 	call	_cpct_drawSolidBox
   4E5E F1            [10] 1598 	pop	af
   4E5F F1            [10] 1599 	pop	af
   4E60 33            [ 6] 1600 	inc	sp
   4E61 D1            [10] 1601 	pop	de
   4E62 21 04 08      [10] 1602 	ld	hl,#0x0804
   4E65 E5            [11] 1603 	push	hl
   4E66 D5            [11] 1604 	push	de
   4E67 21 40 46      [10] 1605 	ld	hl,#_corazon_roto
   4E6A E5            [11] 1606 	push	hl
   4E6B CD AD 62      [17] 1607 	call	_cpct_drawSpriteMasked
   4E6E C1            [10] 1608 	pop	bc
   4E6F                    1609 00106$:
                           1610 ;src/draws.h:179: for(i=1;i<=3;i++){
   4E6F DD 34 FF      [23] 1611 	inc	-1 (ix)
   4E72 3E 03         [ 7] 1612 	ld	a,#0x03
   4E74 DD 96 FF      [19] 1613 	sub	a, -1 (ix)
   4E77 30 AA         [12] 1614 	jr	NC,00105$
   4E79 33            [ 6] 1615 	inc	sp
   4E7A DD E1         [14] 1616 	pop	ix
   4E7C C9            [10] 1617 	ret
                           1618 ;src/draws.h:191: void drawBullets(u8 bullet){
                           1619 ;	---------------------------------
                           1620 ; Function drawBullets
                           1621 ; ---------------------------------
   4E7D                    1622 _drawBullets::
   4E7D DD E5         [15] 1623 	push	ix
   4E7F DD 21 00 00   [14] 1624 	ld	ix,#0
   4E83 DD 39         [15] 1625 	add	ix,sp
   4E85 3B            [ 6] 1626 	dec	sp
                           1627 ;src/draws.h:195: for(i=1;i<=3;i++){
   4E86 DD 36 FF 01   [19] 1628 	ld	-1 (ix),#0x01
   4E8A 01 32 00      [10] 1629 	ld	bc,#0x0032
   4E8D                    1630 00105$:
                           1631 ;src/draws.h:196: memptr = cpct_getScreenPtr(VMEM,p,192);
   4E8D 51            [ 4] 1632 	ld	d,c
   4E8E C5            [11] 1633 	push	bc
   4E8F 3E C0         [ 7] 1634 	ld	a,#0xC0
   4E91 F5            [11] 1635 	push	af
   4E92 33            [ 6] 1636 	inc	sp
   4E93 D5            [11] 1637 	push	de
   4E94 33            [ 6] 1638 	inc	sp
   4E95 21 00 C0      [10] 1639 	ld	hl,#0xC000
   4E98 E5            [11] 1640 	push	hl
   4E99 CD EB 63      [17] 1641 	call	_cpct_getScreenPtr
   4E9C C1            [10] 1642 	pop	bc
                           1643 ;src/draws.h:197: p+=5;
   4E9D 03            [ 6] 1644 	inc	bc
   4E9E 03            [ 6] 1645 	inc	bc
   4E9F 03            [ 6] 1646 	inc	bc
   4EA0 03            [ 6] 1647 	inc	bc
   4EA1 03            [ 6] 1648 	inc	bc
                           1649 ;src/draws.h:198: if(i<=bullet) cpct_drawSpriteMasked(flecha_arriba, memptr, 2, 8);
   4EA2 EB            [ 4] 1650 	ex	de,hl
   4EA3 DD 7E 04      [19] 1651 	ld	a,4 (ix)
   4EA6 DD 96 FF      [19] 1652 	sub	a, -1 (ix)
   4EA9 38 10         [12] 1653 	jr	C,00102$
   4EAB C5            [11] 1654 	push	bc
   4EAC 21 02 08      [10] 1655 	ld	hl,#0x0802
   4EAF E5            [11] 1656 	push	hl
   4EB0 D5            [11] 1657 	push	de
   4EB1 21 AE 60      [10] 1658 	ld	hl,#_flecha_arriba
   4EB4 E5            [11] 1659 	push	hl
   4EB5 CD AD 62      [17] 1660 	call	_cpct_drawSpriteMasked
   4EB8 C1            [10] 1661 	pop	bc
   4EB9 18 10         [12] 1662 	jr	00106$
   4EBB                    1663 00102$:
                           1664 ;src/draws.h:199: else  cpct_drawSolidBox(memptr,0,2,8);
   4EBB C5            [11] 1665 	push	bc
   4EBC 21 02 08      [10] 1666 	ld	hl,#0x0802
   4EBF E5            [11] 1667 	push	hl
   4EC0 AF            [ 4] 1668 	xor	a, a
   4EC1 F5            [11] 1669 	push	af
   4EC2 33            [ 6] 1670 	inc	sp
   4EC3 D5            [11] 1671 	push	de
   4EC4 CD 33 63      [17] 1672 	call	_cpct_drawSolidBox
   4EC7 F1            [10] 1673 	pop	af
   4EC8 F1            [10] 1674 	pop	af
   4EC9 33            [ 6] 1675 	inc	sp
   4ECA C1            [10] 1676 	pop	bc
   4ECB                    1677 00106$:
                           1678 ;src/draws.h:195: for(i=1;i<=3;i++){
   4ECB DD 34 FF      [23] 1679 	inc	-1 (ix)
   4ECE 3E 03         [ 7] 1680 	ld	a,#0x03
   4ED0 DD 96 FF      [19] 1681 	sub	a, -1 (ix)
   4ED3 30 B8         [12] 1682 	jr	NC,00105$
   4ED5 33            [ 6] 1683 	inc	sp
   4ED6 DD E1         [14] 1684 	pop	ix
   4ED8 C9            [10] 1685 	ret
                           1686 ;src/CalcColision.h:7: u8 checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8 atk){
                           1687 ;	---------------------------------
                           1688 ; Function checkCollisions
                           1689 ; ---------------------------------
   4ED9                    1690 _checkCollisions::
   4ED9 DD E5         [15] 1691 	push	ix
   4EDB DD 21 00 00   [14] 1692 	ld	ix,#0
   4EDF DD 39         [15] 1693 	add	ix,sp
   4EE1 21 FA FF      [10] 1694 	ld	hl,#-6
   4EE4 39            [11] 1695 	add	hl,sp
   4EE5 F9            [ 6] 1696 	ld	sp,hl
                           1697 ;src/CalcColision.h:8: u8 popX = pX + tilewidth;
   4EE6 DD 6E 04      [19] 1698 	ld	l,4 (ix)
   4EE9 2C            [ 4] 1699 	inc	l
   4EEA 2C            [ 4] 1700 	inc	l
   4EEB 2C            [ 4] 1701 	inc	l
   4EEC 2C            [ 4] 1702 	inc	l
                           1703 ;src/CalcColision.h:9: u8 popY = pY + tileheight;
   4EED DD 7E 05      [19] 1704 	ld	a,5 (ix)
   4EF0 C6 10         [ 7] 1705 	add	a, #0x10
   4EF2 DD 77 FB      [19] 1706 	ld	-5 (ix),a
                           1707 ;src/CalcColision.h:10: u8 eopX = eX + tilewidth;
   4EF5 DD 5E 06      [19] 1708 	ld	e,6 (ix)
   4EF8 1C            [ 4] 1709 	inc	e
   4EF9 1C            [ 4] 1710 	inc	e
   4EFA 1C            [ 4] 1711 	inc	e
   4EFB 1C            [ 4] 1712 	inc	e
                           1713 ;src/CalcColision.h:11: u8 eopY = eY + tileheight;
   4EFC DD 7E 07      [19] 1714 	ld	a,7 (ix)
   4EFF C6 10         [ 7] 1715 	add	a, #0x10
   4F01 DD 77 FA      [19] 1716 	ld	-6 (ix),a
                           1717 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   4F04 7B            [ 4] 1718 	ld	a,e
   4F05 DD 96 04      [19] 1719 	sub	a, 4 (ix)
   4F08 3E 00         [ 7] 1720 	ld	a,#0x00
   4F0A 17            [ 4] 1721 	rla
   4F0B DD 77 FF      [19] 1722 	ld	-1 (ix),a
   4F0E 7D            [ 4] 1723 	ld	a,l
   4F0F 93            [ 4] 1724 	sub	a, e
   4F10 3E 00         [ 7] 1725 	ld	a,#0x00
   4F12 17            [ 4] 1726 	rla
   4F13 DD 77 FE      [19] 1727 	ld	-2 (ix),a
   4F16 DD 7E 07      [19] 1728 	ld	a,7 (ix)
   4F19 DD 96 05      [19] 1729 	sub	a, 5 (ix)
   4F1C 3E 00         [ 7] 1730 	ld	a,#0x00
   4F1E 17            [ 4] 1731 	rla
   4F1F 5F            [ 4] 1732 	ld	e,a
   4F20 DD 7E FB      [19] 1733 	ld	a,-5 (ix)
   4F23 DD 96 07      [19] 1734 	sub	a, 7 (ix)
   4F26 3E 00         [ 7] 1735 	ld	a,#0x00
   4F28 17            [ 4] 1736 	rla
   4F29 4F            [ 4] 1737 	ld	c,a
                           1738 ;src/CalcColision.h:14: if(atk >= 21)
   4F2A DD 7E 08      [19] 1739 	ld	a,8 (ix)
   4F2D D6 15         [ 7] 1740 	sub	a, #0x15
   4F2F 3E 00         [ 7] 1741 	ld	a,#0x00
   4F31 17            [ 4] 1742 	rla
   4F32 DD 77 FD      [19] 1743 	ld	-3 (ix),a
                           1744 ;src/CalcColision.h:13: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   4F35 DD 7E FF      [19] 1745 	ld	a,-1 (ix)
   4F38 B7            [ 4] 1746 	or	a, a
   4F39 20 1C         [12] 1747 	jr	NZ,00105$
   4F3B DD 7E FE      [19] 1748 	ld	a,-2 (ix)
   4F3E B7            [ 4] 1749 	or	a,a
   4F3F 20 16         [12] 1750 	jr	NZ,00105$
   4F41 B3            [ 4] 1751 	or	a,e
   4F42 20 13         [12] 1752 	jr	NZ,00105$
   4F44 B1            [ 4] 1753 	or	a,c
   4F45 20 10         [12] 1754 	jr	NZ,00105$
                           1755 ;src/CalcColision.h:14: if(atk >= 21)
   4F47 DD 7E FD      [19] 1756 	ld	a,-3 (ix)
   4F4A B7            [ 4] 1757 	or	a, a
   4F4B 20 05         [12] 1758 	jr	NZ,00102$
                           1759 ;src/CalcColision.h:15: return 1;
   4F4D 2E 01         [ 7] 1760 	ld	l,#0x01
   4F4F C3 DB 4F      [10] 1761 	jp	00133$
   4F52                    1762 00102$:
                           1763 ;src/CalcColision.h:17: return 2;
   4F52 2E 02         [ 7] 1764 	ld	l,#0x02
   4F54 C3 DB 4F      [10] 1765 	jp	00133$
   4F57                    1766 00105$:
                           1767 ;src/CalcColision.h:19: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   4F57 DD 7E 06      [19] 1768 	ld	a,6 (ix)
   4F5A DD 96 04      [19] 1769 	sub	a, 4 (ix)
   4F5D 3E 00         [ 7] 1770 	ld	a,#0x00
   4F5F 17            [ 4] 1771 	rla
   4F60 DD 77 FC      [19] 1772 	ld	-4 (ix),a
   4F63 7D            [ 4] 1773 	ld	a,l
   4F64 DD 96 06      [19] 1774 	sub	a, 6 (ix)
   4F67 3E 00         [ 7] 1775 	ld	a,#0x00
   4F69 17            [ 4] 1776 	rla
   4F6A 6F            [ 4] 1777 	ld	l,a
   4F6B DD 7E FC      [19] 1778 	ld	a,-4 (ix)
   4F6E B7            [ 4] 1779 	or	a,a
   4F6F 20 17         [12] 1780 	jr	NZ,00113$
   4F71 B5            [ 4] 1781 	or	a,l
   4F72 20 14         [12] 1782 	jr	NZ,00113$
   4F74 B3            [ 4] 1783 	or	a,e
   4F75 20 11         [12] 1784 	jr	NZ,00113$
   4F77 B1            [ 4] 1785 	or	a,c
   4F78 20 0E         [12] 1786 	jr	NZ,00113$
                           1787 ;src/CalcColision.h:20: if(atk >= 21)
   4F7A DD 7E FD      [19] 1788 	ld	a,-3 (ix)
   4F7D B7            [ 4] 1789 	or	a, a
   4F7E 20 04         [12] 1790 	jr	NZ,00110$
                           1791 ;src/CalcColision.h:21: return 1;
   4F80 2E 01         [ 7] 1792 	ld	l,#0x01
   4F82 18 57         [12] 1793 	jr	00133$
   4F84                    1794 00110$:
                           1795 ;src/CalcColision.h:23: return 2;
   4F84 2E 02         [ 7] 1796 	ld	l,#0x02
   4F86 18 53         [12] 1797 	jr	00133$
   4F88                    1798 00113$:
                           1799 ;src/CalcColision.h:25: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   4F88 DD 7E FA      [19] 1800 	ld	a,-6 (ix)
   4F8B DD 96 05      [19] 1801 	sub	a, 5 (ix)
   4F8E 3E 00         [ 7] 1802 	ld	a,#0x00
   4F90 17            [ 4] 1803 	rla
   4F91 5F            [ 4] 1804 	ld	e,a
   4F92 DD 7E FB      [19] 1805 	ld	a,-5 (ix)
   4F95 DD 96 FA      [19] 1806 	sub	a, -6 (ix)
   4F98 3E 00         [ 7] 1807 	ld	a,#0x00
   4F9A 17            [ 4] 1808 	rla
   4F9B 67            [ 4] 1809 	ld	h,a
   4F9C DD 7E FC      [19] 1810 	ld	a,-4 (ix)
   4F9F B7            [ 4] 1811 	or	a,a
   4FA0 20 17         [12] 1812 	jr	NZ,00121$
   4FA2 B5            [ 4] 1813 	or	a,l
   4FA3 20 14         [12] 1814 	jr	NZ,00121$
   4FA5 B3            [ 4] 1815 	or	a,e
   4FA6 20 11         [12] 1816 	jr	NZ,00121$
   4FA8 B4            [ 4] 1817 	or	a,h
   4FA9 20 0E         [12] 1818 	jr	NZ,00121$
                           1819 ;src/CalcColision.h:26: if(atk >= 21)
   4FAB DD 7E FD      [19] 1820 	ld	a,-3 (ix)
   4FAE B7            [ 4] 1821 	or	a, a
   4FAF 20 04         [12] 1822 	jr	NZ,00118$
                           1823 ;src/CalcColision.h:27: return 1;
   4FB1 2E 01         [ 7] 1824 	ld	l,#0x01
   4FB3 18 26         [12] 1825 	jr	00133$
   4FB5                    1826 00118$:
                           1827 ;src/CalcColision.h:29: return 2;
   4FB5 2E 02         [ 7] 1828 	ld	l,#0x02
   4FB7 18 22         [12] 1829 	jr	00133$
   4FB9                    1830 00121$:
                           1831 ;src/CalcColision.h:31: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   4FB9 DD 7E FF      [19] 1832 	ld	a,-1 (ix)
   4FBC B7            [ 4] 1833 	or	a, a
   4FBD 20 1A         [12] 1834 	jr	NZ,00129$
   4FBF DD 7E FE      [19] 1835 	ld	a,-2 (ix)
   4FC2 B7            [ 4] 1836 	or	a,a
   4FC3 20 14         [12] 1837 	jr	NZ,00129$
   4FC5 B3            [ 4] 1838 	or	a,e
   4FC6 20 11         [12] 1839 	jr	NZ,00129$
   4FC8 B4            [ 4] 1840 	or	a,h
   4FC9 20 0E         [12] 1841 	jr	NZ,00129$
                           1842 ;src/CalcColision.h:32: if(atk >= 21)
   4FCB DD 7E FD      [19] 1843 	ld	a,-3 (ix)
   4FCE B7            [ 4] 1844 	or	a, a
   4FCF 20 04         [12] 1845 	jr	NZ,00126$
                           1846 ;src/CalcColision.h:33: return 1;
   4FD1 2E 01         [ 7] 1847 	ld	l,#0x01
   4FD3 18 06         [12] 1848 	jr	00133$
   4FD5                    1849 00126$:
                           1850 ;src/CalcColision.h:35: return 2;
   4FD5 2E 02         [ 7] 1851 	ld	l,#0x02
   4FD7 18 02         [12] 1852 	jr	00133$
   4FD9                    1853 00129$:
                           1854 ;src/CalcColision.h:37: return 0;
   4FD9 2E 00         [ 7] 1855 	ld	l,#0x00
   4FDB                    1856 00133$:
   4FDB DD F9         [10] 1857 	ld	sp, ix
   4FDD DD E1         [14] 1858 	pop	ix
   4FDF C9            [10] 1859 	ret
                           1860 ;src/keyboard.h:13: u8* checkKeyboard(){
                           1861 ;	---------------------------------
                           1862 ; Function checkKeyboard
                           1863 ; ---------------------------------
   4FE0                    1864 _checkKeyboard::
   4FE0 DD E5         [15] 1865 	push	ix
   4FE2 DD 21 00 00   [14] 1866 	ld	ix,#0
   4FE6 DD 39         [15] 1867 	add	ix,sp
   4FE8 21 FA FF      [10] 1868 	ld	hl,#-6
   4FEB 39            [11] 1869 	add	hl,sp
   4FEC F9            [ 6] 1870 	ld	sp,hl
                           1871 ;src/keyboard.h:14: u8 *s = NULL;
   4FED DD 36 FC 00   [19] 1872 	ld	-4 (ix),#0x00
   4FF1 DD 36 FD 00   [19] 1873 	ld	-3 (ix),#0x00
                           1874 ;src/keyboard.h:15: if(cpct_isKeyPressed(Key_Space) && player.atk>=20){
   4FF5 21 05 80      [10] 1875 	ld	hl,#0x8005
   4FF8 CD 52 61      [17] 1876 	call	_cpct_isKeyPressed
   4FFB 7D            [ 4] 1877 	ld	a,l
   4FFC B7            [ 4] 1878 	or	a, a
   4FFD 28 68         [12] 1879 	jr	Z,00146$
   4FFF 21 47 65      [10] 1880 	ld	hl, #(_player + 0x0008) + 0
   5002 7E            [ 7] 1881 	ld	a,(hl)
   5003 DD 77 FB      [19] 1882 	ld	-5 (ix), a
   5006 D6 14         [ 7] 1883 	sub	a, #0x14
   5008 38 5D         [12] 1884 	jr	C,00146$
                           1885 ;src/keyboard.h:16: if(player.atk >= 50) player.atk =0;
   500A DD 7E FB      [19] 1886 	ld	a,-5 (ix)
   500D D6 32         [ 7] 1887 	sub	a, #0x32
   500F 38 07         [12] 1888 	jr	C,00102$
   5011 21 47 65      [10] 1889 	ld	hl,#(_player + 0x0008)
   5014 36 00         [10] 1890 	ld	(hl),#0x00
   5016 18 08         [12] 1891 	jr	00103$
   5018                    1892 00102$:
                           1893 ;src/keyboard.h:17: else player.atk += 1;
   5018 DD 7E FB      [19] 1894 	ld	a,-5 (ix)
   501B 3C            [ 4] 1895 	inc	a
   501C 21 47 65      [10] 1896 	ld	hl,#(_player + 0x0008)
   501F 77            [ 7] 1897 	ld	(hl),a
   5020                    1898 00103$:
                           1899 ;src/keyboard.h:18: switch(player.dir){
   5020 21 46 65      [10] 1900 	ld	hl, #_player + 7
   5023 66            [ 7] 1901 	ld	h,(hl)
   5024 7C            [ 4] 1902 	ld	a,h
   5025 D6 02         [ 7] 1903 	sub	a, #0x02
   5027 28 33         [12] 1904 	jr	Z,00107$
   5029 7C            [ 4] 1905 	ld	a,h
   502A D6 04         [ 7] 1906 	sub	a, #0x04
   502C 28 0D         [12] 1907 	jr	Z,00104$
   502E 7C            [ 4] 1908 	ld	a,h
   502F D6 06         [ 7] 1909 	sub	a, #0x06
   5031 28 13         [12] 1910 	jr	Z,00105$
   5033 7C            [ 4] 1911 	ld	a,h
   5034 D6 08         [ 7] 1912 	sub	a, #0x08
   5036 28 19         [12] 1913 	jr	Z,00106$
   5038 C3 2A 52      [10] 1914 	jp	00147$
                           1915 ;src/keyboard.h:19: case 4:
   503B                    1916 00104$:
                           1917 ;src/keyboard.h:20: s = gladis_atk_izda;
   503B DD 36 FC 80   [19] 1918 	ld	-4 (ix),#<(_gladis_atk_izda)
   503F DD 36 FD 41   [19] 1919 	ld	-3 (ix),#>(_gladis_atk_izda)
                           1920 ;src/keyboard.h:21: break;
   5043 C3 2A 52      [10] 1921 	jp	00147$
                           1922 ;src/keyboard.h:22: case 6:
   5046                    1923 00105$:
                           1924 ;src/keyboard.h:23: s = gladis_atk_dcha;
   5046 DD 36 FC 00   [19] 1925 	ld	-4 (ix),#<(_gladis_atk_dcha)
   504A DD 36 FD 41   [19] 1926 	ld	-3 (ix),#>(_gladis_atk_dcha)
                           1927 ;src/keyboard.h:24: break;
   504E C3 2A 52      [10] 1928 	jp	00147$
                           1929 ;src/keyboard.h:25: case 8:
   5051                    1930 00106$:
                           1931 ;src/keyboard.h:26: s = gladis_atk_arriba;
   5051 DD 36 FC 80   [19] 1932 	ld	-4 (ix),#<(_gladis_atk_arriba)
   5055 DD 36 FD 43   [19] 1933 	ld	-3 (ix),#>(_gladis_atk_arriba)
                           1934 ;src/keyboard.h:27: break;
   5059 C3 2A 52      [10] 1935 	jp	00147$
                           1936 ;src/keyboard.h:28: case 2:
   505C                    1937 00107$:
                           1938 ;src/keyboard.h:29: s = gladis_atk_abajo;
   505C DD 36 FC 00   [19] 1939 	ld	-4 (ix),#<(_gladis_atk_abajo)
   5060 DD 36 FD 43   [19] 1940 	ld	-3 (ix),#>(_gladis_atk_abajo)
                           1941 ;src/keyboard.h:31: }
   5064 C3 2A 52      [10] 1942 	jp	00147$
   5067                    1943 00146$:
                           1944 ;src/keyboard.h:33: if(player.atk < 20) player.atk += 1;
   5067 21 47 65      [10] 1945 	ld	hl, #(_player + 0x0008) + 0
   506A 56            [ 7] 1946 	ld	d,(hl)
   506B 7A            [ 4] 1947 	ld	a,d
   506C D6 14         [ 7] 1948 	sub	a, #0x14
   506E 30 07         [12] 1949 	jr	NC,00110$
   5070 14            [ 4] 1950 	inc	d
   5071 21 47 65      [10] 1951 	ld	hl,#(_player + 0x0008)
   5074 72            [ 7] 1952 	ld	(hl),d
   5075 18 05         [12] 1953 	jr	00111$
   5077                    1954 00110$:
                           1955 ;src/keyboard.h:34: else player.atk = 20;
   5077 21 47 65      [10] 1956 	ld	hl,#(_player + 0x0008)
   507A 36 14         [10] 1957 	ld	(hl),#0x14
   507C                    1958 00111$:
                           1959 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   507C 21 00 02      [10] 1960 	ld	hl,#0x0200
   507F CD 52 61      [17] 1961 	call	_cpct_isKeyPressed
                           1962 ;src/keyboard.h:37: player.dir = 6;
                           1963 ;src/keyboard.h:35: if(cpct_isKeyPressed(Key_CursorRight) && player.x < 76){
   5082 7D            [ 4] 1964 	ld	a,l
   5083 B7            [ 4] 1965 	or	a, a
   5084 28 1E         [12] 1966 	jr	Z,00142$
   5086 21 3F 65      [10] 1967 	ld	hl, #_player + 0
   5089 56            [ 7] 1968 	ld	d,(hl)
   508A 7A            [ 4] 1969 	ld	a,d
   508B D6 4C         [ 7] 1970 	sub	a, #0x4C
   508D 30 15         [12] 1971 	jr	NC,00142$
                           1972 ;src/keyboard.h:36: player.x += 1;
   508F 14            [ 4] 1973 	inc	d
   5090 21 3F 65      [10] 1974 	ld	hl,#_player
   5093 72            [ 7] 1975 	ld	(hl),d
                           1976 ;src/keyboard.h:37: player.dir = 6;
   5094 21 46 65      [10] 1977 	ld	hl,#(_player + 0x0007)
   5097 36 06         [10] 1978 	ld	(hl),#0x06
                           1979 ;src/keyboard.h:38: s = gladis_quieto_dcha;
   5099 DD 36 FC 00   [19] 1980 	ld	-4 (ix),#<(_gladis_quieto_dcha)
   509D DD 36 FD 40   [19] 1981 	ld	-3 (ix),#>(_gladis_quieto_dcha)
   50A1 C3 2A 52      [10] 1982 	jp	00147$
   50A4                    1983 00142$:
                           1984 ;src/keyboard.h:39: }else if(cpct_isKeyPressed(Key_CursorLeft) && player.x > 0){
   50A4 21 01 01      [10] 1985 	ld	hl,#0x0101
   50A7 CD 52 61      [17] 1986 	call	_cpct_isKeyPressed
   50AA 7D            [ 4] 1987 	ld	a,l
   50AB B7            [ 4] 1988 	or	a, a
   50AC 28 1B         [12] 1989 	jr	Z,00138$
   50AE 3A 3F 65      [13] 1990 	ld	a, (#_player + 0)
   50B1 B7            [ 4] 1991 	or	a, a
   50B2 28 15         [12] 1992 	jr	Z,00138$
                           1993 ;src/keyboard.h:40: player.x -= 1;
   50B4 C6 FF         [ 7] 1994 	add	a,#0xFF
   50B6 32 3F 65      [13] 1995 	ld	(#_player),a
                           1996 ;src/keyboard.h:41: player.dir = 4;
   50B9 21 46 65      [10] 1997 	ld	hl,#(_player + 0x0007)
   50BC 36 04         [10] 1998 	ld	(hl),#0x04
                           1999 ;src/keyboard.h:42: s = gladis_quieto_izda;
   50BE DD 36 FC 80   [19] 2000 	ld	-4 (ix),#<(_gladis_quieto_izda)
   50C2 DD 36 FD 40   [19] 2001 	ld	-3 (ix),#>(_gladis_quieto_izda)
   50C6 C3 2A 52      [10] 2002 	jp	00147$
   50C9                    2003 00138$:
                           2004 ;src/keyboard.h:43: }else  if(cpct_isKeyPressed(Key_CursorDown) && player.y < 180){
   50C9 21 00 04      [10] 2005 	ld	hl,#0x0400
   50CC CD 52 61      [17] 2006 	call	_cpct_isKeyPressed
   50CF 01 40 65      [10] 2007 	ld	bc,#_player + 1
   50D2 7D            [ 4] 2008 	ld	a,l
   50D3 B7            [ 4] 2009 	or	a, a
   50D4 28 1A         [12] 2010 	jr	Z,00134$
   50D6 0A            [ 7] 2011 	ld	a,(bc)
   50D7 67            [ 4] 2012 	ld	h,a
   50D8 D6 B4         [ 7] 2013 	sub	a, #0xB4
   50DA 30 14         [12] 2014 	jr	NC,00134$
                           2015 ;src/keyboard.h:44: player.y += 2;
   50DC 7C            [ 4] 2016 	ld	a,h
   50DD C6 02         [ 7] 2017 	add	a, #0x02
   50DF 02            [ 7] 2018 	ld	(bc),a
                           2019 ;src/keyboard.h:45: player.dir = 2;
   50E0 21 46 65      [10] 2020 	ld	hl,#(_player + 0x0007)
   50E3 36 02         [10] 2021 	ld	(hl),#0x02
                           2022 ;src/keyboard.h:46: s = gladis_abajo;
   50E5 DD 36 FC 80   [19] 2023 	ld	-4 (ix),#<(_gladis_abajo)
   50E9 DD 36 FD 42   [19] 2024 	ld	-3 (ix),#>(_gladis_abajo)
   50ED C3 2A 52      [10] 2025 	jp	00147$
   50F0                    2026 00134$:
                           2027 ;src/keyboard.h:47: }else if(cpct_isKeyPressed(Key_CursorUp) && player.y > 0 ){
   50F0 C5            [11] 2028 	push	bc
   50F1 21 00 01      [10] 2029 	ld	hl,#0x0100
   50F4 CD 52 61      [17] 2030 	call	_cpct_isKeyPressed
   50F7 7D            [ 4] 2031 	ld	a,l
   50F8 C1            [10] 2032 	pop	bc
   50F9 B7            [ 4] 2033 	or	a, a
   50FA 28 17         [12] 2034 	jr	Z,00130$
   50FC 0A            [ 7] 2035 	ld	a,(bc)
   50FD B7            [ 4] 2036 	or	a, a
   50FE 28 13         [12] 2037 	jr	Z,00130$
                           2038 ;src/keyboard.h:48: player.y -= 2;
   5100 C6 FE         [ 7] 2039 	add	a,#0xFE
   5102 02            [ 7] 2040 	ld	(bc),a
                           2041 ;src/keyboard.h:49: player.dir = 8;
   5103 21 46 65      [10] 2042 	ld	hl,#(_player + 0x0007)
   5106 36 08         [10] 2043 	ld	(hl),#0x08
                           2044 ;src/keyboard.h:50: s = gladis_arriba;
   5108 DD 36 FC 00   [19] 2045 	ld	-4 (ix),#<(_gladis_arriba)
   510C DD 36 FD 42   [19] 2046 	ld	-3 (ix),#>(_gladis_arriba)
   5110 C3 2A 52      [10] 2047 	jp	00147$
   5113                    2048 00130$:
                           2049 ;src/keyboard.h:51: }else if(cpct_isKeyPressed(Key_X) && arrow == 0 && player.atk == 20){
   5113 C5            [11] 2050 	push	bc
   5114 21 07 80      [10] 2051 	ld	hl,#0x8007
   5117 CD 52 61      [17] 2052 	call	_cpct_isKeyPressed
   511A 7D            [ 4] 2053 	ld	a,l
   511B C1            [10] 2054 	pop	bc
   511C B7            [ 4] 2055 	or	a, a
   511D CA EA 51      [10] 2056 	jp	Z,00125$
   5120 3A 31 65      [13] 2057 	ld	a,(#_arrow + 0)
   5123 B7            [ 4] 2058 	or	a, a
   5124 C2 EA 51      [10] 2059 	jp	NZ,00125$
   5127 3A 47 65      [13] 2060 	ld	a, (#(_player + 0x0008) + 0)
   512A D6 14         [ 7] 2061 	sub	a, #0x14
   512C C2 EA 51      [10] 2062 	jp	NZ,00125$
                           2063 ;src/keyboard.h:52: if(player.bullets> 0){
   512F 3A 49 65      [13] 2064 	ld	a, (#(_player + 0x000a) + 0)
   5132 B7            [ 4] 2065 	or	a, a
   5133 CA E3 51      [10] 2066 	jp	Z,00118$
                           2067 ;src/keyboard.h:53: u8 *spr = flecha_dcha,xs=2,ys=8;
   5136 DD 36 FE EE   [19] 2068 	ld	-2 (ix),#<(_flecha_dcha)
   513A DD 36 FF 60   [19] 2069 	ld	-1 (ix),#>(_flecha_dcha)
   513E DD 36 FA 02   [19] 2070 	ld	-6 (ix),#0x02
   5142 1E 08         [ 7] 2071 	ld	e,#0x08
                           2072 ;src/keyboard.h:54: switch(player.dir){
   5144 21 46 65      [10] 2073 	ld	hl, #(_player + 0x0007) + 0
   5147 56            [ 7] 2074 	ld	d,(hl)
   5148 7A            [ 4] 2075 	ld	a,d
   5149 D6 02         [ 7] 2076 	sub	a, #0x02
   514B 28 31         [12] 2077 	jr	Z,00114$
   514D 7A            [ 4] 2078 	ld	a,d
   514E D6 04         [ 7] 2079 	sub	a, #0x04
   5150 28 1C         [12] 2080 	jr	Z,00113$
   5152 7A            [ 4] 2081 	ld	a,d
   5153 D6 06         [ 7] 2082 	sub	a, #0x06
   5155 28 07         [12] 2083 	jr	Z,00112$
   5157 7A            [ 4] 2084 	ld	a,d
   5158 D6 08         [ 7] 2085 	sub	a, #0x08
   515A 28 32         [12] 2086 	jr	Z,00115$
   515C 18 3E         [12] 2087 	jr	00116$
                           2088 ;src/keyboard.h:55: case 6: spr = flecha_dcha; xs=4;ys=4; break;
   515E                    2089 00112$:
   515E DD 36 FE EE   [19] 2090 	ld	-2 (ix),#<(_flecha_dcha)
   5162 DD 36 FF 60   [19] 2091 	ld	-1 (ix),#>(_flecha_dcha)
   5166 DD 36 FA 04   [19] 2092 	ld	-6 (ix),#0x04
   516A 1E 04         [ 7] 2093 	ld	e,#0x04
   516C 18 2E         [12] 2094 	jr	00116$
                           2095 ;src/keyboard.h:56: case 4: spr = flecha_izda; xs=4;ys=4; break;
   516E                    2096 00113$:
   516E DD 36 FE 0E   [19] 2097 	ld	-2 (ix),#<(_flecha_izda)
   5172 DD 36 FF 61   [19] 2098 	ld	-1 (ix),#>(_flecha_izda)
   5176 DD 36 FA 04   [19] 2099 	ld	-6 (ix),#0x04
   517A 1E 04         [ 7] 2100 	ld	e,#0x04
   517C 18 1E         [12] 2101 	jr	00116$
                           2102 ;src/keyboard.h:57: case 2: spr = flecha_abajo; xs=2;ys=8; break;
   517E                    2103 00114$:
   517E DD 36 FE CE   [19] 2104 	ld	-2 (ix),#<(_flecha_abajo)
   5182 DD 36 FF 60   [19] 2105 	ld	-1 (ix),#>(_flecha_abajo)
   5186 DD 36 FA 02   [19] 2106 	ld	-6 (ix),#0x02
   518A 1E 08         [ 7] 2107 	ld	e,#0x08
   518C 18 0E         [12] 2108 	jr	00116$
                           2109 ;src/keyboard.h:58: case 8: spr = flecha_arriba; xs=2;ys=8; break;
   518E                    2110 00115$:
   518E DD 36 FE AE   [19] 2111 	ld	-2 (ix),#<(_flecha_arriba)
   5192 DD 36 FF 60   [19] 2112 	ld	-1 (ix),#>(_flecha_arriba)
   5196 DD 36 FA 02   [19] 2113 	ld	-6 (ix),#0x02
   519A 1E 08         [ 7] 2114 	ld	e,#0x08
                           2115 ;src/keyboard.h:59: }
   519C                    2116 00116$:
                           2117 ;src/keyboard.h:60: player.atk = 0;
   519C 21 47 65      [10] 2118 	ld	hl,#(_player + 0x0008)
   519F 36 00         [10] 2119 	ld	(hl),#0x00
                           2120 ;src/keyboard.h:61: object.x = player.x;
   51A1 3A 3F 65      [13] 2121 	ld	a, (#_player + 0)
   51A4 32 35 65      [13] 2122 	ld	(#_object),a
                           2123 ;src/keyboard.h:62: object.y = player.y+8;
   51A7 0A            [ 7] 2124 	ld	a,(bc)
   51A8 C6 08         [ 7] 2125 	add	a, #0x08
   51AA 32 36 65      [13] 2126 	ld	(#(_object + 0x0001)),a
                           2127 ;src/keyboard.h:63: object.x = object.x;
   51AD 21 35 65      [10] 2128 	ld	hl, #_object + 0
   51B0 56            [ 7] 2129 	ld	d,(hl)
   51B1 21 35 65      [10] 2130 	ld	hl,#_object
   51B4 72            [ 7] 2131 	ld	(hl),d
                           2132 ;src/keyboard.h:64: object.y = object.y;
   51B5 32 36 65      [13] 2133 	ld	(#(_object + 0x0001)),a
                           2134 ;src/keyboard.h:65: object.sprite = spr;
   51B8 21 39 65      [10] 2135 	ld	hl,#_object + 4
   51BB DD 7E FE      [19] 2136 	ld	a,-2 (ix)
   51BE 77            [ 7] 2137 	ld	(hl),a
   51BF 23            [ 6] 2138 	inc	hl
   51C0 DD 7E FF      [19] 2139 	ld	a,-1 (ix)
   51C3 77            [ 7] 2140 	ld	(hl),a
                           2141 ;src/keyboard.h:66: object.vivo = 1;
   51C4 21 3B 65      [10] 2142 	ld	hl,#_object + 6
   51C7 36 01         [10] 2143 	ld	(hl),#0x01
                           2144 ;src/keyboard.h:67: object.dir = player.dir;
   51C9 01 3C 65      [10] 2145 	ld	bc,#_object + 7
   51CC 3A 46 65      [13] 2146 	ld	a, (#(_player + 0x0007) + 0)
   51CF 02            [ 7] 2147 	ld	(bc),a
                           2148 ;src/keyboard.h:68: object.sizeX = xs;
   51D0 21 3D 65      [10] 2149 	ld	hl,#_object + 8
   51D3 DD 7E FA      [19] 2150 	ld	a,-6 (ix)
   51D6 77            [ 7] 2151 	ld	(hl),a
                           2152 ;src/keyboard.h:69: object.sizeY = ys;
   51D7 21 3E 65      [10] 2153 	ld	hl,#_object + 9
   51DA 73            [ 7] 2154 	ld	(hl),e
                           2155 ;src/keyboard.h:70: player.bullets--;
   51DB 3A 49 65      [13] 2156 	ld	a, (#(_player + 0x000a) + 0)
   51DE C6 FF         [ 7] 2157 	add	a,#0xFF
   51E0 32 49 65      [13] 2158 	ld	(#(_player + 0x000a)),a
   51E3                    2159 00118$:
                           2160 ;src/keyboard.h:72: arrow=1;
   51E3 21 31 65      [10] 2161 	ld	hl,#_arrow + 0
   51E6 36 01         [10] 2162 	ld	(hl), #0x01
   51E8 18 40         [12] 2163 	jr	00147$
   51EA                    2164 00125$:
                           2165 ;src/keyboard.h:74: switch(player.dir){
   51EA 21 46 65      [10] 2166 	ld	hl, #(_player + 0x0007) + 0
   51ED 66            [ 7] 2167 	ld	h,(hl)
   51EE 7C            [ 4] 2168 	ld	a,h
   51EF D6 02         [ 7] 2169 	sub	a, #0x02
   51F1 28 2F         [12] 2170 	jr	Z,00122$
   51F3 7C            [ 4] 2171 	ld	a,h
   51F4 D6 04         [ 7] 2172 	sub	a, #0x04
   51F6 28 0C         [12] 2173 	jr	Z,00119$
   51F8 7C            [ 4] 2174 	ld	a,h
   51F9 D6 06         [ 7] 2175 	sub	a, #0x06
   51FB 28 11         [12] 2176 	jr	Z,00120$
   51FD 7C            [ 4] 2177 	ld	a,h
   51FE D6 08         [ 7] 2178 	sub	a, #0x08
   5200 28 16         [12] 2179 	jr	Z,00121$
   5202 18 26         [12] 2180 	jr	00147$
                           2181 ;src/keyboard.h:75: case 4:
   5204                    2182 00119$:
                           2183 ;src/keyboard.h:76: s = gladis_quieto_izda;
   5204 DD 36 FC 80   [19] 2184 	ld	-4 (ix),#<(_gladis_quieto_izda)
   5208 DD 36 FD 40   [19] 2185 	ld	-3 (ix),#>(_gladis_quieto_izda)
                           2186 ;src/keyboard.h:77: break;
   520C 18 1C         [12] 2187 	jr	00147$
                           2188 ;src/keyboard.h:78: case 6:
   520E                    2189 00120$:
                           2190 ;src/keyboard.h:79: s = gladis_quieto_dcha;
   520E DD 36 FC 00   [19] 2191 	ld	-4 (ix),#<(_gladis_quieto_dcha)
   5212 DD 36 FD 40   [19] 2192 	ld	-3 (ix),#>(_gladis_quieto_dcha)
                           2193 ;src/keyboard.h:80: break;
   5216 18 12         [12] 2194 	jr	00147$
                           2195 ;src/keyboard.h:81: case 8:
   5218                    2196 00121$:
                           2197 ;src/keyboard.h:82: s = gladis_arriba;
   5218 DD 36 FC 00   [19] 2198 	ld	-4 (ix),#<(_gladis_arriba)
   521C DD 36 FD 42   [19] 2199 	ld	-3 (ix),#>(_gladis_arriba)
                           2200 ;src/keyboard.h:83: break;
   5220 18 08         [12] 2201 	jr	00147$
                           2202 ;src/keyboard.h:84: case 2:
   5222                    2203 00122$:
                           2204 ;src/keyboard.h:85: s = gladis_abajo;
   5222 DD 36 FC 80   [19] 2205 	ld	-4 (ix),#<(_gladis_abajo)
   5226 DD 36 FD 42   [19] 2206 	ld	-3 (ix),#>(_gladis_abajo)
                           2207 ;src/keyboard.h:87: }
   522A                    2208 00147$:
                           2209 ;src/keyboard.h:93: if(cpct_isKeyPressed(Key_L)){
   522A 21 04 10      [10] 2210 	ld	hl,#0x1004
   522D CD 52 61      [17] 2211 	call	_cpct_isKeyPressed
   5230 7D            [ 4] 2212 	ld	a,l
   5231 B7            [ 4] 2213 	or	a, a
   5232 28 05         [12] 2214 	jr	Z,00150$
                           2215 ;src/keyboard.h:94: arrow = 0;
   5234 21 31 65      [10] 2216 	ld	hl,#_arrow + 0
   5237 36 00         [10] 2217 	ld	(hl), #0x00
   5239                    2218 00150$:
                           2219 ;src/keyboard.h:96: if(cpct_isKeyPressed(Key_Esc)){
   5239 21 08 04      [10] 2220 	ld	hl,#0x0408
   523C CD 52 61      [17] 2221 	call	_cpct_isKeyPressed
   523F 7D            [ 4] 2222 	ld	a,l
   5240 B7            [ 4] 2223 	or	a, a
   5241 28 05         [12] 2224 	jr	Z,00152$
                           2225 ;src/keyboard.h:97: finish = 1;
   5243 21 30 65      [10] 2226 	ld	hl,#_finish + 0
   5246 36 01         [10] 2227 	ld	(hl), #0x01
   5248                    2228 00152$:
                           2229 ;src/keyboard.h:99: return s;
   5248 C1            [10] 2230 	pop	bc
   5249 E1            [10] 2231 	pop	hl
   524A E5            [11] 2232 	push	hl
   524B C5            [11] 2233 	push	bc
   524C DD F9         [10] 2234 	ld	sp, ix
   524E DD E1         [14] 2235 	pop	ix
   5250 C9            [10] 2236 	ret
                           2237 ;src/keyboard.h:102: void moveObject(){
                           2238 ;	---------------------------------
                           2239 ; Function moveObject
                           2240 ; ---------------------------------
   5251                    2241 _moveObject::
                           2242 ;src/keyboard.h:103: object.lx = object.x;
   5251 01 35 65      [10] 2243 	ld	bc,#_object+0
   5254 0A            [ 7] 2244 	ld	a,(bc)
   5255 32 37 65      [13] 2245 	ld	(#(_object + 0x0002)),a
                           2246 ;src/keyboard.h:104: object.ly = object.y;
   5258 59            [ 4] 2247 	ld	e, c
   5259 50            [ 4] 2248 	ld	d, b
   525A 13            [ 6] 2249 	inc	de
   525B 1A            [ 7] 2250 	ld	a,(de)
   525C 32 38 65      [13] 2251 	ld	(#(_object + 0x0003)),a
                           2252 ;src/keyboard.h:105: switch(object.dir){
   525F 3A 3C 65      [13] 2253 	ld	a,(#_object + 7)
   5262 FE 02         [ 7] 2254 	cp	a,#0x02
   5264 28 16         [12] 2255 	jr	Z,00103$
   5266 FE 04         [ 7] 2256 	cp	a,#0x04
   5268 28 0D         [12] 2257 	jr	Z,00102$
   526A FE 06         [ 7] 2258 	cp	a,#0x06
   526C 28 05         [12] 2259 	jr	Z,00101$
   526E D6 08         [ 7] 2260 	sub	a, #0x08
   5270 28 0F         [12] 2261 	jr	Z,00104$
   5272 C9            [10] 2262 	ret
                           2263 ;src/keyboard.h:106: case 6: object.x += 1; break;
   5273                    2264 00101$:
   5273 0A            [ 7] 2265 	ld	a,(bc)
   5274 3C            [ 4] 2266 	inc	a
   5275 02            [ 7] 2267 	ld	(bc),a
   5276 C9            [10] 2268 	ret
                           2269 ;src/keyboard.h:107: case 4: object.x -= 1; break;
   5277                    2270 00102$:
   5277 0A            [ 7] 2271 	ld	a,(bc)
   5278 C6 FF         [ 7] 2272 	add	a,#0xFF
   527A 02            [ 7] 2273 	ld	(bc),a
   527B C9            [10] 2274 	ret
                           2275 ;src/keyboard.h:108: case 2: object.y += 2; break;
   527C                    2276 00103$:
   527C 1A            [ 7] 2277 	ld	a,(de)
   527D C6 02         [ 7] 2278 	add	a, #0x02
   527F 12            [ 7] 2279 	ld	(de),a
   5280 C9            [10] 2280 	ret
                           2281 ;src/keyboard.h:109: case 8: object.y -= 2; break;
   5281                    2282 00104$:
   5281 1A            [ 7] 2283 	ld	a,(de)
   5282 C6 FE         [ 7] 2284 	add	a,#0xFE
   5284 12            [ 7] 2285 	ld	(de),a
                           2286 ;src/keyboard.h:110: }
   5285 C9            [10] 2287 	ret
                           2288 ;src/main.c:35: void init(){
                           2289 ;	---------------------------------
                           2290 ; Function init
                           2291 ; ---------------------------------
   5286                    2292 _init::
                           2293 ;src/main.c:36: cpct_disableFirmware();
   5286 CD 22 63      [17] 2294 	call	_cpct_disableFirmware
                           2295 ;src/main.c:37: cpct_setVideoMode(0);
   5289 AF            [ 4] 2296 	xor	a, a
   528A F5            [11] 2297 	push	af
   528B 33            [ 6] 2298 	inc	sp
   528C CD FF 62      [17] 2299 	call	_cpct_setVideoMode
   528F 33            [ 6] 2300 	inc	sp
                           2301 ;src/main.c:38: cpct_fw2hw(g_palette,4);
   5290 11 D9 48      [10] 2302 	ld	de,#_g_palette
   5293 3E 04         [ 7] 2303 	ld	a,#0x04
   5295 F5            [11] 2304 	push	af
   5296 33            [ 6] 2305 	inc	sp
   5297 D5            [11] 2306 	push	de
   5298 CD 89 62      [17] 2307 	call	_cpct_fw2hw
   529B F1            [10] 2308 	pop	af
   529C 33            [ 6] 2309 	inc	sp
                           2310 ;src/main.c:39: cpct_setPalette(g_palette,4);
   529D 11 D9 48      [10] 2311 	ld	de,#_g_palette
   52A0 3E 04         [ 7] 2312 	ld	a,#0x04
   52A2 F5            [11] 2313 	push	af
   52A3 33            [ 6] 2314 	inc	sp
   52A4 D5            [11] 2315 	push	de
   52A5 CD 2E 61      [17] 2316 	call	_cpct_setPalette
   52A8 F1            [10] 2317 	pop	af
   52A9 33            [ 6] 2318 	inc	sp
   52AA C9            [10] 2319 	ret
                           2320 ;src/main.c:42: void initPlayer(){
                           2321 ;	---------------------------------
                           2322 ; Function initPlayer
                           2323 ; ---------------------------------
   52AB                    2324 _initPlayer::
                           2325 ;src/main.c:43: u8 *sprite = gladis_quieto_dcha;
                           2326 ;src/main.c:44: player.x = origins[0][0];
   52AB 01 DE 48      [10] 2327 	ld	bc,#_origins+0
   52AE 0A            [ 7] 2328 	ld	a,(bc)
   52AF 32 3F 65      [13] 2329 	ld	(#_player),a
                           2330 ;src/main.c:45: player.y = origins[0][1];
   52B2 59            [ 4] 2331 	ld	e, c
   52B3 50            [ 4] 2332 	ld	d, b
   52B4 13            [ 6] 2333 	inc	de
   52B5 1A            [ 7] 2334 	ld	a,(de)
   52B6 32 40 65      [13] 2335 	ld	(#(_player + 0x0001)),a
                           2336 ;src/main.c:46: player.lx = origins[0][0];
   52B9 0A            [ 7] 2337 	ld	a,(bc)
   52BA 32 41 65      [13] 2338 	ld	(#(_player + 0x0002)),a
                           2339 ;src/main.c:47: player.ly = origins[0][1];
   52BD 1A            [ 7] 2340 	ld	a,(de)
   52BE 32 42 65      [13] 2341 	ld	(#(_player + 0x0003)),a
                           2342 ;src/main.c:48: player.sprite = sprite;
   52C1 21 00 40      [10] 2343 	ld	hl,#_gladis_quieto_dcha
   52C4 22 43 65      [16] 2344 	ld	((_player + 0x0004)), hl
                           2345 ;src/main.c:49: player.life = 3;
   52C7 21 45 65      [10] 2346 	ld	hl,#_player + 6
   52CA 36 03         [10] 2347 	ld	(hl),#0x03
                           2348 ;src/main.c:50: player.dir = 6;
   52CC 21 46 65      [10] 2349 	ld	hl,#_player + 7
   52CF 36 06         [10] 2350 	ld	(hl),#0x06
                           2351 ;src/main.c:51: player.atk = 20;
   52D1 21 47 65      [10] 2352 	ld	hl,#_player + 8
   52D4 36 14         [10] 2353 	ld	(hl),#0x14
                           2354 ;src/main.c:52: player.latk = 20;
   52D6 21 48 65      [10] 2355 	ld	hl,#_player + 9
   52D9 36 14         [10] 2356 	ld	(hl),#0x14
                           2357 ;src/main.c:53: player.bullets = 3;
   52DB 21 49 65      [10] 2358 	ld	hl,#_player + 10
   52DE 36 03         [10] 2359 	ld	(hl),#0x03
   52E0 C9            [10] 2360 	ret
                           2361 ;src/main.c:56: void initEnemies(){
                           2362 ;	---------------------------------
                           2363 ; Function initEnemies
                           2364 ; ---------------------------------
   52E1                    2365 _initEnemies::
                           2366 ;src/main.c:57: u8 *sprite = chacho_dcha;
                           2367 ;src/main.c:58: enemy.x = origins[1][0];
   52E1 01 E0 48      [10] 2368 	ld	bc,#_origins + 2
   52E4 0A            [ 7] 2369 	ld	a,(bc)
   52E5 32 4A 65      [13] 2370 	ld	(#_enemy),a
                           2371 ;src/main.c:59: enemy.y = origins[1][1];
   52E8 11 E1 48      [10] 2372 	ld	de,#_origins + 3
   52EB 1A            [ 7] 2373 	ld	a,(de)
   52EC 32 4B 65      [13] 2374 	ld	(#(_enemy + 0x0001)),a
                           2375 ;src/main.c:60: enemy.lx = origins[1][0];
   52EF 0A            [ 7] 2376 	ld	a,(bc)
   52F0 32 4C 65      [13] 2377 	ld	(#(_enemy + 0x0002)),a
                           2378 ;src/main.c:61: enemy.ly = origins[1][1];
   52F3 1A            [ 7] 2379 	ld	a,(de)
   52F4 32 4D 65      [13] 2380 	ld	(#(_enemy + 0x0003)),a
                           2381 ;src/main.c:62: enemy.ox = origins[1][0];
   52F7 0A            [ 7] 2382 	ld	a,(bc)
   52F8 32 4E 65      [13] 2383 	ld	(#(_enemy + 0x0004)),a
                           2384 ;src/main.c:63: enemy.oy = origins[1][1];
   52FB 1A            [ 7] 2385 	ld	a,(de)
   52FC 32 4F 65      [13] 2386 	ld	(#(_enemy + 0x0005)),a
                           2387 ;src/main.c:64: enemy.sprite = sprite;
   52FF 21 00 44      [10] 2388 	ld	hl,#_chacho_dcha
   5302 22 50 65      [16] 2389 	ld	((_enemy + 0x0006)), hl
                           2390 ;src/main.c:65: enemy.life = 1;
   5305 21 52 65      [10] 2391 	ld	hl,#_enemy + 8
   5308 36 01         [10] 2392 	ld	(hl),#0x01
                           2393 ;src/main.c:66: enemy.dir = 6;
   530A 21 53 65      [10] 2394 	ld	hl,#_enemy + 9
   530D 36 06         [10] 2395 	ld	(hl),#0x06
                           2396 ;src/main.c:67: enemy.bullets = 1;
   530F 21 54 65      [10] 2397 	ld	hl,#_enemy + 10
   5312 36 01         [10] 2398 	ld	(hl),#0x01
                           2399 ;src/main.c:68: enemy.room = 3;
   5314 21 55 65      [10] 2400 	ld	hl,#_enemy + 11
   5317 36 03         [10] 2401 	ld	(hl),#0x03
   5319 C9            [10] 2402 	ret
                           2403 ;src/main.c:73: void gameOver(){
                           2404 ;	---------------------------------
                           2405 ; Function gameOver
                           2406 ; ---------------------------------
   531A                    2407 _gameOver::
                           2408 ;src/main.c:75: cpct_clearScreen(0);
   531A 21 00 40      [10] 2409 	ld	hl,#0x4000
   531D E5            [11] 2410 	push	hl
   531E AF            [ 4] 2411 	xor	a, a
   531F F5            [11] 2412 	push	af
   5320 33            [ 6] 2413 	inc	sp
   5321 26 C0         [ 7] 2414 	ld	h, #0xC0
   5323 E5            [11] 2415 	push	hl
   5324 CD 11 63      [17] 2416 	call	_cpct_memset
                           2417 ;src/main.c:76: memptr = cpct_getScreenPtr(VMEM,10,10);
   5327 21 0A 0A      [10] 2418 	ld	hl,#0x0A0A
   532A E5            [11] 2419 	push	hl
   532B 21 00 C0      [10] 2420 	ld	hl,#0xC000
   532E E5            [11] 2421 	push	hl
   532F CD EB 63      [17] 2422 	call	_cpct_getScreenPtr
                           2423 ;src/main.c:77: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5332 4D            [ 4] 2424 	ld	c, l
   5333 44            [ 4] 2425 	ld	b, h
   5334 11 46 53      [10] 2426 	ld	de,#___str_0
   5337 21 01 00      [10] 2427 	ld	hl,#0x0001
   533A E5            [11] 2428 	push	hl
   533B C5            [11] 2429 	push	bc
   533C D5            [11] 2430 	push	de
   533D CD C8 61      [17] 2431 	call	_cpct_drawStringM0
   5340 21 06 00      [10] 2432 	ld	hl,#6
   5343 39            [11] 2433 	add	hl,sp
   5344 F9            [ 6] 2434 	ld	sp,hl
   5345 C9            [10] 2435 	ret
   5346                    2436 ___str_0:
   5346 4C 6F 75 6E 67 65  2437 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5356 00                 2438 	.db 0x00
                           2439 ;src/main.c:82: int menu(){
                           2440 ;	---------------------------------
                           2441 ; Function menu
                           2442 ; ---------------------------------
   5357                    2443 _menu::
   5357 DD E5         [15] 2444 	push	ix
   5359 DD 21 00 00   [14] 2445 	ld	ix,#0
   535D DD 39         [15] 2446 	add	ix,sp
   535F 21 FA FF      [10] 2447 	ld	hl,#-6
   5362 39            [11] 2448 	add	hl,sp
   5363 F9            [ 6] 2449 	ld	sp,hl
                           2450 ;src/main.c:84: int init = 50;
   5364 DD 36 FC 32   [19] 2451 	ld	-4 (ix),#0x32
   5368 DD 36 FD 00   [19] 2452 	ld	-3 (ix),#0x00
                           2453 ;src/main.c:85: int pushed =0;
   536C 21 00 00      [10] 2454 	ld	hl,#0x0000
   536F E3            [19] 2455 	ex	(sp), hl
                           2456 ;src/main.c:86: int cont =0;
   5370 11 00 00      [10] 2457 	ld	de,#0x0000
                           2458 ;src/main.c:87: cpct_clearScreen(0);
   5373 D5            [11] 2459 	push	de
   5374 21 00 40      [10] 2460 	ld	hl,#0x4000
   5377 E5            [11] 2461 	push	hl
   5378 AF            [ 4] 2462 	xor	a, a
   5379 F5            [11] 2463 	push	af
   537A 33            [ 6] 2464 	inc	sp
   537B 26 C0         [ 7] 2465 	ld	h, #0xC0
   537D E5            [11] 2466 	push	hl
   537E CD 11 63      [17] 2467 	call	_cpct_memset
   5381 21 0A 0A      [10] 2468 	ld	hl,#0x0A0A
   5384 E5            [11] 2469 	push	hl
   5385 21 00 C0      [10] 2470 	ld	hl,#0xC000
   5388 E5            [11] 2471 	push	hl
   5389 CD EB 63      [17] 2472 	call	_cpct_getScreenPtr
   538C D1            [10] 2473 	pop	de
                           2474 ;src/main.c:90: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   538D 4D            [ 4] 2475 	ld	c, l
   538E 44            [ 4] 2476 	ld	b, h
   538F D5            [11] 2477 	push	de
   5390 21 01 00      [10] 2478 	ld	hl,#0x0001
   5393 E5            [11] 2479 	push	hl
   5394 C5            [11] 2480 	push	bc
   5395 21 3A 55      [10] 2481 	ld	hl,#___str_1
   5398 E5            [11] 2482 	push	hl
   5399 CD C8 61      [17] 2483 	call	_cpct_drawStringM0
   539C 21 06 00      [10] 2484 	ld	hl,#6
   539F 39            [11] 2485 	add	hl,sp
   53A0 F9            [ 6] 2486 	ld	sp,hl
   53A1 21 14 32      [10] 2487 	ld	hl,#0x3214
   53A4 E5            [11] 2488 	push	hl
   53A5 21 00 C0      [10] 2489 	ld	hl,#0xC000
   53A8 E5            [11] 2490 	push	hl
   53A9 CD EB 63      [17] 2491 	call	_cpct_getScreenPtr
   53AC D1            [10] 2492 	pop	de
                           2493 ;src/main.c:94: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   53AD 4D            [ 4] 2494 	ld	c, l
   53AE 44            [ 4] 2495 	ld	b, h
   53AF D5            [11] 2496 	push	de
   53B0 21 01 00      [10] 2497 	ld	hl,#0x0001
   53B3 E5            [11] 2498 	push	hl
   53B4 C5            [11] 2499 	push	bc
   53B5 21 4B 55      [10] 2500 	ld	hl,#___str_2
   53B8 E5            [11] 2501 	push	hl
   53B9 CD C8 61      [17] 2502 	call	_cpct_drawStringM0
   53BC 21 06 00      [10] 2503 	ld	hl,#6
   53BF 39            [11] 2504 	add	hl,sp
   53C0 F9            [ 6] 2505 	ld	sp,hl
   53C1 21 14 46      [10] 2506 	ld	hl,#0x4614
   53C4 E5            [11] 2507 	push	hl
   53C5 21 00 C0      [10] 2508 	ld	hl,#0xC000
   53C8 E5            [11] 2509 	push	hl
   53C9 CD EB 63      [17] 2510 	call	_cpct_getScreenPtr
   53CC D1            [10] 2511 	pop	de
                           2512 ;src/main.c:97: cpct_drawStringM0("Creditos",memptr,1,0);
   53CD 4D            [ 4] 2513 	ld	c, l
   53CE 44            [ 4] 2514 	ld	b, h
   53CF D5            [11] 2515 	push	de
   53D0 21 01 00      [10] 2516 	ld	hl,#0x0001
   53D3 E5            [11] 2517 	push	hl
   53D4 C5            [11] 2518 	push	bc
   53D5 21 59 55      [10] 2519 	ld	hl,#___str_3
   53D8 E5            [11] 2520 	push	hl
   53D9 CD C8 61      [17] 2521 	call	_cpct_drawStringM0
   53DC 21 06 00      [10] 2522 	ld	hl,#6
   53DF 39            [11] 2523 	add	hl,sp
   53E0 F9            [ 6] 2524 	ld	sp,hl
   53E1 21 14 5A      [10] 2525 	ld	hl,#0x5A14
   53E4 E5            [11] 2526 	push	hl
   53E5 21 00 C0      [10] 2527 	ld	hl,#0xC000
   53E8 E5            [11] 2528 	push	hl
   53E9 CD EB 63      [17] 2529 	call	_cpct_getScreenPtr
   53EC D1            [10] 2530 	pop	de
                           2531 ;src/main.c:90: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   53ED DD 75 FE      [19] 2532 	ld	-2 (ix),l
   53F0 DD 74 FF      [19] 2533 	ld	-1 (ix),h
                           2534 ;src/main.c:100: cpct_drawStringM0("Salir",memptr,1,0);
   53F3 01 62 55      [10] 2535 	ld	bc,#___str_4
   53F6 D5            [11] 2536 	push	de
   53F7 21 01 00      [10] 2537 	ld	hl,#0x0001
   53FA E5            [11] 2538 	push	hl
   53FB DD 6E FE      [19] 2539 	ld	l,-2 (ix)
   53FE DD 66 FF      [19] 2540 	ld	h,-1 (ix)
   5401 E5            [11] 2541 	push	hl
   5402 C5            [11] 2542 	push	bc
   5403 CD C8 61      [17] 2543 	call	_cpct_drawStringM0
   5406 21 06 00      [10] 2544 	ld	hl,#6
   5409 39            [11] 2545 	add	hl,sp
   540A F9            [ 6] 2546 	ld	sp,hl
   540B D1            [10] 2547 	pop	de
                           2548 ;src/main.c:106: while(1){
   540C                    2549 00118$:
                           2550 ;src/main.c:108: cpct_scanKeyboard();
   540C D5            [11] 2551 	push	de
   540D CD 0B 64      [17] 2552 	call	_cpct_scanKeyboard
   5410 21 00 04      [10] 2553 	ld	hl,#0x0400
   5413 CD 52 61      [17] 2554 	call	_cpct_isKeyPressed
   5416 7D            [ 4] 2555 	ld	a,l
   5417 D1            [10] 2556 	pop	de
   5418 B7            [ 4] 2557 	or	a, a
   5419 28 2D         [12] 2558 	jr	Z,00102$
   541B 3E 96         [ 7] 2559 	ld	a,#0x96
   541D BB            [ 4] 2560 	cp	a, e
   541E 3E 00         [ 7] 2561 	ld	a,#0x00
   5420 9A            [ 4] 2562 	sbc	a, d
   5421 E2 26 54      [10] 2563 	jp	PO, 00162$
   5424 EE 80         [ 7] 2564 	xor	a, #0x80
   5426                    2565 00162$:
   5426 F2 48 54      [10] 2566 	jp	P,00102$
                           2567 ;src/main.c:110: cpct_drawSolidBox(memptr, 0, 2, 8);
   5429 21 02 08      [10] 2568 	ld	hl,#0x0802
   542C E5            [11] 2569 	push	hl
   542D AF            [ 4] 2570 	xor	a, a
   542E F5            [11] 2571 	push	af
   542F 33            [ 6] 2572 	inc	sp
   5430 DD 6E FE      [19] 2573 	ld	l,-2 (ix)
   5433 DD 66 FF      [19] 2574 	ld	h,-1 (ix)
   5436 E5            [11] 2575 	push	hl
   5437 CD 33 63      [17] 2576 	call	_cpct_drawSolidBox
   543A F1            [10] 2577 	pop	af
   543B F1            [10] 2578 	pop	af
   543C 33            [ 6] 2579 	inc	sp
                           2580 ;src/main.c:111: pushed ++;
   543D DD 34 FA      [23] 2581 	inc	-6 (ix)
   5440 20 03         [12] 2582 	jr	NZ,00163$
   5442 DD 34 FB      [23] 2583 	inc	-5 (ix)
   5445                    2584 00163$:
                           2585 ;src/main.c:112: cont =0;
   5445 11 00 00      [10] 2586 	ld	de,#0x0000
   5448                    2587 00102$:
                           2588 ;src/main.c:114: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   5448 D5            [11] 2589 	push	de
   5449 21 00 01      [10] 2590 	ld	hl,#0x0100
   544C CD 52 61      [17] 2591 	call	_cpct_isKeyPressed
   544F 7D            [ 4] 2592 	ld	a,l
   5450 D1            [10] 2593 	pop	de
   5451 B7            [ 4] 2594 	or	a, a
   5452 28 29         [12] 2595 	jr	Z,00105$
   5454 3E 96         [ 7] 2596 	ld	a,#0x96
   5456 BB            [ 4] 2597 	cp	a, e
   5457 3E 00         [ 7] 2598 	ld	a,#0x00
   5459 9A            [ 4] 2599 	sbc	a, d
   545A E2 5F 54      [10] 2600 	jp	PO, 00164$
   545D EE 80         [ 7] 2601 	xor	a, #0x80
   545F                    2602 00164$:
   545F F2 7D 54      [10] 2603 	jp	P,00105$
                           2604 ;src/main.c:115: cpct_drawSolidBox(memptr, 0, 2, 8);
   5462 21 02 08      [10] 2605 	ld	hl,#0x0802
   5465 E5            [11] 2606 	push	hl
   5466 AF            [ 4] 2607 	xor	a, a
   5467 F5            [11] 2608 	push	af
   5468 33            [ 6] 2609 	inc	sp
   5469 DD 6E FE      [19] 2610 	ld	l,-2 (ix)
   546C DD 66 FF      [19] 2611 	ld	h,-1 (ix)
   546F E5            [11] 2612 	push	hl
   5470 CD 33 63      [17] 2613 	call	_cpct_drawSolidBox
   5473 F1            [10] 2614 	pop	af
   5474 F1            [10] 2615 	pop	af
   5475 33            [ 6] 2616 	inc	sp
                           2617 ;src/main.c:116: pushed --;
   5476 E1            [10] 2618 	pop	hl
   5477 E5            [11] 2619 	push	hl
   5478 2B            [ 6] 2620 	dec	hl
   5479 E3            [19] 2621 	ex	(sp), hl
                           2622 ;src/main.c:117: cont = 0;
   547A 11 00 00      [10] 2623 	ld	de,#0x0000
   547D                    2624 00105$:
                           2625 ;src/main.c:120: switch (pushed){
   547D DD 7E FB      [19] 2626 	ld	a,-5 (ix)
   5480 07            [ 4] 2627 	rlca
   5481 E6 01         [ 7] 2628 	and	a,#0x01
   5483 47            [ 4] 2629 	ld	b,a
   5484 3E 02         [ 7] 2630 	ld	a,#0x02
   5486 DD BE FA      [19] 2631 	cp	a, -6 (ix)
   5489 3E 00         [ 7] 2632 	ld	a,#0x00
   548B DD 9E FB      [19] 2633 	sbc	a, -5 (ix)
   548E E2 93 54      [10] 2634 	jp	PO, 00165$
   5491 EE 80         [ 7] 2635 	xor	a, #0x80
   5493                    2636 00165$:
   5493 07            [ 4] 2637 	rlca
   5494 E6 01         [ 7] 2638 	and	a,#0x01
   5496 4F            [ 4] 2639 	ld	c,a
   5497 78            [ 4] 2640 	ld	a,b
   5498 B7            [ 4] 2641 	or	a,a
   5499 20 32         [12] 2642 	jr	NZ,00110$
   549B B1            [ 4] 2643 	or	a,c
   549C 20 2F         [12] 2644 	jr	NZ,00110$
   549E D5            [11] 2645 	push	de
   549F DD 5E FA      [19] 2646 	ld	e,-6 (ix)
   54A2 16 00         [ 7] 2647 	ld	d,#0x00
   54A4 21 AB 54      [10] 2648 	ld	hl,#00166$
   54A7 19            [11] 2649 	add	hl,de
   54A8 19            [11] 2650 	add	hl,de
                           2651 ;src/main.c:121: case 0: init = 50;break;
   54A9 D1            [10] 2652 	pop	de
   54AA E9            [ 4] 2653 	jp	(hl)
   54AB                    2654 00166$:
   54AB 18 04         [12] 2655 	jr	00107$
   54AD 18 0C         [12] 2656 	jr	00108$
   54AF 18 14         [12] 2657 	jr	00109$
   54B1                    2658 00107$:
   54B1 DD 36 FC 32   [19] 2659 	ld	-4 (ix),#0x32
   54B5 DD 36 FD 00   [19] 2660 	ld	-3 (ix),#0x00
   54B9 18 12         [12] 2661 	jr	00110$
                           2662 ;src/main.c:122: case 1: init = 70;break;
   54BB                    2663 00108$:
   54BB DD 36 FC 46   [19] 2664 	ld	-4 (ix),#0x46
   54BF DD 36 FD 00   [19] 2665 	ld	-3 (ix),#0x00
   54C3 18 08         [12] 2666 	jr	00110$
                           2667 ;src/main.c:123: case 2: init = 90;break;
   54C5                    2668 00109$:
   54C5 DD 36 FC 5A   [19] 2669 	ld	-4 (ix),#0x5A
   54C9 DD 36 FD 00   [19] 2670 	ld	-3 (ix),#0x00
                           2671 ;src/main.c:124: }
   54CD                    2672 00110$:
                           2673 ;src/main.c:125: memptr = cpct_getScreenPtr(VMEM,15,init);
   54CD DD 66 FC      [19] 2674 	ld	h,-4 (ix)
   54D0 C5            [11] 2675 	push	bc
   54D1 D5            [11] 2676 	push	de
   54D2 E5            [11] 2677 	push	hl
   54D3 33            [ 6] 2678 	inc	sp
   54D4 3E 0F         [ 7] 2679 	ld	a,#0x0F
   54D6 F5            [11] 2680 	push	af
   54D7 33            [ 6] 2681 	inc	sp
   54D8 21 00 C0      [10] 2682 	ld	hl,#0xC000
   54DB E5            [11] 2683 	push	hl
   54DC CD EB 63      [17] 2684 	call	_cpct_getScreenPtr
   54DF D1            [10] 2685 	pop	de
   54E0 C1            [10] 2686 	pop	bc
                           2687 ;src/main.c:90: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   54E1 DD 75 FE      [19] 2688 	ld	-2 (ix),l
   54E4 DD 74 FF      [19] 2689 	ld	-1 (ix),h
                           2690 ;src/main.c:126: cpct_drawSolidBox(memptr, 3, 2, 8);
   54E7 C5            [11] 2691 	push	bc
   54E8 D5            [11] 2692 	push	de
   54E9 21 02 08      [10] 2693 	ld	hl,#0x0802
   54EC E5            [11] 2694 	push	hl
   54ED 3E 03         [ 7] 2695 	ld	a,#0x03
   54EF F5            [11] 2696 	push	af
   54F0 33            [ 6] 2697 	inc	sp
   54F1 DD 6E FE      [19] 2698 	ld	l,-2 (ix)
   54F4 DD 66 FF      [19] 2699 	ld	h,-1 (ix)
   54F7 E5            [11] 2700 	push	hl
   54F8 CD 33 63      [17] 2701 	call	_cpct_drawSolidBox
   54FB F1            [10] 2702 	pop	af
   54FC F1            [10] 2703 	pop	af
   54FD 33            [ 6] 2704 	inc	sp
   54FE 21 00 40      [10] 2705 	ld	hl,#0x4000
   5501 CD 52 61      [17] 2706 	call	_cpct_isKeyPressed
   5504 7D            [ 4] 2707 	ld	a,l
   5505 D1            [10] 2708 	pop	de
   5506 C1            [10] 2709 	pop	bc
   5507 B7            [ 4] 2710 	or	a, a
   5508 28 27         [12] 2711 	jr	Z,00116$
                           2712 ;src/main.c:128: switch (pushed){
   550A 78            [ 4] 2713 	ld	a,b
   550B B7            [ 4] 2714 	or	a,a
   550C 20 23         [12] 2715 	jr	NZ,00116$
   550E B1            [ 4] 2716 	or	a,c
   550F 20 20         [12] 2717 	jr	NZ,00116$
   5511 DD 5E FA      [19] 2718 	ld	e,-6 (ix)
   5514 16 00         [ 7] 2719 	ld	d,#0x00
   5516 21 1C 55      [10] 2720 	ld	hl,#00167$
   5519 19            [11] 2721 	add	hl,de
   551A 19            [11] 2722 	add	hl,de
                           2723 ;src/main.c:129: case 0: return 1;break;
   551B E9            [ 4] 2724 	jp	(hl)
   551C                    2725 00167$:
   551C 18 04         [12] 2726 	jr	00111$
   551E 18 07         [12] 2727 	jr	00112$
   5520 18 0A         [12] 2728 	jr	00113$
   5522                    2729 00111$:
   5522 21 01 00      [10] 2730 	ld	hl,#0x0001
   5525 18 0E         [12] 2731 	jr	00120$
                           2732 ;src/main.c:130: case 1: return 2;break;
   5527                    2733 00112$:
   5527 21 02 00      [10] 2734 	ld	hl,#0x0002
   552A 18 09         [12] 2735 	jr	00120$
                           2736 ;src/main.c:131: case 2: return 0;break;
   552C                    2737 00113$:
   552C 21 00 00      [10] 2738 	ld	hl,#0x0000
   552F 18 04         [12] 2739 	jr	00120$
                           2740 ;src/main.c:132: }
   5531                    2741 00116$:
                           2742 ;src/main.c:134: cont++;
   5531 13            [ 6] 2743 	inc	de
   5532 C3 0C 54      [10] 2744 	jp	00118$
   5535                    2745 00120$:
   5535 DD F9         [10] 2746 	ld	sp, ix
   5537 DD E1         [14] 2747 	pop	ix
   5539 C9            [10] 2748 	ret
   553A                    2749 ___str_1:
   553A 4C 6F 75 6E 67 65  2750 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   554A 00                 2751 	.db 0x00
   554B                    2752 ___str_2:
   554B 4E 75 65 76 61 20  2753 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   5558 00                 2754 	.db 0x00
   5559                    2755 ___str_3:
   5559 43 72 65 64 69 74  2756 	.ascii "Creditos"
        6F 73
   5561 00                 2757 	.db 0x00
   5562                    2758 ___str_4:
   5562 53 61 6C 69 72     2759 	.ascii "Salir"
   5567 00                 2760 	.db 0x00
                           2761 ;src/main.c:153: void checkBoundsCollisionsEnemy(u8 *x,u8 *y, u8 lx, u8 ly,u8 sizeX,u8 sizeY){
                           2762 ;	---------------------------------
                           2763 ; Function checkBoundsCollisionsEnemy
                           2764 ; ---------------------------------
   5568                    2765 _checkBoundsCollisionsEnemy::
   5568 DD E5         [15] 2766 	push	ix
   556A DD 21 00 00   [14] 2767 	ld	ix,#0
   556E DD 39         [15] 2768 	add	ix,sp
   5570 21 EC FF      [10] 2769 	ld	hl,#-20
   5573 39            [11] 2770 	add	hl,sp
   5574 F9            [ 6] 2771 	ld	sp,hl
                           2772 ;src/main.c:155: u8 *posX = x;
   5575 DD 7E 04      [19] 2773 	ld	a,4 (ix)
   5578 DD 77 EC      [19] 2774 	ld	-20 (ix),a
   557B DD 7E 05      [19] 2775 	ld	a,5 (ix)
   557E DD 77 ED      [19] 2776 	ld	-19 (ix),a
                           2777 ;src/main.c:156: u8 *posY = y;
   5581 DD 7E 06      [19] 2778 	ld	a,6 (ix)
   5584 DD 77 EE      [19] 2779 	ld	-18 (ix),a
   5587 DD 7E 07      [19] 2780 	ld	a,7 (ix)
   558A DD 77 EF      [19] 2781 	ld	-17 (ix),a
                           2782 ;src/main.c:157: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1
   558D DD 6E EE      [19] 2783 	ld	l,-18 (ix)
   5590 DD 66 EF      [19] 2784 	ld	h,-17 (ix)
   5593 7E            [ 7] 2785 	ld	a,(hl)
   5594 DD 77 FB      [19] 2786 	ld	-5 (ix), a
   5597 07            [ 4] 2787 	rlca
   5598 07            [ 4] 2788 	rlca
   5599 07            [ 4] 2789 	rlca
   559A 07            [ 4] 2790 	rlca
   559B E6 0F         [ 7] 2791 	and	a,#0x0F
   559D 4F            [ 4] 2792 	ld	c,a
   559E 06 00         [ 7] 2793 	ld	b,#0x00
   55A0 69            [ 4] 2794 	ld	l, c
   55A1 60            [ 4] 2795 	ld	h, b
   55A2 29            [11] 2796 	add	hl, hl
   55A3 29            [11] 2797 	add	hl, hl
   55A4 09            [11] 2798 	add	hl, bc
   55A5 29            [11] 2799 	add	hl, hl
   55A6 29            [11] 2800 	add	hl, hl
   55A7 3E 3C         [ 7] 2801 	ld	a,#<(_scene)
   55A9 85            [ 4] 2802 	add	a, l
   55AA DD 77 F9      [19] 2803 	ld	-7 (ix),a
   55AD 3E 64         [ 7] 2804 	ld	a,#>(_scene)
   55AF 8C            [ 4] 2805 	adc	a, h
   55B0 DD 77 FA      [19] 2806 	ld	-6 (ix),a
   55B3 E1            [10] 2807 	pop	hl
   55B4 E5            [11] 2808 	push	hl
   55B5 7E            [ 7] 2809 	ld	a,(hl)
   55B6 DD 77 FE      [19] 2810 	ld	-2 (ix), a
   55B9 0F            [ 4] 2811 	rrca
   55BA 0F            [ 4] 2812 	rrca
   55BB E6 3F         [ 7] 2813 	and	a,#0x3F
   55BD DD 77 FF      [19] 2814 	ld	-1 (ix), a
   55C0 DD 86 F9      [19] 2815 	add	a, -7 (ix)
   55C3 6F            [ 4] 2816 	ld	l,a
   55C4 3E 00         [ 7] 2817 	ld	a,#0x00
   55C6 DD 8E FA      [19] 2818 	adc	a, -6 (ix)
   55C9 67            [ 4] 2819 	ld	h,a
   55CA 7E            [ 7] 2820 	ld	a,(hl)
   55CB DD 77 F8      [19] 2821 	ld	-8 (ix), a
   55CE 3D            [ 4] 2822 	dec	a
   55CF CA DD 56      [10] 2823 	jp	Z,00106$
                           2824 ;src/main.c:158: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   55D2 DD 6E FE      [19] 2825 	ld	l,-2 (ix)
   55D5 26 00         [ 7] 2826 	ld	h,#0x00
   55D7 DD 5E 0A      [19] 2827 	ld	e,10 (ix)
   55DA 16 00         [ 7] 2828 	ld	d,#0x00
   55DC 19            [11] 2829 	add	hl,de
   55DD 7D            [ 4] 2830 	ld	a,l
   55DE C6 FF         [ 7] 2831 	add	a,#0xFF
   55E0 DD 77 F0      [19] 2832 	ld	-16 (ix),a
   55E3 7C            [ 4] 2833 	ld	a,h
   55E4 CE FF         [ 7] 2834 	adc	a,#0xFF
   55E6 DD 77 F1      [19] 2835 	ld	-15 (ix),a
   55E9 DD 7E F0      [19] 2836 	ld	a,-16 (ix)
   55EC DD 77 F6      [19] 2837 	ld	-10 (ix),a
   55EF DD 7E F1      [19] 2838 	ld	a,-15 (ix)
   55F2 DD 77 F7      [19] 2839 	ld	-9 (ix),a
   55F5 DD 7E F1      [19] 2840 	ld	a,-15 (ix)
   55F8 07            [ 4] 2841 	rlca
   55F9 E6 01         [ 7] 2842 	and	a,#0x01
   55FB DD 77 FE      [19] 2843 	ld	-2 (ix),a
   55FE 23            [ 6] 2844 	inc	hl
   55FF 23            [ 6] 2845 	inc	hl
   5600 DD 75 F2      [19] 2846 	ld	-14 (ix),l
   5603 DD 74 F3      [19] 2847 	ld	-13 (ix),h
   5606 DD 7E FE      [19] 2848 	ld	a,-2 (ix)
   5609 B7            [ 4] 2849 	or	a, a
   560A 28 0C         [12] 2850 	jr	Z,00114$
   560C DD 7E F2      [19] 2851 	ld	a,-14 (ix)
   560F DD 77 F6      [19] 2852 	ld	-10 (ix),a
   5612 DD 7E F3      [19] 2853 	ld	a,-13 (ix)
   5615 DD 77 F7      [19] 2854 	ld	-9 (ix),a
   5618                    2855 00114$:
   5618 DD 6E F6      [19] 2856 	ld	l,-10 (ix)
   561B DD 66 F7      [19] 2857 	ld	h,-9 (ix)
   561E CB 2C         [ 8] 2858 	sra	h
   5620 CB 1D         [ 8] 2859 	rr	l
   5622 CB 2C         [ 8] 2860 	sra	h
   5624 CB 1D         [ 8] 2861 	rr	l
   5626 DD 5E F9      [19] 2862 	ld	e,-7 (ix)
   5629 DD 56 FA      [19] 2863 	ld	d,-6 (ix)
   562C 19            [11] 2864 	add	hl,de
   562D 7E            [ 7] 2865 	ld	a,(hl)
   562E 3D            [ 4] 2866 	dec	a
   562F CA DD 56      [10] 2867 	jp	Z,00106$
                           2868 ;src/main.c:159: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] == 1
   5632 DD 6E FB      [19] 2869 	ld	l,-5 (ix)
   5635 26 00         [ 7] 2870 	ld	h,#0x00
   5637 DD 5E 0B      [19] 2871 	ld	e,11 (ix)
   563A 16 00         [ 7] 2872 	ld	d,#0x00
   563C 19            [11] 2873 	add	hl,de
   563D 4D            [ 4] 2874 	ld	c,l
   563E 44            [ 4] 2875 	ld	b,h
   563F 0B            [ 6] 2876 	dec	bc
   5640 0B            [ 6] 2877 	dec	bc
   5641 59            [ 4] 2878 	ld	e, c
   5642 78            [ 4] 2879 	ld	a,b
   5643 57            [ 4] 2880 	ld	d,a
   5644 07            [ 4] 2881 	rlca
   5645 E6 01         [ 7] 2882 	and	a,#0x01
   5647 DD 77 F6      [19] 2883 	ld	-10 (ix),a
   564A 7D            [ 4] 2884 	ld	a,l
   564B C6 0D         [ 7] 2885 	add	a, #0x0D
   564D DD 77 FC      [19] 2886 	ld	-4 (ix),a
   5650 7C            [ 4] 2887 	ld	a,h
   5651 CE 00         [ 7] 2888 	adc	a, #0x00
   5653 DD 77 FD      [19] 2889 	ld	-3 (ix),a
   5656 DD 7E F6      [19] 2890 	ld	a,-10 (ix)
   5659 B7            [ 4] 2891 	or	a, a
   565A 28 06         [12] 2892 	jr	Z,00115$
   565C DD 5E FC      [19] 2893 	ld	e,-4 (ix)
   565F DD 56 FD      [19] 2894 	ld	d,-3 (ix)
   5662                    2895 00115$:
   5662 CB 2A         [ 8] 2896 	sra	d
   5664 CB 1B         [ 8] 2897 	rr	e
   5666 CB 2A         [ 8] 2898 	sra	d
   5668 CB 1B         [ 8] 2899 	rr	e
   566A CB 2A         [ 8] 2900 	sra	d
   566C CB 1B         [ 8] 2901 	rr	e
   566E CB 2A         [ 8] 2902 	sra	d
   5670 CB 1B         [ 8] 2903 	rr	e
   5672 6B            [ 4] 2904 	ld	l, e
   5673 62            [ 4] 2905 	ld	h, d
   5674 29            [11] 2906 	add	hl, hl
   5675 29            [11] 2907 	add	hl, hl
   5676 19            [11] 2908 	add	hl, de
   5677 29            [11] 2909 	add	hl, hl
   5678 29            [11] 2910 	add	hl, hl
   5679 11 3C 64      [10] 2911 	ld	de,#_scene
   567C 19            [11] 2912 	add	hl,de
   567D DD 5E FF      [19] 2913 	ld	e,-1 (ix)
   5680 16 00         [ 7] 2914 	ld	d,#0x00
   5682 19            [11] 2915 	add	hl,de
   5683 7E            [ 7] 2916 	ld	a,(hl)
   5684 3D            [ 4] 2917 	dec	a
   5685 28 56         [12] 2918 	jr	Z,00106$
                           2919 ;src/main.c:160: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] == 1
   5687 69            [ 4] 2920 	ld	l, c
   5688 60            [ 4] 2921 	ld	h, b
   5689 DD 7E F6      [19] 2922 	ld	a,-10 (ix)
   568C B7            [ 4] 2923 	or	a, a
   568D 28 06         [12] 2924 	jr	Z,00116$
   568F DD 6E FC      [19] 2925 	ld	l,-4 (ix)
   5692 DD 66 FD      [19] 2926 	ld	h,-3 (ix)
   5695                    2927 00116$:
   5695 CB 2C         [ 8] 2928 	sra	h
   5697 CB 1D         [ 8] 2929 	rr	l
   5699 CB 2C         [ 8] 2930 	sra	h
   569B CB 1D         [ 8] 2931 	rr	l
   569D CB 2C         [ 8] 2932 	sra	h
   569F CB 1D         [ 8] 2933 	rr	l
   56A1 CB 2C         [ 8] 2934 	sra	h
   56A3 CB 1D         [ 8] 2935 	rr	l
   56A5 5D            [ 4] 2936 	ld	e, l
   56A6 54            [ 4] 2937 	ld	d, h
   56A7 29            [11] 2938 	add	hl, hl
   56A8 29            [11] 2939 	add	hl, hl
   56A9 19            [11] 2940 	add	hl, de
   56AA 29            [11] 2941 	add	hl, hl
   56AB 29            [11] 2942 	add	hl, hl
   56AC 3E 3C         [ 7] 2943 	ld	a,#<(_scene)
   56AE 85            [ 4] 2944 	add	a, l
   56AF DD 77 F4      [19] 2945 	ld	-12 (ix),a
   56B2 3E 64         [ 7] 2946 	ld	a,#>(_scene)
   56B4 8C            [ 4] 2947 	adc	a, h
   56B5 DD 77 F5      [19] 2948 	ld	-11 (ix),a
   56B8 DD 6E F0      [19] 2949 	ld	l,-16 (ix)
   56BB DD 66 F1      [19] 2950 	ld	h,-15 (ix)
   56BE DD 7E FE      [19] 2951 	ld	a,-2 (ix)
   56C1 B7            [ 4] 2952 	or	a, a
   56C2 28 06         [12] 2953 	jr	Z,00117$
   56C4 DD 6E F2      [19] 2954 	ld	l,-14 (ix)
   56C7 DD 66 F3      [19] 2955 	ld	h,-13 (ix)
   56CA                    2956 00117$:
   56CA CB 2C         [ 8] 2957 	sra	h
   56CC CB 1D         [ 8] 2958 	rr	l
   56CE CB 2C         [ 8] 2959 	sra	h
   56D0 CB 1D         [ 8] 2960 	rr	l
   56D2 DD 5E F4      [19] 2961 	ld	e,-12 (ix)
   56D5 DD 56 F5      [19] 2962 	ld	d,-11 (ix)
   56D8 19            [11] 2963 	add	hl,de
   56D9 7E            [ 7] 2964 	ld	a,(hl)
   56DA 3D            [ 4] 2965 	dec	a
   56DB 20 13         [12] 2966 	jr	NZ,00107$
   56DD                    2967 00106$:
                           2968 ;src/main.c:162: *posX=lx;
   56DD E1            [10] 2969 	pop	hl
   56DE E5            [11] 2970 	push	hl
   56DF DD 7E 08      [19] 2971 	ld	a,8 (ix)
   56E2 77            [ 7] 2972 	ld	(hl),a
                           2973 ;src/main.c:163: *posY=ly;
   56E3 DD 6E EE      [19] 2974 	ld	l,-18 (ix)
   56E6 DD 66 EF      [19] 2975 	ld	h,-17 (ix)
   56E9 DD 7E 09      [19] 2976 	ld	a,9 (ix)
   56EC 77            [ 7] 2977 	ld	(hl),a
   56ED C3 B8 57      [10] 2978 	jp	00112$
   56F0                    2979 00107$:
                           2980 ;src/main.c:165: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] != 3
   56F0 DD 7E F8      [19] 2981 	ld	a,-8 (ix)
   56F3 D6 03         [ 7] 2982 	sub	a, #0x03
   56F5 C2 A8 57      [10] 2983 	jp	NZ,00101$
                           2984 ;src/main.c:166: || scene[(posY[0])/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   56F8 DD 6E F0      [19] 2985 	ld	l,-16 (ix)
   56FB DD 66 F1      [19] 2986 	ld	h,-15 (ix)
   56FE DD 7E FE      [19] 2987 	ld	a,-2 (ix)
   5701 B7            [ 4] 2988 	or	a, a
   5702 28 06         [12] 2989 	jr	Z,00118$
   5704 DD 6E F2      [19] 2990 	ld	l,-14 (ix)
   5707 DD 66 F3      [19] 2991 	ld	h,-13 (ix)
   570A                    2992 00118$:
   570A CB 2C         [ 8] 2993 	sra	h
   570C CB 1D         [ 8] 2994 	rr	l
   570E CB 2C         [ 8] 2995 	sra	h
   5710 CB 1D         [ 8] 2996 	rr	l
   5712 DD 5E F9      [19] 2997 	ld	e,-7 (ix)
   5715 DD 56 FA      [19] 2998 	ld	d,-6 (ix)
   5718 19            [11] 2999 	add	hl,de
   5719 7E            [ 7] 3000 	ld	a,(hl)
   571A D6 03         [ 7] 3001 	sub	a, #0x03
   571C C2 A8 57      [10] 3002 	jp	NZ,00101$
                           3003 ;src/main.c:167: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0])/tilewidth] != 3
   571F 69            [ 4] 3004 	ld	l, c
   5720 60            [ 4] 3005 	ld	h, b
   5721 DD 7E F6      [19] 3006 	ld	a,-10 (ix)
   5724 B7            [ 4] 3007 	or	a, a
   5725 28 06         [12] 3008 	jr	Z,00119$
   5727 DD 6E FC      [19] 3009 	ld	l,-4 (ix)
   572A DD 66 FD      [19] 3010 	ld	h,-3 (ix)
   572D                    3011 00119$:
   572D CB 2C         [ 8] 3012 	sra	h
   572F CB 1D         [ 8] 3013 	rr	l
   5731 CB 2C         [ 8] 3014 	sra	h
   5733 CB 1D         [ 8] 3015 	rr	l
   5735 CB 2C         [ 8] 3016 	sra	h
   5737 CB 1D         [ 8] 3017 	rr	l
   5739 CB 2C         [ 8] 3018 	sra	h
   573B CB 1D         [ 8] 3019 	rr	l
   573D 5D            [ 4] 3020 	ld	e, l
   573E 54            [ 4] 3021 	ld	d, h
   573F 29            [11] 3022 	add	hl, hl
   5740 29            [11] 3023 	add	hl, hl
   5741 19            [11] 3024 	add	hl, de
   5742 29            [11] 3025 	add	hl, hl
   5743 29            [11] 3026 	add	hl, hl
   5744 11 3C 64      [10] 3027 	ld	de,#_scene
   5747 19            [11] 3028 	add	hl,de
   5748 DD 5E FF      [19] 3029 	ld	e,-1 (ix)
   574B 16 00         [ 7] 3030 	ld	d,#0x00
   574D 19            [11] 3031 	add	hl,de
   574E 7E            [ 7] 3032 	ld	a,(hl)
   574F D6 03         [ 7] 3033 	sub	a, #0x03
   5751 20 55         [12] 3034 	jr	NZ,00101$
                           3035 ;src/main.c:168: || scene[(posY[0]+sizeY-2)/tileheight][(posX[0]+sizeX-1)/tilewidth] != 3
   5753 DD 7E F6      [19] 3036 	ld	a,-10 (ix)
   5756 B7            [ 4] 3037 	or	a, a
   5757 28 06         [12] 3038 	jr	Z,00120$
   5759 DD 4E FC      [19] 3039 	ld	c,-4 (ix)
   575C DD 46 FD      [19] 3040 	ld	b,-3 (ix)
   575F                    3041 00120$:
   575F CB 28         [ 8] 3042 	sra	b
   5761 CB 19         [ 8] 3043 	rr	c
   5763 CB 28         [ 8] 3044 	sra	b
   5765 CB 19         [ 8] 3045 	rr	c
   5767 CB 28         [ 8] 3046 	sra	b
   5769 CB 19         [ 8] 3047 	rr	c
   576B CB 28         [ 8] 3048 	sra	b
   576D CB 19         [ 8] 3049 	rr	c
   576F 69            [ 4] 3050 	ld	l, c
   5770 60            [ 4] 3051 	ld	h, b
   5771 29            [11] 3052 	add	hl, hl
   5772 29            [11] 3053 	add	hl, hl
   5773 09            [11] 3054 	add	hl, bc
   5774 29            [11] 3055 	add	hl, hl
   5775 29            [11] 3056 	add	hl, hl
   5776 3E 3C         [ 7] 3057 	ld	a,#<(_scene)
   5778 85            [ 4] 3058 	add	a, l
   5779 DD 77 F4      [19] 3059 	ld	-12 (ix),a
   577C 3E 64         [ 7] 3060 	ld	a,#>(_scene)
   577E 8C            [ 4] 3061 	adc	a, h
   577F DD 77 F5      [19] 3062 	ld	-11 (ix),a
   5782 DD 6E F0      [19] 3063 	ld	l,-16 (ix)
   5785 DD 66 F1      [19] 3064 	ld	h,-15 (ix)
   5788 DD 7E FE      [19] 3065 	ld	a,-2 (ix)
   578B B7            [ 4] 3066 	or	a, a
   578C 28 06         [12] 3067 	jr	Z,00121$
   578E DD 6E F2      [19] 3068 	ld	l,-14 (ix)
   5791 DD 66 F3      [19] 3069 	ld	h,-13 (ix)
   5794                    3070 00121$:
   5794 CB 2C         [ 8] 3071 	sra	h
   5796 CB 1D         [ 8] 3072 	rr	l
   5798 CB 2C         [ 8] 3073 	sra	h
   579A CB 1D         [ 8] 3074 	rr	l
   579C DD 5E F4      [19] 3075 	ld	e,-12 (ix)
   579F DD 56 F5      [19] 3076 	ld	d,-11 (ix)
   57A2 19            [11] 3077 	add	hl,de
   57A3 7E            [ 7] 3078 	ld	a,(hl)
   57A4 D6 03         [ 7] 3079 	sub	a, #0x03
   57A6 28 10         [12] 3080 	jr	Z,00112$
   57A8                    3081 00101$:
                           3082 ;src/main.c:170: *posX=lx;
   57A8 E1            [10] 3083 	pop	hl
   57A9 E5            [11] 3084 	push	hl
   57AA DD 7E 08      [19] 3085 	ld	a,8 (ix)
   57AD 77            [ 7] 3086 	ld	(hl),a
                           3087 ;src/main.c:171: *posY=ly;
   57AE DD 6E EE      [19] 3088 	ld	l,-18 (ix)
   57B1 DD 66 EF      [19] 3089 	ld	h,-17 (ix)
   57B4 DD 7E 09      [19] 3090 	ld	a,9 (ix)
   57B7 77            [ 7] 3091 	ld	(hl),a
   57B8                    3092 00112$:
   57B8 DD F9         [10] 3093 	ld	sp, ix
   57BA DD E1         [14] 3094 	pop	ix
   57BC C9            [10] 3095 	ret
                           3096 ;src/main.c:177: void checkBoundsCollisions(u8 *corazon,u8 *flecha){
                           3097 ;	---------------------------------
                           3098 ; Function checkBoundsCollisions
                           3099 ; ---------------------------------
   57BD                    3100 _checkBoundsCollisions::
   57BD DD E5         [15] 3101 	push	ix
   57BF DD 21 00 00   [14] 3102 	ld	ix,#0
   57C3 DD 39         [15] 3103 	add	ix,sp
   57C5 21 F2 FF      [10] 3104 	ld	hl,#-14
   57C8 39            [11] 3105 	add	hl,sp
   57C9 F9            [ 6] 3106 	ld	sp,hl
                           3107 ;src/main.c:178: if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 1
   57CA 3A 40 65      [13] 3108 	ld	a,(#(_player + 0x0001) + 0)
   57CD DD 77 F8      [19] 3109 	ld	-8 (ix), a
   57D0 07            [ 4] 3110 	rlca
   57D1 07            [ 4] 3111 	rlca
   57D2 07            [ 4] 3112 	rlca
   57D3 07            [ 4] 3113 	rlca
   57D4 E6 0F         [ 7] 3114 	and	a,#0x0F
   57D6 4F            [ 4] 3115 	ld	c,a
   57D7 06 00         [ 7] 3116 	ld	b,#0x00
   57D9 69            [ 4] 3117 	ld	l, c
   57DA 60            [ 4] 3118 	ld	h, b
   57DB 29            [11] 3119 	add	hl, hl
   57DC 29            [11] 3120 	add	hl, hl
   57DD 09            [11] 3121 	add	hl, bc
   57DE 29            [11] 3122 	add	hl, hl
   57DF 29            [11] 3123 	add	hl, hl
   57E0 3E 3C         [ 7] 3124 	ld	a,#<(_scene)
   57E2 85            [ 4] 3125 	add	a, l
   57E3 DD 77 F4      [19] 3126 	ld	-12 (ix),a
   57E6 3E 64         [ 7] 3127 	ld	a,#>(_scene)
   57E8 8C            [ 4] 3128 	adc	a, h
   57E9 DD 77 F5      [19] 3129 	ld	-11 (ix),a
   57EC 21 3F 65      [10] 3130 	ld	hl, #_player + 0
   57EF 4E            [ 7] 3131 	ld	c,(hl)
   57F0 79            [ 4] 3132 	ld	a,c
   57F1 0F            [ 4] 3133 	rrca
   57F2 0F            [ 4] 3134 	rrca
   57F3 E6 3F         [ 7] 3135 	and	a,#0x3F
   57F5 DD 77 F7      [19] 3136 	ld	-9 (ix), a
   57F8 DD 86 F4      [19] 3137 	add	a, -12 (ix)
   57FB 6F            [ 4] 3138 	ld	l,a
   57FC 3E 00         [ 7] 3139 	ld	a,#0x00
   57FE DD 8E F5      [19] 3140 	adc	a, -11 (ix)
   5801 67            [ 4] 3141 	ld	h,a
   5802 7E            [ 7] 3142 	ld	a,(hl)
   5803 DD 77 F6      [19] 3143 	ld	-10 (ix), a
   5806 3D            [ 4] 3144 	dec	a
   5807 CA 1D 59      [10] 3145 	jp	Z,00124$
                           3146 ;src/main.c:179: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   580A 06 00         [ 7] 3147 	ld	b,#0x00
   580C 21 03 00      [10] 3148 	ld	hl,#0x0003
   580F 09            [11] 3149 	add	hl,bc
   5810 DD 75 FB      [19] 3150 	ld	-5 (ix),l
   5813 DD 74 FC      [19] 3151 	ld	-4 (ix),h
   5816 DD 7E FB      [19] 3152 	ld	a,-5 (ix)
   5819 DD 77 FE      [19] 3153 	ld	-2 (ix),a
   581C DD 7E FC      [19] 3154 	ld	a,-4 (ix)
   581F DD 77 FF      [19] 3155 	ld	-1 (ix),a
   5822 DD 7E FC      [19] 3156 	ld	a,-4 (ix)
   5825 07            [ 4] 3157 	rlca
   5826 E6 01         [ 7] 3158 	and	a,#0x01
   5828 DD 77 FD      [19] 3159 	ld	-3 (ix),a
   582B 21 06 00      [10] 3160 	ld	hl,#0x0006
   582E 09            [11] 3161 	add	hl,bc
   582F E3            [19] 3162 	ex	(sp), hl
   5830 DD 7E FD      [19] 3163 	ld	a,-3 (ix)
   5833 B7            [ 4] 3164 	or	a, a
   5834 28 0C         [12] 3165 	jr	Z,00132$
   5836 DD 7E F2      [19] 3166 	ld	a,-14 (ix)
   5839 DD 77 FE      [19] 3167 	ld	-2 (ix),a
   583C DD 7E F3      [19] 3168 	ld	a,-13 (ix)
   583F DD 77 FF      [19] 3169 	ld	-1 (ix),a
   5842                    3170 00132$:
   5842 DD 6E FE      [19] 3171 	ld	l,-2 (ix)
   5845 DD 66 FF      [19] 3172 	ld	h,-1 (ix)
   5848 CB 2C         [ 8] 3173 	sra	h
   584A CB 1D         [ 8] 3174 	rr	l
   584C CB 2C         [ 8] 3175 	sra	h
   584E CB 1D         [ 8] 3176 	rr	l
   5850 DD 5E F4      [19] 3177 	ld	e,-12 (ix)
   5853 DD 56 F5      [19] 3178 	ld	d,-11 (ix)
   5856 19            [11] 3179 	add	hl,de
   5857 7E            [ 7] 3180 	ld	a,(hl)
   5858 3D            [ 4] 3181 	dec	a
   5859 CA 1D 59      [10] 3182 	jp	Z,00124$
                           3183 ;src/main.c:180: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 1
   585C DD 5E F8      [19] 3184 	ld	e,-8 (ix)
   585F 16 00         [ 7] 3185 	ld	d,#0x00
   5861 21 0E 00      [10] 3186 	ld	hl,#0x000E
   5864 19            [11] 3187 	add	hl,de
   5865 4D            [ 4] 3188 	ld	c,l
   5866 44            [ 4] 3189 	ld	b,h
   5867 DD 71 FE      [19] 3190 	ld	-2 (ix),c
   586A DD 70 FF      [19] 3191 	ld	-1 (ix),b
   586D 78            [ 4] 3192 	ld	a,b
   586E 07            [ 4] 3193 	rlca
   586F E6 01         [ 7] 3194 	and	a,#0x01
   5871 DD 77 F8      [19] 3195 	ld	-8 (ix),a
   5874 21 1D 00      [10] 3196 	ld	hl,#0x001D
   5877 19            [11] 3197 	add	hl,de
   5878 DD 75 F9      [19] 3198 	ld	-7 (ix),l
   587B DD 74 FA      [19] 3199 	ld	-6 (ix),h
   587E DD 7E F8      [19] 3200 	ld	a,-8 (ix)
   5881 B7            [ 4] 3201 	or	a, a
   5882 28 0C         [12] 3202 	jr	Z,00133$
   5884 DD 7E F9      [19] 3203 	ld	a,-7 (ix)
   5887 DD 77 FE      [19] 3204 	ld	-2 (ix),a
   588A DD 7E FA      [19] 3205 	ld	a,-6 (ix)
   588D DD 77 FF      [19] 3206 	ld	-1 (ix),a
   5890                    3207 00133$:
   5890 DD 6E FE      [19] 3208 	ld	l,-2 (ix)
   5893 DD 66 FF      [19] 3209 	ld	h,-1 (ix)
   5896 CB 2C         [ 8] 3210 	sra	h
   5898 CB 1D         [ 8] 3211 	rr	l
   589A CB 2C         [ 8] 3212 	sra	h
   589C CB 1D         [ 8] 3213 	rr	l
   589E CB 2C         [ 8] 3214 	sra	h
   58A0 CB 1D         [ 8] 3215 	rr	l
   58A2 CB 2C         [ 8] 3216 	sra	h
   58A4 CB 1D         [ 8] 3217 	rr	l
   58A6 5D            [ 4] 3218 	ld	e, l
   58A7 54            [ 4] 3219 	ld	d, h
   58A8 29            [11] 3220 	add	hl, hl
   58A9 29            [11] 3221 	add	hl, hl
   58AA 19            [11] 3222 	add	hl, de
   58AB 29            [11] 3223 	add	hl, hl
   58AC 29            [11] 3224 	add	hl, hl
   58AD 11 3C 64      [10] 3225 	ld	de,#_scene
   58B0 19            [11] 3226 	add	hl,de
   58B1 DD 5E F7      [19] 3227 	ld	e,-9 (ix)
   58B4 16 00         [ 7] 3228 	ld	d,#0x00
   58B6 19            [11] 3229 	add	hl,de
   58B7 7E            [ 7] 3230 	ld	a,(hl)
   58B8 3D            [ 4] 3231 	dec	a
   58B9 28 62         [12] 3232 	jr	Z,00124$
                           3233 ;src/main.c:181: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 1
   58BB DD 71 FE      [19] 3234 	ld	-2 (ix),c
   58BE DD 70 FF      [19] 3235 	ld	-1 (ix),b
   58C1 DD 7E F8      [19] 3236 	ld	a,-8 (ix)
   58C4 B7            [ 4] 3237 	or	a, a
   58C5 28 0C         [12] 3238 	jr	Z,00134$
   58C7 DD 7E F9      [19] 3239 	ld	a,-7 (ix)
   58CA DD 77 FE      [19] 3240 	ld	-2 (ix),a
   58CD DD 7E FA      [19] 3241 	ld	a,-6 (ix)
   58D0 DD 77 FF      [19] 3242 	ld	-1 (ix),a
   58D3                    3243 00134$:
   58D3 DD 6E FE      [19] 3244 	ld	l,-2 (ix)
   58D6 DD 66 FF      [19] 3245 	ld	h,-1 (ix)
   58D9 CB 2C         [ 8] 3246 	sra	h
   58DB CB 1D         [ 8] 3247 	rr	l
   58DD CB 2C         [ 8] 3248 	sra	h
   58DF CB 1D         [ 8] 3249 	rr	l
   58E1 CB 2C         [ 8] 3250 	sra	h
   58E3 CB 1D         [ 8] 3251 	rr	l
   58E5 CB 2C         [ 8] 3252 	sra	h
   58E7 CB 1D         [ 8] 3253 	rr	l
   58E9 5D            [ 4] 3254 	ld	e, l
   58EA 54            [ 4] 3255 	ld	d, h
   58EB 29            [11] 3256 	add	hl, hl
   58EC 29            [11] 3257 	add	hl, hl
   58ED 19            [11] 3258 	add	hl, de
   58EE 29            [11] 3259 	add	hl, hl
   58EF 29            [11] 3260 	add	hl, hl
   58F0 3E 3C         [ 7] 3261 	ld	a,#<(_scene)
   58F2 85            [ 4] 3262 	add	a, l
   58F3 DD 77 FE      [19] 3263 	ld	-2 (ix),a
   58F6 3E 64         [ 7] 3264 	ld	a,#>(_scene)
   58F8 8C            [ 4] 3265 	adc	a, h
   58F9 DD 77 FF      [19] 3266 	ld	-1 (ix),a
   58FC DD 6E FB      [19] 3267 	ld	l,-5 (ix)
   58FF DD 66 FC      [19] 3268 	ld	h,-4 (ix)
   5902 DD 7E FD      [19] 3269 	ld	a,-3 (ix)
   5905 B7            [ 4] 3270 	or	a, a
   5906 28 02         [12] 3271 	jr	Z,00135$
   5908 E1            [10] 3272 	pop	hl
   5909 E5            [11] 3273 	push	hl
   590A                    3274 00135$:
   590A CB 2C         [ 8] 3275 	sra	h
   590C CB 1D         [ 8] 3276 	rr	l
   590E CB 2C         [ 8] 3277 	sra	h
   5910 CB 1D         [ 8] 3278 	rr	l
   5912 DD 5E FE      [19] 3279 	ld	e,-2 (ix)
   5915 DD 56 FF      [19] 3280 	ld	d,-1 (ix)
   5918 19            [11] 3281 	add	hl,de
   5919 7E            [ 7] 3282 	ld	a,(hl)
   591A 3D            [ 4] 3283 	dec	a
   591B 20 10         [12] 3284 	jr	NZ,00125$
   591D                    3285 00124$:
                           3286 ;src/main.c:183: player.x=player.lx;
   591D 3A 41 65      [13] 3287 	ld	a, (#_player + 2)
   5920 21 3F 65      [10] 3288 	ld	hl,#_player
   5923 77            [ 7] 3289 	ld	(hl),a
                           3290 ;src/main.c:184: player.y=player.ly;
   5924 3A 42 65      [13] 3291 	ld	a, (#_player + 3)
   5927 32 40 65      [13] 3292 	ld	(#(_player + 0x0001)),a
   592A C3 89 5B      [10] 3293 	jp	00130$
   592D                    3294 00125$:
                           3295 ;src/main.c:186: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 2
   592D DD 7E F6      [19] 3296 	ld	a,-10 (ix)
   5930 D6 02         [ 7] 3297 	sub	a, #0x02
   5932 CA D5 59      [10] 3298 	jp	Z,00118$
                           3299 ;src/main.c:187: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   5935 DD 6E FB      [19] 3300 	ld	l,-5 (ix)
   5938 DD 66 FC      [19] 3301 	ld	h,-4 (ix)
   593B DD 7E FD      [19] 3302 	ld	a,-3 (ix)
   593E B7            [ 4] 3303 	or	a, a
   593F 28 02         [12] 3304 	jr	Z,00136$
   5941 E1            [10] 3305 	pop	hl
   5942 E5            [11] 3306 	push	hl
   5943                    3307 00136$:
   5943 CB 2C         [ 8] 3308 	sra	h
   5945 CB 1D         [ 8] 3309 	rr	l
   5947 CB 2C         [ 8] 3310 	sra	h
   5949 CB 1D         [ 8] 3311 	rr	l
   594B DD 5E F4      [19] 3312 	ld	e,-12 (ix)
   594E DD 56 F5      [19] 3313 	ld	d,-11 (ix)
   5951 19            [11] 3314 	add	hl,de
   5952 7E            [ 7] 3315 	ld	a,(hl)
   5953 D6 02         [ 7] 3316 	sub	a, #0x02
   5955 CA D5 59      [10] 3317 	jp	Z,00118$
                           3318 ;src/main.c:188: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 2
   5958 69            [ 4] 3319 	ld	l, c
   5959 60            [ 4] 3320 	ld	h, b
   595A DD 7E F8      [19] 3321 	ld	a,-8 (ix)
   595D B7            [ 4] 3322 	or	a, a
   595E 28 06         [12] 3323 	jr	Z,00137$
   5960 DD 6E F9      [19] 3324 	ld	l,-7 (ix)
   5963 DD 66 FA      [19] 3325 	ld	h,-6 (ix)
   5966                    3326 00137$:
   5966 CB 2C         [ 8] 3327 	sra	h
   5968 CB 1D         [ 8] 3328 	rr	l
   596A CB 2C         [ 8] 3329 	sra	h
   596C CB 1D         [ 8] 3330 	rr	l
   596E CB 2C         [ 8] 3331 	sra	h
   5970 CB 1D         [ 8] 3332 	rr	l
   5972 CB 2C         [ 8] 3333 	sra	h
   5974 CB 1D         [ 8] 3334 	rr	l
   5976 5D            [ 4] 3335 	ld	e, l
   5977 54            [ 4] 3336 	ld	d, h
   5978 29            [11] 3337 	add	hl, hl
   5979 29            [11] 3338 	add	hl, hl
   597A 19            [11] 3339 	add	hl, de
   597B 29            [11] 3340 	add	hl, hl
   597C 29            [11] 3341 	add	hl, hl
   597D 11 3C 64      [10] 3342 	ld	de,#_scene
   5980 19            [11] 3343 	add	hl,de
   5981 DD 5E F7      [19] 3344 	ld	e,-9 (ix)
   5984 16 00         [ 7] 3345 	ld	d,#0x00
   5986 19            [11] 3346 	add	hl,de
   5987 7E            [ 7] 3347 	ld	a,(hl)
   5988 D6 02         [ 7] 3348 	sub	a, #0x02
   598A 28 49         [12] 3349 	jr	Z,00118$
                           3350 ;src/main.c:189: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 2
   598C 69            [ 4] 3351 	ld	l, c
   598D 60            [ 4] 3352 	ld	h, b
   598E DD 7E F8      [19] 3353 	ld	a,-8 (ix)
   5991 B7            [ 4] 3354 	or	a, a
   5992 28 06         [12] 3355 	jr	Z,00138$
   5994 DD 6E F9      [19] 3356 	ld	l,-7 (ix)
   5997 DD 66 FA      [19] 3357 	ld	h,-6 (ix)
   599A                    3358 00138$:
   599A CB 2C         [ 8] 3359 	sra	h
   599C CB 1D         [ 8] 3360 	rr	l
   599E CB 2C         [ 8] 3361 	sra	h
   59A0 CB 1D         [ 8] 3362 	rr	l
   59A2 CB 2C         [ 8] 3363 	sra	h
   59A4 CB 1D         [ 8] 3364 	rr	l
   59A6 CB 2C         [ 8] 3365 	sra	h
   59A8 CB 1D         [ 8] 3366 	rr	l
   59AA 5D            [ 4] 3367 	ld	e, l
   59AB 54            [ 4] 3368 	ld	d, h
   59AC 29            [11] 3369 	add	hl, hl
   59AD 29            [11] 3370 	add	hl, hl
   59AE 19            [11] 3371 	add	hl, de
   59AF 29            [11] 3372 	add	hl, hl
   59B0 29            [11] 3373 	add	hl, hl
   59B1 3E 3C         [ 7] 3374 	ld	a,#<(_scene)
   59B3 85            [ 4] 3375 	add	a, l
   59B4 5F            [ 4] 3376 	ld	e,a
   59B5 3E 64         [ 7] 3377 	ld	a,#>(_scene)
   59B7 8C            [ 4] 3378 	adc	a, h
   59B8 57            [ 4] 3379 	ld	d,a
   59B9 DD 6E FB      [19] 3380 	ld	l,-5 (ix)
   59BC DD 66 FC      [19] 3381 	ld	h,-4 (ix)
   59BF DD 7E FD      [19] 3382 	ld	a,-3 (ix)
   59C2 B7            [ 4] 3383 	or	a, a
   59C3 28 02         [12] 3384 	jr	Z,00139$
   59C5 E1            [10] 3385 	pop	hl
   59C6 E5            [11] 3386 	push	hl
   59C7                    3387 00139$:
   59C7 CB 2C         [ 8] 3388 	sra	h
   59C9 CB 1D         [ 8] 3389 	rr	l
   59CB CB 2C         [ 8] 3390 	sra	h
   59CD CB 1D         [ 8] 3391 	rr	l
   59CF 19            [11] 3392 	add	hl,de
   59D0 7E            [ 7] 3393 	ld	a,(hl)
   59D1 D6 02         [ 7] 3394 	sub	a, #0x02
   59D3 20 21         [12] 3395 	jr	NZ,00119$
   59D5                    3396 00118$:
                           3397 ;src/main.c:191: if(player.life < 3 && *corazon == 0){
   59D5 FD 21 45 65   [14] 3398 	ld	iy,#_player + 6
   59D9 FD 5E 00      [19] 3399 	ld	e, 0 (iy)
   59DC 7B            [ 4] 3400 	ld	a,e
   59DD D6 03         [ 7] 3401 	sub	a, #0x03
   59DF D2 89 5B      [10] 3402 	jp	NC,00130$
   59E2 DD 6E 04      [19] 3403 	ld	l,4 (ix)
   59E5 DD 66 05      [19] 3404 	ld	h,5 (ix)
   59E8 7E            [ 7] 3405 	ld	a,(hl)
   59E9 B7            [ 4] 3406 	or	a, a
   59EA C2 89 5B      [10] 3407 	jp	NZ,00130$
                           3408 ;src/main.c:192: player.life += 1;
   59ED 1C            [ 4] 3409 	inc	e
   59EE FD 73 00      [19] 3410 	ld	0 (iy), e
                           3411 ;src/main.c:193: *corazon = 1;
   59F1 36 01         [10] 3412 	ld	(hl),#0x01
   59F3 C3 89 5B      [10] 3413 	jp	00130$
   59F6                    3414 00119$:
                           3415 ;src/main.c:196: else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 5
   59F6 DD 7E F6      [19] 3416 	ld	a,-10 (ix)
   59F9 D6 05         [ 7] 3417 	sub	a, #0x05
   59FB CA 9E 5A      [10] 3418 	jp	Z,00112$
                           3419 ;src/main.c:197: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   59FE DD 6E FB      [19] 3420 	ld	l,-5 (ix)
   5A01 DD 66 FC      [19] 3421 	ld	h,-4 (ix)
   5A04 DD 7E FD      [19] 3422 	ld	a,-3 (ix)
   5A07 B7            [ 4] 3423 	or	a, a
   5A08 28 02         [12] 3424 	jr	Z,00140$
   5A0A E1            [10] 3425 	pop	hl
   5A0B E5            [11] 3426 	push	hl
   5A0C                    3427 00140$:
   5A0C CB 2C         [ 8] 3428 	sra	h
   5A0E CB 1D         [ 8] 3429 	rr	l
   5A10 CB 2C         [ 8] 3430 	sra	h
   5A12 CB 1D         [ 8] 3431 	rr	l
   5A14 DD 5E F4      [19] 3432 	ld	e,-12 (ix)
   5A17 DD 56 F5      [19] 3433 	ld	d,-11 (ix)
   5A1A 19            [11] 3434 	add	hl,de
   5A1B 7E            [ 7] 3435 	ld	a,(hl)
   5A1C D6 05         [ 7] 3436 	sub	a, #0x05
   5A1E CA 9E 5A      [10] 3437 	jp	Z,00112$
                           3438 ;src/main.c:198: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 5
   5A21 69            [ 4] 3439 	ld	l, c
   5A22 60            [ 4] 3440 	ld	h, b
   5A23 DD 7E F8      [19] 3441 	ld	a,-8 (ix)
   5A26 B7            [ 4] 3442 	or	a, a
   5A27 28 06         [12] 3443 	jr	Z,00141$
   5A29 DD 6E F9      [19] 3444 	ld	l,-7 (ix)
   5A2C DD 66 FA      [19] 3445 	ld	h,-6 (ix)
   5A2F                    3446 00141$:
   5A2F CB 2C         [ 8] 3447 	sra	h
   5A31 CB 1D         [ 8] 3448 	rr	l
   5A33 CB 2C         [ 8] 3449 	sra	h
   5A35 CB 1D         [ 8] 3450 	rr	l
   5A37 CB 2C         [ 8] 3451 	sra	h
   5A39 CB 1D         [ 8] 3452 	rr	l
   5A3B CB 2C         [ 8] 3453 	sra	h
   5A3D CB 1D         [ 8] 3454 	rr	l
   5A3F 5D            [ 4] 3455 	ld	e, l
   5A40 54            [ 4] 3456 	ld	d, h
   5A41 29            [11] 3457 	add	hl, hl
   5A42 29            [11] 3458 	add	hl, hl
   5A43 19            [11] 3459 	add	hl, de
   5A44 29            [11] 3460 	add	hl, hl
   5A45 29            [11] 3461 	add	hl, hl
   5A46 11 3C 64      [10] 3462 	ld	de,#_scene
   5A49 19            [11] 3463 	add	hl,de
   5A4A DD 5E F7      [19] 3464 	ld	e,-9 (ix)
   5A4D 16 00         [ 7] 3465 	ld	d,#0x00
   5A4F 19            [11] 3466 	add	hl,de
   5A50 7E            [ 7] 3467 	ld	a,(hl)
   5A51 D6 05         [ 7] 3468 	sub	a, #0x05
   5A53 28 49         [12] 3469 	jr	Z,00112$
                           3470 ;src/main.c:199: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 5
   5A55 69            [ 4] 3471 	ld	l, c
   5A56 60            [ 4] 3472 	ld	h, b
   5A57 DD 7E F8      [19] 3473 	ld	a,-8 (ix)
   5A5A B7            [ 4] 3474 	or	a, a
   5A5B 28 06         [12] 3475 	jr	Z,00142$
   5A5D DD 6E F9      [19] 3476 	ld	l,-7 (ix)
   5A60 DD 66 FA      [19] 3477 	ld	h,-6 (ix)
   5A63                    3478 00142$:
   5A63 CB 2C         [ 8] 3479 	sra	h
   5A65 CB 1D         [ 8] 3480 	rr	l
   5A67 CB 2C         [ 8] 3481 	sra	h
   5A69 CB 1D         [ 8] 3482 	rr	l
   5A6B CB 2C         [ 8] 3483 	sra	h
   5A6D CB 1D         [ 8] 3484 	rr	l
   5A6F CB 2C         [ 8] 3485 	sra	h
   5A71 CB 1D         [ 8] 3486 	rr	l
   5A73 5D            [ 4] 3487 	ld	e, l
   5A74 54            [ 4] 3488 	ld	d, h
   5A75 29            [11] 3489 	add	hl, hl
   5A76 29            [11] 3490 	add	hl, hl
   5A77 19            [11] 3491 	add	hl, de
   5A78 29            [11] 3492 	add	hl, hl
   5A79 29            [11] 3493 	add	hl, hl
   5A7A 3E 3C         [ 7] 3494 	ld	a,#<(_scene)
   5A7C 85            [ 4] 3495 	add	a, l
   5A7D 5F            [ 4] 3496 	ld	e,a
   5A7E 3E 64         [ 7] 3497 	ld	a,#>(_scene)
   5A80 8C            [ 4] 3498 	adc	a, h
   5A81 57            [ 4] 3499 	ld	d,a
   5A82 DD 6E FB      [19] 3500 	ld	l,-5 (ix)
   5A85 DD 66 FC      [19] 3501 	ld	h,-4 (ix)
   5A88 DD 7E FD      [19] 3502 	ld	a,-3 (ix)
   5A8B B7            [ 4] 3503 	or	a, a
   5A8C 28 02         [12] 3504 	jr	Z,00143$
   5A8E E1            [10] 3505 	pop	hl
   5A8F E5            [11] 3506 	push	hl
   5A90                    3507 00143$:
   5A90 CB 2C         [ 8] 3508 	sra	h
   5A92 CB 1D         [ 8] 3509 	rr	l
   5A94 CB 2C         [ 8] 3510 	sra	h
   5A96 CB 1D         [ 8] 3511 	rr	l
   5A98 19            [11] 3512 	add	hl,de
   5A99 7E            [ 7] 3513 	ld	a,(hl)
   5A9A D6 05         [ 7] 3514 	sub	a, #0x05
   5A9C 20 21         [12] 3515 	jr	NZ,00113$
   5A9E                    3516 00112$:
                           3517 ;src/main.c:201: if(player.bullets < 3 && *flecha == 0){
   5A9E FD 21 49 65   [14] 3518 	ld	iy,#_player + 10
   5AA2 FD 5E 00      [19] 3519 	ld	e, 0 (iy)
   5AA5 7B            [ 4] 3520 	ld	a,e
   5AA6 D6 03         [ 7] 3521 	sub	a, #0x03
   5AA8 D2 89 5B      [10] 3522 	jp	NC,00130$
   5AAB DD 6E 06      [19] 3523 	ld	l,6 (ix)
   5AAE DD 66 07      [19] 3524 	ld	h,7 (ix)
   5AB1 7E            [ 7] 3525 	ld	a,(hl)
   5AB2 B7            [ 4] 3526 	or	a, a
   5AB3 C2 89 5B      [10] 3527 	jp	NZ,00130$
                           3528 ;src/main.c:202: player.bullets += 1;
   5AB6 1C            [ 4] 3529 	inc	e
   5AB7 FD 73 00      [19] 3530 	ld	0 (iy), e
                           3531 ;src/main.c:203: *flecha = 1;
   5ABA 36 01         [10] 3532 	ld	(hl),#0x01
   5ABC C3 89 5B      [10] 3533 	jp	00130$
   5ABF                    3534 00113$:
                           3535 ;src/main.c:205: }else if(    scene[(player.y)/tileheight][(player.x)/tilewidth] == 9
   5ABF DD 7E F6      [19] 3536 	ld	a,-10 (ix)
   5AC2 D6 09         [ 7] 3537 	sub	a, #0x09
   5AC4 CA 6F 5B      [10] 3538 	jp	Z,00107$
                           3539 ;src/main.c:206: || scene[(player.y)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5AC7 DD 6E FB      [19] 3540 	ld	l,-5 (ix)
   5ACA DD 66 FC      [19] 3541 	ld	h,-4 (ix)
   5ACD DD 7E FD      [19] 3542 	ld	a,-3 (ix)
   5AD0 B7            [ 4] 3543 	or	a, a
   5AD1 28 02         [12] 3544 	jr	Z,00144$
   5AD3 E1            [10] 3545 	pop	hl
   5AD4 E5            [11] 3546 	push	hl
   5AD5                    3547 00144$:
   5AD5 CB 2C         [ 8] 3548 	sra	h
   5AD7 CB 1D         [ 8] 3549 	rr	l
   5AD9 CB 2C         [ 8] 3550 	sra	h
   5ADB CB 1D         [ 8] 3551 	rr	l
   5ADD DD 5E F4      [19] 3552 	ld	e,-12 (ix)
   5AE0 DD 56 F5      [19] 3553 	ld	d,-11 (ix)
   5AE3 19            [11] 3554 	add	hl,de
   5AE4 7E            [ 7] 3555 	ld	a,(hl)
   5AE5 D6 09         [ 7] 3556 	sub	a, #0x09
   5AE7 CA 6F 5B      [10] 3557 	jp	Z,00107$
                           3558 ;src/main.c:207: || scene[(player.y+tileheight-2)/tileheight][(player.x)/tilewidth] == 9
   5AEA 69            [ 4] 3559 	ld	l, c
   5AEB 60            [ 4] 3560 	ld	h, b
   5AEC DD 7E F8      [19] 3561 	ld	a,-8 (ix)
   5AEF B7            [ 4] 3562 	or	a, a
   5AF0 28 06         [12] 3563 	jr	Z,00145$
   5AF2 DD 6E F9      [19] 3564 	ld	l,-7 (ix)
   5AF5 DD 66 FA      [19] 3565 	ld	h,-6 (ix)
   5AF8                    3566 00145$:
   5AF8 CB 2C         [ 8] 3567 	sra	h
   5AFA CB 1D         [ 8] 3568 	rr	l
   5AFC CB 2C         [ 8] 3569 	sra	h
   5AFE CB 1D         [ 8] 3570 	rr	l
   5B00 CB 2C         [ 8] 3571 	sra	h
   5B02 CB 1D         [ 8] 3572 	rr	l
   5B04 CB 2C         [ 8] 3573 	sra	h
   5B06 CB 1D         [ 8] 3574 	rr	l
   5B08 5D            [ 4] 3575 	ld	e, l
   5B09 54            [ 4] 3576 	ld	d, h
   5B0A 29            [11] 3577 	add	hl, hl
   5B0B 29            [11] 3578 	add	hl, hl
   5B0C 19            [11] 3579 	add	hl, de
   5B0D 29            [11] 3580 	add	hl, hl
   5B0E 29            [11] 3581 	add	hl, hl
   5B0F 11 3C 64      [10] 3582 	ld	de,#_scene
   5B12 19            [11] 3583 	add	hl,de
   5B13 DD 5E F7      [19] 3584 	ld	e,-9 (ix)
   5B16 16 00         [ 7] 3585 	ld	d,#0x00
   5B18 19            [11] 3586 	add	hl,de
   5B19 7E            [ 7] 3587 	ld	a,(hl)
   5B1A D6 09         [ 7] 3588 	sub	a, #0x09
   5B1C 28 51         [12] 3589 	jr	Z,00107$
                           3590 ;src/main.c:208: || scene[(player.y+tileheight-2)/tileheight][(player.x+tilewidth-1)/tilewidth] == 9
   5B1E DD 7E F8      [19] 3591 	ld	a,-8 (ix)
   5B21 B7            [ 4] 3592 	or	a, a
   5B22 28 06         [12] 3593 	jr	Z,00146$
   5B24 DD 4E F9      [19] 3594 	ld	c,-7 (ix)
   5B27 DD 46 FA      [19] 3595 	ld	b,-6 (ix)
   5B2A                    3596 00146$:
   5B2A CB 28         [ 8] 3597 	sra	b
   5B2C CB 19         [ 8] 3598 	rr	c
   5B2E CB 28         [ 8] 3599 	sra	b
   5B30 CB 19         [ 8] 3600 	rr	c
   5B32 CB 28         [ 8] 3601 	sra	b
   5B34 CB 19         [ 8] 3602 	rr	c
   5B36 CB 28         [ 8] 3603 	sra	b
   5B38 CB 19         [ 8] 3604 	rr	c
   5B3A 69            [ 4] 3605 	ld	l, c
   5B3B 60            [ 4] 3606 	ld	h, b
   5B3C 29            [11] 3607 	add	hl, hl
   5B3D 29            [11] 3608 	add	hl, hl
   5B3E 09            [11] 3609 	add	hl, bc
   5B3F 29            [11] 3610 	add	hl, hl
   5B40 29            [11] 3611 	add	hl, hl
   5B41 3E 3C         [ 7] 3612 	ld	a,#<(_scene)
   5B43 85            [ 4] 3613 	add	a, l
   5B44 DD 77 F9      [19] 3614 	ld	-7 (ix),a
   5B47 3E 64         [ 7] 3615 	ld	a,#>(_scene)
   5B49 8C            [ 4] 3616 	adc	a, h
   5B4A DD 77 FA      [19] 3617 	ld	-6 (ix),a
   5B4D DD 6E FB      [19] 3618 	ld	l,-5 (ix)
   5B50 DD 66 FC      [19] 3619 	ld	h,-4 (ix)
   5B53 DD 7E FD      [19] 3620 	ld	a,-3 (ix)
   5B56 B7            [ 4] 3621 	or	a, a
   5B57 28 02         [12] 3622 	jr	Z,00147$
   5B59 E1            [10] 3623 	pop	hl
   5B5A E5            [11] 3624 	push	hl
   5B5B                    3625 00147$:
   5B5B CB 2C         [ 8] 3626 	sra	h
   5B5D CB 1D         [ 8] 3627 	rr	l
   5B5F CB 2C         [ 8] 3628 	sra	h
   5B61 CB 1D         [ 8] 3629 	rr	l
   5B63 DD 5E F9      [19] 3630 	ld	e,-7 (ix)
   5B66 DD 56 FA      [19] 3631 	ld	d,-6 (ix)
   5B69 19            [11] 3632 	add	hl,de
   5B6A 7E            [ 7] 3633 	ld	a,(hl)
   5B6B D6 09         [ 7] 3634 	sub	a, #0x09
   5B6D 20 1A         [12] 3635 	jr	NZ,00130$
   5B6F                    3636 00107$:
                           3637 ;src/main.c:211: cpct_clearScreen(0);
   5B6F 21 00 40      [10] 3638 	ld	hl,#0x4000
   5B72 E5            [11] 3639 	push	hl
   5B73 AF            [ 4] 3640 	xor	a, a
   5B74 F5            [11] 3641 	push	af
   5B75 33            [ 6] 3642 	inc	sp
   5B76 26 C0         [ 7] 3643 	ld	h, #0xC0
   5B78 E5            [11] 3644 	push	hl
   5B79 CD 11 63      [17] 3645 	call	_cpct_memset
                           3646 ;src/main.c:212: map+=1;
   5B7C 21 2E 65      [10] 3647 	ld	hl, #_map+0
   5B7F 34            [11] 3648 	inc	(hl)
                           3649 ;src/main.c:213: drawMap(map);
   5B80 3A 2E 65      [13] 3650 	ld	a,(_map)
   5B83 F5            [11] 3651 	push	af
   5B84 33            [ 6] 3652 	inc	sp
   5B85 CD C0 46      [17] 3653 	call	_drawMap
   5B88 33            [ 6] 3654 	inc	sp
   5B89                    3655 00130$:
   5B89 DD F9         [10] 3656 	ld	sp, ix
   5B8B DD E1         [14] 3657 	pop	ix
   5B8D C9            [10] 3658 	ret
                           3659 ;src/main.c:217: u8 checkArrowCollisions(){
                           3660 ;	---------------------------------
                           3661 ; Function checkArrowCollisions
                           3662 ; ---------------------------------
   5B8E                    3663 _checkArrowCollisions::
   5B8E DD E5         [15] 3664 	push	ix
   5B90 DD 21 00 00   [14] 3665 	ld	ix,#0
   5B94 DD 39         [15] 3666 	add	ix,sp
   5B96 21 F4 FF      [10] 3667 	ld	hl,#-12
   5B99 39            [11] 3668 	add	hl,sp
   5B9A F9            [ 6] 3669 	ld	sp,hl
                           3670 ;src/main.c:218: u8 bound =0;
   5B9B DD 36 F4 00   [19] 3671 	ld	-12 (ix),#0x00
                           3672 ;src/main.c:219: if(    scene[(object.y)/tileheight][(object.x)/tilewidth] == 1
   5B9F 3A 36 65      [13] 3673 	ld	a,(#(_object + 0x0001) + 0)
   5BA2 DD 77 FD      [19] 3674 	ld	-3 (ix), a
   5BA5 07            [ 4] 3675 	rlca
   5BA6 07            [ 4] 3676 	rlca
   5BA7 07            [ 4] 3677 	rlca
   5BA8 07            [ 4] 3678 	rlca
   5BA9 E6 0F         [ 7] 3679 	and	a,#0x0F
   5BAB 4F            [ 4] 3680 	ld	c,a
   5BAC 06 00         [ 7] 3681 	ld	b,#0x00
   5BAE 69            [ 4] 3682 	ld	l, c
   5BAF 60            [ 4] 3683 	ld	h, b
   5BB0 29            [11] 3684 	add	hl, hl
   5BB1 29            [11] 3685 	add	hl, hl
   5BB2 09            [11] 3686 	add	hl, bc
   5BB3 29            [11] 3687 	add	hl, hl
   5BB4 29            [11] 3688 	add	hl, hl
   5BB5 3E 3C         [ 7] 3689 	ld	a,#<(_scene)
   5BB7 85            [ 4] 3690 	add	a, l
   5BB8 DD 77 FE      [19] 3691 	ld	-2 (ix),a
   5BBB 3E 64         [ 7] 3692 	ld	a,#>(_scene)
   5BBD 8C            [ 4] 3693 	adc	a, h
   5BBE DD 77 FF      [19] 3694 	ld	-1 (ix),a
   5BC1 21 35 65      [10] 3695 	ld	hl, #_object + 0
   5BC4 4E            [ 7] 3696 	ld	c,(hl)
   5BC5 79            [ 4] 3697 	ld	a,c
   5BC6 0F            [ 4] 3698 	rrca
   5BC7 0F            [ 4] 3699 	rrca
   5BC8 E6 3F         [ 7] 3700 	and	a,#0x3F
   5BCA DD 77 FA      [19] 3701 	ld	-6 (ix),a
   5BCD DD 7E FE      [19] 3702 	ld	a,-2 (ix)
   5BD0 DD 86 FA      [19] 3703 	add	a, -6 (ix)
   5BD3 6F            [ 4] 3704 	ld	l,a
   5BD4 DD 7E FF      [19] 3705 	ld	a,-1 (ix)
   5BD7 CE 00         [ 7] 3706 	adc	a, #0x00
   5BD9 67            [ 4] 3707 	ld	h,a
   5BDA 7E            [ 7] 3708 	ld	a,(hl)
   5BDB 3D            [ 4] 3709 	dec	a
   5BDC CA D9 5C      [10] 3710 	jp	Z,00101$
                           3711 ;src/main.c:220: || scene[(object.y)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5BDF 06 00         [ 7] 3712 	ld	b,#0x00
   5BE1 21 03 00      [10] 3713 	ld	hl,#0x0003
   5BE4 09            [11] 3714 	add	hl,bc
   5BE5 DD 75 F8      [19] 3715 	ld	-8 (ix),l
   5BE8 DD 74 F9      [19] 3716 	ld	-7 (ix),h
   5BEB DD 7E F8      [19] 3717 	ld	a,-8 (ix)
   5BEE DD 77 FB      [19] 3718 	ld	-5 (ix),a
   5BF1 DD 7E F9      [19] 3719 	ld	a,-7 (ix)
   5BF4 DD 77 FC      [19] 3720 	ld	-4 (ix),a
   5BF7 DD 7E F9      [19] 3721 	ld	a,-7 (ix)
   5BFA 07            [ 4] 3722 	rlca
   5BFB E6 01         [ 7] 3723 	and	a,#0x01
   5BFD DD 77 F5      [19] 3724 	ld	-11 (ix),a
   5C00 21 06 00      [10] 3725 	ld	hl,#0x0006
   5C03 09            [11] 3726 	add	hl,bc
   5C04 DD 75 F6      [19] 3727 	ld	-10 (ix),l
   5C07 DD 74 F7      [19] 3728 	ld	-9 (ix),h
   5C0A DD 7E F5      [19] 3729 	ld	a,-11 (ix)
   5C0D B7            [ 4] 3730 	or	a, a
   5C0E 28 0C         [12] 3731 	jr	Z,00108$
   5C10 DD 7E F6      [19] 3732 	ld	a,-10 (ix)
   5C13 DD 77 FB      [19] 3733 	ld	-5 (ix),a
   5C16 DD 7E F7      [19] 3734 	ld	a,-9 (ix)
   5C19 DD 77 FC      [19] 3735 	ld	-4 (ix),a
   5C1C                    3736 00108$:
   5C1C DD 6E FB      [19] 3737 	ld	l,-5 (ix)
   5C1F DD 66 FC      [19] 3738 	ld	h,-4 (ix)
   5C22 CB 2C         [ 8] 3739 	sra	h
   5C24 CB 1D         [ 8] 3740 	rr	l
   5C26 CB 2C         [ 8] 3741 	sra	h
   5C28 CB 1D         [ 8] 3742 	rr	l
   5C2A DD 5E FE      [19] 3743 	ld	e,-2 (ix)
   5C2D DD 56 FF      [19] 3744 	ld	d,-1 (ix)
   5C30 19            [11] 3745 	add	hl,de
   5C31 7E            [ 7] 3746 	ld	a,(hl)
   5C32 3D            [ 4] 3747 	dec	a
   5C33 CA D9 5C      [10] 3748 	jp	Z,00101$
                           3749 ;src/main.c:221: || scene[(object.y+tileheight-2)/tileheight][(object.x)/tilewidth] == 1
   5C36 DD 5E FD      [19] 3750 	ld	e,-3 (ix)
   5C39 16 00         [ 7] 3751 	ld	d,#0x00
   5C3B 21 0E 00      [10] 3752 	ld	hl,#0x000E
   5C3E 19            [11] 3753 	add	hl,de
   5C3F 4D            [ 4] 3754 	ld	c,l
   5C40 44            [ 4] 3755 	ld	b,h
   5C41 69            [ 4] 3756 	ld	l, c
   5C42 78            [ 4] 3757 	ld	a,b
   5C43 67            [ 4] 3758 	ld	h,a
   5C44 07            [ 4] 3759 	rlca
   5C45 E6 01         [ 7] 3760 	and	a,#0x01
   5C47 DD 77 FB      [19] 3761 	ld	-5 (ix),a
   5C4A 7B            [ 4] 3762 	ld	a,e
   5C4B C6 1D         [ 7] 3763 	add	a, #0x1D
   5C4D DD 77 FE      [19] 3764 	ld	-2 (ix),a
   5C50 7A            [ 4] 3765 	ld	a,d
   5C51 CE 00         [ 7] 3766 	adc	a, #0x00
   5C53 DD 77 FF      [19] 3767 	ld	-1 (ix),a
   5C56 DD 7E FB      [19] 3768 	ld	a,-5 (ix)
   5C59 B7            [ 4] 3769 	or	a, a
   5C5A 28 06         [12] 3770 	jr	Z,00109$
   5C5C DD 6E FE      [19] 3771 	ld	l,-2 (ix)
   5C5F DD 66 FF      [19] 3772 	ld	h,-1 (ix)
   5C62                    3773 00109$:
   5C62 CB 2C         [ 8] 3774 	sra	h
   5C64 CB 1D         [ 8] 3775 	rr	l
   5C66 CB 2C         [ 8] 3776 	sra	h
   5C68 CB 1D         [ 8] 3777 	rr	l
   5C6A CB 2C         [ 8] 3778 	sra	h
   5C6C CB 1D         [ 8] 3779 	rr	l
   5C6E CB 2C         [ 8] 3780 	sra	h
   5C70 CB 1D         [ 8] 3781 	rr	l
   5C72 5D            [ 4] 3782 	ld	e, l
   5C73 54            [ 4] 3783 	ld	d, h
   5C74 29            [11] 3784 	add	hl, hl
   5C75 29            [11] 3785 	add	hl, hl
   5C76 19            [11] 3786 	add	hl, de
   5C77 29            [11] 3787 	add	hl, hl
   5C78 29            [11] 3788 	add	hl, hl
   5C79 11 3C 64      [10] 3789 	ld	de,#_scene
   5C7C 19            [11] 3790 	add	hl,de
   5C7D DD 5E FA      [19] 3791 	ld	e,-6 (ix)
   5C80 16 00         [ 7] 3792 	ld	d,#0x00
   5C82 19            [11] 3793 	add	hl,de
   5C83 7E            [ 7] 3794 	ld	a,(hl)
   5C84 3D            [ 4] 3795 	dec	a
   5C85 28 52         [12] 3796 	jr	Z,00101$
                           3797 ;src/main.c:222: || scene[(object.y+tileheight-2)/tileheight][(object.x+tilewidth-1)/tilewidth] == 1
   5C87 DD 7E FB      [19] 3798 	ld	a,-5 (ix)
   5C8A B7            [ 4] 3799 	or	a, a
   5C8B 28 06         [12] 3800 	jr	Z,00110$
   5C8D DD 4E FE      [19] 3801 	ld	c,-2 (ix)
   5C90 DD 46 FF      [19] 3802 	ld	b,-1 (ix)
   5C93                    3803 00110$:
   5C93 CB 28         [ 8] 3804 	sra	b
   5C95 CB 19         [ 8] 3805 	rr	c
   5C97 CB 28         [ 8] 3806 	sra	b
   5C99 CB 19         [ 8] 3807 	rr	c
   5C9B CB 28         [ 8] 3808 	sra	b
   5C9D CB 19         [ 8] 3809 	rr	c
   5C9F CB 28         [ 8] 3810 	sra	b
   5CA1 CB 19         [ 8] 3811 	rr	c
   5CA3 69            [ 4] 3812 	ld	l, c
   5CA4 60            [ 4] 3813 	ld	h, b
   5CA5 29            [11] 3814 	add	hl, hl
   5CA6 29            [11] 3815 	add	hl, hl
   5CA7 09            [11] 3816 	add	hl, bc
   5CA8 29            [11] 3817 	add	hl, hl
   5CA9 29            [11] 3818 	add	hl, hl
   5CAA 3E 3C         [ 7] 3819 	ld	a,#<(_scene)
   5CAC 85            [ 4] 3820 	add	a, l
   5CAD DD 77 FB      [19] 3821 	ld	-5 (ix),a
   5CB0 3E 64         [ 7] 3822 	ld	a,#>(_scene)
   5CB2 8C            [ 4] 3823 	adc	a, h
   5CB3 DD 77 FC      [19] 3824 	ld	-4 (ix),a
   5CB6 DD 6E F8      [19] 3825 	ld	l,-8 (ix)
   5CB9 DD 66 F9      [19] 3826 	ld	h,-7 (ix)
   5CBC DD 7E F5      [19] 3827 	ld	a,-11 (ix)
   5CBF B7            [ 4] 3828 	or	a, a
   5CC0 28 04         [12] 3829 	jr	Z,00111$
   5CC2 C1            [10] 3830 	pop	bc
   5CC3 E1            [10] 3831 	pop	hl
   5CC4 E5            [11] 3832 	push	hl
   5CC5 C5            [11] 3833 	push	bc
   5CC6                    3834 00111$:
   5CC6 CB 2C         [ 8] 3835 	sra	h
   5CC8 CB 1D         [ 8] 3836 	rr	l
   5CCA CB 2C         [ 8] 3837 	sra	h
   5CCC CB 1D         [ 8] 3838 	rr	l
   5CCE DD 5E FB      [19] 3839 	ld	e,-5 (ix)
   5CD1 DD 56 FC      [19] 3840 	ld	d,-4 (ix)
   5CD4 19            [11] 3841 	add	hl,de
   5CD5 7E            [ 7] 3842 	ld	a,(hl)
   5CD6 3D            [ 4] 3843 	dec	a
   5CD7 20 10         [12] 3844 	jr	NZ,00102$
   5CD9                    3845 00101$:
                           3846 ;src/main.c:224: object.x=object.lx;
   5CD9 3A 37 65      [13] 3847 	ld	a, (#_object + 2)
   5CDC 32 35 65      [13] 3848 	ld	(#_object),a
                           3849 ;src/main.c:225: object.y=object.ly;
   5CDF 3A 38 65      [13] 3850 	ld	a, (#_object + 3)
   5CE2 32 36 65      [13] 3851 	ld	(#(_object + 0x0001)),a
                           3852 ;src/main.c:226: bound = 1;
   5CE5 DD 36 F4 01   [19] 3853 	ld	-12 (ix),#0x01
   5CE9                    3854 00102$:
                           3855 ;src/main.c:229: return bound;
   5CE9 DD 6E F4      [19] 3856 	ld	l,-12 (ix)
   5CEC DD F9         [10] 3857 	ld	sp, ix
   5CEE DD E1         [14] 3858 	pop	ix
   5CF0 C9            [10] 3859 	ret
                           3860 ;src/main.c:238: void game(){
                           3861 ;	---------------------------------
                           3862 ; Function game
                           3863 ; ---------------------------------
   5CF1                    3864 _game::
   5CF1 DD E5         [15] 3865 	push	ix
   5CF3 DD 21 00 00   [14] 3866 	ld	ix,#0
   5CF7 DD 39         [15] 3867 	add	ix,sp
   5CF9 21 F5 FF      [10] 3868 	ld	hl,#-11
   5CFC 39            [11] 3869 	add	hl,sp
   5CFD F9            [ 6] 3870 	ld	sp,hl
                           3871 ;src/main.c:239: TNivel n = {0,0,0};
   5CFE 21 00 00      [10] 3872 	ld	hl,#0x0000
   5D01 39            [11] 3873 	add	hl,sp
   5D02 36 00         [10] 3874 	ld	(hl),#0x00
   5D04 21 00 00      [10] 3875 	ld	hl,#0x0000
   5D07 39            [11] 3876 	add	hl,sp
   5D08 5D            [ 4] 3877 	ld	e, l
   5D09 54            [ 4] 3878 	ld	d, h
   5D0A 23            [ 6] 3879 	inc	hl
   5D0B DD 75 FE      [19] 3880 	ld	-2 (ix),l
   5D0E DD 74 FF      [19] 3881 	ld	-1 (ix),h
   5D11 DD 6E FE      [19] 3882 	ld	l,-2 (ix)
   5D14 DD 66 FF      [19] 3883 	ld	h,-1 (ix)
   5D17 36 00         [10] 3884 	ld	(hl),#0x00
   5D19 13            [ 6] 3885 	inc	de
   5D1A 13            [ 6] 3886 	inc	de
   5D1B DD 73 FA      [19] 3887 	ld	-6 (ix),e
   5D1E DD 72 FB      [19] 3888 	ld	-5 (ix),d
   5D21 DD 6E FA      [19] 3889 	ld	l,-6 (ix)
   5D24 DD 66 FB      [19] 3890 	ld	h,-5 (ix)
   5D27 36 00         [10] 3891 	ld	(hl),#0x00
                           3892 ;src/main.c:240: bound =0;
   5D29 21 33 65      [10] 3893 	ld	hl,#_bound + 0
   5D2C 36 00         [10] 3894 	ld	(hl), #0x00
                           3895 ;src/main.c:241: temp = 0;
   5D2E 21 00 00      [10] 3896 	ld	hl,#0x0000
   5D31 22 2C 65      [16] 3897 	ld	(_temp),hl
                           3898 ;src/main.c:242: map = 1;
   5D34 21 2E 65      [10] 3899 	ld	hl,#_map + 0
   5D37 36 01         [10] 3900 	ld	(hl), #0x01
                           3901 ;src/main.c:243: arrow =0;
   5D39 21 31 65      [10] 3902 	ld	hl,#_arrow + 0
   5D3C 36 00         [10] 3903 	ld	(hl), #0x00
                           3904 ;src/main.c:244: finish =0;
   5D3E 21 30 65      [10] 3905 	ld	hl,#_finish + 0
   5D41 36 00         [10] 3906 	ld	(hl), #0x00
                           3907 ;src/main.c:245: following =0;
   5D43 21 32 65      [10] 3908 	ld	hl,#_following + 0
   5D46 36 00         [10] 3909 	ld	(hl), #0x00
                           3910 ;src/main.c:246: archer = 0;
   5D48 21 34 65      [10] 3911 	ld	hl,#_archer + 0
   5D4B 36 00         [10] 3912 	ld	(hl), #0x00
                           3913 ;src/main.c:248: initPlayer();
   5D4D CD AB 52      [17] 3914 	call	_initPlayer
                           3915 ;src/main.c:249: initEnemies();
   5D50 CD E1 52      [17] 3916 	call	_initEnemies
                           3917 ;src/main.c:251: cpct_clearScreen(0);
   5D53 21 00 40      [10] 3918 	ld	hl,#0x4000
   5D56 E5            [11] 3919 	push	hl
   5D57 AF            [ 4] 3920 	xor	a, a
   5D58 F5            [11] 3921 	push	af
   5D59 33            [ 6] 3922 	inc	sp
   5D5A 26 C0         [ 7] 3923 	ld	h, #0xC0
   5D5C E5            [11] 3924 	push	hl
   5D5D CD 11 63      [17] 3925 	call	_cpct_memset
                           3926 ;src/main.c:252: drawMap(map);
   5D60 3A 2E 65      [13] 3927 	ld	a,(_map)
   5D63 F5            [11] 3928 	push	af
   5D64 33            [ 6] 3929 	inc	sp
   5D65 CD C0 46      [17] 3930 	call	_drawMap
   5D68 33            [ 6] 3931 	inc	sp
                           3932 ;src/main.c:256: while (1){
   5D69 DD 7E FA      [19] 3933 	ld	a,-6 (ix)
   5D6C DD 77 F8      [19] 3934 	ld	-8 (ix),a
   5D6F DD 7E FB      [19] 3935 	ld	a,-5 (ix)
   5D72 DD 77 F9      [19] 3936 	ld	-7 (ix),a
   5D75 DD 7E FE      [19] 3937 	ld	a,-2 (ix)
   5D78 DD 77 FC      [19] 3938 	ld	-4 (ix),a
   5D7B DD 7E FF      [19] 3939 	ld	a,-1 (ix)
   5D7E DD 77 FD      [19] 3940 	ld	-3 (ix),a
   5D81                    3941 00112$:
                           3942 ;src/main.c:259: cpct_waitVSYNC();
   5D81 CD F7 62      [17] 3943 	call	_cpct_waitVSYNC
                           3944 ;src/main.c:262: erases();
   5D84 CD 20 4C      [17] 3945 	call	_erases
                           3946 ;src/main.c:265: drawPickUps(n.corazon,n.bullet);
   5D87 DD 6E FA      [19] 3947 	ld	l,-6 (ix)
   5D8A DD 66 FB      [19] 3948 	ld	h,-5 (ix)
   5D8D 46            [ 7] 3949 	ld	b,(hl)
   5D8E DD 6E FE      [19] 3950 	ld	l,-2 (ix)
   5D91 DD 66 FF      [19] 3951 	ld	h,-1 (ix)
   5D94 4E            [ 7] 3952 	ld	c, (hl)
   5D95 C5            [11] 3953 	push	bc
   5D96 CD AB 4D      [17] 3954 	call	_drawPickUps
   5D99 F1            [10] 3955 	pop	af
                           3956 ;src/main.c:268: draws();
   5D9A CD 83 4B      [17] 3957 	call	_draws
                           3958 ;src/main.c:271: drawVida(player.life);
   5D9D 3A 45 65      [13] 3959 	ld	a, (#_player + 6)
   5DA0 F5            [11] 3960 	push	af
   5DA1 33            [ 6] 3961 	inc	sp
   5DA2 CD 13 4E      [17] 3962 	call	_drawVida
   5DA5 33            [ 6] 3963 	inc	sp
                           3964 ;src/main.c:272: drawBullets(player.bullets);
   5DA6 3A 49 65      [13] 3965 	ld	a, (#_player + 10)
   5DA9 F5            [11] 3966 	push	af
   5DAA 33            [ 6] 3967 	inc	sp
   5DAB CD 7D 4E      [17] 3968 	call	_drawBullets
   5DAE 33            [ 6] 3969 	inc	sp
                           3970 ;src/main.c:275: if(player.atk < 20) drawFatiga(player.atk,2);
   5DAF 21 47 65      [10] 3971 	ld	hl, #(_player + 0x0008) + 0
   5DB2 56            [ 7] 3972 	ld	d,(hl)
   5DB3 7A            [ 4] 3973 	ld	a,d
   5DB4 D6 14         [ 7] 3974 	sub	a, #0x14
   5DB6 30 0C         [12] 3975 	jr	NC,00105$
   5DB8 3E 02         [ 7] 3976 	ld	a,#0x02
   5DBA F5            [11] 3977 	push	af
   5DBB 33            [ 6] 3978 	inc	sp
   5DBC D5            [11] 3979 	push	de
   5DBD 33            [ 6] 3980 	inc	sp
   5DBE CD 85 4C      [17] 3981 	call	_drawFatiga
   5DC1 F1            [10] 3982 	pop	af
   5DC2 18 1A         [12] 3983 	jr	00106$
   5DC4                    3984 00105$:
                           3985 ;src/main.c:276: else if(player.atk > 20) drawFatiga(player.atk,1);
   5DC4 3E 14         [ 7] 3986 	ld	a,#0x14
   5DC6 92            [ 4] 3987 	sub	a, d
   5DC7 30 0C         [12] 3988 	jr	NC,00102$
   5DC9 3E 01         [ 7] 3989 	ld	a,#0x01
   5DCB F5            [11] 3990 	push	af
   5DCC 33            [ 6] 3991 	inc	sp
   5DCD D5            [11] 3992 	push	de
   5DCE 33            [ 6] 3993 	inc	sp
   5DCF CD 85 4C      [17] 3994 	call	_drawFatiga
   5DD2 F1            [10] 3995 	pop	af
   5DD3 18 09         [12] 3996 	jr	00106$
   5DD5                    3997 00102$:
                           3998 ;src/main.c:277: else drawFatiga(player.atk,0);
   5DD5 AF            [ 4] 3999 	xor	a, a
   5DD6 F5            [11] 4000 	push	af
   5DD7 33            [ 6] 4001 	inc	sp
   5DD8 D5            [11] 4002 	push	de
   5DD9 33            [ 6] 4003 	inc	sp
   5DDA CD 85 4C      [17] 4004 	call	_drawFatiga
   5DDD F1            [10] 4005 	pop	af
   5DDE                    4006 00106$:
                           4007 ;src/main.c:280: player.lx = player.x;
   5DDE 3A 3F 65      [13] 4008 	ld	a, (#_player + 0)
   5DE1 21 41 65      [10] 4009 	ld	hl,#(_player + 0x0002)
   5DE4 77            [ 7] 4010 	ld	(hl),a
                           4011 ;src/main.c:281: player.ly = player.y;
   5DE5 3A 40 65      [13] 4012 	ld	a, (#_player + 1)
   5DE8 21 42 65      [10] 4013 	ld	hl,#(_player + 0x0003)
   5DEB 77            [ 7] 4014 	ld	(hl),a
                           4015 ;src/main.c:282: player.latk = player.atk;
   5DEC 3A 47 65      [13] 4016 	ld	a, (#(_player + 0x0008) + 0)
   5DEF 32 48 65      [13] 4017 	ld	(#(_player + 0x0009)),a
                           4018 ;src/main.c:285: cpct_scanKeyboard_f();
   5DF2 CD 5E 61      [17] 4019 	call	_cpct_scanKeyboard_f
                           4020 ;src/main.c:286: player.sprite = checkKeyboard();
   5DF5 CD E0 4F      [17] 4021 	call	_checkKeyboard
   5DF8 5D            [ 4] 4022 	ld	e,l
   5DF9 54            [ 4] 4023 	ld	d,h
   5DFA ED 53 43 65   [20] 4024 	ld	((_player + 0x0004)), de
                           4025 ;src/main.c:287: checkBoundsCollisions(&n.corazon,&n.bullet);
   5DFE DD 5E F8      [19] 4026 	ld	e,-8 (ix)
   5E01 DD 56 F9      [19] 4027 	ld	d,-7 (ix)
   5E04 DD 6E FC      [19] 4028 	ld	l,-4 (ix)
   5E07 DD 66 FD      [19] 4029 	ld	h,-3 (ix)
   5E0A D5            [11] 4030 	push	de
   5E0B E5            [11] 4031 	push	hl
   5E0C CD BD 57      [17] 4032 	call	_checkBoundsCollisions
   5E0F F1            [10] 4033 	pop	af
   5E10 F1            [10] 4034 	pop	af
                           4035 ;src/main.c:289: if(arrow == 1){
   5E11 3A 31 65      [13] 4036 	ld	a,(#_arrow + 0)
   5E14 3D            [ 4] 4037 	dec	a
   5E15 20 0D         [12] 4038 	jr	NZ,00108$
                           4039 ;src/main.c:290: moveObject();
   5E17 CD 51 52      [17] 4040 	call	_moveObject
                           4041 ;src/main.c:291: bound = checkArrowCollisions();
   5E1A CD 8E 5B      [17] 4042 	call	_checkArrowCollisions
   5E1D FD 21 33 65   [14] 4043 	ld	iy,#_bound
   5E21 FD 75 00      [19] 4044 	ld	0 (iy),l
   5E24                    4045 00108$:
                           4046 ;src/main.c:296: if(finish == 1) return;
   5E24 3A 30 65      [13] 4047 	ld	a,(#_finish + 0)
   5E27 3D            [ 4] 4048 	dec	a
   5E28 C2 81 5D      [10] 4049 	jp	NZ,00112$
   5E2B DD F9         [10] 4050 	ld	sp, ix
   5E2D DD E1         [14] 4051 	pop	ix
   5E2F C9            [10] 4052 	ret
                           4053 ;src/main.c:303: void credits(){
                           4054 ;	---------------------------------
                           4055 ; Function credits
                           4056 ; ---------------------------------
   5E30                    4057 _credits::
                           4058 ;src/main.c:305: cpct_clearScreen(0);
   5E30 21 00 40      [10] 4059 	ld	hl,#0x4000
   5E33 E5            [11] 4060 	push	hl
   5E34 AF            [ 4] 4061 	xor	a, a
   5E35 F5            [11] 4062 	push	af
   5E36 33            [ 6] 4063 	inc	sp
   5E37 26 C0         [ 7] 4064 	ld	h, #0xC0
   5E39 E5            [11] 4065 	push	hl
   5E3A CD 11 63      [17] 4066 	call	_cpct_memset
                           4067 ;src/main.c:306: memptr = cpct_getScreenPtr(VMEM,10,10);
   5E3D 21 0A 0A      [10] 4068 	ld	hl,#0x0A0A
   5E40 E5            [11] 4069 	push	hl
   5E41 21 00 C0      [10] 4070 	ld	hl,#0xC000
   5E44 E5            [11] 4071 	push	hl
   5E45 CD EB 63      [17] 4072 	call	_cpct_getScreenPtr
                           4073 ;src/main.c:307: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   5E48 EB            [ 4] 4074 	ex	de,hl
   5E49 01 68 5E      [10] 4075 	ld	bc,#___str_5+0
   5E4C 21 01 00      [10] 4076 	ld	hl,#0x0001
   5E4F E5            [11] 4077 	push	hl
   5E50 D5            [11] 4078 	push	de
   5E51 C5            [11] 4079 	push	bc
   5E52 CD C8 61      [17] 4080 	call	_cpct_drawStringM0
   5E55 21 06 00      [10] 4081 	ld	hl,#6
   5E58 39            [11] 4082 	add	hl,sp
   5E59 F9            [ 6] 4083 	ld	sp,hl
                           4084 ;src/main.c:309: while (1){
   5E5A                    4085 00104$:
                           4086 ;src/main.c:311: cpct_scanKeyboard_f();
   5E5A CD 5E 61      [17] 4087 	call	_cpct_scanKeyboard_f
                           4088 ;src/main.c:315: if(cpct_isKeyPressed(Key_Esc)) {
   5E5D 21 08 04      [10] 4089 	ld	hl,#0x0408
   5E60 CD 52 61      [17] 4090 	call	_cpct_isKeyPressed
   5E63 7D            [ 4] 4091 	ld	a,l
   5E64 B7            [ 4] 4092 	or	a, a
   5E65 28 F3         [12] 4093 	jr	Z,00104$
                           4094 ;src/main.c:317: return;
   5E67 C9            [10] 4095 	ret
   5E68                    4096 ___str_5:
   5E68 4C 6F 75 6E 67 65  4097 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5E78 00                 4098 	.db 0x00
                           4099 ;src/main.c:327: void main(void) {
                           4100 ;	---------------------------------
                           4101 ; Function main
                           4102 ; ---------------------------------
   5E79                    4103 _main::
                           4104 ;src/main.c:331: init();
   5E79 CD 86 52      [17] 4105 	call	_init
                           4106 ;src/main.c:334: while(1){
   5E7C                    4107 00106$:
                           4108 ;src/main.c:335: x=menu();
   5E7C CD 57 53      [17] 4109 	call	_menu
   5E7F 5D            [ 4] 4110 	ld	e, l
   5E80 54            [ 4] 4111 	ld	d, h
                           4112 ;src/main.c:336: switch(x){
   5E81 CB 7A         [ 8] 4113 	bit	7, d
   5E83 20 F7         [12] 4114 	jr	NZ,00106$
   5E85 3E 02         [ 7] 4115 	ld	a,#0x02
   5E87 BB            [ 4] 4116 	cp	a, e
   5E88 3E 00         [ 7] 4117 	ld	a,#0x00
   5E8A 9A            [ 4] 4118 	sbc	a, d
   5E8B E2 90 5E      [10] 4119 	jp	PO, 00122$
   5E8E EE 80         [ 7] 4120 	xor	a, #0x80
   5E90                    4121 00122$:
   5E90 FA 7C 5E      [10] 4122 	jp	M,00106$
   5E93 16 00         [ 7] 4123 	ld	d,#0x00
   5E95 21 9B 5E      [10] 4124 	ld	hl,#00123$
   5E98 19            [11] 4125 	add	hl,de
   5E99 19            [11] 4126 	add	hl,de
                           4127 ;src/main.c:337: case 0: return;break;
                           4128 ;src/main.c:338: case 1: game(); break;
   5E9A E9            [ 4] 4129 	jp	(hl)
   5E9B                    4130 00123$:
   5E9B 18 10         [12] 4131 	jr	00108$
   5E9D 18 04         [12] 4132 	jr	00102$
   5E9F 18 07         [12] 4133 	jr	00103$
   5EA1 18 0A         [12] 4134 	jr	00108$
   5EA3                    4135 00102$:
   5EA3 CD F1 5C      [17] 4136 	call	_game
   5EA6 18 D4         [12] 4137 	jr	00106$
                           4138 ;src/main.c:339: case 2: credits();break;
   5EA8                    4139 00103$:
   5EA8 CD 30 5E      [17] 4140 	call	_credits
                           4141 ;src/main.c:340: }
   5EAB 18 CF         [12] 4142 	jr	00106$
   5EAD                    4143 00108$:
   5EAD C9            [10] 4144 	ret
                           4145 	.area _CODE
                           4146 	.area _INITIALIZER
                           4147 	.area _CABS (ABS)
