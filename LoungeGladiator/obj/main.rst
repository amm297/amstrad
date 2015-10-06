                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct  6 12:07:54 2015
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
   43C4 CD 12 53      [17]   71 	call	_cpct_disableFirmware
                             72 ;src/main.c:52: cpct_setVideoMode(0);
   43C7 AF            [ 4]   73 	xor	a, a
   43C8 F5            [11]   74 	push	af
   43C9 33            [ 6]   75 	inc	sp
   43CA CD EF 52      [17]   76 	call	_cpct_setVideoMode
   43CD 33            [ 6]   77 	inc	sp
                             78 ;src/main.c:53: cpct_fw2hw(g_palette,4);
   43CE 11 E9 43      [10]   79 	ld	de,#_g_palette
   43D1 3E 04         [ 7]   80 	ld	a,#0x04
   43D3 F5            [11]   81 	push	af
   43D4 33            [ 6]   82 	inc	sp
   43D5 D5            [11]   83 	push	de
   43D6 CD 79 52      [17]   84 	call	_cpct_fw2hw
   43D9 F1            [10]   85 	pop	af
   43DA 33            [ 6]   86 	inc	sp
                             87 ;src/main.c:54: cpct_setPalette(g_palette,4);
   43DB 11 E9 43      [10]   88 	ld	de,#_g_palette
   43DE 3E 04         [ 7]   89 	ld	a,#0x04
   43E0 F5            [11]   90 	push	af
   43E1 33            [ 6]   91 	inc	sp
   43E2 D5            [11]   92 	push	de
   43E3 CD 1E 51      [17]   93 	call	_cpct_setPalette
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
   43F7 CD 01 53      [17]  115 	call	_cpct_memset
                            116 ;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,20,10);
   43FA 21 14 0A      [10]  117 	ld	hl,#0x0A14
   43FD E5            [11]  118 	push	hl
   43FE 21 00 C0      [10]  119 	ld	hl,#0xC000
   4401 E5            [11]  120 	push	hl
   4402 CD DB 53      [17]  121 	call	_cpct_getScreenPtr
                            122 ;src/main.c:63: cpct_drawStringM0("Super Menu",memptr,2,3);
   4405 EB            [ 4]  123 	ex	de,hl
   4406 01 42 44      [10]  124 	ld	bc,#___str_0+0
   4409 21 02 03      [10]  125 	ld	hl,#0x0302
   440C E5            [11]  126 	push	hl
   440D D5            [11]  127 	push	de
   440E C5            [11]  128 	push	bc
   440F CD B8 51      [17]  129 	call	_cpct_drawStringM0
   4412 21 06 00      [10]  130 	ld	hl,#6
   4415 39            [11]  131 	add	hl,sp
   4416 F9            [ 6]  132 	ld	sp,hl
                            133 ;src/main.c:65: memptr = cpct_getScreenPtr(VMEM,18,180);
   4417 21 12 B4      [10]  134 	ld	hl,#0xB412
   441A E5            [11]  135 	push	hl
   441B 21 00 C0      [10]  136 	ld	hl,#0xC000
   441E E5            [11]  137 	push	hl
   441F CD DB 53      [17]  138 	call	_cpct_getScreenPtr
                            139 ;src/main.c:66: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   4422 EB            [ 4]  140 	ex	de,hl
   4423 01 4D 44      [10]  141 	ld	bc,#___str_1+0
   4426 21 04 05      [10]  142 	ld	hl,#0x0504
   4429 E5            [11]  143 	push	hl
   442A D5            [11]  144 	push	de
   442B C5            [11]  145 	push	bc
   442C CD B8 51      [17]  146 	call	_cpct_drawStringM0
   442F 21 06 00      [10]  147 	ld	hl,#6
   4432 39            [11]  148 	add	hl,sp
   4433 F9            [ 6]  149 	ld	sp,hl
                            150 ;src/main.c:68: do{
   4434                     151 00101$:
                            152 ;src/main.c:69: cpct_scanKeyboard_f();
   4434 CD 4E 51      [17]  153 	call	_cpct_scanKeyboard_f
                            154 ;src/main.c:70: }while(!cpct_isKeyPressed(Key_Enter));
   4437 21 00 40      [10]  155 	ld	hl,#0x4000
   443A CD 42 51      [17]  156 	call	_cpct_isKeyPressed
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
                            167 ;src/main.c:75: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            168 ;	---------------------------------
                            169 ; Function checkCollisions
                            170 ; ---------------------------------
   4459                     171 _checkCollisions::
   4459 DD E5         [15]  172 	push	ix
   445B DD 21 00 00   [14]  173 	ld	ix,#0
   445F DD 39         [15]  174 	add	ix,sp
   4461 3B            [ 6]  175 	dec	sp
                            176 ;src/main.c:76: if((u8)atk >= 21)
   4462 DD 7E 0A      [19]  177 	ld	a,10 (ix)
   4465 DD 77 FF      [19]  178 	ld	-1 (ix),a
                            179 ;src/main.c:78: if(eX - pX > -1 && eX - pX < 11)
   4468 DD 4E 06      [19]  180 	ld	c,6 (ix)
   446B 06 00         [ 7]  181 	ld	b,#0x00
   446D DD 6E 04      [19]  182 	ld	l,4 (ix)
   4470 26 00         [ 7]  183 	ld	h,#0x00
   4472 79            [ 4]  184 	ld	a,c
   4473 95            [ 4]  185 	sub	a, l
   4474 5F            [ 4]  186 	ld	e,a
   4475 78            [ 4]  187 	ld	a,b
   4476 9C            [ 4]  188 	sbc	a, h
   4477 57            [ 4]  189 	ld	d,a
                            190 ;src/main.c:76: if((u8)atk >= 21)
   4478 DD 7E FF      [19]  191 	ld	a,-1 (ix)
   447B D6 15         [ 7]  192 	sub	a, #0x15
   447D 38 4F         [12]  193 	jr	C,00118$
                            194 ;src/main.c:77: if(dir == 0)
   447F DD 7E 09      [19]  195 	ld	a,9 (ix)
   4482 DD B6 08      [19]  196 	or	a,8 (ix)
   4485 20 21         [12]  197 	jr	NZ,00110$
                            198 ;src/main.c:78: if(eX - pX > -1 && eX - pX < 11)
   4487 3E FF         [ 7]  199 	ld	a,#0xFF
   4489 BB            [ 4]  200 	cp	a, e
   448A 9A            [ 4]  201 	sbc	a, d
   448B E2 90 44      [10]  202 	jp	PO, 00162$
   448E EE 80         [ 7]  203 	xor	a, #0x80
   4490                     204 00162$:
   4490 F2 A3 44      [10]  205 	jp	P,00102$
   4493 7B            [ 4]  206 	ld	a,e
   4494 D6 0B         [ 7]  207 	sub	a, #0x0B
   4496 7A            [ 4]  208 	ld	a,d
   4497 17            [ 4]  209 	rla
   4498 3F            [ 4]  210 	ccf
   4499 1F            [ 4]  211 	rra
   449A DE 80         [ 7]  212 	sbc	a, #0x80
   449C 30 05         [12]  213 	jr	NC,00102$
                            214 ;src/main.c:79: return 1;
   449E 21 01 00      [10]  215 	ld	hl,#0x0001
   44A1 18 6E         [12]  216 	jr	00120$
   44A3                     217 00102$:
                            218 ;src/main.c:81: return 0;
   44A3 21 00 00      [10]  219 	ld	hl,#0x0000
   44A6 18 69         [12]  220 	jr	00120$
   44A8                     221 00110$:
                            222 ;src/main.c:83: if(pX - eX > -1 && pX - eX < 11)
   44A8 BF            [ 4]  223 	cp	a, a
   44A9 ED 42         [15]  224 	sbc	hl, bc
   44AB 3E FF         [ 7]  225 	ld	a,#0xFF
   44AD BD            [ 4]  226 	cp	a, l
   44AE 9C            [ 4]  227 	sbc	a, h
   44AF E2 B4 44      [10]  228 	jp	PO, 00163$
   44B2 EE 80         [ 7]  229 	xor	a, #0x80
   44B4                     230 00163$:
   44B4 F2 C9 44      [10]  231 	jp	P,00106$
   44B7 11 0B 80      [10]  232 	ld	de, #0x800B
   44BA 29            [11]  233 	add	hl, hl
   44BB 3F            [ 4]  234 	ccf
   44BC CB 1C         [ 8]  235 	rr	h
   44BE CB 1D         [ 8]  236 	rr	l
   44C0 ED 52         [15]  237 	sbc	hl, de
   44C2 30 05         [12]  238 	jr	NC,00106$
                            239 ;src/main.c:84: return 1;
   44C4 21 01 00      [10]  240 	ld	hl,#0x0001
   44C7 18 48         [12]  241 	jr	00120$
   44C9                     242 00106$:
                            243 ;src/main.c:86: return 0;
   44C9 21 00 00      [10]  244 	ld	hl,#0x0000
   44CC 18 43         [12]  245 	jr	00120$
   44CE                     246 00118$:
                            247 ;src/main.c:88: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
   44CE AF            [ 4]  248 	xor	a, a
   44CF BB            [ 4]  249 	cp	a, e
   44D0 9A            [ 4]  250 	sbc	a, d
   44D1 E2 D6 44      [10]  251 	jp	PO, 00164$
   44D4 EE 80         [ 7]  252 	xor	a, #0x80
   44D6                     253 00164$:
   44D6 F2 0E 45      [10]  254 	jp	P,00119$
   44D9 7B            [ 4]  255 	ld	a,e
   44DA D6 04         [ 7]  256 	sub	a, #0x04
   44DC 7A            [ 4]  257 	ld	a,d
   44DD 17            [ 4]  258 	rla
   44DE 3F            [ 4]  259 	ccf
   44DF 1F            [ 4]  260 	rra
   44E0 DE 80         [ 7]  261 	sbc	a, #0x80
   44E2 30 2A         [12]  262 	jr	NC,00119$
   44E4 DD 6E 07      [19]  263 	ld	l,7 (ix)
   44E7 26 00         [ 7]  264 	ld	h,#0x00
   44E9 DD 5E 05      [19]  265 	ld	e,5 (ix)
   44EC 16 00         [ 7]  266 	ld	d,#0x00
   44EE BF            [ 4]  267 	cp	a, a
   44EF ED 52         [15]  268 	sbc	hl, de
   44F1 AF            [ 4]  269 	xor	a, a
   44F2 BD            [ 4]  270 	cp	a, l
   44F3 9C            [ 4]  271 	sbc	a, h
   44F4 E2 F9 44      [10]  272 	jp	PO, 00165$
   44F7 EE 80         [ 7]  273 	xor	a, #0x80
   44F9                     274 00165$:
   44F9 F2 0E 45      [10]  275 	jp	P,00119$
   44FC 11 10 80      [10]  276 	ld	de, #0x8010
   44FF 29            [11]  277 	add	hl, hl
   4500 3F            [ 4]  278 	ccf
   4501 CB 1C         [ 8]  279 	rr	h
   4503 CB 1D         [ 8]  280 	rr	l
   4505 ED 52         [15]  281 	sbc	hl, de
   4507 30 05         [12]  282 	jr	NC,00119$
                            283 ;src/main.c:89: return 2;
   4509 21 02 00      [10]  284 	ld	hl,#0x0002
   450C 18 03         [12]  285 	jr	00120$
   450E                     286 00119$:
                            287 ;src/main.c:91: return 0;
   450E 21 00 00      [10]  288 	ld	hl,#0x0000
   4511                     289 00120$:
   4511 33            [ 6]  290 	inc	sp
   4512 DD E1         [14]  291 	pop	ix
   4514 C9            [10]  292 	ret
                            293 ;src/main.c:94: u8* checkSprite(u8* atk, u8* dir){
                            294 ;	---------------------------------
                            295 ; Function checkSprite
                            296 ; ---------------------------------
   4515                     297 _checkSprite::
                            298 ;src/main.c:95: if(atk <= 20)
   4515 3E 14         [ 7]  299 	ld	a,#0x14
   4517 FD 21 02 00   [14]  300 	ld	iy,#2
   451B FD 39         [15]  301 	add	iy,sp
   451D FD BE 00      [19]  302 	cp	a, 0 (iy)
   4520 3E 00         [ 7]  303 	ld	a,#0x00
   4522 FD 9E 01      [19]  304 	sbc	a, 1 (iy)
   4525 38 3B         [12]  305 	jr	C,00110$
                            306 ;src/main.c:96: switch((int)dir){
   4527 FD 21 04 00   [14]  307 	ld	iy,#4
   452B FD 39         [15]  308 	add	iy,sp
   452D FD 5E 00      [19]  309 	ld	e,0 (iy)
   4530 FD 56 01      [19]  310 	ld	d,1 (iy)
   4533 CB 7A         [ 8]  311 	bit	7, d
   4535 C0            [11]  312 	ret	NZ
   4536 3E 03         [ 7]  313 	ld	a,#0x03
   4538 BB            [ 4]  314 	cp	a, e
   4539 3E 00         [ 7]  315 	ld	a,#0x00
   453B 9A            [ 4]  316 	sbc	a, d
   453C E2 41 45      [10]  317 	jp	PO, 00130$
   453F EE 80         [ 7]  318 	xor	a, #0x80
   4541                     319 00130$:
   4541 F8            [11]  320 	ret	M
   4542 16 00         [ 7]  321 	ld	d,#0x00
   4544 21 4A 45      [10]  322 	ld	hl,#00131$
   4547 19            [11]  323 	add	hl,de
   4548 19            [11]  324 	add	hl,de
                            325 ;src/main.c:97: case 0:
   4549 E9            [ 4]  326 	jp	(hl)
   454A                     327 00131$:
   454A 18 06         [12]  328 	jr	00101$
   454C 18 08         [12]  329 	jr	00102$
   454E 18 0A         [12]  330 	jr	00103$
   4550 18 0C         [12]  331 	jr	00104$
   4552                     332 00101$:
                            333 ;src/main.c:98: return gladis_quieto_dcha;
   4552 21 40 42      [10]  334 	ld	hl,#_gladis_quieto_dcha
   4555 C9            [10]  335 	ret
                            336 ;src/main.c:100: case 1:
   4556                     337 00102$:
                            338 ;src/main.c:101: return gladis_quieto_izda;
   4556 21 C0 42      [10]  339 	ld	hl,#_gladis_quieto_izda
   4559 C9            [10]  340 	ret
                            341 ;src/main.c:103: case 2:
   455A                     342 00103$:
                            343 ;src/main.c:104: return gladis_quieto_dcha;
   455A 21 40 42      [10]  344 	ld	hl,#_gladis_quieto_dcha
   455D C9            [10]  345 	ret
                            346 ;src/main.c:106: case 3:
   455E                     347 00104$:
                            348 ;src/main.c:107: return gladis_arriba_dcha;
   455E 21 40 40      [10]  349 	ld	hl,#_gladis_arriba_dcha
   4561 C9            [10]  350 	ret
                            351 ;src/main.c:108: }
   4562                     352 00110$:
                            353 ;src/main.c:109: else if(dir == 0){
   4562 21 05 00      [10]  354 	ld	hl, #4+1
   4565 39            [11]  355 	add	hl, sp
   4566 7E            [ 7]  356 	ld	a, (hl)
   4567 2B            [ 6]  357 	dec	hl
   4568 B6            [ 7]  358 	or	a,(hl)
   4569 20 04         [12]  359 	jr	NZ,00107$
                            360 ;src/main.c:110: return gladis_atk_dcha;
   456B 21 DE 4F      [10]  361 	ld	hl,#_gladis_atk_dcha
   456E C9            [10]  362 	ret
   456F                     363 00107$:
                            364 ;src/main.c:112: return gladis_atk_izda;
   456F 21 7E 50      [10]  365 	ld	hl,#_gladis_atk_izda
   4572 C9            [10]  366 	ret
                            367 ;src/main.c:116: u8* checkSpriteFlecha(u8* dir){
                            368 ;	---------------------------------
                            369 ; Function checkSpriteFlecha
                            370 ; ---------------------------------
   4573                     371 _checkSpriteFlecha::
                            372 ;src/main.c:117: switch((int)dir){
   4573 C1            [10]  373 	pop	bc
   4574 D1            [10]  374 	pop	de
   4575 D5            [11]  375 	push	de
   4576 C5            [11]  376 	push	bc
   4577 CB 7A         [ 8]  377 	bit	7, d
   4579 C0            [11]  378 	ret	NZ
   457A 3E 03         [ 7]  379 	ld	a,#0x03
   457C BB            [ 4]  380 	cp	a, e
   457D 3E 00         [ 7]  381 	ld	a,#0x00
   457F 9A            [ 4]  382 	sbc	a, d
   4580 E2 85 45      [10]  383 	jp	PO, 00116$
   4583 EE 80         [ 7]  384 	xor	a, #0x80
   4585                     385 00116$:
   4585 F8            [11]  386 	ret	M
   4586 16 00         [ 7]  387 	ld	d,#0x00
   4588 21 8E 45      [10]  388 	ld	hl,#00117$
   458B 19            [11]  389 	add	hl,de
   458C 19            [11]  390 	add	hl,de
                            391 ;src/main.c:118: case 0:
   458D E9            [ 4]  392 	jp	(hl)
   458E                     393 00117$:
   458E 18 06         [12]  394 	jr	00101$
   4590 18 08         [12]  395 	jr	00102$
   4592 18 0A         [12]  396 	jr	00103$
   4594 18 0C         [12]  397 	jr	00104$
   4596                     398 00101$:
                            399 ;src/main.c:119: return flecha_dcha;
   4596 21 9E 4F      [10]  400 	ld	hl,#_flecha_dcha
   4599 C9            [10]  401 	ret
                            402 ;src/main.c:121: case 1:
   459A                     403 00102$:
                            404 ;src/main.c:122: return flecha_izda;
   459A 21 BE 4F      [10]  405 	ld	hl,#_flecha_izda
   459D C9            [10]  406 	ret
                            407 ;src/main.c:124: case 2:
   459E                     408 00103$:
                            409 ;src/main.c:125: return flecha_abajo;
   459E 21 20 40      [10]  410 	ld	hl,#_flecha_abajo
   45A1 C9            [10]  411 	ret
                            412 ;src/main.c:127: case 3:
   45A2                     413 00104$:
                            414 ;src/main.c:128: return flecha_arriba;
   45A2 21 00 40      [10]  415 	ld	hl,#_flecha_arriba
                            416 ;src/main.c:130: }
   45A5 C9            [10]  417 	ret
                            418 ;src/main.c:134: void drawFatiga(u8* atk, u8* memptr, u8 col){
                            419 ;	---------------------------------
                            420 ; Function drawFatiga
                            421 ; ---------------------------------
   45A6                     422 _drawFatiga::
   45A6 DD E5         [15]  423 	push	ix
   45A8 DD 21 00 00   [14]  424 	ld	ix,#0
   45AC DD 39         [15]  425 	add	ix,sp
                            426 ;src/main.c:135: if(atk < 20)
   45AE DD 7E 04      [19]  427 	ld	a,4 (ix)
   45B1 D6 14         [ 7]  428 	sub	a, #0x14
   45B3 DD 7E 05      [19]  429 	ld	a,5 (ix)
   45B6 DE 00         [ 7]  430 	sbc	a, #0x00
   45B8 30 04         [12]  431 	jr	NC,00102$
                            432 ;src/main.c:136: col = 2;
   45BA DD 36 08 02   [19]  433 	ld	8 (ix),#0x02
   45BE                     434 00102$:
                            435 ;src/main.c:137: if(atk > 30 || atk <= 20){
   45BE 3E 14         [ 7]  436 	ld	a,#0x14
   45C0 DD BE 04      [19]  437 	cp	a, 4 (ix)
   45C3 3E 00         [ 7]  438 	ld	a,#0x00
   45C5 DD 9E 05      [19]  439 	sbc	a, 5 (ix)
   45C8 3E 00         [ 7]  440 	ld	a,#0x00
   45CA 17            [ 4]  441 	rla
   45CB 57            [ 4]  442 	ld	d,a
   45CC 3E 1E         [ 7]  443 	ld	a,#0x1E
   45CE DD BE 04      [19]  444 	cp	a, 4 (ix)
   45D1 3E 00         [ 7]  445 	ld	a,#0x00
   45D3 DD 9E 05      [19]  446 	sbc	a, 5 (ix)
   45D6 38 04         [12]  447 	jr	C,00103$
   45D8 7A            [ 4]  448 	ld	a,d
   45D9 B7            [ 4]  449 	or	a, a
   45DA 20 27         [12]  450 	jr	NZ,00104$
   45DC                     451 00103$:
                            452 ;src/main.c:138: memptr = cpct_getScreenPtr(VMEM,4,160);
   45DC D5            [11]  453 	push	de
   45DD 21 04 A0      [10]  454 	ld	hl,#0xA004
   45E0 E5            [11]  455 	push	hl
   45E1 21 00 C0      [10]  456 	ld	hl,#0xC000
   45E4 E5            [11]  457 	push	hl
   45E5 CD DB 53      [17]  458 	call	_cpct_getScreenPtr
   45E8 D1            [10]  459 	pop	de
                            460 ;src/main.c:139: cpct_drawSolidBox(memptr, col, 2, 8);
   45E9 DD 75 06      [19]  461 	ld	6 (ix),l
   45EC DD 74 07      [19]  462 	ld	7 (ix),h
   45EF 4D            [ 4]  463 	ld	c,l
   45F0 44            [ 4]  464 	ld	b,h
   45F1 D5            [11]  465 	push	de
   45F2 21 02 08      [10]  466 	ld	hl,#0x0802
   45F5 E5            [11]  467 	push	hl
   45F6 DD 7E 08      [19]  468 	ld	a,8 (ix)
   45F9 F5            [11]  469 	push	af
   45FA 33            [ 6]  470 	inc	sp
   45FB C5            [11]  471 	push	bc
   45FC CD 23 53      [17]  472 	call	_cpct_drawSolidBox
   45FF F1            [10]  473 	pop	af
   4600 F1            [10]  474 	pop	af
   4601 33            [ 6]  475 	inc	sp
   4602 D1            [10]  476 	pop	de
   4603                     477 00104$:
                            478 ;src/main.c:141: if(atk > 40 || atk <= 20){
   4603 3E 28         [ 7]  479 	ld	a,#0x28
   4605 DD BE 04      [19]  480 	cp	a, 4 (ix)
   4608 3E 00         [ 7]  481 	ld	a,#0x00
   460A DD 9E 05      [19]  482 	sbc	a, 5 (ix)
   460D 38 04         [12]  483 	jr	C,00106$
   460F 7A            [ 4]  484 	ld	a,d
   4610 B7            [ 4]  485 	or	a, a
   4611 20 27         [12]  486 	jr	NZ,00107$
   4613                     487 00106$:
                            488 ;src/main.c:142: memptr = cpct_getScreenPtr(VMEM,7,160);
   4613 D5            [11]  489 	push	de
   4614 21 07 A0      [10]  490 	ld	hl,#0xA007
   4617 E5            [11]  491 	push	hl
   4618 21 00 C0      [10]  492 	ld	hl,#0xC000
   461B E5            [11]  493 	push	hl
   461C CD DB 53      [17]  494 	call	_cpct_getScreenPtr
   461F D1            [10]  495 	pop	de
                            496 ;src/main.c:143: cpct_drawSolidBox(memptr, col, 2, 8);
   4620 DD 75 06      [19]  497 	ld	6 (ix),l
   4623 DD 74 07      [19]  498 	ld	7 (ix),h
   4626 4D            [ 4]  499 	ld	c,l
   4627 44            [ 4]  500 	ld	b,h
   4628 D5            [11]  501 	push	de
   4629 21 02 08      [10]  502 	ld	hl,#0x0802
   462C E5            [11]  503 	push	hl
   462D DD 7E 08      [19]  504 	ld	a,8 (ix)
   4630 F5            [11]  505 	push	af
   4631 33            [ 6]  506 	inc	sp
   4632 C5            [11]  507 	push	bc
   4633 CD 23 53      [17]  508 	call	_cpct_drawSolidBox
   4636 F1            [10]  509 	pop	af
   4637 F1            [10]  510 	pop	af
   4638 33            [ 6]  511 	inc	sp
   4639 D1            [10]  512 	pop	de
   463A                     513 00107$:
                            514 ;src/main.c:145: if(atk <= 20){
   463A 7A            [ 4]  515 	ld	a,d
   463B B7            [ 4]  516 	or	a, a
   463C 20 22         [12]  517 	jr	NZ,00111$
                            518 ;src/main.c:146: memptr = cpct_getScreenPtr(VMEM,10,160);
   463E 21 0A A0      [10]  519 	ld	hl,#0xA00A
   4641 E5            [11]  520 	push	hl
   4642 21 00 C0      [10]  521 	ld	hl,#0xC000
   4645 E5            [11]  522 	push	hl
   4646 CD DB 53      [17]  523 	call	_cpct_getScreenPtr
                            524 ;src/main.c:147: cpct_drawSolidBox(memptr, col, 2, 8);
   4649 DD 75 06      [19]  525 	ld	6 (ix),l
   464C DD 74 07      [19]  526 	ld	7 (ix),h
   464F EB            [ 4]  527 	ex	de,hl
   4650 21 02 08      [10]  528 	ld	hl,#0x0802
   4653 E5            [11]  529 	push	hl
   4654 DD 7E 08      [19]  530 	ld	a,8 (ix)
   4657 F5            [11]  531 	push	af
   4658 33            [ 6]  532 	inc	sp
   4659 D5            [11]  533 	push	de
   465A CD 23 53      [17]  534 	call	_cpct_drawSolidBox
   465D F1            [10]  535 	pop	af
   465E F1            [10]  536 	pop	af
   465F 33            [ 6]  537 	inc	sp
   4660                     538 00111$:
   4660 DD E1         [14]  539 	pop	ix
   4662 C9            [10]  540 	ret
                            541 ;src/main.c:152: void drawVida(u8* life, u8* memptr){
                            542 ;	---------------------------------
                            543 ; Function drawVida
                            544 ; ---------------------------------
   4663                     545 _drawVida::
   4663 DD E5         [15]  546 	push	ix
   4665 DD 21 00 00   [14]  547 	ld	ix,#0
   4669 DD 39         [15]  548 	add	ix,sp
                            549 ;src/main.c:153: if(life >= 1){
   466B DD 7E 04      [19]  550 	ld	a,4 (ix)
   466E D6 01         [ 7]  551 	sub	a, #0x01
   4670 DD 7E 05      [19]  552 	ld	a,5 (ix)
   4673 DE 00         [ 7]  553 	sbc	a, #0x00
   4675 38 1F         [12]  554 	jr	C,00102$
                            555 ;src/main.c:154: memptr = cpct_getScreenPtr(VMEM,55,160);
   4677 21 37 A0      [10]  556 	ld	hl,#0xA037
   467A E5            [11]  557 	push	hl
   467B 21 00 C0      [10]  558 	ld	hl,#0xC000
   467E E5            [11]  559 	push	hl
   467F CD DB 53      [17]  560 	call	_cpct_getScreenPtr
                            561 ;src/main.c:155: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4682 DD 75 06      [19]  562 	ld	6 (ix),l
   4685 DD 74 07      [19]  563 	ld	7 (ix),h
   4688 4D            [ 4]  564 	ld	c,l
   4689 44            [ 4]  565 	ld	b,h
   468A 11 44 43      [10]  566 	ld	de,#_corazon_lleno
   468D 21 04 08      [10]  567 	ld	hl,#0x0804
   4690 E5            [11]  568 	push	hl
   4691 C5            [11]  569 	push	bc
   4692 D5            [11]  570 	push	de
   4693 CD 9D 52      [17]  571 	call	_cpct_drawSpriteMasked
   4696                     572 00102$:
                            573 ;src/main.c:157: memptr = cpct_getScreenPtr(VMEM,60,160);
   4696 21 3C A0      [10]  574 	ld	hl,#0xA03C
   4699 E5            [11]  575 	push	hl
   469A 21 00 C0      [10]  576 	ld	hl,#0xC000
   469D E5            [11]  577 	push	hl
   469E CD DB 53      [17]  578 	call	_cpct_getScreenPtr
                            579 ;src/main.c:155: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46A1 DD 75 06      [19]  580 	ld	6 (ix),l
   46A4 DD 74 07      [19]  581 	ld	7 (ix),h
   46A7 4D            [ 4]  582 	ld	c,l
   46A8 44            [ 4]  583 	ld	b,h
                            584 ;src/main.c:158: if(life >= 2)
   46A9 DD 7E 04      [19]  585 	ld	a,4 (ix)
   46AC D6 02         [ 7]  586 	sub	a, #0x02
   46AE DD 7E 05      [19]  587 	ld	a,5 (ix)
   46B1 DE 00         [ 7]  588 	sbc	a, #0x00
   46B3 38 0E         [12]  589 	jr	C,00104$
                            590 ;src/main.c:159: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46B5 11 44 43      [10]  591 	ld	de,#_corazon_lleno
   46B8 21 04 08      [10]  592 	ld	hl,#0x0804
   46BB E5            [11]  593 	push	hl
   46BC C5            [11]  594 	push	bc
   46BD D5            [11]  595 	push	de
   46BE CD 9D 52      [17]  596 	call	_cpct_drawSpriteMasked
   46C1 18 0C         [12]  597 	jr	00105$
   46C3                     598 00104$:
                            599 ;src/main.c:161: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   46C3 11 84 43      [10]  600 	ld	de,#_corazon_roto
   46C6 21 04 08      [10]  601 	ld	hl,#0x0804
   46C9 E5            [11]  602 	push	hl
   46CA C5            [11]  603 	push	bc
   46CB D5            [11]  604 	push	de
   46CC CD 9D 52      [17]  605 	call	_cpct_drawSpriteMasked
   46CF                     606 00105$:
                            607 ;src/main.c:162: memptr = cpct_getScreenPtr(VMEM,65,160);
   46CF 21 41 A0      [10]  608 	ld	hl,#0xA041
   46D2 E5            [11]  609 	push	hl
   46D3 21 00 C0      [10]  610 	ld	hl,#0xC000
   46D6 E5            [11]  611 	push	hl
   46D7 CD DB 53      [17]  612 	call	_cpct_getScreenPtr
                            613 ;src/main.c:155: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46DA DD 75 06      [19]  614 	ld	6 (ix),l
   46DD DD 74 07      [19]  615 	ld	7 (ix),h
   46E0 EB            [ 4]  616 	ex	de,hl
                            617 ;src/main.c:163: if(life >= 3)
   46E1 DD 7E 04      [19]  618 	ld	a,4 (ix)
   46E4 D6 03         [ 7]  619 	sub	a, #0x03
   46E6 DD 7E 05      [19]  620 	ld	a,5 (ix)
   46E9 DE 00         [ 7]  621 	sbc	a, #0x00
   46EB 38 0E         [12]  622 	jr	C,00107$
                            623 ;src/main.c:164: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46ED 01 44 43      [10]  624 	ld	bc,#_corazon_lleno
   46F0 21 04 08      [10]  625 	ld	hl,#0x0804
   46F3 E5            [11]  626 	push	hl
   46F4 D5            [11]  627 	push	de
   46F5 C5            [11]  628 	push	bc
   46F6 CD 9D 52      [17]  629 	call	_cpct_drawSpriteMasked
   46F9 18 0C         [12]  630 	jr	00109$
   46FB                     631 00107$:
                            632 ;src/main.c:166: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   46FB 01 84 43      [10]  633 	ld	bc,#_corazon_roto+0
   46FE 21 04 08      [10]  634 	ld	hl,#0x0804
   4701 E5            [11]  635 	push	hl
   4702 D5            [11]  636 	push	de
   4703 C5            [11]  637 	push	bc
   4704 CD 9D 52      [17]  638 	call	_cpct_drawSpriteMasked
   4707                     639 00109$:
   4707 DD E1         [14]  640 	pop	ix
   4709 C9            [10]  641 	ret
                            642 ;src/main.c:172: void game(){
                            643 ;	---------------------------------
                            644 ; Function game
                            645 ; ---------------------------------
   470A                     646 _game::
   470A DD E5         [15]  647 	push	ix
   470C DD 21 00 00   [14]  648 	ld	ix,#0
   4710 DD 39         [15]  649 	add	ix,sp
   4712 21 B1 FF      [10]  650 	ld	hl,#-79
   4715 39            [11]  651 	add	hl,sp
   4716 F9            [ 6]  652 	ld	sp,hl
                            653 ;src/main.c:173: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
   4717 21 0A 00      [10]  654 	ld	hl,#0x000A
   471A 39            [11]  655 	add	hl,sp
   471B 36 00         [10]  656 	ld	(hl),#0x00
   471D 21 0A 00      [10]  657 	ld	hl,#0x000A
   4720 39            [11]  658 	add	hl,sp
   4721 DD 75 D9      [19]  659 	ld	-39 (ix),l
   4724 DD 74 DA      [19]  660 	ld	-38 (ix),h
   4727 DD 7E D9      [19]  661 	ld	a,-39 (ix)
   472A C6 01         [ 7]  662 	add	a, #0x01
   472C DD 77 D7      [19]  663 	ld	-41 (ix),a
   472F DD 7E DA      [19]  664 	ld	a,-38 (ix)
   4732 CE 00         [ 7]  665 	adc	a, #0x00
   4734 DD 77 D8      [19]  666 	ld	-40 (ix),a
   4737 DD 6E D7      [19]  667 	ld	l,-41 (ix)
   473A DD 66 D8      [19]  668 	ld	h,-40 (ix)
   473D 36 64         [10]  669 	ld	(hl),#0x64
   473F DD 7E D9      [19]  670 	ld	a,-39 (ix)
   4742 C6 02         [ 7]  671 	add	a, #0x02
   4744 DD 77 D5      [19]  672 	ld	-43 (ix),a
   4747 DD 7E DA      [19]  673 	ld	a,-38 (ix)
   474A CE 00         [ 7]  674 	adc	a, #0x00
   474C DD 77 D6      [19]  675 	ld	-42 (ix),a
   474F DD 6E D5      [19]  676 	ld	l,-43 (ix)
   4752 DD 66 D6      [19]  677 	ld	h,-42 (ix)
   4755 36 00         [10]  678 	ld	(hl),#0x00
   4757 DD 7E D9      [19]  679 	ld	a,-39 (ix)
   475A C6 03         [ 7]  680 	add	a, #0x03
   475C DD 77 D3      [19]  681 	ld	-45 (ix),a
   475F DD 7E DA      [19]  682 	ld	a,-38 (ix)
   4762 CE 00         [ 7]  683 	adc	a, #0x00
   4764 DD 77 D4      [19]  684 	ld	-44 (ix),a
   4767 DD 6E D3      [19]  685 	ld	l,-45 (ix)
   476A DD 66 D4      [19]  686 	ld	h,-44 (ix)
   476D 36 64         [10]  687 	ld	(hl),#0x64
   476F DD 7E D9      [19]  688 	ld	a,-39 (ix)
   4772 C6 04         [ 7]  689 	add	a, #0x04
   4774 DD 77 E1      [19]  690 	ld	-31 (ix),a
   4777 DD 7E DA      [19]  691 	ld	a,-38 (ix)
   477A CE 00         [ 7]  692 	adc	a, #0x00
   477C DD 77 E2      [19]  693 	ld	-30 (ix),a
   477F DD 6E E1      [19]  694 	ld	l,-31 (ix)
   4782 DD 66 E2      [19]  695 	ld	h,-30 (ix)
   4785 36 14         [10]  696 	ld	(hl),#0x14
   4787 23            [ 6]  697 	inc	hl
   4788 36 00         [10]  698 	ld	(hl),#0x00
   478A DD 7E D9      [19]  699 	ld	a,-39 (ix)
   478D C6 06         [ 7]  700 	add	a, #0x06
   478F DD 77 DF      [19]  701 	ld	-33 (ix),a
   4792 DD 7E DA      [19]  702 	ld	a,-38 (ix)
   4795 CE 00         [ 7]  703 	adc	a, #0x00
   4797 DD 77 E0      [19]  704 	ld	-32 (ix),a
   479A DD 6E DF      [19]  705 	ld	l,-33 (ix)
   479D DD 66 E0      [19]  706 	ld	h,-32 (ix)
   47A0 36 14         [10]  707 	ld	(hl),#0x14
   47A2 23            [ 6]  708 	inc	hl
   47A3 36 00         [10]  709 	ld	(hl),#0x00
   47A5 DD 7E D9      [19]  710 	ld	a,-39 (ix)
   47A8 C6 08         [ 7]  711 	add	a, #0x08
   47AA DD 77 DD      [19]  712 	ld	-35 (ix),a
   47AD DD 7E DA      [19]  713 	ld	a,-38 (ix)
   47B0 CE 00         [ 7]  714 	adc	a, #0x00
   47B2 DD 77 DE      [19]  715 	ld	-34 (ix),a
   47B5 DD 6E DD      [19]  716 	ld	l,-35 (ix)
   47B8 DD 66 DE      [19]  717 	ld	h,-34 (ix)
   47BB AF            [ 4]  718 	xor	a, a
   47BC 77            [ 7]  719 	ld	(hl), a
   47BD 23            [ 6]  720 	inc	hl
   47BE 77            [ 7]  721 	ld	(hl), a
   47BF DD 7E D9      [19]  722 	ld	a,-39 (ix)
   47C2 C6 0A         [ 7]  723 	add	a, #0x0A
   47C4 DD 77 DB      [19]  724 	ld	-37 (ix),a
   47C7 DD 7E DA      [19]  725 	ld	a,-38 (ix)
   47CA CE 00         [ 7]  726 	adc	a, #0x00
   47CC DD 77 DC      [19]  727 	ld	-36 (ix),a
   47CF DD 6E DB      [19]  728 	ld	l,-37 (ix)
   47D2 DD 66 DC      [19]  729 	ld	h,-36 (ix)
   47D5 AF            [ 4]  730 	xor	a, a
   47D6 77            [ 7]  731 	ld	(hl), a
   47D7 23            [ 6]  732 	inc	hl
   47D8 77            [ 7]  733 	ld	(hl), a
   47D9 DD 7E D9      [19]  734 	ld	a,-39 (ix)
   47DC C6 0C         [ 7]  735 	add	a, #0x0C
   47DE DD 77 EB      [19]  736 	ld	-21 (ix),a
   47E1 DD 7E DA      [19]  737 	ld	a,-38 (ix)
   47E4 CE 00         [ 7]  738 	adc	a, #0x00
   47E6 DD 77 EC      [19]  739 	ld	-20 (ix),a
   47E9 DD 6E EB      [19]  740 	ld	l,-21 (ix)
   47EC DD 66 EC      [19]  741 	ld	h,-20 (ix)
   47EF 36 06         [10]  742 	ld	(hl),#0x06
   47F1 23            [ 6]  743 	inc	hl
   47F2 36 00         [10]  744 	ld	(hl),#0x00
   47F4 DD 7E D9      [19]  745 	ld	a,-39 (ix)
   47F7 C6 0E         [ 7]  746 	add	a, #0x0E
   47F9 DD 77 E9      [19]  747 	ld	-23 (ix),a
   47FC DD 7E DA      [19]  748 	ld	a,-38 (ix)
   47FF CE 00         [ 7]  749 	adc	a, #0x00
   4801 DD 77 EA      [19]  750 	ld	-22 (ix),a
   4804 DD 6E E9      [19]  751 	ld	l,-23 (ix)
   4807 DD 66 EA      [19]  752 	ld	h,-22 (ix)
   480A 36 03         [10]  753 	ld	(hl),#0x03
   480C 23            [ 6]  754 	inc	hl
   480D 36 00         [10]  755 	ld	(hl),#0x00
                            756 ;src/main.c:174: TEnemy  e = { 55,100,55,100,0,0 };
   480F 21 1A 00      [10]  757 	ld	hl,#0x001A
   4812 39            [11]  758 	add	hl,sp
   4813 36 37         [10]  759 	ld	(hl),#0x37
   4815 21 1A 00      [10]  760 	ld	hl,#0x001A
   4818 39            [11]  761 	add	hl,sp
   4819 DD 75 E7      [19]  762 	ld	-25 (ix),l
   481C DD 74 E8      [19]  763 	ld	-24 (ix),h
   481F DD 7E E7      [19]  764 	ld	a,-25 (ix)
   4822 C6 01         [ 7]  765 	add	a, #0x01
   4824 DD 77 E5      [19]  766 	ld	-27 (ix),a
   4827 DD 7E E8      [19]  767 	ld	a,-24 (ix)
   482A CE 00         [ 7]  768 	adc	a, #0x00
   482C DD 77 E6      [19]  769 	ld	-26 (ix),a
   482F DD 6E E5      [19]  770 	ld	l,-27 (ix)
   4832 DD 66 E6      [19]  771 	ld	h,-26 (ix)
   4835 36 64         [10]  772 	ld	(hl),#0x64
   4837 DD 6E E7      [19]  773 	ld	l,-25 (ix)
   483A DD 66 E8      [19]  774 	ld	h,-24 (ix)
   483D 23            [ 6]  775 	inc	hl
   483E 23            [ 6]  776 	inc	hl
   483F 36 37         [10]  777 	ld	(hl),#0x37
   4841 DD 6E E7      [19]  778 	ld	l,-25 (ix)
   4844 DD 66 E8      [19]  779 	ld	h,-24 (ix)
   4847 23            [ 6]  780 	inc	hl
   4848 23            [ 6]  781 	inc	hl
   4849 23            [ 6]  782 	inc	hl
   484A 36 64         [10]  783 	ld	(hl),#0x64
   484C DD 7E E7      [19]  784 	ld	a,-25 (ix)
   484F C6 04         [ 7]  785 	add	a, #0x04
   4851 DD 77 E3      [19]  786 	ld	-29 (ix),a
   4854 DD 7E E8      [19]  787 	ld	a,-24 (ix)
   4857 CE 00         [ 7]  788 	adc	a, #0x00
   4859 DD 77 E4      [19]  789 	ld	-28 (ix),a
   485C DD 6E E3      [19]  790 	ld	l,-29 (ix)
   485F DD 66 E4      [19]  791 	ld	h,-28 (ix)
   4862 AF            [ 4]  792 	xor	a, a
   4863 77            [ 7]  793 	ld	(hl), a
   4864 23            [ 6]  794 	inc	hl
   4865 77            [ 7]  795 	ld	(hl), a
   4866 DD 7E E7      [19]  796 	ld	a,-25 (ix)
   4869 C6 06         [ 7]  797 	add	a, #0x06
   486B 6F            [ 4]  798 	ld	l,a
   486C DD 7E E8      [19]  799 	ld	a,-24 (ix)
   486F CE 00         [ 7]  800 	adc	a, #0x00
   4871 67            [ 4]  801 	ld	h,a
   4872 AF            [ 4]  802 	xor	a, a
   4873 77            [ 7]  803 	ld	(hl), a
   4874 23            [ 6]  804 	inc	hl
   4875 77            [ 7]  805 	ld	(hl), a
                            806 ;src/main.c:175: TEnemy pr = { 0,0,0,0,1,0 };
   4876 21 02 00      [10]  807 	ld	hl,#0x0002
   4879 39            [11]  808 	add	hl,sp
   487A 36 00         [10]  809 	ld	(hl),#0x00
   487C 21 02 00      [10]  810 	ld	hl,#0x0002
   487F 39            [11]  811 	add	hl,sp
   4880 DD 75 FE      [19]  812 	ld	-2 (ix),l
   4883 DD 74 FF      [19]  813 	ld	-1 (ix),h
   4886 DD 7E FE      [19]  814 	ld	a,-2 (ix)
   4889 C6 01         [ 7]  815 	add	a, #0x01
   488B DD 77 FC      [19]  816 	ld	-4 (ix),a
   488E DD 7E FF      [19]  817 	ld	a,-1 (ix)
   4891 CE 00         [ 7]  818 	adc	a, #0x00
   4893 DD 77 FD      [19]  819 	ld	-3 (ix),a
   4896 DD 6E FC      [19]  820 	ld	l,-4 (ix)
   4899 DD 66 FD      [19]  821 	ld	h,-3 (ix)
   489C 36 00         [10]  822 	ld	(hl),#0x00
   489E DD 7E FE      [19]  823 	ld	a,-2 (ix)
   48A1 C6 02         [ 7]  824 	add	a, #0x02
   48A3 DD 77 FA      [19]  825 	ld	-6 (ix),a
   48A6 DD 7E FF      [19]  826 	ld	a,-1 (ix)
   48A9 CE 00         [ 7]  827 	adc	a, #0x00
   48AB DD 77 FB      [19]  828 	ld	-5 (ix),a
   48AE DD 6E FA      [19]  829 	ld	l,-6 (ix)
   48B1 DD 66 FB      [19]  830 	ld	h,-5 (ix)
   48B4 36 00         [10]  831 	ld	(hl),#0x00
   48B6 DD 7E FE      [19]  832 	ld	a,-2 (ix)
   48B9 C6 03         [ 7]  833 	add	a, #0x03
   48BB DD 77 F8      [19]  834 	ld	-8 (ix),a
   48BE DD 7E FF      [19]  835 	ld	a,-1 (ix)
   48C1 CE 00         [ 7]  836 	adc	a, #0x00
   48C3 DD 77 F9      [19]  837 	ld	-7 (ix),a
   48C6 DD 6E F8      [19]  838 	ld	l,-8 (ix)
   48C9 DD 66 F9      [19]  839 	ld	h,-7 (ix)
   48CC 36 00         [10]  840 	ld	(hl),#0x00
   48CE DD 7E FE      [19]  841 	ld	a,-2 (ix)
   48D1 C6 04         [ 7]  842 	add	a, #0x04
   48D3 DD 77 F6      [19]  843 	ld	-10 (ix),a
   48D6 DD 7E FF      [19]  844 	ld	a,-1 (ix)
   48D9 CE 00         [ 7]  845 	adc	a, #0x00
   48DB DD 77 F7      [19]  846 	ld	-9 (ix),a
   48DE DD 6E F6      [19]  847 	ld	l,-10 (ix)
   48E1 DD 66 F7      [19]  848 	ld	h,-9 (ix)
   48E4 36 01         [10]  849 	ld	(hl),#0x01
   48E6 23            [ 6]  850 	inc	hl
   48E7 36 00         [10]  851 	ld	(hl),#0x00
   48E9 DD 7E FE      [19]  852 	ld	a,-2 (ix)
   48EC C6 06         [ 7]  853 	add	a, #0x06
   48EE DD 77 F4      [19]  854 	ld	-12 (ix),a
   48F1 DD 7E FF      [19]  855 	ld	a,-1 (ix)
   48F4 CE 00         [ 7]  856 	adc	a, #0x00
   48F6 DD 77 F5      [19]  857 	ld	-11 (ix),a
   48F9 DD 6E F4      [19]  858 	ld	l,-12 (ix)
   48FC DD 66 F5      [19]  859 	ld	h,-11 (ix)
   48FF 36 00         [10]  860 	ld	(hl),#0x00
   4901 23            [ 6]  861 	inc	hl
   4902 36 00         [10]  862 	ld	(hl),#0x00
                            863 ;src/main.c:177: u8* sprite = gladis_quieto_dcha;
   4904 DD 36 B1 40   [19]  864 	ld	-79 (ix),#<(_gladis_quieto_dcha)
   4908 DD 36 B2 42   [19]  865 	ld	-78 (ix),#>(_gladis_quieto_dcha)
                            866 ;src/main.c:180: cpct_clearScreen(0);
   490C 21 00 40      [10]  867 	ld	hl,#0x4000
   490F E5            [11]  868 	push	hl
   4910 AF            [ 4]  869 	xor	a, a
   4911 F5            [11]  870 	push	af
   4912 33            [ 6]  871 	inc	sp
   4913 26 C0         [ 7]  872 	ld	h, #0xC0
   4915 E5            [11]  873 	push	hl
   4916 CD 01 53      [17]  874 	call	_cpct_memset
                            875 ;src/main.c:182: while (1){
   4919                     876 00198$:
                            877 ;src/main.c:185: cpct_waitVSYNC();
   4919 CD E7 52      [17]  878 	call	_cpct_waitVSYNC
                            879 ;src/main.c:188: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
   491C DD 6E D3      [19]  880 	ld	l,-45 (ix)
   491F DD 66 D4      [19]  881 	ld	h,-44 (ix)
   4922 46            [ 7]  882 	ld	b,(hl)
   4923 DD 6E D5      [19]  883 	ld	l,-43 (ix)
   4926 DD 66 D6      [19]  884 	ld	h,-42 (ix)
   4929 4E            [ 7]  885 	ld	c, (hl)
   492A C5            [11]  886 	push	bc
   492B 21 00 C0      [10]  887 	ld	hl,#0xC000
   492E E5            [11]  888 	push	hl
   492F CD DB 53      [17]  889 	call	_cpct_getScreenPtr
   4932 EB            [ 4]  890 	ex	de,hl
                            891 ;src/main.c:189: if(p.prevAtk <= 20)
   4933 DD 6E DF      [19]  892 	ld	l,-33 (ix)
   4936 DD 66 E0      [19]  893 	ld	h,-32 (ix)
   4939 46            [ 7]  894 	ld	b,(hl)
   493A 23            [ 6]  895 	inc	hl
   493B 66            [ 7]  896 	ld	h,(hl)
                            897 ;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
                            898 ;src/main.c:189: if(p.prevAtk <= 20)
   493C 3E 14         [ 7]  899 	ld	a,#0x14
   493E B8            [ 4]  900 	cp	a, b
   493F 3E 00         [ 7]  901 	ld	a,#0x00
   4941 9C            [ 4]  902 	sbc	a, h
   4942 38 10         [12]  903 	jr	C,00102$
                            904 ;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
   4944 21 04 10      [10]  905 	ld	hl,#0x1004
   4947 E5            [11]  906 	push	hl
   4948 AF            [ 4]  907 	xor	a, a
   4949 F5            [11]  908 	push	af
   494A 33            [ 6]  909 	inc	sp
   494B D5            [11]  910 	push	de
   494C CD 23 53      [17]  911 	call	_cpct_drawSolidBox
   494F F1            [10]  912 	pop	af
   4950 F1            [10]  913 	pop	af
   4951 33            [ 6]  914 	inc	sp
   4952 18 0E         [12]  915 	jr	00103$
   4954                     916 00102$:
                            917 ;src/main.c:192: cpct_drawSolidBox(memptr,0,5,16);
   4954 21 05 10      [10]  918 	ld	hl,#0x1005
   4957 E5            [11]  919 	push	hl
   4958 AF            [ 4]  920 	xor	a, a
   4959 F5            [11]  921 	push	af
   495A 33            [ 6]  922 	inc	sp
   495B D5            [11]  923 	push	de
   495C CD 23 53      [17]  924 	call	_cpct_drawSolidBox
   495F F1            [10]  925 	pop	af
   4960 F1            [10]  926 	pop	af
   4961 33            [ 6]  927 	inc	sp
   4962                     928 00103$:
                            929 ;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4962 DD 6E D7      [19]  930 	ld	l,-41 (ix)
   4965 DD 66 D8      [19]  931 	ld	h,-40 (ix)
   4968 46            [ 7]  932 	ld	b,(hl)
   4969 DD 6E D9      [19]  933 	ld	l,-39 (ix)
   496C DD 66 DA      [19]  934 	ld	h,-38 (ix)
   496F 4E            [ 7]  935 	ld	c, (hl)
   4970 C5            [11]  936 	push	bc
   4971 21 00 C0      [10]  937 	ld	hl,#0xC000
   4974 E5            [11]  938 	push	hl
   4975 CD DB 53      [17]  939 	call	_cpct_getScreenPtr
   4978 4D            [ 4]  940 	ld	c, l
   4979 44            [ 4]  941 	ld	b, h
                            942 ;src/main.c:196: if(p.atk >= 21)
   497A DD 6E E1      [19]  943 	ld	l,-31 (ix)
   497D DD 66 E2      [19]  944 	ld	h,-30 (ix)
   4980 7E            [ 7]  945 	ld	a, (hl)
   4981 23            [ 6]  946 	inc	hl
   4982 6E            [ 7]  947 	ld	l,(hl)
   4983 67            [ 4]  948 	ld	h,a
                            949 ;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
                            950 ;src/main.c:197: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4984 D1            [10]  951 	pop	de
   4985 D5            [11]  952 	push	de
                            953 ;src/main.c:196: if(p.atk >= 21)
   4986 7C            [ 4]  954 	ld	a,h
   4987 D6 15         [ 7]  955 	sub	a, #0x15
   4989 7D            [ 4]  956 	ld	a,l
   498A DE 00         [ 7]  957 	sbc	a, #0x00
   498C 38 0B         [12]  958 	jr	C,00105$
                            959 ;src/main.c:197: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   498E 21 05 10      [10]  960 	ld	hl,#0x1005
   4991 E5            [11]  961 	push	hl
   4992 C5            [11]  962 	push	bc
   4993 D5            [11]  963 	push	de
   4994 CD 9D 52      [17]  964 	call	_cpct_drawSpriteMasked
   4997 18 09         [12]  965 	jr	00106$
   4999                     966 00105$:
                            967 ;src/main.c:199: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4999 21 04 10      [10]  968 	ld	hl,#0x1004
   499C E5            [11]  969 	push	hl
   499D C5            [11]  970 	push	bc
   499E D5            [11]  971 	push	de
   499F CD 9D 52      [17]  972 	call	_cpct_drawSpriteMasked
   49A2                     973 00106$:
                            974 ;src/main.c:202: memptr = cpct_getScreenPtr(VMEM,60,160);
   49A2 21 3C A0      [10]  975 	ld	hl,#0xA03C
   49A5 E5            [11]  976 	push	hl
   49A6 21 00 C0      [10]  977 	ld	hl,#0xC000
   49A9 E5            [11]  978 	push	hl
   49AA CD DB 53      [17]  979 	call	_cpct_getScreenPtr
   49AD 4D            [ 4]  980 	ld	c, l
   49AE 44            [ 4]  981 	ld	b, h
                            982 ;src/main.c:203: cpct_drawSolidBox(memptr,0,10,16);
   49AF 59            [ 4]  983 	ld	e, c
   49B0 50            [ 4]  984 	ld	d, b
   49B1 C5            [11]  985 	push	bc
   49B2 21 0A 10      [10]  986 	ld	hl,#0x100A
   49B5 E5            [11]  987 	push	hl
   49B6 AF            [ 4]  988 	xor	a, a
   49B7 F5            [11]  989 	push	af
   49B8 33            [ 6]  990 	inc	sp
   49B9 D5            [11]  991 	push	de
   49BA CD 23 53      [17]  992 	call	_cpct_drawSolidBox
   49BD F1            [10]  993 	pop	af
   49BE F1            [10]  994 	pop	af
   49BF 33            [ 6]  995 	inc	sp
   49C0 C1            [10]  996 	pop	bc
                            997 ;src/main.c:205: drawVida(p.life, memptr);
   49C1 DD 6E E9      [19]  998 	ld	l,-23 (ix)
   49C4 DD 66 EA      [19]  999 	ld	h,-22 (ix)
   49C7 5E            [ 7] 1000 	ld	e,(hl)
   49C8 23            [ 6] 1001 	inc	hl
   49C9 56            [ 7] 1002 	ld	d,(hl)
   49CA C5            [11] 1003 	push	bc
   49CB D5            [11] 1004 	push	de
   49CC CD 63 46      [17] 1005 	call	_drawVida
   49CF F1            [10] 1006 	pop	af
   49D0 F1            [10] 1007 	pop	af
                           1008 ;src/main.c:208: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   49D1 DD 6E E5      [19] 1009 	ld	l,-27 (ix)
   49D4 DD 66 E6      [19] 1010 	ld	h,-26 (ix)
   49D7 46            [ 7] 1011 	ld	b,(hl)
   49D8 DD 6E E7      [19] 1012 	ld	l,-25 (ix)
   49DB DD 66 E8      [19] 1013 	ld	h,-24 (ix)
   49DE 4E            [ 7] 1014 	ld	c, (hl)
   49DF C5            [11] 1015 	push	bc
   49E0 21 00 C0      [10] 1016 	ld	hl,#0xC000
   49E3 E5            [11] 1017 	push	hl
   49E4 CD DB 53      [17] 1018 	call	_cpct_getScreenPtr
                           1019 ;src/main.c:209: cpct_drawSolidBox(memptr,0,4,16);
   49E7 EB            [ 4] 1020 	ex	de,hl
   49E8 21 04 10      [10] 1021 	ld	hl,#0x1004
   49EB E5            [11] 1022 	push	hl
   49EC AF            [ 4] 1023 	xor	a, a
   49ED F5            [11] 1024 	push	af
   49EE 33            [ 6] 1025 	inc	sp
   49EF D5            [11] 1026 	push	de
   49F0 CD 23 53      [17] 1027 	call	_cpct_drawSolidBox
   49F3 F1            [10] 1028 	pop	af
   49F4 F1            [10] 1029 	pop	af
   49F5 33            [ 6] 1030 	inc	sp
                           1031 ;src/main.c:211: if(e.vivo == 0){
   49F6 DD 6E E3      [19] 1032 	ld	l,-29 (ix)
   49F9 DD 66 E4      [19] 1033 	ld	h,-28 (ix)
   49FC 4E            [ 7] 1034 	ld	c,(hl)
   49FD 23            [ 6] 1035 	inc	hl
   49FE 7E            [ 7] 1036 	ld	a, (hl)
   49FF B1            [ 4] 1037 	or	a,c
   4A00 20 26         [12] 1038 	jr	NZ,00108$
                           1039 ;src/main.c:212: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4A02 DD 6E E5      [19] 1040 	ld	l,-27 (ix)
   4A05 DD 66 E6      [19] 1041 	ld	h,-26 (ix)
   4A08 46            [ 7] 1042 	ld	b,(hl)
   4A09 DD 6E E7      [19] 1043 	ld	l,-25 (ix)
   4A0C DD 66 E8      [19] 1044 	ld	h,-24 (ix)
   4A0F 4E            [ 7] 1045 	ld	c, (hl)
   4A10 C5            [11] 1046 	push	bc
   4A11 21 00 C0      [10] 1047 	ld	hl,#0xC000
   4A14 E5            [11] 1048 	push	hl
   4A15 CD DB 53      [17] 1049 	call	_cpct_getScreenPtr
                           1050 ;src/main.c:213: cpct_drawSolidBox(memptr, 18, 4, 16);
   4A18 EB            [ 4] 1051 	ex	de,hl
   4A19 21 04 10      [10] 1052 	ld	hl,#0x1004
   4A1C E5            [11] 1053 	push	hl
   4A1D 3E 12         [ 7] 1054 	ld	a,#0x12
   4A1F F5            [11] 1055 	push	af
   4A20 33            [ 6] 1056 	inc	sp
   4A21 D5            [11] 1057 	push	de
   4A22 CD 23 53      [17] 1058 	call	_cpct_drawSolidBox
   4A25 F1            [10] 1059 	pop	af
   4A26 F1            [10] 1060 	pop	af
   4A27 33            [ 6] 1061 	inc	sp
   4A28                    1062 00108$:
                           1063 ;src/main.c:217: memptr = cpct_getScreenPtr(VMEM,pr.prevX,pr.prevY);
   4A28 DD 6E F8      [19] 1064 	ld	l,-8 (ix)
   4A2B DD 66 F9      [19] 1065 	ld	h,-7 (ix)
   4A2E 46            [ 7] 1066 	ld	b,(hl)
   4A2F DD 6E FA      [19] 1067 	ld	l,-6 (ix)
   4A32 DD 66 FB      [19] 1068 	ld	h,-5 (ix)
   4A35 4E            [ 7] 1069 	ld	c, (hl)
   4A36 C5            [11] 1070 	push	bc
   4A37 21 00 C0      [10] 1071 	ld	hl,#0xC000
   4A3A E5            [11] 1072 	push	hl
   4A3B CD DB 53      [17] 1073 	call	_cpct_getScreenPtr
   4A3E DD 75 F2      [19] 1074 	ld	-14 (ix),l
   4A41 DD 74 F3      [19] 1075 	ld	-13 (ix),h
                           1076 ;src/main.c:218: if((int)pr.dir < 2)
   4A44 DD 6E F4      [19] 1077 	ld	l,-12 (ix)
   4A47 DD 66 F5      [19] 1078 	ld	h,-11 (ix)
   4A4A 4E            [ 7] 1079 	ld	c,(hl)
   4A4B 23            [ 6] 1080 	inc	hl
   4A4C 46            [ 7] 1081 	ld	b,(hl)
                           1082 ;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
   4A4D DD 5E F2      [19] 1083 	ld	e,-14 (ix)
   4A50 DD 56 F3      [19] 1084 	ld	d,-13 (ix)
                           1085 ;src/main.c:218: if((int)pr.dir < 2)
   4A53 79            [ 4] 1086 	ld	a,c
   4A54 D6 02         [ 7] 1087 	sub	a, #0x02
   4A56 78            [ 4] 1088 	ld	a,b
   4A57 17            [ 4] 1089 	rla
   4A58 3F            [ 4] 1090 	ccf
   4A59 1F            [ 4] 1091 	rra
   4A5A DE 80         [ 7] 1092 	sbc	a, #0x80
   4A5C 30 10         [12] 1093 	jr	NC,00110$
                           1094 ;src/main.c:219: cpct_drawSolidBox(memptr, 0, 4, 4);
   4A5E 21 04 04      [10] 1095 	ld	hl,#0x0404
   4A61 E5            [11] 1096 	push	hl
   4A62 AF            [ 4] 1097 	xor	a, a
   4A63 F5            [11] 1098 	push	af
   4A64 33            [ 6] 1099 	inc	sp
   4A65 D5            [11] 1100 	push	de
   4A66 CD 23 53      [17] 1101 	call	_cpct_drawSolidBox
   4A69 F1            [10] 1102 	pop	af
   4A6A F1            [10] 1103 	pop	af
   4A6B 33            [ 6] 1104 	inc	sp
   4A6C 18 0E         [12] 1105 	jr	00111$
   4A6E                    1106 00110$:
                           1107 ;src/main.c:221: cpct_drawSolidBox(memptr, 0, 2, 8);
   4A6E 21 02 08      [10] 1108 	ld	hl,#0x0802
   4A71 E5            [11] 1109 	push	hl
   4A72 AF            [ 4] 1110 	xor	a, a
   4A73 F5            [11] 1111 	push	af
   4A74 33            [ 6] 1112 	inc	sp
   4A75 D5            [11] 1113 	push	de
   4A76 CD 23 53      [17] 1114 	call	_cpct_drawSolidBox
   4A79 F1            [10] 1115 	pop	af
   4A7A F1            [10] 1116 	pop	af
   4A7B 33            [ 6] 1117 	inc	sp
   4A7C                    1118 00111$:
                           1119 ;src/main.c:223: if(pr.vivo == 0){
   4A7C DD 6E F6      [19] 1120 	ld	l,-10 (ix)
   4A7F DD 66 F7      [19] 1121 	ld	h,-9 (ix)
   4A82 4E            [ 7] 1122 	ld	c,(hl)
   4A83 23            [ 6] 1123 	inc	hl
   4A84 7E            [ 7] 1124 	ld	a, (hl)
   4A85 B1            [ 4] 1125 	or	a,c
   4A86 20 5C         [12] 1126 	jr	NZ,00116$
                           1127 ;src/main.c:224: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4A88 DD 6E FC      [19] 1128 	ld	l,-4 (ix)
   4A8B DD 66 FD      [19] 1129 	ld	h,-3 (ix)
   4A8E 46            [ 7] 1130 	ld	b,(hl)
   4A8F DD 6E FE      [19] 1131 	ld	l,-2 (ix)
   4A92 DD 66 FF      [19] 1132 	ld	h,-1 (ix)
   4A95 4E            [ 7] 1133 	ld	c, (hl)
   4A96 C5            [11] 1134 	push	bc
   4A97 21 00 C0      [10] 1135 	ld	hl,#0xC000
   4A9A E5            [11] 1136 	push	hl
   4A9B CD DB 53      [17] 1137 	call	_cpct_getScreenPtr
   4A9E DD 75 F2      [19] 1138 	ld	-14 (ix),l
   4AA1 DD 74 F3      [19] 1139 	ld	-13 (ix),h
                           1140 ;src/main.c:218: if((int)pr.dir < 2)
   4AA4 DD 6E F4      [19] 1141 	ld	l,-12 (ix)
   4AA7 DD 66 F5      [19] 1142 	ld	h,-11 (ix)
   4AAA 5E            [ 7] 1143 	ld	e,(hl)
   4AAB 23            [ 6] 1144 	inc	hl
   4AAC 56            [ 7] 1145 	ld	d,(hl)
                           1146 ;src/main.c:225: if((int)pr.dir < 2)
   4AAD 63            [ 4] 1147 	ld	h,e
   4AAE 6A            [ 4] 1148 	ld	l,d
                           1149 ;src/main.c:190: cpct_drawSolidBox(memptr,0,4,16);
   4AAF DD 4E F2      [19] 1150 	ld	c,-14 (ix)
   4AB2 DD 46 F3      [19] 1151 	ld	b,-13 (ix)
                           1152 ;src/main.c:225: if((int)pr.dir < 2)
   4AB5 7C            [ 4] 1153 	ld	a,h
   4AB6 D6 02         [ 7] 1154 	sub	a, #0x02
   4AB8 7D            [ 4] 1155 	ld	a,l
   4AB9 17            [ 4] 1156 	rla
   4ABA 3F            [ 4] 1157 	ccf
   4ABB 1F            [ 4] 1158 	rra
   4ABC DE 80         [ 7] 1159 	sbc	a, #0x80
   4ABE 30 13         [12] 1160 	jr	NC,00113$
                           1161 ;src/main.c:226: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 4, 4);
   4AC0 C5            [11] 1162 	push	bc
   4AC1 D5            [11] 1163 	push	de
   4AC2 CD 73 45      [17] 1164 	call	_checkSpriteFlecha
   4AC5 F1            [10] 1165 	pop	af
   4AC6 C1            [10] 1166 	pop	bc
   4AC7 EB            [ 4] 1167 	ex	de,hl
   4AC8 21 04 04      [10] 1168 	ld	hl,#0x0404
   4ACB E5            [11] 1169 	push	hl
   4ACC C5            [11] 1170 	push	bc
   4ACD D5            [11] 1171 	push	de
   4ACE CD 9D 52      [17] 1172 	call	_cpct_drawSpriteMasked
   4AD1 18 11         [12] 1173 	jr	00116$
   4AD3                    1174 00113$:
                           1175 ;src/main.c:228: cpct_drawSpriteMasked(checkSpriteFlecha(pr.dir), memptr, 2, 8);
   4AD3 C5            [11] 1176 	push	bc
   4AD4 D5            [11] 1177 	push	de
   4AD5 CD 73 45      [17] 1178 	call	_checkSpriteFlecha
   4AD8 F1            [10] 1179 	pop	af
   4AD9 C1            [10] 1180 	pop	bc
   4ADA EB            [ 4] 1181 	ex	de,hl
   4ADB 21 02 08      [10] 1182 	ld	hl,#0x0802
   4ADE E5            [11] 1183 	push	hl
   4ADF C5            [11] 1184 	push	bc
   4AE0 D5            [11] 1185 	push	de
   4AE1 CD 9D 52      [17] 1186 	call	_cpct_drawSpriteMasked
   4AE4                    1187 00116$:
                           1188 ;src/main.c:196: if(p.atk >= 21)
   4AE4 DD 6E E1      [19] 1189 	ld	l,-31 (ix)
   4AE7 DD 66 E2      [19] 1190 	ld	h,-30 (ix)
   4AEA 5E            [ 7] 1191 	ld	e,(hl)
   4AEB 23            [ 6] 1192 	inc	hl
   4AEC 56            [ 7] 1193 	ld	d,(hl)
                           1194 ;src/main.c:232: if(p.atk < 20)
   4AED 7B            [ 4] 1195 	ld	a,e
   4AEE D6 14         [ 7] 1196 	sub	a, #0x14
   4AF0 7A            [ 4] 1197 	ld	a,d
   4AF1 DE 00         [ 7] 1198 	sbc	a, #0x00
   4AF3 30 14         [12] 1199 	jr	NC,00121$
                           1200 ;src/main.c:233: drawFatiga(p.atk,memptr,2);
   4AF5 3E 02         [ 7] 1201 	ld	a,#0x02
   4AF7 F5            [11] 1202 	push	af
   4AF8 33            [ 6] 1203 	inc	sp
   4AF9 DD 6E F2      [19] 1204 	ld	l,-14 (ix)
   4AFC DD 66 F3      [19] 1205 	ld	h,-13 (ix)
   4AFF E5            [11] 1206 	push	hl
   4B00 D5            [11] 1207 	push	de
   4B01 CD A6 45      [17] 1208 	call	_drawFatiga
   4B04 F1            [10] 1209 	pop	af
   4B05 F1            [10] 1210 	pop	af
   4B06 33            [ 6] 1211 	inc	sp
   4B07 18 2D         [12] 1212 	jr	00122$
   4B09                    1213 00121$:
                           1214 ;src/main.c:234: else if(p.atk > 20)
   4B09 3E 14         [ 7] 1215 	ld	a,#0x14
   4B0B BB            [ 4] 1216 	cp	a, e
   4B0C 3E 00         [ 7] 1217 	ld	a,#0x00
   4B0E 9A            [ 4] 1218 	sbc	a, d
   4B0F 30 14         [12] 1219 	jr	NC,00118$
                           1220 ;src/main.c:235: drawFatiga(p.atk,memptr,16);
   4B11 3E 10         [ 7] 1221 	ld	a,#0x10
   4B13 F5            [11] 1222 	push	af
   4B14 33            [ 6] 1223 	inc	sp
   4B15 DD 6E F2      [19] 1224 	ld	l,-14 (ix)
   4B18 DD 66 F3      [19] 1225 	ld	h,-13 (ix)
   4B1B E5            [11] 1226 	push	hl
   4B1C D5            [11] 1227 	push	de
   4B1D CD A6 45      [17] 1228 	call	_drawFatiga
   4B20 F1            [10] 1229 	pop	af
   4B21 F1            [10] 1230 	pop	af
   4B22 33            [ 6] 1231 	inc	sp
   4B23 18 11         [12] 1232 	jr	00122$
   4B25                    1233 00118$:
                           1234 ;src/main.c:237: drawFatiga(p.atk,memptr,0);
   4B25 AF            [ 4] 1235 	xor	a, a
   4B26 F5            [11] 1236 	push	af
   4B27 33            [ 6] 1237 	inc	sp
   4B28 DD 6E F2      [19] 1238 	ld	l,-14 (ix)
   4B2B DD 66 F3      [19] 1239 	ld	h,-13 (ix)
   4B2E E5            [11] 1240 	push	hl
   4B2F D5            [11] 1241 	push	de
   4B30 CD A6 45      [17] 1242 	call	_drawFatiga
   4B33 F1            [10] 1243 	pop	af
   4B34 F1            [10] 1244 	pop	af
   4B35 33            [ 6] 1245 	inc	sp
   4B36                    1246 00122$:
                           1247 ;src/main.c:239: p.prevX = p.x;
   4B36 DD 6E D9      [19] 1248 	ld	l,-39 (ix)
   4B39 DD 66 DA      [19] 1249 	ld	h,-38 (ix)
   4B3C 7E            [ 7] 1250 	ld	a,(hl)
   4B3D DD 6E D5      [19] 1251 	ld	l,-43 (ix)
   4B40 DD 66 D6      [19] 1252 	ld	h,-42 (ix)
   4B43 77            [ 7] 1253 	ld	(hl),a
                           1254 ;src/main.c:240: p.prevY = p.y;
   4B44 DD 6E D7      [19] 1255 	ld	l,-41 (ix)
   4B47 DD 66 D8      [19] 1256 	ld	h,-40 (ix)
   4B4A 7E            [ 7] 1257 	ld	a,(hl)
   4B4B DD 6E D3      [19] 1258 	ld	l,-45 (ix)
   4B4E DD 66 D4      [19] 1259 	ld	h,-44 (ix)
   4B51 77            [ 7] 1260 	ld	(hl),a
                           1261 ;src/main.c:241: p.prevAtk = p.atk;
   4B52 DD 6E E1      [19] 1262 	ld	l,-31 (ix)
   4B55 DD 66 E2      [19] 1263 	ld	h,-30 (ix)
   4B58 56            [ 7] 1264 	ld	d,(hl)
   4B59 23            [ 6] 1265 	inc	hl
   4B5A 5E            [ 7] 1266 	ld	e,(hl)
   4B5B DD 6E DF      [19] 1267 	ld	l,-33 (ix)
   4B5E DD 66 E0      [19] 1268 	ld	h,-32 (ix)
   4B61 72            [ 7] 1269 	ld	(hl),d
   4B62 23            [ 6] 1270 	inc	hl
   4B63 73            [ 7] 1271 	ld	(hl),e
                           1272 ;src/main.c:243: if(p.col != 2){
   4B64 DD 6E DB      [19] 1273 	ld	l,-37 (ix)
   4B67 DD 66 DC      [19] 1274 	ld	h,-36 (ix)
   4B6A 56            [ 7] 1275 	ld	d,(hl)
   4B6B 23            [ 6] 1276 	inc	hl
   4B6C 66            [ 7] 1277 	ld	h,(hl)
   4B6D 7A            [ 4] 1278 	ld	a,d
   4B6E D6 02         [ 7] 1279 	sub	a,#0x02
   4B70 20 04         [12] 1280 	jr	NZ,00370$
   4B72 B4            [ 4] 1281 	or	a,h
   4B73 CA 6B 4D      [10] 1282 	jp	Z,00167$
   4B76                    1283 00370$:
                           1284 ;src/main.c:244: cpct_scanKeyboard_f();
   4B76 CD 4E 51      [17] 1285 	call	_cpct_scanKeyboard_f
                           1286 ;src/main.c:245: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4B79 21 05 80      [10] 1287 	ld	hl,#0x8005
   4B7C CD 42 51      [17] 1288 	call	_cpct_isKeyPressed
   4B7F DD 75 F2      [19] 1289 	ld	-14 (ix),l
                           1290 ;src/main.c:196: if(p.atk >= 21)
   4B82 DD 6E E1      [19] 1291 	ld	l,-31 (ix)
   4B85 DD 66 E2      [19] 1292 	ld	h,-30 (ix)
   4B88 7E            [ 7] 1293 	ld	a,(hl)
   4B89 DD 77 F0      [19] 1294 	ld	-16 (ix),a
   4B8C 23            [ 6] 1295 	inc	hl
   4B8D 7E            [ 7] 1296 	ld	a,(hl)
   4B8E DD 77 F1      [19] 1297 	ld	-15 (ix),a
                           1298 ;src/main.c:232: if(p.atk < 20)
   4B91 DD 7E F0      [19] 1299 	ld	a,-16 (ix)
   4B94 D6 14         [ 7] 1300 	sub	a, #0x14
   4B96 DD 7E F1      [19] 1301 	ld	a,-15 (ix)
   4B99 DE 00         [ 7] 1302 	sbc	a, #0x00
   4B9B 3E 00         [ 7] 1303 	ld	a,#0x00
   4B9D 17            [ 4] 1304 	rla
   4B9E DD 77 EF      [19] 1305 	ld	-17 (ix),a
                           1306 ;src/main.c:249: p.atk += 1;
   4BA1 DD 7E F0      [19] 1307 	ld	a,-16 (ix)
   4BA4 C6 01         [ 7] 1308 	add	a, #0x01
   4BA6 DD 77 ED      [19] 1309 	ld	-19 (ix),a
   4BA9 DD 7E F1      [19] 1310 	ld	a,-15 (ix)
   4BAC CE 00         [ 7] 1311 	adc	a, #0x00
   4BAE DD 77 EE      [19] 1312 	ld	-18 (ix),a
                           1313 ;src/main.c:245: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4BB1 DD 7E F2      [19] 1314 	ld	a,-14 (ix)
   4BB4 B7            [ 4] 1315 	or	a, a
   4BB5 28 5D         [12] 1316 	jr	Z,00161$
   4BB7 DD 7E EF      [19] 1317 	ld	a,-17 (ix)
   4BBA B7            [ 4] 1318 	or	a, a
   4BBB 20 57         [12] 1319 	jr	NZ,00161$
                           1320 ;src/main.c:246: if(p.atk >= 50)
   4BBD DD 7E F0      [19] 1321 	ld	a,-16 (ix)
   4BC0 D6 32         [ 7] 1322 	sub	a, #0x32
   4BC2 DD 7E F1      [19] 1323 	ld	a,-15 (ix)
   4BC5 DE 00         [ 7] 1324 	sbc	a, #0x00
   4BC7 38 0C         [12] 1325 	jr	C,00124$
                           1326 ;src/main.c:247: p.atk = 0;
   4BC9 DD 6E E1      [19] 1327 	ld	l,-31 (ix)
   4BCC DD 66 E2      [19] 1328 	ld	h,-30 (ix)
   4BCF AF            [ 4] 1329 	xor	a, a
   4BD0 77            [ 7] 1330 	ld	(hl), a
   4BD1 23            [ 6] 1331 	inc	hl
   4BD2 77            [ 7] 1332 	ld	(hl), a
   4BD3 18 0F         [12] 1333 	jr	00125$
   4BD5                    1334 00124$:
                           1335 ;src/main.c:249: p.atk += 1;
   4BD5 DD 6E E1      [19] 1336 	ld	l,-31 (ix)
   4BD8 DD 66 E2      [19] 1337 	ld	h,-30 (ix)
   4BDB DD 7E ED      [19] 1338 	ld	a,-19 (ix)
   4BDE 77            [ 7] 1339 	ld	(hl),a
   4BDF 23            [ 6] 1340 	inc	hl
   4BE0 DD 7E EE      [19] 1341 	ld	a,-18 (ix)
   4BE3 77            [ 7] 1342 	ld	(hl),a
   4BE4                    1343 00125$:
                           1344 ;src/main.c:250: if(cpct_isKeyPressed(Key_CursorRight))
   4BE4 21 00 02      [10] 1345 	ld	hl,#0x0200
   4BE7 CD 42 51      [17] 1346 	call	_cpct_isKeyPressed
   4BEA 7D            [ 4] 1347 	ld	a,l
   4BEB B7            [ 4] 1348 	or	a, a
   4BEC 28 0D         [12] 1349 	jr	Z,00129$
                           1350 ;src/main.c:251: p.dir = 0;
   4BEE DD 6E DD      [19] 1351 	ld	l,-35 (ix)
   4BF1 DD 66 DE      [19] 1352 	ld	h,-34 (ix)
   4BF4 AF            [ 4] 1353 	xor	a, a
   4BF5 77            [ 7] 1354 	ld	(hl), a
   4BF6 23            [ 6] 1355 	inc	hl
   4BF7 77            [ 7] 1356 	ld	(hl), a
   4BF8 C3 A8 4D      [10] 1357 	jp	00168$
   4BFB                    1358 00129$:
                           1359 ;src/main.c:252: else if(cpct_isKeyPressed(Key_CursorLeft))
   4BFB 21 01 01      [10] 1360 	ld	hl,#0x0101
   4BFE CD 42 51      [17] 1361 	call	_cpct_isKeyPressed
   4C01 7D            [ 4] 1362 	ld	a,l
   4C02 B7            [ 4] 1363 	or	a, a
   4C03 CA A8 4D      [10] 1364 	jp	Z,00168$
                           1365 ;src/main.c:253: p.dir = 1;
   4C06 DD 6E DD      [19] 1366 	ld	l,-35 (ix)
   4C09 DD 66 DE      [19] 1367 	ld	h,-34 (ix)
   4C0C 36 01         [10] 1368 	ld	(hl),#0x01
   4C0E 23            [ 6] 1369 	inc	hl
   4C0F 36 00         [10] 1370 	ld	(hl),#0x00
   4C11 C3 A8 4D      [10] 1371 	jp	00168$
   4C14                    1372 00161$:
                           1373 ;src/main.c:255: if(p.atk < 20)
   4C14 DD 7E EF      [19] 1374 	ld	a,-17 (ix)
   4C17 B7            [ 4] 1375 	or	a, a
   4C18 28 11         [12] 1376 	jr	Z,00132$
                           1377 ;src/main.c:256: p.atk += 1;
   4C1A DD 6E E1      [19] 1378 	ld	l,-31 (ix)
   4C1D DD 66 E2      [19] 1379 	ld	h,-30 (ix)
   4C20 DD 7E ED      [19] 1380 	ld	a,-19 (ix)
   4C23 77            [ 7] 1381 	ld	(hl),a
   4C24 23            [ 6] 1382 	inc	hl
   4C25 DD 7E EE      [19] 1383 	ld	a,-18 (ix)
   4C28 77            [ 7] 1384 	ld	(hl),a
   4C29 18 0B         [12] 1385 	jr	00133$
   4C2B                    1386 00132$:
                           1387 ;src/main.c:258: p.atk = 20;
   4C2B DD 6E E1      [19] 1388 	ld	l,-31 (ix)
   4C2E DD 66 E2      [19] 1389 	ld	h,-30 (ix)
   4C31 36 14         [10] 1390 	ld	(hl),#0x14
   4C33 23            [ 6] 1391 	inc	hl
   4C34 36 00         [10] 1392 	ld	(hl),#0x00
   4C36                    1393 00133$:
                           1394 ;src/main.c:259: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4C36 21 00 02      [10] 1395 	ld	hl,#0x0200
   4C39 CD 42 51      [17] 1396 	call	_cpct_isKeyPressed
   4C3C 7D            [ 4] 1397 	ld	a,l
   4C3D B7            [ 4] 1398 	or	a, a
   4C3E 28 32         [12] 1399 	jr	Z,00157$
   4C40 DD 6E D9      [19] 1400 	ld	l,-39 (ix)
   4C43 DD 66 DA      [19] 1401 	ld	h,-38 (ix)
   4C46 56            [ 7] 1402 	ld	d,(hl)
   4C47 7A            [ 4] 1403 	ld	a,d
   4C48 D6 4C         [ 7] 1404 	sub	a, #0x4C
   4C4A 30 26         [12] 1405 	jr	NC,00157$
                           1406 ;src/main.c:260: if(p.col != 2)
   4C4C DD 6E DB      [19] 1407 	ld	l,-37 (ix)
   4C4F DD 66 DC      [19] 1408 	ld	h,-36 (ix)
   4C52 5E            [ 7] 1409 	ld	e,(hl)
   4C53 23            [ 6] 1410 	inc	hl
   4C54 66            [ 7] 1411 	ld	h,(hl)
   4C55 7B            [ 4] 1412 	ld	a,e
   4C56 D6 02         [ 7] 1413 	sub	a,#0x02
   4C58 20 03         [12] 1414 	jr	NZ,00371$
   4C5A B4            [ 4] 1415 	or	a,h
   4C5B 28 08         [12] 1416 	jr	Z,00135$
   4C5D                    1417 00371$:
                           1418 ;src/main.c:261: p.x += 1;
   4C5D 14            [ 4] 1419 	inc	d
   4C5E DD 6E D9      [19] 1420 	ld	l,-39 (ix)
   4C61 DD 66 DA      [19] 1421 	ld	h,-38 (ix)
   4C64 72            [ 7] 1422 	ld	(hl),d
   4C65                    1423 00135$:
                           1424 ;src/main.c:262: p.dir = 0;
   4C65 DD 6E DD      [19] 1425 	ld	l,-35 (ix)
   4C68 DD 66 DE      [19] 1426 	ld	h,-34 (ix)
   4C6B AF            [ 4] 1427 	xor	a, a
   4C6C 77            [ 7] 1428 	ld	(hl), a
   4C6D 23            [ 6] 1429 	inc	hl
   4C6E 77            [ 7] 1430 	ld	(hl), a
   4C6F C3 A8 4D      [10] 1431 	jp	00168$
   4C72                    1432 00157$:
                           1433 ;src/main.c:263: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4C72 21 01 01      [10] 1434 	ld	hl,#0x0101
   4C75 CD 42 51      [17] 1435 	call	_cpct_isKeyPressed
   4C78 7D            [ 4] 1436 	ld	a,l
   4C79 B7            [ 4] 1437 	or	a, a
   4C7A 28 32         [12] 1438 	jr	Z,00153$
   4C7C DD 6E D9      [19] 1439 	ld	l,-39 (ix)
   4C7F DD 66 DA      [19] 1440 	ld	h,-38 (ix)
   4C82 56            [ 7] 1441 	ld	d,(hl)
   4C83 7A            [ 4] 1442 	ld	a,d
   4C84 B7            [ 4] 1443 	or	a, a
   4C85 28 27         [12] 1444 	jr	Z,00153$
                           1445 ;src/main.c:264: if(p.col != 2)
   4C87 DD 6E DB      [19] 1446 	ld	l,-37 (ix)
   4C8A DD 66 DC      [19] 1447 	ld	h,-36 (ix)
   4C8D 5E            [ 7] 1448 	ld	e,(hl)
   4C8E 23            [ 6] 1449 	inc	hl
   4C8F 66            [ 7] 1450 	ld	h,(hl)
   4C90 7B            [ 4] 1451 	ld	a,e
   4C91 D6 02         [ 7] 1452 	sub	a,#0x02
   4C93 20 03         [12] 1453 	jr	NZ,00372$
   4C95 B4            [ 4] 1454 	or	a,h
   4C96 28 08         [12] 1455 	jr	Z,00137$
   4C98                    1456 00372$:
                           1457 ;src/main.c:265: p.x -= 1;
   4C98 15            [ 4] 1458 	dec	d
   4C99 DD 6E D9      [19] 1459 	ld	l,-39 (ix)
   4C9C DD 66 DA      [19] 1460 	ld	h,-38 (ix)
   4C9F 72            [ 7] 1461 	ld	(hl),d
   4CA0                    1462 00137$:
                           1463 ;src/main.c:266: p.dir = 1;
   4CA0 DD 6E DD      [19] 1464 	ld	l,-35 (ix)
   4CA3 DD 66 DE      [19] 1465 	ld	h,-34 (ix)
   4CA6 36 01         [10] 1466 	ld	(hl),#0x01
   4CA8 23            [ 6] 1467 	inc	hl
   4CA9 36 00         [10] 1468 	ld	(hl),#0x00
   4CAB C3 A8 4D      [10] 1469 	jp	00168$
   4CAE                    1470 00153$:
                           1471 ;src/main.c:267: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4CAE 21 00 04      [10] 1472 	ld	hl,#0x0400
   4CB1 CD 42 51      [17] 1473 	call	_cpct_isKeyPressed
   4CB4 7D            [ 4] 1474 	ld	a,l
   4CB5 B7            [ 4] 1475 	or	a, a
   4CB6 28 23         [12] 1476 	jr	Z,00149$
                           1477 ;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4CB8 DD 6E D7      [19] 1478 	ld	l,-41 (ix)
   4CBB DD 66 D8      [19] 1479 	ld	h,-40 (ix)
   4CBE 56            [ 7] 1480 	ld	d,(hl)
                           1481 ;src/main.c:267: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4CBF 7A            [ 4] 1482 	ld	a,d
   4CC0 D6 B8         [ 7] 1483 	sub	a, #0xB8
   4CC2 30 17         [12] 1484 	jr	NC,00149$
                           1485 ;src/main.c:268: p.y += 2;
   4CC4 14            [ 4] 1486 	inc	d
   4CC5 14            [ 4] 1487 	inc	d
   4CC6 DD 6E D7      [19] 1488 	ld	l,-41 (ix)
   4CC9 DD 66 D8      [19] 1489 	ld	h,-40 (ix)
   4CCC 72            [ 7] 1490 	ld	(hl),d
                           1491 ;src/main.c:269: p.dir = 2;
   4CCD DD 6E DD      [19] 1492 	ld	l,-35 (ix)
   4CD0 DD 66 DE      [19] 1493 	ld	h,-34 (ix)
   4CD3 36 02         [10] 1494 	ld	(hl),#0x02
   4CD5 23            [ 6] 1495 	inc	hl
   4CD6 36 00         [10] 1496 	ld	(hl),#0x00
   4CD8 C3 A8 4D      [10] 1497 	jp	00168$
   4CDB                    1498 00149$:
                           1499 ;src/main.c:270: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4CDB 21 00 01      [10] 1500 	ld	hl,#0x0100
   4CDE CD 42 51      [17] 1501 	call	_cpct_isKeyPressed
   4CE1 7D            [ 4] 1502 	ld	a,l
   4CE2 B7            [ 4] 1503 	or	a, a
   4CE3 28 21         [12] 1504 	jr	Z,00145$
                           1505 ;src/main.c:194: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4CE5 DD 6E D7      [19] 1506 	ld	l,-41 (ix)
   4CE8 DD 66 D8      [19] 1507 	ld	h,-40 (ix)
   4CEB 7E            [ 7] 1508 	ld	a,(hl)
                           1509 ;src/main.c:270: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4CEC B7            [ 4] 1510 	or	a, a
   4CED 28 17         [12] 1511 	jr	Z,00145$
                           1512 ;src/main.c:271: p.y -= 2;
   4CEF C6 FE         [ 7] 1513 	add	a,#0xFE
   4CF1 DD 6E D7      [19] 1514 	ld	l,-41 (ix)
   4CF4 DD 66 D8      [19] 1515 	ld	h,-40 (ix)
   4CF7 77            [ 7] 1516 	ld	(hl),a
                           1517 ;src/main.c:272: p.dir = 3;
   4CF8 DD 6E DD      [19] 1518 	ld	l,-35 (ix)
   4CFB DD 66 DE      [19] 1519 	ld	h,-34 (ix)
   4CFE 36 03         [10] 1520 	ld	(hl),#0x03
   4D00 23            [ 6] 1521 	inc	hl
   4D01 36 00         [10] 1522 	ld	(hl),#0x00
   4D03 C3 A8 4D      [10] 1523 	jp	00168$
   4D06                    1524 00145$:
                           1525 ;src/main.c:273: }else if(cpct_isKeyPressed(Key_X) && pr.vivo == 1){
   4D06 21 07 80      [10] 1526 	ld	hl,#0x8007
   4D09 CD 42 51      [17] 1527 	call	_cpct_isKeyPressed
   4D0C 7D            [ 4] 1528 	ld	a,l
   4D0D B7            [ 4] 1529 	or	a, a
   4D0E 28 4E         [12] 1530 	jr	Z,00141$
   4D10 DD 6E F6      [19] 1531 	ld	l,-10 (ix)
   4D13 DD 66 F7      [19] 1532 	ld	h,-9 (ix)
   4D16 56            [ 7] 1533 	ld	d,(hl)
   4D17 23            [ 6] 1534 	inc	hl
   4D18 66            [ 7] 1535 	ld	h,(hl)
   4D19 15            [ 4] 1536 	dec	d
   4D1A 20 42         [12] 1537 	jr	NZ,00141$
   4D1C 7C            [ 4] 1538 	ld	a,h
   4D1D B7            [ 4] 1539 	or	a, a
   4D1E 20 3E         [12] 1540 	jr	NZ,00141$
                           1541 ;src/main.c:274: pr.vivo = 0;
   4D20 DD 6E F6      [19] 1542 	ld	l,-10 (ix)
   4D23 DD 66 F7      [19] 1543 	ld	h,-9 (ix)
   4D26 AF            [ 4] 1544 	xor	a, a
   4D27 77            [ 7] 1545 	ld	(hl), a
   4D28 23            [ 6] 1546 	inc	hl
   4D29 77            [ 7] 1547 	ld	(hl), a
                           1548 ;src/main.c:275: pr.dir = p.dir;
   4D2A DD 6E DD      [19] 1549 	ld	l,-35 (ix)
   4D2D DD 66 DE      [19] 1550 	ld	h,-34 (ix)
   4D30 56            [ 7] 1551 	ld	d,(hl)
   4D31 23            [ 6] 1552 	inc	hl
   4D32 5E            [ 7] 1553 	ld	e,(hl)
   4D33 DD 6E F4      [19] 1554 	ld	l,-12 (ix)
   4D36 DD 66 F5      [19] 1555 	ld	h,-11 (ix)
   4D39 72            [ 7] 1556 	ld	(hl),d
   4D3A 23            [ 6] 1557 	inc	hl
   4D3B 73            [ 7] 1558 	ld	(hl),e
                           1559 ;src/main.c:276: pr.x = p.x+4;
   4D3C DD 6E D9      [19] 1560 	ld	l,-39 (ix)
   4D3F DD 66 DA      [19] 1561 	ld	h,-38 (ix)
   4D42 7E            [ 7] 1562 	ld	a,(hl)
   4D43 C6 04         [ 7] 1563 	add	a, #0x04
   4D45 DD 6E FE      [19] 1564 	ld	l,-2 (ix)
   4D48 DD 66 FF      [19] 1565 	ld	h,-1 (ix)
   4D4B 77            [ 7] 1566 	ld	(hl),a
                           1567 ;src/main.c:277: pr.y = p.y+8;
   4D4C DD 6E D7      [19] 1568 	ld	l,-41 (ix)
   4D4F DD 66 D8      [19] 1569 	ld	h,-40 (ix)
   4D52 7E            [ 7] 1570 	ld	a,(hl)
   4D53 C6 08         [ 7] 1571 	add	a, #0x08
   4D55 DD 6E FC      [19] 1572 	ld	l,-4 (ix)
   4D58 DD 66 FD      [19] 1573 	ld	h,-3 (ix)
   4D5B 77            [ 7] 1574 	ld	(hl),a
   4D5C 18 4A         [12] 1575 	jr	00168$
   4D5E                    1576 00141$:
                           1577 ;src/main.c:278: }else  if(cpct_isKeyPressed(Key_Esc)){
   4D5E 21 08 04      [10] 1578 	ld	hl,#0x0408
   4D61 CD 42 51      [17] 1579 	call	_cpct_isKeyPressed
   4D64 7D            [ 4] 1580 	ld	a,l
   4D65 B7            [ 4] 1581 	or	a, a
   4D66 28 40         [12] 1582 	jr	Z,00168$
                           1583 ;src/main.c:279: return;
   4D68 C3 8E 4F      [10] 1584 	jp	00200$
   4D6B                    1585 00167$:
                           1586 ;src/main.c:283: p.x -= 2;
   4D6B DD 6E D9      [19] 1587 	ld	l,-39 (ix)
   4D6E DD 66 DA      [19] 1588 	ld	h,-38 (ix)
   4D71 7E            [ 7] 1589 	ld	a,(hl)
   4D72 C6 FE         [ 7] 1590 	add	a,#0xFE
   4D74 DD 6E D9      [19] 1591 	ld	l,-39 (ix)
   4D77 DD 66 DA      [19] 1592 	ld	h,-38 (ix)
   4D7A 77            [ 7] 1593 	ld	(hl),a
                           1594 ;src/main.c:284: p.rebote -= 2;
   4D7B DD 6E EB      [19] 1595 	ld	l,-21 (ix)
   4D7E DD 66 EC      [19] 1596 	ld	h,-20 (ix)
   4D81 5E            [ 7] 1597 	ld	e,(hl)
   4D82 23            [ 6] 1598 	inc	hl
   4D83 56            [ 7] 1599 	ld	d,(hl)
   4D84 1B            [ 6] 1600 	dec	de
   4D85 1B            [ 6] 1601 	dec	de
   4D86 DD 6E EB      [19] 1602 	ld	l,-21 (ix)
   4D89 DD 66 EC      [19] 1603 	ld	h,-20 (ix)
   4D8C 73            [ 7] 1604 	ld	(hl),e
   4D8D 23            [ 6] 1605 	inc	hl
   4D8E 72            [ 7] 1606 	ld	(hl),d
                           1607 ;src/main.c:285: if(p.rebote == 0){
   4D8F 7A            [ 4] 1608 	ld	a,d
   4D90 B3            [ 4] 1609 	or	a,e
   4D91 20 15         [12] 1610 	jr	NZ,00168$
                           1611 ;src/main.c:286: p.rebote = 6;
   4D93 DD 6E EB      [19] 1612 	ld	l,-21 (ix)
   4D96 DD 66 EC      [19] 1613 	ld	h,-20 (ix)
   4D99 36 06         [10] 1614 	ld	(hl),#0x06
   4D9B 23            [ 6] 1615 	inc	hl
   4D9C 36 00         [10] 1616 	ld	(hl),#0x00
                           1617 ;src/main.c:287: p.col = 0;
   4D9E DD 6E DB      [19] 1618 	ld	l,-37 (ix)
   4DA1 DD 66 DC      [19] 1619 	ld	h,-36 (ix)
   4DA4 AF            [ 4] 1620 	xor	a, a
   4DA5 77            [ 7] 1621 	ld	(hl), a
   4DA6 23            [ 6] 1622 	inc	hl
   4DA7 77            [ 7] 1623 	ld	(hl), a
   4DA8                    1624 00168$:
                           1625 ;src/main.c:292: sprite = checkSprite(p.atk,p.dir);
   4DA8 DD 6E DD      [19] 1626 	ld	l,-35 (ix)
   4DAB DD 66 DE      [19] 1627 	ld	h,-34 (ix)
   4DAE 4E            [ 7] 1628 	ld	c,(hl)
   4DAF 23            [ 6] 1629 	inc	hl
   4DB0 46            [ 7] 1630 	ld	b,(hl)
   4DB1 DD 6E E1      [19] 1631 	ld	l,-31 (ix)
   4DB4 DD 66 E2      [19] 1632 	ld	h,-30 (ix)
   4DB7 5E            [ 7] 1633 	ld	e,(hl)
   4DB8 23            [ 6] 1634 	inc	hl
   4DB9 56            [ 7] 1635 	ld	d,(hl)
   4DBA C5            [11] 1636 	push	bc
   4DBB D5            [11] 1637 	push	de
   4DBC CD 15 45      [17] 1638 	call	_checkSprite
   4DBF F1            [10] 1639 	pop	af
   4DC0 F1            [10] 1640 	pop	af
   4DC1 33            [ 6] 1641 	inc	sp
   4DC2 33            [ 6] 1642 	inc	sp
   4DC3 E5            [11] 1643 	push	hl
                           1644 ;src/main.c:294: if(pr.vivo == 0){
   4DC4 DD 6E F6      [19] 1645 	ld	l,-10 (ix)
   4DC7 DD 66 F7      [19] 1646 	ld	h,-9 (ix)
   4DCA 7E            [ 7] 1647 	ld	a,(hl)
   4DCB DD 77 ED      [19] 1648 	ld	-19 (ix),a
   4DCE 23            [ 6] 1649 	inc	hl
   4DCF 7E            [ 7] 1650 	ld	a,(hl)
   4DD0 DD 77 EE      [19] 1651 	ld	-18 (ix), a
   4DD3 DD B6 ED      [19] 1652 	or	a,-19 (ix)
   4DD6 C2 C5 4E      [10] 1653 	jp	NZ,00187$
                           1654 ;src/main.c:295: pr.prevX = pr.x;
   4DD9 DD 6E FE      [19] 1655 	ld	l,-2 (ix)
   4DDC DD 66 FF      [19] 1656 	ld	h,-1 (ix)
   4DDF 7E            [ 7] 1657 	ld	a,(hl)
   4DE0 DD 77 ED      [19] 1658 	ld	-19 (ix),a
   4DE3 DD 6E FA      [19] 1659 	ld	l,-6 (ix)
   4DE6 DD 66 FB      [19] 1660 	ld	h,-5 (ix)
   4DE9 DD 7E ED      [19] 1661 	ld	a,-19 (ix)
   4DEC 77            [ 7] 1662 	ld	(hl),a
                           1663 ;src/main.c:296: pr.prevY = pr.y;
   4DED DD 6E FC      [19] 1664 	ld	l,-4 (ix)
   4DF0 DD 66 FD      [19] 1665 	ld	h,-3 (ix)
   4DF3 7E            [ 7] 1666 	ld	a,(hl)
   4DF4 DD 77 ED      [19] 1667 	ld	-19 (ix),a
   4DF7 DD 6E F8      [19] 1668 	ld	l,-8 (ix)
   4DFA DD 66 F9      [19] 1669 	ld	h,-7 (ix)
   4DFD DD 7E ED      [19] 1670 	ld	a,-19 (ix)
   4E00 77            [ 7] 1671 	ld	(hl),a
                           1672 ;src/main.c:297: switch((int)pr.dir){
   4E01 DD 6E F4      [19] 1673 	ld	l,-12 (ix)
   4E04 DD 66 F5      [19] 1674 	ld	h,-11 (ix)
   4E07 7E            [ 7] 1675 	ld	a,(hl)
   4E08 DD 77 ED      [19] 1676 	ld	-19 (ix),a
   4E0B 23            [ 6] 1677 	inc	hl
   4E0C 7E            [ 7] 1678 	ld	a,(hl)
   4E0D DD 77 EE      [19] 1679 	ld	-18 (ix),a
   4E10 DD CB EE 7E   [20] 1680 	bit	7, -18 (ix)
   4E14 C2 C5 4E      [10] 1681 	jp	NZ,00187$
   4E17 3E 03         [ 7] 1682 	ld	a,#0x03
   4E19 DD BE ED      [19] 1683 	cp	a, -19 (ix)
   4E1C 3E 00         [ 7] 1684 	ld	a,#0x00
   4E1E DD 9E EE      [19] 1685 	sbc	a, -18 (ix)
   4E21 E2 26 4E      [10] 1686 	jp	PO, 00375$
   4E24 EE 80         [ 7] 1687 	xor	a, #0x80
   4E26                    1688 00375$:
   4E26 FA C5 4E      [10] 1689 	jp	M,00187$
   4E29 DD 5E ED      [19] 1690 	ld	e,-19 (ix)
   4E2C 16 00         [ 7] 1691 	ld	d,#0x00
   4E2E 21 34 4E      [10] 1692 	ld	hl,#00376$
   4E31 19            [11] 1693 	add	hl,de
   4E32 19            [11] 1694 	add	hl,de
                           1695 ;src/main.c:298: case 0:
   4E33 E9            [ 4] 1696 	jp	(hl)
   4E34                    1697 00376$:
   4E34 18 06         [12] 1698 	jr	00169$
   4E36 18 27         [12] 1699 	jr	00173$
   4E38 18 47         [12] 1700 	jr	00177$
   4E3A 18 69         [12] 1701 	jr	00181$
   4E3C                    1702 00169$:
                           1703 ;src/main.c:299: if(pr.x<72)
   4E3C DD 6E FE      [19] 1704 	ld	l,-2 (ix)
   4E3F DD 66 FF      [19] 1705 	ld	h,-1 (ix)
   4E42 56            [ 7] 1706 	ld	d,(hl)
   4E43 7A            [ 4] 1707 	ld	a,d
   4E44 D6 48         [ 7] 1708 	sub	a, #0x48
   4E46 30 0A         [12] 1709 	jr	NC,00171$
                           1710 ;src/main.c:300: pr.x++;
   4E48 14            [ 4] 1711 	inc	d
   4E49 DD 6E FE      [19] 1712 	ld	l,-2 (ix)
   4E4C DD 66 FF      [19] 1713 	ld	h,-1 (ix)
   4E4F 72            [ 7] 1714 	ld	(hl),d
   4E50 18 73         [12] 1715 	jr	00187$
   4E52                    1716 00171$:
                           1717 ;src/main.c:302: pr.vivo = 1;
   4E52 DD 6E F6      [19] 1718 	ld	l,-10 (ix)
   4E55 DD 66 F7      [19] 1719 	ld	h,-9 (ix)
   4E58 36 01         [10] 1720 	ld	(hl),#0x01
   4E5A 23            [ 6] 1721 	inc	hl
   4E5B 36 00         [10] 1722 	ld	(hl),#0x00
                           1723 ;src/main.c:303: break;
   4E5D 18 66         [12] 1724 	jr	00187$
                           1725 ;src/main.c:304: case 1:
   4E5F                    1726 00173$:
                           1727 ;src/main.c:305: if(pr.x > 0)
   4E5F DD 6E FE      [19] 1728 	ld	l,-2 (ix)
   4E62 DD 66 FF      [19] 1729 	ld	h,-1 (ix)
   4E65 7E            [ 7] 1730 	ld	a,(hl)
   4E66 B7            [ 4] 1731 	or	a, a
   4E67 28 0B         [12] 1732 	jr	Z,00175$
                           1733 ;src/main.c:306: pr.x--;
   4E69 C6 FF         [ 7] 1734 	add	a,#0xFF
   4E6B DD 6E FE      [19] 1735 	ld	l,-2 (ix)
   4E6E DD 66 FF      [19] 1736 	ld	h,-1 (ix)
   4E71 77            [ 7] 1737 	ld	(hl),a
   4E72 18 51         [12] 1738 	jr	00187$
   4E74                    1739 00175$:
                           1740 ;src/main.c:308: pr.vivo = 1;
   4E74 DD 6E F6      [19] 1741 	ld	l,-10 (ix)
   4E77 DD 66 F7      [19] 1742 	ld	h,-9 (ix)
   4E7A 36 01         [10] 1743 	ld	(hl),#0x01
   4E7C 23            [ 6] 1744 	inc	hl
   4E7D 36 00         [10] 1745 	ld	(hl),#0x00
                           1746 ;src/main.c:309: break;
   4E7F 18 44         [12] 1747 	jr	00187$
                           1748 ;src/main.c:310: case 2:
   4E81                    1749 00177$:
                           1750 ;src/main.c:224: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4E81 DD 6E FC      [19] 1751 	ld	l,-4 (ix)
   4E84 DD 66 FD      [19] 1752 	ld	h,-3 (ix)
   4E87 56            [ 7] 1753 	ld	d,(hl)
                           1754 ;src/main.c:311: if(pr.y < 192)
   4E88 7A            [ 4] 1755 	ld	a,d
   4E89 D6 C0         [ 7] 1756 	sub	a, #0xC0
   4E8B 30 0B         [12] 1757 	jr	NC,00179$
                           1758 ;src/main.c:312: pr.y+=2;
   4E8D 14            [ 4] 1759 	inc	d
   4E8E 14            [ 4] 1760 	inc	d
   4E8F DD 6E FC      [19] 1761 	ld	l,-4 (ix)
   4E92 DD 66 FD      [19] 1762 	ld	h,-3 (ix)
   4E95 72            [ 7] 1763 	ld	(hl),d
   4E96 18 2D         [12] 1764 	jr	00187$
   4E98                    1765 00179$:
                           1766 ;src/main.c:314: pr.vivo = 1;
   4E98 DD 6E F6      [19] 1767 	ld	l,-10 (ix)
   4E9B DD 66 F7      [19] 1768 	ld	h,-9 (ix)
   4E9E 36 01         [10] 1769 	ld	(hl),#0x01
   4EA0 23            [ 6] 1770 	inc	hl
   4EA1 36 00         [10] 1771 	ld	(hl),#0x00
                           1772 ;src/main.c:315: break;
   4EA3 18 20         [12] 1773 	jr	00187$
                           1774 ;src/main.c:316: case 3:
   4EA5                    1775 00181$:
                           1776 ;src/main.c:224: memptr = cpct_getScreenPtr(VMEM,pr.x,pr.y);
   4EA5 DD 6E FC      [19] 1777 	ld	l,-4 (ix)
   4EA8 DD 66 FD      [19] 1778 	ld	h,-3 (ix)
   4EAB 7E            [ 7] 1779 	ld	a,(hl)
                           1780 ;src/main.c:317: if(pr.y > 0)
   4EAC B7            [ 4] 1781 	or	a, a
   4EAD 28 0B         [12] 1782 	jr	Z,00183$
                           1783 ;src/main.c:318: pr.y-=2;
   4EAF C6 FE         [ 7] 1784 	add	a,#0xFE
   4EB1 DD 6E FC      [19] 1785 	ld	l,-4 (ix)
   4EB4 DD 66 FD      [19] 1786 	ld	h,-3 (ix)
   4EB7 77            [ 7] 1787 	ld	(hl),a
   4EB8 18 0B         [12] 1788 	jr	00187$
   4EBA                    1789 00183$:
                           1790 ;src/main.c:320: pr.vivo = 1;
   4EBA DD 6E F6      [19] 1791 	ld	l,-10 (ix)
   4EBD DD 66 F7      [19] 1792 	ld	h,-9 (ix)
   4EC0 36 01         [10] 1793 	ld	(hl),#0x01
   4EC2 23            [ 6] 1794 	inc	hl
   4EC3 36 00         [10] 1795 	ld	(hl),#0x00
                           1796 ;src/main.c:322: }
   4EC5                    1797 00187$:
                           1798 ;src/main.c:325: if(p.col != 2 && e.vivo == 0){
   4EC5 DD 6E DB      [19] 1799 	ld	l,-37 (ix)
   4EC8 DD 66 DC      [19] 1800 	ld	h,-36 (ix)
   4ECB 56            [ 7] 1801 	ld	d,(hl)
   4ECC 23            [ 6] 1802 	inc	hl
   4ECD 66            [ 7] 1803 	ld	h,(hl)
   4ECE 7A            [ 4] 1804 	ld	a,d
   4ECF D6 02         [ 7] 1805 	sub	a,#0x02
   4ED1 20 04         [12] 1806 	jr	NZ,00377$
   4ED3 B4            [ 4] 1807 	or	a,h
   4ED4 CA 6E 4F      [10] 1808 	jp	Z,00193$
   4ED7                    1809 00377$:
   4ED7 DD 6E E3      [19] 1810 	ld	l,-29 (ix)
   4EDA DD 66 E4      [19] 1811 	ld	h,-28 (ix)
   4EDD 56            [ 7] 1812 	ld	d,(hl)
   4EDE 23            [ 6] 1813 	inc	hl
   4EDF 7E            [ 7] 1814 	ld	a, (hl)
   4EE0 B2            [ 4] 1815 	or	a,d
   4EE1 C2 6E 4F      [10] 1816 	jp	NZ,00193$
                           1817 ;src/main.c:326: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
   4EE4 DD 6E E1      [19] 1818 	ld	l,-31 (ix)
   4EE7 DD 66 E2      [19] 1819 	ld	h,-30 (ix)
   4EEA 4E            [ 7] 1820 	ld	c,(hl)
   4EEB 23            [ 6] 1821 	inc	hl
   4EEC 46            [ 7] 1822 	ld	b,(hl)
   4EED DD 6E DD      [19] 1823 	ld	l,-35 (ix)
   4EF0 DD 66 DE      [19] 1824 	ld	h,-34 (ix)
   4EF3 7E            [ 7] 1825 	ld	a,(hl)
   4EF4 DD 77 ED      [19] 1826 	ld	-19 (ix),a
   4EF7 23            [ 6] 1827 	inc	hl
   4EF8 7E            [ 7] 1828 	ld	a,(hl)
   4EF9 DD 77 EE      [19] 1829 	ld	-18 (ix),a
   4EFC DD 6E E5      [19] 1830 	ld	l,-27 (ix)
   4EFF DD 66 E6      [19] 1831 	ld	h,-26 (ix)
   4F02 5E            [ 7] 1832 	ld	e,(hl)
   4F03 DD 6E E7      [19] 1833 	ld	l,-25 (ix)
   4F06 DD 66 E8      [19] 1834 	ld	h,-24 (ix)
   4F09 7E            [ 7] 1835 	ld	a,(hl)
   4F0A DD 77 EF      [19] 1836 	ld	-17 (ix),a
   4F0D DD 6E D7      [19] 1837 	ld	l,-41 (ix)
   4F10 DD 66 D8      [19] 1838 	ld	h,-40 (ix)
   4F13 7E            [ 7] 1839 	ld	a,(hl)
   4F14 DD 77 F0      [19] 1840 	ld	-16 (ix),a
   4F17 DD 6E D9      [19] 1841 	ld	l,-39 (ix)
   4F1A DD 66 DA      [19] 1842 	ld	h,-38 (ix)
   4F1D 56            [ 7] 1843 	ld	d,(hl)
   4F1E C5            [11] 1844 	push	bc
   4F1F DD 6E ED      [19] 1845 	ld	l,-19 (ix)
   4F22 DD 66 EE      [19] 1846 	ld	h,-18 (ix)
   4F25 E5            [11] 1847 	push	hl
   4F26 7B            [ 4] 1848 	ld	a,e
   4F27 F5            [11] 1849 	push	af
   4F28 33            [ 6] 1850 	inc	sp
   4F29 DD 7E EF      [19] 1851 	ld	a,-17 (ix)
   4F2C F5            [11] 1852 	push	af
   4F2D 33            [ 6] 1853 	inc	sp
   4F2E DD 7E F0      [19] 1854 	ld	a,-16 (ix)
   4F31 F5            [11] 1855 	push	af
   4F32 33            [ 6] 1856 	inc	sp
   4F33 D5            [11] 1857 	push	de
   4F34 33            [ 6] 1858 	inc	sp
   4F35 CD 59 44      [17] 1859 	call	_checkCollisions
   4F38 F1            [10] 1860 	pop	af
   4F39 F1            [10] 1861 	pop	af
   4F3A F1            [10] 1862 	pop	af
   4F3B F1            [10] 1863 	pop	af
   4F3C 55            [ 4] 1864 	ld	d,l
   4F3D 5C            [ 4] 1865 	ld	e,h
   4F3E DD 6E DB      [19] 1866 	ld	l,-37 (ix)
   4F41 DD 66 DC      [19] 1867 	ld	h,-36 (ix)
   4F44 72            [ 7] 1868 	ld	(hl),d
   4F45 23            [ 6] 1869 	inc	hl
   4F46 73            [ 7] 1870 	ld	(hl),e
                           1871 ;src/main.c:327: if(p.col == 2)
   4F47 7A            [ 4] 1872 	ld	a,d
   4F48 D6 02         [ 7] 1873 	sub	a,#0x02
   4F4A 20 16         [12] 1874 	jr	NZ,00189$
   4F4C B3            [ 4] 1875 	or	a,e
   4F4D 20 13         [12] 1876 	jr	NZ,00189$
                           1877 ;src/main.c:328: p.life--;
   4F4F DD 6E E9      [19] 1878 	ld	l,-23 (ix)
   4F52 DD 66 EA      [19] 1879 	ld	h,-22 (ix)
   4F55 5E            [ 7] 1880 	ld	e,(hl)
   4F56 23            [ 6] 1881 	inc	hl
   4F57 56            [ 7] 1882 	ld	d,(hl)
   4F58 1B            [ 6] 1883 	dec	de
   4F59 DD 6E E9      [19] 1884 	ld	l,-23 (ix)
   4F5C DD 66 EA      [19] 1885 	ld	h,-22 (ix)
   4F5F 73            [ 7] 1886 	ld	(hl),e
   4F60 23            [ 6] 1887 	inc	hl
   4F61 72            [ 7] 1888 	ld	(hl),d
   4F62                    1889 00189$:
                           1890 ;src/main.c:329: if(p.life == 0)
   4F62 DD 6E E9      [19] 1891 	ld	l,-23 (ix)
   4F65 DD 66 EA      [19] 1892 	ld	h,-22 (ix)
   4F68 56            [ 7] 1893 	ld	d,(hl)
   4F69 23            [ 6] 1894 	inc	hl
   4F6A 7E            [ 7] 1895 	ld	a, (hl)
   4F6B B2            [ 4] 1896 	or	a,d
                           1897 ;src/main.c:330: return;
   4F6C 28 20         [12] 1898 	jr	Z,00200$
   4F6E                    1899 00193$:
                           1900 ;src/main.c:332: if(p.col == 1)
   4F6E DD 6E DB      [19] 1901 	ld	l,-37 (ix)
   4F71 DD 66 DC      [19] 1902 	ld	h,-36 (ix)
   4F74 56            [ 7] 1903 	ld	d,(hl)
   4F75 23            [ 6] 1904 	inc	hl
   4F76 66            [ 7] 1905 	ld	h,(hl)
   4F77 15            [ 4] 1906 	dec	d
   4F78 C2 19 49      [10] 1907 	jp	NZ,00198$
   4F7B 7C            [ 4] 1908 	ld	a,h
   4F7C B7            [ 4] 1909 	or	a, a
   4F7D C2 19 49      [10] 1910 	jp	NZ,00198$
                           1911 ;src/main.c:333: e.vivo = 1;
   4F80 DD 6E E3      [19] 1912 	ld	l,-29 (ix)
   4F83 DD 66 E4      [19] 1913 	ld	h,-28 (ix)
   4F86 36 01         [10] 1914 	ld	(hl),#0x01
   4F88 23            [ 6] 1915 	inc	hl
   4F89 36 00         [10] 1916 	ld	(hl),#0x00
   4F8B C3 19 49      [10] 1917 	jp	00198$
   4F8E                    1918 00200$:
   4F8E DD F9         [10] 1919 	ld	sp, ix
   4F90 DD E1         [14] 1920 	pop	ix
   4F92 C9            [10] 1921 	ret
                           1922 ;src/main.c:340: void main(void) {
                           1923 ;	---------------------------------
                           1924 ; Function main
                           1925 ; ---------------------------------
   4F93                    1926 _main::
                           1927 ;src/main.c:342: init();
   4F93 CD C4 43      [17] 1928 	call	_init
                           1929 ;src/main.c:345: while(1){
   4F96                    1930 00102$:
                           1931 ;src/main.c:346: menu();
   4F96 CD ED 43      [17] 1932 	call	_menu
                           1933 ;src/main.c:347: game();
   4F99 CD 0A 47      [17] 1934 	call	_game
   4F9C 18 F8         [12] 1935 	jr	00102$
                           1936 	.area _CODE
                           1937 	.area _INITIALIZER
                           1938 	.area _CABS (ABS)
