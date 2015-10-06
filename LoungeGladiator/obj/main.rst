                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct  6 10:25:41 2015
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
                             64 ;src/main.c:48: void init(){
                             65 ;	---------------------------------
                             66 ; Function init
                             67 ; ---------------------------------
   43C4                      68 _init::
                             69 ;src/main.c:49: cpct_disableFirmware();
   43C4 CD 53 50      [17]   70 	call	_cpct_disableFirmware
                             71 ;src/main.c:50: cpct_setVideoMode(0);
   43C7 AF            [ 4]   72 	xor	a, a
   43C8 F5            [11]   73 	push	af
   43C9 33            [ 6]   74 	inc	sp
   43CA CD 30 50      [17]   75 	call	_cpct_setVideoMode
   43CD 33            [ 6]   76 	inc	sp
                             77 ;src/main.c:51: cpct_fw2hw(g_palette,4);
   43CE 11 E9 43      [10]   78 	ld	de,#_g_palette
   43D1 3E 04         [ 7]   79 	ld	a,#0x04
   43D3 F5            [11]   80 	push	af
   43D4 33            [ 6]   81 	inc	sp
   43D5 D5            [11]   82 	push	de
   43D6 CD BA 4F      [17]   83 	call	_cpct_fw2hw
   43D9 F1            [10]   84 	pop	af
   43DA 33            [ 6]   85 	inc	sp
                             86 ;src/main.c:52: cpct_setPalette(g_palette,4);
   43DB 11 E9 43      [10]   87 	ld	de,#_g_palette
   43DE 3E 04         [ 7]   88 	ld	a,#0x04
   43E0 F5            [11]   89 	push	af
   43E1 33            [ 6]   90 	inc	sp
   43E2 D5            [11]   91 	push	de
   43E3 CD 5F 4E      [17]   92 	call	_cpct_setPalette
   43E6 F1            [10]   93 	pop	af
   43E7 33            [ 6]   94 	inc	sp
   43E8 C9            [10]   95 	ret
   43E9                      96 _g_palette:
   43E9 00                   97 	.db #0x00	; 0
   43EA 1A                   98 	.db #0x1A	; 26
   43EB 06                   99 	.db #0x06	; 6
   43EC 12                  100 	.db #0x12	; 18
                            101 ;src/main.c:56: void menu(){
                            102 ;	---------------------------------
                            103 ; Function menu
                            104 ; ---------------------------------
   43ED                     105 _menu::
                            106 ;src/main.c:58: cpct_clearScreen(0);
   43ED 21 00 40      [10]  107 	ld	hl,#0x4000
   43F0 E5            [11]  108 	push	hl
   43F1 AF            [ 4]  109 	xor	a, a
   43F2 F5            [11]  110 	push	af
   43F3 33            [ 6]  111 	inc	sp
   43F4 26 C0         [ 7]  112 	ld	h, #0xC0
   43F6 E5            [11]  113 	push	hl
   43F7 CD 42 50      [17]  114 	call	_cpct_memset
                            115 ;src/main.c:60: memptr = cpct_getScreenPtr(VMEM,20,10);
   43FA 21 14 0A      [10]  116 	ld	hl,#0x0A14
   43FD E5            [11]  117 	push	hl
   43FE 21 00 C0      [10]  118 	ld	hl,#0xC000
   4401 E5            [11]  119 	push	hl
   4402 CD 1C 51      [17]  120 	call	_cpct_getScreenPtr
                            121 ;src/main.c:61: cpct_drawStringM0("Super Menu",memptr,2,3);
   4405 EB            [ 4]  122 	ex	de,hl
   4406 01 42 44      [10]  123 	ld	bc,#___str_0+0
   4409 21 02 03      [10]  124 	ld	hl,#0x0302
   440C E5            [11]  125 	push	hl
   440D D5            [11]  126 	push	de
   440E C5            [11]  127 	push	bc
   440F CD F9 4E      [17]  128 	call	_cpct_drawStringM0
   4412 21 06 00      [10]  129 	ld	hl,#6
   4415 39            [11]  130 	add	hl,sp
   4416 F9            [ 6]  131 	ld	sp,hl
                            132 ;src/main.c:63: memptr = cpct_getScreenPtr(VMEM,18,180);
   4417 21 12 B4      [10]  133 	ld	hl,#0xB412
   441A E5            [11]  134 	push	hl
   441B 21 00 C0      [10]  135 	ld	hl,#0xC000
   441E E5            [11]  136 	push	hl
   441F CD 1C 51      [17]  137 	call	_cpct_getScreenPtr
                            138 ;src/main.c:64: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   4422 EB            [ 4]  139 	ex	de,hl
   4423 01 4D 44      [10]  140 	ld	bc,#___str_1+0
   4426 21 04 05      [10]  141 	ld	hl,#0x0504
   4429 E5            [11]  142 	push	hl
   442A D5            [11]  143 	push	de
   442B C5            [11]  144 	push	bc
   442C CD F9 4E      [17]  145 	call	_cpct_drawStringM0
   442F 21 06 00      [10]  146 	ld	hl,#6
   4432 39            [11]  147 	add	hl,sp
   4433 F9            [ 6]  148 	ld	sp,hl
                            149 ;src/main.c:66: do{
   4434                     150 00101$:
                            151 ;src/main.c:67: cpct_scanKeyboard_f();
   4434 CD 8F 4E      [17]  152 	call	_cpct_scanKeyboard_f
                            153 ;src/main.c:68: }while(!cpct_isKeyPressed(Key_Enter));
   4437 21 00 40      [10]  154 	ld	hl,#0x4000
   443A CD 83 4E      [17]  155 	call	_cpct_isKeyPressed
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
                            166 ;src/main.c:73: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            167 ;	---------------------------------
                            168 ; Function checkCollisions
                            169 ; ---------------------------------
   4459                     170 _checkCollisions::
   4459 DD E5         [15]  171 	push	ix
   445B DD 21 00 00   [14]  172 	ld	ix,#0
   445F DD 39         [15]  173 	add	ix,sp
   4461 3B            [ 6]  174 	dec	sp
                            175 ;src/main.c:74: if((u8)atk >= 21)
   4462 DD 7E 0A      [19]  176 	ld	a,10 (ix)
   4465 DD 77 FF      [19]  177 	ld	-1 (ix),a
                            178 ;src/main.c:76: if(eX - pX > -1 && eX - pX < 11)
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
                            189 ;src/main.c:74: if((u8)atk >= 21)
   4478 DD 7E FF      [19]  190 	ld	a,-1 (ix)
   447B D6 15         [ 7]  191 	sub	a, #0x15
   447D 38 4F         [12]  192 	jr	C,00118$
                            193 ;src/main.c:75: if(dir == 0)
   447F DD 7E 09      [19]  194 	ld	a,9 (ix)
   4482 DD B6 08      [19]  195 	or	a,8 (ix)
   4485 20 21         [12]  196 	jr	NZ,00110$
                            197 ;src/main.c:76: if(eX - pX > -1 && eX - pX < 11)
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
                            213 ;src/main.c:77: return 1;
   449E 21 01 00      [10]  214 	ld	hl,#0x0001
   44A1 18 6E         [12]  215 	jr	00120$
   44A3                     216 00102$:
                            217 ;src/main.c:79: return 0;
   44A3 21 00 00      [10]  218 	ld	hl,#0x0000
   44A6 18 69         [12]  219 	jr	00120$
   44A8                     220 00110$:
                            221 ;src/main.c:81: if(pX - eX > -1 && pX - eX < 11)
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
                            238 ;src/main.c:82: return 1;
   44C4 21 01 00      [10]  239 	ld	hl,#0x0001
   44C7 18 48         [12]  240 	jr	00120$
   44C9                     241 00106$:
                            242 ;src/main.c:84: return 0;
   44C9 21 00 00      [10]  243 	ld	hl,#0x0000
   44CC 18 43         [12]  244 	jr	00120$
   44CE                     245 00118$:
                            246 ;src/main.c:86: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
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
                            282 ;src/main.c:87: return 2;
   4509 21 02 00      [10]  283 	ld	hl,#0x0002
   450C 18 03         [12]  284 	jr	00120$
   450E                     285 00119$:
                            286 ;src/main.c:89: return 0;
   450E 21 00 00      [10]  287 	ld	hl,#0x0000
   4511                     288 00120$:
   4511 33            [ 6]  289 	inc	sp
   4512 DD E1         [14]  290 	pop	ix
   4514 C9            [10]  291 	ret
                            292 ;src/main.c:92: u8* checkSprite(u8* atk, u8* dir){
                            293 ;	---------------------------------
                            294 ; Function checkSprite
                            295 ; ---------------------------------
   4515                     296 _checkSprite::
                            297 ;src/main.c:93: if(atk <= 20)
   4515 3E 14         [ 7]  298 	ld	a,#0x14
   4517 FD 21 02 00   [14]  299 	ld	iy,#2
   451B FD 39         [15]  300 	add	iy,sp
   451D FD BE 00      [19]  301 	cp	a, 0 (iy)
   4520 3E 00         [ 7]  302 	ld	a,#0x00
   4522 FD 9E 01      [19]  303 	sbc	a, 1 (iy)
   4525 38 3B         [12]  304 	jr	C,00110$
                            305 ;src/main.c:94: switch((int)dir){
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
                            324 ;src/main.c:95: case 0:
   4549 E9            [ 4]  325 	jp	(hl)
   454A                     326 00131$:
   454A 18 06         [12]  327 	jr	00101$
   454C 18 08         [12]  328 	jr	00102$
   454E 18 0A         [12]  329 	jr	00103$
   4550 18 0C         [12]  330 	jr	00104$
   4552                     331 00101$:
                            332 ;src/main.c:96: return gladis_quieto_dcha;
   4552 21 40 42      [10]  333 	ld	hl,#_gladis_quieto_dcha
   4555 C9            [10]  334 	ret
                            335 ;src/main.c:98: case 1:
   4556                     336 00102$:
                            337 ;src/main.c:99: return gladis_quieto_izda;
   4556 21 C0 42      [10]  338 	ld	hl,#_gladis_quieto_izda
   4559 C9            [10]  339 	ret
                            340 ;src/main.c:101: case 2:
   455A                     341 00103$:
                            342 ;src/main.c:102: return gladis_quieto_dcha;
   455A 21 40 42      [10]  343 	ld	hl,#_gladis_quieto_dcha
   455D C9            [10]  344 	ret
                            345 ;src/main.c:104: case 3:
   455E                     346 00104$:
                            347 ;src/main.c:105: return gladis_arriba_dcha;
   455E 21 40 40      [10]  348 	ld	hl,#_gladis_arriba_dcha
   4561 C9            [10]  349 	ret
                            350 ;src/main.c:106: }
   4562                     351 00110$:
                            352 ;src/main.c:107: else if(dir == 0){
   4562 21 05 00      [10]  353 	ld	hl, #4+1
   4565 39            [11]  354 	add	hl, sp
   4566 7E            [ 7]  355 	ld	a, (hl)
   4567 2B            [ 6]  356 	dec	hl
   4568 B6            [ 7]  357 	or	a,(hl)
   4569 20 04         [12]  358 	jr	NZ,00107$
                            359 ;src/main.c:108: return gladis_atk_dcha;
   456B 21 1F 4D      [10]  360 	ld	hl,#_gladis_atk_dcha
   456E C9            [10]  361 	ret
   456F                     362 00107$:
                            363 ;src/main.c:110: return gladis_atk_izda;
   456F 21 BF 4D      [10]  364 	ld	hl,#_gladis_atk_izda
   4572 C9            [10]  365 	ret
                            366 ;src/main.c:115: void drawFatiga(u8* atk, u8* memptr, u8 col){
                            367 ;	---------------------------------
                            368 ; Function drawFatiga
                            369 ; ---------------------------------
   4573                     370 _drawFatiga::
   4573 DD E5         [15]  371 	push	ix
   4575 DD 21 00 00   [14]  372 	ld	ix,#0
   4579 DD 39         [15]  373 	add	ix,sp
                            374 ;src/main.c:116: if(atk < 20)
   457B DD 7E 04      [19]  375 	ld	a,4 (ix)
   457E D6 14         [ 7]  376 	sub	a, #0x14
   4580 DD 7E 05      [19]  377 	ld	a,5 (ix)
   4583 DE 00         [ 7]  378 	sbc	a, #0x00
   4585 30 04         [12]  379 	jr	NC,00102$
                            380 ;src/main.c:117: col = 2;
   4587 DD 36 08 02   [19]  381 	ld	8 (ix),#0x02
   458B                     382 00102$:
                            383 ;src/main.c:118: if(atk > 30 || atk <= 20){
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
                            400 ;src/main.c:119: memptr = cpct_getScreenPtr(VMEM,4,160);
   45A9 D5            [11]  401 	push	de
   45AA 21 04 A0      [10]  402 	ld	hl,#0xA004
   45AD E5            [11]  403 	push	hl
   45AE 21 00 C0      [10]  404 	ld	hl,#0xC000
   45B1 E5            [11]  405 	push	hl
   45B2 CD 1C 51      [17]  406 	call	_cpct_getScreenPtr
   45B5 D1            [10]  407 	pop	de
                            408 ;src/main.c:120: cpct_drawSolidBox(memptr, col, 2, 8);
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
   45C9 CD 64 50      [17]  420 	call	_cpct_drawSolidBox
   45CC F1            [10]  421 	pop	af
   45CD F1            [10]  422 	pop	af
   45CE 33            [ 6]  423 	inc	sp
   45CF D1            [10]  424 	pop	de
   45D0                     425 00104$:
                            426 ;src/main.c:122: if(atk > 40 || atk <= 20){
   45D0 3E 28         [ 7]  427 	ld	a,#0x28
   45D2 DD BE 04      [19]  428 	cp	a, 4 (ix)
   45D5 3E 00         [ 7]  429 	ld	a,#0x00
   45D7 DD 9E 05      [19]  430 	sbc	a, 5 (ix)
   45DA 38 04         [12]  431 	jr	C,00106$
   45DC 7A            [ 4]  432 	ld	a,d
   45DD B7            [ 4]  433 	or	a, a
   45DE 20 27         [12]  434 	jr	NZ,00107$
   45E0                     435 00106$:
                            436 ;src/main.c:123: memptr = cpct_getScreenPtr(VMEM,7,160);
   45E0 D5            [11]  437 	push	de
   45E1 21 07 A0      [10]  438 	ld	hl,#0xA007
   45E4 E5            [11]  439 	push	hl
   45E5 21 00 C0      [10]  440 	ld	hl,#0xC000
   45E8 E5            [11]  441 	push	hl
   45E9 CD 1C 51      [17]  442 	call	_cpct_getScreenPtr
   45EC D1            [10]  443 	pop	de
                            444 ;src/main.c:124: cpct_drawSolidBox(memptr, col, 2, 8);
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
   4600 CD 64 50      [17]  456 	call	_cpct_drawSolidBox
   4603 F1            [10]  457 	pop	af
   4604 F1            [10]  458 	pop	af
   4605 33            [ 6]  459 	inc	sp
   4606 D1            [10]  460 	pop	de
   4607                     461 00107$:
                            462 ;src/main.c:126: if(atk <= 20){
   4607 7A            [ 4]  463 	ld	a,d
   4608 B7            [ 4]  464 	or	a, a
   4609 20 22         [12]  465 	jr	NZ,00111$
                            466 ;src/main.c:127: memptr = cpct_getScreenPtr(VMEM,10,160);
   460B 21 0A A0      [10]  467 	ld	hl,#0xA00A
   460E E5            [11]  468 	push	hl
   460F 21 00 C0      [10]  469 	ld	hl,#0xC000
   4612 E5            [11]  470 	push	hl
   4613 CD 1C 51      [17]  471 	call	_cpct_getScreenPtr
                            472 ;src/main.c:128: cpct_drawSolidBox(memptr, col, 2, 8);
   4616 DD 75 06      [19]  473 	ld	6 (ix),l
   4619 DD 74 07      [19]  474 	ld	7 (ix),h
   461C EB            [ 4]  475 	ex	de,hl
   461D 21 02 08      [10]  476 	ld	hl,#0x0802
   4620 E5            [11]  477 	push	hl
   4621 DD 7E 08      [19]  478 	ld	a,8 (ix)
   4624 F5            [11]  479 	push	af
   4625 33            [ 6]  480 	inc	sp
   4626 D5            [11]  481 	push	de
   4627 CD 64 50      [17]  482 	call	_cpct_drawSolidBox
   462A F1            [10]  483 	pop	af
   462B F1            [10]  484 	pop	af
   462C 33            [ 6]  485 	inc	sp
   462D                     486 00111$:
   462D DD E1         [14]  487 	pop	ix
   462F C9            [10]  488 	ret
                            489 ;src/main.c:133: void drawVida(u8* life, u8* memptr){
                            490 ;	---------------------------------
                            491 ; Function drawVida
                            492 ; ---------------------------------
   4630                     493 _drawVida::
   4630 DD E5         [15]  494 	push	ix
   4632 DD 21 00 00   [14]  495 	ld	ix,#0
   4636 DD 39         [15]  496 	add	ix,sp
                            497 ;src/main.c:134: if(life >= 1){
   4638 DD 7E 04      [19]  498 	ld	a,4 (ix)
   463B D6 01         [ 7]  499 	sub	a, #0x01
   463D DD 7E 05      [19]  500 	ld	a,5 (ix)
   4640 DE 00         [ 7]  501 	sbc	a, #0x00
   4642 38 1F         [12]  502 	jr	C,00102$
                            503 ;src/main.c:135: memptr = cpct_getScreenPtr(VMEM,55,160);
   4644 21 37 A0      [10]  504 	ld	hl,#0xA037
   4647 E5            [11]  505 	push	hl
   4648 21 00 C0      [10]  506 	ld	hl,#0xC000
   464B E5            [11]  507 	push	hl
   464C CD 1C 51      [17]  508 	call	_cpct_getScreenPtr
                            509 ;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   464F DD 75 06      [19]  510 	ld	6 (ix),l
   4652 DD 74 07      [19]  511 	ld	7 (ix),h
   4655 4D            [ 4]  512 	ld	c,l
   4656 44            [ 4]  513 	ld	b,h
   4657 11 44 43      [10]  514 	ld	de,#_corazon_lleno
   465A 21 04 08      [10]  515 	ld	hl,#0x0804
   465D E5            [11]  516 	push	hl
   465E C5            [11]  517 	push	bc
   465F D5            [11]  518 	push	de
   4660 CD DE 4F      [17]  519 	call	_cpct_drawSpriteMasked
   4663                     520 00102$:
                            521 ;src/main.c:138: memptr = cpct_getScreenPtr(VMEM,60,160);
   4663 21 3C A0      [10]  522 	ld	hl,#0xA03C
   4666 E5            [11]  523 	push	hl
   4667 21 00 C0      [10]  524 	ld	hl,#0xC000
   466A E5            [11]  525 	push	hl
   466B CD 1C 51      [17]  526 	call	_cpct_getScreenPtr
                            527 ;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   466E DD 75 06      [19]  528 	ld	6 (ix),l
   4671 DD 74 07      [19]  529 	ld	7 (ix),h
   4674 4D            [ 4]  530 	ld	c,l
   4675 44            [ 4]  531 	ld	b,h
                            532 ;src/main.c:139: if(life >= 2)
   4676 DD 7E 04      [19]  533 	ld	a,4 (ix)
   4679 D6 02         [ 7]  534 	sub	a, #0x02
   467B DD 7E 05      [19]  535 	ld	a,5 (ix)
   467E DE 00         [ 7]  536 	sbc	a, #0x00
   4680 38 0E         [12]  537 	jr	C,00104$
                            538 ;src/main.c:140: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4682 11 44 43      [10]  539 	ld	de,#_corazon_lleno
   4685 21 04 08      [10]  540 	ld	hl,#0x0804
   4688 E5            [11]  541 	push	hl
   4689 C5            [11]  542 	push	bc
   468A D5            [11]  543 	push	de
   468B CD DE 4F      [17]  544 	call	_cpct_drawSpriteMasked
   468E 18 0C         [12]  545 	jr	00105$
   4690                     546 00104$:
                            547 ;src/main.c:142: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4690 11 84 43      [10]  548 	ld	de,#_corazon_roto
   4693 21 04 08      [10]  549 	ld	hl,#0x0804
   4696 E5            [11]  550 	push	hl
   4697 C5            [11]  551 	push	bc
   4698 D5            [11]  552 	push	de
   4699 CD DE 4F      [17]  553 	call	_cpct_drawSpriteMasked
   469C                     554 00105$:
                            555 ;src/main.c:143: memptr = cpct_getScreenPtr(VMEM,65,160);
   469C 21 41 A0      [10]  556 	ld	hl,#0xA041
   469F E5            [11]  557 	push	hl
   46A0 21 00 C0      [10]  558 	ld	hl,#0xC000
   46A3 E5            [11]  559 	push	hl
   46A4 CD 1C 51      [17]  560 	call	_cpct_getScreenPtr
                            561 ;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46A7 DD 75 06      [19]  562 	ld	6 (ix),l
   46AA DD 74 07      [19]  563 	ld	7 (ix),h
   46AD EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:144: if(life >= 3)
   46AE DD 7E 04      [19]  566 	ld	a,4 (ix)
   46B1 D6 03         [ 7]  567 	sub	a, #0x03
   46B3 DD 7E 05      [19]  568 	ld	a,5 (ix)
   46B6 DE 00         [ 7]  569 	sbc	a, #0x00
   46B8 38 0E         [12]  570 	jr	C,00107$
                            571 ;src/main.c:145: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   46BA 01 44 43      [10]  572 	ld	bc,#_corazon_lleno
   46BD 21 04 08      [10]  573 	ld	hl,#0x0804
   46C0 E5            [11]  574 	push	hl
   46C1 D5            [11]  575 	push	de
   46C2 C5            [11]  576 	push	bc
   46C3 CD DE 4F      [17]  577 	call	_cpct_drawSpriteMasked
   46C6 18 0C         [12]  578 	jr	00109$
   46C8                     579 00107$:
                            580 ;src/main.c:147: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   46C8 01 84 43      [10]  581 	ld	bc,#_corazon_roto+0
   46CB 21 04 08      [10]  582 	ld	hl,#0x0804
   46CE E5            [11]  583 	push	hl
   46CF D5            [11]  584 	push	de
   46D0 C5            [11]  585 	push	bc
   46D1 CD DE 4F      [17]  586 	call	_cpct_drawSpriteMasked
   46D4                     587 00109$:
   46D4 DD E1         [14]  588 	pop	ix
   46D6 C9            [10]  589 	ret
                            590 ;src/main.c:153: void game(){
                            591 ;	---------------------------------
                            592 ; Function game
                            593 ; ---------------------------------
   46D7                     594 _game::
   46D7 DD E5         [15]  595 	push	ix
   46D9 DD 21 00 00   [14]  596 	ld	ix,#0
   46DD DD 39         [15]  597 	add	ix,sp
   46DF 21 C2 FF      [10]  598 	ld	hl,#-62
   46E2 39            [11]  599 	add	hl,sp
   46E3 F9            [ 6]  600 	ld	sp,hl
                            601 ;src/main.c:154: TPlayer p = { 0,100,0,100,20,20,0,0,6,3 };
   46E4 21 00 00      [10]  602 	ld	hl,#0x0000
   46E7 39            [11]  603 	add	hl,sp
   46E8 36 00         [10]  604 	ld	(hl),#0x00
   46EA 21 00 00      [10]  605 	ld	hl,#0x0000
   46ED 39            [11]  606 	add	hl,sp
   46EE DD 75 FC      [19]  607 	ld	-4 (ix),l
   46F1 DD 74 FD      [19]  608 	ld	-3 (ix),h
   46F4 DD 7E FC      [19]  609 	ld	a,-4 (ix)
   46F7 C6 01         [ 7]  610 	add	a, #0x01
   46F9 DD 77 FE      [19]  611 	ld	-2 (ix),a
   46FC DD 7E FD      [19]  612 	ld	a,-3 (ix)
   46FF CE 00         [ 7]  613 	adc	a, #0x00
   4701 DD 77 FF      [19]  614 	ld	-1 (ix),a
   4704 DD 6E FE      [19]  615 	ld	l,-2 (ix)
   4707 DD 66 FF      [19]  616 	ld	h,-1 (ix)
   470A 36 64         [10]  617 	ld	(hl),#0x64
   470C DD 7E FC      [19]  618 	ld	a,-4 (ix)
   470F C6 02         [ 7]  619 	add	a, #0x02
   4711 DD 77 F8      [19]  620 	ld	-8 (ix),a
   4714 DD 7E FD      [19]  621 	ld	a,-3 (ix)
   4717 CE 00         [ 7]  622 	adc	a, #0x00
   4719 DD 77 F9      [19]  623 	ld	-7 (ix),a
   471C DD 6E F8      [19]  624 	ld	l,-8 (ix)
   471F DD 66 F9      [19]  625 	ld	h,-7 (ix)
   4722 36 00         [10]  626 	ld	(hl),#0x00
   4724 DD 7E FC      [19]  627 	ld	a,-4 (ix)
   4727 C6 03         [ 7]  628 	add	a, #0x03
   4729 DD 77 E4      [19]  629 	ld	-28 (ix),a
   472C DD 7E FD      [19]  630 	ld	a,-3 (ix)
   472F CE 00         [ 7]  631 	adc	a, #0x00
   4731 DD 77 E5      [19]  632 	ld	-27 (ix),a
   4734 DD 6E E4      [19]  633 	ld	l,-28 (ix)
   4737 DD 66 E5      [19]  634 	ld	h,-27 (ix)
   473A 36 64         [10]  635 	ld	(hl),#0x64
   473C DD 7E FC      [19]  636 	ld	a,-4 (ix)
   473F C6 04         [ 7]  637 	add	a, #0x04
   4741 DD 77 EE      [19]  638 	ld	-18 (ix),a
   4744 DD 7E FD      [19]  639 	ld	a,-3 (ix)
   4747 CE 00         [ 7]  640 	adc	a, #0x00
   4749 DD 77 EF      [19]  641 	ld	-17 (ix),a
   474C DD 6E EE      [19]  642 	ld	l,-18 (ix)
   474F DD 66 EF      [19]  643 	ld	h,-17 (ix)
   4752 36 14         [10]  644 	ld	(hl),#0x14
   4754 23            [ 6]  645 	inc	hl
   4755 36 00         [10]  646 	ld	(hl),#0x00
   4757 DD 7E FC      [19]  647 	ld	a,-4 (ix)
   475A C6 06         [ 7]  648 	add	a, #0x06
   475C DD 77 E8      [19]  649 	ld	-24 (ix),a
   475F DD 7E FD      [19]  650 	ld	a,-3 (ix)
   4762 CE 00         [ 7]  651 	adc	a, #0x00
   4764 DD 77 E9      [19]  652 	ld	-23 (ix),a
   4767 DD 6E E8      [19]  653 	ld	l,-24 (ix)
   476A DD 66 E9      [19]  654 	ld	h,-23 (ix)
   476D 36 14         [10]  655 	ld	(hl),#0x14
   476F 23            [ 6]  656 	inc	hl
   4770 36 00         [10]  657 	ld	(hl),#0x00
   4772 DD 7E FC      [19]  658 	ld	a,-4 (ix)
   4775 C6 08         [ 7]  659 	add	a, #0x08
   4777 DD 77 E6      [19]  660 	ld	-26 (ix),a
   477A DD 7E FD      [19]  661 	ld	a,-3 (ix)
   477D CE 00         [ 7]  662 	adc	a, #0x00
   477F DD 77 E7      [19]  663 	ld	-25 (ix),a
   4782 DD 6E E6      [19]  664 	ld	l,-26 (ix)
   4785 DD 66 E7      [19]  665 	ld	h,-25 (ix)
   4788 AF            [ 4]  666 	xor	a, a
   4789 77            [ 7]  667 	ld	(hl), a
   478A 23            [ 6]  668 	inc	hl
   478B 77            [ 7]  669 	ld	(hl), a
   478C DD 7E FC      [19]  670 	ld	a,-4 (ix)
   478F C6 0A         [ 7]  671 	add	a, #0x0A
   4791 DD 77 E0      [19]  672 	ld	-32 (ix),a
   4794 DD 7E FD      [19]  673 	ld	a,-3 (ix)
   4797 CE 00         [ 7]  674 	adc	a, #0x00
   4799 DD 77 E1      [19]  675 	ld	-31 (ix),a
   479C DD 6E E0      [19]  676 	ld	l,-32 (ix)
   479F DD 66 E1      [19]  677 	ld	h,-31 (ix)
   47A2 AF            [ 4]  678 	xor	a, a
   47A3 77            [ 7]  679 	ld	(hl), a
   47A4 23            [ 6]  680 	inc	hl
   47A5 77            [ 7]  681 	ld	(hl), a
   47A6 DD 7E FC      [19]  682 	ld	a,-4 (ix)
   47A9 C6 0C         [ 7]  683 	add	a, #0x0C
   47AB DD 77 E2      [19]  684 	ld	-30 (ix),a
   47AE DD 7E FD      [19]  685 	ld	a,-3 (ix)
   47B1 CE 00         [ 7]  686 	adc	a, #0x00
   47B3 DD 77 E3      [19]  687 	ld	-29 (ix),a
   47B6 DD 6E E2      [19]  688 	ld	l,-30 (ix)
   47B9 DD 66 E3      [19]  689 	ld	h,-29 (ix)
   47BC 36 06         [10]  690 	ld	(hl),#0x06
   47BE 23            [ 6]  691 	inc	hl
   47BF 36 00         [10]  692 	ld	(hl),#0x00
   47C1 DD 7E FC      [19]  693 	ld	a,-4 (ix)
   47C4 C6 0E         [ 7]  694 	add	a, #0x0E
   47C6 DD 77 F0      [19]  695 	ld	-16 (ix),a
   47C9 DD 7E FD      [19]  696 	ld	a,-3 (ix)
   47CC CE 00         [ 7]  697 	adc	a, #0x00
   47CE DD 77 F1      [19]  698 	ld	-15 (ix),a
   47D1 DD 6E F0      [19]  699 	ld	l,-16 (ix)
   47D4 DD 66 F1      [19]  700 	ld	h,-15 (ix)
   47D7 36 03         [10]  701 	ld	(hl),#0x03
   47D9 23            [ 6]  702 	inc	hl
   47DA 36 00         [10]  703 	ld	(hl),#0x00
                            704 ;src/main.c:155: TEnemy  e = { 55,100,0,0 };
   47DC 21 16 00      [10]  705 	ld	hl,#0x0016
   47DF 39            [11]  706 	add	hl,sp
   47E0 36 37         [10]  707 	ld	(hl),#0x37
   47E2 21 16 00      [10]  708 	ld	hl,#0x0016
   47E5 39            [11]  709 	add	hl,sp
   47E6 DD 75 EA      [19]  710 	ld	-22 (ix),l
   47E9 DD 74 EB      [19]  711 	ld	-21 (ix),h
   47EC DD 7E EA      [19]  712 	ld	a,-22 (ix)
   47EF C6 01         [ 7]  713 	add	a, #0x01
   47F1 DD 77 F2      [19]  714 	ld	-14 (ix),a
   47F4 DD 7E EB      [19]  715 	ld	a,-21 (ix)
   47F7 CE 00         [ 7]  716 	adc	a, #0x00
   47F9 DD 77 F3      [19]  717 	ld	-13 (ix),a
   47FC DD 6E F2      [19]  718 	ld	l,-14 (ix)
   47FF DD 66 F3      [19]  719 	ld	h,-13 (ix)
   4802 36 64         [10]  720 	ld	(hl),#0x64
   4804 DD 7E EA      [19]  721 	ld	a,-22 (ix)
   4807 C6 02         [ 7]  722 	add	a, #0x02
   4809 DD 77 FA      [19]  723 	ld	-6 (ix),a
   480C DD 7E EB      [19]  724 	ld	a,-21 (ix)
   480F CE 00         [ 7]  725 	adc	a, #0x00
   4811 DD 77 FB      [19]  726 	ld	-5 (ix),a
   4814 DD 6E FA      [19]  727 	ld	l,-6 (ix)
   4817 DD 66 FB      [19]  728 	ld	h,-5 (ix)
   481A AF            [ 4]  729 	xor	a, a
   481B 77            [ 7]  730 	ld	(hl), a
   481C 23            [ 6]  731 	inc	hl
   481D 77            [ 7]  732 	ld	(hl), a
   481E DD 7E EA      [19]  733 	ld	a,-22 (ix)
   4821 C6 04         [ 7]  734 	add	a, #0x04
   4823 6F            [ 4]  735 	ld	l,a
   4824 DD 7E EB      [19]  736 	ld	a,-21 (ix)
   4827 CE 00         [ 7]  737 	adc	a, #0x00
   4829 67            [ 4]  738 	ld	h,a
   482A 36 00         [10]  739 	ld	(hl),#0x00
   482C 23            [ 6]  740 	inc	hl
   482D 36 00         [10]  741 	ld	(hl),#0x00
                            742 ;src/main.c:156: TEnemy pr = { 0,0,1,0 };
   482F 21 10 00      [10]  743 	ld	hl,#0x0010
   4832 39            [11]  744 	add	hl,sp
   4833 36 00         [10]  745 	ld	(hl),#0x00
   4835 21 10 00      [10]  746 	ld	hl,#0x0010
   4838 39            [11]  747 	add	hl,sp
   4839 5D            [ 4]  748 	ld	e,l
   483A 54            [ 4]  749 	ld	d,h
   483B 23            [ 6]  750 	inc	hl
   483C 36 00         [10]  751 	ld	(hl),#0x00
   483E 6B            [ 4]  752 	ld	l, e
   483F 62            [ 4]  753 	ld	h, d
   4840 23            [ 6]  754 	inc	hl
   4841 23            [ 6]  755 	inc	hl
   4842 36 01         [10]  756 	ld	(hl),#0x01
   4844 23            [ 6]  757 	inc	hl
   4845 36 00         [10]  758 	ld	(hl),#0x00
   4847 21 04 00      [10]  759 	ld	hl,#0x0004
   484A 19            [11]  760 	add	hl,de
   484B 36 00         [10]  761 	ld	(hl),#0x00
   484D 23            [ 6]  762 	inc	hl
   484E 36 00         [10]  763 	ld	(hl),#0x00
                            764 ;src/main.c:158: u8* sprite = gladis_quieto_dcha;
   4850 DD 36 DE 40   [19]  765 	ld	-34 (ix),#<(_gladis_quieto_dcha)
   4854 DD 36 DF 42   [19]  766 	ld	-33 (ix),#>(_gladis_quieto_dcha)
                            767 ;src/main.c:161: cpct_clearScreen(0);
   4858 21 00 40      [10]  768 	ld	hl,#0x4000
   485B E5            [11]  769 	push	hl
   485C AF            [ 4]  770 	xor	a, a
   485D F5            [11]  771 	push	af
   485E 33            [ 6]  772 	inc	sp
   485F 26 C0         [ 7]  773 	ld	h, #0xC0
   4861 E5            [11]  774 	push	hl
   4862 CD 42 50      [17]  775 	call	_cpct_memset
                            776 ;src/main.c:163: while (1){
   4865                     777 00169$:
                            778 ;src/main.c:166: cpct_waitVSYNC();
   4865 CD 28 50      [17]  779 	call	_cpct_waitVSYNC
                            780 ;src/main.c:169: memptr = cpct_getScreenPtr(VMEM,p.prevX,p.prevY);
   4868 DD 6E E4      [19]  781 	ld	l,-28 (ix)
   486B DD 66 E5      [19]  782 	ld	h,-27 (ix)
   486E 46            [ 7]  783 	ld	b,(hl)
   486F DD 6E F8      [19]  784 	ld	l,-8 (ix)
   4872 DD 66 F9      [19]  785 	ld	h,-7 (ix)
   4875 4E            [ 7]  786 	ld	c, (hl)
   4876 C5            [11]  787 	push	bc
   4877 21 00 C0      [10]  788 	ld	hl,#0xC000
   487A E5            [11]  789 	push	hl
   487B CD 1C 51      [17]  790 	call	_cpct_getScreenPtr
   487E EB            [ 4]  791 	ex	de,hl
                            792 ;src/main.c:170: if(p.prevAtk <= 20)
   487F DD 6E E8      [19]  793 	ld	l,-24 (ix)
   4882 DD 66 E9      [19]  794 	ld	h,-23 (ix)
   4885 46            [ 7]  795 	ld	b,(hl)
   4886 23            [ 6]  796 	inc	hl
   4887 66            [ 7]  797 	ld	h,(hl)
                            798 ;src/main.c:171: cpct_drawSolidBox(memptr,0,4,16);
                            799 ;src/main.c:170: if(p.prevAtk <= 20)
   4888 3E 14         [ 7]  800 	ld	a,#0x14
   488A B8            [ 4]  801 	cp	a, b
   488B 3E 00         [ 7]  802 	ld	a,#0x00
   488D 9C            [ 4]  803 	sbc	a, h
   488E 38 10         [12]  804 	jr	C,00102$
                            805 ;src/main.c:171: cpct_drawSolidBox(memptr,0,4,16);
   4890 21 04 10      [10]  806 	ld	hl,#0x1004
   4893 E5            [11]  807 	push	hl
   4894 AF            [ 4]  808 	xor	a, a
   4895 F5            [11]  809 	push	af
   4896 33            [ 6]  810 	inc	sp
   4897 D5            [11]  811 	push	de
   4898 CD 64 50      [17]  812 	call	_cpct_drawSolidBox
   489B F1            [10]  813 	pop	af
   489C F1            [10]  814 	pop	af
   489D 33            [ 6]  815 	inc	sp
   489E 18 0E         [12]  816 	jr	00103$
   48A0                     817 00102$:
                            818 ;src/main.c:173: cpct_drawSolidBox(memptr,0,5,16);
   48A0 21 05 10      [10]  819 	ld	hl,#0x1005
   48A3 E5            [11]  820 	push	hl
   48A4 AF            [ 4]  821 	xor	a, a
   48A5 F5            [11]  822 	push	af
   48A6 33            [ 6]  823 	inc	sp
   48A7 D5            [11]  824 	push	de
   48A8 CD 64 50      [17]  825 	call	_cpct_drawSolidBox
   48AB F1            [10]  826 	pop	af
   48AC F1            [10]  827 	pop	af
   48AD 33            [ 6]  828 	inc	sp
   48AE                     829 00103$:
                            830 ;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   48AE DD 6E FE      [19]  831 	ld	l,-2 (ix)
   48B1 DD 66 FF      [19]  832 	ld	h,-1 (ix)
   48B4 46            [ 7]  833 	ld	b,(hl)
   48B5 DD 6E FC      [19]  834 	ld	l,-4 (ix)
   48B8 DD 66 FD      [19]  835 	ld	h,-3 (ix)
   48BB 4E            [ 7]  836 	ld	c, (hl)
   48BC C5            [11]  837 	push	bc
   48BD 21 00 C0      [10]  838 	ld	hl,#0xC000
   48C0 E5            [11]  839 	push	hl
   48C1 CD 1C 51      [17]  840 	call	_cpct_getScreenPtr
   48C4 4D            [ 4]  841 	ld	c, l
   48C5 44            [ 4]  842 	ld	b, h
                            843 ;src/main.c:177: if(p.atk >= 21)
   48C6 DD 6E EE      [19]  844 	ld	l,-18 (ix)
   48C9 DD 66 EF      [19]  845 	ld	h,-17 (ix)
   48CC 7E            [ 7]  846 	ld	a, (hl)
   48CD 23            [ 6]  847 	inc	hl
   48CE 6E            [ 7]  848 	ld	l,(hl)
   48CF 67            [ 4]  849 	ld	h,a
                            850 ;src/main.c:171: cpct_drawSolidBox(memptr,0,4,16);
                            851 ;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   48D0 DD 5E DE      [19]  852 	ld	e,-34 (ix)
   48D3 DD 56 DF      [19]  853 	ld	d,-33 (ix)
                            854 ;src/main.c:177: if(p.atk >= 21)
   48D6 7C            [ 4]  855 	ld	a,h
   48D7 D6 15         [ 7]  856 	sub	a, #0x15
   48D9 7D            [ 4]  857 	ld	a,l
   48DA DE 00         [ 7]  858 	sbc	a, #0x00
   48DC 38 0B         [12]  859 	jr	C,00105$
                            860 ;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   48DE 21 05 10      [10]  861 	ld	hl,#0x1005
   48E1 E5            [11]  862 	push	hl
   48E2 C5            [11]  863 	push	bc
   48E3 D5            [11]  864 	push	de
   48E4 CD DE 4F      [17]  865 	call	_cpct_drawSpriteMasked
   48E7 18 09         [12]  866 	jr	00106$
   48E9                     867 00105$:
                            868 ;src/main.c:180: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   48E9 21 04 10      [10]  869 	ld	hl,#0x1004
   48EC E5            [11]  870 	push	hl
   48ED C5            [11]  871 	push	bc
   48EE D5            [11]  872 	push	de
   48EF CD DE 4F      [17]  873 	call	_cpct_drawSpriteMasked
   48F2                     874 00106$:
                            875 ;src/main.c:182: memptr = cpct_getScreenPtr(VMEM,60,160);
   48F2 21 3C A0      [10]  876 	ld	hl,#0xA03C
   48F5 E5            [11]  877 	push	hl
   48F6 21 00 C0      [10]  878 	ld	hl,#0xC000
   48F9 E5            [11]  879 	push	hl
   48FA CD 1C 51      [17]  880 	call	_cpct_getScreenPtr
                            881 ;src/main.c:183: cpct_drawSolidBox(memptr,0,10,16);
   48FD EB            [ 4]  882 	ex	de,hl
   48FE 21 0A 10      [10]  883 	ld	hl,#0x100A
   4901 E5            [11]  884 	push	hl
   4902 AF            [ 4]  885 	xor	a, a
   4903 F5            [11]  886 	push	af
   4904 33            [ 6]  887 	inc	sp
   4905 D5            [11]  888 	push	de
   4906 CD 64 50      [17]  889 	call	_cpct_drawSolidBox
   4909 F1            [10]  890 	pop	af
   490A F1            [10]  891 	pop	af
   490B 33            [ 6]  892 	inc	sp
                            893 ;src/main.c:185: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   490C DD 6E F2      [19]  894 	ld	l,-14 (ix)
   490F DD 66 F3      [19]  895 	ld	h,-13 (ix)
   4912 46            [ 7]  896 	ld	b,(hl)
   4913 DD 6E EA      [19]  897 	ld	l,-22 (ix)
   4916 DD 66 EB      [19]  898 	ld	h,-21 (ix)
   4919 4E            [ 7]  899 	ld	c, (hl)
   491A C5            [11]  900 	push	bc
   491B 21 00 C0      [10]  901 	ld	hl,#0xC000
   491E E5            [11]  902 	push	hl
   491F CD 1C 51      [17]  903 	call	_cpct_getScreenPtr
   4922 4D            [ 4]  904 	ld	c, l
   4923 44            [ 4]  905 	ld	b, h
                            906 ;src/main.c:186: if(e.vivo == 0)
   4924 DD 6E FA      [19]  907 	ld	l,-6 (ix)
   4927 DD 66 FB      [19]  908 	ld	h,-5 (ix)
   492A 56            [ 7]  909 	ld	d,(hl)
   492B 23            [ 6]  910 	inc	hl
   492C 7E            [ 7]  911 	ld	a, (hl)
   492D B2            [ 4]  912 	or	a,d
   492E 20 12         [12]  913 	jr	NZ,00108$
                            914 ;src/main.c:187: cpct_drawSolidBox(memptr,0,4,16);
   4930 59            [ 4]  915 	ld	e, c
   4931 50            [ 4]  916 	ld	d, b
   4932 C5            [11]  917 	push	bc
   4933 21 04 10      [10]  918 	ld	hl,#0x1004
   4936 E5            [11]  919 	push	hl
   4937 AF            [ 4]  920 	xor	a, a
   4938 F5            [11]  921 	push	af
   4939 33            [ 6]  922 	inc	sp
   493A D5            [11]  923 	push	de
   493B CD 64 50      [17]  924 	call	_cpct_drawSolidBox
   493E F1            [10]  925 	pop	af
   493F F1            [10]  926 	pop	af
   4940 33            [ 6]  927 	inc	sp
   4941 C1            [10]  928 	pop	bc
   4942                     929 00108$:
                            930 ;src/main.c:192: if(e.vivo == 0){
   4942 DD 6E FA      [19]  931 	ld	l,-6 (ix)
   4945 DD 66 FB      [19]  932 	ld	h,-5 (ix)
   4948 5E            [ 7]  933 	ld	e,(hl)
   4949 23            [ 6]  934 	inc	hl
   494A 7E            [ 7]  935 	ld	a, (hl)
   494B B3            [ 4]  936 	or	a,e
   494C 20 2B         [12]  937 	jr	NZ,00110$
                            938 ;src/main.c:193: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   494E DD 6E F2      [19]  939 	ld	l,-14 (ix)
   4951 DD 66 F3      [19]  940 	ld	h,-13 (ix)
   4954 46            [ 7]  941 	ld	b,(hl)
   4955 DD 6E EA      [19]  942 	ld	l,-22 (ix)
   4958 DD 66 EB      [19]  943 	ld	h,-21 (ix)
   495B 4E            [ 7]  944 	ld	c, (hl)
   495C C5            [11]  945 	push	bc
   495D 21 00 C0      [10]  946 	ld	hl,#0xC000
   4960 E5            [11]  947 	push	hl
   4961 CD 1C 51      [17]  948 	call	_cpct_getScreenPtr
   4964 4D            [ 4]  949 	ld	c, l
   4965 44            [ 4]  950 	ld	b, h
                            951 ;src/main.c:194: cpct_drawSolidBox(memptr, 18, 4, 16);
   4966 59            [ 4]  952 	ld	e, c
   4967 50            [ 4]  953 	ld	d, b
   4968 C5            [11]  954 	push	bc
   4969 21 04 10      [10]  955 	ld	hl,#0x1004
   496C E5            [11]  956 	push	hl
   496D 3E 12         [ 7]  957 	ld	a,#0x12
   496F F5            [11]  958 	push	af
   4970 33            [ 6]  959 	inc	sp
   4971 D5            [11]  960 	push	de
   4972 CD 64 50      [17]  961 	call	_cpct_drawSolidBox
   4975 F1            [10]  962 	pop	af
   4976 F1            [10]  963 	pop	af
   4977 33            [ 6]  964 	inc	sp
   4978 C1            [10]  965 	pop	bc
   4979                     966 00110$:
                            967 ;src/main.c:177: if(p.atk >= 21)
   4979 DD 6E EE      [19]  968 	ld	l,-18 (ix)
   497C DD 66 EF      [19]  969 	ld	h,-17 (ix)
   497F 5E            [ 7]  970 	ld	e,(hl)
   4980 23            [ 6]  971 	inc	hl
   4981 56            [ 7]  972 	ld	d,(hl)
                            973 ;src/main.c:197: if(p.atk < 20)
   4982 7B            [ 4]  974 	ld	a,e
   4983 D6 14         [ 7]  975 	sub	a, #0x14
   4985 7A            [ 4]  976 	ld	a,d
   4986 DE 00         [ 7]  977 	sbc	a, #0x00
   4988 30 10         [12]  978 	jr	NC,00115$
                            979 ;src/main.c:198: drawFatiga(p.atk,memptr,2);
   498A C5            [11]  980 	push	bc
   498B 3E 02         [ 7]  981 	ld	a,#0x02
   498D F5            [11]  982 	push	af
   498E 33            [ 6]  983 	inc	sp
   498F C5            [11]  984 	push	bc
   4990 D5            [11]  985 	push	de
   4991 CD 73 45      [17]  986 	call	_drawFatiga
   4994 F1            [10]  987 	pop	af
   4995 F1            [10]  988 	pop	af
   4996 33            [ 6]  989 	inc	sp
   4997 C1            [10]  990 	pop	bc
   4998 18 25         [12]  991 	jr	00116$
   499A                     992 00115$:
                            993 ;src/main.c:199: else if(p.atk > 20)
   499A 3E 14         [ 7]  994 	ld	a,#0x14
   499C BB            [ 4]  995 	cp	a, e
   499D 3E 00         [ 7]  996 	ld	a,#0x00
   499F 9A            [ 4]  997 	sbc	a, d
   49A0 30 10         [12]  998 	jr	NC,00112$
                            999 ;src/main.c:200: drawFatiga(p.atk,memptr,16);
   49A2 C5            [11] 1000 	push	bc
   49A3 3E 10         [ 7] 1001 	ld	a,#0x10
   49A5 F5            [11] 1002 	push	af
   49A6 33            [ 6] 1003 	inc	sp
   49A7 C5            [11] 1004 	push	bc
   49A8 D5            [11] 1005 	push	de
   49A9 CD 73 45      [17] 1006 	call	_drawFatiga
   49AC F1            [10] 1007 	pop	af
   49AD F1            [10] 1008 	pop	af
   49AE 33            [ 6] 1009 	inc	sp
   49AF C1            [10] 1010 	pop	bc
   49B0 18 0D         [12] 1011 	jr	00116$
   49B2                    1012 00112$:
                           1013 ;src/main.c:202: drawFatiga(p.atk,memptr,0);
   49B2 C5            [11] 1014 	push	bc
   49B3 AF            [ 4] 1015 	xor	a, a
   49B4 F5            [11] 1016 	push	af
   49B5 33            [ 6] 1017 	inc	sp
   49B6 C5            [11] 1018 	push	bc
   49B7 D5            [11] 1019 	push	de
   49B8 CD 73 45      [17] 1020 	call	_drawFatiga
   49BB F1            [10] 1021 	pop	af
   49BC F1            [10] 1022 	pop	af
   49BD 33            [ 6] 1023 	inc	sp
   49BE C1            [10] 1024 	pop	bc
   49BF                    1025 00116$:
                           1026 ;src/main.c:204: drawVida(p.life, memptr);
   49BF DD 6E F0      [19] 1027 	ld	l,-16 (ix)
   49C2 DD 66 F1      [19] 1028 	ld	h,-15 (ix)
   49C5 5E            [ 7] 1029 	ld	e,(hl)
   49C6 23            [ 6] 1030 	inc	hl
   49C7 56            [ 7] 1031 	ld	d,(hl)
   49C8 C5            [11] 1032 	push	bc
   49C9 D5            [11] 1033 	push	de
   49CA CD 30 46      [17] 1034 	call	_drawVida
   49CD F1            [10] 1035 	pop	af
   49CE F1            [10] 1036 	pop	af
                           1037 ;src/main.c:206: p.prevX = p.x;
   49CF DD 6E FC      [19] 1038 	ld	l,-4 (ix)
   49D2 DD 66 FD      [19] 1039 	ld	h,-3 (ix)
   49D5 7E            [ 7] 1040 	ld	a,(hl)
   49D6 DD 6E F8      [19] 1041 	ld	l,-8 (ix)
   49D9 DD 66 F9      [19] 1042 	ld	h,-7 (ix)
   49DC 77            [ 7] 1043 	ld	(hl),a
                           1044 ;src/main.c:207: p.prevY = p.y;
   49DD DD 6E FE      [19] 1045 	ld	l,-2 (ix)
   49E0 DD 66 FF      [19] 1046 	ld	h,-1 (ix)
   49E3 7E            [ 7] 1047 	ld	a,(hl)
   49E4 DD 6E E4      [19] 1048 	ld	l,-28 (ix)
   49E7 DD 66 E5      [19] 1049 	ld	h,-27 (ix)
   49EA 77            [ 7] 1050 	ld	(hl),a
                           1051 ;src/main.c:208: p.prevAtk = p.atk;
   49EB DD 6E EE      [19] 1052 	ld	l,-18 (ix)
   49EE DD 66 EF      [19] 1053 	ld	h,-17 (ix)
   49F1 56            [ 7] 1054 	ld	d,(hl)
   49F2 23            [ 6] 1055 	inc	hl
   49F3 5E            [ 7] 1056 	ld	e,(hl)
   49F4 DD 6E E8      [19] 1057 	ld	l,-24 (ix)
   49F7 DD 66 E9      [19] 1058 	ld	h,-23 (ix)
   49FA 72            [ 7] 1059 	ld	(hl),d
   49FB 23            [ 6] 1060 	inc	hl
   49FC 73            [ 7] 1061 	ld	(hl),e
                           1062 ;src/main.c:210: if(p.col != 2){
   49FD DD 6E E0      [19] 1063 	ld	l,-32 (ix)
   4A00 DD 66 E1      [19] 1064 	ld	h,-31 (ix)
   4A03 56            [ 7] 1065 	ld	d,(hl)
   4A04 23            [ 6] 1066 	inc	hl
   4A05 66            [ 7] 1067 	ld	h,(hl)
   4A06 7A            [ 4] 1068 	ld	a,d
   4A07 D6 02         [ 7] 1069 	sub	a,#0x02
   4A09 20 04         [12] 1070 	jr	NZ,00297$
   4A0B B4            [ 4] 1071 	or	a,h
   4A0C CA AA 4B      [10] 1072 	jp	Z,00157$
   4A0F                    1073 00297$:
                           1074 ;src/main.c:211: cpct_scanKeyboard_f();
   4A0F CD 8F 4E      [17] 1075 	call	_cpct_scanKeyboard_f
                           1076 ;src/main.c:212: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4A12 21 05 80      [10] 1077 	ld	hl,#0x8005
   4A15 CD 83 4E      [17] 1078 	call	_cpct_isKeyPressed
   4A18 DD 75 F5      [19] 1079 	ld	-11 (ix),l
                           1080 ;src/main.c:177: if(p.atk >= 21)
   4A1B DD 6E EE      [19] 1081 	ld	l,-18 (ix)
   4A1E DD 66 EF      [19] 1082 	ld	h,-17 (ix)
   4A21 7E            [ 7] 1083 	ld	a,(hl)
   4A22 DD 77 EC      [19] 1084 	ld	-20 (ix),a
   4A25 23            [ 6] 1085 	inc	hl
   4A26 7E            [ 7] 1086 	ld	a,(hl)
   4A27 DD 77 ED      [19] 1087 	ld	-19 (ix),a
                           1088 ;src/main.c:197: if(p.atk < 20)
   4A2A DD 7E EC      [19] 1089 	ld	a,-20 (ix)
   4A2D D6 14         [ 7] 1090 	sub	a, #0x14
   4A2F DD 7E ED      [19] 1091 	ld	a,-19 (ix)
   4A32 DE 00         [ 7] 1092 	sbc	a, #0x00
   4A34 3E 00         [ 7] 1093 	ld	a,#0x00
   4A36 17            [ 4] 1094 	rla
   4A37 DD 77 F4      [19] 1095 	ld	-12 (ix),a
                           1096 ;src/main.c:216: p.atk += 1;
   4A3A DD 7E EC      [19] 1097 	ld	a,-20 (ix)
   4A3D C6 01         [ 7] 1098 	add	a, #0x01
   4A3F DD 77 F6      [19] 1099 	ld	-10 (ix),a
   4A42 DD 7E ED      [19] 1100 	ld	a,-19 (ix)
   4A45 CE 00         [ 7] 1101 	adc	a, #0x00
   4A47 DD 77 F7      [19] 1102 	ld	-9 (ix),a
                           1103 ;src/main.c:212: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4A4A DD 7E F5      [19] 1104 	ld	a,-11 (ix)
   4A4D B7            [ 4] 1105 	or	a, a
   4A4E 28 5D         [12] 1106 	jr	Z,00151$
   4A50 DD 7E F4      [19] 1107 	ld	a,-12 (ix)
   4A53 B7            [ 4] 1108 	or	a, a
   4A54 20 57         [12] 1109 	jr	NZ,00151$
                           1110 ;src/main.c:213: if(p.atk >= 50)
   4A56 DD 7E EC      [19] 1111 	ld	a,-20 (ix)
   4A59 D6 32         [ 7] 1112 	sub	a, #0x32
   4A5B DD 7E ED      [19] 1113 	ld	a,-19 (ix)
   4A5E DE 00         [ 7] 1114 	sbc	a, #0x00
   4A60 38 0C         [12] 1115 	jr	C,00118$
                           1116 ;src/main.c:214: p.atk = 0;
   4A62 DD 6E EE      [19] 1117 	ld	l,-18 (ix)
   4A65 DD 66 EF      [19] 1118 	ld	h,-17 (ix)
   4A68 AF            [ 4] 1119 	xor	a, a
   4A69 77            [ 7] 1120 	ld	(hl), a
   4A6A 23            [ 6] 1121 	inc	hl
   4A6B 77            [ 7] 1122 	ld	(hl), a
   4A6C 18 0F         [12] 1123 	jr	00119$
   4A6E                    1124 00118$:
                           1125 ;src/main.c:216: p.atk += 1;
   4A6E DD 6E EE      [19] 1126 	ld	l,-18 (ix)
   4A71 DD 66 EF      [19] 1127 	ld	h,-17 (ix)
   4A74 DD 7E F6      [19] 1128 	ld	a,-10 (ix)
   4A77 77            [ 7] 1129 	ld	(hl),a
   4A78 23            [ 6] 1130 	inc	hl
   4A79 DD 7E F7      [19] 1131 	ld	a,-9 (ix)
   4A7C 77            [ 7] 1132 	ld	(hl),a
   4A7D                    1133 00119$:
                           1134 ;src/main.c:217: if(cpct_isKeyPressed(Key_CursorRight))
   4A7D 21 00 02      [10] 1135 	ld	hl,#0x0200
   4A80 CD 83 4E      [17] 1136 	call	_cpct_isKeyPressed
   4A83 7D            [ 4] 1137 	ld	a,l
   4A84 B7            [ 4] 1138 	or	a, a
   4A85 28 0D         [12] 1139 	jr	Z,00123$
                           1140 ;src/main.c:218: p.dir = 0;
   4A87 DD 6E E6      [19] 1141 	ld	l,-26 (ix)
   4A8A DD 66 E7      [19] 1142 	ld	h,-25 (ix)
   4A8D AF            [ 4] 1143 	xor	a, a
   4A8E 77            [ 7] 1144 	ld	(hl), a
   4A8F 23            [ 6] 1145 	inc	hl
   4A90 77            [ 7] 1146 	ld	(hl), a
   4A91 C3 E7 4B      [10] 1147 	jp	00158$
   4A94                    1148 00123$:
                           1149 ;src/main.c:219: else if(cpct_isKeyPressed(Key_CursorLeft))
   4A94 21 01 01      [10] 1150 	ld	hl,#0x0101
   4A97 CD 83 4E      [17] 1151 	call	_cpct_isKeyPressed
   4A9A 7D            [ 4] 1152 	ld	a,l
   4A9B B7            [ 4] 1153 	or	a, a
   4A9C CA E7 4B      [10] 1154 	jp	Z,00158$
                           1155 ;src/main.c:220: p.dir = 1;
   4A9F DD 6E E6      [19] 1156 	ld	l,-26 (ix)
   4AA2 DD 66 E7      [19] 1157 	ld	h,-25 (ix)
   4AA5 36 01         [10] 1158 	ld	(hl),#0x01
   4AA7 23            [ 6] 1159 	inc	hl
   4AA8 36 00         [10] 1160 	ld	(hl),#0x00
   4AAA C3 E7 4B      [10] 1161 	jp	00158$
   4AAD                    1162 00151$:
                           1163 ;src/main.c:222: if(p.atk < 20)
   4AAD DD 7E F4      [19] 1164 	ld	a,-12 (ix)
   4AB0 B7            [ 4] 1165 	or	a, a
   4AB1 28 11         [12] 1166 	jr	Z,00126$
                           1167 ;src/main.c:223: p.atk += 1;
   4AB3 DD 6E EE      [19] 1168 	ld	l,-18 (ix)
   4AB6 DD 66 EF      [19] 1169 	ld	h,-17 (ix)
   4AB9 DD 7E F6      [19] 1170 	ld	a,-10 (ix)
   4ABC 77            [ 7] 1171 	ld	(hl),a
   4ABD 23            [ 6] 1172 	inc	hl
   4ABE DD 7E F7      [19] 1173 	ld	a,-9 (ix)
   4AC1 77            [ 7] 1174 	ld	(hl),a
   4AC2 18 0B         [12] 1175 	jr	00127$
   4AC4                    1176 00126$:
                           1177 ;src/main.c:225: p.atk = 20;
   4AC4 DD 6E EE      [19] 1178 	ld	l,-18 (ix)
   4AC7 DD 66 EF      [19] 1179 	ld	h,-17 (ix)
   4ACA 36 14         [10] 1180 	ld	(hl),#0x14
   4ACC 23            [ 6] 1181 	inc	hl
   4ACD 36 00         [10] 1182 	ld	(hl),#0x00
   4ACF                    1183 00127$:
                           1184 ;src/main.c:226: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4ACF 21 00 02      [10] 1185 	ld	hl,#0x0200
   4AD2 CD 83 4E      [17] 1186 	call	_cpct_isKeyPressed
   4AD5 7D            [ 4] 1187 	ld	a,l
   4AD6 B7            [ 4] 1188 	or	a, a
   4AD7 28 32         [12] 1189 	jr	Z,00147$
   4AD9 DD 6E FC      [19] 1190 	ld	l,-4 (ix)
   4ADC DD 66 FD      [19] 1191 	ld	h,-3 (ix)
   4ADF 56            [ 7] 1192 	ld	d,(hl)
   4AE0 7A            [ 4] 1193 	ld	a,d
   4AE1 D6 4C         [ 7] 1194 	sub	a, #0x4C
   4AE3 30 26         [12] 1195 	jr	NC,00147$
                           1196 ;src/main.c:227: if(p.col != 2)
   4AE5 DD 6E E0      [19] 1197 	ld	l,-32 (ix)
   4AE8 DD 66 E1      [19] 1198 	ld	h,-31 (ix)
   4AEB 5E            [ 7] 1199 	ld	e,(hl)
   4AEC 23            [ 6] 1200 	inc	hl
   4AED 66            [ 7] 1201 	ld	h,(hl)
   4AEE 7B            [ 4] 1202 	ld	a,e
   4AEF D6 02         [ 7] 1203 	sub	a,#0x02
   4AF1 20 03         [12] 1204 	jr	NZ,00298$
   4AF3 B4            [ 4] 1205 	or	a,h
   4AF4 28 08         [12] 1206 	jr	Z,00129$
   4AF6                    1207 00298$:
                           1208 ;src/main.c:228: p.x += 1;
   4AF6 14            [ 4] 1209 	inc	d
   4AF7 DD 6E FC      [19] 1210 	ld	l,-4 (ix)
   4AFA DD 66 FD      [19] 1211 	ld	h,-3 (ix)
   4AFD 72            [ 7] 1212 	ld	(hl),d
   4AFE                    1213 00129$:
                           1214 ;src/main.c:229: p.dir = 0;
   4AFE DD 6E E6      [19] 1215 	ld	l,-26 (ix)
   4B01 DD 66 E7      [19] 1216 	ld	h,-25 (ix)
   4B04 AF            [ 4] 1217 	xor	a, a
   4B05 77            [ 7] 1218 	ld	(hl), a
   4B06 23            [ 6] 1219 	inc	hl
   4B07 77            [ 7] 1220 	ld	(hl), a
   4B08 C3 E7 4B      [10] 1221 	jp	00158$
   4B0B                    1222 00147$:
                           1223 ;src/main.c:230: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4B0B 21 01 01      [10] 1224 	ld	hl,#0x0101
   4B0E CD 83 4E      [17] 1225 	call	_cpct_isKeyPressed
   4B11 7D            [ 4] 1226 	ld	a,l
   4B12 B7            [ 4] 1227 	or	a, a
   4B13 28 32         [12] 1228 	jr	Z,00143$
   4B15 DD 6E FC      [19] 1229 	ld	l,-4 (ix)
   4B18 DD 66 FD      [19] 1230 	ld	h,-3 (ix)
   4B1B 56            [ 7] 1231 	ld	d,(hl)
   4B1C 7A            [ 4] 1232 	ld	a,d
   4B1D B7            [ 4] 1233 	or	a, a
   4B1E 28 27         [12] 1234 	jr	Z,00143$
                           1235 ;src/main.c:231: if(p.col != 2)
   4B20 DD 6E E0      [19] 1236 	ld	l,-32 (ix)
   4B23 DD 66 E1      [19] 1237 	ld	h,-31 (ix)
   4B26 5E            [ 7] 1238 	ld	e,(hl)
   4B27 23            [ 6] 1239 	inc	hl
   4B28 66            [ 7] 1240 	ld	h,(hl)
   4B29 7B            [ 4] 1241 	ld	a,e
   4B2A D6 02         [ 7] 1242 	sub	a,#0x02
   4B2C 20 03         [12] 1243 	jr	NZ,00299$
   4B2E B4            [ 4] 1244 	or	a,h
   4B2F 28 08         [12] 1245 	jr	Z,00131$
   4B31                    1246 00299$:
                           1247 ;src/main.c:232: p.x -= 1;
   4B31 15            [ 4] 1248 	dec	d
   4B32 DD 6E FC      [19] 1249 	ld	l,-4 (ix)
   4B35 DD 66 FD      [19] 1250 	ld	h,-3 (ix)
   4B38 72            [ 7] 1251 	ld	(hl),d
   4B39                    1252 00131$:
                           1253 ;src/main.c:233: p.dir = 1;
   4B39 DD 6E E6      [19] 1254 	ld	l,-26 (ix)
   4B3C DD 66 E7      [19] 1255 	ld	h,-25 (ix)
   4B3F 36 01         [10] 1256 	ld	(hl),#0x01
   4B41 23            [ 6] 1257 	inc	hl
   4B42 36 00         [10] 1258 	ld	(hl),#0x00
   4B44 C3 E7 4B      [10] 1259 	jp	00158$
   4B47                    1260 00143$:
                           1261 ;src/main.c:234: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4B47 21 00 04      [10] 1262 	ld	hl,#0x0400
   4B4A CD 83 4E      [17] 1263 	call	_cpct_isKeyPressed
   4B4D 7D            [ 4] 1264 	ld	a,l
   4B4E B7            [ 4] 1265 	or	a, a
   4B4F 28 22         [12] 1266 	jr	Z,00139$
                           1267 ;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4B51 DD 6E FE      [19] 1268 	ld	l,-2 (ix)
   4B54 DD 66 FF      [19] 1269 	ld	h,-1 (ix)
   4B57 56            [ 7] 1270 	ld	d,(hl)
                           1271 ;src/main.c:234: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   4B58 7A            [ 4] 1272 	ld	a,d
   4B59 D6 B8         [ 7] 1273 	sub	a, #0xB8
   4B5B 30 16         [12] 1274 	jr	NC,00139$
                           1275 ;src/main.c:235: p.y += 2;
   4B5D 14            [ 4] 1276 	inc	d
   4B5E 14            [ 4] 1277 	inc	d
   4B5F DD 6E FE      [19] 1278 	ld	l,-2 (ix)
   4B62 DD 66 FF      [19] 1279 	ld	h,-1 (ix)
   4B65 72            [ 7] 1280 	ld	(hl),d
                           1281 ;src/main.c:236: p.dir = 2;
   4B66 DD 6E E6      [19] 1282 	ld	l,-26 (ix)
   4B69 DD 66 E7      [19] 1283 	ld	h,-25 (ix)
   4B6C 36 02         [10] 1284 	ld	(hl),#0x02
   4B6E 23            [ 6] 1285 	inc	hl
   4B6F 36 00         [10] 1286 	ld	(hl),#0x00
   4B71 18 74         [12] 1287 	jr	00158$
   4B73                    1288 00139$:
                           1289 ;src/main.c:237: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4B73 21 00 01      [10] 1290 	ld	hl,#0x0100
   4B76 CD 83 4E      [17] 1291 	call	_cpct_isKeyPressed
   4B79 7D            [ 4] 1292 	ld	a,l
   4B7A B7            [ 4] 1293 	or	a, a
   4B7B 28 20         [12] 1294 	jr	Z,00135$
                           1295 ;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4B7D DD 6E FE      [19] 1296 	ld	l,-2 (ix)
   4B80 DD 66 FF      [19] 1297 	ld	h,-1 (ix)
   4B83 7E            [ 7] 1298 	ld	a,(hl)
                           1299 ;src/main.c:237: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   4B84 B7            [ 4] 1300 	or	a, a
   4B85 28 16         [12] 1301 	jr	Z,00135$
                           1302 ;src/main.c:238: p.y -= 2;
   4B87 C6 FE         [ 7] 1303 	add	a,#0xFE
   4B89 DD 6E FE      [19] 1304 	ld	l,-2 (ix)
   4B8C DD 66 FF      [19] 1305 	ld	h,-1 (ix)
   4B8F 77            [ 7] 1306 	ld	(hl),a
                           1307 ;src/main.c:239: p.dir = 3;
   4B90 DD 6E E6      [19] 1308 	ld	l,-26 (ix)
   4B93 DD 66 E7      [19] 1309 	ld	h,-25 (ix)
   4B96 36 03         [10] 1310 	ld	(hl),#0x03
   4B98 23            [ 6] 1311 	inc	hl
   4B99 36 00         [10] 1312 	ld	(hl),#0x00
   4B9B 18 4A         [12] 1313 	jr	00158$
   4B9D                    1314 00135$:
                           1315 ;src/main.c:240: }else  if(cpct_isKeyPressed(Key_Esc)){
   4B9D 21 08 04      [10] 1316 	ld	hl,#0x0408
   4BA0 CD 83 4E      [17] 1317 	call	_cpct_isKeyPressed
   4BA3 7D            [ 4] 1318 	ld	a,l
   4BA4 B7            [ 4] 1319 	or	a, a
   4BA5 28 40         [12] 1320 	jr	Z,00158$
                           1321 ;src/main.c:241: return;
   4BA7 C3 CF 4C      [10] 1322 	jp	00171$
   4BAA                    1323 00157$:
                           1324 ;src/main.c:245: p.x -= 2;
   4BAA DD 6E FC      [19] 1325 	ld	l,-4 (ix)
   4BAD DD 66 FD      [19] 1326 	ld	h,-3 (ix)
   4BB0 7E            [ 7] 1327 	ld	a,(hl)
   4BB1 C6 FE         [ 7] 1328 	add	a,#0xFE
   4BB3 DD 6E FC      [19] 1329 	ld	l,-4 (ix)
   4BB6 DD 66 FD      [19] 1330 	ld	h,-3 (ix)
   4BB9 77            [ 7] 1331 	ld	(hl),a
                           1332 ;src/main.c:246: p.rebote -= 2;
   4BBA DD 6E E2      [19] 1333 	ld	l,-30 (ix)
   4BBD DD 66 E3      [19] 1334 	ld	h,-29 (ix)
   4BC0 5E            [ 7] 1335 	ld	e,(hl)
   4BC1 23            [ 6] 1336 	inc	hl
   4BC2 56            [ 7] 1337 	ld	d,(hl)
   4BC3 1B            [ 6] 1338 	dec	de
   4BC4 1B            [ 6] 1339 	dec	de
   4BC5 DD 6E E2      [19] 1340 	ld	l,-30 (ix)
   4BC8 DD 66 E3      [19] 1341 	ld	h,-29 (ix)
   4BCB 73            [ 7] 1342 	ld	(hl),e
   4BCC 23            [ 6] 1343 	inc	hl
   4BCD 72            [ 7] 1344 	ld	(hl),d
                           1345 ;src/main.c:247: if(p.rebote == 0){
   4BCE 7A            [ 4] 1346 	ld	a,d
   4BCF B3            [ 4] 1347 	or	a,e
   4BD0 20 15         [12] 1348 	jr	NZ,00158$
                           1349 ;src/main.c:248: p.rebote = 6;
   4BD2 DD 6E E2      [19] 1350 	ld	l,-30 (ix)
   4BD5 DD 66 E3      [19] 1351 	ld	h,-29 (ix)
   4BD8 36 06         [10] 1352 	ld	(hl),#0x06
   4BDA 23            [ 6] 1353 	inc	hl
   4BDB 36 00         [10] 1354 	ld	(hl),#0x00
                           1355 ;src/main.c:249: p.col = 0;
   4BDD DD 6E E0      [19] 1356 	ld	l,-32 (ix)
   4BE0 DD 66 E1      [19] 1357 	ld	h,-31 (ix)
   4BE3 AF            [ 4] 1358 	xor	a, a
   4BE4 77            [ 7] 1359 	ld	(hl), a
   4BE5 23            [ 6] 1360 	inc	hl
   4BE6 77            [ 7] 1361 	ld	(hl), a
   4BE7                    1362 00158$:
                           1363 ;src/main.c:254: sprite = checkSprite(p.atk,p.dir);
   4BE7 DD 6E E6      [19] 1364 	ld	l,-26 (ix)
   4BEA DD 66 E7      [19] 1365 	ld	h,-25 (ix)
   4BED 4E            [ 7] 1366 	ld	c,(hl)
   4BEE 23            [ 6] 1367 	inc	hl
   4BEF 46            [ 7] 1368 	ld	b,(hl)
   4BF0 DD 6E EE      [19] 1369 	ld	l,-18 (ix)
   4BF3 DD 66 EF      [19] 1370 	ld	h,-17 (ix)
   4BF6 5E            [ 7] 1371 	ld	e,(hl)
   4BF7 23            [ 6] 1372 	inc	hl
   4BF8 56            [ 7] 1373 	ld	d,(hl)
   4BF9 C5            [11] 1374 	push	bc
   4BFA D5            [11] 1375 	push	de
   4BFB CD 15 45      [17] 1376 	call	_checkSprite
   4BFE F1            [10] 1377 	pop	af
   4BFF F1            [10] 1378 	pop	af
   4C00 DD 75 DE      [19] 1379 	ld	-34 (ix),l
   4C03 DD 74 DF      [19] 1380 	ld	-33 (ix),h
                           1381 ;src/main.c:256: if(p.col != 2 && e.vivo == 0){
   4C06 DD 6E E0      [19] 1382 	ld	l,-32 (ix)
   4C09 DD 66 E1      [19] 1383 	ld	h,-31 (ix)
   4C0C 56            [ 7] 1384 	ld	d,(hl)
   4C0D 23            [ 6] 1385 	inc	hl
   4C0E 66            [ 7] 1386 	ld	h,(hl)
   4C0F 7A            [ 4] 1387 	ld	a,d
   4C10 D6 02         [ 7] 1388 	sub	a,#0x02
   4C12 20 04         [12] 1389 	jr	NZ,00300$
   4C14 B4            [ 4] 1390 	or	a,h
   4C15 CA AF 4C      [10] 1391 	jp	Z,00164$
   4C18                    1392 00300$:
   4C18 DD 6E FA      [19] 1393 	ld	l,-6 (ix)
   4C1B DD 66 FB      [19] 1394 	ld	h,-5 (ix)
   4C1E 56            [ 7] 1395 	ld	d,(hl)
   4C1F 23            [ 6] 1396 	inc	hl
   4C20 7E            [ 7] 1397 	ld	a, (hl)
   4C21 B2            [ 4] 1398 	or	a,d
   4C22 C2 AF 4C      [10] 1399 	jp	NZ,00164$
                           1400 ;src/main.c:257: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
   4C25 DD 6E EE      [19] 1401 	ld	l,-18 (ix)
   4C28 DD 66 EF      [19] 1402 	ld	h,-17 (ix)
   4C2B 4E            [ 7] 1403 	ld	c,(hl)
   4C2C 23            [ 6] 1404 	inc	hl
   4C2D 46            [ 7] 1405 	ld	b,(hl)
   4C2E DD 6E E6      [19] 1406 	ld	l,-26 (ix)
   4C31 DD 66 E7      [19] 1407 	ld	h,-25 (ix)
   4C34 7E            [ 7] 1408 	ld	a,(hl)
   4C35 DD 77 F6      [19] 1409 	ld	-10 (ix),a
   4C38 23            [ 6] 1410 	inc	hl
   4C39 7E            [ 7] 1411 	ld	a,(hl)
   4C3A DD 77 F7      [19] 1412 	ld	-9 (ix),a
   4C3D DD 6E F2      [19] 1413 	ld	l,-14 (ix)
   4C40 DD 66 F3      [19] 1414 	ld	h,-13 (ix)
   4C43 5E            [ 7] 1415 	ld	e,(hl)
   4C44 DD 6E EA      [19] 1416 	ld	l,-22 (ix)
   4C47 DD 66 EB      [19] 1417 	ld	h,-21 (ix)
   4C4A 7E            [ 7] 1418 	ld	a,(hl)
   4C4B DD 77 F4      [19] 1419 	ld	-12 (ix),a
   4C4E DD 6E FE      [19] 1420 	ld	l,-2 (ix)
   4C51 DD 66 FF      [19] 1421 	ld	h,-1 (ix)
   4C54 7E            [ 7] 1422 	ld	a,(hl)
   4C55 DD 77 EC      [19] 1423 	ld	-20 (ix),a
   4C58 DD 6E FC      [19] 1424 	ld	l,-4 (ix)
   4C5B DD 66 FD      [19] 1425 	ld	h,-3 (ix)
   4C5E 56            [ 7] 1426 	ld	d,(hl)
   4C5F C5            [11] 1427 	push	bc
   4C60 DD 6E F6      [19] 1428 	ld	l,-10 (ix)
   4C63 DD 66 F7      [19] 1429 	ld	h,-9 (ix)
   4C66 E5            [11] 1430 	push	hl
   4C67 7B            [ 4] 1431 	ld	a,e
   4C68 F5            [11] 1432 	push	af
   4C69 33            [ 6] 1433 	inc	sp
   4C6A DD 7E F4      [19] 1434 	ld	a,-12 (ix)
   4C6D F5            [11] 1435 	push	af
   4C6E 33            [ 6] 1436 	inc	sp
   4C6F DD 7E EC      [19] 1437 	ld	a,-20 (ix)
   4C72 F5            [11] 1438 	push	af
   4C73 33            [ 6] 1439 	inc	sp
   4C74 D5            [11] 1440 	push	de
   4C75 33            [ 6] 1441 	inc	sp
   4C76 CD 59 44      [17] 1442 	call	_checkCollisions
   4C79 F1            [10] 1443 	pop	af
   4C7A F1            [10] 1444 	pop	af
   4C7B F1            [10] 1445 	pop	af
   4C7C F1            [10] 1446 	pop	af
   4C7D 55            [ 4] 1447 	ld	d,l
   4C7E 5C            [ 4] 1448 	ld	e,h
   4C7F DD 6E E0      [19] 1449 	ld	l,-32 (ix)
   4C82 DD 66 E1      [19] 1450 	ld	h,-31 (ix)
   4C85 72            [ 7] 1451 	ld	(hl),d
   4C86 23            [ 6] 1452 	inc	hl
   4C87 73            [ 7] 1453 	ld	(hl),e
                           1454 ;src/main.c:258: if(p.col == 2)
   4C88 7A            [ 4] 1455 	ld	a,d
   4C89 D6 02         [ 7] 1456 	sub	a,#0x02
   4C8B 20 16         [12] 1457 	jr	NZ,00160$
   4C8D B3            [ 4] 1458 	or	a,e
   4C8E 20 13         [12] 1459 	jr	NZ,00160$
                           1460 ;src/main.c:259: p.life--;
   4C90 DD 6E F0      [19] 1461 	ld	l,-16 (ix)
   4C93 DD 66 F1      [19] 1462 	ld	h,-15 (ix)
   4C96 5E            [ 7] 1463 	ld	e,(hl)
   4C97 23            [ 6] 1464 	inc	hl
   4C98 56            [ 7] 1465 	ld	d,(hl)
   4C99 1B            [ 6] 1466 	dec	de
   4C9A DD 6E F0      [19] 1467 	ld	l,-16 (ix)
   4C9D DD 66 F1      [19] 1468 	ld	h,-15 (ix)
   4CA0 73            [ 7] 1469 	ld	(hl),e
   4CA1 23            [ 6] 1470 	inc	hl
   4CA2 72            [ 7] 1471 	ld	(hl),d
   4CA3                    1472 00160$:
                           1473 ;src/main.c:260: if(p.life == 0)
   4CA3 DD 6E F0      [19] 1474 	ld	l,-16 (ix)
   4CA6 DD 66 F1      [19] 1475 	ld	h,-15 (ix)
   4CA9 56            [ 7] 1476 	ld	d,(hl)
   4CAA 23            [ 6] 1477 	inc	hl
   4CAB 7E            [ 7] 1478 	ld	a, (hl)
   4CAC B2            [ 4] 1479 	or	a,d
                           1480 ;src/main.c:261: return;
   4CAD 28 20         [12] 1481 	jr	Z,00171$
   4CAF                    1482 00164$:
                           1483 ;src/main.c:263: if(p.col == 1)
   4CAF DD 6E E0      [19] 1484 	ld	l,-32 (ix)
   4CB2 DD 66 E1      [19] 1485 	ld	h,-31 (ix)
   4CB5 56            [ 7] 1486 	ld	d,(hl)
   4CB6 23            [ 6] 1487 	inc	hl
   4CB7 66            [ 7] 1488 	ld	h,(hl)
   4CB8 15            [ 4] 1489 	dec	d
   4CB9 C2 65 48      [10] 1490 	jp	NZ,00169$
   4CBC 7C            [ 4] 1491 	ld	a,h
   4CBD B7            [ 4] 1492 	or	a, a
   4CBE C2 65 48      [10] 1493 	jp	NZ,00169$
                           1494 ;src/main.c:264: e.vivo = 1;
   4CC1 DD 6E FA      [19] 1495 	ld	l,-6 (ix)
   4CC4 DD 66 FB      [19] 1496 	ld	h,-5 (ix)
   4CC7 36 01         [10] 1497 	ld	(hl),#0x01
   4CC9 23            [ 6] 1498 	inc	hl
   4CCA 36 00         [10] 1499 	ld	(hl),#0x00
   4CCC C3 65 48      [10] 1500 	jp	00169$
   4CCF                    1501 00171$:
   4CCF DD F9         [10] 1502 	ld	sp, ix
   4CD1 DD E1         [14] 1503 	pop	ix
   4CD3 C9            [10] 1504 	ret
                           1505 ;src/main.c:271: void main(void) {
                           1506 ;	---------------------------------
                           1507 ; Function main
                           1508 ; ---------------------------------
   4CD4                    1509 _main::
                           1510 ;src/main.c:273: init();
   4CD4 CD C4 43      [17] 1511 	call	_init
                           1512 ;src/main.c:276: while(1){
   4CD7                    1513 00102$:
                           1514 ;src/main.c:277: menu();
   4CD7 CD ED 43      [17] 1515 	call	_menu
                           1516 ;src/main.c:278: game();
   4CDA CD D7 46      [17] 1517 	call	_game
   4CDD 18 F8         [12] 1518 	jr	00102$
                           1519 	.area _CODE
                           1520 	.area _INITIALIZER
                           1521 	.area _CABS (ABS)
