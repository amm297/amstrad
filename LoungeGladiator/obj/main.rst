                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Mon Oct  5 18:00:45 2015
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
                             16 	.globl _checkSprite
                             17 	.globl _checkCollisions
                             18 	.globl _menu
                             19 	.globl _init
                             20 	.globl _cpct_getScreenPtr
                             21 	.globl _cpct_setPalette
                             22 	.globl _cpct_fw2hw
                             23 	.globl _cpct_waitVSYNC
                             24 	.globl _cpct_setVideoMode
                             25 	.globl _cpct_drawStringM0
                             26 	.globl _cpct_drawSolidBox
                             27 	.globl _cpct_drawSpriteMasked
                             28 	.globl _cpct_isKeyPressed
                             29 	.globl _cpct_scanKeyboard_f
                             30 	.globl _cpct_memset
                             31 	.globl _cpct_disableFirmware
                             32 	.globl _g_palette
                             33 ;--------------------------------------------------------
                             34 ; special function registers
                             35 ;--------------------------------------------------------
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DATA
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _INITIALIZED
                             44 ;--------------------------------------------------------
                             45 ; absolute external ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DABS (ABS)
                             48 ;--------------------------------------------------------
                             49 ; global & static initialisations
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _GSINIT
                             53 	.area _GSFINAL
                             54 	.area _GSINIT
                             55 ;--------------------------------------------------------
                             56 ; Home
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _HOME
                             60 ;--------------------------------------------------------
                             61 ; code
                             62 ;--------------------------------------------------------
                             63 	.area _CODE
                             64 ;src/main.c:47: void init(){
                             65 ;	---------------------------------
                             66 ; Function init
                             67 ; ---------------------------------
   43C4                      68 _init::
                             69 ;src/main.c:48: cpct_disableFirmware();
   43C4 CD D4 4F      [17]   70 	call	_cpct_disableFirmware
                             71 ;src/main.c:49: cpct_setVideoMode(0);
   43C7 AF            [ 4]   72 	xor	a, a
   43C8 F5            [11]   73 	push	af
   43C9 33            [ 6]   74 	inc	sp
   43CA CD B1 4F      [17]   75 	call	_cpct_setVideoMode
   43CD 33            [ 6]   76 	inc	sp
                             77 ;src/main.c:50: cpct_fw2hw(g_palette,4);
   43CE 11 E9 43      [10]   78 	ld	de,#_g_palette
   43D1 3E 04         [ 7]   79 	ld	a,#0x04
   43D3 F5            [11]   80 	push	af
   43D4 33            [ 6]   81 	inc	sp
   43D5 D5            [11]   82 	push	de
   43D6 CD 3B 4F      [17]   83 	call	_cpct_fw2hw
   43D9 F1            [10]   84 	pop	af
   43DA 33            [ 6]   85 	inc	sp
                             86 ;src/main.c:51: cpct_setPalette(g_palette,4);
   43DB 11 E9 43      [10]   87 	ld	de,#_g_palette
   43DE 3E 04         [ 7]   88 	ld	a,#0x04
   43E0 F5            [11]   89 	push	af
   43E1 33            [ 6]   90 	inc	sp
   43E2 D5            [11]   91 	push	de
   43E3 CD E0 4D      [17]   92 	call	_cpct_setPalette
   43E6 F1            [10]   93 	pop	af
   43E7 33            [ 6]   94 	inc	sp
   43E8 C9            [10]   95 	ret
   43E9                      96 _g_palette:
   43E9 00                   97 	.db #0x00	; 0
   43EA 1A                   98 	.db #0x1A	; 26
   43EB 06                   99 	.db #0x06	; 6
   43EC 12                  100 	.db #0x12	; 18
                            101 ;src/main.c:55: void menu(){
                            102 ;	---------------------------------
                            103 ; Function menu
                            104 ; ---------------------------------
   43ED                     105 _menu::
                            106 ;src/main.c:57: cpct_clearScreen(0);
   43ED 21 00 40      [10]  107 	ld	hl,#0x4000
   43F0 E5            [11]  108 	push	hl
   43F1 AF            [ 4]  109 	xor	a, a
   43F2 F5            [11]  110 	push	af
   43F3 33            [ 6]  111 	inc	sp
   43F4 26 C0         [ 7]  112 	ld	h, #0xC0
   43F6 E5            [11]  113 	push	hl
   43F7 CD C3 4F      [17]  114 	call	_cpct_memset
                            115 ;src/main.c:59: memptr = cpct_getScreenPtr(VMEM,20,10);
   43FA 21 14 0A      [10]  116 	ld	hl,#0x0A14
   43FD E5            [11]  117 	push	hl
   43FE 21 00 C0      [10]  118 	ld	hl,#0xC000
   4401 E5            [11]  119 	push	hl
   4402 CD 9D 50      [17]  120 	call	_cpct_getScreenPtr
                            121 ;src/main.c:60: cpct_drawStringM0("Super Menu",memptr,2,3);
   4405 EB            [ 4]  122 	ex	de,hl
   4406 01 42 44      [10]  123 	ld	bc,#___str_0+0
   4409 21 02 03      [10]  124 	ld	hl,#0x0302
   440C E5            [11]  125 	push	hl
   440D D5            [11]  126 	push	de
   440E C5            [11]  127 	push	bc
   440F CD 7A 4E      [17]  128 	call	_cpct_drawStringM0
   4412 21 06 00      [10]  129 	ld	hl,#6
   4415 39            [11]  130 	add	hl,sp
   4416 F9            [ 6]  131 	ld	sp,hl
                            132 ;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,18,180);
   4417 21 12 B4      [10]  133 	ld	hl,#0xB412
   441A E5            [11]  134 	push	hl
   441B 21 00 C0      [10]  135 	ld	hl,#0xC000
   441E E5            [11]  136 	push	hl
   441F CD 9D 50      [17]  137 	call	_cpct_getScreenPtr
                            138 ;src/main.c:63: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   4422 EB            [ 4]  139 	ex	de,hl
   4423 01 4D 44      [10]  140 	ld	bc,#___str_1+0
   4426 21 04 05      [10]  141 	ld	hl,#0x0504
   4429 E5            [11]  142 	push	hl
   442A D5            [11]  143 	push	de
   442B C5            [11]  144 	push	bc
   442C CD 7A 4E      [17]  145 	call	_cpct_drawStringM0
   442F 21 06 00      [10]  146 	ld	hl,#6
   4432 39            [11]  147 	add	hl,sp
   4433 F9            [ 6]  148 	ld	sp,hl
                            149 ;src/main.c:65: do{
   4434                     150 00101$:
                            151 ;src/main.c:66: cpct_scanKeyboard_f();
   4434 CD 10 4E      [17]  152 	call	_cpct_scanKeyboard_f
                            153 ;src/main.c:67: }while(!cpct_isKeyPressed(Key_Enter));
   4437 21 00 40      [10]  154 	ld	hl,#0x4000
   443A CD 04 4E      [17]  155 	call	_cpct_isKeyPressed
   443D 7D            [ 4]  156 	ld	a,l
   443E B7            [ 4]  157 	or	a, a
   443F 28 F3         [12]  158 	jr	Z,00101$
   4441 C9            [10]  159 	ret
   4442                     160 ___str_0:
   4442 53 75 70 65 72 20   161 	.ascii "Super Menu"
        4D 65 6E 75
   444C 00                  162 	.db 0x00
   444D                     163 ___str_1:
   444D 50 75 6C 73 61 20   164 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4458 00                  165 	.db 0x00
                            166 ;src/main.c:72: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            167 ;	---------------------------------
                            168 ; Function checkCollisions
                            169 ; ---------------------------------
   4459                     170 _checkCollisions::
   4459 DD E5         [15]  171 	push	ix
   445B DD 21 00 00   [14]  172 	ld	ix,#0
   445F DD 39         [15]  173 	add	ix,sp
   4461 3B            [ 6]  174 	dec	sp
                            175 ;src/main.c:73: if((u8)atk >= 21)
   4462 DD 7E 0A      [19]  176 	ld	a,10 (ix)
   4465 DD 77 FF      [19]  177 	ld	-1 (ix),a
                            178 ;src/main.c:75: if(eX - pX > -1 && eX - pX < 11)
   4468 DD 4E 06      [19]  179 	ld	c,6 (ix)
   446B 06 00         [ 7]  180 	ld	b,#0x00
   446D DD 6E 04      [19]  181 	ld	l,4 (ix)
   4470 26 00         [ 7]  182 	ld	h,#0x00
   4472 79            [ 4]  183 	ld	a,c
   4473 95            [ 4]  184 	sub	a, l
   4474 5F            [ 4]  185 	ld	e,a
   4475 78            [ 4]  186 	ld	a,b
   4476 9C            [ 4]  187 	sbc	a, h
   4477 57            [ 4]  188 	ld	d,a
                            189 ;src/main.c:73: if((u8)atk >= 21)
   4478 DD 7E FF      [19]  190 	ld	a,-1 (ix)
   447B D6 15         [ 7]  191 	sub	a, #0x15
   447D 38 4F         [12]  192 	jr	C,00118$
                            193 ;src/main.c:74: if(dir == 0)
   447F DD 7E 09      [19]  194 	ld	a,9 (ix)
   4482 DD B6 08      [19]  195 	or	a,8 (ix)
   4485 20 21         [12]  196 	jr	NZ,00110$
                            197 ;src/main.c:75: if(eX - pX > -1 && eX - pX < 11)
   4487 3E FF         [ 7]  198 	ld	a,#0xFF
   4489 BB            [ 4]  199 	cp	a, e
   448A 9A            [ 4]  200 	sbc	a, d
   448B E2 90 44      [10]  201 	jp	PO, 00162$
   448E EE 80         [ 7]  202 	xor	a, #0x80
   4490                     203 00162$:
   4490 F2 A3 44      [10]  204 	jp	P,00102$
   4493 7B            [ 4]  205 	ld	a,e
   4494 D6 0B         [ 7]  206 	sub	a, #0x0B
   4496 7A            [ 4]  207 	ld	a,d
   4497 17            [ 4]  208 	rla
   4498 3F            [ 4]  209 	ccf
   4499 1F            [ 4]  210 	rra
   449A DE 80         [ 7]  211 	sbc	a, #0x80
   449C 30 05         [12]  212 	jr	NC,00102$
                            213 ;src/main.c:76: return 1;
   449E 21 01 00      [10]  214 	ld	hl,#0x0001
   44A1 18 6E         [12]  215 	jr	00120$
   44A3                     216 00102$:
                            217 ;src/main.c:78: return 0;
   44A3 21 00 00      [10]  218 	ld	hl,#0x0000
   44A6 18 69         [12]  219 	jr	00120$
   44A8                     220 00110$:
                            221 ;src/main.c:80: if(pX - eX > -1 && pX - eX < 11)
   44A8 BF            [ 4]  222 	cp	a, a
   44A9 ED 42         [15]  223 	sbc	hl, bc
   44AB 3E FF         [ 7]  224 	ld	a,#0xFF
   44AD BD            [ 4]  225 	cp	a, l
   44AE 9C            [ 4]  226 	sbc	a, h
   44AF E2 B4 44      [10]  227 	jp	PO, 00163$
   44B2 EE 80         [ 7]  228 	xor	a, #0x80
   44B4                     229 00163$:
   44B4 F2 C9 44      [10]  230 	jp	P,00106$
   44B7 11 0B 80      [10]  231 	ld	de, #0x800B
   44BA 29            [11]  232 	add	hl, hl
   44BB 3F            [ 4]  233 	ccf
   44BC CB 1C         [ 8]  234 	rr	h
   44BE CB 1D         [ 8]  235 	rr	l
   44C0 ED 52         [15]  236 	sbc	hl, de
   44C2 30 05         [12]  237 	jr	NC,00106$
                            238 ;src/main.c:81: return 1;
   44C4 21 01 00      [10]  239 	ld	hl,#0x0001
   44C7 18 48         [12]  240 	jr	00120$
   44C9                     241 00106$:
                            242 ;src/main.c:83: return 0;
   44C9 21 00 00      [10]  243 	ld	hl,#0x0000
   44CC 18 43         [12]  244 	jr	00120$
   44CE                     245 00118$:
                            246 ;src/main.c:85: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
   44CE AF            [ 4]  247 	xor	a, a
   44CF BB            [ 4]  248 	cp	a, e
   44D0 9A            [ 4]  249 	sbc	a, d
   44D1 E2 D6 44      [10]  250 	jp	PO, 00164$
   44D4 EE 80         [ 7]  251 	xor	a, #0x80
   44D6                     252 00164$:
   44D6 F2 0E 45      [10]  253 	jp	P,00119$
   44D9 7B            [ 4]  254 	ld	a,e
   44DA D6 04         [ 7]  255 	sub	a, #0x04
   44DC 7A            [ 4]  256 	ld	a,d
   44DD 17            [ 4]  257 	rla
   44DE 3F            [ 4]  258 	ccf
   44DF 1F            [ 4]  259 	rra
   44E0 DE 80         [ 7]  260 	sbc	a, #0x80
   44E2 30 2A         [12]  261 	jr	NC,00119$
   44E4 DD 6E 07      [19]  262 	ld	l,7 (ix)
   44E7 26 00         [ 7]  263 	ld	h,#0x00
   44E9 DD 5E 05      [19]  264 	ld	e,5 (ix)
   44EC 16 00         [ 7]  265 	ld	d,#0x00
   44EE BF            [ 4]  266 	cp	a, a
   44EF ED 52         [15]  267 	sbc	hl, de
   44F1 AF            [ 4]  268 	xor	a, a
   44F2 BD            [ 4]  269 	cp	a, l
   44F3 9C            [ 4]  270 	sbc	a, h
   44F4 E2 F9 44      [10]  271 	jp	PO, 00165$
   44F7 EE 80         [ 7]  272 	xor	a, #0x80
   44F9                     273 00165$:
   44F9 F2 0E 45      [10]  274 	jp	P,00119$
   44FC 11 10 80      [10]  275 	ld	de, #0x8010
   44FF 29            [11]  276 	add	hl, hl
   4500 3F            [ 4]  277 	ccf
   4501 CB 1C         [ 8]  278 	rr	h
   4503 CB 1D         [ 8]  279 	rr	l
   4505 ED 52         [15]  280 	sbc	hl, de
   4507 30 05         [12]  281 	jr	NC,00119$
                            282 ;src/main.c:86: return 2;
   4509 21 02 00      [10]  283 	ld	hl,#0x0002
   450C 18 03         [12]  284 	jr	00120$
   450E                     285 00119$:
                            286 ;src/main.c:88: return 0;
   450E 21 00 00      [10]  287 	ld	hl,#0x0000
   4511                     288 00120$:
   4511 33            [ 6]  289 	inc	sp
   4512 DD E1         [14]  290 	pop	ix
   4514 C9            [10]  291 	ret
                            292 ;src/main.c:91: u8* checkSprite(u8* atk, u8* dir){
                            293 ;	---------------------------------
                            294 ; Function checkSprite
                            295 ; ---------------------------------
   4515                     296 _checkSprite::
                            297 ;src/main.c:92: if(atk <= 20)
   4515 3E 14         [ 7]  298 	ld	a,#0x14
   4517 FD 21 02 00   [14]  299 	ld	iy,#2
   451B FD 39         [15]  300 	add	iy,sp
   451D FD BE 00      [19]  301 	cp	a, 0 (iy)
   4520 3E 00         [ 7]  302 	ld	a,#0x00
   4522 FD 9E 01      [19]  303 	sbc	a, 1 (iy)
   4525 38 3B         [12]  304 	jr	C,00110$
                            305 ;src/main.c:93: switch((int)dir){
   4527 FD 21 04 00   [14]  306 	ld	iy,#4
   452B FD 39         [15]  307 	add	iy,sp
   452D FD 5E 00      [19]  308 	ld	e,0 (iy)
   4530 FD 56 01      [19]  309 	ld	d,1 (iy)
   4533 CB 7A         [ 8]  310 	bit	7, d
   4535 C0            [11]  311 	ret	NZ
   4536 3E 03         [ 7]  312 	ld	a,#0x03
   4538 BB            [ 4]  313 	cp	a, e
   4539 3E 00         [ 7]  314 	ld	a,#0x00
   453B 9A            [ 4]  315 	sbc	a, d
   453C E2 41 45      [10]  316 	jp	PO, 00130$
   453F EE 80         [ 7]  317 	xor	a, #0x80
   4541                     318 00130$:
   4541 F8            [11]  319 	ret	M
   4542 16 00         [ 7]  320 	ld	d,#0x00
   4544 21 4A 45      [10]  321 	ld	hl,#00131$
   4547 19            [11]  322 	add	hl,de
   4548 19            [11]  323 	add	hl,de
                            324 ;src/main.c:94: case 0:
   4549 E9            [ 4]  325 	jp	(hl)
   454A                     326 00131$:
   454A 18 06         [12]  327 	jr	00101$
   454C 18 08         [12]  328 	jr	00102$
   454E 18 0A         [12]  329 	jr	00103$
   4550 18 0C         [12]  330 	jr	00104$
   4552                     331 00101$:
                            332 ;src/main.c:95: return gladis_quieto_dcha;
   4552 21 40 42      [10]  333 	ld	hl,#_gladis_quieto_dcha
   4555 C9            [10]  334 	ret
                            335 ;src/main.c:97: case 1:
   4556                     336 00102$:
                            337 ;src/main.c:98: return gladis_quieto_izda;
   4556 21 C0 42      [10]  338 	ld	hl,#_gladis_quieto_izda
   4559 C9            [10]  339 	ret
                            340 ;src/main.c:100: case 2:
   455A                     341 00103$:
                            342 ;src/main.c:101: return gladis_quieto_dcha;
   455A 21 40 42      [10]  343 	ld	hl,#_gladis_quieto_dcha
   455D C9            [10]  344 	ret
                            345 ;src/main.c:103: case 3:
   455E                     346 00104$:
                            347 ;src/main.c:104: return gladis_arriba_dcha;
   455E 21 40 40      [10]  348 	ld	hl,#_gladis_arriba_dcha
   4561 C9            [10]  349 	ret
                            350 ;src/main.c:105: }
   4562                     351 00110$:
                            352 ;src/main.c:106: else if(dir == 0){
   4562 21 05 00      [10]  353 	ld	hl, #4+1
   4565 39            [11]  354 	add	hl, sp
   4566 7E            [ 7]  355 	ld	a, (hl)
   4567 2B            [ 6]  356 	dec	hl
   4568 B6            [ 7]  357 	or	a,(hl)
   4569 20 04         [12]  358 	jr	NZ,00107$
                            359 ;src/main.c:107: return gladis_atk_dcha;
   456B 21 A0 4C      [10]  360 	ld	hl,#_gladis_atk_dcha
   456E C9            [10]  361 	ret
   456F                     362 00107$:
                            363 ;src/main.c:109: return gladis_atk_izda;
   456F 21 40 4D      [10]  364 	ld	hl,#_gladis_atk_izda
   4572 C9            [10]  365 	ret
                            366 ;src/main.c:114: void drawFatiga(u8* atk, u8* memptr, u8 col){
                            367 ;	---------------------------------
                            368 ; Function drawFatiga
                            369 ; ---------------------------------
   4573                     370 _drawFatiga::
   4573 DD E5         [15]  371 	push	ix
   4575 DD 21 00 00   [14]  372 	ld	ix,#0
   4579 DD 39         [15]  373 	add	ix,sp
                            374 ;src/main.c:115: if(atk < 20)
   457B DD 7E 04      [19]  375 	ld	a,4 (ix)
   457E D6 14         [ 7]  376 	sub	a, #0x14
   4580 DD 7E 05      [19]  377 	ld	a,5 (ix)
   4583 DE 00         [ 7]  378 	sbc	a, #0x00
   4585 30 04         [12]  379 	jr	NC,00102$
                            380 ;src/main.c:116: col = 2;
   4587 DD 36 08 02   [19]  381 	ld	8 (ix),#0x02
   458B                     382 00102$:
                            383 ;src/main.c:117: if(atk > 30 || atk <= 20){
   458B 3E 14         [ 7]  384 	ld	a,#0x14
   458D DD BE 04      [19]  385 	cp	a, 4 (ix)
   4590 3E 00         [ 7]  386 	ld	a,#0x00
   4592 DD 9E 05      [19]  387 	sbc	a, 5 (ix)
   4595 3E 00         [ 7]  388 	ld	a,#0x00
   4597 17            [ 4]  389 	rla
   4598 57            [ 4]  390 	ld	d,a
   4599 3E 1E         [ 7]  391 	ld	a,#0x1E
   459B DD BE 04      [19]  392 	cp	a, 4 (ix)
   459E 3E 00         [ 7]  393 	ld	a,#0x00
   45A0 DD 9E 05      [19]  394 	sbc	a, 5 (ix)
   45A3 38 04         [12]  395 	jr	C,00103$
   45A5 7A            [ 4]  396 	ld	a,d
   45A6 B7            [ 4]  397 	or	a, a
   45A7 20 27         [12]  398 	jr	NZ,00104$
   45A9                     399 00103$:
                            400 ;src/main.c:118: memptr = cpct_getScreenPtr(VMEM,4,160);
   45A9 D5            [11]  401 	push	de
   45AA 21 04 A0      [10]  402 	ld	hl,#0xA004
   45AD E5            [11]  403 	push	hl
   45AE 21 00 C0      [10]  404 	ld	hl,#0xC000
   45B1 E5            [11]  405 	push	hl
   45B2 CD 9D 50      [17]  406 	call	_cpct_getScreenPtr
   45B5 D1            [10]  407 	pop	de
                            408 ;src/main.c:119: cpct_drawSolidBox(memptr, col, 2, 8);
   45B6 DD 75 06      [19]  409 	ld	6 (ix),l
   45B9 DD 74 07      [19]  410 	ld	7 (ix),h
   45BC 4D            [ 4]  411 	ld	c,l
   45BD 44            [ 4]  412 	ld	b,h
   45BE D5            [11]  413 	push	de
   45BF 21 02 08      [10]  414 	ld	hl,#0x0802
   45C2 E5            [11]  415 	push	hl
   45C3 DD 7E 08      [19]  416 	ld	a,8 (ix)
   45C6 F5            [11]  417 	push	af
   45C7 33            [ 6]  418 	inc	sp
   45C8 C5            [11]  419 	push	bc
   45C9 CD E5 4F      [17]  420 	call	_cpct_drawSolidBox
   45CC F1            [10]  421 	pop	af
   45CD F1            [10]  422 	pop	af
   45CE 33            [ 6]  423 	inc	sp
   45CF D1            [10]  424 	pop	de
   45D0                     425 00104$:
                            426 ;src/main.c:121: if(atk > 40 || atk <= 20){
   45D0 3E 28         [ 7]  427 	ld	a,#0x28
   45D2 DD BE 04      [19]  428 	cp	a, 4 (ix)
   45D5 3E 00         [ 7]  429 	ld	a,#0x00
   45D7 DD 9E 05      [19]  430 	sbc	a, 5 (ix)
   45DA 38 04         [12]  431 	jr	C,00106$
   45DC 7A            [ 4]  432 	ld	a,d
   45DD B7            [ 4]  433 	or	a, a
   45DE 20 27         [12]  434 	jr	NZ,00107$
   45E0                     435 00106$:
                            436 ;src/main.c:122: memptr = cpct_getScreenPtr(VMEM,7,160);
   45E0 D5            [11]  437 	push	de
   45E1 21 07 A0      [10]  438 	ld	hl,#0xA007
   45E4 E5            [11]  439 	push	hl
   45E5 21 00 C0      [10]  440 	ld	hl,#0xC000
   45E8 E5            [11]  441 	push	hl
   45E9 CD 9D 50      [17]  442 	call	_cpct_getScreenPtr
   45EC D1            [10]  443 	pop	de
                            444 ;src/main.c:123: cpct_drawSolidBox(memptr, col, 2, 8);
   45ED DD 75 06      [19]  445 	ld	6 (ix),l
   45F0 DD 74 07      [19]  446 	ld	7 (ix),h
   45F3 4D            [ 4]  447 	ld	c,l
   45F4 44            [ 4]  448 	ld	b,h
   45F5 D5            [11]  449 	push	de
   45F6 21 02 08      [10]  450 	ld	hl,#0x0802
   45F9 E5            [11]  451 	push	hl
   45FA DD 7E 08      [19]  452 	ld	a,8 (ix)
   45FD F5            [11]  453 	push	af
   45FE 33            [ 6]  454 	inc	sp
   45FF C5            [11]  455 	push	bc
   4600 CD E5 4F      [17]  456 	call	_cpct_drawSolidBox
   4603 F1            [10]  457 	pop	af
   4604 F1            [10]  458 	pop	af
   4605 33            [ 6]  459 	inc	sp
   4606 D1            [10]  460 	pop	de
   4607                     461 00107$:
                            462 ;src/main.c:125: if(atk <= 20){
   4607 7A            [ 4]  463 	ld	a,d
   4608 B7            [ 4]  464 	or	a, a
   4609 20 22         [12]  465 	jr	NZ,00111$
                            466 ;src/main.c:126: memptr = cpct_getScreenPtr(VMEM,10,160);
   460B 21 0A A0      [10]  467 	ld	hl,#0xA00A
   460E E5            [11]  468 	push	hl
   460F 21 00 C0      [10]  469 	ld	hl,#0xC000
   4612 E5            [11]  470 	push	hl
   4613 CD 9D 50      [17]  471 	call	_cpct_getScreenPtr
                            472 ;src/main.c:127: cpct_drawSolidBox(memptr, col, 2, 8);
   4616 DD 75 06      [19]  473 	ld	6 (ix),l
   4619 DD 74 07      [19]  474 	ld	7 (ix),h
   461C EB            [ 4]  475 	ex	de,hl
   461D 21 02 08      [10]  476 	ld	hl,#0x0802
   4620 E5            [11]  477 	push	hl
   4621 DD 7E 08      [19]  478 	ld	a,8 (ix)
   4624 F5            [11]  479 	push	af
   4625 33            [ 6]  480 	inc	sp
   4626 D5            [11]  481 	push	de
   4627 CD E5 4F      [17]  482 	call	_cpct_drawSolidBox
   462A F1            [10]  483 	pop	af
   462B F1            [10]  484 	pop	af
   462C 33            [ 6]  485 	inc	sp
   462D                     486 00111$:
   462D DD E1         [14]  487 	pop	ix
   462F C9            [10]  488 	ret
                            489 ;src/main.c:132: void drawVida(u8* life, u8* memptr){
                            490 ;	---------------------------------
                            491 ; Function drawVida
                            492 ; ---------------------------------
   4630                     493 _drawVida::
   4630 DD E5         [15]  494 	push	ix
   4632 DD 21 00 00   [14]  495 	ld	ix,#0
   4636 DD 39         [15]  496 	add	ix,sp
                            497 ;src/main.c:133: if(life >= 1){
   4638 DD 7E 04      [19]  498 	ld	a,4 (ix)
   463B D6 01         [ 7]  499 	sub	a, #0x01
   463D DD 7E 05      [19]  500 	ld	a,5 (ix)
   4640 DE 00         [ 7]  501 	sbc	a, #0x00
   4642 38 1F         [12]  502 	jr	C,00102$
                            503 ;src/main.c:134: memptr = cpct_getScreenPtr(VMEM,55,160);
   4644 21 37 A0      [10]  504 	ld	hl,#0xA037
   4647 E5            [11]  505 	push	hl
   4648 21 00 C0      [10]  506 	ld	hl,#0xC000
   464B E5            [11]  507 	push	hl
   464C CD 9D 50      [17]  508 	call	_cpct_getScreenPtr
                            509 ;src/main.c:135: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   464F DD 75 06      [19]  510 	ld	6 (ix),l
   4652 DD 74 07      [19]  511 	ld	7 (ix),h
   4655 4D            [ 4]  512 	ld	c,l
   4656 44            [ 4]  513 	ld	b,h
   4657 11 44 43      [10]  514 	ld	de,#_corazon_lleno
   465A 21 04 08      [10]  515 	ld	hl,#0x0804
   465D E5            [11]  516 	push	hl
   465E C5            [11]  517 	push	bc
   465F D5            [11]  518 	push	de
   4660 CD 5F 4F      [17]  519 	call	_cpct_drawSpriteMasked
   4663                     520 00102$:
                            521 ;src/main.c:137: memptr = cpct_getScreenPtr(VMEM,60,160);
   4663 21 3C A0      [10]  522 	ld	hl,#0xA03C
   4666 E5            [11]  523 	push	hl
   4667 21 00 C0      [10]  524 	ld	hl,#0xC000
   466A E5            [11]  525 	push	hl
   466B CD 9D 50      [17]  526 	call	_cpct_getScreenPtr
                            527 ;src/main.c:135: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   466E DD 75 06      [19]  528 	ld	6 (ix),l
   4671 DD 74 07      [19]  529 	ld	7 (ix),h
   4674 4D            [ 4]  530 	ld	c,l
   4675 44            [ 4]  531 	ld	b,h
                            532 ;src/main.c:138: if(life >= 2)
   4676 DD 7E 04      [19]  533 	ld	a,4 (ix)
   4679 D6 02         [ 7]  534 	sub	a, #0x02
   467B DD 7E 05      [19]  535 	ld	a,5 (ix)
   467E DE 00         [ 7]  536 	sbc	a, #0x00
   4680 38 0E         [12]  537 	jr	C,00104$
                            538 ;src/main.c:139: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4682 11 44 43      [10]  539 	ld	de,#_corazon_lleno
   4685 21 04 08      [10]  540 	ld	hl,#0x0804
   4688 E5            [11]  541 	push	hl
   4689 C5            [11]  542 	push	bc
   468A D5            [11]  543 	push	de
   468B CD 5F 4F      [17]  544 	call	_cpct_drawSpriteMasked
   468E 18 0C         [12]  545 	jr	00105$
   4690                     546 00104$:
                            547 ;src/main.c:141: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4690 11 84 43      [10]  548 	ld	de,#_corazon_roto
   4693 21 04 08      [10]  549 	ld	hl,#0x0804
   4696 E5            [11]  550 	push	hl
   4697 C5            [11]  551 	push	bc
   4698 D5            [11]  552 	push	de
   4699 CD 5F 4F      [17]  553 	call	_cpct_drawSpriteMasked
   469C                     554 00105$:
                            555 ;src/main.c:142: memptr = cpct_getScreenPtr(VMEM,65,160);
   469C 21 41 A0      [10]  556 	ld	hl,#0xA041
   469F E5            [11]  557 	push	hl
   46A0 21 00 C0      [10]  558 	ld	hl,#0xC000
   46A3 E5            [11]  559 	push	hl
   46A4 CD 9D 50      [17]  560 	call	_cpct_getScreenPtr
                            561 ;src/main.c:135: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46A7 DD 75 06      [19]  562 	ld	6 (ix),l
   46AA DD 74 07      [19]  563 	ld	7 (ix),h
   46AD EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:143: if(life >= 3)
   46AE DD 7E 04      [19]  566 	ld	a,4 (ix)
   46B1 D6 03         [ 7]  567 	sub	a, #0x03
   46B3 DD 7E 05      [19]  568 	ld	a,5 (ix)
   46B6 DE 00         [ 7]  569 	sbc	a, #0x00
   46B8 38 0E         [12]  570 	jr	C,00107$
                            571 ;src/main.c:144: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46BA 01 44 43      [10]  572 	ld	bc,#_corazon_lleno
   46BD 21 04 08      [10]  573 	ld	hl,#0x0804
   46C0 E5            [11]  574 	push	hl
   46C1 D5            [11]  575 	push	de
   46C2 C5            [11]  576 	push	bc
   46C3 CD 5F 4F      [17]  577 	call	_cpct_drawSpriteMasked
   46C6 18 0C         [12]  578 	jr	00109$
   46C8                     579 00107$:
                            580 ;src/main.c:146: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   46C8 01 84 43      [10]  581 	ld	bc,#_corazon_roto+0
   46CB 21 04 08      [10]  582 	ld	hl,#0x0804
   46CE E5            [11]  583 	push	hl
   46CF D5            [11]  584 	push	de
   46D0 C5            [11]  585 	push	bc
   46D1 CD 5F 4F      [17]  586 	call	_cpct_drawSpriteMasked
   46D4                     587 00109$:
   46D4 DD E1         [14]  588 	pop	ix
   46D6 C9            [10]  589 	ret
                            590 ;src/main.c:152: void game(){
                            591 ;	---------------------------------
                            592 ; Function game
                            593 ; ---------------------------------
   46D7                     594 _game::
   46D7 DD E5         [15]  595 	push	ix
   46D9 DD 21 00 00   [14]  596 	ld	ix,#0
   46DD DD 39         [15]  597 	add	ix,sp
   46DF 21 CC FF      [10]  598 	ld	hl,#-52
   46E2 39            [11]  599 	add	hl,sp
   46E3 F9            [ 6]  600 	ld	sp,hl
                            601 ;src/main.c:153: TPlayer p = { 0,100,20,0,0,6,3 };
   46E4 21 00 00      [10]  602 	ld	hl,#0x0000
   46E7 39            [11]  603 	add	hl,sp
   46E8 36 00         [10]  604 	ld	(hl),#0x00
   46EA 21 00 00      [10]  605 	ld	hl,#0x0000
   46ED 39            [11]  606 	add	hl,sp
   46EE DD 75 E6      [19]  607 	ld	-26 (ix),l
   46F1 DD 74 E7      [19]  608 	ld	-25 (ix),h
   46F4 DD 7E E6      [19]  609 	ld	a,-26 (ix)
   46F7 C6 01         [ 7]  610 	add	a, #0x01
   46F9 DD 77 ED      [19]  611 	ld	-19 (ix),a
   46FC DD 7E E7      [19]  612 	ld	a,-25 (ix)
   46FF CE 00         [ 7]  613 	adc	a, #0x00
   4701 DD 77 EE      [19]  614 	ld	-18 (ix),a
   4704 DD 6E ED      [19]  615 	ld	l,-19 (ix)
   4707 DD 66 EE      [19]  616 	ld	h,-18 (ix)
   470A 36 64         [10]  617 	ld	(hl),#0x64
   470C DD 7E E6      [19]  618 	ld	a,-26 (ix)
   470F C6 02         [ 7]  619 	add	a, #0x02
   4711 DD 77 EB      [19]  620 	ld	-21 (ix),a
   4714 DD 7E E7      [19]  621 	ld	a,-25 (ix)
   4717 CE 00         [ 7]  622 	adc	a, #0x00
   4719 DD 77 EC      [19]  623 	ld	-20 (ix),a
   471C DD 6E EB      [19]  624 	ld	l,-21 (ix)
   471F DD 66 EC      [19]  625 	ld	h,-20 (ix)
   4722 36 14         [10]  626 	ld	(hl),#0x14
   4724 23            [ 6]  627 	inc	hl
   4725 36 00         [10]  628 	ld	(hl),#0x00
   4727 DD 7E E6      [19]  629 	ld	a,-26 (ix)
   472A C6 04         [ 7]  630 	add	a, #0x04
   472C DD 77 FE      [19]  631 	ld	-2 (ix),a
   472F DD 7E E7      [19]  632 	ld	a,-25 (ix)
   4732 CE 00         [ 7]  633 	adc	a, #0x00
   4734 DD 77 FF      [19]  634 	ld	-1 (ix),a
   4737 DD 6E FE      [19]  635 	ld	l,-2 (ix)
   473A DD 66 FF      [19]  636 	ld	h,-1 (ix)
   473D AF            [ 4]  637 	xor	a, a
   473E 77            [ 7]  638 	ld	(hl), a
   473F 23            [ 6]  639 	inc	hl
   4740 77            [ 7]  640 	ld	(hl), a
   4741 DD 7E E6      [19]  641 	ld	a,-26 (ix)
   4744 C6 06         [ 7]  642 	add	a, #0x06
   4746 DD 77 FC      [19]  643 	ld	-4 (ix),a
   4749 DD 7E E7      [19]  644 	ld	a,-25 (ix)
   474C CE 00         [ 7]  645 	adc	a, #0x00
   474E DD 77 FD      [19]  646 	ld	-3 (ix),a
   4751 DD 6E FC      [19]  647 	ld	l,-4 (ix)
   4754 DD 66 FD      [19]  648 	ld	h,-3 (ix)
   4757 AF            [ 4]  649 	xor	a, a
   4758 77            [ 7]  650 	ld	(hl), a
   4759 23            [ 6]  651 	inc	hl
   475A 77            [ 7]  652 	ld	(hl), a
   475B DD 7E E6      [19]  653 	ld	a,-26 (ix)
   475E C6 08         [ 7]  654 	add	a, #0x08
   4760 DD 77 F1      [19]  655 	ld	-15 (ix),a
   4763 DD 7E E7      [19]  656 	ld	a,-25 (ix)
   4766 CE 00         [ 7]  657 	adc	a, #0x00
   4768 DD 77 F2      [19]  658 	ld	-14 (ix),a
   476B DD 6E F1      [19]  659 	ld	l,-15 (ix)
   476E DD 66 F2      [19]  660 	ld	h,-14 (ix)
   4771 36 06         [10]  661 	ld	(hl),#0x06
   4773 23            [ 6]  662 	inc	hl
   4774 36 00         [10]  663 	ld	(hl),#0x00
   4776 DD 7E E6      [19]  664 	ld	a,-26 (ix)
   4779 C6 0A         [ 7]  665 	add	a, #0x0A
   477B DD 77 EF      [19]  666 	ld	-17 (ix),a
   477E DD 7E E7      [19]  667 	ld	a,-25 (ix)
   4781 CE 00         [ 7]  668 	adc	a, #0x00
   4783 DD 77 F0      [19]  669 	ld	-16 (ix),a
   4786 DD 6E EF      [19]  670 	ld	l,-17 (ix)
   4789 DD 66 F0      [19]  671 	ld	h,-16 (ix)
   478C 36 03         [10]  672 	ld	(hl),#0x03
   478E 23            [ 6]  673 	inc	hl
   478F 36 00         [10]  674 	ld	(hl),#0x00
                            675 ;src/main.c:154: TEnemy  e = { 55,100,0,0 };
   4791 21 0C 00      [10]  676 	ld	hl,#0x000C
   4794 39            [11]  677 	add	hl,sp
   4795 36 37         [10]  678 	ld	(hl),#0x37
   4797 21 0C 00      [10]  679 	ld	hl,#0x000C
   479A 39            [11]  680 	add	hl,sp
   479B DD 75 FA      [19]  681 	ld	-6 (ix),l
   479E DD 74 FB      [19]  682 	ld	-5 (ix),h
   47A1 DD 7E FA      [19]  683 	ld	a,-6 (ix)
   47A4 C6 01         [ 7]  684 	add	a, #0x01
   47A6 DD 77 F8      [19]  685 	ld	-8 (ix),a
   47A9 DD 7E FB      [19]  686 	ld	a,-5 (ix)
   47AC CE 00         [ 7]  687 	adc	a, #0x00
   47AE DD 77 F9      [19]  688 	ld	-7 (ix),a
   47B1 DD 6E F8      [19]  689 	ld	l,-8 (ix)
   47B4 DD 66 F9      [19]  690 	ld	h,-7 (ix)
   47B7 36 64         [10]  691 	ld	(hl),#0x64
   47B9 DD 7E FA      [19]  692 	ld	a,-6 (ix)
   47BC C6 02         [ 7]  693 	add	a, #0x02
   47BE DD 77 E9      [19]  694 	ld	-23 (ix),a
   47C1 DD 7E FB      [19]  695 	ld	a,-5 (ix)
   47C4 CE 00         [ 7]  696 	adc	a, #0x00
   47C6 DD 77 EA      [19]  697 	ld	-22 (ix),a
   47C9 DD 6E E9      [19]  698 	ld	l,-23 (ix)
   47CC DD 66 EA      [19]  699 	ld	h,-22 (ix)
   47CF AF            [ 4]  700 	xor	a, a
   47D0 77            [ 7]  701 	ld	(hl), a
   47D1 23            [ 6]  702 	inc	hl
   47D2 77            [ 7]  703 	ld	(hl), a
   47D3 DD 7E FA      [19]  704 	ld	a,-6 (ix)
   47D6 C6 04         [ 7]  705 	add	a, #0x04
   47D8 6F            [ 4]  706 	ld	l,a
   47D9 DD 7E FB      [19]  707 	ld	a,-5 (ix)
   47DC CE 00         [ 7]  708 	adc	a, #0x00
   47DE 67            [ 4]  709 	ld	h,a
   47DF AF            [ 4]  710 	xor	a, a
   47E0 77            [ 7]  711 	ld	(hl), a
   47E1 23            [ 6]  712 	inc	hl
   47E2 77            [ 7]  713 	ld	(hl), a
                            714 ;src/main.c:155: TEnemy pr = { 0,0,1,0 };
   47E3 21 14 00      [10]  715 	ld	hl,#0x0014
   47E6 39            [11]  716 	add	hl,sp
   47E7 36 00         [10]  717 	ld	(hl),#0x00
   47E9 21 14 00      [10]  718 	ld	hl,#0x0014
   47EC 39            [11]  719 	add	hl,sp
   47ED 5D            [ 4]  720 	ld	e,l
   47EE 54            [ 4]  721 	ld	d,h
   47EF 23            [ 6]  722 	inc	hl
   47F0 36 00         [10]  723 	ld	(hl),#0x00
   47F2 6B            [ 4]  724 	ld	l, e
   47F3 62            [ 4]  725 	ld	h, d
   47F4 23            [ 6]  726 	inc	hl
   47F5 23            [ 6]  727 	inc	hl
   47F6 36 01         [10]  728 	ld	(hl),#0x01
   47F8 23            [ 6]  729 	inc	hl
   47F9 36 00         [10]  730 	ld	(hl),#0x00
   47FB 21 04 00      [10]  731 	ld	hl,#0x0004
   47FE 19            [11]  732 	add	hl,de
   47FF AF            [ 4]  733 	xor	a, a
   4800 77            [ 7]  734 	ld	(hl), a
   4801 23            [ 6]  735 	inc	hl
   4802 77            [ 7]  736 	ld	(hl), a
                            737 ;src/main.c:160: cpct_clearScreen(0);
   4803 21 00 40      [10]  738 	ld	hl,#0x4000
   4806 E5            [11]  739 	push	hl
   4807 AF            [ 4]  740 	xor	a, a
   4808 F5            [11]  741 	push	af
   4809 33            [ 6]  742 	inc	sp
   480A 26 C0         [ 7]  743 	ld	h, #0xC0
   480C E5            [11]  744 	push	hl
   480D CD C3 4F      [17]  745 	call	_cpct_memset
                            746 ;src/main.c:162: while (1){
   4810                     747 00169$:
                            748 ;src/main.c:165: cpct_waitVSYNC();
   4810 CD A9 4F      [17]  749 	call	_cpct_waitVSYNC
                            750 ;src/main.c:168: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4813 DD 6E ED      [19]  751 	ld	l,-19 (ix)
   4816 DD 66 EE      [19]  752 	ld	h,-18 (ix)
   4819 46            [ 7]  753 	ld	b,(hl)
   481A DD 6E E6      [19]  754 	ld	l,-26 (ix)
   481D DD 66 E7      [19]  755 	ld	h,-25 (ix)
   4820 4E            [ 7]  756 	ld	c, (hl)
   4821 C5            [11]  757 	push	bc
   4822 21 00 C0      [10]  758 	ld	hl,#0xC000
   4825 E5            [11]  759 	push	hl
   4826 CD 9D 50      [17]  760 	call	_cpct_getScreenPtr
   4829 EB            [ 4]  761 	ex	de,hl
                            762 ;src/main.c:169: if(p.atk <= 20)
   482A DD 6E EB      [19]  763 	ld	l,-21 (ix)
   482D DD 66 EC      [19]  764 	ld	h,-20 (ix)
   4830 46            [ 7]  765 	ld	b,(hl)
   4831 23            [ 6]  766 	inc	hl
   4832 66            [ 7]  767 	ld	h,(hl)
                            768 ;src/main.c:170: cpct_drawSolidBox(memptr,0,4,16);
                            769 ;src/main.c:169: if(p.atk <= 20)
   4833 3E 14         [ 7]  770 	ld	a,#0x14
   4835 B8            [ 4]  771 	cp	a, b
   4836 3E 00         [ 7]  772 	ld	a,#0x00
   4838 9C            [ 4]  773 	sbc	a, h
   4839 38 10         [12]  774 	jr	C,00102$
                            775 ;src/main.c:170: cpct_drawSolidBox(memptr,0,4,16);
   483B 21 04 10      [10]  776 	ld	hl,#0x1004
   483E E5            [11]  777 	push	hl
   483F AF            [ 4]  778 	xor	a, a
   4840 F5            [11]  779 	push	af
   4841 33            [ 6]  780 	inc	sp
   4842 D5            [11]  781 	push	de
   4843 CD E5 4F      [17]  782 	call	_cpct_drawSolidBox
   4846 F1            [10]  783 	pop	af
   4847 F1            [10]  784 	pop	af
   4848 33            [ 6]  785 	inc	sp
   4849 18 0E         [12]  786 	jr	00103$
   484B                     787 00102$:
                            788 ;src/main.c:172: cpct_drawSolidBox(memptr,0,5,16);
   484B 21 05 10      [10]  789 	ld	hl,#0x1005
   484E E5            [11]  790 	push	hl
   484F AF            [ 4]  791 	xor	a, a
   4850 F5            [11]  792 	push	af
   4851 33            [ 6]  793 	inc	sp
   4852 D5            [11]  794 	push	de
   4853 CD E5 4F      [17]  795 	call	_cpct_drawSolidBox
   4856 F1            [10]  796 	pop	af
   4857 F1            [10]  797 	pop	af
   4858 33            [ 6]  798 	inc	sp
   4859                     799 00103$:
                            800 ;src/main.c:174: memptr = cpct_getScreenPtr(VMEM,55,160);
   4859 21 37 A0      [10]  801 	ld	hl,#0xA037
   485C E5            [11]  802 	push	hl
   485D 21 00 C0      [10]  803 	ld	hl,#0xC000
   4860 E5            [11]  804 	push	hl
   4861 CD 9D 50      [17]  805 	call	_cpct_getScreenPtr
                            806 ;src/main.c:175: cpct_drawSolidBox(memptr,0,10,16);
   4864 EB            [ 4]  807 	ex	de,hl
   4865 21 0A 10      [10]  808 	ld	hl,#0x100A
   4868 E5            [11]  809 	push	hl
   4869 AF            [ 4]  810 	xor	a, a
   486A F5            [11]  811 	push	af
   486B 33            [ 6]  812 	inc	sp
   486C D5            [11]  813 	push	de
   486D CD E5 4F      [17]  814 	call	_cpct_drawSolidBox
   4870 F1            [10]  815 	pop	af
   4871 F1            [10]  816 	pop	af
   4872 33            [ 6]  817 	inc	sp
                            818 ;src/main.c:177: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4873 DD 6E F8      [19]  819 	ld	l,-8 (ix)
   4876 DD 66 F9      [19]  820 	ld	h,-7 (ix)
   4879 46            [ 7]  821 	ld	b,(hl)
   487A DD 6E FA      [19]  822 	ld	l,-6 (ix)
   487D DD 66 FB      [19]  823 	ld	h,-5 (ix)
   4880 4E            [ 7]  824 	ld	c, (hl)
   4881 C5            [11]  825 	push	bc
   4882 21 00 C0      [10]  826 	ld	hl,#0xC000
   4885 E5            [11]  827 	push	hl
   4886 CD 9D 50      [17]  828 	call	_cpct_getScreenPtr
   4889 4D            [ 4]  829 	ld	c, l
   488A 44            [ 4]  830 	ld	b, h
                            831 ;src/main.c:178: if(e.vivo == 0)
   488B DD 6E E9      [19]  832 	ld	l,-23 (ix)
   488E DD 66 EA      [19]  833 	ld	h,-22 (ix)
   4891 56            [ 7]  834 	ld	d,(hl)
   4892 23            [ 6]  835 	inc	hl
   4893 7E            [ 7]  836 	ld	a, (hl)
   4894 B2            [ 4]  837 	or	a,d
   4895 20 0E         [12]  838 	jr	NZ,00105$
                            839 ;src/main.c:179: cpct_drawSolidBox(memptr,0,4,16);
   4897 21 04 10      [10]  840 	ld	hl,#0x1004
   489A E5            [11]  841 	push	hl
   489B AF            [ 4]  842 	xor	a, a
   489C F5            [11]  843 	push	af
   489D 33            [ 6]  844 	inc	sp
   489E C5            [11]  845 	push	bc
   489F CD E5 4F      [17]  846 	call	_cpct_drawSolidBox
   48A2 F1            [10]  847 	pop	af
   48A3 F1            [10]  848 	pop	af
   48A4 33            [ 6]  849 	inc	sp
   48A5                     850 00105$:
                            851 ;src/main.c:182: if(p.col != 2){
   48A5 DD 6E FC      [19]  852 	ld	l,-4 (ix)
   48A8 DD 66 FD      [19]  853 	ld	h,-3 (ix)
   48AB 56            [ 7]  854 	ld	d,(hl)
   48AC 23            [ 6]  855 	inc	hl
   48AD 66            [ 7]  856 	ld	h,(hl)
   48AE 7A            [ 4]  857 	ld	a,d
   48AF D6 02         [ 7]  858 	sub	a,#0x02
   48B1 20 04         [12]  859 	jr	NZ,00297$
   48B3 B4            [ 4]  860 	or	a,h
   48B4 CA 52 4A      [10]  861 	jp	Z,00146$
   48B7                     862 00297$:
                            863 ;src/main.c:183: cpct_scanKeyboard_f();
   48B7 CD 10 4E      [17]  864 	call	_cpct_scanKeyboard_f
                            865 ;src/main.c:184: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   48BA 21 05 80      [10]  866 	ld	hl,#0x8005
   48BD CD 04 4E      [17]  867 	call	_cpct_isKeyPressed
   48C0 DD 75 E8      [19]  868 	ld	-24 (ix),l
                            869 ;src/main.c:169: if(p.atk <= 20)
   48C3 DD 6E EB      [19]  870 	ld	l,-21 (ix)
   48C6 DD 66 EC      [19]  871 	ld	h,-20 (ix)
   48C9 7E            [ 7]  872 	ld	a,(hl)
   48CA DD 77 F6      [19]  873 	ld	-10 (ix),a
   48CD 23            [ 6]  874 	inc	hl
   48CE 7E            [ 7]  875 	ld	a,(hl)
   48CF DD 77 F7      [19]  876 	ld	-9 (ix),a
                            877 ;src/main.c:184: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   48D2 DD 7E F6      [19]  878 	ld	a,-10 (ix)
   48D5 D6 14         [ 7]  879 	sub	a, #0x14
   48D7 DD 7E F7      [19]  880 	ld	a,-9 (ix)
   48DA DE 00         [ 7]  881 	sbc	a, #0x00
   48DC 3E 00         [ 7]  882 	ld	a,#0x00
   48DE 17            [ 4]  883 	rla
   48DF DD 77 F5      [19]  884 	ld	-11 (ix),a
                            885 ;src/main.c:188: p.atk += 1;
   48E2 DD 7E F6      [19]  886 	ld	a,-10 (ix)
   48E5 C6 01         [ 7]  887 	add	a, #0x01
   48E7 DD 77 F3      [19]  888 	ld	-13 (ix),a
   48EA DD 7E F7      [19]  889 	ld	a,-9 (ix)
   48ED CE 00         [ 7]  890 	adc	a, #0x00
   48EF DD 77 F4      [19]  891 	ld	-12 (ix),a
                            892 ;src/main.c:184: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   48F2 DD 7E E8      [19]  893 	ld	a,-24 (ix)
   48F5 B7            [ 4]  894 	or	a, a
   48F6 28 5D         [12]  895 	jr	Z,00140$
   48F8 DD 7E F5      [19]  896 	ld	a,-11 (ix)
   48FB B7            [ 4]  897 	or	a, a
   48FC 20 57         [12]  898 	jr	NZ,00140$
                            899 ;src/main.c:185: if(p.atk >= 50)
   48FE DD 7E F6      [19]  900 	ld	a,-10 (ix)
   4901 D6 32         [ 7]  901 	sub	a, #0x32
   4903 DD 7E F7      [19]  902 	ld	a,-9 (ix)
   4906 DE 00         [ 7]  903 	sbc	a, #0x00
   4908 38 0C         [12]  904 	jr	C,00107$
                            905 ;src/main.c:186: p.atk = 0;
   490A DD 6E EB      [19]  906 	ld	l,-21 (ix)
   490D DD 66 EC      [19]  907 	ld	h,-20 (ix)
   4910 AF            [ 4]  908 	xor	a, a
   4911 77            [ 7]  909 	ld	(hl), a
   4912 23            [ 6]  910 	inc	hl
   4913 77            [ 7]  911 	ld	(hl), a
   4914 18 0F         [12]  912 	jr	00108$
   4916                     913 00107$:
                            914 ;src/main.c:188: p.atk += 1;
   4916 DD 6E EB      [19]  915 	ld	l,-21 (ix)
   4919 DD 66 EC      [19]  916 	ld	h,-20 (ix)
   491C DD 7E F3      [19]  917 	ld	a,-13 (ix)
   491F 77            [ 7]  918 	ld	(hl),a
   4920 23            [ 6]  919 	inc	hl
   4921 DD 7E F4      [19]  920 	ld	a,-12 (ix)
   4924 77            [ 7]  921 	ld	(hl),a
   4925                     922 00108$:
                            923 ;src/main.c:189: if(cpct_isKeyPressed(Key_CursorRight))
   4925 21 00 02      [10]  924 	ld	hl,#0x0200
   4928 CD 04 4E      [17]  925 	call	_cpct_isKeyPressed
   492B 7D            [ 4]  926 	ld	a,l
   492C B7            [ 4]  927 	or	a, a
   492D 28 0D         [12]  928 	jr	Z,00112$
                            929 ;src/main.c:190: p.dir = 0;
   492F DD 6E FE      [19]  930 	ld	l,-2 (ix)
   4932 DD 66 FF      [19]  931 	ld	h,-1 (ix)
   4935 AF            [ 4]  932 	xor	a, a
   4936 77            [ 7]  933 	ld	(hl), a
   4937 23            [ 6]  934 	inc	hl
   4938 77            [ 7]  935 	ld	(hl), a
   4939 C3 8F 4A      [10]  936 	jp	00147$
   493C                     937 00112$:
                            938 ;src/main.c:191: else if(cpct_isKeyPressed(Key_CursorLeft))
   493C 21 01 01      [10]  939 	ld	hl,#0x0101
   493F CD 04 4E      [17]  940 	call	_cpct_isKeyPressed
   4942 7D            [ 4]  941 	ld	a,l
   4943 B7            [ 4]  942 	or	a, a
   4944 CA 8F 4A      [10]  943 	jp	Z,00147$
                            944 ;src/main.c:192: p.dir = 1;
   4947 DD 6E FE      [19]  945 	ld	l,-2 (ix)
   494A DD 66 FF      [19]  946 	ld	h,-1 (ix)
   494D 36 01         [10]  947 	ld	(hl),#0x01
   494F 23            [ 6]  948 	inc	hl
   4950 36 00         [10]  949 	ld	(hl),#0x00
   4952 C3 8F 4A      [10]  950 	jp	00147$
   4955                     951 00140$:
                            952 ;src/main.c:194: if(p.atk < 20)
   4955 DD 7E F5      [19]  953 	ld	a,-11 (ix)
   4958 B7            [ 4]  954 	or	a, a
   4959 28 11         [12]  955 	jr	Z,00115$
                            956 ;src/main.c:195: p.atk += 1;
   495B DD 6E EB      [19]  957 	ld	l,-21 (ix)
   495E DD 66 EC      [19]  958 	ld	h,-20 (ix)
   4961 DD 7E F3      [19]  959 	ld	a,-13 (ix)
   4964 77            [ 7]  960 	ld	(hl),a
   4965 23            [ 6]  961 	inc	hl
   4966 DD 7E F4      [19]  962 	ld	a,-12 (ix)
   4969 77            [ 7]  963 	ld	(hl),a
   496A 18 0B         [12]  964 	jr	00116$
   496C                     965 00115$:
                            966 ;src/main.c:197: p.atk = 20;
   496C DD 6E EB      [19]  967 	ld	l,-21 (ix)
   496F DD 66 EC      [19]  968 	ld	h,-20 (ix)
   4972 36 14         [10]  969 	ld	(hl),#0x14
   4974 23            [ 6]  970 	inc	hl
   4975 36 00         [10]  971 	ld	(hl),#0x00
   4977                     972 00116$:
                            973 ;src/main.c:198: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4977 21 00 02      [10]  974 	ld	hl,#0x0200
   497A CD 04 4E      [17]  975 	call	_cpct_isKeyPressed
   497D 7D            [ 4]  976 	ld	a,l
   497E B7            [ 4]  977 	or	a, a
   497F 28 32         [12]  978 	jr	Z,00136$
   4981 DD 6E E6      [19]  979 	ld	l,-26 (ix)
   4984 DD 66 E7      [19]  980 	ld	h,-25 (ix)
   4987 56            [ 7]  981 	ld	d,(hl)
   4988 7A            [ 4]  982 	ld	a,d
   4989 D6 4C         [ 7]  983 	sub	a, #0x4C
   498B 30 26         [12]  984 	jr	NC,00136$
                            985 ;src/main.c:199: if(p.col != 2)
   498D DD 6E FC      [19]  986 	ld	l,-4 (ix)
   4990 DD 66 FD      [19]  987 	ld	h,-3 (ix)
   4993 5E            [ 7]  988 	ld	e,(hl)
   4994 23            [ 6]  989 	inc	hl
   4995 66            [ 7]  990 	ld	h,(hl)
   4996 7B            [ 4]  991 	ld	a,e
   4997 D6 02         [ 7]  992 	sub	a,#0x02
   4999 20 03         [12]  993 	jr	NZ,00298$
   499B B4            [ 4]  994 	or	a,h
   499C 28 08         [12]  995 	jr	Z,00118$
   499E                     996 00298$:
                            997 ;src/main.c:200: p.x += 1;
   499E 14            [ 4]  998 	inc	d
   499F DD 6E E6      [19]  999 	ld	l,-26 (ix)
   49A2 DD 66 E7      [19] 1000 	ld	h,-25 (ix)
   49A5 72            [ 7] 1001 	ld	(hl),d
   49A6                    1002 00118$:
                           1003 ;src/main.c:201: p.dir = 0;
   49A6 DD 6E FE      [19] 1004 	ld	l,-2 (ix)
   49A9 DD 66 FF      [19] 1005 	ld	h,-1 (ix)
   49AC AF            [ 4] 1006 	xor	a, a
   49AD 77            [ 7] 1007 	ld	(hl), a
   49AE 23            [ 6] 1008 	inc	hl
   49AF 77            [ 7] 1009 	ld	(hl), a
   49B0 C3 8F 4A      [10] 1010 	jp	00147$
   49B3                    1011 00136$:
                           1012 ;src/main.c:202: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   49B3 21 01 01      [10] 1013 	ld	hl,#0x0101
   49B6 CD 04 4E      [17] 1014 	call	_cpct_isKeyPressed
   49B9 7D            [ 4] 1015 	ld	a,l
   49BA B7            [ 4] 1016 	or	a, a
   49BB 28 32         [12] 1017 	jr	Z,00132$
   49BD DD 6E E6      [19] 1018 	ld	l,-26 (ix)
   49C0 DD 66 E7      [19] 1019 	ld	h,-25 (ix)
   49C3 56            [ 7] 1020 	ld	d,(hl)
   49C4 7A            [ 4] 1021 	ld	a,d
   49C5 B7            [ 4] 1022 	or	a, a
   49C6 28 27         [12] 1023 	jr	Z,00132$
                           1024 ;src/main.c:203: if(p.col != 2)
   49C8 DD 6E FC      [19] 1025 	ld	l,-4 (ix)
   49CB DD 66 FD      [19] 1026 	ld	h,-3 (ix)
   49CE 5E            [ 7] 1027 	ld	e,(hl)
   49CF 23            [ 6] 1028 	inc	hl
   49D0 66            [ 7] 1029 	ld	h,(hl)
   49D1 7B            [ 4] 1030 	ld	a,e
   49D2 D6 02         [ 7] 1031 	sub	a,#0x02
   49D4 20 03         [12] 1032 	jr	NZ,00299$
   49D6 B4            [ 4] 1033 	or	a,h
   49D7 28 08         [12] 1034 	jr	Z,00120$
   49D9                    1035 00299$:
                           1036 ;src/main.c:204: p.x -= 1;
   49D9 15            [ 4] 1037 	dec	d
   49DA DD 6E E6      [19] 1038 	ld	l,-26 (ix)
   49DD DD 66 E7      [19] 1039 	ld	h,-25 (ix)
   49E0 72            [ 7] 1040 	ld	(hl),d
   49E1                    1041 00120$:
                           1042 ;src/main.c:205: p.dir = 1;
   49E1 DD 6E FE      [19] 1043 	ld	l,-2 (ix)
   49E4 DD 66 FF      [19] 1044 	ld	h,-1 (ix)
   49E7 36 01         [10] 1045 	ld	(hl),#0x01
   49E9 23            [ 6] 1046 	inc	hl
   49EA 36 00         [10] 1047 	ld	(hl),#0x00
   49EC C3 8F 4A      [10] 1048 	jp	00147$
   49EF                    1049 00132$:
                           1050 ;src/main.c:206: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   49EF 21 00 04      [10] 1051 	ld	hl,#0x0400
   49F2 CD 04 4E      [17] 1052 	call	_cpct_isKeyPressed
   49F5 7D            [ 4] 1053 	ld	a,l
   49F6 B7            [ 4] 1054 	or	a, a
   49F7 28 22         [12] 1055 	jr	Z,00128$
                           1056 ;src/main.c:168: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   49F9 DD 6E ED      [19] 1057 	ld	l,-19 (ix)
   49FC DD 66 EE      [19] 1058 	ld	h,-18 (ix)
   49FF 56            [ 7] 1059 	ld	d,(hl)
                           1060 ;src/main.c:206: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4A00 7A            [ 4] 1061 	ld	a,d
   4A01 D6 B8         [ 7] 1062 	sub	a, #0xB8
   4A03 30 16         [12] 1063 	jr	NC,00128$
                           1064 ;src/main.c:207: p.y += 2;
   4A05 14            [ 4] 1065 	inc	d
   4A06 14            [ 4] 1066 	inc	d
   4A07 DD 6E ED      [19] 1067 	ld	l,-19 (ix)
   4A0A DD 66 EE      [19] 1068 	ld	h,-18 (ix)
   4A0D 72            [ 7] 1069 	ld	(hl),d
                           1070 ;src/main.c:208: p.dir = 2;
   4A0E DD 6E FE      [19] 1071 	ld	l,-2 (ix)
   4A11 DD 66 FF      [19] 1072 	ld	h,-1 (ix)
   4A14 36 02         [10] 1073 	ld	(hl),#0x02
   4A16 23            [ 6] 1074 	inc	hl
   4A17 36 00         [10] 1075 	ld	(hl),#0x00
   4A19 18 74         [12] 1076 	jr	00147$
   4A1B                    1077 00128$:
                           1078 ;src/main.c:209: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4A1B 21 00 01      [10] 1079 	ld	hl,#0x0100
   4A1E CD 04 4E      [17] 1080 	call	_cpct_isKeyPressed
   4A21 7D            [ 4] 1081 	ld	a,l
   4A22 B7            [ 4] 1082 	or	a, a
   4A23 28 20         [12] 1083 	jr	Z,00124$
                           1084 ;src/main.c:168: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4A25 DD 6E ED      [19] 1085 	ld	l,-19 (ix)
   4A28 DD 66 EE      [19] 1086 	ld	h,-18 (ix)
   4A2B 7E            [ 7] 1087 	ld	a,(hl)
                           1088 ;src/main.c:209: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4A2C B7            [ 4] 1089 	or	a, a
   4A2D 28 16         [12] 1090 	jr	Z,00124$
                           1091 ;src/main.c:210: p.y -= 2;
   4A2F C6 FE         [ 7] 1092 	add	a,#0xFE
   4A31 DD 6E ED      [19] 1093 	ld	l,-19 (ix)
   4A34 DD 66 EE      [19] 1094 	ld	h,-18 (ix)
   4A37 77            [ 7] 1095 	ld	(hl),a
                           1096 ;src/main.c:211: p.dir = 3;
   4A38 DD 6E FE      [19] 1097 	ld	l,-2 (ix)
   4A3B DD 66 FF      [19] 1098 	ld	h,-1 (ix)
   4A3E 36 03         [10] 1099 	ld	(hl),#0x03
   4A40 23            [ 6] 1100 	inc	hl
   4A41 36 00         [10] 1101 	ld	(hl),#0x00
   4A43 18 4A         [12] 1102 	jr	00147$
   4A45                    1103 00124$:
                           1104 ;src/main.c:212: }else  if(cpct_isKeyPressed(Key_Esc)){
   4A45 21 08 04      [10] 1105 	ld	hl,#0x0408
   4A48 CD 04 4E      [17] 1106 	call	_cpct_isKeyPressed
   4A4B 7D            [ 4] 1107 	ld	a,l
   4A4C B7            [ 4] 1108 	or	a, a
   4A4D 28 40         [12] 1109 	jr	Z,00147$
                           1110 ;src/main.c:213: return;
   4A4F C3 50 4C      [10] 1111 	jp	00171$
   4A52                    1112 00146$:
                           1113 ;src/main.c:217: p.x -= 2;
   4A52 DD 6E E6      [19] 1114 	ld	l,-26 (ix)
   4A55 DD 66 E7      [19] 1115 	ld	h,-25 (ix)
   4A58 7E            [ 7] 1116 	ld	a,(hl)
   4A59 C6 FE         [ 7] 1117 	add	a,#0xFE
   4A5B DD 6E E6      [19] 1118 	ld	l,-26 (ix)
   4A5E DD 66 E7      [19] 1119 	ld	h,-25 (ix)
   4A61 77            [ 7] 1120 	ld	(hl),a
                           1121 ;src/main.c:218: p.rebote -= 2;
   4A62 DD 6E F1      [19] 1122 	ld	l,-15 (ix)
   4A65 DD 66 F2      [19] 1123 	ld	h,-14 (ix)
   4A68 5E            [ 7] 1124 	ld	e,(hl)
   4A69 23            [ 6] 1125 	inc	hl
   4A6A 56            [ 7] 1126 	ld	d,(hl)
   4A6B 1B            [ 6] 1127 	dec	de
   4A6C 1B            [ 6] 1128 	dec	de
   4A6D DD 6E F1      [19] 1129 	ld	l,-15 (ix)
   4A70 DD 66 F2      [19] 1130 	ld	h,-14 (ix)
   4A73 73            [ 7] 1131 	ld	(hl),e
   4A74 23            [ 6] 1132 	inc	hl
   4A75 72            [ 7] 1133 	ld	(hl),d
                           1134 ;src/main.c:219: if(p.rebote == 0){
   4A76 7A            [ 4] 1135 	ld	a,d
   4A77 B3            [ 4] 1136 	or	a,e
   4A78 20 15         [12] 1137 	jr	NZ,00147$
                           1138 ;src/main.c:220: p.rebote = 6;
   4A7A DD 6E F1      [19] 1139 	ld	l,-15 (ix)
   4A7D DD 66 F2      [19] 1140 	ld	h,-14 (ix)
   4A80 36 06         [10] 1141 	ld	(hl),#0x06
   4A82 23            [ 6] 1142 	inc	hl
   4A83 36 00         [10] 1143 	ld	(hl),#0x00
                           1144 ;src/main.c:221: p.col = 0;
   4A85 DD 6E FC      [19] 1145 	ld	l,-4 (ix)
   4A88 DD 66 FD      [19] 1146 	ld	h,-3 (ix)
   4A8B AF            [ 4] 1147 	xor	a, a
   4A8C 77            [ 7] 1148 	ld	(hl), a
   4A8D 23            [ 6] 1149 	inc	hl
   4A8E 77            [ 7] 1150 	ld	(hl), a
   4A8F                    1151 00147$:
                           1152 ;src/main.c:226: sprite = checkSprite(p.atk,p.dir);
   4A8F DD 6E FE      [19] 1153 	ld	l,-2 (ix)
   4A92 DD 66 FF      [19] 1154 	ld	h,-1 (ix)
   4A95 4E            [ 7] 1155 	ld	c,(hl)
   4A96 23            [ 6] 1156 	inc	hl
   4A97 46            [ 7] 1157 	ld	b,(hl)
   4A98 DD 6E EB      [19] 1158 	ld	l,-21 (ix)
   4A9B DD 66 EC      [19] 1159 	ld	h,-20 (ix)
   4A9E 5E            [ 7] 1160 	ld	e,(hl)
   4A9F 23            [ 6] 1161 	inc	hl
   4AA0 56            [ 7] 1162 	ld	d,(hl)
   4AA1 C5            [11] 1163 	push	bc
   4AA2 D5            [11] 1164 	push	de
   4AA3 CD 15 45      [17] 1165 	call	_checkSprite
   4AA6 F1            [10] 1166 	pop	af
   4AA7 F1            [10] 1167 	pop	af
   4AA8 DD 75 DE      [19] 1168 	ld	-34 (ix),l
   4AAB DD 74 DF      [19] 1169 	ld	-33 (ix),h
                           1170 ;src/main.c:228: if(p.col != 2 && e.vivo == 0){
   4AAE DD 6E FC      [19] 1171 	ld	l,-4 (ix)
   4AB1 DD 66 FD      [19] 1172 	ld	h,-3 (ix)
   4AB4 56            [ 7] 1173 	ld	d,(hl)
   4AB5 23            [ 6] 1174 	inc	hl
   4AB6 66            [ 7] 1175 	ld	h,(hl)
   4AB7 7A            [ 4] 1176 	ld	a,d
   4AB8 D6 02         [ 7] 1177 	sub	a,#0x02
   4ABA 20 04         [12] 1178 	jr	NZ,00300$
   4ABC B4            [ 4] 1179 	or	a,h
   4ABD CA 58 4B      [10] 1180 	jp	Z,00153$
   4AC0                    1181 00300$:
   4AC0 DD 6E E9      [19] 1182 	ld	l,-23 (ix)
   4AC3 DD 66 EA      [19] 1183 	ld	h,-22 (ix)
   4AC6 56            [ 7] 1184 	ld	d,(hl)
   4AC7 23            [ 6] 1185 	inc	hl
   4AC8 7E            [ 7] 1186 	ld	a, (hl)
   4AC9 B2            [ 4] 1187 	or	a,d
   4ACA C2 58 4B      [10] 1188 	jp	NZ,00153$
                           1189 ;src/main.c:229: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
   4ACD DD 6E EB      [19] 1190 	ld	l,-21 (ix)
   4AD0 DD 66 EC      [19] 1191 	ld	h,-20 (ix)
   4AD3 4E            [ 7] 1192 	ld	c,(hl)
   4AD4 23            [ 6] 1193 	inc	hl
   4AD5 46            [ 7] 1194 	ld	b,(hl)
   4AD6 DD 6E FE      [19] 1195 	ld	l,-2 (ix)
   4AD9 DD 66 FF      [19] 1196 	ld	h,-1 (ix)
   4ADC 7E            [ 7] 1197 	ld	a,(hl)
   4ADD DD 77 F3      [19] 1198 	ld	-13 (ix),a
   4AE0 23            [ 6] 1199 	inc	hl
   4AE1 7E            [ 7] 1200 	ld	a,(hl)
   4AE2 DD 77 F4      [19] 1201 	ld	-12 (ix),a
   4AE5 DD 6E F8      [19] 1202 	ld	l,-8 (ix)
   4AE8 DD 66 F9      [19] 1203 	ld	h,-7 (ix)
   4AEB 5E            [ 7] 1204 	ld	e,(hl)
   4AEC DD 6E FA      [19] 1205 	ld	l,-6 (ix)
   4AEF DD 66 FB      [19] 1206 	ld	h,-5 (ix)
   4AF2 7E            [ 7] 1207 	ld	a,(hl)
   4AF3 DD 77 F5      [19] 1208 	ld	-11 (ix),a
   4AF6 DD 6E ED      [19] 1209 	ld	l,-19 (ix)
   4AF9 DD 66 EE      [19] 1210 	ld	h,-18 (ix)
   4AFC 7E            [ 7] 1211 	ld	a,(hl)
   4AFD DD 77 F6      [19] 1212 	ld	-10 (ix),a
   4B00 DD 6E E6      [19] 1213 	ld	l,-26 (ix)
   4B03 DD 66 E7      [19] 1214 	ld	h,-25 (ix)
   4B06 56            [ 7] 1215 	ld	d,(hl)
   4B07 C5            [11] 1216 	push	bc
   4B08 DD 6E F3      [19] 1217 	ld	l,-13 (ix)
   4B0B DD 66 F4      [19] 1218 	ld	h,-12 (ix)
   4B0E E5            [11] 1219 	push	hl
   4B0F 7B            [ 4] 1220 	ld	a,e
   4B10 F5            [11] 1221 	push	af
   4B11 33            [ 6] 1222 	inc	sp
   4B12 DD 7E F5      [19] 1223 	ld	a,-11 (ix)
   4B15 F5            [11] 1224 	push	af
   4B16 33            [ 6] 1225 	inc	sp
   4B17 DD 7E F6      [19] 1226 	ld	a,-10 (ix)
   4B1A F5            [11] 1227 	push	af
   4B1B 33            [ 6] 1228 	inc	sp
   4B1C D5            [11] 1229 	push	de
   4B1D 33            [ 6] 1230 	inc	sp
   4B1E CD 59 44      [17] 1231 	call	_checkCollisions
   4B21 F1            [10] 1232 	pop	af
   4B22 F1            [10] 1233 	pop	af
   4B23 F1            [10] 1234 	pop	af
   4B24 F1            [10] 1235 	pop	af
   4B25 55            [ 4] 1236 	ld	d,l
   4B26 5C            [ 4] 1237 	ld	e,h
   4B27 DD 6E FC      [19] 1238 	ld	l,-4 (ix)
   4B2A DD 66 FD      [19] 1239 	ld	h,-3 (ix)
   4B2D 72            [ 7] 1240 	ld	(hl),d
   4B2E 23            [ 6] 1241 	inc	hl
   4B2F 73            [ 7] 1242 	ld	(hl),e
                           1243 ;src/main.c:230: if(p.col == 2)
   4B30 7A            [ 4] 1244 	ld	a,d
   4B31 D6 02         [ 7] 1245 	sub	a,#0x02
   4B33 20 16         [12] 1246 	jr	NZ,00149$
   4B35 B3            [ 4] 1247 	or	a,e
   4B36 20 13         [12] 1248 	jr	NZ,00149$
                           1249 ;src/main.c:231: p.life--;
   4B38 DD 6E EF      [19] 1250 	ld	l,-17 (ix)
   4B3B DD 66 F0      [19] 1251 	ld	h,-16 (ix)
   4B3E 5E            [ 7] 1252 	ld	e,(hl)
   4B3F 23            [ 6] 1253 	inc	hl
   4B40 56            [ 7] 1254 	ld	d,(hl)
   4B41 1B            [ 6] 1255 	dec	de
   4B42 DD 6E EF      [19] 1256 	ld	l,-17 (ix)
   4B45 DD 66 F0      [19] 1257 	ld	h,-16 (ix)
   4B48 73            [ 7] 1258 	ld	(hl),e
   4B49 23            [ 6] 1259 	inc	hl
   4B4A 72            [ 7] 1260 	ld	(hl),d
   4B4B                    1261 00149$:
                           1262 ;src/main.c:232: if(p.life == 0)
   4B4B DD 6E EF      [19] 1263 	ld	l,-17 (ix)
   4B4E DD 66 F0      [19] 1264 	ld	h,-16 (ix)
   4B51 56            [ 7] 1265 	ld	d,(hl)
   4B52 23            [ 6] 1266 	inc	hl
   4B53 7E            [ 7] 1267 	ld	a, (hl)
   4B54 B2            [ 4] 1268 	or	a,d
                           1269 ;src/main.c:233: return;
   4B55 CA 50 4C      [10] 1270 	jp	Z,00171$
   4B58                    1271 00153$:
                           1272 ;src/main.c:235: if(p.col == 1)
   4B58 DD 6E FC      [19] 1273 	ld	l,-4 (ix)
   4B5B DD 66 FD      [19] 1274 	ld	h,-3 (ix)
   4B5E 56            [ 7] 1275 	ld	d,(hl)
   4B5F 23            [ 6] 1276 	inc	hl
   4B60 66            [ 7] 1277 	ld	h,(hl)
   4B61 15            [ 4] 1278 	dec	d
   4B62 20 0F         [12] 1279 	jr	NZ,00156$
   4B64 7C            [ 4] 1280 	ld	a,h
   4B65 B7            [ 4] 1281 	or	a, a
   4B66 20 0B         [12] 1282 	jr	NZ,00156$
                           1283 ;src/main.c:236: e.vivo = 1;
   4B68 DD 6E E9      [19] 1284 	ld	l,-23 (ix)
   4B6B DD 66 EA      [19] 1285 	ld	h,-22 (ix)
   4B6E 36 01         [10] 1286 	ld	(hl),#0x01
   4B70 23            [ 6] 1287 	inc	hl
   4B71 36 00         [10] 1288 	ld	(hl),#0x00
   4B73                    1289 00156$:
                           1290 ;src/main.c:239: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4B73 DD 6E ED      [19] 1291 	ld	l,-19 (ix)
   4B76 DD 66 EE      [19] 1292 	ld	h,-18 (ix)
   4B79 46            [ 7] 1293 	ld	b,(hl)
   4B7A DD 6E E6      [19] 1294 	ld	l,-26 (ix)
   4B7D DD 66 E7      [19] 1295 	ld	h,-25 (ix)
   4B80 4E            [ 7] 1296 	ld	c, (hl)
   4B81 C5            [11] 1297 	push	bc
   4B82 21 00 C0      [10] 1298 	ld	hl,#0xC000
   4B85 E5            [11] 1299 	push	hl
   4B86 CD 9D 50      [17] 1300 	call	_cpct_getScreenPtr
   4B89 4D            [ 4] 1301 	ld	c, l
   4B8A 44            [ 4] 1302 	ld	b, h
                           1303 ;src/main.c:242: if(p.atk >= 21)
   4B8B DD 6E EB      [19] 1304 	ld	l,-21 (ix)
   4B8E DD 66 EC      [19] 1305 	ld	h,-20 (ix)
   4B91 7E            [ 7] 1306 	ld	a, (hl)
   4B92 23            [ 6] 1307 	inc	hl
   4B93 66            [ 7] 1308 	ld	h,(hl)
   4B94 6F            [ 4] 1309 	ld	l,a
                           1310 ;src/main.c:170: cpct_drawSolidBox(memptr,0,4,16);
   4B95 C5            [11] 1311 	push	bc
   4B96 FD E1         [14] 1312 	pop	iy
                           1313 ;src/main.c:243: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4B98 DD 5E DE      [19] 1314 	ld	e,-34 (ix)
   4B9B DD 56 DF      [19] 1315 	ld	d,-33 (ix)
                           1316 ;src/main.c:242: if(p.atk >= 21)
   4B9E 7D            [ 4] 1317 	ld	a,l
   4B9F D6 15         [ 7] 1318 	sub	a, #0x15
   4BA1 7C            [ 4] 1319 	ld	a,h
   4BA2 DE 00         [ 7] 1320 	sbc	a, #0x00
   4BA4 38 0E         [12] 1321 	jr	C,00158$
                           1322 ;src/main.c:243: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4BA6 C5            [11] 1323 	push	bc
   4BA7 21 05 10      [10] 1324 	ld	hl,#0x1005
   4BAA E5            [11] 1325 	push	hl
   4BAB FD E5         [15] 1326 	push	iy
   4BAD D5            [11] 1327 	push	de
   4BAE CD 5F 4F      [17] 1328 	call	_cpct_drawSpriteMasked
   4BB1 C1            [10] 1329 	pop	bc
   4BB2 18 0C         [12] 1330 	jr	00159$
   4BB4                    1331 00158$:
                           1332 ;src/main.c:245: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4BB4 C5            [11] 1333 	push	bc
   4BB5 21 04 10      [10] 1334 	ld	hl,#0x1004
   4BB8 E5            [11] 1335 	push	hl
   4BB9 FD E5         [15] 1336 	push	iy
   4BBB D5            [11] 1337 	push	de
   4BBC CD 5F 4F      [17] 1338 	call	_cpct_drawSpriteMasked
   4BBF C1            [10] 1339 	pop	bc
   4BC0                    1340 00159$:
                           1341 ;src/main.c:248: if(e.vivo == 0){
   4BC0 DD 6E E9      [19] 1342 	ld	l,-23 (ix)
   4BC3 DD 66 EA      [19] 1343 	ld	h,-22 (ix)
   4BC6 5E            [ 7] 1344 	ld	e,(hl)
   4BC7 23            [ 6] 1345 	inc	hl
   4BC8 7E            [ 7] 1346 	ld	a, (hl)
   4BC9 B3            [ 4] 1347 	or	a,e
   4BCA 20 2B         [12] 1348 	jr	NZ,00161$
                           1349 ;src/main.c:249: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4BCC DD 6E F8      [19] 1350 	ld	l,-8 (ix)
   4BCF DD 66 F9      [19] 1351 	ld	h,-7 (ix)
   4BD2 46            [ 7] 1352 	ld	b,(hl)
   4BD3 DD 6E FA      [19] 1353 	ld	l,-6 (ix)
   4BD6 DD 66 FB      [19] 1354 	ld	h,-5 (ix)
   4BD9 4E            [ 7] 1355 	ld	c, (hl)
   4BDA C5            [11] 1356 	push	bc
   4BDB 21 00 C0      [10] 1357 	ld	hl,#0xC000
   4BDE E5            [11] 1358 	push	hl
   4BDF CD 9D 50      [17] 1359 	call	_cpct_getScreenPtr
   4BE2 4D            [ 4] 1360 	ld	c, l
   4BE3 44            [ 4] 1361 	ld	b, h
                           1362 ;src/main.c:250: cpct_drawSolidBox(memptr, 18, 4, 16);
   4BE4 59            [ 4] 1363 	ld	e, c
   4BE5 50            [ 4] 1364 	ld	d, b
   4BE6 C5            [11] 1365 	push	bc
   4BE7 21 04 10      [10] 1366 	ld	hl,#0x1004
   4BEA E5            [11] 1367 	push	hl
   4BEB 3E 12         [ 7] 1368 	ld	a,#0x12
   4BED F5            [11] 1369 	push	af
   4BEE 33            [ 6] 1370 	inc	sp
   4BEF D5            [11] 1371 	push	de
   4BF0 CD E5 4F      [17] 1372 	call	_cpct_drawSolidBox
   4BF3 F1            [10] 1373 	pop	af
   4BF4 F1            [10] 1374 	pop	af
   4BF5 33            [ 6] 1375 	inc	sp
   4BF6 C1            [10] 1376 	pop	bc
   4BF7                    1377 00161$:
                           1378 ;src/main.c:169: if(p.atk <= 20)
   4BF7 DD 6E EB      [19] 1379 	ld	l,-21 (ix)
   4BFA DD 66 EC      [19] 1380 	ld	h,-20 (ix)
   4BFD 5E            [ 7] 1381 	ld	e,(hl)
   4BFE 23            [ 6] 1382 	inc	hl
   4BFF 56            [ 7] 1383 	ld	d,(hl)
                           1384 ;src/main.c:253: if(p.atk < 20)
   4C00 7B            [ 4] 1385 	ld	a,e
   4C01 D6 14         [ 7] 1386 	sub	a, #0x14
   4C03 7A            [ 4] 1387 	ld	a,d
   4C04 DE 00         [ 7] 1388 	sbc	a, #0x00
   4C06 30 10         [12] 1389 	jr	NC,00166$
                           1390 ;src/main.c:254: drawFatiga(p.atk,memptr,2);
   4C08 C5            [11] 1391 	push	bc
   4C09 3E 02         [ 7] 1392 	ld	a,#0x02
   4C0B F5            [11] 1393 	push	af
   4C0C 33            [ 6] 1394 	inc	sp
   4C0D C5            [11] 1395 	push	bc
   4C0E D5            [11] 1396 	push	de
   4C0F CD 73 45      [17] 1397 	call	_drawFatiga
   4C12 F1            [10] 1398 	pop	af
   4C13 F1            [10] 1399 	pop	af
   4C14 33            [ 6] 1400 	inc	sp
   4C15 C1            [10] 1401 	pop	bc
   4C16 18 25         [12] 1402 	jr	00167$
   4C18                    1403 00166$:
                           1404 ;src/main.c:255: else if(p.atk > 20)
   4C18 3E 14         [ 7] 1405 	ld	a,#0x14
   4C1A BB            [ 4] 1406 	cp	a, e
   4C1B 3E 00         [ 7] 1407 	ld	a,#0x00
   4C1D 9A            [ 4] 1408 	sbc	a, d
   4C1E 30 10         [12] 1409 	jr	NC,00163$
                           1410 ;src/main.c:256: drawFatiga(p.atk,memptr,16);
   4C20 C5            [11] 1411 	push	bc
   4C21 3E 10         [ 7] 1412 	ld	a,#0x10
   4C23 F5            [11] 1413 	push	af
   4C24 33            [ 6] 1414 	inc	sp
   4C25 C5            [11] 1415 	push	bc
   4C26 D5            [11] 1416 	push	de
   4C27 CD 73 45      [17] 1417 	call	_drawFatiga
   4C2A F1            [10] 1418 	pop	af
   4C2B F1            [10] 1419 	pop	af
   4C2C 33            [ 6] 1420 	inc	sp
   4C2D C1            [10] 1421 	pop	bc
   4C2E 18 0D         [12] 1422 	jr	00167$
   4C30                    1423 00163$:
                           1424 ;src/main.c:258: drawFatiga(p.atk,memptr,0);
   4C30 C5            [11] 1425 	push	bc
   4C31 AF            [ 4] 1426 	xor	a, a
   4C32 F5            [11] 1427 	push	af
   4C33 33            [ 6] 1428 	inc	sp
   4C34 C5            [11] 1429 	push	bc
   4C35 D5            [11] 1430 	push	de
   4C36 CD 73 45      [17] 1431 	call	_drawFatiga
   4C39 F1            [10] 1432 	pop	af
   4C3A F1            [10] 1433 	pop	af
   4C3B 33            [ 6] 1434 	inc	sp
   4C3C C1            [10] 1435 	pop	bc
   4C3D                    1436 00167$:
                           1437 ;src/main.c:260: drawVida(p.life, memptr);
   4C3D DD 6E EF      [19] 1438 	ld	l,-17 (ix)
   4C40 DD 66 F0      [19] 1439 	ld	h,-16 (ix)
   4C43 5E            [ 7] 1440 	ld	e,(hl)
   4C44 23            [ 6] 1441 	inc	hl
   4C45 56            [ 7] 1442 	ld	d,(hl)
   4C46 C5            [11] 1443 	push	bc
   4C47 D5            [11] 1444 	push	de
   4C48 CD 30 46      [17] 1445 	call	_drawVida
   4C4B F1            [10] 1446 	pop	af
   4C4C F1            [10] 1447 	pop	af
   4C4D C3 10 48      [10] 1448 	jp	00169$
   4C50                    1449 00171$:
   4C50 DD F9         [10] 1450 	ld	sp, ix
   4C52 DD E1         [14] 1451 	pop	ix
   4C54 C9            [10] 1452 	ret
                           1453 ;src/main.c:267: void main(void) {
                           1454 ;	---------------------------------
                           1455 ; Function main
                           1456 ; ---------------------------------
   4C55                    1457 _main::
                           1458 ;src/main.c:269: init();
   4C55 CD C4 43      [17] 1459 	call	_init
                           1460 ;src/main.c:272: while(1){
   4C58                    1461 00102$:
                           1462 ;src/main.c:273: menu();
   4C58 CD ED 43      [17] 1463 	call	_menu
                           1464 ;src/main.c:274: game();
   4C5B CD D7 46      [17] 1465 	call	_game
   4C5E 18 F8         [12] 1466 	jr	00102$
                           1467 	.area _CODE
                           1468 	.area _INITIALIZER
                           1469 	.area _CABS (ABS)
