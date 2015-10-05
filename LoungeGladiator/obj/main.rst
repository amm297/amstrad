                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Mon Oct  5 12:35:28 2015
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
                             64 ;src/main.c:46: void init(){
                             65 ;	---------------------------------
                             66 ; Function init
                             67 ; ---------------------------------
   4384                      68 _init::
                             69 ;src/main.c:47: cpct_disableFirmware();
   4384 CD 18 4F      [17]   70 	call	_cpct_disableFirmware
                             71 ;src/main.c:48: cpct_setVideoMode(0);
   4387 AF            [ 4]   72 	xor	a, a
   4388 F5            [11]   73 	push	af
   4389 33            [ 6]   74 	inc	sp
   438A CD F5 4E      [17]   75 	call	_cpct_setVideoMode
   438D 33            [ 6]   76 	inc	sp
                             77 ;src/main.c:49: cpct_fw2hw(g_palette,4);
   438E 11 A9 43      [10]   78 	ld	de,#_g_palette
   4391 3E 04         [ 7]   79 	ld	a,#0x04
   4393 F5            [11]   80 	push	af
   4394 33            [ 6]   81 	inc	sp
   4395 D5            [11]   82 	push	de
   4396 CD 7F 4E      [17]   83 	call	_cpct_fw2hw
   4399 F1            [10]   84 	pop	af
   439A 33            [ 6]   85 	inc	sp
                             86 ;src/main.c:50: cpct_setPalette(g_palette,4);
   439B 11 A9 43      [10]   87 	ld	de,#_g_palette
   439E 3E 04         [ 7]   88 	ld	a,#0x04
   43A0 F5            [11]   89 	push	af
   43A1 33            [ 6]   90 	inc	sp
   43A2 D5            [11]   91 	push	de
   43A3 CD 24 4D      [17]   92 	call	_cpct_setPalette
   43A6 F1            [10]   93 	pop	af
   43A7 33            [ 6]   94 	inc	sp
   43A8 C9            [10]   95 	ret
   43A9                      96 _g_palette:
   43A9 00                   97 	.db #0x00	; 0
   43AA 1A                   98 	.db #0x1A	; 26
   43AB 06                   99 	.db #0x06	; 6
   43AC 12                  100 	.db #0x12	; 18
                            101 ;src/main.c:54: void menu(){
                            102 ;	---------------------------------
                            103 ; Function menu
                            104 ; ---------------------------------
   43AD                     105 _menu::
                            106 ;src/main.c:56: cpct_clearScreen(0);
   43AD 21 00 40      [10]  107 	ld	hl,#0x4000
   43B0 E5            [11]  108 	push	hl
   43B1 AF            [ 4]  109 	xor	a, a
   43B2 F5            [11]  110 	push	af
   43B3 33            [ 6]  111 	inc	sp
   43B4 26 C0         [ 7]  112 	ld	h, #0xC0
   43B6 E5            [11]  113 	push	hl
   43B7 CD 07 4F      [17]  114 	call	_cpct_memset
                            115 ;src/main.c:58: memptr = cpct_getScreenPtr(VMEM,20,10);
   43BA 21 14 0A      [10]  116 	ld	hl,#0x0A14
   43BD E5            [11]  117 	push	hl
   43BE 21 00 C0      [10]  118 	ld	hl,#0xC000
   43C1 E5            [11]  119 	push	hl
   43C2 CD E1 4F      [17]  120 	call	_cpct_getScreenPtr
                            121 ;src/main.c:59: cpct_drawStringM0("Super Menu",memptr,2,3);
   43C5 EB            [ 4]  122 	ex	de,hl
   43C6 01 02 44      [10]  123 	ld	bc,#___str_0+0
   43C9 21 02 03      [10]  124 	ld	hl,#0x0302
   43CC E5            [11]  125 	push	hl
   43CD D5            [11]  126 	push	de
   43CE C5            [11]  127 	push	bc
   43CF CD BE 4D      [17]  128 	call	_cpct_drawStringM0
   43D2 21 06 00      [10]  129 	ld	hl,#6
   43D5 39            [11]  130 	add	hl,sp
   43D6 F9            [ 6]  131 	ld	sp,hl
                            132 ;src/main.c:61: memptr = cpct_getScreenPtr(VMEM,18,180);
   43D7 21 12 B4      [10]  133 	ld	hl,#0xB412
   43DA E5            [11]  134 	push	hl
   43DB 21 00 C0      [10]  135 	ld	hl,#0xC000
   43DE E5            [11]  136 	push	hl
   43DF CD E1 4F      [17]  137 	call	_cpct_getScreenPtr
                            138 ;src/main.c:62: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   43E2 EB            [ 4]  139 	ex	de,hl
   43E3 01 0D 44      [10]  140 	ld	bc,#___str_1+0
   43E6 21 04 05      [10]  141 	ld	hl,#0x0504
   43E9 E5            [11]  142 	push	hl
   43EA D5            [11]  143 	push	de
   43EB C5            [11]  144 	push	bc
   43EC CD BE 4D      [17]  145 	call	_cpct_drawStringM0
   43EF 21 06 00      [10]  146 	ld	hl,#6
   43F2 39            [11]  147 	add	hl,sp
   43F3 F9            [ 6]  148 	ld	sp,hl
                            149 ;src/main.c:64: do{
   43F4                     150 00101$:
                            151 ;src/main.c:65: cpct_scanKeyboard_f();
   43F4 CD 54 4D      [17]  152 	call	_cpct_scanKeyboard_f
                            153 ;src/main.c:66: }while(!cpct_isKeyPressed(Key_Enter));
   43F7 21 00 40      [10]  154 	ld	hl,#0x4000
   43FA CD 48 4D      [17]  155 	call	_cpct_isKeyPressed
   43FD 7D            [ 4]  156 	ld	a,l
   43FE B7            [ 4]  157 	or	a, a
   43FF 28 F3         [12]  158 	jr	Z,00101$
   4401 C9            [10]  159 	ret
   4402                     160 ___str_0:
   4402 53 75 70 65 72 20   161 	.ascii "Super Menu"
        4D 65 6E 75
   440C 00                  162 	.db 0x00
   440D                     163 ___str_1:
   440D 50 75 6C 73 61 20   164 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4418 00                  165 	.db 0x00
                            166 ;src/main.c:71: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            167 ;	---------------------------------
                            168 ; Function checkCollisions
                            169 ; ---------------------------------
   4419                     170 _checkCollisions::
   4419 DD E5         [15]  171 	push	ix
   441B DD 21 00 00   [14]  172 	ld	ix,#0
   441F DD 39         [15]  173 	add	ix,sp
   4421 3B            [ 6]  174 	dec	sp
                            175 ;src/main.c:72: if((u8)atk >= 21)
   4422 DD 7E 0A      [19]  176 	ld	a,10 (ix)
   4425 DD 77 FF      [19]  177 	ld	-1 (ix),a
                            178 ;src/main.c:74: if(eX - pX > -1 && eX - pX < 11)
   4428 DD 4E 06      [19]  179 	ld	c,6 (ix)
   442B 06 00         [ 7]  180 	ld	b,#0x00
   442D DD 6E 04      [19]  181 	ld	l,4 (ix)
   4430 26 00         [ 7]  182 	ld	h,#0x00
   4432 79            [ 4]  183 	ld	a,c
   4433 95            [ 4]  184 	sub	a, l
   4434 5F            [ 4]  185 	ld	e,a
   4435 78            [ 4]  186 	ld	a,b
   4436 9C            [ 4]  187 	sbc	a, h
   4437 57            [ 4]  188 	ld	d,a
                            189 ;src/main.c:72: if((u8)atk >= 21)
   4438 DD 7E FF      [19]  190 	ld	a,-1 (ix)
   443B D6 15         [ 7]  191 	sub	a, #0x15
   443D 38 4F         [12]  192 	jr	C,00118$
                            193 ;src/main.c:73: if(dir == 0)
   443F DD 7E 09      [19]  194 	ld	a,9 (ix)
   4442 DD B6 08      [19]  195 	or	a,8 (ix)
   4445 20 21         [12]  196 	jr	NZ,00110$
                            197 ;src/main.c:74: if(eX - pX > -1 && eX - pX < 11)
   4447 3E FF         [ 7]  198 	ld	a,#0xFF
   4449 BB            [ 4]  199 	cp	a, e
   444A 9A            [ 4]  200 	sbc	a, d
   444B E2 50 44      [10]  201 	jp	PO, 00162$
   444E EE 80         [ 7]  202 	xor	a, #0x80
   4450                     203 00162$:
   4450 F2 63 44      [10]  204 	jp	P,00102$
   4453 7B            [ 4]  205 	ld	a,e
   4454 D6 0B         [ 7]  206 	sub	a, #0x0B
   4456 7A            [ 4]  207 	ld	a,d
   4457 17            [ 4]  208 	rla
   4458 3F            [ 4]  209 	ccf
   4459 1F            [ 4]  210 	rra
   445A DE 80         [ 7]  211 	sbc	a, #0x80
   445C 30 05         [12]  212 	jr	NC,00102$
                            213 ;src/main.c:75: return 1;
   445E 21 01 00      [10]  214 	ld	hl,#0x0001
   4461 18 6E         [12]  215 	jr	00120$
   4463                     216 00102$:
                            217 ;src/main.c:77: return 0;
   4463 21 00 00      [10]  218 	ld	hl,#0x0000
   4466 18 69         [12]  219 	jr	00120$
   4468                     220 00110$:
                            221 ;src/main.c:79: if(pX - eX > -1 && pX - eX < 11)
   4468 BF            [ 4]  222 	cp	a, a
   4469 ED 42         [15]  223 	sbc	hl, bc
   446B 3E FF         [ 7]  224 	ld	a,#0xFF
   446D BD            [ 4]  225 	cp	a, l
   446E 9C            [ 4]  226 	sbc	a, h
   446F E2 74 44      [10]  227 	jp	PO, 00163$
   4472 EE 80         [ 7]  228 	xor	a, #0x80
   4474                     229 00163$:
   4474 F2 89 44      [10]  230 	jp	P,00106$
   4477 11 0B 80      [10]  231 	ld	de, #0x800B
   447A 29            [11]  232 	add	hl, hl
   447B 3F            [ 4]  233 	ccf
   447C CB 1C         [ 8]  234 	rr	h
   447E CB 1D         [ 8]  235 	rr	l
   4480 ED 52         [15]  236 	sbc	hl, de
   4482 30 05         [12]  237 	jr	NC,00106$
                            238 ;src/main.c:80: return 1;
   4484 21 01 00      [10]  239 	ld	hl,#0x0001
   4487 18 48         [12]  240 	jr	00120$
   4489                     241 00106$:
                            242 ;src/main.c:82: return 0;
   4489 21 00 00      [10]  243 	ld	hl,#0x0000
   448C 18 43         [12]  244 	jr	00120$
   448E                     245 00118$:
                            246 ;src/main.c:84: if(eX - pX > 0 && eX - pX < 4 && eY - pY > 0 && eY - pY < 16)
   448E AF            [ 4]  247 	xor	a, a
   448F BB            [ 4]  248 	cp	a, e
   4490 9A            [ 4]  249 	sbc	a, d
   4491 E2 96 44      [10]  250 	jp	PO, 00164$
   4494 EE 80         [ 7]  251 	xor	a, #0x80
   4496                     252 00164$:
   4496 F2 CE 44      [10]  253 	jp	P,00119$
   4499 7B            [ 4]  254 	ld	a,e
   449A D6 04         [ 7]  255 	sub	a, #0x04
   449C 7A            [ 4]  256 	ld	a,d
   449D 17            [ 4]  257 	rla
   449E 3F            [ 4]  258 	ccf
   449F 1F            [ 4]  259 	rra
   44A0 DE 80         [ 7]  260 	sbc	a, #0x80
   44A2 30 2A         [12]  261 	jr	NC,00119$
   44A4 DD 6E 07      [19]  262 	ld	l,7 (ix)
   44A7 26 00         [ 7]  263 	ld	h,#0x00
   44A9 DD 5E 05      [19]  264 	ld	e,5 (ix)
   44AC 16 00         [ 7]  265 	ld	d,#0x00
   44AE BF            [ 4]  266 	cp	a, a
   44AF ED 52         [15]  267 	sbc	hl, de
   44B1 AF            [ 4]  268 	xor	a, a
   44B2 BD            [ 4]  269 	cp	a, l
   44B3 9C            [ 4]  270 	sbc	a, h
   44B4 E2 B9 44      [10]  271 	jp	PO, 00165$
   44B7 EE 80         [ 7]  272 	xor	a, #0x80
   44B9                     273 00165$:
   44B9 F2 CE 44      [10]  274 	jp	P,00119$
   44BC 11 10 80      [10]  275 	ld	de, #0x8010
   44BF 29            [11]  276 	add	hl, hl
   44C0 3F            [ 4]  277 	ccf
   44C1 CB 1C         [ 8]  278 	rr	h
   44C3 CB 1D         [ 8]  279 	rr	l
   44C5 ED 52         [15]  280 	sbc	hl, de
   44C7 30 05         [12]  281 	jr	NC,00119$
                            282 ;src/main.c:85: return 2;
   44C9 21 02 00      [10]  283 	ld	hl,#0x0002
   44CC 18 03         [12]  284 	jr	00120$
   44CE                     285 00119$:
                            286 ;src/main.c:87: return 0;
   44CE 21 00 00      [10]  287 	ld	hl,#0x0000
   44D1                     288 00120$:
   44D1 33            [ 6]  289 	inc	sp
   44D2 DD E1         [14]  290 	pop	ix
   44D4 C9            [10]  291 	ret
                            292 ;src/main.c:90: u8* checkSprite(u8* atk, u8* dir){
                            293 ;	---------------------------------
                            294 ; Function checkSprite
                            295 ; ---------------------------------
   44D5                     296 _checkSprite::
                            297 ;src/main.c:91: if(atk <= 20)
   44D5 3E 14         [ 7]  298 	ld	a,#0x14
   44D7 FD 21 02 00   [14]  299 	ld	iy,#2
   44DB FD 39         [15]  300 	add	iy,sp
   44DD FD BE 00      [19]  301 	cp	a, 0 (iy)
   44E0 3E 00         [ 7]  302 	ld	a,#0x00
   44E2 FD 9E 01      [19]  303 	sbc	a, 1 (iy)
   44E5 38 3B         [12]  304 	jr	C,00110$
                            305 ;src/main.c:92: switch((int)dir){
   44E7 FD 21 04 00   [14]  306 	ld	iy,#4
   44EB FD 39         [15]  307 	add	iy,sp
   44ED FD 5E 00      [19]  308 	ld	e,0 (iy)
   44F0 FD 56 01      [19]  309 	ld	d,1 (iy)
   44F3 CB 7A         [ 8]  310 	bit	7, d
   44F5 C0            [11]  311 	ret	NZ
   44F6 3E 03         [ 7]  312 	ld	a,#0x03
   44F8 BB            [ 4]  313 	cp	a, e
   44F9 3E 00         [ 7]  314 	ld	a,#0x00
   44FB 9A            [ 4]  315 	sbc	a, d
   44FC E2 01 45      [10]  316 	jp	PO, 00130$
   44FF EE 80         [ 7]  317 	xor	a, #0x80
   4501                     318 00130$:
   4501 F8            [11]  319 	ret	M
   4502 16 00         [ 7]  320 	ld	d,#0x00
   4504 21 0A 45      [10]  321 	ld	hl,#00131$
   4507 19            [11]  322 	add	hl,de
   4508 19            [11]  323 	add	hl,de
                            324 ;src/main.c:93: case 0:
   4509 E9            [ 4]  325 	jp	(hl)
   450A                     326 00131$:
   450A 18 06         [12]  327 	jr	00101$
   450C 18 08         [12]  328 	jr	00102$
   450E 18 0A         [12]  329 	jr	00103$
   4510 18 0C         [12]  330 	jr	00104$
   4512                     331 00101$:
                            332 ;src/main.c:94: return gladis_quieto_dcha;
   4512 21 00 42      [10]  333 	ld	hl,#_gladis_quieto_dcha
   4515 C9            [10]  334 	ret
                            335 ;src/main.c:96: case 1:
   4516                     336 00102$:
                            337 ;src/main.c:97: return gladis_quieto_izda;
   4516 21 80 42      [10]  338 	ld	hl,#_gladis_quieto_izda
   4519 C9            [10]  339 	ret
                            340 ;src/main.c:99: case 2:
   451A                     341 00103$:
                            342 ;src/main.c:100: return gladis_quieto_dcha;
   451A 21 00 42      [10]  343 	ld	hl,#_gladis_quieto_dcha
   451D C9            [10]  344 	ret
                            345 ;src/main.c:102: case 3:
   451E                     346 00104$:
                            347 ;src/main.c:103: return gladis_arriba_dcha;
   451E 21 00 40      [10]  348 	ld	hl,#_gladis_arriba_dcha
   4521 C9            [10]  349 	ret
                            350 ;src/main.c:104: }
   4522                     351 00110$:
                            352 ;src/main.c:105: else if(dir == 0){
   4522 21 05 00      [10]  353 	ld	hl, #4+1
   4525 39            [11]  354 	add	hl, sp
   4526 7E            [ 7]  355 	ld	a, (hl)
   4527 2B            [ 6]  356 	dec	hl
   4528 B6            [ 7]  357 	or	a,(hl)
   4529 20 04         [12]  358 	jr	NZ,00107$
                            359 ;src/main.c:106: return gladis_atk_dcha;
   452B 21 E4 4B      [10]  360 	ld	hl,#_gladis_atk_dcha
   452E C9            [10]  361 	ret
   452F                     362 00107$:
                            363 ;src/main.c:108: return gladis_atk_izda;
   452F 21 84 4C      [10]  364 	ld	hl,#_gladis_atk_izda
   4532 C9            [10]  365 	ret
                            366 ;src/main.c:112: void drawFatiga(u8* atk, u8* memptr, u8 col){
                            367 ;	---------------------------------
                            368 ; Function drawFatiga
                            369 ; ---------------------------------
   4533                     370 _drawFatiga::
   4533 DD E5         [15]  371 	push	ix
   4535 DD 21 00 00   [14]  372 	ld	ix,#0
   4539 DD 39         [15]  373 	add	ix,sp
                            374 ;src/main.c:113: if(atk < 20)
   453B DD 7E 04      [19]  375 	ld	a,4 (ix)
   453E D6 14         [ 7]  376 	sub	a, #0x14
   4540 DD 7E 05      [19]  377 	ld	a,5 (ix)
   4543 DE 00         [ 7]  378 	sbc	a, #0x00
   4545 30 04         [12]  379 	jr	NC,00102$
                            380 ;src/main.c:114: col = 2;
   4547 DD 36 08 02   [19]  381 	ld	8 (ix),#0x02
   454B                     382 00102$:
                            383 ;src/main.c:115: if(atk > 30 || atk <= 20){
   454B 3E 14         [ 7]  384 	ld	a,#0x14
   454D DD BE 04      [19]  385 	cp	a, 4 (ix)
   4550 3E 00         [ 7]  386 	ld	a,#0x00
   4552 DD 9E 05      [19]  387 	sbc	a, 5 (ix)
   4555 3E 00         [ 7]  388 	ld	a,#0x00
   4557 17            [ 4]  389 	rla
   4558 57            [ 4]  390 	ld	d,a
   4559 3E 1E         [ 7]  391 	ld	a,#0x1E
   455B DD BE 04      [19]  392 	cp	a, 4 (ix)
   455E 3E 00         [ 7]  393 	ld	a,#0x00
   4560 DD 9E 05      [19]  394 	sbc	a, 5 (ix)
   4563 38 04         [12]  395 	jr	C,00103$
   4565 7A            [ 4]  396 	ld	a,d
   4566 B7            [ 4]  397 	or	a, a
   4567 20 27         [12]  398 	jr	NZ,00104$
   4569                     399 00103$:
                            400 ;src/main.c:116: memptr = cpct_getScreenPtr(VMEM,4,160);
   4569 D5            [11]  401 	push	de
   456A 21 04 A0      [10]  402 	ld	hl,#0xA004
   456D E5            [11]  403 	push	hl
   456E 21 00 C0      [10]  404 	ld	hl,#0xC000
   4571 E5            [11]  405 	push	hl
   4572 CD E1 4F      [17]  406 	call	_cpct_getScreenPtr
   4575 D1            [10]  407 	pop	de
                            408 ;src/main.c:117: cpct_drawSolidBox(memptr, col, 2, 8);
   4576 DD 75 06      [19]  409 	ld	6 (ix),l
   4579 DD 74 07      [19]  410 	ld	7 (ix),h
   457C 4D            [ 4]  411 	ld	c,l
   457D 44            [ 4]  412 	ld	b,h
   457E D5            [11]  413 	push	de
   457F 21 02 08      [10]  414 	ld	hl,#0x0802
   4582 E5            [11]  415 	push	hl
   4583 DD 7E 08      [19]  416 	ld	a,8 (ix)
   4586 F5            [11]  417 	push	af
   4587 33            [ 6]  418 	inc	sp
   4588 C5            [11]  419 	push	bc
   4589 CD 29 4F      [17]  420 	call	_cpct_drawSolidBox
   458C F1            [10]  421 	pop	af
   458D F1            [10]  422 	pop	af
   458E 33            [ 6]  423 	inc	sp
   458F D1            [10]  424 	pop	de
   4590                     425 00104$:
                            426 ;src/main.c:119: if(atk > 40 || atk <= 20){
   4590 3E 28         [ 7]  427 	ld	a,#0x28
   4592 DD BE 04      [19]  428 	cp	a, 4 (ix)
   4595 3E 00         [ 7]  429 	ld	a,#0x00
   4597 DD 9E 05      [19]  430 	sbc	a, 5 (ix)
   459A 38 04         [12]  431 	jr	C,00106$
   459C 7A            [ 4]  432 	ld	a,d
   459D B7            [ 4]  433 	or	a, a
   459E 20 27         [12]  434 	jr	NZ,00107$
   45A0                     435 00106$:
                            436 ;src/main.c:120: memptr = cpct_getScreenPtr(VMEM,7,160);
   45A0 D5            [11]  437 	push	de
   45A1 21 07 A0      [10]  438 	ld	hl,#0xA007
   45A4 E5            [11]  439 	push	hl
   45A5 21 00 C0      [10]  440 	ld	hl,#0xC000
   45A8 E5            [11]  441 	push	hl
   45A9 CD E1 4F      [17]  442 	call	_cpct_getScreenPtr
   45AC D1            [10]  443 	pop	de
                            444 ;src/main.c:121: cpct_drawSolidBox(memptr, col, 2, 8);
   45AD DD 75 06      [19]  445 	ld	6 (ix),l
   45B0 DD 74 07      [19]  446 	ld	7 (ix),h
   45B3 4D            [ 4]  447 	ld	c,l
   45B4 44            [ 4]  448 	ld	b,h
   45B5 D5            [11]  449 	push	de
   45B6 21 02 08      [10]  450 	ld	hl,#0x0802
   45B9 E5            [11]  451 	push	hl
   45BA DD 7E 08      [19]  452 	ld	a,8 (ix)
   45BD F5            [11]  453 	push	af
   45BE 33            [ 6]  454 	inc	sp
   45BF C5            [11]  455 	push	bc
   45C0 CD 29 4F      [17]  456 	call	_cpct_drawSolidBox
   45C3 F1            [10]  457 	pop	af
   45C4 F1            [10]  458 	pop	af
   45C5 33            [ 6]  459 	inc	sp
   45C6 D1            [10]  460 	pop	de
   45C7                     461 00107$:
                            462 ;src/main.c:123: if(atk <= 20){
   45C7 7A            [ 4]  463 	ld	a,d
   45C8 B7            [ 4]  464 	or	a, a
   45C9 20 22         [12]  465 	jr	NZ,00111$
                            466 ;src/main.c:124: memptr = cpct_getScreenPtr(VMEM,10,160);
   45CB 21 0A A0      [10]  467 	ld	hl,#0xA00A
   45CE E5            [11]  468 	push	hl
   45CF 21 00 C0      [10]  469 	ld	hl,#0xC000
   45D2 E5            [11]  470 	push	hl
   45D3 CD E1 4F      [17]  471 	call	_cpct_getScreenPtr
                            472 ;src/main.c:125: cpct_drawSolidBox(memptr, col, 2, 8);
   45D6 DD 75 06      [19]  473 	ld	6 (ix),l
   45D9 DD 74 07      [19]  474 	ld	7 (ix),h
   45DC EB            [ 4]  475 	ex	de,hl
   45DD 21 02 08      [10]  476 	ld	hl,#0x0802
   45E0 E5            [11]  477 	push	hl
   45E1 DD 7E 08      [19]  478 	ld	a,8 (ix)
   45E4 F5            [11]  479 	push	af
   45E5 33            [ 6]  480 	inc	sp
   45E6 D5            [11]  481 	push	de
   45E7 CD 29 4F      [17]  482 	call	_cpct_drawSolidBox
   45EA F1            [10]  483 	pop	af
   45EB F1            [10]  484 	pop	af
   45EC 33            [ 6]  485 	inc	sp
   45ED                     486 00111$:
   45ED DD E1         [14]  487 	pop	ix
   45EF C9            [10]  488 	ret
                            489 ;src/main.c:129: void drawVida(u8* life, u8* memptr){
                            490 ;	---------------------------------
                            491 ; Function drawVida
                            492 ; ---------------------------------
   45F0                     493 _drawVida::
   45F0 DD E5         [15]  494 	push	ix
   45F2 DD 21 00 00   [14]  495 	ld	ix,#0
   45F6 DD 39         [15]  496 	add	ix,sp
                            497 ;src/main.c:130: if(life >= 1){
   45F8 DD 7E 04      [19]  498 	ld	a,4 (ix)
   45FB D6 01         [ 7]  499 	sub	a, #0x01
   45FD DD 7E 05      [19]  500 	ld	a,5 (ix)
   4600 DE 00         [ 7]  501 	sbc	a, #0x00
   4602 38 1F         [12]  502 	jr	C,00102$
                            503 ;src/main.c:131: memptr = cpct_getScreenPtr(VMEM,55,160);
   4604 21 37 A0      [10]  504 	ld	hl,#0xA037
   4607 E5            [11]  505 	push	hl
   4608 21 00 C0      [10]  506 	ld	hl,#0xC000
   460B E5            [11]  507 	push	hl
   460C CD E1 4F      [17]  508 	call	_cpct_getScreenPtr
                            509 ;src/main.c:132: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   460F DD 75 06      [19]  510 	ld	6 (ix),l
   4612 DD 74 07      [19]  511 	ld	7 (ix),h
   4615 4D            [ 4]  512 	ld	c,l
   4616 44            [ 4]  513 	ld	b,h
   4617 11 04 43      [10]  514 	ld	de,#_corazon_lleno
   461A 21 04 08      [10]  515 	ld	hl,#0x0804
   461D E5            [11]  516 	push	hl
   461E C5            [11]  517 	push	bc
   461F D5            [11]  518 	push	de
   4620 CD A3 4E      [17]  519 	call	_cpct_drawSpriteMasked
   4623                     520 00102$:
                            521 ;src/main.c:134: memptr = cpct_getScreenPtr(VMEM,60,160);
   4623 21 3C A0      [10]  522 	ld	hl,#0xA03C
   4626 E5            [11]  523 	push	hl
   4627 21 00 C0      [10]  524 	ld	hl,#0xC000
   462A E5            [11]  525 	push	hl
   462B CD E1 4F      [17]  526 	call	_cpct_getScreenPtr
                            527 ;src/main.c:132: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   462E DD 75 06      [19]  528 	ld	6 (ix),l
   4631 DD 74 07      [19]  529 	ld	7 (ix),h
   4634 4D            [ 4]  530 	ld	c,l
   4635 44            [ 4]  531 	ld	b,h
                            532 ;src/main.c:135: if(life >= 2)
   4636 DD 7E 04      [19]  533 	ld	a,4 (ix)
   4639 D6 02         [ 7]  534 	sub	a, #0x02
   463B DD 7E 05      [19]  535 	ld	a,5 (ix)
   463E DE 00         [ 7]  536 	sbc	a, #0x00
   4640 38 0E         [12]  537 	jr	C,00104$
                            538 ;src/main.c:136: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4642 11 04 43      [10]  539 	ld	de,#_corazon_lleno
   4645 21 04 08      [10]  540 	ld	hl,#0x0804
   4648 E5            [11]  541 	push	hl
   4649 C5            [11]  542 	push	bc
   464A D5            [11]  543 	push	de
   464B CD A3 4E      [17]  544 	call	_cpct_drawSpriteMasked
   464E 18 0C         [12]  545 	jr	00105$
   4650                     546 00104$:
                            547 ;src/main.c:138: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4650 11 44 43      [10]  548 	ld	de,#_corazon_roto
   4653 21 04 08      [10]  549 	ld	hl,#0x0804
   4656 E5            [11]  550 	push	hl
   4657 C5            [11]  551 	push	bc
   4658 D5            [11]  552 	push	de
   4659 CD A3 4E      [17]  553 	call	_cpct_drawSpriteMasked
   465C                     554 00105$:
                            555 ;src/main.c:139: memptr = cpct_getScreenPtr(VMEM,65,160);
   465C 21 41 A0      [10]  556 	ld	hl,#0xA041
   465F E5            [11]  557 	push	hl
   4660 21 00 C0      [10]  558 	ld	hl,#0xC000
   4663 E5            [11]  559 	push	hl
   4664 CD E1 4F      [17]  560 	call	_cpct_getScreenPtr
                            561 ;src/main.c:132: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   4667 DD 75 06      [19]  562 	ld	6 (ix),l
   466A DD 74 07      [19]  563 	ld	7 (ix),h
   466D EB            [ 4]  564 	ex	de,hl
                            565 ;src/main.c:140: if(life >= 3)
   466E DD 7E 04      [19]  566 	ld	a,4 (ix)
   4671 D6 03         [ 7]  567 	sub	a, #0x03
   4673 DD 7E 05      [19]  568 	ld	a,5 (ix)
   4676 DE 00         [ 7]  569 	sbc	a, #0x00
   4678 38 0E         [12]  570 	jr	C,00107$
                            571 ;src/main.c:141: cpct_drawSpriteMasked(corazon_lleno, memptr, 4, 8);
   467A 01 04 43      [10]  572 	ld	bc,#_corazon_lleno
   467D 21 04 08      [10]  573 	ld	hl,#0x0804
   4680 E5            [11]  574 	push	hl
   4681 D5            [11]  575 	push	de
   4682 C5            [11]  576 	push	bc
   4683 CD A3 4E      [17]  577 	call	_cpct_drawSpriteMasked
   4686 18 0C         [12]  578 	jr	00109$
   4688                     579 00107$:
                            580 ;src/main.c:143: cpct_drawSpriteMasked(corazon_roto, memptr, 4, 8);
   4688 01 44 43      [10]  581 	ld	bc,#_corazon_roto+0
   468B 21 04 08      [10]  582 	ld	hl,#0x0804
   468E E5            [11]  583 	push	hl
   468F D5            [11]  584 	push	de
   4690 C5            [11]  585 	push	bc
   4691 CD A3 4E      [17]  586 	call	_cpct_drawSpriteMasked
   4694                     587 00109$:
   4694 DD E1         [14]  588 	pop	ix
   4696 C9            [10]  589 	ret
                            590 ;src/main.c:149: void game(){
                            591 ;	---------------------------------
                            592 ; Function game
                            593 ; ---------------------------------
   4697                     594 _game::
   4697 DD E5         [15]  595 	push	ix
   4699 DD 21 00 00   [14]  596 	ld	ix,#0
   469D DD 39         [15]  597 	add	ix,sp
   469F 21 D5 FF      [10]  598 	ld	hl,#-43
   46A2 39            [11]  599 	add	hl,sp
   46A3 F9            [ 6]  600 	ld	sp,hl
                            601 ;src/main.c:150: TPlayer p = { 0,100,20,0,0,6,3 };
   46A4 21 05 00      [10]  602 	ld	hl,#0x0005
   46A7 39            [11]  603 	add	hl,sp
   46A8 36 00         [10]  604 	ld	(hl),#0x00
   46AA 21 05 00      [10]  605 	ld	hl,#0x0005
   46AD 39            [11]  606 	add	hl,sp
   46AE DD 75 F5      [19]  607 	ld	-11 (ix),l
   46B1 DD 74 F6      [19]  608 	ld	-10 (ix),h
   46B4 DD 7E F5      [19]  609 	ld	a,-11 (ix)
   46B7 C6 01         [ 7]  610 	add	a, #0x01
   46B9 DD 77 F3      [19]  611 	ld	-13 (ix),a
   46BC DD 7E F6      [19]  612 	ld	a,-10 (ix)
   46BF CE 00         [ 7]  613 	adc	a, #0x00
   46C1 DD 77 F4      [19]  614 	ld	-12 (ix),a
   46C4 DD 6E F3      [19]  615 	ld	l,-13 (ix)
   46C7 DD 66 F4      [19]  616 	ld	h,-12 (ix)
   46CA 36 64         [10]  617 	ld	(hl),#0x64
   46CC DD 7E F5      [19]  618 	ld	a,-11 (ix)
   46CF C6 02         [ 7]  619 	add	a, #0x02
   46D1 DD 77 F7      [19]  620 	ld	-9 (ix),a
   46D4 DD 7E F6      [19]  621 	ld	a,-10 (ix)
   46D7 CE 00         [ 7]  622 	adc	a, #0x00
   46D9 DD 77 F8      [19]  623 	ld	-8 (ix),a
   46DC DD 6E F7      [19]  624 	ld	l,-9 (ix)
   46DF DD 66 F8      [19]  625 	ld	h,-8 (ix)
   46E2 36 14         [10]  626 	ld	(hl),#0x14
   46E4 23            [ 6]  627 	inc	hl
   46E5 36 00         [10]  628 	ld	(hl),#0x00
   46E7 DD 7E F5      [19]  629 	ld	a,-11 (ix)
   46EA C6 04         [ 7]  630 	add	a, #0x04
   46EC DD 77 ED      [19]  631 	ld	-19 (ix),a
   46EF DD 7E F6      [19]  632 	ld	a,-10 (ix)
   46F2 CE 00         [ 7]  633 	adc	a, #0x00
   46F4 DD 77 EE      [19]  634 	ld	-18 (ix),a
   46F7 DD 6E ED      [19]  635 	ld	l,-19 (ix)
   46FA DD 66 EE      [19]  636 	ld	h,-18 (ix)
   46FD AF            [ 4]  637 	xor	a, a
   46FE 77            [ 7]  638 	ld	(hl), a
   46FF 23            [ 6]  639 	inc	hl
   4700 77            [ 7]  640 	ld	(hl), a
   4701 DD 7E F5      [19]  641 	ld	a,-11 (ix)
   4704 C6 06         [ 7]  642 	add	a, #0x06
   4706 DD 77 F1      [19]  643 	ld	-15 (ix),a
   4709 DD 7E F6      [19]  644 	ld	a,-10 (ix)
   470C CE 00         [ 7]  645 	adc	a, #0x00
   470E DD 77 F2      [19]  646 	ld	-14 (ix),a
   4711 DD 6E F1      [19]  647 	ld	l,-15 (ix)
   4714 DD 66 F2      [19]  648 	ld	h,-14 (ix)
   4717 AF            [ 4]  649 	xor	a, a
   4718 77            [ 7]  650 	ld	(hl), a
   4719 23            [ 6]  651 	inc	hl
   471A 77            [ 7]  652 	ld	(hl), a
   471B DD 7E F5      [19]  653 	ld	a,-11 (ix)
   471E C6 08         [ 7]  654 	add	a, #0x08
   4720 DD 77 FE      [19]  655 	ld	-2 (ix),a
   4723 DD 7E F6      [19]  656 	ld	a,-10 (ix)
   4726 CE 00         [ 7]  657 	adc	a, #0x00
   4728 DD 77 FF      [19]  658 	ld	-1 (ix),a
   472B DD 6E FE      [19]  659 	ld	l,-2 (ix)
   472E DD 66 FF      [19]  660 	ld	h,-1 (ix)
   4731 36 06         [10]  661 	ld	(hl),#0x06
   4733 23            [ 6]  662 	inc	hl
   4734 36 00         [10]  663 	ld	(hl),#0x00
   4736 DD 7E F5      [19]  664 	ld	a,-11 (ix)
   4739 C6 0A         [ 7]  665 	add	a, #0x0A
   473B DD 77 FC      [19]  666 	ld	-4 (ix),a
   473E DD 7E F6      [19]  667 	ld	a,-10 (ix)
   4741 CE 00         [ 7]  668 	adc	a, #0x00
   4743 DD 77 FD      [19]  669 	ld	-3 (ix),a
   4746 DD 6E FC      [19]  670 	ld	l,-4 (ix)
   4749 DD 66 FD      [19]  671 	ld	h,-3 (ix)
   474C 36 03         [10]  672 	ld	(hl),#0x03
   474E 23            [ 6]  673 	inc	hl
   474F 36 00         [10]  674 	ld	(hl),#0x00
                            675 ;src/main.c:151: TEnemy  e = { 55,100,0 };
   4751 21 00 00      [10]  676 	ld	hl,#0x0000
   4754 39            [11]  677 	add	hl,sp
   4755 36 37         [10]  678 	ld	(hl),#0x37
   4757 21 00 00      [10]  679 	ld	hl,#0x0000
   475A 39            [11]  680 	add	hl,sp
   475B DD 75 EF      [19]  681 	ld	-17 (ix),l
   475E DD 74 F0      [19]  682 	ld	-16 (ix),h
   4761 DD 7E EF      [19]  683 	ld	a,-17 (ix)
   4764 C6 01         [ 7]  684 	add	a, #0x01
   4766 DD 77 E9      [19]  685 	ld	-23 (ix),a
   4769 DD 7E F0      [19]  686 	ld	a,-16 (ix)
   476C CE 00         [ 7]  687 	adc	a, #0x00
   476E DD 77 EA      [19]  688 	ld	-22 (ix),a
   4771 DD 6E E9      [19]  689 	ld	l,-23 (ix)
   4774 DD 66 EA      [19]  690 	ld	h,-22 (ix)
   4777 36 64         [10]  691 	ld	(hl),#0x64
   4779 DD 7E EF      [19]  692 	ld	a,-17 (ix)
   477C C6 02         [ 7]  693 	add	a, #0x02
   477E DD 77 EB      [19]  694 	ld	-21 (ix),a
   4781 DD 7E F0      [19]  695 	ld	a,-16 (ix)
   4784 CE 00         [ 7]  696 	adc	a, #0x00
   4786 DD 77 EC      [19]  697 	ld	-20 (ix),a
   4789 DD 6E EB      [19]  698 	ld	l,-21 (ix)
   478C DD 66 EC      [19]  699 	ld	h,-20 (ix)
   478F 36 00         [10]  700 	ld	(hl),#0x00
                            701 ;src/main.c:156: cpct_clearScreen(0);
   4791 21 00 40      [10]  702 	ld	hl,#0x4000
   4794 E5            [11]  703 	push	hl
   4795 AF            [ 4]  704 	xor	a, a
   4796 F5            [11]  705 	push	af
   4797 33            [ 6]  706 	inc	sp
   4798 26 C0         [ 7]  707 	ld	h, #0xC0
   479A E5            [11]  708 	push	hl
   479B CD 07 4F      [17]  709 	call	_cpct_memset
                            710 ;src/main.c:158: while (1){
   479E                     711 00169$:
                            712 ;src/main.c:161: cpct_waitVSYNC();
   479E CD ED 4E      [17]  713 	call	_cpct_waitVSYNC
                            714 ;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   47A1 DD 6E F3      [19]  715 	ld	l,-13 (ix)
   47A4 DD 66 F4      [19]  716 	ld	h,-12 (ix)
   47A7 46            [ 7]  717 	ld	b,(hl)
   47A8 DD 6E F5      [19]  718 	ld	l,-11 (ix)
   47AB DD 66 F6      [19]  719 	ld	h,-10 (ix)
   47AE 4E            [ 7]  720 	ld	c, (hl)
   47AF C5            [11]  721 	push	bc
   47B0 21 00 C0      [10]  722 	ld	hl,#0xC000
   47B3 E5            [11]  723 	push	hl
   47B4 CD E1 4F      [17]  724 	call	_cpct_getScreenPtr
   47B7 EB            [ 4]  725 	ex	de,hl
                            726 ;src/main.c:165: if(p.atk <= 20)
   47B8 DD 6E F7      [19]  727 	ld	l,-9 (ix)
   47BB DD 66 F8      [19]  728 	ld	h,-8 (ix)
   47BE 46            [ 7]  729 	ld	b,(hl)
   47BF 23            [ 6]  730 	inc	hl
   47C0 66            [ 7]  731 	ld	h,(hl)
                            732 ;src/main.c:166: cpct_drawSolidBox(memptr,0,4,16);
                            733 ;src/main.c:165: if(p.atk <= 20)
   47C1 3E 14         [ 7]  734 	ld	a,#0x14
   47C3 B8            [ 4]  735 	cp	a, b
   47C4 3E 00         [ 7]  736 	ld	a,#0x00
   47C6 9C            [ 4]  737 	sbc	a, h
   47C7 38 10         [12]  738 	jr	C,00102$
                            739 ;src/main.c:166: cpct_drawSolidBox(memptr,0,4,16);
   47C9 21 04 10      [10]  740 	ld	hl,#0x1004
   47CC E5            [11]  741 	push	hl
   47CD AF            [ 4]  742 	xor	a, a
   47CE F5            [11]  743 	push	af
   47CF 33            [ 6]  744 	inc	sp
   47D0 D5            [11]  745 	push	de
   47D1 CD 29 4F      [17]  746 	call	_cpct_drawSolidBox
   47D4 F1            [10]  747 	pop	af
   47D5 F1            [10]  748 	pop	af
   47D6 33            [ 6]  749 	inc	sp
   47D7 18 0E         [12]  750 	jr	00103$
   47D9                     751 00102$:
                            752 ;src/main.c:168: cpct_drawSolidBox(memptr,0,5,16);
   47D9 21 05 10      [10]  753 	ld	hl,#0x1005
   47DC E5            [11]  754 	push	hl
   47DD AF            [ 4]  755 	xor	a, a
   47DE F5            [11]  756 	push	af
   47DF 33            [ 6]  757 	inc	sp
   47E0 D5            [11]  758 	push	de
   47E1 CD 29 4F      [17]  759 	call	_cpct_drawSolidBox
   47E4 F1            [10]  760 	pop	af
   47E5 F1            [10]  761 	pop	af
   47E6 33            [ 6]  762 	inc	sp
   47E7                     763 00103$:
                            764 ;src/main.c:170: memptr = cpct_getScreenPtr(VMEM,55,160);
   47E7 21 37 A0      [10]  765 	ld	hl,#0xA037
   47EA E5            [11]  766 	push	hl
   47EB 21 00 C0      [10]  767 	ld	hl,#0xC000
   47EE E5            [11]  768 	push	hl
   47EF CD E1 4F      [17]  769 	call	_cpct_getScreenPtr
                            770 ;src/main.c:171: cpct_drawSolidBox(memptr,0,15,16);
   47F2 EB            [ 4]  771 	ex	de,hl
   47F3 21 0F 10      [10]  772 	ld	hl,#0x100F
   47F6 E5            [11]  773 	push	hl
   47F7 AF            [ 4]  774 	xor	a, a
   47F8 F5            [11]  775 	push	af
   47F9 33            [ 6]  776 	inc	sp
   47FA D5            [11]  777 	push	de
   47FB CD 29 4F      [17]  778 	call	_cpct_drawSolidBox
   47FE F1            [10]  779 	pop	af
   47FF F1            [10]  780 	pop	af
   4800 33            [ 6]  781 	inc	sp
                            782 ;src/main.c:173: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4801 DD 6E E9      [19]  783 	ld	l,-23 (ix)
   4804 DD 66 EA      [19]  784 	ld	h,-22 (ix)
   4807 46            [ 7]  785 	ld	b,(hl)
   4808 DD 6E EF      [19]  786 	ld	l,-17 (ix)
   480B DD 66 F0      [19]  787 	ld	h,-16 (ix)
   480E 4E            [ 7]  788 	ld	c, (hl)
   480F C5            [11]  789 	push	bc
   4810 21 00 C0      [10]  790 	ld	hl,#0xC000
   4813 E5            [11]  791 	push	hl
   4814 CD E1 4F      [17]  792 	call	_cpct_getScreenPtr
   4817 EB            [ 4]  793 	ex	de,hl
                            794 ;src/main.c:174: if(e.vivo == 0)
   4818 DD 6E EB      [19]  795 	ld	l,-21 (ix)
   481B DD 66 EC      [19]  796 	ld	h,-20 (ix)
   481E 7E            [ 7]  797 	ld	a,(hl)
   481F B7            [ 4]  798 	or	a, a
   4820 20 0E         [12]  799 	jr	NZ,00105$
                            800 ;src/main.c:175: cpct_drawSolidBox(memptr,0,4,16);
   4822 21 04 10      [10]  801 	ld	hl,#0x1004
   4825 E5            [11]  802 	push	hl
   4826 AF            [ 4]  803 	xor	a, a
   4827 F5            [11]  804 	push	af
   4828 33            [ 6]  805 	inc	sp
   4829 D5            [11]  806 	push	de
   482A CD 29 4F      [17]  807 	call	_cpct_drawSolidBox
   482D F1            [10]  808 	pop	af
   482E F1            [10]  809 	pop	af
   482F 33            [ 6]  810 	inc	sp
   4830                     811 00105$:
                            812 ;src/main.c:178: if(p.col != 2){
   4830 DD 6E F1      [19]  813 	ld	l,-15 (ix)
   4833 DD 66 F2      [19]  814 	ld	h,-14 (ix)
   4836 56            [ 7]  815 	ld	d,(hl)
   4837 23            [ 6]  816 	inc	hl
   4838 66            [ 7]  817 	ld	h,(hl)
   4839 7A            [ 4]  818 	ld	a,d
   483A D6 02         [ 7]  819 	sub	a,#0x02
   483C 20 04         [12]  820 	jr	NZ,00297$
   483E B4            [ 4]  821 	or	a,h
   483F CA DD 49      [10]  822 	jp	Z,00146$
   4842                     823 00297$:
                            824 ;src/main.c:179: cpct_scanKeyboard_f();
   4842 CD 54 4D      [17]  825 	call	_cpct_scanKeyboard_f
                            826 ;src/main.c:180: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   4845 21 05 80      [10]  827 	ld	hl,#0x8005
   4848 CD 48 4D      [17]  828 	call	_cpct_isKeyPressed
   484B DD 75 FB      [19]  829 	ld	-5 (ix),l
                            830 ;src/main.c:165: if(p.atk <= 20)
   484E DD 6E F7      [19]  831 	ld	l,-9 (ix)
   4851 DD 66 F8      [19]  832 	ld	h,-8 (ix)
   4854 7E            [ 7]  833 	ld	a,(hl)
   4855 DD 77 F9      [19]  834 	ld	-7 (ix),a
   4858 23            [ 6]  835 	inc	hl
   4859 7E            [ 7]  836 	ld	a,(hl)
   485A DD 77 FA      [19]  837 	ld	-6 (ix),a
                            838 ;src/main.c:180: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   485D DD 7E F9      [19]  839 	ld	a,-7 (ix)
   4860 D6 14         [ 7]  840 	sub	a, #0x14
   4862 DD 7E FA      [19]  841 	ld	a,-6 (ix)
   4865 DE 00         [ 7]  842 	sbc	a, #0x00
   4867 3E 00         [ 7]  843 	ld	a,#0x00
   4869 17            [ 4]  844 	rla
   486A DD 77 E6      [19]  845 	ld	-26 (ix),a
                            846 ;src/main.c:184: p.atk += 1;
   486D DD 7E F9      [19]  847 	ld	a,-7 (ix)
   4870 C6 01         [ 7]  848 	add	a, #0x01
   4872 DD 77 E7      [19]  849 	ld	-25 (ix),a
   4875 DD 7E FA      [19]  850 	ld	a,-6 (ix)
   4878 CE 00         [ 7]  851 	adc	a, #0x00
   487A DD 77 E8      [19]  852 	ld	-24 (ix),a
                            853 ;src/main.c:180: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   487D DD 7E FB      [19]  854 	ld	a,-5 (ix)
   4880 B7            [ 4]  855 	or	a, a
   4881 28 5D         [12]  856 	jr	Z,00140$
   4883 DD 7E E6      [19]  857 	ld	a,-26 (ix)
   4886 B7            [ 4]  858 	or	a, a
   4887 20 57         [12]  859 	jr	NZ,00140$
                            860 ;src/main.c:181: if(p.atk >= 50)
   4889 DD 7E F9      [19]  861 	ld	a,-7 (ix)
   488C D6 32         [ 7]  862 	sub	a, #0x32
   488E DD 7E FA      [19]  863 	ld	a,-6 (ix)
   4891 DE 00         [ 7]  864 	sbc	a, #0x00
   4893 38 0C         [12]  865 	jr	C,00107$
                            866 ;src/main.c:182: p.atk = 0;
   4895 DD 6E F7      [19]  867 	ld	l,-9 (ix)
   4898 DD 66 F8      [19]  868 	ld	h,-8 (ix)
   489B AF            [ 4]  869 	xor	a, a
   489C 77            [ 7]  870 	ld	(hl), a
   489D 23            [ 6]  871 	inc	hl
   489E 77            [ 7]  872 	ld	(hl), a
   489F 18 0F         [12]  873 	jr	00108$
   48A1                     874 00107$:
                            875 ;src/main.c:184: p.atk += 1;
   48A1 DD 6E F7      [19]  876 	ld	l,-9 (ix)
   48A4 DD 66 F8      [19]  877 	ld	h,-8 (ix)
   48A7 DD 7E E7      [19]  878 	ld	a,-25 (ix)
   48AA 77            [ 7]  879 	ld	(hl),a
   48AB 23            [ 6]  880 	inc	hl
   48AC DD 7E E8      [19]  881 	ld	a,-24 (ix)
   48AF 77            [ 7]  882 	ld	(hl),a
   48B0                     883 00108$:
                            884 ;src/main.c:185: if(cpct_isKeyPressed(Key_CursorRight))
   48B0 21 00 02      [10]  885 	ld	hl,#0x0200
   48B3 CD 48 4D      [17]  886 	call	_cpct_isKeyPressed
   48B6 7D            [ 4]  887 	ld	a,l
   48B7 B7            [ 4]  888 	or	a, a
   48B8 28 0D         [12]  889 	jr	Z,00112$
                            890 ;src/main.c:186: p.dir = 0;
   48BA DD 6E ED      [19]  891 	ld	l,-19 (ix)
   48BD DD 66 EE      [19]  892 	ld	h,-18 (ix)
   48C0 AF            [ 4]  893 	xor	a, a
   48C1 77            [ 7]  894 	ld	(hl), a
   48C2 23            [ 6]  895 	inc	hl
   48C3 77            [ 7]  896 	ld	(hl), a
   48C4 C3 1A 4A      [10]  897 	jp	00147$
   48C7                     898 00112$:
                            899 ;src/main.c:187: else if(cpct_isKeyPressed(Key_CursorLeft))
   48C7 21 01 01      [10]  900 	ld	hl,#0x0101
   48CA CD 48 4D      [17]  901 	call	_cpct_isKeyPressed
   48CD 7D            [ 4]  902 	ld	a,l
   48CE B7            [ 4]  903 	or	a, a
   48CF CA 1A 4A      [10]  904 	jp	Z,00147$
                            905 ;src/main.c:188: p.dir = 1;
   48D2 DD 6E ED      [19]  906 	ld	l,-19 (ix)
   48D5 DD 66 EE      [19]  907 	ld	h,-18 (ix)
   48D8 36 01         [10]  908 	ld	(hl),#0x01
   48DA 23            [ 6]  909 	inc	hl
   48DB 36 00         [10]  910 	ld	(hl),#0x00
   48DD C3 1A 4A      [10]  911 	jp	00147$
   48E0                     912 00140$:
                            913 ;src/main.c:190: if(p.atk < 20)
   48E0 DD 7E E6      [19]  914 	ld	a,-26 (ix)
   48E3 B7            [ 4]  915 	or	a, a
   48E4 28 11         [12]  916 	jr	Z,00115$
                            917 ;src/main.c:191: p.atk += 1;
   48E6 DD 6E F7      [19]  918 	ld	l,-9 (ix)
   48E9 DD 66 F8      [19]  919 	ld	h,-8 (ix)
   48EC DD 7E E7      [19]  920 	ld	a,-25 (ix)
   48EF 77            [ 7]  921 	ld	(hl),a
   48F0 23            [ 6]  922 	inc	hl
   48F1 DD 7E E8      [19]  923 	ld	a,-24 (ix)
   48F4 77            [ 7]  924 	ld	(hl),a
   48F5 18 0B         [12]  925 	jr	00116$
   48F7                     926 00115$:
                            927 ;src/main.c:193: p.atk = 20;
   48F7 DD 6E F7      [19]  928 	ld	l,-9 (ix)
   48FA DD 66 F8      [19]  929 	ld	h,-8 (ix)
   48FD 36 14         [10]  930 	ld	(hl),#0x14
   48FF 23            [ 6]  931 	inc	hl
   4900 36 00         [10]  932 	ld	(hl),#0x00
   4902                     933 00116$:
                            934 ;src/main.c:194: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4902 21 00 02      [10]  935 	ld	hl,#0x0200
   4905 CD 48 4D      [17]  936 	call	_cpct_isKeyPressed
   4908 7D            [ 4]  937 	ld	a,l
   4909 B7            [ 4]  938 	or	a, a
   490A 28 32         [12]  939 	jr	Z,00136$
   490C DD 6E F5      [19]  940 	ld	l,-11 (ix)
   490F DD 66 F6      [19]  941 	ld	h,-10 (ix)
   4912 56            [ 7]  942 	ld	d,(hl)
   4913 7A            [ 4]  943 	ld	a,d
   4914 D6 4C         [ 7]  944 	sub	a, #0x4C
   4916 30 26         [12]  945 	jr	NC,00136$
                            946 ;src/main.c:195: if(p.col != 2)
   4918 DD 6E F1      [19]  947 	ld	l,-15 (ix)
   491B DD 66 F2      [19]  948 	ld	h,-14 (ix)
   491E 5E            [ 7]  949 	ld	e,(hl)
   491F 23            [ 6]  950 	inc	hl
   4920 66            [ 7]  951 	ld	h,(hl)
   4921 7B            [ 4]  952 	ld	a,e
   4922 D6 02         [ 7]  953 	sub	a,#0x02
   4924 20 03         [12]  954 	jr	NZ,00298$
   4926 B4            [ 4]  955 	or	a,h
   4927 28 08         [12]  956 	jr	Z,00118$
   4929                     957 00298$:
                            958 ;src/main.c:196: p.x += 1;
   4929 14            [ 4]  959 	inc	d
   492A DD 6E F5      [19]  960 	ld	l,-11 (ix)
   492D DD 66 F6      [19]  961 	ld	h,-10 (ix)
   4930 72            [ 7]  962 	ld	(hl),d
   4931                     963 00118$:
                            964 ;src/main.c:197: p.dir = 0;
   4931 DD 6E ED      [19]  965 	ld	l,-19 (ix)
   4934 DD 66 EE      [19]  966 	ld	h,-18 (ix)
   4937 AF            [ 4]  967 	xor	a, a
   4938 77            [ 7]  968 	ld	(hl), a
   4939 23            [ 6]  969 	inc	hl
   493A 77            [ 7]  970 	ld	(hl), a
   493B C3 1A 4A      [10]  971 	jp	00147$
   493E                     972 00136$:
                            973 ;src/main.c:198: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   493E 21 01 01      [10]  974 	ld	hl,#0x0101
   4941 CD 48 4D      [17]  975 	call	_cpct_isKeyPressed
   4944 7D            [ 4]  976 	ld	a,l
   4945 B7            [ 4]  977 	or	a, a
   4946 28 32         [12]  978 	jr	Z,00132$
   4948 DD 6E F5      [19]  979 	ld	l,-11 (ix)
   494B DD 66 F6      [19]  980 	ld	h,-10 (ix)
   494E 56            [ 7]  981 	ld	d,(hl)
   494F 7A            [ 4]  982 	ld	a,d
   4950 B7            [ 4]  983 	or	a, a
   4951 28 27         [12]  984 	jr	Z,00132$
                            985 ;src/main.c:199: if(p.col != 2)
   4953 DD 6E F1      [19]  986 	ld	l,-15 (ix)
   4956 DD 66 F2      [19]  987 	ld	h,-14 (ix)
   4959 5E            [ 7]  988 	ld	e,(hl)
   495A 23            [ 6]  989 	inc	hl
   495B 66            [ 7]  990 	ld	h,(hl)
   495C 7B            [ 4]  991 	ld	a,e
   495D D6 02         [ 7]  992 	sub	a,#0x02
   495F 20 03         [12]  993 	jr	NZ,00299$
   4961 B4            [ 4]  994 	or	a,h
   4962 28 08         [12]  995 	jr	Z,00120$
   4964                     996 00299$:
                            997 ;src/main.c:200: p.x -= 1;
   4964 15            [ 4]  998 	dec	d
   4965 DD 6E F5      [19]  999 	ld	l,-11 (ix)
   4968 DD 66 F6      [19] 1000 	ld	h,-10 (ix)
   496B 72            [ 7] 1001 	ld	(hl),d
   496C                    1002 00120$:
                           1003 ;src/main.c:201: p.dir = 1;
   496C DD 6E ED      [19] 1004 	ld	l,-19 (ix)
   496F DD 66 EE      [19] 1005 	ld	h,-18 (ix)
   4972 36 01         [10] 1006 	ld	(hl),#0x01
   4974 23            [ 6] 1007 	inc	hl
   4975 36 00         [10] 1008 	ld	(hl),#0x00
   4977 C3 1A 4A      [10] 1009 	jp	00147$
   497A                    1010 00132$:
                           1011 ;src/main.c:202: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   497A 21 00 04      [10] 1012 	ld	hl,#0x0400
   497D CD 48 4D      [17] 1013 	call	_cpct_isKeyPressed
   4980 7D            [ 4] 1014 	ld	a,l
   4981 B7            [ 4] 1015 	or	a, a
   4982 28 22         [12] 1016 	jr	Z,00128$
                           1017 ;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4984 DD 6E F3      [19] 1018 	ld	l,-13 (ix)
   4987 DD 66 F4      [19] 1019 	ld	h,-12 (ix)
   498A 56            [ 7] 1020 	ld	d,(hl)
                           1021 ;src/main.c:202: }else if(cpct_isKeyPressed(Key_CursorDown) && p.y < 184 ){
   498B 7A            [ 4] 1022 	ld	a,d
   498C D6 B8         [ 7] 1023 	sub	a, #0xB8
   498E 30 16         [12] 1024 	jr	NC,00128$
                           1025 ;src/main.c:203: p.y += 2;
   4990 14            [ 4] 1026 	inc	d
   4991 14            [ 4] 1027 	inc	d
   4992 DD 6E F3      [19] 1028 	ld	l,-13 (ix)
   4995 DD 66 F4      [19] 1029 	ld	h,-12 (ix)
   4998 72            [ 7] 1030 	ld	(hl),d
                           1031 ;src/main.c:204: p.dir = 2;
   4999 DD 6E ED      [19] 1032 	ld	l,-19 (ix)
   499C DD 66 EE      [19] 1033 	ld	h,-18 (ix)
   499F 36 02         [10] 1034 	ld	(hl),#0x02
   49A1 23            [ 6] 1035 	inc	hl
   49A2 36 00         [10] 1036 	ld	(hl),#0x00
   49A4 18 74         [12] 1037 	jr	00147$
   49A6                    1038 00128$:
                           1039 ;src/main.c:205: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   49A6 21 00 01      [10] 1040 	ld	hl,#0x0100
   49A9 CD 48 4D      [17] 1041 	call	_cpct_isKeyPressed
   49AC 7D            [ 4] 1042 	ld	a,l
   49AD B7            [ 4] 1043 	or	a, a
   49AE 28 20         [12] 1044 	jr	Z,00124$
                           1045 ;src/main.c:164: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   49B0 DD 6E F3      [19] 1046 	ld	l,-13 (ix)
   49B3 DD 66 F4      [19] 1047 	ld	h,-12 (ix)
   49B6 7E            [ 7] 1048 	ld	a,(hl)
                           1049 ;src/main.c:205: }else if(cpct_isKeyPressed(Key_CursorUp) && p.y > 0 ){
   49B7 B7            [ 4] 1050 	or	a, a
   49B8 28 16         [12] 1051 	jr	Z,00124$
                           1052 ;src/main.c:206: p.y -= 2;
   49BA C6 FE         [ 7] 1053 	add	a,#0xFE
   49BC DD 6E F3      [19] 1054 	ld	l,-13 (ix)
   49BF DD 66 F4      [19] 1055 	ld	h,-12 (ix)
   49C2 77            [ 7] 1056 	ld	(hl),a
                           1057 ;src/main.c:207: p.dir = 3;
   49C3 DD 6E ED      [19] 1058 	ld	l,-19 (ix)
   49C6 DD 66 EE      [19] 1059 	ld	h,-18 (ix)
   49C9 36 03         [10] 1060 	ld	(hl),#0x03
   49CB 23            [ 6] 1061 	inc	hl
   49CC 36 00         [10] 1062 	ld	(hl),#0x00
   49CE 18 4A         [12] 1063 	jr	00147$
   49D0                    1064 00124$:
                           1065 ;src/main.c:208: }else  if(cpct_isKeyPressed(Key_Esc)){
   49D0 21 08 04      [10] 1066 	ld	hl,#0x0408
   49D3 CD 48 4D      [17] 1067 	call	_cpct_isKeyPressed
   49D6 7D            [ 4] 1068 	ld	a,l
   49D7 B7            [ 4] 1069 	or	a, a
   49D8 28 40         [12] 1070 	jr	Z,00147$
                           1071 ;src/main.c:209: return;
   49DA C3 D4 4B      [10] 1072 	jp	00171$
   49DD                    1073 00146$:
                           1074 ;src/main.c:213: p.x -= 2;
   49DD DD 6E F5      [19] 1075 	ld	l,-11 (ix)
   49E0 DD 66 F6      [19] 1076 	ld	h,-10 (ix)
   49E3 7E            [ 7] 1077 	ld	a,(hl)
   49E4 C6 FE         [ 7] 1078 	add	a,#0xFE
   49E6 DD 6E F5      [19] 1079 	ld	l,-11 (ix)
   49E9 DD 66 F6      [19] 1080 	ld	h,-10 (ix)
   49EC 77            [ 7] 1081 	ld	(hl),a
                           1082 ;src/main.c:214: p.rebote -= 2;
   49ED DD 6E FE      [19] 1083 	ld	l,-2 (ix)
   49F0 DD 66 FF      [19] 1084 	ld	h,-1 (ix)
   49F3 5E            [ 7] 1085 	ld	e,(hl)
   49F4 23            [ 6] 1086 	inc	hl
   49F5 56            [ 7] 1087 	ld	d,(hl)
   49F6 1B            [ 6] 1088 	dec	de
   49F7 1B            [ 6] 1089 	dec	de
   49F8 DD 6E FE      [19] 1090 	ld	l,-2 (ix)
   49FB DD 66 FF      [19] 1091 	ld	h,-1 (ix)
   49FE 73            [ 7] 1092 	ld	(hl),e
   49FF 23            [ 6] 1093 	inc	hl
   4A00 72            [ 7] 1094 	ld	(hl),d
                           1095 ;src/main.c:215: if(p.rebote == 0){
   4A01 7A            [ 4] 1096 	ld	a,d
   4A02 B3            [ 4] 1097 	or	a,e
   4A03 20 15         [12] 1098 	jr	NZ,00147$
                           1099 ;src/main.c:216: p.rebote = 6;
   4A05 DD 6E FE      [19] 1100 	ld	l,-2 (ix)
   4A08 DD 66 FF      [19] 1101 	ld	h,-1 (ix)
   4A0B 36 06         [10] 1102 	ld	(hl),#0x06
   4A0D 23            [ 6] 1103 	inc	hl
   4A0E 36 00         [10] 1104 	ld	(hl),#0x00
                           1105 ;src/main.c:217: p.col = 0;
   4A10 DD 6E F1      [19] 1106 	ld	l,-15 (ix)
   4A13 DD 66 F2      [19] 1107 	ld	h,-14 (ix)
   4A16 AF            [ 4] 1108 	xor	a, a
   4A17 77            [ 7] 1109 	ld	(hl), a
   4A18 23            [ 6] 1110 	inc	hl
   4A19 77            [ 7] 1111 	ld	(hl), a
   4A1A                    1112 00147$:
                           1113 ;src/main.c:222: sprite = checkSprite(p.atk,p.dir);
   4A1A DD 6E ED      [19] 1114 	ld	l,-19 (ix)
   4A1D DD 66 EE      [19] 1115 	ld	h,-18 (ix)
   4A20 4E            [ 7] 1116 	ld	c,(hl)
   4A21 23            [ 6] 1117 	inc	hl
   4A22 46            [ 7] 1118 	ld	b,(hl)
   4A23 DD 6E F7      [19] 1119 	ld	l,-9 (ix)
   4A26 DD 66 F8      [19] 1120 	ld	h,-8 (ix)
   4A29 5E            [ 7] 1121 	ld	e,(hl)
   4A2A 23            [ 6] 1122 	inc	hl
   4A2B 56            [ 7] 1123 	ld	d,(hl)
   4A2C C5            [11] 1124 	push	bc
   4A2D D5            [11] 1125 	push	de
   4A2E CD D5 44      [17] 1126 	call	_checkSprite
   4A31 F1            [10] 1127 	pop	af
   4A32 F1            [10] 1128 	pop	af
   4A33 DD 75 D8      [19] 1129 	ld	-40 (ix),l
   4A36 DD 74 D9      [19] 1130 	ld	-39 (ix),h
                           1131 ;src/main.c:224: if(p.col != 2 && e.vivo == 0){
   4A39 DD 6E F1      [19] 1132 	ld	l,-15 (ix)
   4A3C DD 66 F2      [19] 1133 	ld	h,-14 (ix)
   4A3F 56            [ 7] 1134 	ld	d,(hl)
   4A40 23            [ 6] 1135 	inc	hl
   4A41 66            [ 7] 1136 	ld	h,(hl)
   4A42 7A            [ 4] 1137 	ld	a,d
   4A43 D6 02         [ 7] 1138 	sub	a,#0x02
   4A45 20 04         [12] 1139 	jr	NZ,00300$
   4A47 B4            [ 4] 1140 	or	a,h
   4A48 CA E1 4A      [10] 1141 	jp	Z,00153$
   4A4B                    1142 00300$:
   4A4B DD 6E EB      [19] 1143 	ld	l,-21 (ix)
   4A4E DD 66 EC      [19] 1144 	ld	h,-20 (ix)
   4A51 7E            [ 7] 1145 	ld	a,(hl)
   4A52 B7            [ 4] 1146 	or	a, a
   4A53 C2 E1 4A      [10] 1147 	jp	NZ,00153$
                           1148 ;src/main.c:225: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
   4A56 DD 6E F7      [19] 1149 	ld	l,-9 (ix)
   4A59 DD 66 F8      [19] 1150 	ld	h,-8 (ix)
   4A5C 4E            [ 7] 1151 	ld	c,(hl)
   4A5D 23            [ 6] 1152 	inc	hl
   4A5E 46            [ 7] 1153 	ld	b,(hl)
   4A5F DD 6E ED      [19] 1154 	ld	l,-19 (ix)
   4A62 DD 66 EE      [19] 1155 	ld	h,-18 (ix)
   4A65 7E            [ 7] 1156 	ld	a,(hl)
   4A66 DD 77 E7      [19] 1157 	ld	-25 (ix),a
   4A69 23            [ 6] 1158 	inc	hl
   4A6A 7E            [ 7] 1159 	ld	a,(hl)
   4A6B DD 77 E8      [19] 1160 	ld	-24 (ix),a
   4A6E DD 6E E9      [19] 1161 	ld	l,-23 (ix)
   4A71 DD 66 EA      [19] 1162 	ld	h,-22 (ix)
   4A74 5E            [ 7] 1163 	ld	e,(hl)
   4A75 DD 6E EF      [19] 1164 	ld	l,-17 (ix)
   4A78 DD 66 F0      [19] 1165 	ld	h,-16 (ix)
   4A7B 7E            [ 7] 1166 	ld	a,(hl)
   4A7C DD 77 E6      [19] 1167 	ld	-26 (ix),a
   4A7F DD 6E F3      [19] 1168 	ld	l,-13 (ix)
   4A82 DD 66 F4      [19] 1169 	ld	h,-12 (ix)
   4A85 7E            [ 7] 1170 	ld	a,(hl)
   4A86 DD 77 F9      [19] 1171 	ld	-7 (ix),a
   4A89 DD 6E F5      [19] 1172 	ld	l,-11 (ix)
   4A8C DD 66 F6      [19] 1173 	ld	h,-10 (ix)
   4A8F 56            [ 7] 1174 	ld	d,(hl)
   4A90 C5            [11] 1175 	push	bc
   4A91 DD 6E E7      [19] 1176 	ld	l,-25 (ix)
   4A94 DD 66 E8      [19] 1177 	ld	h,-24 (ix)
   4A97 E5            [11] 1178 	push	hl
   4A98 7B            [ 4] 1179 	ld	a,e
   4A99 F5            [11] 1180 	push	af
   4A9A 33            [ 6] 1181 	inc	sp
   4A9B DD 7E E6      [19] 1182 	ld	a,-26 (ix)
   4A9E F5            [11] 1183 	push	af
   4A9F 33            [ 6] 1184 	inc	sp
   4AA0 DD 7E F9      [19] 1185 	ld	a,-7 (ix)
   4AA3 F5            [11] 1186 	push	af
   4AA4 33            [ 6] 1187 	inc	sp
   4AA5 D5            [11] 1188 	push	de
   4AA6 33            [ 6] 1189 	inc	sp
   4AA7 CD 19 44      [17] 1190 	call	_checkCollisions
   4AAA F1            [10] 1191 	pop	af
   4AAB F1            [10] 1192 	pop	af
   4AAC F1            [10] 1193 	pop	af
   4AAD F1            [10] 1194 	pop	af
   4AAE 55            [ 4] 1195 	ld	d,l
   4AAF 5C            [ 4] 1196 	ld	e,h
   4AB0 DD 6E F1      [19] 1197 	ld	l,-15 (ix)
   4AB3 DD 66 F2      [19] 1198 	ld	h,-14 (ix)
   4AB6 72            [ 7] 1199 	ld	(hl),d
   4AB7 23            [ 6] 1200 	inc	hl
   4AB8 73            [ 7] 1201 	ld	(hl),e
                           1202 ;src/main.c:226: if(p.col == 2)
   4AB9 7A            [ 4] 1203 	ld	a,d
   4ABA D6 02         [ 7] 1204 	sub	a,#0x02
   4ABC 20 16         [12] 1205 	jr	NZ,00149$
   4ABE B3            [ 4] 1206 	or	a,e
   4ABF 20 13         [12] 1207 	jr	NZ,00149$
                           1208 ;src/main.c:227: p.life--;
   4AC1 DD 6E FC      [19] 1209 	ld	l,-4 (ix)
   4AC4 DD 66 FD      [19] 1210 	ld	h,-3 (ix)
   4AC7 5E            [ 7] 1211 	ld	e,(hl)
   4AC8 23            [ 6] 1212 	inc	hl
   4AC9 56            [ 7] 1213 	ld	d,(hl)
   4ACA 1B            [ 6] 1214 	dec	de
   4ACB DD 6E FC      [19] 1215 	ld	l,-4 (ix)
   4ACE DD 66 FD      [19] 1216 	ld	h,-3 (ix)
   4AD1 73            [ 7] 1217 	ld	(hl),e
   4AD2 23            [ 6] 1218 	inc	hl
   4AD3 72            [ 7] 1219 	ld	(hl),d
   4AD4                    1220 00149$:
                           1221 ;src/main.c:228: if(p.life == 0)
   4AD4 DD 6E FC      [19] 1222 	ld	l,-4 (ix)
   4AD7 DD 66 FD      [19] 1223 	ld	h,-3 (ix)
   4ADA 56            [ 7] 1224 	ld	d,(hl)
   4ADB 23            [ 6] 1225 	inc	hl
   4ADC 7E            [ 7] 1226 	ld	a, (hl)
   4ADD B2            [ 4] 1227 	or	a,d
                           1228 ;src/main.c:229: return;
   4ADE CA D4 4B      [10] 1229 	jp	Z,00171$
   4AE1                    1230 00153$:
                           1231 ;src/main.c:231: if(p.col == 1)
   4AE1 DD 6E F1      [19] 1232 	ld	l,-15 (ix)
   4AE4 DD 66 F2      [19] 1233 	ld	h,-14 (ix)
   4AE7 56            [ 7] 1234 	ld	d,(hl)
   4AE8 23            [ 6] 1235 	inc	hl
   4AE9 66            [ 7] 1236 	ld	h,(hl)
   4AEA 15            [ 4] 1237 	dec	d
   4AEB 20 0C         [12] 1238 	jr	NZ,00156$
   4AED 7C            [ 4] 1239 	ld	a,h
   4AEE B7            [ 4] 1240 	or	a, a
   4AEF 20 08         [12] 1241 	jr	NZ,00156$
                           1242 ;src/main.c:232: e.vivo = 1;
   4AF1 DD 6E EB      [19] 1243 	ld	l,-21 (ix)
   4AF4 DD 66 EC      [19] 1244 	ld	h,-20 (ix)
   4AF7 36 01         [10] 1245 	ld	(hl),#0x01
   4AF9                    1246 00156$:
                           1247 ;src/main.c:235: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4AF9 DD 6E F3      [19] 1248 	ld	l,-13 (ix)
   4AFC DD 66 F4      [19] 1249 	ld	h,-12 (ix)
   4AFF 46            [ 7] 1250 	ld	b,(hl)
   4B00 DD 6E F5      [19] 1251 	ld	l,-11 (ix)
   4B03 DD 66 F6      [19] 1252 	ld	h,-10 (ix)
   4B06 4E            [ 7] 1253 	ld	c, (hl)
   4B07 C5            [11] 1254 	push	bc
   4B08 21 00 C0      [10] 1255 	ld	hl,#0xC000
   4B0B E5            [11] 1256 	push	hl
   4B0C CD E1 4F      [17] 1257 	call	_cpct_getScreenPtr
   4B0F 4D            [ 4] 1258 	ld	c, l
   4B10 44            [ 4] 1259 	ld	b, h
                           1260 ;src/main.c:238: if(p.atk >= 21)
   4B11 DD 6E F7      [19] 1261 	ld	l,-9 (ix)
   4B14 DD 66 F8      [19] 1262 	ld	h,-8 (ix)
   4B17 7E            [ 7] 1263 	ld	a, (hl)
   4B18 23            [ 6] 1264 	inc	hl
   4B19 66            [ 7] 1265 	ld	h,(hl)
   4B1A 6F            [ 4] 1266 	ld	l,a
                           1267 ;src/main.c:166: cpct_drawSolidBox(memptr,0,4,16);
   4B1B C5            [11] 1268 	push	bc
   4B1C FD E1         [14] 1269 	pop	iy
                           1270 ;src/main.c:239: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4B1E DD 5E D8      [19] 1271 	ld	e,-40 (ix)
   4B21 DD 56 D9      [19] 1272 	ld	d,-39 (ix)
                           1273 ;src/main.c:238: if(p.atk >= 21)
   4B24 7D            [ 4] 1274 	ld	a,l
   4B25 D6 15         [ 7] 1275 	sub	a, #0x15
   4B27 7C            [ 4] 1276 	ld	a,h
   4B28 DE 00         [ 7] 1277 	sbc	a, #0x00
   4B2A 38 0E         [12] 1278 	jr	C,00158$
                           1279 ;src/main.c:239: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4B2C C5            [11] 1280 	push	bc
   4B2D 21 05 10      [10] 1281 	ld	hl,#0x1005
   4B30 E5            [11] 1282 	push	hl
   4B31 FD E5         [15] 1283 	push	iy
   4B33 D5            [11] 1284 	push	de
   4B34 CD A3 4E      [17] 1285 	call	_cpct_drawSpriteMasked
   4B37 C1            [10] 1286 	pop	bc
   4B38 18 0C         [12] 1287 	jr	00159$
   4B3A                    1288 00158$:
                           1289 ;src/main.c:241: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4B3A C5            [11] 1290 	push	bc
   4B3B 21 04 10      [10] 1291 	ld	hl,#0x1004
   4B3E E5            [11] 1292 	push	hl
   4B3F FD E5         [15] 1293 	push	iy
   4B41 D5            [11] 1294 	push	de
   4B42 CD A3 4E      [17] 1295 	call	_cpct_drawSpriteMasked
   4B45 C1            [10] 1296 	pop	bc
   4B46                    1297 00159$:
                           1298 ;src/main.c:244: if(e.vivo == 0){
   4B46 DD 6E EB      [19] 1299 	ld	l,-21 (ix)
   4B49 DD 66 EC      [19] 1300 	ld	h,-20 (ix)
   4B4C 7E            [ 7] 1301 	ld	a,(hl)
   4B4D B7            [ 4] 1302 	or	a, a
   4B4E 20 2B         [12] 1303 	jr	NZ,00161$
                           1304 ;src/main.c:245: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4B50 DD 6E E9      [19] 1305 	ld	l,-23 (ix)
   4B53 DD 66 EA      [19] 1306 	ld	h,-22 (ix)
   4B56 46            [ 7] 1307 	ld	b,(hl)
   4B57 DD 6E EF      [19] 1308 	ld	l,-17 (ix)
   4B5A DD 66 F0      [19] 1309 	ld	h,-16 (ix)
   4B5D 4E            [ 7] 1310 	ld	c, (hl)
   4B5E C5            [11] 1311 	push	bc
   4B5F 21 00 C0      [10] 1312 	ld	hl,#0xC000
   4B62 E5            [11] 1313 	push	hl
   4B63 CD E1 4F      [17] 1314 	call	_cpct_getScreenPtr
   4B66 4D            [ 4] 1315 	ld	c, l
   4B67 44            [ 4] 1316 	ld	b, h
                           1317 ;src/main.c:246: cpct_drawSolidBox(memptr, 18, 4, 16);
   4B68 59            [ 4] 1318 	ld	e, c
   4B69 50            [ 4] 1319 	ld	d, b
   4B6A C5            [11] 1320 	push	bc
   4B6B 21 04 10      [10] 1321 	ld	hl,#0x1004
   4B6E E5            [11] 1322 	push	hl
   4B6F 3E 12         [ 7] 1323 	ld	a,#0x12
   4B71 F5            [11] 1324 	push	af
   4B72 33            [ 6] 1325 	inc	sp
   4B73 D5            [11] 1326 	push	de
   4B74 CD 29 4F      [17] 1327 	call	_cpct_drawSolidBox
   4B77 F1            [10] 1328 	pop	af
   4B78 F1            [10] 1329 	pop	af
   4B79 33            [ 6] 1330 	inc	sp
   4B7A C1            [10] 1331 	pop	bc
   4B7B                    1332 00161$:
                           1333 ;src/main.c:165: if(p.atk <= 20)
   4B7B DD 6E F7      [19] 1334 	ld	l,-9 (ix)
   4B7E DD 66 F8      [19] 1335 	ld	h,-8 (ix)
   4B81 5E            [ 7] 1336 	ld	e,(hl)
   4B82 23            [ 6] 1337 	inc	hl
   4B83 56            [ 7] 1338 	ld	d,(hl)
                           1339 ;src/main.c:249: if(p.atk < 20)
   4B84 7B            [ 4] 1340 	ld	a,e
   4B85 D6 14         [ 7] 1341 	sub	a, #0x14
   4B87 7A            [ 4] 1342 	ld	a,d
   4B88 DE 00         [ 7] 1343 	sbc	a, #0x00
   4B8A 30 10         [12] 1344 	jr	NC,00166$
                           1345 ;src/main.c:250: drawFatiga(p.atk,memptr,2);
   4B8C C5            [11] 1346 	push	bc
   4B8D 3E 02         [ 7] 1347 	ld	a,#0x02
   4B8F F5            [11] 1348 	push	af
   4B90 33            [ 6] 1349 	inc	sp
   4B91 C5            [11] 1350 	push	bc
   4B92 D5            [11] 1351 	push	de
   4B93 CD 33 45      [17] 1352 	call	_drawFatiga
   4B96 F1            [10] 1353 	pop	af
   4B97 F1            [10] 1354 	pop	af
   4B98 33            [ 6] 1355 	inc	sp
   4B99 C1            [10] 1356 	pop	bc
   4B9A 18 25         [12] 1357 	jr	00167$
   4B9C                    1358 00166$:
                           1359 ;src/main.c:251: else if(p.atk > 20)
   4B9C 3E 14         [ 7] 1360 	ld	a,#0x14
   4B9E BB            [ 4] 1361 	cp	a, e
   4B9F 3E 00         [ 7] 1362 	ld	a,#0x00
   4BA1 9A            [ 4] 1363 	sbc	a, d
   4BA2 30 10         [12] 1364 	jr	NC,00163$
                           1365 ;src/main.c:252: drawFatiga(p.atk,memptr,16);
   4BA4 C5            [11] 1366 	push	bc
   4BA5 3E 10         [ 7] 1367 	ld	a,#0x10
   4BA7 F5            [11] 1368 	push	af
   4BA8 33            [ 6] 1369 	inc	sp
   4BA9 C5            [11] 1370 	push	bc
   4BAA D5            [11] 1371 	push	de
   4BAB CD 33 45      [17] 1372 	call	_drawFatiga
   4BAE F1            [10] 1373 	pop	af
   4BAF F1            [10] 1374 	pop	af
   4BB0 33            [ 6] 1375 	inc	sp
   4BB1 C1            [10] 1376 	pop	bc
   4BB2 18 0D         [12] 1377 	jr	00167$
   4BB4                    1378 00163$:
                           1379 ;src/main.c:254: drawFatiga(p.atk,memptr,0);
   4BB4 C5            [11] 1380 	push	bc
   4BB5 AF            [ 4] 1381 	xor	a, a
   4BB6 F5            [11] 1382 	push	af
   4BB7 33            [ 6] 1383 	inc	sp
   4BB8 C5            [11] 1384 	push	bc
   4BB9 D5            [11] 1385 	push	de
   4BBA CD 33 45      [17] 1386 	call	_drawFatiga
   4BBD F1            [10] 1387 	pop	af
   4BBE F1            [10] 1388 	pop	af
   4BBF 33            [ 6] 1389 	inc	sp
   4BC0 C1            [10] 1390 	pop	bc
   4BC1                    1391 00167$:
                           1392 ;src/main.c:256: drawVida(p.life, memptr);
   4BC1 DD 6E FC      [19] 1393 	ld	l,-4 (ix)
   4BC4 DD 66 FD      [19] 1394 	ld	h,-3 (ix)
   4BC7 5E            [ 7] 1395 	ld	e,(hl)
   4BC8 23            [ 6] 1396 	inc	hl
   4BC9 56            [ 7] 1397 	ld	d,(hl)
   4BCA C5            [11] 1398 	push	bc
   4BCB D5            [11] 1399 	push	de
   4BCC CD F0 45      [17] 1400 	call	_drawVida
   4BCF F1            [10] 1401 	pop	af
   4BD0 F1            [10] 1402 	pop	af
   4BD1 C3 9E 47      [10] 1403 	jp	00169$
   4BD4                    1404 00171$:
   4BD4 DD F9         [10] 1405 	ld	sp, ix
   4BD6 DD E1         [14] 1406 	pop	ix
   4BD8 C9            [10] 1407 	ret
                           1408 ;src/main.c:263: void main(void) {
                           1409 ;	---------------------------------
                           1410 ; Function main
                           1411 ; ---------------------------------
   4BD9                    1412 _main::
                           1413 ;src/main.c:265: init();
   4BD9 CD 84 43      [17] 1414 	call	_init
                           1415 ;src/main.c:268: while(1){
   4BDC                    1416 00102$:
                           1417 ;src/main.c:269: menu();
   4BDC CD AD 43      [17] 1418 	call	_menu
                           1419 ;src/main.c:270: game();
   4BDF CD 97 46      [17] 1420 	call	_game
   4BE2 18 F8         [12] 1421 	jr	00102$
                           1422 	.area _CODE
                           1423 	.area _INITIALIZER
                           1424 	.area _CABS (ABS)
