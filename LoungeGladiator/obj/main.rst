                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct  6 12:40:57 2015
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
                             65 ;src/main.c:50: void init(){
                             66 ;	---------------------------------
                             67 ; Function init
                             68 ; ---------------------------------
   43C4                      69 _init::
                             70 ;src/main.c:51: cpct_disableFirmware();
   43C4 CD 5E 54      [17]   71 	call	_cpct_disableFirmware
                             72 ;src/main.c:52: cpct_setVideoMode(0);
   43C7 AF            [ 4]   73 	xor	a, a
   43C8 F5            [11]   74 	push	af
   43C9 33            [ 6]   75 	inc	sp
   43CA CD 3B 54      [17]   76 	call	_cpct_setVideoMode
   43CD 33            [ 6]   77 	inc	sp
                             78 ;src/main.c:53: cpct_fw2hw(g_palette,4);
   43CE 11 E9 43      [10]   79 	ld	de,#_g_palette
   43D1 3E 04         [ 7]   80 	ld	a,#0x04
   43D3 F5            [11]   81 	push	af
   43D4 33            [ 6]   82 	inc	sp
   43D5 D5            [11]   83 	push	de
   43D6 CD C5 53      [17]   84 	call	_cpct_fw2hw
   43D9 F1            [10]   85 	pop	af
   43DA 33            [ 6]   86 	inc	sp
                             87 ;src/main.c:54: cpct_setPalette(g_palette,4);
   43DB 11 E9 43      [10]   88 	ld	de,#_g_palette
   43DE 3E 04         [ 7]   89 	ld	a,#0x04
   43E0 F5            [11]   90 	push	af
   43E1 33            [ 6]   91 	inc	sp
   43E2 D5            [11]   92 	push	de
   43E3 CD 6A 52      [17]   93 	call	_cpct_setPalette
   43E6 F1            [10]   94 	pop	af
   43E7 33            [ 6]   95 	inc	sp
   43E8 C9            [10]   96 	ret
   43E9                      97 _g_palette:
   43E9 00                   98 	.db #0x00	; 0
   43EA 1A                   99 	.db #0x1A	; 26
   43EB 06                  100 	.db #0x06	; 6
   43EC 12                  101 	.db #0x12	; 18
                            102 ;src/main.c:58: void menu(){
                            103 ;	---------------------------------
                            104 ; Function menu
                            105 ; ---------------------------------
   43ED                     106 _menu::
                            107 ;src/main.c:60: cpct_clearScreen(0);
   43ED 21 00 40      [10]  108 	ld	hl,#0x4000
   43F0 E5            [11]  109 	push	hl
   43F1 AF            [ 4]  110 	xor	a, a
   43F2 F5            [11]  111 	push	af
   43F3 33            [ 6]  112 	inc	sp
   43F4 26 C0         [ 7]  113 	ld	h, #0xC0
   43F6 E5            [11]  114 	push	hl
   43F7 CD 4D 54      [17]  115 	call	_cpct_memset
                            116 ;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,20,10);
   43FA 21 14 0A      [10]  117 	ld	hl,#0x0A14
   43FD E5            [11]  118 	push	hl
   43FE 21 00 C0      [10]  119 	ld	hl,#0xC000
   4401 E5            [11]  120 	push	hl
   4402 CD 27 55      [17]  121 	call	_cpct_getScreenPtr
                            122 ;src/main.c:63: cpct_drawStringM0("Super Menu",memptr,2,3);
   4405 EB            [ 4]  123 	ex	de,hl
   4406 01 42 44      [10]  124 	ld	bc,#___str_0+0
   4409 21 02 03      [10]  125 	ld	hl,#0x0302
   440C E5            [11]  126 	push	hl
   440D D5            [11]  127 	push	de
   440E C5            [11]  128 	push	bc
   440F CD 04 53      [17]  129 	call	_cpct_drawStringM0
   4412 21 06 00      [10]  130 	ld	hl,#6
   4415 39            [11]  131 	add	hl,sp
   4416 F9            [ 6]  132 	ld	sp,hl
                            133 ;src/main.c:65: memptr = cpct_getScreenPtr(VMEM,18,180);
   4417 21 12 B4      [10]  134 	ld	hl,#0xB412
   441A E5            [11]  135 	push	hl
   441B 21 00 C0      [10]  136 	ld	hl,#0xC000
   441E E5            [11]  137 	push	hl
   441F CD 27 55      [17]  138 	call	_cpct_getScreenPtr
                            139 ;src/main.c:66: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   4422 EB            [ 4]  140 	ex	de,hl
   4423 01 4D 44      [10]  141 	ld	bc,#___str_1+0
   4426 21 04 05      [10]  142 	ld	hl,#0x0504
   4429 E5            [11]  143 	push	hl
   442A D5            [11]  144 	push	de
   442B C5            [11]  145 	push	bc
   442C CD 04 53      [17]  146 	call	_cpct_drawStringM0
   442F 21 06 00      [10]  147 	ld	hl,#6
   4432 39            [11]  148 	add	hl,sp
   4433 F9            [ 6]  149 	ld	sp,hl
                            150 ;src/main.c:68: do{
   4434                     151 00101$:
                            152 ;src/main.c:69: cpct_scanKeyboard_f();
   4434 CD 9A 52      [17]  153 	call	_cpct_scanKeyboard_f
                            154 ;src/main.c:70: }while(!cpct_isKeyPressed(Key_Enter));
   4437 21 00 40      [10]  155 	ld	hl,#0x4000
   443A CD 8E 52      [17]  156 	call	_cpct_isKeyPressed
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
                            167 ;src/main.c:75: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk, u8 mode){
                            168 ;	---------------------------------
                            169 ; Function checkCollisions
                            170 ; ---------------------------------
   4459                     171 _checkCollisions::
                            172 ;src/main.c:81: u8 eopY = eY + 16;
   4459 C9            [10]  173 	ret
                            174 ;src/main.c:86: u8* checkSprite(u8* atk, u8* dir){
                            175 ;	---------------------------------
                            176 ; Function checkSprite
                            177 ; ---------------------------------
   445A                     178 _checkSprite::
                            179 ;src/main.c:87: if(atk <= 20)
   445A 3E 14         [ 7]  180 	ld	a,#0x14
   445C FD 21 02 00   [14]  181 	ld	iy,#2
   4460 FD 39         [15]  182 	add	iy,sp
   4462 FD BE 00      [19]  183 	cp	a, 0 (iy)
   4465 3E 00         [ 7]  184 	ld	a,#0x00
   4467 FD 9E 01      [19]  185 	sbc	a, 1 (iy)
   446A 38 3B         [12]  186 	jr	C,00110$
                            187 ;src/main.c:88: switch((int)dir){
   446C FD 21 04 00   [14]  188 	ld	iy,#4
   4470 FD 39         [15]  189 	add	iy,sp
   4472 FD 5E 00      [19]  190 	ld	e,0 (iy)
   4475 FD 56 01      [19]  191 	ld	d,1 (iy)
   4478 CB 7A         [ 8]  192 	bit	7, d
   447A C0            [11]  193 	ret	NZ
   447B 3E 03         [ 7]  194 	ld	a,#0x03
   447D BB            [ 4]  195 	cp	a, e
   447E 3E 00         [ 7]  196 	ld	a,#0x00
   4480 9A            [ 4]  197 	sbc	a, d
   4481 E2 86 44      [10]  198 	jp	PO, 00130$
   4484 EE 80         [ 7]  199 	xor	a, #0x80
   4486                     200 00130$:
   4486 F8            [11]  201 	ret	M
   4487 16 00         [ 7]  202 	ld	d,#0x00
   4489 21 8F 44      [10]  203 	ld	hl,#00131$
   448C 19            [11]  204 	add	hl,de
   448D 19            [11]  205 	add	hl,de
                            206 ;src/main.c:89: case 0:
   448E E9            [ 4]  207 	jp	(hl)
   448F                     208 00131$:
   448F 18 06         [12]  209 	jr	00101$
   4491 18 08         [12]  210 	jr	00102$
   4493 18 0A         [12]  211 	jr	00103$
   4495 18 0C         [12]  212 	jr	00104$
   4497                     213 00101$:
                            214 ;src/main.c:90: return gladis_quieto_dcha;
   4497 21 40 42      [10]  215 	ld	hl,#_gladis_quieto_dcha
   449A C9            [10]  216 	ret
                            217 ;src/main.c:92: case 1:
   449B                     218 00102$:
                            219 ;src/main.c:93: return gladis_quieto_izda;
   449B 21 C0 42      [10]  220 	ld	hl,#_gladis_quieto_izda
   449E C9            [10]  221 	ret
                            222 ;src/main.c:95: case 2:
   449F                     223 00103$:
                            224 ;src/main.c:96: return gladis_quieto_dcha;
   449F 21 40 42      [10]  225 	ld	hl,#_gladis_quieto_dcha
   44A2 C9            [10]  226 	ret
                            227 ;src/main.c:98: case 3:
   44A3                     228 00104$:
                            229 ;src/main.c:99: return gladis_arriba_dcha;
   44A3 21 40 40      [10]  230 	ld	hl,#_gladis_arriba_dcha
   44A6 C9            [10]  231 	ret
                            232 ;src/main.c:100: }
   44A7                     233 00110$:
                            234 ;src/main.c:101: else if(dir == 0){
   44A7 21 05 00      [10]  235 	ld	hl, #4+1
   44AA 39            [11]  236 	add	hl, sp
   44AB 7E            [ 7]  237 	ld	a, (hl)
   44AC 2B            [ 6]  238 	dec	hl
   44AD B6            [ 7]  239 	or	a,(hl)
   44AE 20 04         [12]  240 	jr	NZ,00107$
                            241 ;src/main.c:102: return gladis_atk_dcha;
   44B0 21 2A 51      [10]  242 	ld	hl,#_gladis_atk_dcha
   44B3 C9            [10]  243 	ret
   44B4                     244 00107$:
                            245 ;src/main.c:104: return gladis_atk_izda;
   44B4 21 CA 51      [10]  246 	ld	hl,#_gladis_atk_izda
   44B7 C9            [10]  247 	ret
                            248 ;src/main.c:108: u8* checkSpriteFlecha(u8* dir){
                            249 ;	---------------------------------
                            250 ; Function checkSpriteFlecha
                            251 ; ---------------------------------
   44B8                     252 _checkSpriteFlecha::
                            253 ;src/main.c:109: switch((int)dir){
   44B8 C1            [10]  254 	pop	bc
   44B9 D1            [10]  255 	pop	de
   44BA D5            [11]  256 	push	de
   44BB C5            [11]  257 	push	bc
   44BC CB 7A         [ 8]  258 	bit	7, d
   44BE C0            [11]  259 	ret	NZ
   44BF 3E 03         [ 7]  260 	ld	a,#0x03
   44C1 BB            [ 4]  261 	cp	a, e
   44C2 3E 00         [ 7]  262 	ld	a,#0x00
   44C4 9A            [ 4]  263 	sbc	a, d
   44C5 E2 CA 44      [10]  264 	jp	PO, 00116$
   44C8 EE 80         [ 7]  265 	xor	a, #0x80
   44CA                     266 00116$:
   44CA F8            [11]  267 	ret	M
   44CB 16 00         [ 7]  268 	ld	d,#0x00
   44CD 21 D3 44      [10]  269 	ld	hl,#00117$
   44D0 19            [11]  270 	add	hl,de
   44D1 19            [11]  271 	add	hl,de
                            272 ;src/main.c:110: case 0:
   44D2 E9            [ 4]  273 	jp	(hl)
   44D3                     274 00117$:
   44D3 18 06         [12]  275 	jr	00101$
   44D5 18 08         [12]  276 	jr	00102$
   44D7 18 0A         [12]  277 	jr	00103$
   44D9 18 0C         [12]  278 	jr	00104$
   44DB                     279 00101$:
                            280 ;src/main.c:111: return flecha_dcha;
   44DB 21 EA 50      [10]  281 	ld	hl,#_flecha_dcha
   44DE C9            [10]  282 	ret
                            283 ;src/main.c:113: case 1:
   44DF                     284 00102$:
                            285 ;src/main.c:114: return flecha_izda;
   44DF 21 0A 51      [10]  286 	ld	hl,#_flecha_izda
   44E2 C9            [10]  287 	ret
                            288 ;src/main.c:116: case 2:
   44E3                     289 00103$:
                            290 ;src/main.c:117: return flecha_abajo;
   44E3 21 20 40      [10]  291 	ld	hl,#_flecha_abajo
   44E6 C9            [10]  292 	ret
                            293 ;src/main.c:119: case 3:
   44E7                     294 00104$:
                            295 ;src/main.c:120: return flecha_arriba;
   44E7 21 00 40      [10]  296 	ld	hl,#_flecha_arriba
                            297 ;src/main.c:122: }
   44EA C9            [10]  298 	ret
                            299 ;src/main.c:126: void drawFatiga(u8* atk, u8* memptr, u8 col){
                            300 ;	---------------------------------
                            301 ; Function drawFatiga
                            302 ; ---------------------------------
   44EB                     303 _drawFatiga::
   44EB DD E5         [15]  304 	push	ix
   44ED DD 21 00 00   [14]  305 	ld	ix,#0
   44F1 DD 39         [15]  306 	add	ix,sp
                            307 ;src/main.c:127: if(atk < 20)
   44F3 DD 7E 04      [19]  308 	ld	a,4 (ix)
   44F6 D6 14         [ 7]  309 	sub	a, #0x14
   44F8 DD 7E 05      [19]  310 	ld	a,5 (ix)
   44FB DE 00         [ 7]  311 	sbc	a, #0x00
   44FD 30 04         [12]  312 	jr	NC,00102$
                            313 ;src/main.c:128: col = 2;
   44FF DD 36 08 02   [19]  314 	ld	8 (ix),#0x02
   4503                     315 00102$:
                            316 ;src/main.c:129: if(atk > 30 || atk <= 20){
   4503 3E 14         [ 7]  317 	ld	a,#0x14
   4505 DD BE 04      [19]  318 	cp	a, 4 (ix)
   4508 3E 00         [ 7]  319 	ld	a,#0x00
   450A DD 9E 05      [19]  320 	sbc	a, 5 (ix)
   450D 3E 00         [ 7]  321 	ld	a,#0x00
   450F 17            [ 4]  322 	rla
   4510 57            [ 4]  323 	ld	d,a
   4511 3E 1E         [ 7]  324 	ld	a,#0x1E
   4513 DD BE 04      [19]  325 	cp	a, 4 (ix)
   4516 3E 00         [ 7]  326 	ld	a,#0x00
   4518 DD 9E 05      [19]  327 	sbc	a, 5 (ix)
   451B 38 04         [12]  328 	jr	C,00103$
   451D 7A            [ 4]  329 	ld	a,d
   451E B7            [ 4]  330 	or	a, a
   451F 20 27         [12]  331 	jr	NZ,00104$
   4521                     332 00103$:
                            333 ;src/main.c:130: memptr = cpct_getScreenPtr(VMEM,4,160);
   4521 D5            [11]  334 	push	de
   4522 21 04 A0      [10]  335 	ld	hl,#0xA004
   4525 E5            [11]  336 	push	hl
   4526 21 00 C0      [10]  337 	ld	hl,#0xC000
   4529 E5            [11]  338 	push	hl
   452A CD 27 55      [17]  339 	call	_cpct_getScreenPtr
   452D D1            [10]  340 	pop	de
                            341 ;src/main.c:131: cpct_drawSolidBox(memptr, col, 2, 8);
   452E DD 75 06      [19]  342 	ld	6 (ix),l
   4531 DD 74 07      [19]  343 	ld	7 (ix),h
   4534 4D            [ 4]  344 	ld	c,l
   4535 44            [ 4]  345 	ld	b,h
   4536 D5            [11]  346 	push	de
   4537 21 02 08      [10]  347 	ld	hl,#0x0802
   453A E5            [11]  348 	push	hl
   453B DD 7E 08      [19]  349 	ld	a,8 (ix)
   453E F5            [11]  350 	push	af
   453F 33            [ 6]  351 	inc	sp
   4540 C5            [11]  352 	push	bc
   4541 CD 6F 54      [17]  353 	call	_cpct_drawSolidBox
   4544 F1            [10]  354 	pop	af
   4545 F1            [10]  355 	pop	af
   4546 33            [ 6]  356 	inc	sp
   4547 D1            [10]  357 	pop	de
   4548                     358 00104$:
                            359 ;src/main.c:133: if(atk > 40 || atk <= 20){
   4548 3E 28         [ 7]  360 	ld	a,#0x28
   454A DD BE 04      [19]  361 	cp	a, 4 (ix)
   454D 3E 00         [ 7]  362 	ld	a,#0x00
   454F DD 9E 05      [19]  363 	sbc	a, 5 (ix)
   4552 38 04         [12]  364 	jr	C,00106$
   4554 7A            [ 4]  365 	ld	a,d
   4555 B7            [ 4]  366 	or	a, a
   4556 20 27         [12]  367 	jr	NZ,00107$
   4558                     368 00106$:
                            369 ;src/main.c:134: memptr = cpct_getScreenPtr(VMEM,7,160);
   4558 D5            [11]  370 	push	de
   4559 21 07 A0      [10]  371 	ld	hl,#0xA007
   455C E5            [11]  372 	push	hl
   455D 21 00 C0      [10]  373 	ld	hl,#0xC000
   4560 E5            [11]  374 	push	hl
   4561 CD 27 55      [17]  375 	call	_cpct_getScreenPtr
   4564 D1            [10]  376 	pop	de
                            377 ;src/main.c:135: cpct_drawSolidBox(memptr, col, 2, 8);
   4565 DD 75 06      [19]  378 	ld	6 (ix),l
   4568 DD 74 07      [19]  379 	ld	7 (ix),h
   456B 4D            [ 4]  380 	ld	c,l
   456C 44            [ 4]  381 	ld	b,h
   456D D5            [11]  382 	push	de
   456E 21 02 08      [10]  383 	ld	hl,#0x0802
   4571 E5            [11]  384 	push	hl
   4572 DD 7E 08      [19]  385 	ld	a,8 (ix)
   4575 F5            [11]  386 	push	af
   4576 33            [ 6]  387 	inc	sp
   4577 C5            [11]  388 	push	bc
   4578 CD 6F 54      [17]  389 	call	_cpct_drawSolidBox
   457B F1            [10]  390 	pop	af
   457C F1            [10]  391 	pop	af
   457D 33            [ 6]  392 	inc	sp
   457E D1            [10]  393 	pop	de
   457F                     394 00107$:
                            395 ;src/main.c:137: if(atk <= 20){
   457F 7A            [ 4]  396 	ld	a,d
   4580 B7            [ 4]  397 	or	a, a
   4581 20 22         [12]  398 	jr	NZ,00111$
                            399 ;src/main.c:138: memptr = cpct_getScreenPtr(VMEM,10,160);
   4583 21 0A A0      [10]  400 	ld	hl,#0xA00A
   4586 E5            [11]  401 	push	hl
   4587 21 00 C0      [10]  402 	ld	hl,#0xC000
   458A E5            [11]  403 	push	hl
   458B CD 27 55      [17]  404 	call	_cpct_getScreenPtr
                            405 ;src/main.c:139: cpct_drawSolidBox(memptr, col, 2, 8);
   458E DD 75 06      [19]  406 	ld	6 (ix),l
   4591 DD 74 07      [19]  407 	ld	7 (ix),h
   4594 EB            [ 4]  408 	ex	de,hl
   4595 21 02 08      [10]  409 	ld	hl,#0x0802
   4598 E5            [11]  410 	push	hl
   4599 DD 7E 08      [19]  411 	ld	a,8 (ix)
   459C F5            [11]  412 	push	af
   459D 33            [ 6]  413 	inc	sp
   459E D5            [11]  414 	push	de
   459F CD 6F 54      [17]  415 	call	_cpct_drawSolidBox
   45A2 F1            [10]  416 	pop	af
   45A3 F1            [10]  417 	pop	af
   45A4 33            [ 6]  418 	inc	sp
   45A5                     419 00111$:
   45A5 DD E1         [14]  420 	pop	ix
   45A7 C9            [10]  421 	ret
                            422 ;src/main.c:144: void drawVida(u8* life, u8* memptr){
                            423 ;	---------------------------------
                            424 ; Function drawVida
                            425 ; ---------------------------------
   45A8                     426 _drawVida::
   45A8 DD E5         [15]  427 	push	ix
   45AA DD 21 00 00   [14]  428 	ld	ix,#0
   45AE DD 39         [15]  429 	add	ix,sp
                            430 ;src/main.c:145: if(life >= 1){
   45B0 DD 7E 04      [19]  431 	ld	a,4 (ix)
   45B3 D6 01         [ 7]  432 	sub	a, #0x01
   45B5 DD 7E 05      [19]  433 	ld	a,5 (ix)
   45B8 DE 00         [ 7]  434 	sbc	a, #0x00
   45BA 38 1F         [12]  435 	jr	C,00102$
                            436 ;src/main.c:146: memptr = cpct_getScreenPtr(VMEM,55,160);
   45BC 21 37 A0      [10]  437 	ld	hl,#0xA037
   45BF E5            [11]  438 	push	hl
   45C0 21 00 C0      [10]  439 	ld	hl,#0xC000
   45C3 E5            [11]  440 	push	hl
   45C4 CD 27 55      [17]  441 	call	_cpct_getScreenPtr
                            442 ;src/main.c:147: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   45C7 DD 75 06      [19]  443 	ld	6 (ix),l
   45CA DD 74 07      [19]  444 	ld	7 (ix),h
   45CD 4D            [ 4]  445 	ld	c,l
   45CE 44            [ 4]  446 	ld	b,h
   45CF 11 44 43      [10]  447 	ld	de,#_corazon_lleno
   45D2 21 04 08      [10]  448 	ld	hl,#0x0804
   45D5 E5            [11]  449 	push	hl
   45D6 C5            [11]  450 	push	bc
   45D7 D5            [11]  451 	push	de
   45D8 CD E9 53      [17]  452 	call	_cpct_drawSpriteMasked
   45DB                     453 00102$:
                            454 ;src/main.c:149: memptr = cpct_getScreenPtr(VMEM,60,160);
   45DB 21 3C A0      [10]  455 	ld	hl,#0xA03C
   45DE E5            [11]  456 	push	hl
   45DF 21 00 C0      [10]  457 	ld	hl,#0xC000
   45E2 E5            [11]  458 	push	hl
   45E3 CD 27 55      [17]  459 	call	_cpct_getScreenPtr
                            460 ;src/main.c:147: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   45E6 DD 75 06      [19]  461 	ld	6 (ix),l
   45E9 DD 74 07      [19]  462 	ld	7 (ix),h
   45EC 4D            [ 4]  463 	ld	c,l
   45ED 44            [ 4]  464 	ld	b,h
                            465 ;src/main.c:150: if(life >= 2)
   45EE DD 7E 04      [19]  466 	ld	a,4 (ix)
   45F1 D6 02         [ 7]  467 	sub	a, #0x02
   45F3 DD 7E 05      [19]  468 	ld	a,5 (ix)
   45F6 DE 00         [ 7]  469 	sbc	a, #0x00
   45F8 38 0E         [12]  470 	jr	C,00104$
                            471 ;src/main.c:151: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   45FA 11 44 43      [10]  472 	ld	de,#_corazon_lleno
   45FD 21 04 08      [10]  473 	ld	hl,#0x0804
   4600 E5            [11]  474 	push	hl
   4601 C5            [11]  475 	push	bc
   4602 D5            [11]  476 	push	de
   4603 CD E9 53      [17]  477 	call	_cpct_drawSpriteMasked
   4606 18 0C         [12]  478 	jr	00105$
   4608                     479 00104$:
                            480 ;src/main.c:153: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4608 11 84 43      [10]  481 	ld	de,#_corazon_roto
   460B 21 04 08      [10]  482 	ld	hl,#0x0804
   460E E5            [11]  483 	push	hl
   460F C5            [11]  484 	push	bc
   4610 D5            [11]  485 	push	de
   4611 CD E9 53      [17]  486 	call	_cpct_drawSpriteMasked
   4614                     487 00105$:
                            488 ;src/main.c:154: memptr = cpct_getScreenPtr(VMEM,65,160);
   4614 21 41 A0      [10]  489 	ld	hl,#0xA041
   4617 E5            [11]  490 	push	hl
   4618 21 00 C0      [10]  491 	ld	hl,#0xC000
   461B E5            [11]  492 	push	hl
   461C CD 27 55      [17]  493 	call	_cpct_getScreenPtr
                            494 ;src/main.c:147: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   461F DD 75 06      [19]  495 	ld	6 (ix),l
   4622 DD 74 07      [19]  496 	ld	7 (ix),h
   4625 EB            [ 4]  497 	ex	de,hl
                            498 ;src/main.c:155: if(life >= 3)
   4626 DD 7E 04      [19]  499 	ld	a,4 (ix)
   4629 D6 03         [ 7]  500 	sub	a, #0x03
   462B DD 7E 05      [19]  501 	ld	a,5 (ix)
   462E DE 00         [ 7]  502 	sbc	a, #0x00
   4630 38 0E         [12]  503 	jr	C,00107$
                            504 ;src/main.c:156: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4632 01 44 43      [10]  505 	ld	bc,#_corazon_lleno
   4635 21 04 08      [10]  506 	ld	hl,#0x0804
   4638 E5            [11]  507 	push	hl
   4639 D5            [11]  508 	push	de
   463A C5            [11]  509 	push	bc
   463B CD E9 53      [17]  510 	call	_cpct_drawSpriteMasked
   463E 18 0C         [12]  511 	jr	00109$
   4640                     512 00107$:
                            513 ;src/main.c:158: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4640 01 84 43      [10]  514 	ld	bc,#_corazon_roto+0
   4643 21 04 08      [10]  515 	ld	hl,#0x0804
   4646 E5            [11]  516 	push	hl
   4647 D5            [11]  517 	push	de
   4648 C5            [11]  518 	push	bc
   4649 CD E9 53      [17]  519 	call	_cpct_drawSpriteMasked
   464C                     520 00109$:
   464C DD E1         [14]  521 	pop	ix
   464E C9            [10]  522 	ret
                            523 ;src/main.c:164: void game(){
                            524 ;	---------------------------------
                            525 ; Function game
                            526 ; ---------------------------------
   464F                     527 _game::
   464F DD E5         [15]  528 	push	ix
   4651 DD 21 00 00   [14]  529 	ld	ix,#0
   4655 DD 39         [15]  530 	add	ix,sp
   4657 21 B1 FF      [10]  531 	ld	hl,#-79
   465A 39            [11]  532 	add	hl,sp
   465B F9            [ 6]  533 	ld	sp,hl
                            534 ;src/main.c:165: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
   465C 21 0A 00      [10]  535 	ld	hl,#0x000A
   465F 39            [11]  536 	add	hl,sp
   4660 36 00         [10]  537 	ld	(hl),#0x00
   4662 21 0A 00      [10]  538 	ld	hl,#0x000A
   4665 39            [11]  539 	add	hl,sp
   4666 DD 75 E5      [19]  540 	ld	-27 (ix),l
   4669 DD 74 E6      [19]  541 	ld	-26 (ix),h
   466C DD 7E E5      [19]  542 	ld	a,-27 (ix)
   466F C6 01         [ 7]  543 	add	a, #0x01
   4671 DD 77 FA      [19]  544 	ld	-6 (ix),a
   4674 DD 7E E6      [19]  545 	ld	a,-26 (ix)
   4677 CE 00         [ 7]  546 	adc	a, #0x00
   4679 DD 77 FB      [19]  547 	ld	-5 (ix),a
   467C DD 6E FA      [19]  548 	ld	l,-6 (ix)
   467F DD 66 FB      [19]  549 	ld	h,-5 (ix)
   4682 36 64         [10]  550 	ld	(hl),#0x64
   4684 DD 7E E5      [19]  551 	ld	a,-27 (ix)
   4687 C6 02         [ 7]  552 	add	a, #0x02
   4689 DD 77 FC      [19]  553 	ld	-4 (ix),a
   468C DD 7E E6      [19]  554 	ld	a,-26 (ix)
   468F CE 00         [ 7]  555 	adc	a, #0x00
   4691 DD 77 FD      [19]  556 	ld	-3 (ix),a
   4694 DD 6E FC      [19]  557 	ld	l,-4 (ix)
   4697 DD 66 FD      [19]  558 	ld	h,-3 (ix)
   469A 36 00         [10]  559 	ld	(hl),#0x00
   469C DD 7E E5      [19]  560 	ld	a,-27 (ix)
   469F C6 03         [ 7]  561 	add	a, #0x03
   46A1 DD 77 FE      [19]  562 	ld	-2 (ix),a
   46A4 DD 7E E6      [19]  563 	ld	a,-26 (ix)
   46A7 CE 00         [ 7]  564 	adc	a, #0x00
   46A9 DD 77 FF      [19]  565 	ld	-1 (ix),a
   46AC DD 6E FE      [19]  566 	ld	l,-2 (ix)
   46AF DD 66 FF      [19]  567 	ld	h,-1 (ix)
   46B2 36 64         [10]  568 	ld	(hl),#0x64
   46B4 DD 7E E5      [19]  569 	ld	a,-27 (ix)
   46B7 C6 04         [ 7]  570 	add	a, #0x04
   46B9 DD 77 E3      [19]  571 	ld	-29 (ix),a
   46BC DD 7E E6      [19]  572 	ld	a,-26 (ix)
   46BF CE 00         [ 7]  573 	adc	a, #0x00
   46C1 DD 77 E4      [19]  574 	ld	-28 (ix),a
   46C4 DD 6E E3      [19]  575 	ld	l,-29 (ix)
   46C7 DD 66 E4      [19]  576 	ld	h,-28 (ix)
   46CA 36 14         [10]  577 	ld	(hl),#0x14
   46CC 23            [ 6]  578 	inc	hl
   46CD 36 00         [10]  579 	ld	(hl),#0x00
   46CF DD 7E E5      [19]  580 	ld	a,-27 (ix)
   46D2 C6 06         [ 7]  581 	add	a, #0x06
   46D4 DD 77 E1      [19]  582 	ld	-31 (ix),a
   46D7 DD 7E E6      [19]  583 	ld	a,-26 (ix)
   46DA CE 00         [ 7]  584 	adc	a, #0x00
   46DC DD 77 E2      [19]  585 	ld	-30 (ix),a
   46DF DD 6E E1      [19]  586 	ld	l,-31 (ix)
   46E2 DD 66 E2      [19]  587 	ld	h,-30 (ix)
   46E5 36 14         [10]  588 	ld	(hl),#0x14
   46E7 23            [ 6]  589 	inc	hl
   46E8 36 00         [10]  590 	ld	(hl),#0x00
   46EA DD 7E E5      [19]  591 	ld	a,-27 (ix)
   46ED C6 08         [ 7]  592 	add	a, #0x08
   46EF DD 77 DF      [19]  593 	ld	-33 (ix),a
   46F2 DD 7E E6      [19]  594 	ld	a,-26 (ix)
   46F5 CE 00         [ 7]  595 	adc	a, #0x00
   46F7 DD 77 E0      [19]  596 	ld	-32 (ix),a
   46FA DD 6E DF      [19]  597 	ld	l,-33 (ix)
   46FD DD 66 E0      [19]  598 	ld	h,-32 (ix)
   4700 AF            [ 4]  599 	xor	a, a
   4701 77            [ 7]  600 	ld	(hl), a
   4702 23            [ 6]  601 	inc	hl
   4703 77            [ 7]  602 	ld	(hl), a
   4704 DD 7E E5      [19]  603 	ld	a,-27 (ix)
   4707 C6 0A         [ 7]  604 	add	a, #0x0A
   4709 DD 77 DD      [19]  605 	ld	-35 (ix),a
   470C DD 7E E6      [19]  606 	ld	a,-26 (ix)
   470F CE 00         [ 7]  607 	adc	a, #0x00
   4711 DD 77 DE      [19]  608 	ld	-34 (ix),a
   4714 DD 6E DD      [19]  609 	ld	l,-35 (ix)
   4717 DD 66 DE      [19]  610 	ld	h,-34 (ix)
   471A AF            [ 4]  611 	xor	a, a
   471B 77            [ 7]  612 	ld	(hl), a
   471C 23            [ 6]  613 	inc	hl
   471D 77            [ 7]  614 	ld	(hl), a
   471E DD 7E E5      [19]  615 	ld	a,-27 (ix)
   4721 C6 0C         [ 7]  616 	add	a, #0x0C
   4723 DD 77 DB      [19]  617 	ld	-37 (ix),a
   4726 DD 7E E6      [19]  618 	ld	a,-26 (ix)
   4729 CE 00         [ 7]  619 	adc	a, #0x00
   472B DD 77 DC      [19]  620 	ld	-36 (ix),a
   472E DD 6E DB      [19]  621 	ld	l,-37 (ix)
   4731 DD 66 DC      [19]  622 	ld	h,-36 (ix)
   4734 36 06         [10]  623 	ld	(hl),#0x06
   4736 23            [ 6]  624 	inc	hl
   4737 36 00         [10]  625 	ld	(hl),#0x00
   4739 DD 7E E5      [19]  626 	ld	a,-27 (ix)
   473C C6 0E         [ 7]  627 	add	a, #0x0E
   473E DD 77 D9      [19]  628 	ld	-39 (ix),a
   4741 DD 7E E6      [19]  629 	ld	a,-26 (ix)
   4744 CE 00         [ 7]  630 	adc	a, #0x00
   4746 DD 77 DA      [19]  631 	ld	-38 (ix),a
   4749 DD 6E D9      [19]  632 	ld	l,-39 (ix)
   474C DD 66 DA      [19]  633 	ld	h,-38 (ix)
   474F 36 03         [10]  634 	ld	(hl),#0x03
   4751 23            [ 6]  635 	inc	hl
   4752 36 00         [10]  636 	ld	(hl),#0x00
                            637 ;src/main.c:166: TEnemy  e = { 55,100,55,100,0,0 };
   4754 21 1A 00      [10]  638 	ld	hl,#0x001A
   4757 39            [11]  639 	add	hl,sp
   4758 36 37         [10]  640 	ld	(hl),#0x37
   475A 21 1A 00      [10]  641 	ld	hl,#0x001A
   475D 39            [11]  642 	add	hl,sp
   475E DD 75 D7      [19]  643 	ld	-41 (ix),l
   4761 DD 74 D8      [19]  644 	ld	-40 (ix),h
   4764 DD 7E D7      [19]  645 	ld	a,-41 (ix)
   4767 C6 01         [ 7]  646 	add	a, #0x01
   4769 DD 77 D5      [19]  647 	ld	-43 (ix),a
   476C DD 7E D8      [19]  648 	ld	a,-40 (ix)
   476F CE 00         [ 7]  649 	adc	a, #0x00
   4771 DD 77 D6      [19]  650 	ld	-42 (ix),a
   4774 DD 6E D5      [19]  651 	ld	l,-43 (ix)
   4777 DD 66 D6      [19]  652 	ld	h,-42 (ix)
   477A 36 64         [10]  653 	ld	(hl),#0x64
   477C DD 6E D7      [19]  654 	ld	l,-41 (ix)
   477F DD 66 D8      [19]  655 	ld	h,-40 (ix)
   4782 23            [ 6]  656 	inc	hl
   4783 23            [ 6]  657 	inc	hl
   4784 36 37         [10]  658 	ld	(hl),#0x37
   4786 DD 6E D7      [19]  659 	ld	l,-41 (ix)
   4789 DD 66 D8      [19]  660 	ld	h,-40 (ix)
   478C 23            [ 6]  661 	inc	hl
   478D 23            [ 6]  662 	inc	hl
   478E 23            [ 6]  663 	inc	hl
   478F 36 64         [10]  664 	ld	(hl),#0x64
   4791 DD 7E D7      [19]  665 	ld	a,-41 (ix)
   4794 C6 04         [ 7]  666 	add	a, #0x04
   4796 DD 77 D3      [19]  667 	ld	-45 (ix),a
   4799 DD 7E D8      [19]  668 	ld	a,-40 (ix)
   479C CE 00         [ 7]  669 	adc	a, #0x00
   479E DD 77 D4      [19]  670 	ld	-44 (ix),a
   47A1 DD 6E D3      [19]  671 	ld	l,-45 (ix)
   47A4 DD 66 D4      [19]  672 	ld	h,-44 (ix)
   47A7 AF            [ 4]  673 	xor	a, a
   47A8 77            [ 7]  674 	ld	(hl), a
   47A9 23            [ 6]  675 	inc	hl
   47AA 77            [ 7]  676 	ld	(hl), a
   47AB DD 7E D7      [19]  677 	ld	a,-41 (ix)
   47AE C6 06         [ 7]  678 	add	a, #0x06
   47B0 6F            [ 4]  679 	ld	l,a
   47B1 DD 7E D8      [19]  680 	ld	a,-40 (ix)
   47B4 CE 00         [ 7]  681 	adc	a, #0x00
   47B6 67            [ 4]  682 	ld	h,a
   47B7 AF            [ 4]  683 	xor	a, a
   47B8 77            [ 7]  684 	ld	(hl), a
   47B9 23            [ 6]  685 	inc	hl
   47BA 77            [ 7]  686 	ld	(hl), a
                            687 ;src/main.c:167: TEnemy pr = { 0,0,0,0,1,0 };
   47BB 21 02 00      [10]  688 	ld	hl,#0x0002
   47BE 39            [11]  689 	add	hl,sp
   47BF 36 00         [10]  690 	ld	(hl),#0x00
   47C1 21 02 00      [10]  691 	ld	hl,#0x0002
   47C4 39            [11]  692 	add	hl,sp
   47C5 DD 75 F8      [19]  693 	ld	-8 (ix),l
   47C8 DD 74 F9      [19]  694 	ld	-7 (ix),h
   47CB DD 7E F8      [19]  695 	ld	a,-8 (ix)
   47CE C6 01         [ 7]  696 	add	a, #0x01
   47D0 DD 77 F6      [19]  697 	ld	-10 (ix),a
   47D3 DD 7E F9      [19]  698 	ld	a,-7 (ix)
   47D6 CE 00         [ 7]  699 	adc	a, #0x00
   47D8 DD 77 F7      [19]  700 	ld	-9 (ix),a
   47DB DD 6E F6      [19]  701 	ld	l,-10 (ix)
   47DE DD 66 F7      [19]  702 	ld	h,-9 (ix)
   47E1 36 00         [10]  703 	ld	(hl),#0x00
   47E3 DD 7E F8      [19]  704 	ld	a,-8 (ix)
   47E6 C6 02         [ 7]  705 	add	a, #0x02
   47E8 DD 77 F4      [19]  706 	ld	-12 (ix),a
   47EB DD 7E F9      [19]  707 	ld	a,-7 (ix)
   47EE CE 00         [ 7]  708 	adc	a, #0x00
   47F0 DD 77 F5      [19]  709 	ld	-11 (ix),a
   47F3 DD 6E F4      [19]  710 	ld	l,-12 (ix)
   47F6 DD 66 F5      [19]  711 	ld	h,-11 (ix)
   47F9 36 00         [10]  712 	ld	(hl),#0x00
   47FB DD 7E F8      [19]  713 	ld	a,-8 (ix)
   47FE C6 03         [ 7]  714 	add	a, #0x03
   4800 DD 77 F2      [19]  715 	ld	-14 (ix),a
   4803 DD 7E F9      [19]  716 	ld	a,-7 (ix)
   4806 CE 00         [ 7]  717 	adc	a, #0x00
   4808 DD 77 F3      [19]  718 	ld	-13 (ix),a
   480B DD 6E F2      [19]  719 	ld	l,-14 (ix)
   480E DD 66 F3      [19]  720 	ld	h,-13 (ix)
   4811 36 00         [10]  721 	ld	(hl),#0x00
   4813 DD 7E F8      [19]  722 	ld	a,-8 (ix)
   4816 C6 04         [ 7]  723 	add	a, #0x04
   4818 DD 77 F0      [19]  724 	ld	-16 (ix),a
   481B DD 7E F9      [19]  725 	ld	a,-7 (ix)
   481E CE 00         [ 7]  726 	adc	a, #0x00
   4820 DD 77 F1      [19]  727 	ld	-15 (ix),a
   4823 DD 6E F0      [19]  728 	ld	l,-16 (ix)
   4826 DD 66 F1      [19]  729 	ld	h,-15 (ix)
   4829 36 01         [10]  730 	ld	(hl),#0x01
   482B 23            [ 6]  731 	inc	hl
   482C 36 00         [10]  732 	ld	(hl),#0x00
   482E DD 7E F8      [19]  733 	ld	a,-8 (ix)
   4831 C6 06         [ 7]  734 	add	a, #0x06
   4833 DD 77 EE      [19]  735 	ld	-18 (ix),a
   4836 DD 7E F9      [19]  736 	ld	a,-7 (ix)
   4839 CE 00         [ 7]  737 	adc	a, #0x00
   483B DD 77 EF      [19]  738 	ld	-17 (ix),a
   483E DD 6E EE      [19]  739 	ld	l,-18 (ix)
   4841 DD 66 EF      [19]  740 	ld	h,-17 (ix)
   4844 36 00         [10]  741 	ld	(hl),#0x00
   4846 23            [ 6]  742 	inc	hl
   4847 36 00         [10]  743 	ld	(hl),#0x00
                            744 ;src/main.c:169: u8* sprite = gladis_quieto_dcha;
   4849 DD 36 B1 40   [19]  745 	ld	-79 (ix),#<(_gladis_quieto_dcha)
   484D DD 36 B2 42   [19]  746 	ld	-78 (ix),#>(_gladis_quieto_dcha)
                            747 ;src/main.c:172: cpct_clearScreen(0);
   4851 21 00 40      [10]  748 	ld	hl,#0x4000
   4854 E5            [11]  749 	push	hl
   4855 AF            [ 4]  750 	xor	a, a
   4856 F5            [11]  751 	push	af
   4857 33            [ 6]  752 	inc	sp
   4858 26 C0         [ 7]  753 	ld	h, #0xC0
   485A E5            [11]  754 	push	hl
   485B CD 4D 54      [17]  755 	call	_cpct_memset
                            756 ;src/main.c:174: while (1){
   485E                     757 00198$:
                            758 ;src/main.c:177: cpct_waitVSYNC();
   485E CD 33 54      [17]  759 	call	_cpct_waitVSYNC
                            760 ;src/main.c:180: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
   4861 DD 6E FE      [19]  761 	ld	l,-2 (ix)
   4864 DD 66 FF      [19]  762 	ld	h,-1 (ix)
   4867 46            [ 7]  763 	ld	b,(hl)
   4868 DD 6E FC      [19]  764 	ld	l,-4 (ix)
   486B DD 66 FD      [19]  765 	ld	h,-3 (ix)
   486E 4E            [ 7]  766 	ld	c, (hl)
   486F C5            [11]  767 	push	bc
   4870 21 00 C0      [10]  768 	ld	hl,#0xC000
   4873 E5            [11]  769 	push	hl
   4874 CD 27 55      [17]  770 	call	_cpct_getScreenPtr
   4877 EB            [ 4]  771 	ex	de,hl
                            772 ;src/main.c:181: if(p.prevAtk <= 20)
   4878 DD 6E E1      [19]  773 	ld	l,-31 (ix)
   487B DD 66 E2      [19]  774 	ld	h,-30 (ix)
   487E 46            [ 7]  775 	ld	b,(hl)
   487F 23            [ 6]  776 	inc	hl
   4880 66            [ 7]  777 	ld	h,(hl)
                            778 ;src/main.c:182: cpct_drawSolidBox(memptr,0,4,16);
                            779 ;src/main.c:181: if(p.prevAtk <= 20)
   4881 3E 14         [ 7]  780 	ld	a,#0x14
   4883 B8            [ 4]  781 	cp	a, b
   4884 3E 00         [ 7]  782 	ld	a,#0x00
   4886 9C            [ 4]  783 	sbc	a, h
   4887 38 10         [12]  784 	jr	C,00102$
                            785 ;src/main.c:182: cpct_drawSolidBox(memptr,0,4,16);
   4889 21 04 10      [10]  786 	ld	hl,#0x1004
   488C E5            [11]  787 	push	hl
   488D AF            [ 4]  788 	xor	a, a
   488E F5            [11]  789 	push	af
   488F 33            [ 6]  790 	inc	sp
   4890 D5            [11]  791 	push	de
   4891 CD 6F 54      [17]  792 	call	_cpct_drawSolidBox
   4894 F1            [10]  793 	pop	af
   4895 F1            [10]  794 	pop	af
   4896 33            [ 6]  795 	inc	sp
   4897 18 0E         [12]  796 	jr	00103$
   4899                     797 00102$:
                            798 ;src/main.c:184: cpct_drawSolidBox(memptr,0,5,16);
   4899 21 05 10      [10]  799 	ld	hl,#0x1005
   489C E5            [11]  800 	push	hl
   489D AF            [ 4]  801 	xor	a, a
   489E F5            [11]  802 	push	af
   489F 33            [ 6]  803 	inc	sp
   48A0 D5            [11]  804 	push	de
   48A1 CD 6F 54      [17]  805 	call	_cpct_drawSolidBox
   48A4 F1            [10]  806 	pop	af
   48A5 F1            [10]  807 	pop	af
   48A6 33            [ 6]  808 	inc	sp
   48A7                     809 00103$:
                            810 ;src/main.c:186: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   48A7 DD 6E FA      [19]  811 	ld	l,-6 (ix)
   48AA DD 66 FB      [19]  812 	ld	h,-5 (ix)
   48AD 46            [ 7]  813 	ld	b,(hl)
   48AE DD 6E E5      [19]  814 	ld	l,-27 (ix)
   48B1 DD 66 E6      [19]  815 	ld	h,-26 (ix)
   48B4 4E            [ 7]  816 	ld	c, (hl)
   48B5 C5            [11]  817 	push	bc
   48B6 21 00 C0      [10]  818 	ld	hl,#0xC000
   48B9 E5            [11]  819 	push	hl
   48BA CD 27 55      [17]  820 	call	_cpct_getScreenPtr
   48BD 4D            [ 4]  821 	ld	c, l
   48BE 44            [ 4]  822 	ld	b, h
                            823 ;src/main.c:188: if(p.atk >= 21)
   48BF DD 6E E3      [19]  824 	ld	l,-29 (ix)
   48C2 DD 66 E4      [19]  825 	ld	h,-28 (ix)
   48C5 7E            [ 7]  826 	ld	a, (hl)
   48C6 23            [ 6]  827 	inc	hl
   48C7 6E            [ 7]  828 	ld	l,(hl)
   48C8 67            [ 4]  829 	ld	h,a
                            830 ;src/main.c:182: cpct_drawSolidBox(memptr,0,4,16);
                            831 ;src/main.c:189: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   48C9 D1            [10]  832 	pop	de
   48CA D5            [11]  833 	push	de
                            834 ;src/main.c:188: if(p.atk >= 21)
   48CB 7C            [ 4]  835 	ld	a,h
   48CC D6 15         [ 7]  836 	sub	a, #0x15
   48CE 7D            [ 4]  837 	ld	a,l
   48CF DE 00         [ 7]  838 	sbc	a, #0x00
   48D1 38 0B         [12]  839 	jr	C,00105$
                            840 ;src/main.c:189: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   48D3 21 05 10      [10]  841 	ld	hl,#0x1005
   48D6 E5            [11]  842 	push	hl
   48D7 C5            [11]  843 	push	bc
   48D8 D5            [11]  844 	push	de
   48D9 CD E9 53      [17]  845 	call	_cpct_drawSpriteMasked
   48DC 18 09         [12]  846 	jr	00106$
   48DE                     847 00105$:
                            848 ;src/main.c:191: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   48DE 21 04 10      [10]  849 	ld	hl,#0x1004
   48E1 E5            [11]  850 	push	hl
   48E2 C5            [11]  851 	push	bc
   48E3 D5            [11]  852 	push	de
   48E4 CD E9 53      [17]  853 	call	_cpct_drawSpriteMasked
   48E7                     854 00106$:
                            855 ;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,60,160);
   48E7 21 3C A0      [10]  856 	ld	hl,#0xA03C
   48EA E5            [11]  857 	push	hl
   48EB 21 00 C0      [10]  858 	ld	hl,#0xC000
   48EE E5            [11]  859 	push	hl
   48EF CD 27 55      [17]  860 	call	_cpct_getScreenPtr
   48F2 4D            [ 4]  861 	ld	c, l
   48F3 44            [ 4]  862 	ld	b, h
                            863 ;src/main.c:195: cpct_drawSolidBox(memptr,0,10,16);
   48F4 59            [ 4]  864 	ld	e, c
   48F5 50            [ 4]  865 	ld	d, b
   48F6 C5            [11]  866 	push	bc
   48F7 21 0A 10      [10]  867 	ld	hl,#0x100A
   48FA E5            [11]  868 	push	hl
   48FB AF            [ 4]  869 	xor	a, a
   48FC F5            [11]  870 	push	af
   48FD 33            [ 6]  871 	inc	sp
   48FE D5            [11]  872 	push	de
   48FF CD 6F 54      [17]  873 	call	_cpct_drawSolidBox
   4902 F1            [10]  874 	pop	af
   4903 F1            [10]  875 	pop	af
   4904 33            [ 6]  876 	inc	sp
   4905 C1            [10]  877 	pop	bc
                            878 ;src/main.c:197: drawVida(p.life, memptr);
   4906 DD 6E D9      [19]  879 	ld	l,-39 (ix)
   4909 DD 66 DA      [19]  880 	ld	h,-38 (ix)
   490C 5E            [ 7]  881 	ld	e,(hl)
   490D 23            [ 6]  882 	inc	hl
   490E 56            [ 7]  883 	ld	d,(hl)
   490F C5            [11]  884 	push	bc
   4910 D5            [11]  885 	push	de
   4911 CD A8 45      [17]  886 	call	_drawVida
   4914 F1            [10]  887 	pop	af
   4915 F1            [10]  888 	pop	af
                            889 ;src/main.c:200: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4916 DD 6E D5      [19]  890 	ld	l,-43 (ix)
   4919 DD 66 D6      [19]  891 	ld	h,-42 (ix)
   491C 46            [ 7]  892 	ld	b,(hl)
   491D DD 6E D7      [19]  893 	ld	l,-41 (ix)
   4920 DD 66 D8      [19]  894 	ld	h,-40 (ix)
   4923 4E            [ 7]  895 	ld	c, (hl)
   4924 C5            [11]  896 	push	bc
   4925 21 00 C0      [10]  897 	ld	hl,#0xC000
   4928 E5            [11]  898 	push	hl
   4929 CD 27 55      [17]  899 	call	_cpct_getScreenPtr
                            900 ;src/main.c:201: cpct_drawSolidBox(memptr,0,4,16);
   492C EB            [ 4]  901 	ex	de,hl
   492D 21 04 10      [10]  902 	ld	hl,#0x1004
   4930 E5            [11]  903 	push	hl
   4931 AF            [ 4]  904 	xor	a, a
   4932 F5            [11]  905 	push	af
   4933 33            [ 6]  906 	inc	sp
   4934 D5            [11]  907 	push	de
   4935 CD 6F 54      [17]  908 	call	_cpct_drawSolidBox
   4938 F1            [10]  909 	pop	af
   4939 F1            [10]  910 	pop	af
   493A 33            [ 6]  911 	inc	sp
                            912 ;src/main.c:203: if(e.vivo == 0){
   493B DD 6E D3      [19]  913 	ld	l,-45 (ix)
   493E DD 66 D4      [19]  914 	ld	h,-44 (ix)
   4941 4E            [ 7]  915 	ld	c,(hl)
   4942 23            [ 6]  916 	inc	hl
   4943 7E            [ 7]  917 	ld	a, (hl)
   4944 B1            [ 4]  918 	or	a,c
   4945 20 26         [12]  919 	jr	NZ,00108$
                            920 ;src/main.c:204: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4947 DD 6E D5      [19]  921 	ld	l,-43 (ix)
   494A DD 66 D6      [19]  922 	ld	h,-42 (ix)
   494D 46            [ 7]  923 	ld	b,(hl)
   494E DD 6E D7      [19]  924 	ld	l,-41 (ix)
   4951 DD 66 D8      [19]  925 	ld	h,-40 (ix)
   4954 4E            [ 7]  926 	ld	c, (hl)
   4955 C5            [11]  927 	push	bc
   4956 21 00 C0      [10]  928 	ld	hl,#0xC000
   4959 E5            [11]  929 	push	hl
   495A CD 27 55      [17]  930 	call	_cpct_getScreenPtr
                            931 ;src/main.c:205: cpct_drawSolidBox(memptr, 18, 4, 16);
   495D EB            [ 4]  932 	ex	de,hl
   495E 21 04 10      [10]  933 	ld	hl,#0x1004
   4961 E5            [11]  934 	push	hl
   4962 3E 12         [ 7]  935 	ld	a,#0x12
   4964 F5            [11]  936 	push	af
   4965 33            [ 6]  937 	inc	sp
   4966 D5            [11]  938 	push	de
   4967 CD 6F 54      [17]  939 	call	_cpct_drawSolidBox
   496A F1            [10]  940 	pop	af
   496B F1            [10]  941 	pop	af
   496C 33            [ 6]  942 	inc	sp
   496D                     943 00108$:
                            944 ;src/main.c:209: memptr = cpct_getScreenPtr(VMEM,pr.prevX,pr.prevY);
   496D DD 6E F2      [19]  945 	ld	l,-14 (ix)
   4970 DD 66 F3      [19]  946 	ld	h,-13 (ix)
   4973 46            [ 7]  947 	ld	b,(hl)
   4974 DD 6E F4      [19]  948 	ld	l,-12 (ix)
   4977 DD 66 F5      [19]  949 	ld	h,-11 (ix)
   497A 4E            [ 7]  950 	ld	c, (hl)
   497B C5            [11]  951 	push	bc
   497C 21 00 C0      [10]  952 	ld	hl,#0xC000
   497F E5            [11]  953 	push	hl
   4980 CD 27 55      [17]  954 	call	_cpct_getScreenPtr
   4983 DD 75 EC      [19]  955 	ld	-20 (ix),l
   4986 DD 74 ED      [19]  956 	ld	-19 (ix),h
                            957 ;src/main.c:210: if((int)pr.dir < 2)
   4989 DD 6E EE      [19]  958 	ld	l,-18 (ix)
   498C DD 66 EF      [19]  959 	ld	h,-17 (ix)
   498F 4E            [ 7]  960 	ld	c,(hl)
   4990 23            [ 6]  961 	inc	hl
   4991 46            [ 7]  962 	ld	b,(hl)
                            963 ;src/main.c:182: cpct_drawSolidBox(memptr,0,4,16);
   4992 DD 5E EC      [19]  964 	ld	e,-20 (ix)
   4995 DD 56 ED      [19]  965 	ld	d,-19 (ix)
                            966 ;src/main.c:210: if((int)pr.dir < 2)
   4998 79            [ 4]  967 	ld	a,c
   4999 D6 02         [ 7]  968 	sub	a, #0x02
   499B 78            [ 4]  969 	ld	a,b
   499C 17            [ 4]  970 	rla
   499D 3F            [ 4]  971 	ccf
   499E 1F            [ 4]  972 	rra
   499F DE 80         [ 7]  973 	sbc	a, #0x80
   49A1 30 10         [12]  974 	jr	NC,00110$
                            975 ;src/main.c:211: cpct_drawSolidBox(memptr, 0, 4, 4);
   49A3 21 04 04      [10]  976 	ld	hl,#0x0404
   49A6 E5            [11]  977 	push	hl
   49A7 AF            [ 4]  978 	xor	a, a
   49A8 F5            [11]  979 	push	af
   49A9 33            [ 6]  980 	inc	sp
   49AA D5            [11]  981 	push	de
   49AB CD 6F 54      [17]  982 	call	_cpct_drawSolidBox
   49AE F1            [10]  983 	pop	af
   49AF F1            [10]  984 	pop	af
   49B0 33            [ 6]  985 	inc	sp
   49B1 18 0E         [12]  986 	jr	00111$
   49B3                     987 00110$:
                            988 ;src/main.c:213: cpct_drawSolidBox(memptr, 0, 2, 8);
   49B3 21 02 08      [10]  989 	ld	hl,#0x0802
   49B6 E5            [11]  990 	push	hl
   49B7 AF            [ 4]  991 	xor	a, a
   49B8 F5            [11]  992 	push	af
   49B9 33            [ 6]  993 	inc	sp
   49BA D5            [11]  994 	push	de
   49BB CD 6F 54      [17]  995 	call	_cpct_drawSolidBox
   49BE F1            [10]  996 	pop	af
   49BF F1            [10]  997 	pop	af
   49C0 33            [ 6]  998 	inc	sp
   49C1                     999 00111$:
                           1000 ;src/main.c:215: if(pr.vivo == 0){
   49C1 DD 6E F0      [19] 1001 	ld	l,-16 (ix)
   49C4 DD 66 F1      [19] 1002 	ld	h,-15 (ix)
   49C7 4E            [ 7] 1003 	ld	c,(hl)
   49C8 23            [ 6] 1004 	inc	hl
   49C9 7E            [ 7] 1005 	ld	a, (hl)
   49CA B1            [ 4] 1006 	or	a,c
   49CB 20 5C         [12] 1007 	jr	NZ,00116$
                           1008 ;src/main.c:216: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   49CD DD 6E F6      [19] 1009 	ld	l,-10 (ix)
   49D0 DD 66 F7      [19] 1010 	ld	h,-9 (ix)
   49D3 46            [ 7] 1011 	ld	b,(hl)
   49D4 DD 6E F8      [19] 1012 	ld	l,-8 (ix)
   49D7 DD 66 F9      [19] 1013 	ld	h,-7 (ix)
   49DA 4E            [ 7] 1014 	ld	c, (hl)
   49DB C5            [11] 1015 	push	bc
   49DC 21 00 C0      [10] 1016 	ld	hl,#0xC000
   49DF E5            [11] 1017 	push	hl
   49E0 CD 27 55      [17] 1018 	call	_cpct_getScreenPtr
   49E3 DD 75 EC      [19] 1019 	ld	-20 (ix),l
   49E6 DD 74 ED      [19] 1020 	ld	-19 (ix),h
                           1021 ;src/main.c:210: if((int)pr.dir < 2)
   49E9 DD 6E EE      [19] 1022 	ld	l,-18 (ix)
   49EC DD 66 EF      [19] 1023 	ld	h,-17 (ix)
   49EF 5E            [ 7] 1024 	ld	e,(hl)
   49F0 23            [ 6] 1025 	inc	hl
   49F1 56            [ 7] 1026 	ld	d,(hl)
                           1027 ;src/main.c:217: if((int)pr.dir < 2)
   49F2 63            [ 4] 1028 	ld	h,e
   49F3 6A            [ 4] 1029 	ld	l,d
                           1030 ;src/main.c:182: cpct_drawSolidBox(memptr,0,4,16);
   49F4 DD 4E EC      [19] 1031 	ld	c,-20 (ix)
   49F7 DD 46 ED      [19] 1032 	ld	b,-19 (ix)
                           1033 ;src/main.c:217: if((int)pr.dir < 2)
   49FA 7C            [ 4] 1034 	ld	a,h
   49FB D6 02         [ 7] 1035 	sub	a, #0x02
   49FD 7D            [ 4] 1036 	ld	a,l
   49FE 17            [ 4] 1037 	rla
   49FF 3F            [ 4] 1038 	ccf
   4A00 1F            [ 4] 1039 	rra
   4A01 DE 80         [ 7] 1040 	sbc	a, #0x80
   4A03 30 13         [12] 1041 	jr	NC,00113$
                           1042 ;src/main.c:218: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 4, 4);
   4A05 C5            [11] 1043 	push	bc
   4A06 D5            [11] 1044 	push	de
   4A07 CD B8 44      [17] 1045 	call	_checkSpriteFlecha
   4A0A F1            [10] 1046 	pop	af
   4A0B C1            [10] 1047 	pop	bc
   4A0C EB            [ 4] 1048 	ex	de,hl
   4A0D 21 04 04      [10] 1049 	ld	hl,#0x0404
   4A10 E5            [11] 1050 	push	hl
   4A11 C5            [11] 1051 	push	bc
   4A12 D5            [11] 1052 	push	de
   4A13 CD E9 53      [17] 1053 	call	_cpct_drawSpriteMasked
   4A16 18 11         [12] 1054 	jr	00116$
   4A18                    1055 00113$:
                           1056 ;src/main.c:220: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 2, 8);
   4A18 C5            [11] 1057 	push	bc
   4A19 D5            [11] 1058 	push	de
   4A1A CD B8 44      [17] 1059 	call	_checkSpriteFlecha
   4A1D F1            [10] 1060 	pop	af
   4A1E C1            [10] 1061 	pop	bc
   4A1F EB            [ 4] 1062 	ex	de,hl
   4A20 21 02 08      [10] 1063 	ld	hl,#0x0802
   4A23 E5            [11] 1064 	push	hl
   4A24 C5            [11] 1065 	push	bc
   4A25 D5            [11] 1066 	push	de
   4A26 CD E9 53      [17] 1067 	call	_cpct_drawSpriteMasked
   4A29                    1068 00116$:
                           1069 ;src/main.c:188: if(p.atk >= 21)
   4A29 DD 6E E3      [19] 1070 	ld	l,-29 (ix)
   4A2C DD 66 E4      [19] 1071 	ld	h,-28 (ix)
   4A2F 5E            [ 7] 1072 	ld	e,(hl)
   4A30 23            [ 6] 1073 	inc	hl
   4A31 56            [ 7] 1074 	ld	d,(hl)
                           1075 ;src/main.c:224: if(p.atk < 20)
   4A32 7B            [ 4] 1076 	ld	a,e
   4A33 D6 14         [ 7] 1077 	sub	a, #0x14
   4A35 7A            [ 4] 1078 	ld	a,d
   4A36 DE 00         [ 7] 1079 	sbc	a, #0x00
   4A38 30 14         [12] 1080 	jr	NC,00121$
                           1081 ;src/main.c:225: drawFatiga(p.atk,memptr,2);
   4A3A 3E 02         [ 7] 1082 	ld	a,#0x02
   4A3C F5            [11] 1083 	push	af
   4A3D 33            [ 6] 1084 	inc	sp
   4A3E DD 6E EC      [19] 1085 	ld	l,-20 (ix)
   4A41 DD 66 ED      [19] 1086 	ld	h,-19 (ix)
   4A44 E5            [11] 1087 	push	hl
   4A45 D5            [11] 1088 	push	de
   4A46 CD EB 44      [17] 1089 	call	_drawFatiga
   4A49 F1            [10] 1090 	pop	af
   4A4A F1            [10] 1091 	pop	af
   4A4B 33            [ 6] 1092 	inc	sp
   4A4C 18 2D         [12] 1093 	jr	00122$
   4A4E                    1094 00121$:
                           1095 ;src/main.c:226: else if(p.atk > 20)
   4A4E 3E 14         [ 7] 1096 	ld	a,#0x14
   4A50 BB            [ 4] 1097 	cp	a, e
   4A51 3E 00         [ 7] 1098 	ld	a,#0x00
   4A53 9A            [ 4] 1099 	sbc	a, d
   4A54 30 14         [12] 1100 	jr	NC,00118$
                           1101 ;src/main.c:227: drawFatiga(p.atk,memptr,16);
   4A56 3E 10         [ 7] 1102 	ld	a,#0x10
   4A58 F5            [11] 1103 	push	af
   4A59 33            [ 6] 1104 	inc	sp
   4A5A DD 6E EC      [19] 1105 	ld	l,-20 (ix)
   4A5D DD 66 ED      [19] 1106 	ld	h,-19 (ix)
   4A60 E5            [11] 1107 	push	hl
   4A61 D5            [11] 1108 	push	de
   4A62 CD EB 44      [17] 1109 	call	_drawFatiga
   4A65 F1            [10] 1110 	pop	af
   4A66 F1            [10] 1111 	pop	af
   4A67 33            [ 6] 1112 	inc	sp
   4A68 18 11         [12] 1113 	jr	00122$
   4A6A                    1114 00118$:
                           1115 ;src/main.c:229: drawFatiga(p.atk,memptr,0);
   4A6A AF            [ 4] 1116 	xor	a, a
   4A6B F5            [11] 1117 	push	af
   4A6C 33            [ 6] 1118 	inc	sp
   4A6D DD 6E EC      [19] 1119 	ld	l,-20 (ix)
   4A70 DD 66 ED      [19] 1120 	ld	h,-19 (ix)
   4A73 E5            [11] 1121 	push	hl
   4A74 D5            [11] 1122 	push	de
   4A75 CD EB 44      [17] 1123 	call	_drawFatiga
   4A78 F1            [10] 1124 	pop	af
   4A79 F1            [10] 1125 	pop	af
   4A7A 33            [ 6] 1126 	inc	sp
   4A7B                    1127 00122$:
                           1128 ;src/main.c:231: p.prevX = p.x;
   4A7B DD 6E E5      [19] 1129 	ld	l,-27 (ix)
   4A7E DD 66 E6      [19] 1130 	ld	h,-26 (ix)
   4A81 7E            [ 7] 1131 	ld	a,(hl)
   4A82 DD 6E FC      [19] 1132 	ld	l,-4 (ix)
   4A85 DD 66 FD      [19] 1133 	ld	h,-3 (ix)
   4A88 77            [ 7] 1134 	ld	(hl),a
                           1135 ;src/main.c:232: p.prevY = p.y;
   4A89 DD 6E FA      [19] 1136 	ld	l,-6 (ix)
   4A8C DD 66 FB      [19] 1137 	ld	h,-5 (ix)
   4A8F 7E            [ 7] 1138 	ld	a,(hl)
   4A90 DD 6E FE      [19] 1139 	ld	l,-2 (ix)
   4A93 DD 66 FF      [19] 1140 	ld	h,-1 (ix)
   4A96 77            [ 7] 1141 	ld	(hl),a
                           1142 ;src/main.c:233: p.prevAtk = p.atk;
   4A97 DD 6E E3      [19] 1143 	ld	l,-29 (ix)
   4A9A DD 66 E4      [19] 1144 	ld	h,-28 (ix)
   4A9D 56            [ 7] 1145 	ld	d,(hl)
   4A9E 23            [ 6] 1146 	inc	hl
   4A9F 5E            [ 7] 1147 	ld	e,(hl)
   4AA0 DD 6E E1      [19] 1148 	ld	l,-31 (ix)
   4AA3 DD 66 E2      [19] 1149 	ld	h,-30 (ix)
   4AA6 72            [ 7] 1150 	ld	(hl),d
   4AA7 23            [ 6] 1151 	inc	hl
   4AA8 73            [ 7] 1152 	ld	(hl),e
                           1153 ;src/main.c:235: if(p.col != 2){
   4AA9 DD 6E DD      [19] 1154 	ld	l,-35 (ix)
   4AAC DD 66 DE      [19] 1155 	ld	h,-34 (ix)
   4AAF 56            [ 7] 1156 	ld	d,(hl)
   4AB0 23            [ 6] 1157 	inc	hl
   4AB1 66            [ 7] 1158 	ld	h,(hl)
   4AB2 7A            [ 4] 1159 	ld	a,d
   4AB3 D6 02         [ 7] 1160 	sub	a,#0x02
   4AB5 20 04         [12] 1161 	jr	NZ,00370$
   4AB7 B4            [ 4] 1162 	or	a,h
   4AB8 CA B0 4C      [10] 1163 	jp	Z,00167$
   4ABB                    1164 00370$:
                           1165 ;src/main.c:236: cpct_scanKeyboard_f();
   4ABB CD 9A 52      [17] 1166 	call	_cpct_scanKeyboard_f
                           1167 ;src/main.c:237: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4ABE 21 05 80      [10] 1168 	ld	hl,#0x8005
   4AC1 CD 8E 52      [17] 1169 	call	_cpct_isKeyPressed
   4AC4 DD 75 EC      [19] 1170 	ld	-20 (ix),l
                           1171 ;src/main.c:188: if(p.atk >= 21)
   4AC7 DD 6E E3      [19] 1172 	ld	l,-29 (ix)
   4ACA DD 66 E4      [19] 1173 	ld	h,-28 (ix)
   4ACD 7E            [ 7] 1174 	ld	a,(hl)
   4ACE DD 77 EA      [19] 1175 	ld	-22 (ix),a
   4AD1 23            [ 6] 1176 	inc	hl
   4AD2 7E            [ 7] 1177 	ld	a,(hl)
   4AD3 DD 77 EB      [19] 1178 	ld	-21 (ix),a
                           1179 ;src/main.c:224: if(p.atk < 20)
   4AD6 DD 7E EA      [19] 1180 	ld	a,-22 (ix)
   4AD9 D6 14         [ 7] 1181 	sub	a, #0x14
   4ADB DD 7E EB      [19] 1182 	ld	a,-21 (ix)
   4ADE DE 00         [ 7] 1183 	sbc	a, #0x00
   4AE0 3E 00         [ 7] 1184 	ld	a,#0x00
   4AE2 17            [ 4] 1185 	rla
   4AE3 DD 77 E9      [19] 1186 	ld	-23 (ix),a
                           1187 ;src/main.c:241: p.atk += 1;
   4AE6 DD 7E EA      [19] 1188 	ld	a,-22 (ix)
   4AE9 C6 01         [ 7] 1189 	add	a, #0x01
   4AEB DD 77 E7      [19] 1190 	ld	-25 (ix),a
   4AEE DD 7E EB      [19] 1191 	ld	a,-21 (ix)
   4AF1 CE 00         [ 7] 1192 	adc	a, #0x00
   4AF3 DD 77 E8      [19] 1193 	ld	-24 (ix),a
                           1194 ;src/main.c:237: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4AF6 DD 7E EC      [19] 1195 	ld	a,-20 (ix)
   4AF9 B7            [ 4] 1196 	or	a, a
   4AFA 28 5D         [12] 1197 	jr	Z,00161$
   4AFC DD 7E E9      [19] 1198 	ld	a,-23 (ix)
   4AFF B7            [ 4] 1199 	or	a, a
   4B00 20 57         [12] 1200 	jr	NZ,00161$
                           1201 ;src/main.c:238: if(p.atk >= 50)
   4B02 DD 7E EA      [19] 1202 	ld	a,-22 (ix)
   4B05 D6 32         [ 7] 1203 	sub	a, #0x32
   4B07 DD 7E EB      [19] 1204 	ld	a,-21 (ix)
   4B0A DE 00         [ 7] 1205 	sbc	a, #0x00
   4B0C 38 0C         [12] 1206 	jr	C,00124$
                           1207 ;src/main.c:239: p.atk = 0;
   4B0E DD 6E E3      [19] 1208 	ld	l,-29 (ix)
   4B11 DD 66 E4      [19] 1209 	ld	h,-28 (ix)
   4B14 AF            [ 4] 1210 	xor	a, a
   4B15 77            [ 7] 1211 	ld	(hl), a
   4B16 23            [ 6] 1212 	inc	hl
   4B17 77            [ 7] 1213 	ld	(hl), a
   4B18 18 0F         [12] 1214 	jr	00125$
   4B1A                    1215 00124$:
                           1216 ;src/main.c:241: p.atk += 1;
   4B1A DD 6E E3      [19] 1217 	ld	l,-29 (ix)
   4B1D DD 66 E4      [19] 1218 	ld	h,-28 (ix)
   4B20 DD 7E E7      [19] 1219 	ld	a,-25 (ix)
   4B23 77            [ 7] 1220 	ld	(hl),a
   4B24 23            [ 6] 1221 	inc	hl
   4B25 DD 7E E8      [19] 1222 	ld	a,-24 (ix)
   4B28 77            [ 7] 1223 	ld	(hl),a
   4B29                    1224 00125$:
                           1225 ;src/main.c:242: if(cpct_isKeyPressed(Key_CursorRight))
   4B29 21 00 02      [10] 1226 	ld	hl,#0x0200
   4B2C CD 8E 52      [17] 1227 	call	_cpct_isKeyPressed
   4B2F 7D            [ 4] 1228 	ld	a,l
   4B30 B7            [ 4] 1229 	or	a, a
   4B31 28 0D         [12] 1230 	jr	Z,00129$
                           1231 ;src/main.c:243: p.dir = 0;
   4B33 DD 6E DF      [19] 1232 	ld	l,-33 (ix)
   4B36 DD 66 E0      [19] 1233 	ld	h,-32 (ix)
   4B39 AF            [ 4] 1234 	xor	a, a
   4B3A 77            [ 7] 1235 	ld	(hl), a
   4B3B 23            [ 6] 1236 	inc	hl
   4B3C 77            [ 7] 1237 	ld	(hl), a
   4B3D C3 ED 4C      [10] 1238 	jp	00168$
   4B40                    1239 00129$:
                           1240 ;src/main.c:244: else if(cpct_isKeyPressed(Key_CursorLeft))
   4B40 21 01 01      [10] 1241 	ld	hl,#0x0101
   4B43 CD 8E 52      [17] 1242 	call	_cpct_isKeyPressed
   4B46 7D            [ 4] 1243 	ld	a,l
   4B47 B7            [ 4] 1244 	or	a, a
   4B48 CA ED 4C      [10] 1245 	jp	Z,00168$
                           1246 ;src/main.c:245: p.dir = 1;
   4B4B DD 6E DF      [19] 1247 	ld	l,-33 (ix)
   4B4E DD 66 E0      [19] 1248 	ld	h,-32 (ix)
   4B51 36 01         [10] 1249 	ld	(hl),#0x01
   4B53 23            [ 6] 1250 	inc	hl
   4B54 36 00         [10] 1251 	ld	(hl),#0x00
   4B56 C3 ED 4C      [10] 1252 	jp	00168$
   4B59                    1253 00161$:
                           1254 ;src/main.c:247: if(p.atk < 20)
   4B59 DD 7E E9      [19] 1255 	ld	a,-23 (ix)
   4B5C B7            [ 4] 1256 	or	a, a
   4B5D 28 11         [12] 1257 	jr	Z,00132$
                           1258 ;src/main.c:248: p.atk += 1;
   4B5F DD 6E E3      [19] 1259 	ld	l,-29 (ix)
   4B62 DD 66 E4      [19] 1260 	ld	h,-28 (ix)
   4B65 DD 7E E7      [19] 1261 	ld	a,-25 (ix)
   4B68 77            [ 7] 1262 	ld	(hl),a
   4B69 23            [ 6] 1263 	inc	hl
   4B6A DD 7E E8      [19] 1264 	ld	a,-24 (ix)
   4B6D 77            [ 7] 1265 	ld	(hl),a
   4B6E 18 0B         [12] 1266 	jr	00133$
   4B70                    1267 00132$:
                           1268 ;src/main.c:250: p.atk = 20;
   4B70 DD 6E E3      [19] 1269 	ld	l,-29 (ix)
   4B73 DD 66 E4      [19] 1270 	ld	h,-28 (ix)
   4B76 36 14         [10] 1271 	ld	(hl),#0x14
   4B78 23            [ 6] 1272 	inc	hl
   4B79 36 00         [10] 1273 	ld	(hl),#0x00
   4B7B                    1274 00133$:
                           1275 ;src/main.c:251: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4B7B 21 00 02      [10] 1276 	ld	hl,#0x0200
   4B7E CD 8E 52      [17] 1277 	call	_cpct_isKeyPressed
   4B81 7D            [ 4] 1278 	ld	a,l
   4B82 B7            [ 4] 1279 	or	a, a
   4B83 28 32         [12] 1280 	jr	Z,00157$
   4B85 DD 6E E5      [19] 1281 	ld	l,-27 (ix)
   4B88 DD 66 E6      [19] 1282 	ld	h,-26 (ix)
   4B8B 56            [ 7] 1283 	ld	d,(hl)
   4B8C 7A            [ 4] 1284 	ld	a,d
   4B8D D6 4C         [ 7] 1285 	sub	a, #0x4C
   4B8F 30 26         [12] 1286 	jr	NC,00157$
                           1287 ;src/main.c:252: if(p.col != 2)
   4B91 DD 6E DD      [19] 1288 	ld	l,-35 (ix)
   4B94 DD 66 DE      [19] 1289 	ld	h,-34 (ix)
   4B97 5E            [ 7] 1290 	ld	e,(hl)
   4B98 23            [ 6] 1291 	inc	hl
   4B99 66            [ 7] 1292 	ld	h,(hl)
   4B9A 7B            [ 4] 1293 	ld	a,e
   4B9B D6 02         [ 7] 1294 	sub	a,#0x02
   4B9D 20 03         [12] 1295 	jr	NZ,00371$
   4B9F B4            [ 4] 1296 	or	a,h
   4BA0 28 08         [12] 1297 	jr	Z,00135$
   4BA2                    1298 00371$:
                           1299 ;src/main.c:253: p.x += 1;
   4BA2 14            [ 4] 1300 	inc	d
   4BA3 DD 6E E5      [19] 1301 	ld	l,-27 (ix)
   4BA6 DD 66 E6      [19] 1302 	ld	h,-26 (ix)
   4BA9 72            [ 7] 1303 	ld	(hl),d
   4BAA                    1304 00135$:
                           1305 ;src/main.c:254: p.dir = 0;
   4BAA DD 6E DF      [19] 1306 	ld	l,-33 (ix)
   4BAD DD 66 E0      [19] 1307 	ld	h,-32 (ix)
   4BB0 AF            [ 4] 1308 	xor	a, a
   4BB1 77            [ 7] 1309 	ld	(hl), a
   4BB2 23            [ 6] 1310 	inc	hl
   4BB3 77            [ 7] 1311 	ld	(hl), a
   4BB4 C3 ED 4C      [10] 1312 	jp	00168$
   4BB7                    1313 00157$:
                           1314 ;src/main.c:255: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4BB7 21 01 01      [10] 1315 	ld	hl,#0x0101
   4BBA CD 8E 52      [17] 1316 	call	_cpct_isKeyPressed
   4BBD 7D            [ 4] 1317 	ld	a,l
   4BBE B7            [ 4] 1318 	or	a, a
   4BBF 28 32         [12] 1319 	jr	Z,00153$
   4BC1 DD 6E E5      [19] 1320 	ld	l,-27 (ix)
   4BC4 DD 66 E6      [19] 1321 	ld	h,-26 (ix)
   4BC7 56            [ 7] 1322 	ld	d,(hl)
   4BC8 7A            [ 4] 1323 	ld	a,d
   4BC9 B7            [ 4] 1324 	or	a, a
   4BCA 28 27         [12] 1325 	jr	Z,00153$
                           1326 ;src/main.c:256: if(p.col != 2)
   4BCC DD 6E DD      [19] 1327 	ld	l,-35 (ix)
   4BCF DD 66 DE      [19] 1328 	ld	h,-34 (ix)
   4BD2 5E            [ 7] 1329 	ld	e,(hl)
   4BD3 23            [ 6] 1330 	inc	hl
   4BD4 66            [ 7] 1331 	ld	h,(hl)
   4BD5 7B            [ 4] 1332 	ld	a,e
   4BD6 D6 02         [ 7] 1333 	sub	a,#0x02
   4BD8 20 03         [12] 1334 	jr	NZ,00372$
   4BDA B4            [ 4] 1335 	or	a,h
   4BDB 28 08         [12] 1336 	jr	Z,00137$
   4BDD                    1337 00372$:
                           1338 ;src/main.c:257: p.x -= 1;
   4BDD 15            [ 4] 1339 	dec	d
   4BDE DD 6E E5      [19] 1340 	ld	l,-27 (ix)
   4BE1 DD 66 E6      [19] 1341 	ld	h,-26 (ix)
   4BE4 72            [ 7] 1342 	ld	(hl),d
   4BE5                    1343 00137$:
                           1344 ;src/main.c:258: p.dir = 1;
   4BE5 DD 6E DF      [19] 1345 	ld	l,-33 (ix)
   4BE8 DD 66 E0      [19] 1346 	ld	h,-32 (ix)
   4BEB 36 01         [10] 1347 	ld	(hl),#0x01
   4BED 23            [ 6] 1348 	inc	hl
   4BEE 36 00         [10] 1349 	ld	(hl),#0x00
   4BF0 C3 ED 4C      [10] 1350 	jp	00168$
   4BF3                    1351 00153$:
                           1352 ;src/main.c:259: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4BF3 21 00 04      [10] 1353 	ld	hl,#0x0400
   4BF6 CD 8E 52      [17] 1354 	call	_cpct_isKeyPressed
   4BF9 7D            [ 4] 1355 	ld	a,l
   4BFA B7            [ 4] 1356 	or	a, a
   4BFB 28 23         [12] 1357 	jr	Z,00149$
                           1358 ;src/main.c:186: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4BFD DD 6E FA      [19] 1359 	ld	l,-6 (ix)
   4C00 DD 66 FB      [19] 1360 	ld	h,-5 (ix)
   4C03 56            [ 7] 1361 	ld	d,(hl)
                           1362 ;src/main.c:259: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4C04 7A            [ 4] 1363 	ld	a,d
   4C05 D6 B8         [ 7] 1364 	sub	a, #0xB8
   4C07 30 17         [12] 1365 	jr	NC,00149$
                           1366 ;src/main.c:260: p.y += 2;
   4C09 14            [ 4] 1367 	inc	d
   4C0A 14            [ 4] 1368 	inc	d
   4C0B DD 6E FA      [19] 1369 	ld	l,-6 (ix)
   4C0E DD 66 FB      [19] 1370 	ld	h,-5 (ix)
   4C11 72            [ 7] 1371 	ld	(hl),d
                           1372 ;src/main.c:261: p.dir = 2;
   4C12 DD 6E DF      [19] 1373 	ld	l,-33 (ix)
   4C15 DD 66 E0      [19] 1374 	ld	h,-32 (ix)
   4C18 36 02         [10] 1375 	ld	(hl),#0x02
   4C1A 23            [ 6] 1376 	inc	hl
   4C1B 36 00         [10] 1377 	ld	(hl),#0x00
   4C1D C3 ED 4C      [10] 1378 	jp	00168$
   4C20                    1379 00149$:
                           1380 ;src/main.c:262: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4C20 21 00 01      [10] 1381 	ld	hl,#0x0100
   4C23 CD 8E 52      [17] 1382 	call	_cpct_isKeyPressed
   4C26 7D            [ 4] 1383 	ld	a,l
   4C27 B7            [ 4] 1384 	or	a, a
   4C28 28 21         [12] 1385 	jr	Z,00145$
                           1386 ;src/main.c:186: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4C2A DD 6E FA      [19] 1387 	ld	l,-6 (ix)
   4C2D DD 66 FB      [19] 1388 	ld	h,-5 (ix)
   4C30 7E            [ 7] 1389 	ld	a,(hl)
                           1390 ;src/main.c:262: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4C31 B7            [ 4] 1391 	or	a, a
   4C32 28 17         [12] 1392 	jr	Z,00145$
                           1393 ;src/main.c:263: p.y -= 2;
   4C34 C6 FE         [ 7] 1394 	add	a,#0xFE
   4C36 DD 6E FA      [19] 1395 	ld	l,-6 (ix)
   4C39 DD 66 FB      [19] 1396 	ld	h,-5 (ix)
   4C3C 77            [ 7] 1397 	ld	(hl),a
                           1398 ;src/main.c:264: p.dir = 3;
   4C3D DD 6E DF      [19] 1399 	ld	l,-33 (ix)
   4C40 DD 66 E0      [19] 1400 	ld	h,-32 (ix)
   4C43 36 03         [10] 1401 	ld	(hl),#0x03
   4C45 23            [ 6] 1402 	inc	hl
   4C46 36 00         [10] 1403 	ld	(hl),#0x00
   4C48 C3 ED 4C      [10] 1404 	jp	00168$
   4C4B                    1405 00145$:
                           1406 ;src/main.c:265: }else if(cpct_isKeyPressed(Key_X) && pr.vivo == 1){
   4C4B 21 07 80      [10] 1407 	ld	hl,#0x8007
   4C4E CD 8E 52      [17] 1408 	call	_cpct_isKeyPressed
   4C51 7D            [ 4] 1409 	ld	a,l
   4C52 B7            [ 4] 1410 	or	a, a
   4C53 28 4E         [12] 1411 	jr	Z,00141$
   4C55 DD 6E F0      [19] 1412 	ld	l,-16 (ix)
   4C58 DD 66 F1      [19] 1413 	ld	h,-15 (ix)
   4C5B 56            [ 7] 1414 	ld	d,(hl)
   4C5C 23            [ 6] 1415 	inc	hl
   4C5D 66            [ 7] 1416 	ld	h,(hl)
   4C5E 15            [ 4] 1417 	dec	d
   4C5F 20 42         [12] 1418 	jr	NZ,00141$
   4C61 7C            [ 4] 1419 	ld	a,h
   4C62 B7            [ 4] 1420 	or	a, a
   4C63 20 3E         [12] 1421 	jr	NZ,00141$
                           1422 ;src/main.c:266: pr.vivo = 0;
   4C65 DD 6E F0      [19] 1423 	ld	l,-16 (ix)
   4C68 DD 66 F1      [19] 1424 	ld	h,-15 (ix)
   4C6B AF            [ 4] 1425 	xor	a, a
   4C6C 77            [ 7] 1426 	ld	(hl), a
   4C6D 23            [ 6] 1427 	inc	hl
   4C6E 77            [ 7] 1428 	ld	(hl), a
                           1429 ;src/main.c:267: pr.dir = p.dir;
   4C6F DD 6E DF      [19] 1430 	ld	l,-33 (ix)
   4C72 DD 66 E0      [19] 1431 	ld	h,-32 (ix)
   4C75 56            [ 7] 1432 	ld	d,(hl)
   4C76 23            [ 6] 1433 	inc	hl
   4C77 5E            [ 7] 1434 	ld	e,(hl)
   4C78 DD 6E EE      [19] 1435 	ld	l,-18 (ix)
   4C7B DD 66 EF      [19] 1436 	ld	h,-17 (ix)
   4C7E 72            [ 7] 1437 	ld	(hl),d
   4C7F 23            [ 6] 1438 	inc	hl
   4C80 73            [ 7] 1439 	ld	(hl),e
                           1440 ;src/main.c:268: pr.x = p.x+4;
   4C81 DD 6E E5      [19] 1441 	ld	l,-27 (ix)
   4C84 DD 66 E6      [19] 1442 	ld	h,-26 (ix)
   4C87 7E            [ 7] 1443 	ld	a,(hl)
   4C88 C6 04         [ 7] 1444 	add	a, #0x04
   4C8A DD 6E F8      [19] 1445 	ld	l,-8 (ix)
   4C8D DD 66 F9      [19] 1446 	ld	h,-7 (ix)
   4C90 77            [ 7] 1447 	ld	(hl),a
                           1448 ;src/main.c:269: pr.y = p.y+8;
   4C91 DD 6E FA      [19] 1449 	ld	l,-6 (ix)
   4C94 DD 66 FB      [19] 1450 	ld	h,-5 (ix)
   4C97 7E            [ 7] 1451 	ld	a,(hl)
   4C98 C6 08         [ 7] 1452 	add	a, #0x08
   4C9A DD 6E F6      [19] 1453 	ld	l,-10 (ix)
   4C9D DD 66 F7      [19] 1454 	ld	h,-9 (ix)
   4CA0 77            [ 7] 1455 	ld	(hl),a
   4CA1 18 4A         [12] 1456 	jr	00168$
   4CA3                    1457 00141$:
                           1458 ;src/main.c:270: }else  if(cpct_isKeyPressed(Key_Esc)){
   4CA3 21 08 04      [10] 1459 	ld	hl,#0x0408
   4CA6 CD 8E 52      [17] 1460 	call	_cpct_isKeyPressed
   4CA9 7D            [ 4] 1461 	ld	a,l
   4CAA B7            [ 4] 1462 	or	a, a
   4CAB 28 40         [12] 1463 	jr	Z,00168$
                           1464 ;src/main.c:271: return;
   4CAD C3 DA 4E      [10] 1465 	jp	00200$
   4CB0                    1466 00167$:
                           1467 ;src/main.c:275: p.x -= 2;
   4CB0 DD 6E E5      [19] 1468 	ld	l,-27 (ix)
   4CB3 DD 66 E6      [19] 1469 	ld	h,-26 (ix)
   4CB6 7E            [ 7] 1470 	ld	a,(hl)
   4CB7 C6 FE         [ 7] 1471 	add	a,#0xFE
   4CB9 DD 6E E5      [19] 1472 	ld	l,-27 (ix)
   4CBC DD 66 E6      [19] 1473 	ld	h,-26 (ix)
   4CBF 77            [ 7] 1474 	ld	(hl),a
                           1475 ;src/main.c:276: p.rebote -= 2;
   4CC0 DD 6E DB      [19] 1476 	ld	l,-37 (ix)
   4CC3 DD 66 DC      [19] 1477 	ld	h,-36 (ix)
   4CC6 5E            [ 7] 1478 	ld	e,(hl)
   4CC7 23            [ 6] 1479 	inc	hl
   4CC8 56            [ 7] 1480 	ld	d,(hl)
   4CC9 1B            [ 6] 1481 	dec	de
   4CCA 1B            [ 6] 1482 	dec	de
   4CCB DD 6E DB      [19] 1483 	ld	l,-37 (ix)
   4CCE DD 66 DC      [19] 1484 	ld	h,-36 (ix)
   4CD1 73            [ 7] 1485 	ld	(hl),e
   4CD2 23            [ 6] 1486 	inc	hl
   4CD3 72            [ 7] 1487 	ld	(hl),d
                           1488 ;src/main.c:277: if(p.rebote == 0){
   4CD4 7A            [ 4] 1489 	ld	a,d
   4CD5 B3            [ 4] 1490 	or	a,e
   4CD6 20 15         [12] 1491 	jr	NZ,00168$
                           1492 ;src/main.c:278: p.rebote = 6;
   4CD8 DD 6E DB      [19] 1493 	ld	l,-37 (ix)
   4CDB DD 66 DC      [19] 1494 	ld	h,-36 (ix)
   4CDE 36 06         [10] 1495 	ld	(hl),#0x06
   4CE0 23            [ 6] 1496 	inc	hl
   4CE1 36 00         [10] 1497 	ld	(hl),#0x00
                           1498 ;src/main.c:279: p.col = 0;
   4CE3 DD 6E DD      [19] 1499 	ld	l,-35 (ix)
   4CE6 DD 66 DE      [19] 1500 	ld	h,-34 (ix)
   4CE9 AF            [ 4] 1501 	xor	a, a
   4CEA 77            [ 7] 1502 	ld	(hl), a
   4CEB 23            [ 6] 1503 	inc	hl
   4CEC 77            [ 7] 1504 	ld	(hl), a
   4CED                    1505 00168$:
                           1506 ;src/main.c:284: sprite = checkSprite(p.atk,p.dir);
   4CED DD 6E DF      [19] 1507 	ld	l,-33 (ix)
   4CF0 DD 66 E0      [19] 1508 	ld	h,-32 (ix)
   4CF3 4E            [ 7] 1509 	ld	c,(hl)
   4CF4 23            [ 6] 1510 	inc	hl
   4CF5 46            [ 7] 1511 	ld	b,(hl)
   4CF6 DD 6E E3      [19] 1512 	ld	l,-29 (ix)
   4CF9 DD 66 E4      [19] 1513 	ld	h,-28 (ix)
   4CFC 5E            [ 7] 1514 	ld	e,(hl)
   4CFD 23            [ 6] 1515 	inc	hl
   4CFE 56            [ 7] 1516 	ld	d,(hl)
   4CFF C5            [11] 1517 	push	bc
   4D00 D5            [11] 1518 	push	de
   4D01 CD 5A 44      [17] 1519 	call	_checkSprite
   4D04 F1            [10] 1520 	pop	af
   4D05 F1            [10] 1521 	pop	af
   4D06 33            [ 6] 1522 	inc	sp
   4D07 33            [ 6] 1523 	inc	sp
   4D08 E5            [11] 1524 	push	hl
                           1525 ;src/main.c:286: if(pr.vivo == 0){
   4D09 DD 6E F0      [19] 1526 	ld	l,-16 (ix)
   4D0C DD 66 F1      [19] 1527 	ld	h,-15 (ix)
   4D0F 7E            [ 7] 1528 	ld	a,(hl)
   4D10 DD 77 E7      [19] 1529 	ld	-25 (ix),a
   4D13 23            [ 6] 1530 	inc	hl
   4D14 7E            [ 7] 1531 	ld	a,(hl)
   4D15 DD 77 E8      [19] 1532 	ld	-24 (ix), a
   4D18 DD B6 E7      [19] 1533 	or	a,-25 (ix)
   4D1B C2 0A 4E      [10] 1534 	jp	NZ,00187$
                           1535 ;src/main.c:287: pr.prevX = pr.x;
   4D1E DD 6E F8      [19] 1536 	ld	l,-8 (ix)
   4D21 DD 66 F9      [19] 1537 	ld	h,-7 (ix)
   4D24 7E            [ 7] 1538 	ld	a,(hl)
   4D25 DD 77 E7      [19] 1539 	ld	-25 (ix),a
   4D28 DD 6E F4      [19] 1540 	ld	l,-12 (ix)
   4D2B DD 66 F5      [19] 1541 	ld	h,-11 (ix)
   4D2E DD 7E E7      [19] 1542 	ld	a,-25 (ix)
   4D31 77            [ 7] 1543 	ld	(hl),a
                           1544 ;src/main.c:288: pr.prevY = pr.y;
   4D32 DD 6E F6      [19] 1545 	ld	l,-10 (ix)
   4D35 DD 66 F7      [19] 1546 	ld	h,-9 (ix)
   4D38 7E            [ 7] 1547 	ld	a,(hl)
   4D39 DD 77 E7      [19] 1548 	ld	-25 (ix),a
   4D3C DD 6E F2      [19] 1549 	ld	l,-14 (ix)
   4D3F DD 66 F3      [19] 1550 	ld	h,-13 (ix)
   4D42 DD 7E E7      [19] 1551 	ld	a,-25 (ix)
   4D45 77            [ 7] 1552 	ld	(hl),a
                           1553 ;src/main.c:289: switch((int)pr.dir){
   4D46 DD 6E EE      [19] 1554 	ld	l,-18 (ix)
   4D49 DD 66 EF      [19] 1555 	ld	h,-17 (ix)
   4D4C 7E            [ 7] 1556 	ld	a,(hl)
   4D4D DD 77 E7      [19] 1557 	ld	-25 (ix),a
   4D50 23            [ 6] 1558 	inc	hl
   4D51 7E            [ 7] 1559 	ld	a,(hl)
   4D52 DD 77 E8      [19] 1560 	ld	-24 (ix),a
   4D55 DD CB E8 7E   [20] 1561 	bit	7, -24 (ix)
   4D59 C2 0A 4E      [10] 1562 	jp	NZ,00187$
   4D5C 3E 03         [ 7] 1563 	ld	a,#0x03
   4D5E DD BE E7      [19] 1564 	cp	a, -25 (ix)
   4D61 3E 00         [ 7] 1565 	ld	a,#0x00
   4D63 DD 9E E8      [19] 1566 	sbc	a, -24 (ix)
   4D66 E2 6B 4D      [10] 1567 	jp	PO, 00375$
   4D69 EE 80         [ 7] 1568 	xor	a, #0x80
   4D6B                    1569 00375$:
   4D6B FA 0A 4E      [10] 1570 	jp	M,00187$
   4D6E DD 5E E7      [19] 1571 	ld	e,-25 (ix)
   4D71 16 00         [ 7] 1572 	ld	d,#0x00
   4D73 21 79 4D      [10] 1573 	ld	hl,#00376$
   4D76 19            [11] 1574 	add	hl,de
   4D77 19            [11] 1575 	add	hl,de
                           1576 ;src/main.c:290: case 0:
   4D78 E9            [ 4] 1577 	jp	(hl)
   4D79                    1578 00376$:
   4D79 18 06         [12] 1579 	jr	00169$
   4D7B 18 27         [12] 1580 	jr	00173$
   4D7D 18 47         [12] 1581 	jr	00177$
   4D7F 18 69         [12] 1582 	jr	00181$
   4D81                    1583 00169$:
                           1584 ;src/main.c:291: if(pr.x<74)
   4D81 DD 6E F8      [19] 1585 	ld	l,-8 (ix)
   4D84 DD 66 F9      [19] 1586 	ld	h,-7 (ix)
   4D87 56            [ 7] 1587 	ld	d,(hl)
   4D88 7A            [ 4] 1588 	ld	a,d
   4D89 D6 4A         [ 7] 1589 	sub	a, #0x4A
   4D8B 30 0A         [12] 1590 	jr	NC,00171$
                           1591 ;src/main.c:292: pr.x++;
   4D8D 14            [ 4] 1592 	inc	d
   4D8E DD 6E F8      [19] 1593 	ld	l,-8 (ix)
   4D91 DD 66 F9      [19] 1594 	ld	h,-7 (ix)
   4D94 72            [ 7] 1595 	ld	(hl),d
   4D95 18 73         [12] 1596 	jr	00187$
   4D97                    1597 00171$:
                           1598 ;src/main.c:294: pr.vivo = 1;
   4D97 DD 6E F0      [19] 1599 	ld	l,-16 (ix)
   4D9A DD 66 F1      [19] 1600 	ld	h,-15 (ix)
   4D9D 36 01         [10] 1601 	ld	(hl),#0x01
   4D9F 23            [ 6] 1602 	inc	hl
   4DA0 36 00         [10] 1603 	ld	(hl),#0x00
                           1604 ;src/main.c:295: break;
   4DA2 18 66         [12] 1605 	jr	00187$
                           1606 ;src/main.c:296: case 1:
   4DA4                    1607 00173$:
                           1608 ;src/main.c:297: if(pr.x > 0)
   4DA4 DD 6E F8      [19] 1609 	ld	l,-8 (ix)
   4DA7 DD 66 F9      [19] 1610 	ld	h,-7 (ix)
   4DAA 7E            [ 7] 1611 	ld	a,(hl)
   4DAB B7            [ 4] 1612 	or	a, a
   4DAC 28 0B         [12] 1613 	jr	Z,00175$
                           1614 ;src/main.c:298: pr.x--;
   4DAE C6 FF         [ 7] 1615 	add	a,#0xFF
   4DB0 DD 6E F8      [19] 1616 	ld	l,-8 (ix)
   4DB3 DD 66 F9      [19] 1617 	ld	h,-7 (ix)
   4DB6 77            [ 7] 1618 	ld	(hl),a
   4DB7 18 51         [12] 1619 	jr	00187$
   4DB9                    1620 00175$:
                           1621 ;src/main.c:300: pr.vivo = 1;
   4DB9 DD 6E F0      [19] 1622 	ld	l,-16 (ix)
   4DBC DD 66 F1      [19] 1623 	ld	h,-15 (ix)
   4DBF 36 01         [10] 1624 	ld	(hl),#0x01
   4DC1 23            [ 6] 1625 	inc	hl
   4DC2 36 00         [10] 1626 	ld	(hl),#0x00
                           1627 ;src/main.c:301: break;
   4DC4 18 44         [12] 1628 	jr	00187$
                           1629 ;src/main.c:302: case 2:
   4DC6                    1630 00177$:
                           1631 ;src/main.c:216: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4DC6 DD 6E F6      [19] 1632 	ld	l,-10 (ix)
   4DC9 DD 66 F7      [19] 1633 	ld	h,-9 (ix)
   4DCC 56            [ 7] 1634 	ld	d,(hl)
                           1635 ;src/main.c:303: if(pr.y < 192)
   4DCD 7A            [ 4] 1636 	ld	a,d
   4DCE D6 C0         [ 7] 1637 	sub	a, #0xC0
   4DD0 30 0B         [12] 1638 	jr	NC,00179$
                           1639 ;src/main.c:304: pr.y+=2;
   4DD2 14            [ 4] 1640 	inc	d
   4DD3 14            [ 4] 1641 	inc	d
   4DD4 DD 6E F6      [19] 1642 	ld	l,-10 (ix)
   4DD7 DD 66 F7      [19] 1643 	ld	h,-9 (ix)
   4DDA 72            [ 7] 1644 	ld	(hl),d
   4DDB 18 2D         [12] 1645 	jr	00187$
   4DDD                    1646 00179$:
                           1647 ;src/main.c:306: pr.vivo = 1;
   4DDD DD 6E F0      [19] 1648 	ld	l,-16 (ix)
   4DE0 DD 66 F1      [19] 1649 	ld	h,-15 (ix)
   4DE3 36 01         [10] 1650 	ld	(hl),#0x01
   4DE5 23            [ 6] 1651 	inc	hl
   4DE6 36 00         [10] 1652 	ld	(hl),#0x00
                           1653 ;src/main.c:307: break;
   4DE8 18 20         [12] 1654 	jr	00187$
                           1655 ;src/main.c:308: case 3:
   4DEA                    1656 00181$:
                           1657 ;src/main.c:216: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4DEA DD 6E F6      [19] 1658 	ld	l,-10 (ix)
   4DED DD 66 F7      [19] 1659 	ld	h,-9 (ix)
   4DF0 7E            [ 7] 1660 	ld	a,(hl)
                           1661 ;src/main.c:309: if(pr.y > 0)
   4DF1 B7            [ 4] 1662 	or	a, a
   4DF2 28 0B         [12] 1663 	jr	Z,00183$
                           1664 ;src/main.c:310: pr.y-=2;
   4DF4 C6 FE         [ 7] 1665 	add	a,#0xFE
   4DF6 DD 6E F6      [19] 1666 	ld	l,-10 (ix)
   4DF9 DD 66 F7      [19] 1667 	ld	h,-9 (ix)
   4DFC 77            [ 7] 1668 	ld	(hl),a
   4DFD 18 0B         [12] 1669 	jr	00187$
   4DFF                    1670 00183$:
                           1671 ;src/main.c:312: pr.vivo = 1;
   4DFF DD 6E F0      [19] 1672 	ld	l,-16 (ix)
   4E02 DD 66 F1      [19] 1673 	ld	h,-15 (ix)
   4E05 36 01         [10] 1674 	ld	(hl),#0x01
   4E07 23            [ 6] 1675 	inc	hl
   4E08 36 00         [10] 1676 	ld	(hl),#0x00
                           1677 ;src/main.c:314: }
   4E0A                    1678 00187$:
                           1679 ;src/main.c:317: if(p.col != 2 && e.vivo == 0){
   4E0A DD 6E DD      [19] 1680 	ld	l,-35 (ix)
   4E0D DD 66 DE      [19] 1681 	ld	h,-34 (ix)
   4E10 56            [ 7] 1682 	ld	d,(hl)
   4E11 23            [ 6] 1683 	inc	hl
   4E12 66            [ 7] 1684 	ld	h,(hl)
   4E13 7A            [ 4] 1685 	ld	a,d
   4E14 D6 02         [ 7] 1686 	sub	a,#0x02
   4E16 20 04         [12] 1687 	jr	NZ,00377$
   4E18 B4            [ 4] 1688 	or	a,h
   4E19 CA BA 4E      [10] 1689 	jp	Z,00193$
   4E1C                    1690 00377$:
   4E1C DD 6E D3      [19] 1691 	ld	l,-45 (ix)
   4E1F DD 66 D4      [19] 1692 	ld	h,-44 (ix)
   4E22 56            [ 7] 1693 	ld	d,(hl)
   4E23 23            [ 6] 1694 	inc	hl
   4E24 7E            [ 7] 1695 	ld	a, (hl)
   4E25 B2            [ 4] 1696 	or	a,d
   4E26 C2 BA 4E      [10] 1697 	jp	NZ,00193$
                           1698 ;src/main.c:318: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk,0);
   4E29 DD 6E E3      [19] 1699 	ld	l,-29 (ix)
   4E2C DD 66 E4      [19] 1700 	ld	h,-28 (ix)
   4E2F 4E            [ 7] 1701 	ld	c,(hl)
   4E30 23            [ 6] 1702 	inc	hl
   4E31 46            [ 7] 1703 	ld	b,(hl)
   4E32 DD 6E DF      [19] 1704 	ld	l,-33 (ix)
   4E35 DD 66 E0      [19] 1705 	ld	h,-32 (ix)
   4E38 7E            [ 7] 1706 	ld	a,(hl)
   4E39 DD 77 E7      [19] 1707 	ld	-25 (ix),a
   4E3C 23            [ 6] 1708 	inc	hl
   4E3D 7E            [ 7] 1709 	ld	a,(hl)
   4E3E DD 77 E8      [19] 1710 	ld	-24 (ix),a
   4E41 DD 6E D5      [19] 1711 	ld	l,-43 (ix)
   4E44 DD 66 D6      [19] 1712 	ld	h,-42 (ix)
   4E47 5E            [ 7] 1713 	ld	e,(hl)
   4E48 DD 6E D7      [19] 1714 	ld	l,-41 (ix)
   4E4B DD 66 D8      [19] 1715 	ld	h,-40 (ix)
   4E4E 7E            [ 7] 1716 	ld	a,(hl)
   4E4F DD 77 E9      [19] 1717 	ld	-23 (ix),a
   4E52 DD 6E FA      [19] 1718 	ld	l,-6 (ix)
   4E55 DD 66 FB      [19] 1719 	ld	h,-5 (ix)
   4E58 7E            [ 7] 1720 	ld	a,(hl)
   4E59 DD 77 EA      [19] 1721 	ld	-22 (ix),a
   4E5C DD 6E E5      [19] 1722 	ld	l,-27 (ix)
   4E5F DD 66 E6      [19] 1723 	ld	h,-26 (ix)
   4E62 56            [ 7] 1724 	ld	d,(hl)
   4E63 AF            [ 4] 1725 	xor	a, a
   4E64 F5            [11] 1726 	push	af
   4E65 33            [ 6] 1727 	inc	sp
   4E66 C5            [11] 1728 	push	bc
   4E67 DD 6E E7      [19] 1729 	ld	l,-25 (ix)
   4E6A DD 66 E8      [19] 1730 	ld	h,-24 (ix)
   4E6D E5            [11] 1731 	push	hl
   4E6E 7B            [ 4] 1732 	ld	a,e
   4E6F F5            [11] 1733 	push	af
   4E70 33            [ 6] 1734 	inc	sp
   4E71 DD 7E E9      [19] 1735 	ld	a,-23 (ix)
   4E74 F5            [11] 1736 	push	af
   4E75 33            [ 6] 1737 	inc	sp
   4E76 DD 7E EA      [19] 1738 	ld	a,-22 (ix)
   4E79 F5            [11] 1739 	push	af
   4E7A 33            [ 6] 1740 	inc	sp
   4E7B D5            [11] 1741 	push	de
   4E7C 33            [ 6] 1742 	inc	sp
   4E7D CD 59 44      [17] 1743 	call	_checkCollisions
   4E80 FD 21 09 00   [14] 1744 	ld	iy,#9
   4E84 FD 39         [15] 1745 	add	iy,sp
   4E86 FD F9         [10] 1746 	ld	sp,iy
   4E88 55            [ 4] 1747 	ld	d,l
   4E89 5C            [ 4] 1748 	ld	e,h
   4E8A DD 6E DD      [19] 1749 	ld	l,-35 (ix)
   4E8D DD 66 DE      [19] 1750 	ld	h,-34 (ix)
   4E90 72            [ 7] 1751 	ld	(hl),d
   4E91 23            [ 6] 1752 	inc	hl
   4E92 73            [ 7] 1753 	ld	(hl),e
                           1754 ;src/main.c:319: if(p.col == 2)
   4E93 7A            [ 4] 1755 	ld	a,d
   4E94 D6 02         [ 7] 1756 	sub	a,#0x02
   4E96 20 16         [12] 1757 	jr	NZ,00189$
   4E98 B3            [ 4] 1758 	or	a,e
   4E99 20 13         [12] 1759 	jr	NZ,00189$
                           1760 ;src/main.c:320: p.life--;
   4E9B DD 6E D9      [19] 1761 	ld	l,-39 (ix)
   4E9E DD 66 DA      [19] 1762 	ld	h,-38 (ix)
   4EA1 5E            [ 7] 1763 	ld	e,(hl)
   4EA2 23            [ 6] 1764 	inc	hl
   4EA3 56            [ 7] 1765 	ld	d,(hl)
   4EA4 1B            [ 6] 1766 	dec	de
   4EA5 DD 6E D9      [19] 1767 	ld	l,-39 (ix)
   4EA8 DD 66 DA      [19] 1768 	ld	h,-38 (ix)
   4EAB 73            [ 7] 1769 	ld	(hl),e
   4EAC 23            [ 6] 1770 	inc	hl
   4EAD 72            [ 7] 1771 	ld	(hl),d
   4EAE                    1772 00189$:
                           1773 ;src/main.c:321: if(p.life == 0)
   4EAE DD 6E D9      [19] 1774 	ld	l,-39 (ix)
   4EB1 DD 66 DA      [19] 1775 	ld	h,-38 (ix)
   4EB4 56            [ 7] 1776 	ld	d,(hl)
   4EB5 23            [ 6] 1777 	inc	hl
   4EB6 7E            [ 7] 1778 	ld	a, (hl)
   4EB7 B2            [ 4] 1779 	or	a,d
                           1780 ;src/main.c:322: return;
   4EB8 28 20         [12] 1781 	jr	Z,00200$
   4EBA                    1782 00193$:
                           1783 ;src/main.c:324: if(p.col == 1)
   4EBA DD 6E DD      [19] 1784 	ld	l,-35 (ix)
   4EBD DD 66 DE      [19] 1785 	ld	h,-34 (ix)
   4EC0 56            [ 7] 1786 	ld	d,(hl)
   4EC1 23            [ 6] 1787 	inc	hl
   4EC2 66            [ 7] 1788 	ld	h,(hl)
   4EC3 15            [ 4] 1789 	dec	d
   4EC4 C2 5E 48      [10] 1790 	jp	NZ,00198$
   4EC7 7C            [ 4] 1791 	ld	a,h
   4EC8 B7            [ 4] 1792 	or	a, a
   4EC9 C2 5E 48      [10] 1793 	jp	NZ,00198$
                           1794 ;src/main.c:325: e.vivo = 1;
   4ECC DD 6E D3      [19] 1795 	ld	l,-45 (ix)
   4ECF DD 66 D4      [19] 1796 	ld	h,-44 (ix)
   4ED2 36 01         [10] 1797 	ld	(hl),#0x01
   4ED4 23            [ 6] 1798 	inc	hl
   4ED5 36 00         [10] 1799 	ld	(hl),#0x00
   4ED7 C3 5E 48      [10] 1800 	jp	00198$
   4EDA                    1801 00200$:
   4EDA DD F9         [10] 1802 	ld	sp, ix
   4EDC DD E1         [14] 1803 	pop	ix
   4EDE C9            [10] 1804 	ret
                           1805 ;src/main.c:332: void main(void) {
                           1806 ;	---------------------------------
                           1807 ; Function main
                           1808 ; ---------------------------------
   4EDF                    1809 _main::
                           1810 ;src/main.c:334: init();
   4EDF CD C4 43      [17] 1811 	call	_init
                           1812 ;src/main.c:337: while(1){
   4EE2                    1813 00102$:
                           1814 ;src/main.c:338: menu();
   4EE2 CD ED 43      [17] 1815 	call	_menu
                           1816 ;src/main.c:339: game();
   4EE5 CD 4F 46      [17] 1817 	call	_game
   4EE8 18 F8         [12] 1818 	jr	00102$
                           1819 	.area _CODE
                           1820 	.area _INITIALIZER
                           1821 	.area _CABS (ABS)
