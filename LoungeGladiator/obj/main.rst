                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct  6 17:18:25 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _game
                             14 	.globl _drawVida
                             15 	.globl _drawFatiga
                             16 	.globl _checkSpriteFlecha
                             17 	.globl _checkSprite
                             18 	.globl _checkCollisions
                             19 	.globl _menu
                             20 	.globl _init
                             21 	.globl _cpct_getScreenPtr
                             22 	.globl _cpct_setPalette
                             23 	.globl _cpct_fw2hw
                             24 	.globl _cpct_waitVSYNC
                             25 	.globl _cpct_setVideoMode
                             26 	.globl _cpct_drawStringM0
                             27 	.globl _cpct_drawSolidBox
                             28 	.globl _cpct_drawSpriteMasked
                             29 	.globl _cpct_isKeyPressed
                             30 	.globl _cpct_scanKeyboard_f
                             31 	.globl _cpct_memset
                             32 	.globl _cpct_disableFirmware
                             33 	.globl _g_palette
                             34 ;--------------------------------------------------------
                             35 ; special function registers
                             36 ;--------------------------------------------------------
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DATA
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/main.c:49: void init(){
                             66 ;	---------------------------------
                             67 ; Function init
                             68 ; ---------------------------------
   43C4                      69 _init::
                             70 ;src/main.c:50: cpct_disableFirmware();
   43C4 CD 0B 56      [17]   71 	call	_cpct_disableFirmware
                             72 ;src/main.c:51: cpct_setVideoMode(0);
   43C7 AF            [ 4]   73 	xor	a, a
   43C8 F5            [11]   74 	push	af
   43C9 33            [ 6]   75 	inc	sp
   43CA CD E8 55      [17]   76 	call	_cpct_setVideoMode
   43CD 33            [ 6]   77 	inc	sp
                             78 ;src/main.c:52: cpct_fw2hw(g_palette,4);
   43CE 11 E9 43      [10]   79 	ld	de,#_g_palette
   43D1 3E 04         [ 7]   80 	ld	a,#0x04
   43D3 F5            [11]   81 	push	af
   43D4 33            [ 6]   82 	inc	sp
   43D5 D5            [11]   83 	push	de
   43D6 CD 72 55      [17]   84 	call	_cpct_fw2hw
   43D9 F1            [10]   85 	pop	af
   43DA 33            [ 6]   86 	inc	sp
                             87 ;src/main.c:53: cpct_setPalette(g_palette,4);
   43DB 11 E9 43      [10]   88 	ld	de,#_g_palette
   43DE 3E 04         [ 7]   89 	ld	a,#0x04
   43E0 F5            [11]   90 	push	af
   43E1 33            [ 6]   91 	inc	sp
   43E2 D5            [11]   92 	push	de
   43E3 CD 17 54      [17]   93 	call	_cpct_setPalette
   43E6 F1            [10]   94 	pop	af
   43E7 33            [ 6]   95 	inc	sp
   43E8 C9            [10]   96 	ret
   43E9                      97 _g_palette:
   43E9 00                   98 	.db #0x00	; 0
   43EA 1A                   99 	.db #0x1A	; 26
   43EB 06                  100 	.db #0x06	; 6
   43EC 12                  101 	.db #0x12	; 18
                            102 ;src/main.c:57: void menu(){
                            103 ;	---------------------------------
                            104 ; Function menu
                            105 ; ---------------------------------
   43ED                     106 _menu::
                            107 ;src/main.c:59: cpct_clearScreen(0);
   43ED 21 00 40      [10]  108 	ld	hl,#0x4000
   43F0 E5            [11]  109 	push	hl
   43F1 AF            [ 4]  110 	xor	a, a
   43F2 F5            [11]  111 	push	af
   43F3 33            [ 6]  112 	inc	sp
   43F4 26 C0         [ 7]  113 	ld	h, #0xC0
   43F6 E5            [11]  114 	push	hl
   43F7 CD FA 55      [17]  115 	call	_cpct_memset
                            116 ;src/main.c:61: memptr = cpct_getScreenPtr(VMEM,20,10);
   43FA 21 14 0A      [10]  117 	ld	hl,#0x0A14
   43FD E5            [11]  118 	push	hl
   43FE 21 00 C0      [10]  119 	ld	hl,#0xC000
   4401 E5            [11]  120 	push	hl
   4402 CD D4 56      [17]  121 	call	_cpct_getScreenPtr
                            122 ;src/main.c:62: cpct_drawStringM0("Super Menu",memptr,2,3);
   4405 EB            [ 4]  123 	ex	de,hl
   4406 01 42 44      [10]  124 	ld	bc,#___str_0+0
   4409 21 02 03      [10]  125 	ld	hl,#0x0302
   440C E5            [11]  126 	push	hl
   440D D5            [11]  127 	push	de
   440E C5            [11]  128 	push	bc
   440F CD B1 54      [17]  129 	call	_cpct_drawStringM0
   4412 21 06 00      [10]  130 	ld	hl,#6
   4415 39            [11]  131 	add	hl,sp
   4416 F9            [ 6]  132 	ld	sp,hl
                            133 ;src/main.c:64: memptr = cpct_getScreenPtr(VMEM,18,180);
   4417 21 12 B4      [10]  134 	ld	hl,#0xB412
   441A E5            [11]  135 	push	hl
   441B 21 00 C0      [10]  136 	ld	hl,#0xC000
   441E E5            [11]  137 	push	hl
   441F CD D4 56      [17]  138 	call	_cpct_getScreenPtr
                            139 ;src/main.c:65: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   4422 EB            [ 4]  140 	ex	de,hl
   4423 01 4D 44      [10]  141 	ld	bc,#___str_1+0
   4426 21 04 05      [10]  142 	ld	hl,#0x0504
   4429 E5            [11]  143 	push	hl
   442A D5            [11]  144 	push	de
   442B C5            [11]  145 	push	bc
   442C CD B1 54      [17]  146 	call	_cpct_drawStringM0
   442F 21 06 00      [10]  147 	ld	hl,#6
   4432 39            [11]  148 	add	hl,sp
   4433 F9            [ 6]  149 	ld	sp,hl
                            150 ;src/main.c:67: do{
   4434                     151 00101$:
                            152 ;src/main.c:68: cpct_scanKeyboard_f();
   4434 CD 47 54      [17]  153 	call	_cpct_scanKeyboard_f
                            154 ;src/main.c:69: }while(!cpct_isKeyPressed(Key_Enter));
   4437 21 00 40      [10]  155 	ld	hl,#0x4000
   443A CD 3B 54      [17]  156 	call	_cpct_isKeyPressed
   443D 7D            [ 4]  157 	ld	a,l
   443E B7            [ 4]  158 	or	a, a
   443F 28 F3         [12]  159 	jr	Z,00101$
   4441 C9            [10]  160 	ret
   4442                     161 ___str_0:
   4442 53 75 70 65 72 20   162 	.ascii "Super Menu"
        4D 65 6E 75
   444C 00                  163 	.db 0x00
   444D                     164 ___str_1:
   444D 50 75 6C 73 61 20   165 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4458 00                  166 	.db 0x00
                            167 ;src/main.c:74: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk, u8 mode){
                            168 ;	---------------------------------
                            169 ; Function checkCollisions
                            170 ; ---------------------------------
   4459                     171 _checkCollisions::
   4459 DD E5         [15]  172 	push	ix
   445B DD 21 00 00   [14]  173 	ld	ix,#0
   445F DD 39         [15]  174 	add	ix,sp
   4461 21 FA FF      [10]  175 	ld	hl,#-6
   4464 39            [11]  176 	add	hl,sp
   4465 F9            [ 6]  177 	ld	sp,hl
                            178 ;src/main.c:75: u8 popX = pX + 4;
   4466 DD 6E 04      [19]  179 	ld	l,4 (ix)
   4469 2C            [ 4]  180 	inc	l
   446A 2C            [ 4]  181 	inc	l
   446B 2C            [ 4]  182 	inc	l
   446C 2C            [ 4]  183 	inc	l
                            184 ;src/main.c:76: u8 popY = pY + 16;
   446D DD 7E 05      [19]  185 	ld	a,5 (ix)
   4470 C6 10         [ 7]  186 	add	a, #0x10
   4472 DD 77 FB      [19]  187 	ld	-5 (ix),a
                            188 ;src/main.c:77: u8 eopX = eX + 4;
   4475 DD 4E 06      [19]  189 	ld	c,6 (ix)
   4478 0C            [ 4]  190 	inc	c
   4479 0C            [ 4]  191 	inc	c
   447A 0C            [ 4]  192 	inc	c
   447B 0C            [ 4]  193 	inc	c
                            194 ;src/main.c:78: u8 eopY = eY + 16;
   447C DD 7E 07      [19]  195 	ld	a,7 (ix)
   447F C6 10         [ 7]  196 	add	a, #0x10
   4481 DD 77 FA      [19]  197 	ld	-6 (ix),a
                            198 ;src/main.c:80: if(atk >= 21 && mode == 0){
   4484 DD 7E 0A      [19]  199 	ld	a,10 (ix)
   4487 D6 15         [ 7]  200 	sub	a, #0x15
   4489 DD 7E 0B      [19]  201 	ld	a,11 (ix)
   448C DE 00         [ 7]  202 	sbc	a, #0x00
   448E 3E 00         [ 7]  203 	ld	a,#0x00
   4490 17            [ 4]  204 	rla
   4491 5F            [ 4]  205 	ld	e,a
   4492 B7            [ 4]  206 	or	a, a
   4493 20 08         [12]  207 	jr	NZ,00102$
   4495 DD 7E 0C      [19]  208 	ld	a,12 (ix)
   4498 B7            [ 4]  209 	or	a, a
   4499 20 02         [12]  210 	jr	NZ,00102$
                            211 ;src/main.c:81: popX += 2;
   449B 2C            [ 4]  212 	inc	l
   449C 2C            [ 4]  213 	inc	l
   449D                     214 00102$:
                            215 ;src/main.c:84: if(eopX >= pX && eopX <= popX && eY >= pY && eY <= popY)
   449D 79            [ 4]  216 	ld	a,c
   449E DD 96 04      [19]  217 	sub	a, 4 (ix)
   44A1 3E 00         [ 7]  218 	ld	a,#0x00
   44A3 17            [ 4]  219 	rla
   44A4 DD 77 FF      [19]  220 	ld	-1 (ix),a
   44A7 7D            [ 4]  221 	ld	a,l
   44A8 91            [ 4]  222 	sub	a, c
   44A9 3E 00         [ 7]  223 	ld	a,#0x00
   44AB 17            [ 4]  224 	rla
   44AC DD 77 FE      [19]  225 	ld	-2 (ix),a
   44AF DD 7E 07      [19]  226 	ld	a,7 (ix)
   44B2 DD 96 05      [19]  227 	sub	a, 5 (ix)
   44B5 3E 00         [ 7]  228 	ld	a,#0x00
   44B7 17            [ 4]  229 	rla
   44B8 DD 77 FD      [19]  230 	ld	-3 (ix),a
   44BB DD 7E FB      [19]  231 	ld	a,-5 (ix)
   44BE DD 96 07      [19]  232 	sub	a, 7 (ix)
   44C1 3E 00         [ 7]  233 	ld	a,#0x00
   44C3 17            [ 4]  234 	rla
   44C4 4F            [ 4]  235 	ld	c,a
   44C5 DD 7E FF      [19]  236 	ld	a,-1 (ix)
   44C8 B7            [ 4]  237 	or	a, a
   44C9 20 1E         [12]  238 	jr	NZ,00108$
   44CB DD 7E FE      [19]  239 	ld	a,-2 (ix)
   44CE B7            [ 4]  240 	or	a, a
   44CF 20 18         [12]  241 	jr	NZ,00108$
   44D1 DD 7E FD      [19]  242 	ld	a,-3 (ix)
   44D4 B7            [ 4]  243 	or	a,a
   44D5 20 12         [12]  244 	jr	NZ,00108$
                            245 ;src/main.c:85: if(atk >= 21)
   44D7 B1            [ 4]  246 	or	a,c
   44D8 20 0F         [12]  247 	jr	NZ,00108$
   44DA B3            [ 4]  248 	or	a,e
   44DB 20 06         [12]  249 	jr	NZ,00105$
                            250 ;src/main.c:86: return 1;
   44DD 21 01 00      [10]  251 	ld	hl,#0x0001
   44E0 C3 6E 45      [10]  252 	jp	00136$
   44E3                     253 00105$:
                            254 ;src/main.c:88: return 2;
   44E3 21 02 00      [10]  255 	ld	hl,#0x0002
   44E6 C3 6E 45      [10]  256 	jp	00136$
   44E9                     257 00108$:
                            258 ;src/main.c:90: if(eX >= pX && eX <= popX && eY >= pY && eY <= popY)
   44E9 DD 7E 06      [19]  259 	ld	a,6 (ix)
   44EC DD 96 04      [19]  260 	sub	a, 4 (ix)
   44EF 3E 00         [ 7]  261 	ld	a,#0x00
   44F1 17            [ 4]  262 	rla
   44F2 DD 77 FC      [19]  263 	ld	-4 (ix),a
   44F5 7D            [ 4]  264 	ld	a,l
   44F6 DD 96 06      [19]  265 	sub	a, 6 (ix)
   44F9 3E 00         [ 7]  266 	ld	a,#0x00
   44FB 17            [ 4]  267 	rla
   44FC 6F            [ 4]  268 	ld	l,a
   44FD DD 7E FC      [19]  269 	ld	a,-4 (ix)
   4500 B7            [ 4]  270 	or	a,a
   4501 20 19         [12]  271 	jr	NZ,00116$
   4503 B5            [ 4]  272 	or	a,l
   4504 20 16         [12]  273 	jr	NZ,00116$
   4506 DD 7E FD      [19]  274 	ld	a,-3 (ix)
   4509 B7            [ 4]  275 	or	a,a
   450A 20 10         [12]  276 	jr	NZ,00116$
                            277 ;src/main.c:91: if(atk >= 21)
   450C B1            [ 4]  278 	or	a,c
   450D 20 0D         [12]  279 	jr	NZ,00116$
   450F B3            [ 4]  280 	or	a,e
   4510 20 05         [12]  281 	jr	NZ,00113$
                            282 ;src/main.c:92: return 1;
   4512 21 01 00      [10]  283 	ld	hl,#0x0001
   4515 18 57         [12]  284 	jr	00136$
   4517                     285 00113$:
                            286 ;src/main.c:94: return 2;
   4517 21 02 00      [10]  287 	ld	hl,#0x0002
   451A 18 52         [12]  288 	jr	00136$
   451C                     289 00116$:
                            290 ;src/main.c:96: if(eX >= pX && eX <= popX && eopY >= pY && eopY <= popY)
   451C DD 7E FA      [19]  291 	ld	a,-6 (ix)
   451F DD 96 05      [19]  292 	sub	a, 5 (ix)
   4522 3E 00         [ 7]  293 	ld	a,#0x00
   4524 17            [ 4]  294 	rla
   4525 4F            [ 4]  295 	ld	c,a
   4526 DD 7E FB      [19]  296 	ld	a,-5 (ix)
   4529 DD 96 FA      [19]  297 	sub	a, -6 (ix)
   452C 3E 00         [ 7]  298 	ld	a,#0x00
   452E 17            [ 4]  299 	rla
   452F 67            [ 4]  300 	ld	h,a
   4530 DD 7E FC      [19]  301 	ld	a,-4 (ix)
   4533 B7            [ 4]  302 	or	a,a
   4534 20 16         [12]  303 	jr	NZ,00124$
   4536 B5            [ 4]  304 	or	a,l
   4537 20 13         [12]  305 	jr	NZ,00124$
   4539 B1            [ 4]  306 	or	a,c
   453A 20 10         [12]  307 	jr	NZ,00124$
                            308 ;src/main.c:97: if(atk >= 21)
   453C B4            [ 4]  309 	or	a,h
   453D 20 0D         [12]  310 	jr	NZ,00124$
   453F B3            [ 4]  311 	or	a,e
   4540 20 05         [12]  312 	jr	NZ,00121$
                            313 ;src/main.c:98: return 1;
   4542 21 01 00      [10]  314 	ld	hl,#0x0001
   4545 18 27         [12]  315 	jr	00136$
   4547                     316 00121$:
                            317 ;src/main.c:100: return 2;
   4547 21 02 00      [10]  318 	ld	hl,#0x0002
   454A 18 22         [12]  319 	jr	00136$
   454C                     320 00124$:
                            321 ;src/main.c:102: if(eopX >= pX && eopX <= popX && eopY >= pY && eopY <= popY)
   454C DD 7E FF      [19]  322 	ld	a,-1 (ix)
   454F B7            [ 4]  323 	or	a, a
   4550 20 19         [12]  324 	jr	NZ,00132$
   4552 DD 7E FE      [19]  325 	ld	a,-2 (ix)
   4555 B7            [ 4]  326 	or	a,a
   4556 20 13         [12]  327 	jr	NZ,00132$
   4558 B1            [ 4]  328 	or	a,c
   4559 20 10         [12]  329 	jr	NZ,00132$
                            330 ;src/main.c:103: if(atk >= 21)
   455B B4            [ 4]  331 	or	a,h
   455C 20 0D         [12]  332 	jr	NZ,00132$
   455E B3            [ 4]  333 	or	a,e
   455F 20 05         [12]  334 	jr	NZ,00129$
                            335 ;src/main.c:104: return 1;
   4561 21 01 00      [10]  336 	ld	hl,#0x0001
   4564 18 08         [12]  337 	jr	00136$
   4566                     338 00129$:
                            339 ;src/main.c:106: return 2;
   4566 21 02 00      [10]  340 	ld	hl,#0x0002
   4569 18 03         [12]  341 	jr	00136$
   456B                     342 00132$:
                            343 ;src/main.c:108: return 0;
   456B 21 00 00      [10]  344 	ld	hl,#0x0000
   456E                     345 00136$:
   456E DD F9         [10]  346 	ld	sp, ix
   4570 DD E1         [14]  347 	pop	ix
   4572 C9            [10]  348 	ret
                            349 ;src/main.c:111: u8* checkSprite(u8* atk, u8* dir){
                            350 ;	---------------------------------
                            351 ; Function checkSprite
                            352 ; ---------------------------------
   4573                     353 _checkSprite::
                            354 ;src/main.c:112: if(atk <= 20)
   4573 3E 14         [ 7]  355 	ld	a,#0x14
   4575 FD 21 02 00   [14]  356 	ld	iy,#2
   4579 FD 39         [15]  357 	add	iy,sp
   457B FD BE 00      [19]  358 	cp	a, 0 (iy)
   457E 3E 00         [ 7]  359 	ld	a,#0x00
   4580 FD 9E 01      [19]  360 	sbc	a, 1 (iy)
   4583 38 3B         [12]  361 	jr	C,00110$
                            362 ;src/main.c:113: switch((int)dir){
   4585 FD 21 04 00   [14]  363 	ld	iy,#4
   4589 FD 39         [15]  364 	add	iy,sp
   458B FD 5E 00      [19]  365 	ld	e,0 (iy)
   458E FD 56 01      [19]  366 	ld	d,1 (iy)
   4591 CB 7A         [ 8]  367 	bit	7, d
   4593 C0            [11]  368 	ret	NZ
   4594 3E 03         [ 7]  369 	ld	a,#0x03
   4596 BB            [ 4]  370 	cp	a, e
   4597 3E 00         [ 7]  371 	ld	a,#0x00
   4599 9A            [ 4]  372 	sbc	a, d
   459A E2 9F 45      [10]  373 	jp	PO, 00130$
   459D EE 80         [ 7]  374 	xor	a, #0x80
   459F                     375 00130$:
   459F F8            [11]  376 	ret	M
   45A0 16 00         [ 7]  377 	ld	d,#0x00
   45A2 21 A8 45      [10]  378 	ld	hl,#00131$
   45A5 19            [11]  379 	add	hl,de
   45A6 19            [11]  380 	add	hl,de
                            381 ;src/main.c:114: case 0:
   45A7 E9            [ 4]  382 	jp	(hl)
   45A8                     383 00131$:
   45A8 18 06         [12]  384 	jr	00101$
   45AA 18 08         [12]  385 	jr	00102$
   45AC 18 0A         [12]  386 	jr	00103$
   45AE 18 0C         [12]  387 	jr	00104$
   45B0                     388 00101$:
                            389 ;src/main.c:115: return gladis_quieto_dcha;
   45B0 21 40 42      [10]  390 	ld	hl,#_gladis_quieto_dcha
   45B3 C9            [10]  391 	ret
                            392 ;src/main.c:117: case 1:
   45B4                     393 00102$:
                            394 ;src/main.c:118: return gladis_quieto_izda;
   45B4 21 C0 42      [10]  395 	ld	hl,#_gladis_quieto_izda
   45B7 C9            [10]  396 	ret
                            397 ;src/main.c:120: case 2:
   45B8                     398 00103$:
                            399 ;src/main.c:121: return gladis_quieto_dcha;
   45B8 21 40 42      [10]  400 	ld	hl,#_gladis_quieto_dcha
   45BB C9            [10]  401 	ret
                            402 ;src/main.c:123: case 3:
   45BC                     403 00104$:
                            404 ;src/main.c:124: return gladis_arriba_dcha;
   45BC 21 40 40      [10]  405 	ld	hl,#_gladis_arriba_dcha
   45BF C9            [10]  406 	ret
                            407 ;src/main.c:125: }
   45C0                     408 00110$:
                            409 ;src/main.c:126: else if(dir == 0){
   45C0 21 05 00      [10]  410 	ld	hl, #4+1
   45C3 39            [11]  411 	add	hl, sp
   45C4 7E            [ 7]  412 	ld	a, (hl)
   45C5 2B            [ 6]  413 	dec	hl
   45C6 B6            [ 7]  414 	or	a,(hl)
   45C7 20 04         [12]  415 	jr	NZ,00107$
                            416 ;src/main.c:127: return gladis_atk_dcha;
   45C9 21 D7 52      [10]  417 	ld	hl,#_gladis_atk_dcha
   45CC C9            [10]  418 	ret
   45CD                     419 00107$:
                            420 ;src/main.c:129: return gladis_atk_izda;
   45CD 21 77 53      [10]  421 	ld	hl,#_gladis_atk_izda
   45D0 C9            [10]  422 	ret
                            423 ;src/main.c:133: u8* checkSpriteFlecha(u8* dir){
                            424 ;	---------------------------------
                            425 ; Function checkSpriteFlecha
                            426 ; ---------------------------------
   45D1                     427 _checkSpriteFlecha::
                            428 ;src/main.c:134: switch((int)dir){
   45D1 C1            [10]  429 	pop	bc
   45D2 D1            [10]  430 	pop	de
   45D3 D5            [11]  431 	push	de
   45D4 C5            [11]  432 	push	bc
   45D5 CB 7A         [ 8]  433 	bit	7, d
   45D7 C0            [11]  434 	ret	NZ
   45D8 3E 03         [ 7]  435 	ld	a,#0x03
   45DA BB            [ 4]  436 	cp	a, e
   45DB 3E 00         [ 7]  437 	ld	a,#0x00
   45DD 9A            [ 4]  438 	sbc	a, d
   45DE E2 E3 45      [10]  439 	jp	PO, 00116$
   45E1 EE 80         [ 7]  440 	xor	a, #0x80
   45E3                     441 00116$:
   45E3 F8            [11]  442 	ret	M
   45E4 16 00         [ 7]  443 	ld	d,#0x00
   45E6 21 EC 45      [10]  444 	ld	hl,#00117$
   45E9 19            [11]  445 	add	hl,de
   45EA 19            [11]  446 	add	hl,de
                            447 ;src/main.c:135: case 0:
   45EB E9            [ 4]  448 	jp	(hl)
   45EC                     449 00117$:
   45EC 18 06         [12]  450 	jr	00101$
   45EE 18 08         [12]  451 	jr	00102$
   45F0 18 0A         [12]  452 	jr	00103$
   45F2 18 0C         [12]  453 	jr	00104$
   45F4                     454 00101$:
                            455 ;src/main.c:136: return flecha_dcha;
   45F4 21 97 52      [10]  456 	ld	hl,#_flecha_dcha
   45F7 C9            [10]  457 	ret
                            458 ;src/main.c:138: case 1:
   45F8                     459 00102$:
                            460 ;src/main.c:139: return flecha_izda;
   45F8 21 B7 52      [10]  461 	ld	hl,#_flecha_izda
   45FB C9            [10]  462 	ret
                            463 ;src/main.c:141: case 2:
   45FC                     464 00103$:
                            465 ;src/main.c:142: return flecha_abajo;
   45FC 21 20 40      [10]  466 	ld	hl,#_flecha_abajo
   45FF C9            [10]  467 	ret
                            468 ;src/main.c:144: case 3:
   4600                     469 00104$:
                            470 ;src/main.c:145: return flecha_arriba;
   4600 21 00 40      [10]  471 	ld	hl,#_flecha_arriba
                            472 ;src/main.c:147: }
   4603 C9            [10]  473 	ret
                            474 ;src/main.c:151: void drawFatiga(u8* atk, u8* memptr, u8 col){
                            475 ;	---------------------------------
                            476 ; Function drawFatiga
                            477 ; ---------------------------------
   4604                     478 _drawFatiga::
   4604 DD E5         [15]  479 	push	ix
   4606 DD 21 00 00   [14]  480 	ld	ix,#0
   460A DD 39         [15]  481 	add	ix,sp
                            482 ;src/main.c:152: if(atk < 20)
   460C DD 7E 04      [19]  483 	ld	a,4 (ix)
   460F D6 14         [ 7]  484 	sub	a, #0x14
   4611 DD 7E 05      [19]  485 	ld	a,5 (ix)
   4614 DE 00         [ 7]  486 	sbc	a, #0x00
   4616 30 04         [12]  487 	jr	NC,00102$
                            488 ;src/main.c:153: col = 2;
   4618 DD 36 08 02   [19]  489 	ld	8 (ix),#0x02
   461C                     490 00102$:
                            491 ;src/main.c:154: if(atk > 30 || atk <= 20){
   461C 3E 14         [ 7]  492 	ld	a,#0x14
   461E DD BE 04      [19]  493 	cp	a, 4 (ix)
   4621 3E 00         [ 7]  494 	ld	a,#0x00
   4623 DD 9E 05      [19]  495 	sbc	a, 5 (ix)
   4626 3E 00         [ 7]  496 	ld	a,#0x00
   4628 17            [ 4]  497 	rla
   4629 57            [ 4]  498 	ld	d,a
   462A 3E 1E         [ 7]  499 	ld	a,#0x1E
   462C DD BE 04      [19]  500 	cp	a, 4 (ix)
   462F 3E 00         [ 7]  501 	ld	a,#0x00
   4631 DD 9E 05      [19]  502 	sbc	a, 5 (ix)
   4634 38 04         [12]  503 	jr	C,00103$
   4636 7A            [ 4]  504 	ld	a,d
   4637 B7            [ 4]  505 	or	a, a
   4638 20 27         [12]  506 	jr	NZ,00104$
   463A                     507 00103$:
                            508 ;src/main.c:155: memptr = cpct_getScreenPtr(VMEM,4,160);
   463A D5            [11]  509 	push	de
   463B 21 04 A0      [10]  510 	ld	hl,#0xA004
   463E E5            [11]  511 	push	hl
   463F 21 00 C0      [10]  512 	ld	hl,#0xC000
   4642 E5            [11]  513 	push	hl
   4643 CD D4 56      [17]  514 	call	_cpct_getScreenPtr
   4646 D1            [10]  515 	pop	de
                            516 ;src/main.c:156: cpct_drawSolidBox(memptr, col, 2, 8);
   4647 DD 75 06      [19]  517 	ld	6 (ix),l
   464A DD 74 07      [19]  518 	ld	7 (ix),h
   464D 4D            [ 4]  519 	ld	c,l
   464E 44            [ 4]  520 	ld	b,h
   464F D5            [11]  521 	push	de
   4650 21 02 08      [10]  522 	ld	hl,#0x0802
   4653 E5            [11]  523 	push	hl
   4654 DD 7E 08      [19]  524 	ld	a,8 (ix)
   4657 F5            [11]  525 	push	af
   4658 33            [ 6]  526 	inc	sp
   4659 C5            [11]  527 	push	bc
   465A CD 1C 56      [17]  528 	call	_cpct_drawSolidBox
   465D F1            [10]  529 	pop	af
   465E F1            [10]  530 	pop	af
   465F 33            [ 6]  531 	inc	sp
   4660 D1            [10]  532 	pop	de
   4661                     533 00104$:
                            534 ;src/main.c:158: if(atk > 40 || atk <= 20){
   4661 3E 28         [ 7]  535 	ld	a,#0x28
   4663 DD BE 04      [19]  536 	cp	a, 4 (ix)
   4666 3E 00         [ 7]  537 	ld	a,#0x00
   4668 DD 9E 05      [19]  538 	sbc	a, 5 (ix)
   466B 38 04         [12]  539 	jr	C,00106$
   466D 7A            [ 4]  540 	ld	a,d
   466E B7            [ 4]  541 	or	a, a
   466F 20 27         [12]  542 	jr	NZ,00107$
   4671                     543 00106$:
                            544 ;src/main.c:159: memptr = cpct_getScreenPtr(VMEM,7,160);
   4671 D5            [11]  545 	push	de
   4672 21 07 A0      [10]  546 	ld	hl,#0xA007
   4675 E5            [11]  547 	push	hl
   4676 21 00 C0      [10]  548 	ld	hl,#0xC000
   4679 E5            [11]  549 	push	hl
   467A CD D4 56      [17]  550 	call	_cpct_getScreenPtr
   467D D1            [10]  551 	pop	de
                            552 ;src/main.c:160: cpct_drawSolidBox(memptr, col, 2, 8);
   467E DD 75 06      [19]  553 	ld	6 (ix),l
   4681 DD 74 07      [19]  554 	ld	7 (ix),h
   4684 4D            [ 4]  555 	ld	c,l
   4685 44            [ 4]  556 	ld	b,h
   4686 D5            [11]  557 	push	de
   4687 21 02 08      [10]  558 	ld	hl,#0x0802
   468A E5            [11]  559 	push	hl
   468B DD 7E 08      [19]  560 	ld	a,8 (ix)
   468E F5            [11]  561 	push	af
   468F 33            [ 6]  562 	inc	sp
   4690 C5            [11]  563 	push	bc
   4691 CD 1C 56      [17]  564 	call	_cpct_drawSolidBox
   4694 F1            [10]  565 	pop	af
   4695 F1            [10]  566 	pop	af
   4696 33            [ 6]  567 	inc	sp
   4697 D1            [10]  568 	pop	de
   4698                     569 00107$:
                            570 ;src/main.c:162: if(atk <= 20){
   4698 7A            [ 4]  571 	ld	a,d
   4699 B7            [ 4]  572 	or	a, a
   469A 20 22         [12]  573 	jr	NZ,00111$
                            574 ;src/main.c:163: memptr = cpct_getScreenPtr(VMEM,10,160);
   469C 21 0A A0      [10]  575 	ld	hl,#0xA00A
   469F E5            [11]  576 	push	hl
   46A0 21 00 C0      [10]  577 	ld	hl,#0xC000
   46A3 E5            [11]  578 	push	hl
   46A4 CD D4 56      [17]  579 	call	_cpct_getScreenPtr
                            580 ;src/main.c:164: cpct_drawSolidBox(memptr, col, 2, 8);
   46A7 DD 75 06      [19]  581 	ld	6 (ix),l
   46AA DD 74 07      [19]  582 	ld	7 (ix),h
   46AD EB            [ 4]  583 	ex	de,hl
   46AE 21 02 08      [10]  584 	ld	hl,#0x0802
   46B1 E5            [11]  585 	push	hl
   46B2 DD 7E 08      [19]  586 	ld	a,8 (ix)
   46B5 F5            [11]  587 	push	af
   46B6 33            [ 6]  588 	inc	sp
   46B7 D5            [11]  589 	push	de
   46B8 CD 1C 56      [17]  590 	call	_cpct_drawSolidBox
   46BB F1            [10]  591 	pop	af
   46BC F1            [10]  592 	pop	af
   46BD 33            [ 6]  593 	inc	sp
   46BE                     594 00111$:
   46BE DD E1         [14]  595 	pop	ix
   46C0 C9            [10]  596 	ret
                            597 ;src/main.c:169: void drawVida(u8* life, u8* memptr){
                            598 ;	---------------------------------
                            599 ; Function drawVida
                            600 ; ---------------------------------
   46C1                     601 _drawVida::
   46C1 DD E5         [15]  602 	push	ix
   46C3 DD 21 00 00   [14]  603 	ld	ix,#0
   46C7 DD 39         [15]  604 	add	ix,sp
                            605 ;src/main.c:170: if(life >= 1){
   46C9 DD 7E 04      [19]  606 	ld	a,4 (ix)
   46CC D6 01         [ 7]  607 	sub	a, #0x01
   46CE DD 7E 05      [19]  608 	ld	a,5 (ix)
   46D1 DE 00         [ 7]  609 	sbc	a, #0x00
   46D3 38 1F         [12]  610 	jr	C,00102$
                            611 ;src/main.c:171: memptr = cpct_getScreenPtr(VMEM,55,160);
   46D5 21 37 A0      [10]  612 	ld	hl,#0xA037
   46D8 E5            [11]  613 	push	hl
   46D9 21 00 C0      [10]  614 	ld	hl,#0xC000
   46DC E5            [11]  615 	push	hl
   46DD CD D4 56      [17]  616 	call	_cpct_getScreenPtr
                            617 ;src/main.c:172: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46E0 DD 75 06      [19]  618 	ld	6 (ix),l
   46E3 DD 74 07      [19]  619 	ld	7 (ix),h
   46E6 4D            [ 4]  620 	ld	c,l
   46E7 44            [ 4]  621 	ld	b,h
   46E8 11 44 43      [10]  622 	ld	de,#_corazon_lleno
   46EB 21 04 08      [10]  623 	ld	hl,#0x0804
   46EE E5            [11]  624 	push	hl
   46EF C5            [11]  625 	push	bc
   46F0 D5            [11]  626 	push	de
   46F1 CD 96 55      [17]  627 	call	_cpct_drawSpriteMasked
   46F4                     628 00102$:
                            629 ;src/main.c:174: memptr = cpct_getScreenPtr(VMEM,60,160);
   46F4 21 3C A0      [10]  630 	ld	hl,#0xA03C
   46F7 E5            [11]  631 	push	hl
   46F8 21 00 C0      [10]  632 	ld	hl,#0xC000
   46FB E5            [11]  633 	push	hl
   46FC CD D4 56      [17]  634 	call	_cpct_getScreenPtr
                            635 ;src/main.c:172: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46FF DD 75 06      [19]  636 	ld	6 (ix),l
   4702 DD 74 07      [19]  637 	ld	7 (ix),h
   4705 4D            [ 4]  638 	ld	c,l
   4706 44            [ 4]  639 	ld	b,h
                            640 ;src/main.c:175: if(life >= 2)
   4707 DD 7E 04      [19]  641 	ld	a,4 (ix)
   470A D6 02         [ 7]  642 	sub	a, #0x02
   470C DD 7E 05      [19]  643 	ld	a,5 (ix)
   470F DE 00         [ 7]  644 	sbc	a, #0x00
   4711 38 0E         [12]  645 	jr	C,00104$
                            646 ;src/main.c:176: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4713 11 44 43      [10]  647 	ld	de,#_corazon_lleno
   4716 21 04 08      [10]  648 	ld	hl,#0x0804
   4719 E5            [11]  649 	push	hl
   471A C5            [11]  650 	push	bc
   471B D5            [11]  651 	push	de
   471C CD 96 55      [17]  652 	call	_cpct_drawSpriteMasked
   471F 18 0C         [12]  653 	jr	00105$
   4721                     654 00104$:
                            655 ;src/main.c:178: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4721 11 84 43      [10]  656 	ld	de,#_corazon_roto
   4724 21 04 08      [10]  657 	ld	hl,#0x0804
   4727 E5            [11]  658 	push	hl
   4728 C5            [11]  659 	push	bc
   4729 D5            [11]  660 	push	de
   472A CD 96 55      [17]  661 	call	_cpct_drawSpriteMasked
   472D                     662 00105$:
                            663 ;src/main.c:179: memptr = cpct_getScreenPtr(VMEM,65,160);
   472D 21 41 A0      [10]  664 	ld	hl,#0xA041
   4730 E5            [11]  665 	push	hl
   4731 21 00 C0      [10]  666 	ld	hl,#0xC000
   4734 E5            [11]  667 	push	hl
   4735 CD D4 56      [17]  668 	call	_cpct_getScreenPtr
                            669 ;src/main.c:172: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4738 DD 75 06      [19]  670 	ld	6 (ix),l
   473B DD 74 07      [19]  671 	ld	7 (ix),h
   473E EB            [ 4]  672 	ex	de,hl
                            673 ;src/main.c:180: if(life >= 3)
   473F DD 7E 04      [19]  674 	ld	a,4 (ix)
   4742 D6 03         [ 7]  675 	sub	a, #0x03
   4744 DD 7E 05      [19]  676 	ld	a,5 (ix)
   4747 DE 00         [ 7]  677 	sbc	a, #0x00
   4749 38 0E         [12]  678 	jr	C,00107$
                            679 ;src/main.c:181: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   474B 01 44 43      [10]  680 	ld	bc,#_corazon_lleno
   474E 21 04 08      [10]  681 	ld	hl,#0x0804
   4751 E5            [11]  682 	push	hl
   4752 D5            [11]  683 	push	de
   4753 C5            [11]  684 	push	bc
   4754 CD 96 55      [17]  685 	call	_cpct_drawSpriteMasked
   4757 18 0C         [12]  686 	jr	00109$
   4759                     687 00107$:
                            688 ;src/main.c:183: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4759 01 84 43      [10]  689 	ld	bc,#_corazon_roto+0
   475C 21 04 08      [10]  690 	ld	hl,#0x0804
   475F E5            [11]  691 	push	hl
   4760 D5            [11]  692 	push	de
   4761 C5            [11]  693 	push	bc
   4762 CD 96 55      [17]  694 	call	_cpct_drawSpriteMasked
   4765                     695 00109$:
   4765 DD E1         [14]  696 	pop	ix
   4767 C9            [10]  697 	ret
                            698 ;src/main.c:189: void game(){
                            699 ;	---------------------------------
                            700 ; Function game
                            701 ; ---------------------------------
   4768                     702 _game::
   4768 DD E5         [15]  703 	push	ix
   476A DD 21 00 00   [14]  704 	ld	ix,#0
   476E DD 39         [15]  705 	add	ix,sp
   4770 21 B3 FF      [10]  706 	ld	hl,#-77
   4773 39            [11]  707 	add	hl,sp
   4774 F9            [ 6]  708 	ld	sp,hl
                            709 ;src/main.c:190: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
   4775 21 0C 00      [10]  710 	ld	hl,#0x000C
   4778 39            [11]  711 	add	hl,sp
   4779 36 00         [10]  712 	ld	(hl),#0x00
   477B 21 0C 00      [10]  713 	ld	hl,#0x000C
   477E 39            [11]  714 	add	hl,sp
   477F DD 75 ED      [19]  715 	ld	-19 (ix),l
   4782 DD 74 EE      [19]  716 	ld	-18 (ix),h
   4785 DD 7E ED      [19]  717 	ld	a,-19 (ix)
   4788 C6 01         [ 7]  718 	add	a, #0x01
   478A DD 77 D9      [19]  719 	ld	-39 (ix),a
   478D DD 7E EE      [19]  720 	ld	a,-18 (ix)
   4790 CE 00         [ 7]  721 	adc	a, #0x00
   4792 DD 77 DA      [19]  722 	ld	-38 (ix),a
   4795 DD 6E D9      [19]  723 	ld	l,-39 (ix)
   4798 DD 66 DA      [19]  724 	ld	h,-38 (ix)
   479B 36 64         [10]  725 	ld	(hl),#0x64
   479D DD 7E ED      [19]  726 	ld	a,-19 (ix)
   47A0 C6 02         [ 7]  727 	add	a, #0x02
   47A2 DD 77 FA      [19]  728 	ld	-6 (ix),a
   47A5 DD 7E EE      [19]  729 	ld	a,-18 (ix)
   47A8 CE 00         [ 7]  730 	adc	a, #0x00
   47AA DD 77 FB      [19]  731 	ld	-5 (ix),a
   47AD DD 6E FA      [19]  732 	ld	l,-6 (ix)
   47B0 DD 66 FB      [19]  733 	ld	h,-5 (ix)
   47B3 36 00         [10]  734 	ld	(hl),#0x00
   47B5 DD 7E ED      [19]  735 	ld	a,-19 (ix)
   47B8 C6 03         [ 7]  736 	add	a, #0x03
   47BA DD 77 DF      [19]  737 	ld	-33 (ix),a
   47BD DD 7E EE      [19]  738 	ld	a,-18 (ix)
   47C0 CE 00         [ 7]  739 	adc	a, #0x00
   47C2 DD 77 E0      [19]  740 	ld	-32 (ix),a
   47C5 DD 6E DF      [19]  741 	ld	l,-33 (ix)
   47C8 DD 66 E0      [19]  742 	ld	h,-32 (ix)
   47CB 36 64         [10]  743 	ld	(hl),#0x64
   47CD DD 7E ED      [19]  744 	ld	a,-19 (ix)
   47D0 C6 04         [ 7]  745 	add	a, #0x04
   47D2 DD 77 F3      [19]  746 	ld	-13 (ix),a
   47D5 DD 7E EE      [19]  747 	ld	a,-18 (ix)
   47D8 CE 00         [ 7]  748 	adc	a, #0x00
   47DA DD 77 F4      [19]  749 	ld	-12 (ix),a
   47DD DD 6E F3      [19]  750 	ld	l,-13 (ix)
   47E0 DD 66 F4      [19]  751 	ld	h,-12 (ix)
   47E3 36 14         [10]  752 	ld	(hl),#0x14
   47E5 23            [ 6]  753 	inc	hl
   47E6 36 00         [10]  754 	ld	(hl),#0x00
   47E8 DD 7E ED      [19]  755 	ld	a,-19 (ix)
   47EB C6 06         [ 7]  756 	add	a, #0x06
   47ED DD 77 F1      [19]  757 	ld	-15 (ix),a
   47F0 DD 7E EE      [19]  758 	ld	a,-18 (ix)
   47F3 CE 00         [ 7]  759 	adc	a, #0x00
   47F5 DD 77 F2      [19]  760 	ld	-14 (ix),a
   47F8 DD 6E F1      [19]  761 	ld	l,-15 (ix)
   47FB DD 66 F2      [19]  762 	ld	h,-14 (ix)
   47FE 36 14         [10]  763 	ld	(hl),#0x14
   4800 23            [ 6]  764 	inc	hl
   4801 36 00         [10]  765 	ld	(hl),#0x00
   4803 DD 7E ED      [19]  766 	ld	a,-19 (ix)
   4806 C6 08         [ 7]  767 	add	a, #0x08
   4808 DD 77 D7      [19]  768 	ld	-41 (ix),a
   480B DD 7E EE      [19]  769 	ld	a,-18 (ix)
   480E CE 00         [ 7]  770 	adc	a, #0x00
   4810 DD 77 D8      [19]  771 	ld	-40 (ix),a
   4813 DD 6E D7      [19]  772 	ld	l,-41 (ix)
   4816 DD 66 D8      [19]  773 	ld	h,-40 (ix)
   4819 AF            [ 4]  774 	xor	a, a
   481A 77            [ 7]  775 	ld	(hl), a
   481B 23            [ 6]  776 	inc	hl
   481C 77            [ 7]  777 	ld	(hl), a
   481D DD 7E ED      [19]  778 	ld	a,-19 (ix)
   4820 C6 0A         [ 7]  779 	add	a, #0x0A
   4822 DD 77 EF      [19]  780 	ld	-17 (ix),a
   4825 DD 7E EE      [19]  781 	ld	a,-18 (ix)
   4828 CE 00         [ 7]  782 	adc	a, #0x00
   482A DD 77 F0      [19]  783 	ld	-16 (ix),a
   482D DD 6E EF      [19]  784 	ld	l,-17 (ix)
   4830 DD 66 F0      [19]  785 	ld	h,-16 (ix)
   4833 AF            [ 4]  786 	xor	a, a
   4834 77            [ 7]  787 	ld	(hl), a
   4835 23            [ 6]  788 	inc	hl
   4836 77            [ 7]  789 	ld	(hl), a
   4837 DD 7E ED      [19]  790 	ld	a,-19 (ix)
   483A C6 0C         [ 7]  791 	add	a, #0x0C
   483C DD 77 FC      [19]  792 	ld	-4 (ix),a
   483F DD 7E EE      [19]  793 	ld	a,-18 (ix)
   4842 CE 00         [ 7]  794 	adc	a, #0x00
   4844 DD 77 FD      [19]  795 	ld	-3 (ix),a
   4847 DD 6E FC      [19]  796 	ld	l,-4 (ix)
   484A DD 66 FD      [19]  797 	ld	h,-3 (ix)
   484D 36 06         [10]  798 	ld	(hl),#0x06
   484F 23            [ 6]  799 	inc	hl
   4850 36 00         [10]  800 	ld	(hl),#0x00
                            801 ;src/main.c:191: TEnemy  e = { 55,100,55,100,0,1 };
   4852 21 1A 00      [10]  802 	ld	hl,#0x001A
   4855 39            [11]  803 	add	hl,sp
   4856 36 37         [10]  804 	ld	(hl),#0x37
   4858 21 1A 00      [10]  805 	ld	hl,#0x001A
   485B 39            [11]  806 	add	hl,sp
   485C DD 75 D5      [19]  807 	ld	-43 (ix),l
   485F DD 74 D6      [19]  808 	ld	-42 (ix),h
   4862 DD 7E D5      [19]  809 	ld	a,-43 (ix)
   4865 C6 01         [ 7]  810 	add	a, #0x01
   4867 DD 77 EB      [19]  811 	ld	-21 (ix),a
   486A DD 7E D6      [19]  812 	ld	a,-42 (ix)
   486D CE 00         [ 7]  813 	adc	a, #0x00
   486F DD 77 EC      [19]  814 	ld	-20 (ix),a
   4872 DD 6E EB      [19]  815 	ld	l,-21 (ix)
   4875 DD 66 EC      [19]  816 	ld	h,-20 (ix)
   4878 36 64         [10]  817 	ld	(hl),#0x64
   487A DD 6E D5      [19]  818 	ld	l,-43 (ix)
   487D DD 66 D6      [19]  819 	ld	h,-42 (ix)
   4880 23            [ 6]  820 	inc	hl
   4881 23            [ 6]  821 	inc	hl
   4882 36 37         [10]  822 	ld	(hl),#0x37
   4884 DD 6E D5      [19]  823 	ld	l,-43 (ix)
   4887 DD 66 D6      [19]  824 	ld	h,-42 (ix)
   488A 23            [ 6]  825 	inc	hl
   488B 23            [ 6]  826 	inc	hl
   488C 23            [ 6]  827 	inc	hl
   488D 36 64         [10]  828 	ld	(hl),#0x64
   488F DD 7E D5      [19]  829 	ld	a,-43 (ix)
   4892 C6 04         [ 7]  830 	add	a, #0x04
   4894 DD 77 FE      [19]  831 	ld	-2 (ix),a
   4897 DD 7E D6      [19]  832 	ld	a,-42 (ix)
   489A CE 00         [ 7]  833 	adc	a, #0x00
   489C DD 77 FF      [19]  834 	ld	-1 (ix),a
   489F DD 6E FE      [19]  835 	ld	l,-2 (ix)
   48A2 DD 66 FF      [19]  836 	ld	h,-1 (ix)
   48A5 AF            [ 4]  837 	xor	a, a
   48A6 77            [ 7]  838 	ld	(hl), a
   48A7 23            [ 6]  839 	inc	hl
   48A8 77            [ 7]  840 	ld	(hl), a
   48A9 DD 7E D5      [19]  841 	ld	a,-43 (ix)
   48AC C6 06         [ 7]  842 	add	a, #0x06
   48AE 6F            [ 4]  843 	ld	l,a
   48AF DD 7E D6      [19]  844 	ld	a,-42 (ix)
   48B2 CE 00         [ 7]  845 	adc	a, #0x00
   48B4 67            [ 4]  846 	ld	h,a
   48B5 36 01         [10]  847 	ld	(hl),#0x01
   48B7 23            [ 6]  848 	inc	hl
   48B8 36 00         [10]  849 	ld	(hl),#0x00
                            850 ;src/main.c:192: TEnemy pr = { 0,0,0,0,1,0 };
   48BA 21 04 00      [10]  851 	ld	hl,#0x0004
   48BD 39            [11]  852 	add	hl,sp
   48BE 36 00         [10]  853 	ld	(hl),#0x00
   48C0 21 04 00      [10]  854 	ld	hl,#0x0004
   48C3 39            [11]  855 	add	hl,sp
   48C4 DD 75 E5      [19]  856 	ld	-27 (ix),l
   48C7 DD 74 E6      [19]  857 	ld	-26 (ix),h
   48CA DD 7E E5      [19]  858 	ld	a,-27 (ix)
   48CD C6 01         [ 7]  859 	add	a, #0x01
   48CF DD 77 F5      [19]  860 	ld	-11 (ix),a
   48D2 DD 7E E6      [19]  861 	ld	a,-26 (ix)
   48D5 CE 00         [ 7]  862 	adc	a, #0x00
   48D7 DD 77 F6      [19]  863 	ld	-10 (ix),a
   48DA DD 6E F5      [19]  864 	ld	l,-11 (ix)
   48DD DD 66 F6      [19]  865 	ld	h,-10 (ix)
   48E0 36 00         [10]  866 	ld	(hl),#0x00
   48E2 DD 7E E5      [19]  867 	ld	a,-27 (ix)
   48E5 C6 02         [ 7]  868 	add	a, #0x02
   48E7 DD 77 E3      [19]  869 	ld	-29 (ix),a
   48EA DD 7E E6      [19]  870 	ld	a,-26 (ix)
   48ED CE 00         [ 7]  871 	adc	a, #0x00
   48EF DD 77 E4      [19]  872 	ld	-28 (ix),a
   48F2 DD 6E E3      [19]  873 	ld	l,-29 (ix)
   48F5 DD 66 E4      [19]  874 	ld	h,-28 (ix)
   48F8 36 00         [10]  875 	ld	(hl),#0x00
   48FA DD 7E E5      [19]  876 	ld	a,-27 (ix)
   48FD C6 03         [ 7]  877 	add	a, #0x03
   48FF DD 77 E1      [19]  878 	ld	-31 (ix),a
   4902 DD 7E E6      [19]  879 	ld	a,-26 (ix)
   4905 CE 00         [ 7]  880 	adc	a, #0x00
   4907 DD 77 E2      [19]  881 	ld	-30 (ix),a
   490A DD 6E E1      [19]  882 	ld	l,-31 (ix)
   490D DD 66 E2      [19]  883 	ld	h,-30 (ix)
   4910 36 00         [10]  884 	ld	(hl),#0x00
   4912 DD 7E E5      [19]  885 	ld	a,-27 (ix)
   4915 C6 04         [ 7]  886 	add	a, #0x04
   4917 DD 77 E9      [19]  887 	ld	-23 (ix),a
   491A DD 7E E6      [19]  888 	ld	a,-26 (ix)
   491D CE 00         [ 7]  889 	adc	a, #0x00
   491F DD 77 EA      [19]  890 	ld	-22 (ix),a
   4922 DD 6E E9      [19]  891 	ld	l,-23 (ix)
   4925 DD 66 EA      [19]  892 	ld	h,-22 (ix)
   4928 36 01         [10]  893 	ld	(hl),#0x01
   492A 23            [ 6]  894 	inc	hl
   492B 36 00         [10]  895 	ld	(hl),#0x00
   492D DD 7E E5      [19]  896 	ld	a,-27 (ix)
   4930 C6 06         [ 7]  897 	add	a, #0x06
   4932 DD 77 E7      [19]  898 	ld	-25 (ix),a
   4935 DD 7E E6      [19]  899 	ld	a,-26 (ix)
   4938 CE 00         [ 7]  900 	adc	a, #0x00
   493A DD 77 E8      [19]  901 	ld	-24 (ix),a
   493D DD 6E E7      [19]  902 	ld	l,-25 (ix)
   4940 DD 66 E8      [19]  903 	ld	h,-24 (ix)
   4943 36 00         [10]  904 	ld	(hl),#0x00
   4945 23            [ 6]  905 	inc	hl
   4946 36 00         [10]  906 	ld	(hl),#0x00
                            907 ;src/main.c:194: u8* sprite = gladis_quieto_dcha;
   4948 DD 36 B3 40   [19]  908 	ld	-77 (ix),#<(_gladis_quieto_dcha)
   494C DD 36 B4 42   [19]  909 	ld	-76 (ix),#>(_gladis_quieto_dcha)
                            910 ;src/main.c:197: cpct_clearScreen(0);
   4950 21 00 40      [10]  911 	ld	hl,#0x4000
   4953 E5            [11]  912 	push	hl
   4954 AF            [ 4]  913 	xor	a, a
   4955 F5            [11]  914 	push	af
   4956 33            [ 6]  915 	inc	sp
   4957 26 C0         [ 7]  916 	ld	h, #0xC0
   4959 E5            [11]  917 	push	hl
   495A CD FA 55      [17]  918 	call	_cpct_memset
                            919 ;src/main.c:199: while (1){
   495D                     920 00195$:
                            921 ;src/main.c:202: cpct_waitVSYNC();
   495D CD E0 55      [17]  922 	call	_cpct_waitVSYNC
                            923 ;src/main.c:205: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4960 DD 6E EB      [19]  924 	ld	l,-21 (ix)
   4963 DD 66 EC      [19]  925 	ld	h,-20 (ix)
   4966 46            [ 7]  926 	ld	b,(hl)
   4967 DD 6E D5      [19]  927 	ld	l,-43 (ix)
   496A DD 66 D6      [19]  928 	ld	h,-42 (ix)
   496D 4E            [ 7]  929 	ld	c, (hl)
   496E C5            [11]  930 	push	bc
   496F 21 00 C0      [10]  931 	ld	hl,#0xC000
   4972 E5            [11]  932 	push	hl
   4973 CD D4 56      [17]  933 	call	_cpct_getScreenPtr
   4976 DD 74 B6      [19]  934 	ld	-74 (ix),h
   4979 DD 75 B5      [19]  935 	ld	-75 (ix), l
   497C DD 75 F8      [19]  936 	ld	-8 (ix), l
   497F DD 7E B6      [19]  937 	ld	a,-74 (ix)
   4982 DD 77 F9      [19]  938 	ld	-7 (ix),a
                            939 ;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
   4985 21 04 10      [10]  940 	ld	hl,#0x1004
   4988 E5            [11]  941 	push	hl
   4989 AF            [ 4]  942 	xor	a, a
   498A F5            [11]  943 	push	af
   498B 33            [ 6]  944 	inc	sp
   498C DD 6E F8      [19]  945 	ld	l,-8 (ix)
   498F DD 66 F9      [19]  946 	ld	h,-7 (ix)
   4992 E5            [11]  947 	push	hl
   4993 CD 1C 56      [17]  948 	call	_cpct_drawSolidBox
   4996 F1            [10]  949 	pop	af
   4997 F1            [10]  950 	pop	af
   4998 33            [ 6]  951 	inc	sp
                            952 ;src/main.c:208: if(e.vivo == 0){
   4999 DD 6E FE      [19]  953 	ld	l,-2 (ix)
   499C DD 66 FF      [19]  954 	ld	h,-1 (ix)
   499F 7E            [ 7]  955 	ld	a,(hl)
   49A0 DD 77 F8      [19]  956 	ld	-8 (ix),a
   49A3 23            [ 6]  957 	inc	hl
   49A4 7E            [ 7]  958 	ld	a,(hl)
   49A5 DD 77 F9      [19]  959 	ld	-7 (ix), a
   49A8 DD B6 F8      [19]  960 	or	a,-8 (ix)
   49AB 20 3D         [12]  961 	jr	NZ,00102$
                            962 ;src/main.c:209: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   49AD DD 6E EB      [19]  963 	ld	l,-21 (ix)
   49B0 DD 66 EC      [19]  964 	ld	h,-20 (ix)
   49B3 7E            [ 7]  965 	ld	a,(hl)
   49B4 DD 77 F8      [19]  966 	ld	-8 (ix),a
   49B7 DD 6E D5      [19]  967 	ld	l,-43 (ix)
   49BA DD 66 D6      [19]  968 	ld	h,-42 (ix)
   49BD 7E            [ 7]  969 	ld	a,(hl)
   49BE DD 77 F7      [19]  970 	ld	-9 (ix),a
   49C1 DD 66 F8      [19]  971 	ld	h,-8 (ix)
   49C4 DD 6E F7      [19]  972 	ld	l,-9 (ix)
   49C7 E5            [11]  973 	push	hl
   49C8 21 00 C0      [10]  974 	ld	hl,#0xC000
   49CB E5            [11]  975 	push	hl
   49CC CD D4 56      [17]  976 	call	_cpct_getScreenPtr
   49CF DD 74 F9      [19]  977 	ld	-7 (ix),h
   49D2 DD 75 F8      [19]  978 	ld	-8 (ix),l
                            979 ;src/main.c:210: cpct_drawSolidBox(memptr, 18, 4, 16);
   49D5 21 04 10      [10]  980 	ld	hl,#0x1004
   49D8 E5            [11]  981 	push	hl
   49D9 3E 12         [ 7]  982 	ld	a,#0x12
   49DB F5            [11]  983 	push	af
   49DC 33            [ 6]  984 	inc	sp
   49DD DD 6E F8      [19]  985 	ld	l,-8 (ix)
   49E0 DD 66 F9      [19]  986 	ld	h,-7 (ix)
   49E3 E5            [11]  987 	push	hl
   49E4 CD 1C 56      [17]  988 	call	_cpct_drawSolidBox
   49E7 F1            [10]  989 	pop	af
   49E8 F1            [10]  990 	pop	af
   49E9 33            [ 6]  991 	inc	sp
   49EA                     992 00102$:
                            993 ;src/main.c:214: memptr = cpct_getScreenPtr(VMEM,pr.prevX,pr.prevY);
   49EA DD 6E E1      [19]  994 	ld	l,-31 (ix)
   49ED DD 66 E2      [19]  995 	ld	h,-30 (ix)
   49F0 46            [ 7]  996 	ld	b,(hl)
   49F1 DD 6E E3      [19]  997 	ld	l,-29 (ix)
   49F4 DD 66 E4      [19]  998 	ld	h,-28 (ix)
   49F7 4E            [ 7]  999 	ld	c, (hl)
   49F8 C5            [11] 1000 	push	bc
   49F9 21 00 C0      [10] 1001 	ld	hl,#0xC000
   49FC E5            [11] 1002 	push	hl
   49FD CD D4 56      [17] 1003 	call	_cpct_getScreenPtr
   4A00 DD 74 F9      [19] 1004 	ld	-7 (ix),h
   4A03 DD 75 F8      [19] 1005 	ld	-8 (ix),l
                           1006 ;src/main.c:215: if((int)pr.dir < 2)
   4A06 DD 6E E7      [19] 1007 	ld	l,-25 (ix)
   4A09 DD 66 E8      [19] 1008 	ld	h,-24 (ix)
   4A0C 7E            [ 7] 1009 	ld	a,(hl)
   4A0D DD 77 DD      [19] 1010 	ld	-35 (ix),a
   4A10 23            [ 6] 1011 	inc	hl
   4A11 7E            [ 7] 1012 	ld	a,(hl)
   4A12 DD 77 DE      [19] 1013 	ld	-34 (ix),a
                           1014 ;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
                           1015 ;src/main.c:215: if((int)pr.dir < 2)
   4A15 DD 7E DD      [19] 1016 	ld	a,-35 (ix)
   4A18 D6 02         [ 7] 1017 	sub	a, #0x02
   4A1A DD 7E DE      [19] 1018 	ld	a,-34 (ix)
   4A1D 17            [ 4] 1019 	rla
   4A1E 3F            [ 4] 1020 	ccf
   4A1F 1F            [ 4] 1021 	rra
   4A20 DE 80         [ 7] 1022 	sbc	a, #0x80
   4A22 30 16         [12] 1023 	jr	NC,00104$
                           1024 ;src/main.c:216: cpct_drawSolidBox(memptr, 0, 4, 4);
   4A24 21 04 04      [10] 1025 	ld	hl,#0x0404
   4A27 E5            [11] 1026 	push	hl
   4A28 AF            [ 4] 1027 	xor	a, a
   4A29 F5            [11] 1028 	push	af
   4A2A 33            [ 6] 1029 	inc	sp
   4A2B DD 6E F8      [19] 1030 	ld	l,-8 (ix)
   4A2E DD 66 F9      [19] 1031 	ld	h,-7 (ix)
   4A31 E5            [11] 1032 	push	hl
   4A32 CD 1C 56      [17] 1033 	call	_cpct_drawSolidBox
   4A35 F1            [10] 1034 	pop	af
   4A36 F1            [10] 1035 	pop	af
   4A37 33            [ 6] 1036 	inc	sp
   4A38 18 14         [12] 1037 	jr	00105$
   4A3A                    1038 00104$:
                           1039 ;src/main.c:218: cpct_drawSolidBox(memptr, 0, 2, 8);
   4A3A 21 02 08      [10] 1040 	ld	hl,#0x0802
   4A3D E5            [11] 1041 	push	hl
   4A3E AF            [ 4] 1042 	xor	a, a
   4A3F F5            [11] 1043 	push	af
   4A40 33            [ 6] 1044 	inc	sp
   4A41 DD 6E F8      [19] 1045 	ld	l,-8 (ix)
   4A44 DD 66 F9      [19] 1046 	ld	h,-7 (ix)
   4A47 E5            [11] 1047 	push	hl
   4A48 CD 1C 56      [17] 1048 	call	_cpct_drawSolidBox
   4A4B F1            [10] 1049 	pop	af
   4A4C F1            [10] 1050 	pop	af
   4A4D 33            [ 6] 1051 	inc	sp
   4A4E                    1052 00105$:
                           1053 ;src/main.c:220: if(pr.vivo == 0){
   4A4E DD 6E E9      [19] 1054 	ld	l,-23 (ix)
   4A51 DD 66 EA      [19] 1055 	ld	h,-22 (ix)
   4A54 7E            [ 7] 1056 	ld	a,(hl)
   4A55 DD 77 DD      [19] 1057 	ld	-35 (ix),a
   4A58 23            [ 6] 1058 	inc	hl
   4A59 7E            [ 7] 1059 	ld	a,(hl)
   4A5A DD 77 DE      [19] 1060 	ld	-34 (ix), a
   4A5D DD B6 DD      [19] 1061 	or	a,-35 (ix)
   4A60 C2 0D 4B      [10] 1062 	jp	NZ,00110$
                           1063 ;src/main.c:221: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4A63 DD 6E F5      [19] 1064 	ld	l,-11 (ix)
   4A66 DD 66 F6      [19] 1065 	ld	h,-10 (ix)
   4A69 7E            [ 7] 1066 	ld	a,(hl)
   4A6A DD 77 DD      [19] 1067 	ld	-35 (ix),a
   4A6D DD 6E E5      [19] 1068 	ld	l,-27 (ix)
   4A70 DD 66 E6      [19] 1069 	ld	h,-26 (ix)
   4A73 7E            [ 7] 1070 	ld	a,(hl)
   4A74 DD 77 F7      [19] 1071 	ld	-9 (ix),a
   4A77 DD 66 DD      [19] 1072 	ld	h,-35 (ix)
   4A7A DD 6E F7      [19] 1073 	ld	l,-9 (ix)
   4A7D E5            [11] 1074 	push	hl
   4A7E 21 00 C0      [10] 1075 	ld	hl,#0xC000
   4A81 E5            [11] 1076 	push	hl
   4A82 CD D4 56      [17] 1077 	call	_cpct_getScreenPtr
   4A85 DD 74 DE      [19] 1078 	ld	-34 (ix),h
   4A88 DD 75 DD      [19] 1079 	ld	-35 (ix), l
   4A8B DD 75 B5      [19] 1080 	ld	-75 (ix), l
   4A8E DD 7E DE      [19] 1081 	ld	a,-34 (ix)
   4A91 DD 77 B6      [19] 1082 	ld	-74 (ix),a
                           1083 ;src/main.c:215: if((int)pr.dir < 2)
   4A94 DD 6E E7      [19] 1084 	ld	l,-25 (ix)
   4A97 DD 66 E8      [19] 1085 	ld	h,-24 (ix)
   4A9A 7E            [ 7] 1086 	ld	a,(hl)
   4A9B DD 77 DD      [19] 1087 	ld	-35 (ix),a
   4A9E 23            [ 6] 1088 	inc	hl
   4A9F 7E            [ 7] 1089 	ld	a,(hl)
   4AA0 DD 77 DE      [19] 1090 	ld	-34 (ix),a
                           1091 ;src/main.c:222: if((int)pr.dir < 2)
   4AA3 DD 7E DD      [19] 1092 	ld	a,-35 (ix)
   4AA6 DD 77 F8      [19] 1093 	ld	-8 (ix),a
   4AA9 DD 7E DE      [19] 1094 	ld	a,-34 (ix)
   4AAC DD 77 F9      [19] 1095 	ld	-7 (ix),a
                           1096 ;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
   4AAF DD 7E B5      [19] 1097 	ld	a,-75 (ix)
   4AB2 DD 77 DB      [19] 1098 	ld	-37 (ix),a
   4AB5 DD 7E B6      [19] 1099 	ld	a,-74 (ix)
   4AB8 DD 77 DC      [19] 1100 	ld	-36 (ix),a
                           1101 ;src/main.c:222: if((int)pr.dir < 2)
   4ABB DD 7E F8      [19] 1102 	ld	a,-8 (ix)
   4ABE D6 02         [ 7] 1103 	sub	a, #0x02
   4AC0 DD 7E F9      [19] 1104 	ld	a,-7 (ix)
   4AC3 17            [ 4] 1105 	rla
   4AC4 3F            [ 4] 1106 	ccf
   4AC5 1F            [ 4] 1107 	rra
   4AC6 DE 80         [ 7] 1108 	sbc	a, #0x80
   4AC8 30 28         [12] 1109 	jr	NC,00107$
                           1110 ;src/main.c:223: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 4, 4);
   4ACA DD 6E DD      [19] 1111 	ld	l,-35 (ix)
   4ACD DD 66 DE      [19] 1112 	ld	h,-34 (ix)
   4AD0 E5            [11] 1113 	push	hl
   4AD1 CD D1 45      [17] 1114 	call	_checkSpriteFlecha
   4AD4 F1            [10] 1115 	pop	af
   4AD5 DD 74 F9      [19] 1116 	ld	-7 (ix),h
   4AD8 DD 75 F8      [19] 1117 	ld	-8 (ix),l
   4ADB 21 04 04      [10] 1118 	ld	hl,#0x0404
   4ADE E5            [11] 1119 	push	hl
   4ADF DD 6E DB      [19] 1120 	ld	l,-37 (ix)
   4AE2 DD 66 DC      [19] 1121 	ld	h,-36 (ix)
   4AE5 E5            [11] 1122 	push	hl
   4AE6 DD 6E F8      [19] 1123 	ld	l,-8 (ix)
   4AE9 DD 66 F9      [19] 1124 	ld	h,-7 (ix)
   4AEC E5            [11] 1125 	push	hl
   4AED CD 96 55      [17] 1126 	call	_cpct_drawSpriteMasked
   4AF0 18 1B         [12] 1127 	jr	00110$
   4AF2                    1128 00107$:
                           1129 ;src/main.c:225: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 2, 8);
   4AF2 DD 6E DD      [19] 1130 	ld	l,-35 (ix)
   4AF5 DD 66 DE      [19] 1131 	ld	h,-34 (ix)
   4AF8 E5            [11] 1132 	push	hl
   4AF9 CD D1 45      [17] 1133 	call	_checkSpriteFlecha
   4AFC F1            [10] 1134 	pop	af
   4AFD EB            [ 4] 1135 	ex	de,hl
   4AFE 21 02 08      [10] 1136 	ld	hl,#0x0802
   4B01 E5            [11] 1137 	push	hl
   4B02 DD 6E DB      [19] 1138 	ld	l,-37 (ix)
   4B05 DD 66 DC      [19] 1139 	ld	h,-36 (ix)
   4B08 E5            [11] 1140 	push	hl
   4B09 D5            [11] 1141 	push	de
   4B0A CD 96 55      [17] 1142 	call	_cpct_drawSpriteMasked
   4B0D                    1143 00110$:
                           1144 ;src/main.c:229: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
   4B0D DD 6E DF      [19] 1145 	ld	l,-33 (ix)
   4B10 DD 66 E0      [19] 1146 	ld	h,-32 (ix)
   4B13 46            [ 7] 1147 	ld	b,(hl)
   4B14 DD 6E FA      [19] 1148 	ld	l,-6 (ix)
   4B17 DD 66 FB      [19] 1149 	ld	h,-5 (ix)
   4B1A 4E            [ 7] 1150 	ld	c, (hl)
   4B1B C5            [11] 1151 	push	bc
   4B1C 21 00 C0      [10] 1152 	ld	hl,#0xC000
   4B1F E5            [11] 1153 	push	hl
   4B20 CD D4 56      [17] 1154 	call	_cpct_getScreenPtr
   4B23 DD 74 DC      [19] 1155 	ld	-36 (ix),h
   4B26 DD 75 DB      [19] 1156 	ld	-37 (ix),l
                           1157 ;src/main.c:230: if(p.prevAtk <= 20)
   4B29 DD 6E F1      [19] 1158 	ld	l,-15 (ix)
   4B2C DD 66 F2      [19] 1159 	ld	h,-14 (ix)
   4B2F 7E            [ 7] 1160 	ld	a,(hl)
   4B30 DD 77 DD      [19] 1161 	ld	-35 (ix),a
   4B33 23            [ 6] 1162 	inc	hl
   4B34 7E            [ 7] 1163 	ld	a,(hl)
   4B35 DD 77 DE      [19] 1164 	ld	-34 (ix),a
                           1165 ;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
   4B38 DD 5E DB      [19] 1166 	ld	e,-37 (ix)
   4B3B DD 56 DC      [19] 1167 	ld	d,-36 (ix)
                           1168 ;src/main.c:230: if(p.prevAtk <= 20)
   4B3E 3E 14         [ 7] 1169 	ld	a,#0x14
   4B40 DD BE DD      [19] 1170 	cp	a, -35 (ix)
   4B43 3E 00         [ 7] 1171 	ld	a,#0x00
   4B45 DD 9E DE      [19] 1172 	sbc	a, -34 (ix)
   4B48 38 10         [12] 1173 	jr	C,00112$
                           1174 ;src/main.c:231: cpct_drawSolidBox(memptr,0,4,16);
   4B4A 21 04 10      [10] 1175 	ld	hl,#0x1004
   4B4D E5            [11] 1176 	push	hl
   4B4E AF            [ 4] 1177 	xor	a, a
   4B4F F5            [11] 1178 	push	af
   4B50 33            [ 6] 1179 	inc	sp
   4B51 D5            [11] 1180 	push	de
   4B52 CD 1C 56      [17] 1181 	call	_cpct_drawSolidBox
   4B55 F1            [10] 1182 	pop	af
   4B56 F1            [10] 1183 	pop	af
   4B57 33            [ 6] 1184 	inc	sp
   4B58 18 0E         [12] 1185 	jr	00113$
   4B5A                    1186 00112$:
                           1187 ;src/main.c:233: cpct_drawSolidBox(memptr,0,5,16);
   4B5A 21 05 10      [10] 1188 	ld	hl,#0x1005
   4B5D E5            [11] 1189 	push	hl
   4B5E AF            [ 4] 1190 	xor	a, a
   4B5F F5            [11] 1191 	push	af
   4B60 33            [ 6] 1192 	inc	sp
   4B61 D5            [11] 1193 	push	de
   4B62 CD 1C 56      [17] 1194 	call	_cpct_drawSolidBox
   4B65 F1            [10] 1195 	pop	af
   4B66 F1            [10] 1196 	pop	af
   4B67 33            [ 6] 1197 	inc	sp
   4B68                    1198 00113$:
                           1199 ;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4B68 DD 6E D9      [19] 1200 	ld	l,-39 (ix)
   4B6B DD 66 DA      [19] 1201 	ld	h,-38 (ix)
   4B6E 46            [ 7] 1202 	ld	b,(hl)
   4B6F DD 6E ED      [19] 1203 	ld	l,-19 (ix)
   4B72 DD 66 EE      [19] 1204 	ld	h,-18 (ix)
   4B75 4E            [ 7] 1205 	ld	c, (hl)
   4B76 C5            [11] 1206 	push	bc
   4B77 21 00 C0      [10] 1207 	ld	hl,#0xC000
   4B7A E5            [11] 1208 	push	hl
   4B7B CD D4 56      [17] 1209 	call	_cpct_getScreenPtr
   4B7E 4D            [ 4] 1210 	ld	c, l
   4B7F 44            [ 4] 1211 	ld	b, h
                           1212 ;src/main.c:237: if(p.atk >= 21)
   4B80 DD 6E F3      [19] 1213 	ld	l,-13 (ix)
   4B83 DD 66 F4      [19] 1214 	ld	h,-12 (ix)
   4B86 7E            [ 7] 1215 	ld	a, (hl)
   4B87 23            [ 6] 1216 	inc	hl
   4B88 6E            [ 7] 1217 	ld	l,(hl)
   4B89 67            [ 4] 1218 	ld	h,a
                           1219 ;src/main.c:206: cpct_drawSolidBox(memptr,0,4,16);
                           1220 ;src/main.c:238: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4B8A D1            [10] 1221 	pop	de
   4B8B D5            [11] 1222 	push	de
                           1223 ;src/main.c:237: if(p.atk >= 21)
   4B8C 7C            [ 4] 1224 	ld	a,h
   4B8D D6 15         [ 7] 1225 	sub	a, #0x15
   4B8F 7D            [ 4] 1226 	ld	a,l
   4B90 DE 00         [ 7] 1227 	sbc	a, #0x00
   4B92 38 0B         [12] 1228 	jr	C,00115$
                           1229 ;src/main.c:238: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4B94 21 05 10      [10] 1230 	ld	hl,#0x1005
   4B97 E5            [11] 1231 	push	hl
   4B98 C5            [11] 1232 	push	bc
   4B99 D5            [11] 1233 	push	de
   4B9A CD 96 55      [17] 1234 	call	_cpct_drawSpriteMasked
   4B9D 18 09         [12] 1235 	jr	00116$
   4B9F                    1236 00115$:
                           1237 ;src/main.c:240: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4B9F 21 04 10      [10] 1238 	ld	hl,#0x1004
   4BA2 E5            [11] 1239 	push	hl
   4BA3 C5            [11] 1240 	push	bc
   4BA4 D5            [11] 1241 	push	de
   4BA5 CD 96 55      [17] 1242 	call	_cpct_drawSpriteMasked
   4BA8                    1243 00116$:
                           1244 ;src/main.c:243: memptr = cpct_getScreenPtr(VMEM,60,160);
   4BA8 21 3C A0      [10] 1245 	ld	hl,#0xA03C
   4BAB E5            [11] 1246 	push	hl
   4BAC 21 00 C0      [10] 1247 	ld	hl,#0xC000
   4BAF E5            [11] 1248 	push	hl
   4BB0 CD D4 56      [17] 1249 	call	_cpct_getScreenPtr
   4BB3 4D            [ 4] 1250 	ld	c, l
   4BB4 44            [ 4] 1251 	ld	b, h
                           1252 ;src/main.c:244: cpct_drawSolidBox(memptr,0,10,16);
   4BB5 59            [ 4] 1253 	ld	e, c
   4BB6 50            [ 4] 1254 	ld	d, b
   4BB7 C5            [11] 1255 	push	bc
   4BB8 21 0A 10      [10] 1256 	ld	hl,#0x100A
   4BBB E5            [11] 1257 	push	hl
   4BBC AF            [ 4] 1258 	xor	a, a
   4BBD F5            [11] 1259 	push	af
   4BBE 33            [ 6] 1260 	inc	sp
   4BBF D5            [11] 1261 	push	de
   4BC0 CD 1C 56      [17] 1262 	call	_cpct_drawSolidBox
   4BC3 F1            [10] 1263 	pop	af
   4BC4 F1            [10] 1264 	pop	af
   4BC5 33            [ 6] 1265 	inc	sp
   4BC6 C1            [10] 1266 	pop	bc
                           1267 ;src/main.c:246: drawVida(p.life, memptr);
   4BC7 DD 6E FC      [19] 1268 	ld	l,-4 (ix)
   4BCA DD 66 FD      [19] 1269 	ld	h,-3 (ix)
   4BCD 5E            [ 7] 1270 	ld	e,(hl)
   4BCE 23            [ 6] 1271 	inc	hl
   4BCF 56            [ 7] 1272 	ld	d,(hl)
   4BD0 C5            [11] 1273 	push	bc
   4BD1 C5            [11] 1274 	push	bc
   4BD2 D5            [11] 1275 	push	de
   4BD3 CD C1 46      [17] 1276 	call	_drawVida
   4BD6 F1            [10] 1277 	pop	af
   4BD7 F1            [10] 1278 	pop	af
   4BD8 C1            [10] 1279 	pop	bc
                           1280 ;src/main.c:237: if(p.atk >= 21)
   4BD9 DD 6E F3      [19] 1281 	ld	l,-13 (ix)
   4BDC DD 66 F4      [19] 1282 	ld	h,-12 (ix)
   4BDF 5E            [ 7] 1283 	ld	e,(hl)
   4BE0 23            [ 6] 1284 	inc	hl
   4BE1 56            [ 7] 1285 	ld	d,(hl)
                           1286 ;src/main.c:249: if(p.atk < 20)
   4BE2 7B            [ 4] 1287 	ld	a,e
   4BE3 D6 14         [ 7] 1288 	sub	a, #0x14
   4BE5 7A            [ 4] 1289 	ld	a,d
   4BE6 DE 00         [ 7] 1290 	sbc	a, #0x00
   4BE8 30 0E         [12] 1291 	jr	NC,00121$
                           1292 ;src/main.c:250: drawFatiga(p.atk,memptr,2);
   4BEA 3E 02         [ 7] 1293 	ld	a,#0x02
   4BEC F5            [11] 1294 	push	af
   4BED 33            [ 6] 1295 	inc	sp
   4BEE C5            [11] 1296 	push	bc
   4BEF D5            [11] 1297 	push	de
   4BF0 CD 04 46      [17] 1298 	call	_drawFatiga
   4BF3 F1            [10] 1299 	pop	af
   4BF4 F1            [10] 1300 	pop	af
   4BF5 33            [ 6] 1301 	inc	sp
   4BF6 18 21         [12] 1302 	jr	00122$
   4BF8                    1303 00121$:
                           1304 ;src/main.c:251: else if(p.atk > 20)
   4BF8 3E 14         [ 7] 1305 	ld	a,#0x14
   4BFA BB            [ 4] 1306 	cp	a, e
   4BFB 3E 00         [ 7] 1307 	ld	a,#0x00
   4BFD 9A            [ 4] 1308 	sbc	a, d
   4BFE 30 0E         [12] 1309 	jr	NC,00118$
                           1310 ;src/main.c:252: drawFatiga(p.atk,memptr,16);
   4C00 3E 10         [ 7] 1311 	ld	a,#0x10
   4C02 F5            [11] 1312 	push	af
   4C03 33            [ 6] 1313 	inc	sp
   4C04 C5            [11] 1314 	push	bc
   4C05 D5            [11] 1315 	push	de
   4C06 CD 04 46      [17] 1316 	call	_drawFatiga
   4C09 F1            [10] 1317 	pop	af
   4C0A F1            [10] 1318 	pop	af
   4C0B 33            [ 6] 1319 	inc	sp
   4C0C 18 0B         [12] 1320 	jr	00122$
   4C0E                    1321 00118$:
                           1322 ;src/main.c:254: drawFatiga(p.atk,memptr,0);
   4C0E AF            [ 4] 1323 	xor	a, a
   4C0F F5            [11] 1324 	push	af
   4C10 33            [ 6] 1325 	inc	sp
   4C11 C5            [11] 1326 	push	bc
   4C12 D5            [11] 1327 	push	de
   4C13 CD 04 46      [17] 1328 	call	_drawFatiga
   4C16 F1            [10] 1329 	pop	af
   4C17 F1            [10] 1330 	pop	af
   4C18 33            [ 6] 1331 	inc	sp
   4C19                    1332 00122$:
                           1333 ;src/main.c:256: p.prevX = p.x;
   4C19 DD 6E ED      [19] 1334 	ld	l,-19 (ix)
   4C1C DD 66 EE      [19] 1335 	ld	h,-18 (ix)
   4C1F 7E            [ 7] 1336 	ld	a,(hl)
   4C20 DD 6E FA      [19] 1337 	ld	l,-6 (ix)
   4C23 DD 66 FB      [19] 1338 	ld	h,-5 (ix)
   4C26 77            [ 7] 1339 	ld	(hl),a
                           1340 ;src/main.c:257: p.prevY = p.y;
   4C27 DD 6E D9      [19] 1341 	ld	l,-39 (ix)
   4C2A DD 66 DA      [19] 1342 	ld	h,-38 (ix)
   4C2D 7E            [ 7] 1343 	ld	a,(hl)
   4C2E DD 6E DF      [19] 1344 	ld	l,-33 (ix)
   4C31 DD 66 E0      [19] 1345 	ld	h,-32 (ix)
   4C34 77            [ 7] 1346 	ld	(hl),a
                           1347 ;src/main.c:258: p.prevAtk = p.atk;
   4C35 DD 6E F3      [19] 1348 	ld	l,-13 (ix)
   4C38 DD 66 F4      [19] 1349 	ld	h,-12 (ix)
   4C3B 56            [ 7] 1350 	ld	d,(hl)
   4C3C 23            [ 6] 1351 	inc	hl
   4C3D 5E            [ 7] 1352 	ld	e,(hl)
   4C3E DD 6E F1      [19] 1353 	ld	l,-15 (ix)
   4C41 DD 66 F2      [19] 1354 	ld	h,-14 (ix)
   4C44 72            [ 7] 1355 	ld	(hl),d
   4C45 23            [ 6] 1356 	inc	hl
   4C46 73            [ 7] 1357 	ld	(hl),e
                           1358 ;src/main.c:261: cpct_scanKeyboard_f();
   4C47 CD 47 54      [17] 1359 	call	_cpct_scanKeyboard_f
                           1360 ;src/main.c:262: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4C4A 21 05 80      [10] 1361 	ld	hl,#0x8005
   4C4D CD 3B 54      [17] 1362 	call	_cpct_isKeyPressed
   4C50 DD 75 DB      [19] 1363 	ld	-37 (ix),l
                           1364 ;src/main.c:237: if(p.atk >= 21)
   4C53 DD 6E F3      [19] 1365 	ld	l,-13 (ix)
   4C56 DD 66 F4      [19] 1366 	ld	h,-12 (ix)
   4C59 7E            [ 7] 1367 	ld	a,(hl)
   4C5A DD 77 DD      [19] 1368 	ld	-35 (ix),a
   4C5D 23            [ 6] 1369 	inc	hl
   4C5E 7E            [ 7] 1370 	ld	a,(hl)
   4C5F DD 77 DE      [19] 1371 	ld	-34 (ix),a
                           1372 ;src/main.c:249: if(p.atk < 20)
   4C62 DD 7E DD      [19] 1373 	ld	a,-35 (ix)
   4C65 D6 14         [ 7] 1374 	sub	a, #0x14
   4C67 DD 7E DE      [19] 1375 	ld	a,-34 (ix)
   4C6A DE 00         [ 7] 1376 	sbc	a, #0x00
   4C6C 3E 00         [ 7] 1377 	ld	a,#0x00
   4C6E 17            [ 4] 1378 	rla
   4C6F DD 77 F7      [19] 1379 	ld	-9 (ix),a
                           1380 ;src/main.c:266: p.atk += 1;
   4C72 DD 7E DD      [19] 1381 	ld	a,-35 (ix)
   4C75 C6 01         [ 7] 1382 	add	a, #0x01
   4C77 DD 77 F8      [19] 1383 	ld	-8 (ix),a
   4C7A DD 7E DE      [19] 1384 	ld	a,-34 (ix)
   4C7D CE 00         [ 7] 1385 	adc	a, #0x00
   4C7F DD 77 F9      [19] 1386 	ld	-7 (ix),a
                           1387 ;src/main.c:262: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4C82 DD 7E DB      [19] 1388 	ld	a,-37 (ix)
   4C85 B7            [ 4] 1389 	or	a, a
   4C86 28 5D         [12] 1390 	jr	Z,00161$
   4C88 DD 7E F7      [19] 1391 	ld	a,-9 (ix)
   4C8B B7            [ 4] 1392 	or	a, a
   4C8C 20 57         [12] 1393 	jr	NZ,00161$
                           1394 ;src/main.c:263: if(p.atk >= 50)
   4C8E DD 7E DD      [19] 1395 	ld	a,-35 (ix)
   4C91 D6 32         [ 7] 1396 	sub	a, #0x32
   4C93 DD 7E DE      [19] 1397 	ld	a,-34 (ix)
   4C96 DE 00         [ 7] 1398 	sbc	a, #0x00
   4C98 38 0C         [12] 1399 	jr	C,00124$
                           1400 ;src/main.c:264: p.atk = 0;
   4C9A DD 6E F3      [19] 1401 	ld	l,-13 (ix)
   4C9D DD 66 F4      [19] 1402 	ld	h,-12 (ix)
   4CA0 AF            [ 4] 1403 	xor	a, a
   4CA1 77            [ 7] 1404 	ld	(hl), a
   4CA2 23            [ 6] 1405 	inc	hl
   4CA3 77            [ 7] 1406 	ld	(hl), a
   4CA4 18 0F         [12] 1407 	jr	00125$
   4CA6                    1408 00124$:
                           1409 ;src/main.c:266: p.atk += 1;
   4CA6 DD 6E F3      [19] 1410 	ld	l,-13 (ix)
   4CA9 DD 66 F4      [19] 1411 	ld	h,-12 (ix)
   4CAC DD 7E F8      [19] 1412 	ld	a,-8 (ix)
   4CAF 77            [ 7] 1413 	ld	(hl),a
   4CB0 23            [ 6] 1414 	inc	hl
   4CB1 DD 7E F9      [19] 1415 	ld	a,-7 (ix)
   4CB4 77            [ 7] 1416 	ld	(hl),a
   4CB5                    1417 00125$:
                           1418 ;src/main.c:267: if(cpct_isKeyPressed(Key_CursorRight))
   4CB5 21 00 02      [10] 1419 	ld	hl,#0x0200
   4CB8 CD 3B 54      [17] 1420 	call	_cpct_isKeyPressed
   4CBB 7D            [ 4] 1421 	ld	a,l
   4CBC B7            [ 4] 1422 	or	a, a
   4CBD 28 0D         [12] 1423 	jr	Z,00129$
                           1424 ;src/main.c:268: p.dir = 0;
   4CBF DD 6E D7      [19] 1425 	ld	l,-41 (ix)
   4CC2 DD 66 D8      [19] 1426 	ld	h,-40 (ix)
   4CC5 AF            [ 4] 1427 	xor	a, a
   4CC6 77            [ 7] 1428 	ld	(hl), a
   4CC7 23            [ 6] 1429 	inc	hl
   4CC8 77            [ 7] 1430 	ld	(hl), a
   4CC9 C3 43 4E      [10] 1431 	jp	00162$
   4CCC                    1432 00129$:
                           1433 ;src/main.c:269: else if(cpct_isKeyPressed(Key_CursorLeft))
   4CCC 21 01 01      [10] 1434 	ld	hl,#0x0101
   4CCF CD 3B 54      [17] 1435 	call	_cpct_isKeyPressed
   4CD2 7D            [ 4] 1436 	ld	a,l
   4CD3 B7            [ 4] 1437 	or	a, a
   4CD4 CA 43 4E      [10] 1438 	jp	Z,00162$
                           1439 ;src/main.c:270: p.dir = 1;
   4CD7 DD 6E D7      [19] 1440 	ld	l,-41 (ix)
   4CDA DD 66 D8      [19] 1441 	ld	h,-40 (ix)
   4CDD 36 01         [10] 1442 	ld	(hl),#0x01
   4CDF 23            [ 6] 1443 	inc	hl
   4CE0 36 00         [10] 1444 	ld	(hl),#0x00
   4CE2 C3 43 4E      [10] 1445 	jp	00162$
   4CE5                    1446 00161$:
                           1447 ;src/main.c:272: if(p.atk < 20)
   4CE5 DD 7E F7      [19] 1448 	ld	a,-9 (ix)
   4CE8 B7            [ 4] 1449 	or	a, a
   4CE9 28 11         [12] 1450 	jr	Z,00132$
                           1451 ;src/main.c:273: p.atk += 1;
   4CEB DD 6E F3      [19] 1452 	ld	l,-13 (ix)
   4CEE DD 66 F4      [19] 1453 	ld	h,-12 (ix)
   4CF1 DD 7E F8      [19] 1454 	ld	a,-8 (ix)
   4CF4 77            [ 7] 1455 	ld	(hl),a
   4CF5 23            [ 6] 1456 	inc	hl
   4CF6 DD 7E F9      [19] 1457 	ld	a,-7 (ix)
   4CF9 77            [ 7] 1458 	ld	(hl),a
   4CFA 18 0B         [12] 1459 	jr	00133$
   4CFC                    1460 00132$:
                           1461 ;src/main.c:275: p.atk = 20;
   4CFC DD 6E F3      [19] 1462 	ld	l,-13 (ix)
   4CFF DD 66 F4      [19] 1463 	ld	h,-12 (ix)
   4D02 36 14         [10] 1464 	ld	(hl),#0x14
   4D04 23            [ 6] 1465 	inc	hl
   4D05 36 00         [10] 1466 	ld	(hl),#0x00
   4D07                    1467 00133$:
                           1468 ;src/main.c:276: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4D07 21 00 02      [10] 1469 	ld	hl,#0x0200
   4D0A CD 3B 54      [17] 1470 	call	_cpct_isKeyPressed
   4D0D 7D            [ 4] 1471 	ld	a,l
   4D0E B7            [ 4] 1472 	or	a, a
   4D0F 28 37         [12] 1473 	jr	Z,00157$
   4D11 DD 6E ED      [19] 1474 	ld	l,-19 (ix)
   4D14 DD 66 EE      [19] 1475 	ld	h,-18 (ix)
   4D17 7E            [ 7] 1476 	ld	a,(hl)
   4D18 DD 77 DB      [19] 1477 	ld	-37 (ix), a
   4D1B D6 4C         [ 7] 1478 	sub	a, #0x4C
   4D1D 30 29         [12] 1479 	jr	NC,00157$
                           1480 ;src/main.c:277: if(p.col != 2)
   4D1F DD 6E EF      [19] 1481 	ld	l,-17 (ix)
   4D22 DD 66 F0      [19] 1482 	ld	h,-16 (ix)
   4D25 56            [ 7] 1483 	ld	d,(hl)
   4D26 23            [ 6] 1484 	inc	hl
   4D27 66            [ 7] 1485 	ld	h,(hl)
   4D28 7A            [ 4] 1486 	ld	a,d
   4D29 D6 02         [ 7] 1487 	sub	a,#0x02
   4D2B 20 03         [12] 1488 	jr	NZ,00363$
   4D2D B4            [ 4] 1489 	or	a,h
   4D2E 28 0B         [12] 1490 	jr	Z,00135$
   4D30                    1491 00363$:
                           1492 ;src/main.c:278: p.x += 1;
   4D30 DD 7E DB      [19] 1493 	ld	a,-37 (ix)
   4D33 3C            [ 4] 1494 	inc	a
   4D34 DD 6E ED      [19] 1495 	ld	l,-19 (ix)
   4D37 DD 66 EE      [19] 1496 	ld	h,-18 (ix)
   4D3A 77            [ 7] 1497 	ld	(hl),a
   4D3B                    1498 00135$:
                           1499 ;src/main.c:279: p.dir = 0;
   4D3B DD 6E D7      [19] 1500 	ld	l,-41 (ix)
   4D3E DD 66 D8      [19] 1501 	ld	h,-40 (ix)
   4D41 AF            [ 4] 1502 	xor	a, a
   4D42 77            [ 7] 1503 	ld	(hl), a
   4D43 23            [ 6] 1504 	inc	hl
   4D44 77            [ 7] 1505 	ld	(hl), a
   4D45 C3 43 4E      [10] 1506 	jp	00162$
   4D48                    1507 00157$:
                           1508 ;src/main.c:280: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4D48 21 01 01      [10] 1509 	ld	hl,#0x0101
   4D4B CD 3B 54      [17] 1510 	call	_cpct_isKeyPressed
   4D4E 7D            [ 4] 1511 	ld	a,l
   4D4F B7            [ 4] 1512 	or	a, a
   4D50 28 37         [12] 1513 	jr	Z,00153$
   4D52 DD 6E ED      [19] 1514 	ld	l,-19 (ix)
   4D55 DD 66 EE      [19] 1515 	ld	h,-18 (ix)
   4D58 7E            [ 7] 1516 	ld	a,(hl)
   4D59 DD 77 DB      [19] 1517 	ld	-37 (ix), a
   4D5C B7            [ 4] 1518 	or	a, a
   4D5D 28 2A         [12] 1519 	jr	Z,00153$
                           1520 ;src/main.c:281: if(p.col != 2)
   4D5F DD 6E EF      [19] 1521 	ld	l,-17 (ix)
   4D62 DD 66 F0      [19] 1522 	ld	h,-16 (ix)
   4D65 56            [ 7] 1523 	ld	d,(hl)
   4D66 23            [ 6] 1524 	inc	hl
   4D67 66            [ 7] 1525 	ld	h,(hl)
   4D68 7A            [ 4] 1526 	ld	a,d
   4D69 D6 02         [ 7] 1527 	sub	a,#0x02
   4D6B 20 03         [12] 1528 	jr	NZ,00364$
   4D6D B4            [ 4] 1529 	or	a,h
   4D6E 28 0B         [12] 1530 	jr	Z,00137$
   4D70                    1531 00364$:
                           1532 ;src/main.c:282: p.x -= 1;
   4D70 DD 56 DB      [19] 1533 	ld	d,-37 (ix)
   4D73 15            [ 4] 1534 	dec	d
   4D74 DD 6E ED      [19] 1535 	ld	l,-19 (ix)
   4D77 DD 66 EE      [19] 1536 	ld	h,-18 (ix)
   4D7A 72            [ 7] 1537 	ld	(hl),d
   4D7B                    1538 00137$:
                           1539 ;src/main.c:283: p.dir = 1;
   4D7B DD 6E D7      [19] 1540 	ld	l,-41 (ix)
   4D7E DD 66 D8      [19] 1541 	ld	h,-40 (ix)
   4D81 36 01         [10] 1542 	ld	(hl),#0x01
   4D83 23            [ 6] 1543 	inc	hl
   4D84 36 00         [10] 1544 	ld	(hl),#0x00
   4D86 C3 43 4E      [10] 1545 	jp	00162$
   4D89                    1546 00153$:
                           1547 ;src/main.c:284: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4D89 21 00 04      [10] 1548 	ld	hl,#0x0400
   4D8C CD 3B 54      [17] 1549 	call	_cpct_isKeyPressed
   4D8F 7D            [ 4] 1550 	ld	a,l
   4D90 B7            [ 4] 1551 	or	a, a
   4D91 28 23         [12] 1552 	jr	Z,00149$
                           1553 ;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4D93 DD 6E D9      [19] 1554 	ld	l,-39 (ix)
   4D96 DD 66 DA      [19] 1555 	ld	h,-38 (ix)
   4D99 56            [ 7] 1556 	ld	d,(hl)
                           1557 ;src/main.c:284: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4D9A 7A            [ 4] 1558 	ld	a,d
   4D9B D6 B8         [ 7] 1559 	sub	a, #0xB8
   4D9D 30 17         [12] 1560 	jr	NC,00149$
                           1561 ;src/main.c:285: p.y += 2;
   4D9F 14            [ 4] 1562 	inc	d
   4DA0 14            [ 4] 1563 	inc	d
   4DA1 DD 6E D9      [19] 1564 	ld	l,-39 (ix)
   4DA4 DD 66 DA      [19] 1565 	ld	h,-38 (ix)
   4DA7 72            [ 7] 1566 	ld	(hl),d
                           1567 ;src/main.c:286: p.dir = 2;
   4DA8 DD 6E D7      [19] 1568 	ld	l,-41 (ix)
   4DAB DD 66 D8      [19] 1569 	ld	h,-40 (ix)
   4DAE 36 02         [10] 1570 	ld	(hl),#0x02
   4DB0 23            [ 6] 1571 	inc	hl
   4DB1 36 00         [10] 1572 	ld	(hl),#0x00
   4DB3 C3 43 4E      [10] 1573 	jp	00162$
   4DB6                    1574 00149$:
                           1575 ;src/main.c:287: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4DB6 21 00 01      [10] 1576 	ld	hl,#0x0100
   4DB9 CD 3B 54      [17] 1577 	call	_cpct_isKeyPressed
   4DBC 7D            [ 4] 1578 	ld	a,l
   4DBD B7            [ 4] 1579 	or	a, a
   4DBE 28 20         [12] 1580 	jr	Z,00145$
                           1581 ;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4DC0 DD 6E D9      [19] 1582 	ld	l,-39 (ix)
   4DC3 DD 66 DA      [19] 1583 	ld	h,-38 (ix)
   4DC6 7E            [ 7] 1584 	ld	a,(hl)
                           1585 ;src/main.c:287: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4DC7 B7            [ 4] 1586 	or	a, a
   4DC8 28 16         [12] 1587 	jr	Z,00145$
                           1588 ;src/main.c:288: p.y -= 2;
   4DCA C6 FE         [ 7] 1589 	add	a,#0xFE
   4DCC DD 6E D9      [19] 1590 	ld	l,-39 (ix)
   4DCF DD 66 DA      [19] 1591 	ld	h,-38 (ix)
   4DD2 77            [ 7] 1592 	ld	(hl),a
                           1593 ;src/main.c:289: p.dir = 3;
   4DD3 DD 6E D7      [19] 1594 	ld	l,-41 (ix)
   4DD6 DD 66 D8      [19] 1595 	ld	h,-40 (ix)
   4DD9 36 03         [10] 1596 	ld	(hl),#0x03
   4DDB 23            [ 6] 1597 	inc	hl
   4DDC 36 00         [10] 1598 	ld	(hl),#0x00
   4DDE 18 63         [12] 1599 	jr	00162$
   4DE0                    1600 00145$:
                           1601 ;src/main.c:290: }else if(cpct_isKeyPressed(Key_X) && pr.vivo == 1){
   4DE0 21 07 80      [10] 1602 	ld	hl,#0x8007
   4DE3 CD 3B 54      [17] 1603 	call	_cpct_isKeyPressed
   4DE6 7D            [ 4] 1604 	ld	a,l
   4DE7 B7            [ 4] 1605 	or	a, a
   4DE8 28 4E         [12] 1606 	jr	Z,00141$
   4DEA DD 6E E9      [19] 1607 	ld	l,-23 (ix)
   4DED DD 66 EA      [19] 1608 	ld	h,-22 (ix)
   4DF0 56            [ 7] 1609 	ld	d,(hl)
   4DF1 23            [ 6] 1610 	inc	hl
   4DF2 66            [ 7] 1611 	ld	h,(hl)
   4DF3 15            [ 4] 1612 	dec	d
   4DF4 20 42         [12] 1613 	jr	NZ,00141$
   4DF6 7C            [ 4] 1614 	ld	a,h
   4DF7 B7            [ 4] 1615 	or	a, a
   4DF8 20 3E         [12] 1616 	jr	NZ,00141$
                           1617 ;src/main.c:291: pr.vivo = 0;
   4DFA DD 6E E9      [19] 1618 	ld	l,-23 (ix)
   4DFD DD 66 EA      [19] 1619 	ld	h,-22 (ix)
   4E00 AF            [ 4] 1620 	xor	a, a
   4E01 77            [ 7] 1621 	ld	(hl), a
   4E02 23            [ 6] 1622 	inc	hl
   4E03 77            [ 7] 1623 	ld	(hl), a
                           1624 ;src/main.c:292: pr.dir = p.dir;
   4E04 DD 6E D7      [19] 1625 	ld	l,-41 (ix)
   4E07 DD 66 D8      [19] 1626 	ld	h,-40 (ix)
   4E0A 56            [ 7] 1627 	ld	d,(hl)
   4E0B 23            [ 6] 1628 	inc	hl
   4E0C 5E            [ 7] 1629 	ld	e,(hl)
   4E0D DD 6E E7      [19] 1630 	ld	l,-25 (ix)
   4E10 DD 66 E8      [19] 1631 	ld	h,-24 (ix)
   4E13 72            [ 7] 1632 	ld	(hl),d
   4E14 23            [ 6] 1633 	inc	hl
   4E15 73            [ 7] 1634 	ld	(hl),e
                           1635 ;src/main.c:293: pr.x = p.x+4;
   4E16 DD 6E ED      [19] 1636 	ld	l,-19 (ix)
   4E19 DD 66 EE      [19] 1637 	ld	h,-18 (ix)
   4E1C 7E            [ 7] 1638 	ld	a,(hl)
   4E1D C6 04         [ 7] 1639 	add	a, #0x04
   4E1F DD 6E E5      [19] 1640 	ld	l,-27 (ix)
   4E22 DD 66 E6      [19] 1641 	ld	h,-26 (ix)
   4E25 77            [ 7] 1642 	ld	(hl),a
                           1643 ;src/main.c:294: pr.y = p.y+8;
   4E26 DD 6E D9      [19] 1644 	ld	l,-39 (ix)
   4E29 DD 66 DA      [19] 1645 	ld	h,-38 (ix)
   4E2C 7E            [ 7] 1646 	ld	a,(hl)
   4E2D C6 08         [ 7] 1647 	add	a, #0x08
   4E2F DD 6E F5      [19] 1648 	ld	l,-11 (ix)
   4E32 DD 66 F6      [19] 1649 	ld	h,-10 (ix)
   4E35 77            [ 7] 1650 	ld	(hl),a
   4E36 18 0B         [12] 1651 	jr	00162$
   4E38                    1652 00141$:
                           1653 ;src/main.c:295: }else  if(cpct_isKeyPressed(Key_Esc)){
   4E38 21 08 04      [10] 1654 	ld	hl,#0x0408
   4E3B CD 3B 54      [17] 1655 	call	_cpct_isKeyPressed
   4E3E 7D            [ 4] 1656 	ld	a,l
   4E3F B7            [ 4] 1657 	or	a, a
                           1658 ;src/main.c:296: return;
   4E40 C2 87 50      [10] 1659 	jp	NZ,00197$
   4E43                    1660 00162$:
                           1661 ;src/main.c:301: sprite = checkSprite(p.atk,p.dir);
   4E43 DD 6E D7      [19] 1662 	ld	l,-41 (ix)
   4E46 DD 66 D8      [19] 1663 	ld	h,-40 (ix)
   4E49 4E            [ 7] 1664 	ld	c,(hl)
   4E4A 23            [ 6] 1665 	inc	hl
   4E4B 46            [ 7] 1666 	ld	b,(hl)
   4E4C DD 6E F3      [19] 1667 	ld	l,-13 (ix)
   4E4F DD 66 F4      [19] 1668 	ld	h,-12 (ix)
   4E52 5E            [ 7] 1669 	ld	e,(hl)
   4E53 23            [ 6] 1670 	inc	hl
   4E54 56            [ 7] 1671 	ld	d,(hl)
   4E55 C5            [11] 1672 	push	bc
   4E56 D5            [11] 1673 	push	de
   4E57 CD 73 45      [17] 1674 	call	_checkSprite
   4E5A F1            [10] 1675 	pop	af
   4E5B F1            [10] 1676 	pop	af
   4E5C 33            [ 6] 1677 	inc	sp
   4E5D 33            [ 6] 1678 	inc	sp
   4E5E E5            [11] 1679 	push	hl
                           1680 ;src/main.c:303: if(pr.vivo == 0){
   4E5F DD 6E E9      [19] 1681 	ld	l,-23 (ix)
   4E62 DD 66 EA      [19] 1682 	ld	h,-22 (ix)
   4E65 4E            [ 7] 1683 	ld	c,(hl)
   4E66 23            [ 6] 1684 	inc	hl
   4E67 46            [ 7] 1685 	ld	b,(hl)
   4E68 78            [ 4] 1686 	ld	a,b
   4E69 B1            [ 4] 1687 	or	a,c
   4E6A C2 AC 4F      [10] 1688 	jp	NZ,00184$
                           1689 ;src/main.c:304: pr.prevX = pr.x;
   4E6D DD 6E E5      [19] 1690 	ld	l,-27 (ix)
   4E70 DD 66 E6      [19] 1691 	ld	h,-26 (ix)
   4E73 7E            [ 7] 1692 	ld	a,(hl)
   4E74 DD 6E E3      [19] 1693 	ld	l,-29 (ix)
   4E77 DD 66 E4      [19] 1694 	ld	h,-28 (ix)
   4E7A 77            [ 7] 1695 	ld	(hl),a
                           1696 ;src/main.c:305: pr.prevY = pr.y;
   4E7B DD 6E F5      [19] 1697 	ld	l,-11 (ix)
   4E7E DD 66 F6      [19] 1698 	ld	h,-10 (ix)
   4E81 7E            [ 7] 1699 	ld	a,(hl)
   4E82 DD 6E E1      [19] 1700 	ld	l,-31 (ix)
   4E85 DD 66 E2      [19] 1701 	ld	h,-30 (ix)
   4E88 77            [ 7] 1702 	ld	(hl),a
                           1703 ;src/main.c:306: switch((int)pr.dir){
   4E89 DD 6E E7      [19] 1704 	ld	l,-25 (ix)
   4E8C DD 66 E8      [19] 1705 	ld	h,-24 (ix)
   4E8F 5E            [ 7] 1706 	ld	e,(hl)
   4E90 23            [ 6] 1707 	inc	hl
   4E91 56            [ 7] 1708 	ld	d,(hl)
   4E92 CB 7A         [ 8] 1709 	bit	7, d
   4E94 C2 3E 4F      [10] 1710 	jp	NZ,00180$
   4E97 3E 03         [ 7] 1711 	ld	a,#0x03
   4E99 BB            [ 4] 1712 	cp	a, e
   4E9A 3E 00         [ 7] 1713 	ld	a,#0x00
   4E9C 9A            [ 4] 1714 	sbc	a, d
   4E9D E2 A2 4E      [10] 1715 	jp	PO, 00367$
   4EA0 EE 80         [ 7] 1716 	xor	a, #0x80
   4EA2                    1717 00367$:
   4EA2 FA 3E 4F      [10] 1718 	jp	M,00180$
   4EA5 16 00         [ 7] 1719 	ld	d,#0x00
   4EA7 21 AD 4E      [10] 1720 	ld	hl,#00368$
   4EAA 19            [11] 1721 	add	hl,de
   4EAB 19            [11] 1722 	add	hl,de
                           1723 ;src/main.c:307: case 0:
   4EAC E9            [ 4] 1724 	jp	(hl)
   4EAD                    1725 00368$:
   4EAD 18 06         [12] 1726 	jr	00164$
   4EAF 18 27         [12] 1727 	jr	00168$
   4EB1 18 47         [12] 1728 	jr	00172$
   4EB3 18 69         [12] 1729 	jr	00176$
   4EB5                    1730 00164$:
                           1731 ;src/main.c:308: if(pr.x<74)
   4EB5 DD 6E E5      [19] 1732 	ld	l,-27 (ix)
   4EB8 DD 66 E6      [19] 1733 	ld	h,-26 (ix)
   4EBB 56            [ 7] 1734 	ld	d,(hl)
   4EBC 7A            [ 4] 1735 	ld	a,d
   4EBD D6 4A         [ 7] 1736 	sub	a, #0x4A
   4EBF 30 0A         [12] 1737 	jr	NC,00166$
                           1738 ;src/main.c:309: pr.x++;
   4EC1 14            [ 4] 1739 	inc	d
   4EC2 DD 6E E5      [19] 1740 	ld	l,-27 (ix)
   4EC5 DD 66 E6      [19] 1741 	ld	h,-26 (ix)
   4EC8 72            [ 7] 1742 	ld	(hl),d
   4EC9 18 73         [12] 1743 	jr	00180$
   4ECB                    1744 00166$:
                           1745 ;src/main.c:311: pr.vivo = 1;
   4ECB DD 6E E9      [19] 1746 	ld	l,-23 (ix)
   4ECE DD 66 EA      [19] 1747 	ld	h,-22 (ix)
   4ED1 36 01         [10] 1748 	ld	(hl),#0x01
   4ED3 23            [ 6] 1749 	inc	hl
   4ED4 36 00         [10] 1750 	ld	(hl),#0x00
                           1751 ;src/main.c:312: break;
   4ED6 18 66         [12] 1752 	jr	00180$
                           1753 ;src/main.c:313: case 1:
   4ED8                    1754 00168$:
                           1755 ;src/main.c:314: if(pr.x > 0)
   4ED8 DD 6E E5      [19] 1756 	ld	l,-27 (ix)
   4EDB DD 66 E6      [19] 1757 	ld	h,-26 (ix)
   4EDE 7E            [ 7] 1758 	ld	a,(hl)
   4EDF B7            [ 4] 1759 	or	a, a
   4EE0 28 0B         [12] 1760 	jr	Z,00170$
                           1761 ;src/main.c:315: pr.x--;
   4EE2 C6 FF         [ 7] 1762 	add	a,#0xFF
   4EE4 DD 6E E5      [19] 1763 	ld	l,-27 (ix)
   4EE7 DD 66 E6      [19] 1764 	ld	h,-26 (ix)
   4EEA 77            [ 7] 1765 	ld	(hl),a
   4EEB 18 51         [12] 1766 	jr	00180$
   4EED                    1767 00170$:
                           1768 ;src/main.c:317: pr.vivo = 1;
   4EED DD 6E E9      [19] 1769 	ld	l,-23 (ix)
   4EF0 DD 66 EA      [19] 1770 	ld	h,-22 (ix)
   4EF3 36 01         [10] 1771 	ld	(hl),#0x01
   4EF5 23            [ 6] 1772 	inc	hl
   4EF6 36 00         [10] 1773 	ld	(hl),#0x00
                           1774 ;src/main.c:318: break;
   4EF8 18 44         [12] 1775 	jr	00180$
                           1776 ;src/main.c:319: case 2:
   4EFA                    1777 00172$:
                           1778 ;src/main.c:221: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4EFA DD 6E F5      [19] 1779 	ld	l,-11 (ix)
   4EFD DD 66 F6      [19] 1780 	ld	h,-10 (ix)
   4F00 56            [ 7] 1781 	ld	d,(hl)
                           1782 ;src/main.c:320: if(pr.y < 192)
   4F01 7A            [ 4] 1783 	ld	a,d
   4F02 D6 C0         [ 7] 1784 	sub	a, #0xC0
   4F04 30 0B         [12] 1785 	jr	NC,00174$
                           1786 ;src/main.c:321: pr.y+=2;
   4F06 14            [ 4] 1787 	inc	d
   4F07 14            [ 4] 1788 	inc	d
   4F08 DD 6E F5      [19] 1789 	ld	l,-11 (ix)
   4F0B DD 66 F6      [19] 1790 	ld	h,-10 (ix)
   4F0E 72            [ 7] 1791 	ld	(hl),d
   4F0F 18 2D         [12] 1792 	jr	00180$
   4F11                    1793 00174$:
                           1794 ;src/main.c:323: pr.vivo = 1;
   4F11 DD 6E E9      [19] 1795 	ld	l,-23 (ix)
   4F14 DD 66 EA      [19] 1796 	ld	h,-22 (ix)
   4F17 36 01         [10] 1797 	ld	(hl),#0x01
   4F19 23            [ 6] 1798 	inc	hl
   4F1A 36 00         [10] 1799 	ld	(hl),#0x00
                           1800 ;src/main.c:324: break;
   4F1C 18 20         [12] 1801 	jr	00180$
                           1802 ;src/main.c:325: case 3:
   4F1E                    1803 00176$:
                           1804 ;src/main.c:221: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4F1E DD 6E F5      [19] 1805 	ld	l,-11 (ix)
   4F21 DD 66 F6      [19] 1806 	ld	h,-10 (ix)
   4F24 7E            [ 7] 1807 	ld	a,(hl)
                           1808 ;src/main.c:326: if(pr.y > 0)
   4F25 B7            [ 4] 1809 	or	a, a
   4F26 28 0B         [12] 1810 	jr	Z,00178$
                           1811 ;src/main.c:327: pr.y-=2;
   4F28 C6 FE         [ 7] 1812 	add	a,#0xFE
   4F2A DD 6E F5      [19] 1813 	ld	l,-11 (ix)
   4F2D DD 66 F6      [19] 1814 	ld	h,-10 (ix)
   4F30 77            [ 7] 1815 	ld	(hl),a
   4F31 18 0B         [12] 1816 	jr	00180$
   4F33                    1817 00178$:
                           1818 ;src/main.c:329: pr.vivo = 1;
   4F33 DD 6E E9      [19] 1819 	ld	l,-23 (ix)
   4F36 DD 66 EA      [19] 1820 	ld	h,-22 (ix)
   4F39 36 01         [10] 1821 	ld	(hl),#0x01
   4F3B 23            [ 6] 1822 	inc	hl
   4F3C 36 00         [10] 1823 	ld	(hl),#0x00
                           1824 ;src/main.c:331: }
   4F3E                    1825 00180$:
                           1826 ;src/main.c:332: if(checkCollisions(pr.x,pr.y,e.x,e.y,pr.dir,21,1) == 1){
   4F3E DD 6E E7      [19] 1827 	ld	l,-25 (ix)
   4F41 DD 66 E8      [19] 1828 	ld	h,-24 (ix)
   4F44 7E            [ 7] 1829 	ld	a,(hl)
   4F45 DD 77 DB      [19] 1830 	ld	-37 (ix),a
   4F48 23            [ 6] 1831 	inc	hl
   4F49 7E            [ 7] 1832 	ld	a,(hl)
   4F4A DD 77 DC      [19] 1833 	ld	-36 (ix),a
   4F4D DD 6E EB      [19] 1834 	ld	l,-21 (ix)
   4F50 DD 66 EC      [19] 1835 	ld	h,-20 (ix)
   4F53 56            [ 7] 1836 	ld	d,(hl)
   4F54 DD 6E D5      [19] 1837 	ld	l,-43 (ix)
   4F57 DD 66 D6      [19] 1838 	ld	h,-42 (ix)
   4F5A 4E            [ 7] 1839 	ld	c,(hl)
   4F5B DD 6E F5      [19] 1840 	ld	l,-11 (ix)
   4F5E DD 66 F6      [19] 1841 	ld	h,-10 (ix)
   4F61 5E            [ 7] 1842 	ld	e,(hl)
   4F62 DD 6E E5      [19] 1843 	ld	l,-27 (ix)
   4F65 DD 66 E6      [19] 1844 	ld	h,-26 (ix)
   4F68 7E            [ 7] 1845 	ld	a,(hl)
   4F69 DD 77 DD      [19] 1846 	ld	-35 (ix),a
   4F6C 3E 01         [ 7] 1847 	ld	a,#0x01
   4F6E F5            [11] 1848 	push	af
   4F6F 33            [ 6] 1849 	inc	sp
   4F70 21 15 00      [10] 1850 	ld	hl,#0x0015
   4F73 E5            [11] 1851 	push	hl
   4F74 DD 6E DB      [19] 1852 	ld	l,-37 (ix)
   4F77 DD 66 DC      [19] 1853 	ld	h,-36 (ix)
   4F7A E5            [11] 1854 	push	hl
   4F7B D5            [11] 1855 	push	de
   4F7C 33            [ 6] 1856 	inc	sp
   4F7D 51            [ 4] 1857 	ld	d, c
   4F7E D5            [11] 1858 	push	de
   4F7F DD 7E DD      [19] 1859 	ld	a,-35 (ix)
   4F82 F5            [11] 1860 	push	af
   4F83 33            [ 6] 1861 	inc	sp
   4F84 CD 59 44      [17] 1862 	call	_checkCollisions
   4F87 FD 21 09 00   [14] 1863 	ld	iy,#9
   4F8B FD 39         [15] 1864 	add	iy,sp
   4F8D FD F9         [10] 1865 	ld	sp,iy
   4F8F 2D            [ 4] 1866 	dec	l
   4F90 20 1A         [12] 1867 	jr	NZ,00184$
   4F92 7C            [ 4] 1868 	ld	a,h
   4F93 B7            [ 4] 1869 	or	a, a
   4F94 20 16         [12] 1870 	jr	NZ,00184$
                           1871 ;src/main.c:333: e.vivo = 1;
   4F96 DD 6E FE      [19] 1872 	ld	l,-2 (ix)
   4F99 DD 66 FF      [19] 1873 	ld	h,-1 (ix)
   4F9C 36 01         [10] 1874 	ld	(hl),#0x01
   4F9E 23            [ 6] 1875 	inc	hl
   4F9F 36 00         [10] 1876 	ld	(hl),#0x00
                           1877 ;src/main.c:334: pr.vivo = 1;
   4FA1 DD 6E E9      [19] 1878 	ld	l,-23 (ix)
   4FA4 DD 66 EA      [19] 1879 	ld	h,-22 (ix)
   4FA7 36 01         [10] 1880 	ld	(hl),#0x01
   4FA9 23            [ 6] 1881 	inc	hl
   4FAA 36 00         [10] 1882 	ld	(hl),#0x00
   4FAC                    1883 00184$:
                           1884 ;src/main.c:338: if(p.col != 2 && e.vivo == 0){
   4FAC DD 6E EF      [19] 1885 	ld	l,-17 (ix)
   4FAF DD 66 F0      [19] 1886 	ld	h,-16 (ix)
   4FB2 56            [ 7] 1887 	ld	d,(hl)
   4FB3 23            [ 6] 1888 	inc	hl
   4FB4 66            [ 7] 1889 	ld	h,(hl)
   4FB5 7A            [ 4] 1890 	ld	a,d
   4FB6 D6 02         [ 7] 1891 	sub	a,#0x02
   4FB8 20 04         [12] 1892 	jr	NZ,00371$
   4FBA B4            [ 4] 1893 	or	a,h
   4FBB CA 67 50      [10] 1894 	jp	Z,00190$
   4FBE                    1895 00371$:
   4FBE DD 6E FE      [19] 1896 	ld	l,-2 (ix)
   4FC1 DD 66 FF      [19] 1897 	ld	h,-1 (ix)
   4FC4 56            [ 7] 1898 	ld	d,(hl)
   4FC5 23            [ 6] 1899 	inc	hl
   4FC6 7E            [ 7] 1900 	ld	a, (hl)
   4FC7 B2            [ 4] 1901 	or	a,d
   4FC8 C2 67 50      [10] 1902 	jp	NZ,00190$
                           1903 ;src/main.c:339: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk,0);
   4FCB DD 6E F3      [19] 1904 	ld	l,-13 (ix)
   4FCE DD 66 F4      [19] 1905 	ld	h,-12 (ix)
   4FD1 7E            [ 7] 1906 	ld	a,(hl)
   4FD2 DD 77 DB      [19] 1907 	ld	-37 (ix),a
   4FD5 23            [ 6] 1908 	inc	hl
   4FD6 7E            [ 7] 1909 	ld	a,(hl)
   4FD7 DD 77 DC      [19] 1910 	ld	-36 (ix),a
   4FDA DD 6E D7      [19] 1911 	ld	l,-41 (ix)
   4FDD DD 66 D8      [19] 1912 	ld	h,-40 (ix)
   4FE0 7E            [ 7] 1913 	ld	a,(hl)
   4FE1 DD 77 DD      [19] 1914 	ld	-35 (ix),a
   4FE4 23            [ 6] 1915 	inc	hl
   4FE5 7E            [ 7] 1916 	ld	a,(hl)
   4FE6 DD 77 DE      [19] 1917 	ld	-34 (ix),a
   4FE9 DD 6E EB      [19] 1918 	ld	l,-21 (ix)
   4FEC DD 66 EC      [19] 1919 	ld	h,-20 (ix)
   4FEF 56            [ 7] 1920 	ld	d,(hl)
   4FF0 DD 6E D5      [19] 1921 	ld	l,-43 (ix)
   4FF3 DD 66 D6      [19] 1922 	ld	h,-42 (ix)
   4FF6 5E            [ 7] 1923 	ld	e,(hl)
   4FF7 DD 6E D9      [19] 1924 	ld	l,-39 (ix)
   4FFA DD 66 DA      [19] 1925 	ld	h,-38 (ix)
   4FFD 46            [ 7] 1926 	ld	b,(hl)
   4FFE DD 6E ED      [19] 1927 	ld	l,-19 (ix)
   5001 DD 66 EE      [19] 1928 	ld	h,-18 (ix)
   5004 4E            [ 7] 1929 	ld	c,(hl)
   5005 AF            [ 4] 1930 	xor	a, a
   5006 F5            [11] 1931 	push	af
   5007 33            [ 6] 1932 	inc	sp
   5008 DD 6E DB      [19] 1933 	ld	l,-37 (ix)
   500B DD 66 DC      [19] 1934 	ld	h,-36 (ix)
   500E E5            [11] 1935 	push	hl
   500F DD 6E DD      [19] 1936 	ld	l,-35 (ix)
   5012 DD 66 DE      [19] 1937 	ld	h,-34 (ix)
   5015 E5            [11] 1938 	push	hl
   5016 D5            [11] 1939 	push	de
   5017 C5            [11] 1940 	push	bc
   5018 CD 59 44      [17] 1941 	call	_checkCollisions
   501B FD 21 09 00   [14] 1942 	ld	iy,#9
   501F FD 39         [15] 1943 	add	iy,sp
   5021 FD F9         [10] 1944 	ld	sp,iy
   5023 55            [ 4] 1945 	ld	d,l
   5024 5C            [ 4] 1946 	ld	e,h
   5025 DD 6E EF      [19] 1947 	ld	l,-17 (ix)
   5028 DD 66 F0      [19] 1948 	ld	h,-16 (ix)
   502B 72            [ 7] 1949 	ld	(hl),d
   502C 23            [ 6] 1950 	inc	hl
   502D 73            [ 7] 1951 	ld	(hl),e
                           1952 ;src/main.c:340: if(p.col == 2){
   502E 7A            [ 4] 1953 	ld	a,d
   502F D6 02         [ 7] 1954 	sub	a,#0x02
   5031 20 34         [12] 1955 	jr	NZ,00190$
   5033 B3            [ 4] 1956 	or	a,e
   5034 20 31         [12] 1957 	jr	NZ,00190$
                           1958 ;src/main.c:341: p.life--;
   5036 DD 6E FC      [19] 1959 	ld	l,-4 (ix)
   5039 DD 66 FD      [19] 1960 	ld	h,-3 (ix)
   503C 5E            [ 7] 1961 	ld	e,(hl)
   503D 23            [ 6] 1962 	inc	hl
   503E 56            [ 7] 1963 	ld	d,(hl)
   503F 1B            [ 6] 1964 	dec	de
   5040 DD 6E FC      [19] 1965 	ld	l,-4 (ix)
   5043 DD 66 FD      [19] 1966 	ld	h,-3 (ix)
   5046 73            [ 7] 1967 	ld	(hl),e
   5047 23            [ 6] 1968 	inc	hl
   5048 72            [ 7] 1969 	ld	(hl),d
                           1970 ;src/main.c:342: p.x = 1;
   5049 DD 6E ED      [19] 1971 	ld	l,-19 (ix)
   504C DD 66 EE      [19] 1972 	ld	h,-18 (ix)
   504F 36 01         [10] 1973 	ld	(hl),#0x01
                           1974 ;src/main.c:343: p.y = 100;
   5051 DD 6E D9      [19] 1975 	ld	l,-39 (ix)
   5054 DD 66 DA      [19] 1976 	ld	h,-38 (ix)
   5057 36 64         [10] 1977 	ld	(hl),#0x64
                           1978 ;src/main.c:344: p.col = 0;
   5059 DD 6E EF      [19] 1979 	ld	l,-17 (ix)
   505C DD 66 F0      [19] 1980 	ld	h,-16 (ix)
   505F AF            [ 4] 1981 	xor	a, a
   5060 77            [ 7] 1982 	ld	(hl), a
   5061 23            [ 6] 1983 	inc	hl
   5062 77            [ 7] 1984 	ld	(hl), a
                           1985 ;src/main.c:345: if(p.life == 0)
   5063 7A            [ 4] 1986 	ld	a,d
   5064 B3            [ 4] 1987 	or	a,e
                           1988 ;src/main.c:346: return;
   5065 28 20         [12] 1989 	jr	Z,00197$
   5067                    1990 00190$:
                           1991 ;src/main.c:349: if(p.col == 1)
   5067 DD 6E EF      [19] 1992 	ld	l,-17 (ix)
   506A DD 66 F0      [19] 1993 	ld	h,-16 (ix)
   506D 56            [ 7] 1994 	ld	d,(hl)
   506E 23            [ 6] 1995 	inc	hl
   506F 66            [ 7] 1996 	ld	h,(hl)
   5070 15            [ 4] 1997 	dec	d
   5071 C2 5D 49      [10] 1998 	jp	NZ,00195$
   5074 7C            [ 4] 1999 	ld	a,h
   5075 B7            [ 4] 2000 	or	a, a
   5076 C2 5D 49      [10] 2001 	jp	NZ,00195$
                           2002 ;src/main.c:350: e.vivo = 1;
   5079 DD 6E FE      [19] 2003 	ld	l,-2 (ix)
   507C DD 66 FF      [19] 2004 	ld	h,-1 (ix)
   507F 36 01         [10] 2005 	ld	(hl),#0x01
   5081 23            [ 6] 2006 	inc	hl
   5082 36 00         [10] 2007 	ld	(hl),#0x00
   5084 C3 5D 49      [10] 2008 	jp	00195$
   5087                    2009 00197$:
   5087 DD F9         [10] 2010 	ld	sp, ix
   5089 DD E1         [14] 2011 	pop	ix
   508B C9            [10] 2012 	ret
                           2013 ;src/main.c:357: void main(void) {
                           2014 ;	---------------------------------
                           2015 ; Function main
                           2016 ; ---------------------------------
   508C                    2017 _main::
                           2018 ;src/main.c:359: init();
   508C CD C4 43      [17] 2019 	call	_init
                           2020 ;src/main.c:362: while(1){
   508F                    2021 00102$:
                           2022 ;src/main.c:363: menu();
   508F CD ED 43      [17] 2023 	call	_menu
                           2024 ;src/main.c:364: game();
   5092 CD 68 47      [17] 2025 	call	_game
   5095 18 F8         [12] 2026 	jr	00102$
                           2027 	.area _CODE
                           2028 	.area _INITIALIZER
                           2029 	.area _CABS (ABS)
