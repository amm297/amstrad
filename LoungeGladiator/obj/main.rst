                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Sun Oct  4 18:22:27 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _game
                             14 	.globl _checkSprite
                             15 	.globl _checkCollisions
                             16 	.globl _menu
                             17 	.globl _init
                             18 	.globl _cpct_getScreenPtr
                             19 	.globl _cpct_setPalette
                             20 	.globl _cpct_fw2hw
                             21 	.globl _cpct_waitVSYNC
                             22 	.globl _cpct_setVideoMode
                             23 	.globl _cpct_drawStringM0
                             24 	.globl _cpct_drawSolidBox
                             25 	.globl _cpct_drawSpriteMasked
                             26 	.globl _cpct_isKeyPressed
                             27 	.globl _cpct_scanKeyboard_f
                             28 	.globl _cpct_memset
                             29 	.globl _cpct_disableFirmware
                             30 	.globl _g_palette
                             31 ;--------------------------------------------------------
                             32 ; special function registers
                             33 ;--------------------------------------------------------
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DATA
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
                             42 ;--------------------------------------------------------
                             43 ; absolute external ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DABS (ABS)
                             46 ;--------------------------------------------------------
                             47 ; global & static initialisations
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _GSINIT
                             51 	.area _GSFINAL
                             52 	.area _GSINIT
                             53 ;--------------------------------------------------------
                             54 ; Home
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _HOME
                             58 ;--------------------------------------------------------
                             59 ; code
                             60 ;--------------------------------------------------------
                             61 	.area _CODE
                             62 ;src/main.c:43: void init(){
                             63 ;	---------------------------------
                             64 ; Function init
                             65 ; ---------------------------------
   4200                      66 _init::
                             67 ;src/main.c:44: cpct_disableFirmware();
   4200 CD CE 4A      [17]   68 	call	_cpct_disableFirmware
                             69 ;src/main.c:45: cpct_setVideoMode(0);
   4203 AF            [ 4]   70 	xor	a, a
   4204 F5            [11]   71 	push	af
   4205 33            [ 6]   72 	inc	sp
   4206 CD AB 4A      [17]   73 	call	_cpct_setVideoMode
   4209 33            [ 6]   74 	inc	sp
                             75 ;src/main.c:46: cpct_fw2hw(g_palette,4);
   420A 11 25 42      [10]   76 	ld	de,#_g_palette
   420D 3E 04         [ 7]   77 	ld	a,#0x04
   420F F5            [11]   78 	push	af
   4210 33            [ 6]   79 	inc	sp
   4211 D5            [11]   80 	push	de
   4212 CD 35 4A      [17]   81 	call	_cpct_fw2hw
   4215 F1            [10]   82 	pop	af
   4216 33            [ 6]   83 	inc	sp
                             84 ;src/main.c:47: cpct_setPalette(g_palette,4);
   4217 11 25 42      [10]   85 	ld	de,#_g_palette
   421A 3E 04         [ 7]   86 	ld	a,#0x04
   421C F5            [11]   87 	push	af
   421D 33            [ 6]   88 	inc	sp
   421E D5            [11]   89 	push	de
   421F CD DA 48      [17]   90 	call	_cpct_setPalette
   4222 F1            [10]   91 	pop	af
   4223 33            [ 6]   92 	inc	sp
   4224 C9            [10]   93 	ret
   4225                      94 _g_palette:
   4225 00                   95 	.db #0x00	; 0
   4226 1A                   96 	.db #0x1A	; 26
   4227 06                   97 	.db #0x06	; 6
   4228 12                   98 	.db #0x12	; 18
                             99 ;src/main.c:51: void menu(){
                            100 ;	---------------------------------
                            101 ; Function menu
                            102 ; ---------------------------------
   4229                     103 _menu::
                            104 ;src/main.c:53: cpct_clearScreen(0);
   4229 21 00 40      [10]  105 	ld	hl,#0x4000
   422C E5            [11]  106 	push	hl
   422D AF            [ 4]  107 	xor	a, a
   422E F5            [11]  108 	push	af
   422F 33            [ 6]  109 	inc	sp
   4230 26 C0         [ 7]  110 	ld	h, #0xC0
   4232 E5            [11]  111 	push	hl
   4233 CD BD 4A      [17]  112 	call	_cpct_memset
                            113 ;src/main.c:55: memptr = cpct_getScreenPtr(VMEM,20,10);
   4236 21 14 0A      [10]  114 	ld	hl,#0x0A14
   4239 E5            [11]  115 	push	hl
   423A 21 00 C0      [10]  116 	ld	hl,#0xC000
   423D E5            [11]  117 	push	hl
   423E CD 97 4B      [17]  118 	call	_cpct_getScreenPtr
                            119 ;src/main.c:56: cpct_drawStringM0("Super Menu",memptr,2,3);
   4241 EB            [ 4]  120 	ex	de,hl
   4242 01 7E 42      [10]  121 	ld	bc,#___str_0+0
   4245 21 02 03      [10]  122 	ld	hl,#0x0302
   4248 E5            [11]  123 	push	hl
   4249 D5            [11]  124 	push	de
   424A C5            [11]  125 	push	bc
   424B CD 74 49      [17]  126 	call	_cpct_drawStringM0
   424E 21 06 00      [10]  127 	ld	hl,#6
   4251 39            [11]  128 	add	hl,sp
   4252 F9            [ 6]  129 	ld	sp,hl
                            130 ;src/main.c:58: memptr = cpct_getScreenPtr(VMEM,18,180);
   4253 21 12 B4      [10]  131 	ld	hl,#0xB412
   4256 E5            [11]  132 	push	hl
   4257 21 00 C0      [10]  133 	ld	hl,#0xC000
   425A E5            [11]  134 	push	hl
   425B CD 97 4B      [17]  135 	call	_cpct_getScreenPtr
                            136 ;src/main.c:59: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   425E EB            [ 4]  137 	ex	de,hl
   425F 01 89 42      [10]  138 	ld	bc,#___str_1+0
   4262 21 04 05      [10]  139 	ld	hl,#0x0504
   4265 E5            [11]  140 	push	hl
   4266 D5            [11]  141 	push	de
   4267 C5            [11]  142 	push	bc
   4268 CD 74 49      [17]  143 	call	_cpct_drawStringM0
   426B 21 06 00      [10]  144 	ld	hl,#6
   426E 39            [11]  145 	add	hl,sp
   426F F9            [ 6]  146 	ld	sp,hl
                            147 ;src/main.c:61: do{
   4270                     148 00101$:
                            149 ;src/main.c:62: cpct_scanKeyboard_f();
   4270 CD 0A 49      [17]  150 	call	_cpct_scanKeyboard_f
                            151 ;src/main.c:63: }while(!cpct_isKeyPressed(Key_Enter));
   4273 21 00 40      [10]  152 	ld	hl,#0x4000
   4276 CD FE 48      [17]  153 	call	_cpct_isKeyPressed
   4279 7D            [ 4]  154 	ld	a,l
   427A B7            [ 4]  155 	or	a, a
   427B 28 F3         [12]  156 	jr	Z,00101$
   427D C9            [10]  157 	ret
   427E                     158 ___str_0:
   427E 53 75 70 65 72 20   159 	.ascii "Super Menu"
        4D 65 6E 75
   4288 00                  160 	.db 0x00
   4289                     161 ___str_1:
   4289 50 75 6C 73 61 20   162 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4294 00                  163 	.db 0x00
                            164 ;src/main.c:68: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            165 ;	---------------------------------
                            166 ; Function checkCollisions
                            167 ; ---------------------------------
   4295                     168 _checkCollisions::
   4295 DD E5         [15]  169 	push	ix
   4297 DD 21 00 00   [14]  170 	ld	ix,#0
   429B DD 39         [15]  171 	add	ix,sp
                            172 ;src/main.c:71: if(eX - pX > -1 && eX - pX < 11)
   429D DD 4E 06      [19]  173 	ld	c,6 (ix)
   42A0 06 00         [ 7]  174 	ld	b,#0x00
   42A2 DD 6E 04      [19]  175 	ld	l,4 (ix)
   42A5 26 00         [ 7]  176 	ld	h,#0x00
   42A7 79            [ 4]  177 	ld	a,c
   42A8 95            [ 4]  178 	sub	a, l
   42A9 5F            [ 4]  179 	ld	e,a
   42AA 78            [ 4]  180 	ld	a,b
   42AB 9C            [ 4]  181 	sbc	a, h
   42AC 57            [ 4]  182 	ld	d,a
                            183 ;src/main.c:69: if(atk >= 21)
   42AD DD 7E 0A      [19]  184 	ld	a,10 (ix)
   42B0 D6 15         [ 7]  185 	sub	a, #0x15
   42B2 DD 7E 0B      [19]  186 	ld	a,11 (ix)
   42B5 DE 00         [ 7]  187 	sbc	a, #0x00
   42B7 38 4F         [12]  188 	jr	C,00116$
                            189 ;src/main.c:70: if(dir == 0)
   42B9 DD 7E 09      [19]  190 	ld	a,9 (ix)
   42BC DD B6 08      [19]  191 	or	a,8 (ix)
   42BF 20 21         [12]  192 	jr	NZ,00110$
                            193 ;src/main.c:71: if(eX - pX > -1 && eX - pX < 11)
   42C1 3E FF         [ 7]  194 	ld	a,#0xFF
   42C3 BB            [ 4]  195 	cp	a, e
   42C4 9A            [ 4]  196 	sbc	a, d
   42C5 E2 CA 42      [10]  197 	jp	PO, 00152$
   42C8 EE 80         [ 7]  198 	xor	a, #0x80
   42CA                     199 00152$:
   42CA F2 DD 42      [10]  200 	jp	P,00102$
   42CD 7B            [ 4]  201 	ld	a,e
   42CE D6 0B         [ 7]  202 	sub	a, #0x0B
   42D0 7A            [ 4]  203 	ld	a,d
   42D1 17            [ 4]  204 	rla
   42D2 3F            [ 4]  205 	ccf
   42D3 1F            [ 4]  206 	rra
   42D4 DE 80         [ 7]  207 	sbc	a, #0x80
   42D6 30 05         [12]  208 	jr	NC,00102$
                            209 ;src/main.c:72: return 1;
   42D8 21 01 00      [10]  210 	ld	hl,#0x0001
   42DB 18 49         [12]  211 	jr	00118$
   42DD                     212 00102$:
                            213 ;src/main.c:74: return 0;
   42DD 21 00 00      [10]  214 	ld	hl,#0x0000
   42E0 18 44         [12]  215 	jr	00118$
   42E2                     216 00110$:
                            217 ;src/main.c:76: if(pX - eX > -1 && pX - eX < 11)
   42E2 BF            [ 4]  218 	cp	a, a
   42E3 ED 42         [15]  219 	sbc	hl, bc
   42E5 3E FF         [ 7]  220 	ld	a,#0xFF
   42E7 BD            [ 4]  221 	cp	a, l
   42E8 9C            [ 4]  222 	sbc	a, h
   42E9 E2 EE 42      [10]  223 	jp	PO, 00153$
   42EC EE 80         [ 7]  224 	xor	a, #0x80
   42EE                     225 00153$:
   42EE F2 03 43      [10]  226 	jp	P,00106$
   42F1 11 0B 80      [10]  227 	ld	de, #0x800B
   42F4 29            [11]  228 	add	hl, hl
   42F5 3F            [ 4]  229 	ccf
   42F6 CB 1C         [ 8]  230 	rr	h
   42F8 CB 1D         [ 8]  231 	rr	l
   42FA ED 52         [15]  232 	sbc	hl, de
   42FC 30 05         [12]  233 	jr	NC,00106$
                            234 ;src/main.c:77: return 1;
   42FE 21 01 00      [10]  235 	ld	hl,#0x0001
   4301 18 23         [12]  236 	jr	00118$
   4303                     237 00106$:
                            238 ;src/main.c:79: return 0;
   4303 21 00 00      [10]  239 	ld	hl,#0x0000
   4306 18 1E         [12]  240 	jr	00118$
   4308                     241 00116$:
                            242 ;src/main.c:81: if(eX - pX > 0 && eX - pX < 4)
   4308 AF            [ 4]  243 	xor	a, a
   4309 BB            [ 4]  244 	cp	a, e
   430A 9A            [ 4]  245 	sbc	a, d
   430B E2 10 43      [10]  246 	jp	PO, 00154$
   430E EE 80         [ 7]  247 	xor	a, #0x80
   4310                     248 00154$:
   4310 F2 23 43      [10]  249 	jp	P,00117$
   4313 7B            [ 4]  250 	ld	a,e
   4314 D6 04         [ 7]  251 	sub	a, #0x04
   4316 7A            [ 4]  252 	ld	a,d
   4317 17            [ 4]  253 	rla
   4318 3F            [ 4]  254 	ccf
   4319 1F            [ 4]  255 	rra
   431A DE 80         [ 7]  256 	sbc	a, #0x80
   431C 30 05         [12]  257 	jr	NC,00117$
                            258 ;src/main.c:82: return 2;
   431E 21 02 00      [10]  259 	ld	hl,#0x0002
   4321 18 03         [12]  260 	jr	00118$
   4323                     261 00117$:
                            262 ;src/main.c:84: return 0;
   4323 21 00 00      [10]  263 	ld	hl,#0x0000
   4326                     264 00118$:
   4326 DD E1         [14]  265 	pop	ix
   4328 C9            [10]  266 	ret
                            267 ;src/main.c:87: u8* checkSprite(u8* atk, u8* dir){
                            268 ;	---------------------------------
                            269 ; Function checkSprite
                            270 ; ---------------------------------
   4329                     271 _checkSprite::
                            272 ;src/main.c:88: if(atk <= 20)
   4329 3E 14         [ 7]  273 	ld	a,#0x14
   432B FD 21 02 00   [14]  274 	ld	iy,#2
   432F FD 39         [15]  275 	add	iy,sp
   4331 FD BE 00      [19]  276 	cp	a, 0 (iy)
   4334 3E 00         [ 7]  277 	ld	a,#0x00
   4336 FD 9E 01      [19]  278 	sbc	a, 1 (iy)
   4339 38 11         [12]  279 	jr	C,00108$
                            280 ;src/main.c:89: if(dir == 0)
   433B 21 05 00      [10]  281 	ld	hl, #4+1
   433E 39            [11]  282 	add	hl, sp
   433F 7E            [ 7]  283 	ld	a, (hl)
   4340 2B            [ 6]  284 	dec	hl
   4341 B6            [ 7]  285 	or	a,(hl)
   4342 20 04         [12]  286 	jr	NZ,00102$
                            287 ;src/main.c:90: return gladis_quieto_dcha;
   4344 21 00 41      [10]  288 	ld	hl,#_gladis_quieto_dcha
   4347 C9            [10]  289 	ret
   4348                     290 00102$:
                            291 ;src/main.c:92: return gladis_quieto_izda;
   4348 21 80 41      [10]  292 	ld	hl,#_gladis_quieto_izda
   434B C9            [10]  293 	ret
   434C                     294 00108$:
                            295 ;src/main.c:93: else if(dir == 0){
   434C 21 05 00      [10]  296 	ld	hl, #4+1
   434F 39            [11]  297 	add	hl, sp
   4350 7E            [ 7]  298 	ld	a, (hl)
   4351 2B            [ 6]  299 	dec	hl
   4352 B6            [ 7]  300 	or	a,(hl)
   4353 20 04         [12]  301 	jr	NZ,00105$
                            302 ;src/main.c:94: return gladis_atk_dcha;
   4355 21 9A 47      [10]  303 	ld	hl,#_gladis_atk_dcha
   4358 C9            [10]  304 	ret
   4359                     305 00105$:
                            306 ;src/main.c:96: return gladis_atk_izda;
   4359 21 3A 48      [10]  307 	ld	hl,#_gladis_atk_izda
   435C C9            [10]  308 	ret
                            309 ;src/main.c:102: void game(){
                            310 ;	---------------------------------
                            311 ; Function game
                            312 ; ---------------------------------
   435D                     313 _game::
   435D DD E5         [15]  314 	push	ix
   435F DD 21 00 00   [14]  315 	ld	ix,#0
   4363 DD 39         [15]  316 	add	ix,sp
   4365 21 DB FF      [10]  317 	ld	hl,#-37
   4368 39            [11]  318 	add	hl,sp
   4369 F9            [ 6]  319 	ld	sp,hl
                            320 ;src/main.c:103: TPlayer p = { 0,100,20,0,0,6 };
   436A 21 03 00      [10]  321 	ld	hl,#0x0003
   436D 39            [11]  322 	add	hl,sp
   436E 36 00         [10]  323 	ld	(hl),#0x00
   4370 21 03 00      [10]  324 	ld	hl,#0x0003
   4373 39            [11]  325 	add	hl,sp
   4374 DD 75 F8      [19]  326 	ld	-8 (ix),l
   4377 DD 74 F9      [19]  327 	ld	-7 (ix),h
   437A DD 7E F8      [19]  328 	ld	a,-8 (ix)
   437D C6 01         [ 7]  329 	add	a, #0x01
   437F DD 77 FC      [19]  330 	ld	-4 (ix),a
   4382 DD 7E F9      [19]  331 	ld	a,-7 (ix)
   4385 CE 00         [ 7]  332 	adc	a, #0x00
   4387 DD 77 FD      [19]  333 	ld	-3 (ix),a
   438A DD 6E FC      [19]  334 	ld	l,-4 (ix)
   438D DD 66 FD      [19]  335 	ld	h,-3 (ix)
   4390 36 64         [10]  336 	ld	(hl),#0x64
   4392 DD 7E F8      [19]  337 	ld	a,-8 (ix)
   4395 C6 02         [ 7]  338 	add	a, #0x02
   4397 DD 77 FE      [19]  339 	ld	-2 (ix),a
   439A DD 7E F9      [19]  340 	ld	a,-7 (ix)
   439D CE 00         [ 7]  341 	adc	a, #0x00
   439F DD 77 FF      [19]  342 	ld	-1 (ix),a
   43A2 DD 6E FE      [19]  343 	ld	l,-2 (ix)
   43A5 DD 66 FF      [19]  344 	ld	h,-1 (ix)
   43A8 36 14         [10]  345 	ld	(hl),#0x14
   43AA 23            [ 6]  346 	inc	hl
   43AB 36 00         [10]  347 	ld	(hl),#0x00
   43AD DD 7E F8      [19]  348 	ld	a,-8 (ix)
   43B0 C6 04         [ 7]  349 	add	a, #0x04
   43B2 DD 77 FA      [19]  350 	ld	-6 (ix),a
   43B5 DD 7E F9      [19]  351 	ld	a,-7 (ix)
   43B8 CE 00         [ 7]  352 	adc	a, #0x00
   43BA DD 77 FB      [19]  353 	ld	-5 (ix),a
   43BD DD 6E FA      [19]  354 	ld	l,-6 (ix)
   43C0 DD 66 FB      [19]  355 	ld	h,-5 (ix)
   43C3 AF            [ 4]  356 	xor	a, a
   43C4 77            [ 7]  357 	ld	(hl), a
   43C5 23            [ 6]  358 	inc	hl
   43C6 77            [ 7]  359 	ld	(hl), a
   43C7 DD 7E F8      [19]  360 	ld	a,-8 (ix)
   43CA C6 06         [ 7]  361 	add	a, #0x06
   43CC DD 77 F0      [19]  362 	ld	-16 (ix),a
   43CF DD 7E F9      [19]  363 	ld	a,-7 (ix)
   43D2 CE 00         [ 7]  364 	adc	a, #0x00
   43D4 DD 77 F1      [19]  365 	ld	-15 (ix),a
   43D7 DD 6E F0      [19]  366 	ld	l,-16 (ix)
   43DA DD 66 F1      [19]  367 	ld	h,-15 (ix)
   43DD AF            [ 4]  368 	xor	a, a
   43DE 77            [ 7]  369 	ld	(hl), a
   43DF 23            [ 6]  370 	inc	hl
   43E0 77            [ 7]  371 	ld	(hl), a
   43E1 DD 7E F8      [19]  372 	ld	a,-8 (ix)
   43E4 C6 08         [ 7]  373 	add	a, #0x08
   43E6 DD 77 EE      [19]  374 	ld	-18 (ix),a
   43E9 DD 7E F9      [19]  375 	ld	a,-7 (ix)
   43EC CE 00         [ 7]  376 	adc	a, #0x00
   43EE DD 77 EF      [19]  377 	ld	-17 (ix),a
   43F1 DD 6E EE      [19]  378 	ld	l,-18 (ix)
   43F4 DD 66 EF      [19]  379 	ld	h,-17 (ix)
   43F7 36 06         [10]  380 	ld	(hl),#0x06
   43F9 23            [ 6]  381 	inc	hl
   43FA 36 00         [10]  382 	ld	(hl),#0x00
                            383 ;src/main.c:104: TEnemy  e = { 55,100,0 };
   43FC 21 00 00      [10]  384 	ld	hl,#0x0000
   43FF 39            [11]  385 	add	hl,sp
   4400 36 37         [10]  386 	ld	(hl),#0x37
   4402 21 00 00      [10]  387 	ld	hl,#0x0000
   4405 39            [11]  388 	add	hl,sp
   4406 DD 75 EC      [19]  389 	ld	-20 (ix),l
   4409 DD 74 ED      [19]  390 	ld	-19 (ix),h
   440C DD 7E EC      [19]  391 	ld	a,-20 (ix)
   440F C6 01         [ 7]  392 	add	a, #0x01
   4411 DD 77 F2      [19]  393 	ld	-14 (ix),a
   4414 DD 7E ED      [19]  394 	ld	a,-19 (ix)
   4417 CE 00         [ 7]  395 	adc	a, #0x00
   4419 DD 77 F3      [19]  396 	ld	-13 (ix),a
   441C DD 6E F2      [19]  397 	ld	l,-14 (ix)
   441F DD 66 F3      [19]  398 	ld	h,-13 (ix)
   4422 36 64         [10]  399 	ld	(hl),#0x64
   4424 DD 7E EC      [19]  400 	ld	a,-20 (ix)
   4427 C6 02         [ 7]  401 	add	a, #0x02
   4429 DD 77 F6      [19]  402 	ld	-10 (ix),a
   442C DD 7E ED      [19]  403 	ld	a,-19 (ix)
   442F CE 00         [ 7]  404 	adc	a, #0x00
   4431 DD 77 F7      [19]  405 	ld	-9 (ix),a
   4434 DD 6E F6      [19]  406 	ld	l,-10 (ix)
   4437 DD 66 F7      [19]  407 	ld	h,-9 (ix)
   443A 36 00         [10]  408 	ld	(hl),#0x00
                            409 ;src/main.c:109: cpct_clearScreen(0);
   443C 21 00 40      [10]  410 	ld	hl,#0x4000
   443F E5            [11]  411 	push	hl
   4440 AF            [ 4]  412 	xor	a, a
   4441 F5            [11]  413 	push	af
   4442 33            [ 6]  414 	inc	sp
   4443 26 C0         [ 7]  415 	ld	h, #0xC0
   4445 E5            [11]  416 	push	hl
   4446 CD BD 4A      [17]  417 	call	_cpct_memset
                            418 ;src/main.c:111: while (1){
   4449                     419 00151$:
                            420 ;src/main.c:114: cpct_waitVSYNC();
   4449 CD A3 4A      [17]  421 	call	_cpct_waitVSYNC
                            422 ;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   444C DD 6E FC      [19]  423 	ld	l,-4 (ix)
   444F DD 66 FD      [19]  424 	ld	h,-3 (ix)
   4452 46            [ 7]  425 	ld	b,(hl)
   4453 DD 6E F8      [19]  426 	ld	l,-8 (ix)
   4456 DD 66 F9      [19]  427 	ld	h,-7 (ix)
   4459 4E            [ 7]  428 	ld	c, (hl)
   445A C5            [11]  429 	push	bc
   445B 21 00 C0      [10]  430 	ld	hl,#0xC000
   445E E5            [11]  431 	push	hl
   445F CD 97 4B      [17]  432 	call	_cpct_getScreenPtr
   4462 EB            [ 4]  433 	ex	de,hl
                            434 ;src/main.c:118: if(p.atk <= 20)
   4463 DD 6E FE      [19]  435 	ld	l,-2 (ix)
   4466 DD 66 FF      [19]  436 	ld	h,-1 (ix)
   4469 46            [ 7]  437 	ld	b,(hl)
   446A 23            [ 6]  438 	inc	hl
   446B 66            [ 7]  439 	ld	h,(hl)
                            440 ;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
                            441 ;src/main.c:118: if(p.atk <= 20)
   446C 3E 14         [ 7]  442 	ld	a,#0x14
   446E B8            [ 4]  443 	cp	a, b
   446F 3E 00         [ 7]  444 	ld	a,#0x00
   4471 9C            [ 4]  445 	sbc	a, h
   4472 38 10         [12]  446 	jr	C,00102$
                            447 ;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
   4474 21 04 10      [10]  448 	ld	hl,#0x1004
   4477 E5            [11]  449 	push	hl
   4478 AF            [ 4]  450 	xor	a, a
   4479 F5            [11]  451 	push	af
   447A 33            [ 6]  452 	inc	sp
   447B D5            [11]  453 	push	de
   447C CD DF 4A      [17]  454 	call	_cpct_drawSolidBox
   447F F1            [10]  455 	pop	af
   4480 F1            [10]  456 	pop	af
   4481 33            [ 6]  457 	inc	sp
   4482 18 0E         [12]  458 	jr	00103$
   4484                     459 00102$:
                            460 ;src/main.c:121: cpct_drawSolidBox(memptr,0,5,16);
   4484 21 05 10      [10]  461 	ld	hl,#0x1005
   4487 E5            [11]  462 	push	hl
   4488 AF            [ 4]  463 	xor	a, a
   4489 F5            [11]  464 	push	af
   448A 33            [ 6]  465 	inc	sp
   448B D5            [11]  466 	push	de
   448C CD DF 4A      [17]  467 	call	_cpct_drawSolidBox
   448F F1            [10]  468 	pop	af
   4490 F1            [10]  469 	pop	af
   4491 33            [ 6]  470 	inc	sp
   4492                     471 00103$:
                            472 ;src/main.c:123: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4492 DD 6E F2      [19]  473 	ld	l,-14 (ix)
   4495 DD 66 F3      [19]  474 	ld	h,-13 (ix)
   4498 46            [ 7]  475 	ld	b,(hl)
   4499 DD 6E EC      [19]  476 	ld	l,-20 (ix)
   449C DD 66 ED      [19]  477 	ld	h,-19 (ix)
   449F 4E            [ 7]  478 	ld	c, (hl)
   44A0 C5            [11]  479 	push	bc
   44A1 21 00 C0      [10]  480 	ld	hl,#0xC000
   44A4 E5            [11]  481 	push	hl
   44A5 CD 97 4B      [17]  482 	call	_cpct_getScreenPtr
   44A8 EB            [ 4]  483 	ex	de,hl
                            484 ;src/main.c:124: if(e.vivo == 0)
   44A9 DD 6E F6      [19]  485 	ld	l,-10 (ix)
   44AC DD 66 F7      [19]  486 	ld	h,-9 (ix)
   44AF 7E            [ 7]  487 	ld	a,(hl)
   44B0 B7            [ 4]  488 	or	a, a
   44B1 20 0E         [12]  489 	jr	NZ,00105$
                            490 ;src/main.c:125: cpct_drawSolidBox(memptr,0,4,16);
   44B3 21 04 10      [10]  491 	ld	hl,#0x1004
   44B6 E5            [11]  492 	push	hl
   44B7 AF            [ 4]  493 	xor	a, a
   44B8 F5            [11]  494 	push	af
   44B9 33            [ 6]  495 	inc	sp
   44BA D5            [11]  496 	push	de
   44BB CD DF 4A      [17]  497 	call	_cpct_drawSolidBox
   44BE F1            [10]  498 	pop	af
   44BF F1            [10]  499 	pop	af
   44C0 33            [ 6]  500 	inc	sp
   44C1                     501 00105$:
                            502 ;src/main.c:128: if(p.col != 2){
   44C1 DD 6E F0      [19]  503 	ld	l,-16 (ix)
   44C4 DD 66 F1      [19]  504 	ld	h,-15 (ix)
   44C7 56            [ 7]  505 	ld	d,(hl)
   44C8 23            [ 6]  506 	inc	hl
   44C9 66            [ 7]  507 	ld	h,(hl)
   44CA 7A            [ 4]  508 	ld	a,d
   44CB D6 02         [ 7]  509 	sub	a,#0x02
   44CD 20 04         [12]  510 	jr	NZ,00247$
   44CF B4            [ 4]  511 	or	a,h
   44D0 CA 17 46      [10]  512 	jp	Z,00138$
   44D3                     513 00247$:
                            514 ;src/main.c:129: cpct_scanKeyboard_f();
   44D3 CD 0A 49      [17]  515 	call	_cpct_scanKeyboard_f
                            516 ;src/main.c:130: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   44D6 21 05 80      [10]  517 	ld	hl,#0x8005
   44D9 CD FE 48      [17]  518 	call	_cpct_isKeyPressed
   44DC DD 75 EB      [19]  519 	ld	-21 (ix),l
                            520 ;src/main.c:118: if(p.atk <= 20)
   44DF DD 6E FE      [19]  521 	ld	l,-2 (ix)
   44E2 DD 66 FF      [19]  522 	ld	h,-1 (ix)
   44E5 7E            [ 7]  523 	ld	a,(hl)
   44E6 DD 77 F4      [19]  524 	ld	-12 (ix),a
   44E9 23            [ 6]  525 	inc	hl
   44EA 7E            [ 7]  526 	ld	a,(hl)
   44EB DD 77 F5      [19]  527 	ld	-11 (ix),a
                            528 ;src/main.c:130: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   44EE DD 7E F4      [19]  529 	ld	a,-12 (ix)
   44F1 D6 14         [ 7]  530 	sub	a, #0x14
   44F3 DD 7E F5      [19]  531 	ld	a,-11 (ix)
   44F6 DE 00         [ 7]  532 	sbc	a, #0x00
   44F8 3E 00         [ 7]  533 	ld	a,#0x00
   44FA 17            [ 4]  534 	rla
   44FB DD 77 EA      [19]  535 	ld	-22 (ix),a
                            536 ;src/main.c:134: p.atk += 1;
   44FE DD 7E F4      [19]  537 	ld	a,-12 (ix)
   4501 C6 01         [ 7]  538 	add	a, #0x01
   4503 DD 77 E8      [19]  539 	ld	-24 (ix),a
   4506 DD 7E F5      [19]  540 	ld	a,-11 (ix)
   4509 CE 00         [ 7]  541 	adc	a, #0x00
   450B DD 77 E9      [19]  542 	ld	-23 (ix),a
                            543 ;src/main.c:130: if(cpct_isKeyPressed(Key_Space) && p.atk >= 20){
   450E DD 7E EB      [19]  544 	ld	a,-21 (ix)
   4511 B7            [ 4]  545 	or	a, a
   4512 28 5D         [12]  546 	jr	Z,00132$
   4514 DD 7E EA      [19]  547 	ld	a,-22 (ix)
   4517 B7            [ 4]  548 	or	a, a
   4518 20 57         [12]  549 	jr	NZ,00132$
                            550 ;src/main.c:131: if(p.atk >= 50)
   451A DD 7E F4      [19]  551 	ld	a,-12 (ix)
   451D D6 32         [ 7]  552 	sub	a, #0x32
   451F DD 7E F5      [19]  553 	ld	a,-11 (ix)
   4522 DE 00         [ 7]  554 	sbc	a, #0x00
   4524 38 0C         [12]  555 	jr	C,00107$
                            556 ;src/main.c:132: p.atk = 0;
   4526 DD 6E FE      [19]  557 	ld	l,-2 (ix)
   4529 DD 66 FF      [19]  558 	ld	h,-1 (ix)
   452C AF            [ 4]  559 	xor	a, a
   452D 77            [ 7]  560 	ld	(hl), a
   452E 23            [ 6]  561 	inc	hl
   452F 77            [ 7]  562 	ld	(hl), a
   4530 18 0F         [12]  563 	jr	00108$
   4532                     564 00107$:
                            565 ;src/main.c:134: p.atk += 1;
   4532 DD 6E FE      [19]  566 	ld	l,-2 (ix)
   4535 DD 66 FF      [19]  567 	ld	h,-1 (ix)
   4538 DD 7E E8      [19]  568 	ld	a,-24 (ix)
   453B 77            [ 7]  569 	ld	(hl),a
   453C 23            [ 6]  570 	inc	hl
   453D DD 7E E9      [19]  571 	ld	a,-23 (ix)
   4540 77            [ 7]  572 	ld	(hl),a
   4541                     573 00108$:
                            574 ;src/main.c:135: if(cpct_isKeyPressed(Key_CursorRight))
   4541 21 00 02      [10]  575 	ld	hl,#0x0200
   4544 CD FE 48      [17]  576 	call	_cpct_isKeyPressed
   4547 7D            [ 4]  577 	ld	a,l
   4548 B7            [ 4]  578 	or	a, a
   4549 28 0D         [12]  579 	jr	Z,00112$
                            580 ;src/main.c:136: p.dir = 0;
   454B DD 6E FA      [19]  581 	ld	l,-6 (ix)
   454E DD 66 FB      [19]  582 	ld	h,-5 (ix)
   4551 AF            [ 4]  583 	xor	a, a
   4552 77            [ 7]  584 	ld	(hl), a
   4553 23            [ 6]  585 	inc	hl
   4554 77            [ 7]  586 	ld	(hl), a
   4555 C3 54 46      [10]  587 	jp	00139$
   4558                     588 00112$:
                            589 ;src/main.c:137: else if(cpct_isKeyPressed(Key_CursorLeft))
   4558 21 01 01      [10]  590 	ld	hl,#0x0101
   455B CD FE 48      [17]  591 	call	_cpct_isKeyPressed
   455E 7D            [ 4]  592 	ld	a,l
   455F B7            [ 4]  593 	or	a, a
   4560 CA 54 46      [10]  594 	jp	Z,00139$
                            595 ;src/main.c:138: p.dir = 1;
   4563 DD 6E FA      [19]  596 	ld	l,-6 (ix)
   4566 DD 66 FB      [19]  597 	ld	h,-5 (ix)
   4569 36 01         [10]  598 	ld	(hl),#0x01
   456B 23            [ 6]  599 	inc	hl
   456C 36 00         [10]  600 	ld	(hl),#0x00
   456E C3 54 46      [10]  601 	jp	00139$
   4571                     602 00132$:
                            603 ;src/main.c:140: if(p.atk < 20)
   4571 DD 7E EA      [19]  604 	ld	a,-22 (ix)
   4574 B7            [ 4]  605 	or	a, a
   4575 28 11         [12]  606 	jr	Z,00115$
                            607 ;src/main.c:141: p.atk += 1;
   4577 DD 6E FE      [19]  608 	ld	l,-2 (ix)
   457A DD 66 FF      [19]  609 	ld	h,-1 (ix)
   457D DD 7E E8      [19]  610 	ld	a,-24 (ix)
   4580 77            [ 7]  611 	ld	(hl),a
   4581 23            [ 6]  612 	inc	hl
   4582 DD 7E E9      [19]  613 	ld	a,-23 (ix)
   4585 77            [ 7]  614 	ld	(hl),a
   4586 18 0B         [12]  615 	jr	00116$
   4588                     616 00115$:
                            617 ;src/main.c:143: p.atk = 20;
   4588 DD 6E FE      [19]  618 	ld	l,-2 (ix)
   458B DD 66 FF      [19]  619 	ld	h,-1 (ix)
   458E 36 14         [10]  620 	ld	(hl),#0x14
   4590 23            [ 6]  621 	inc	hl
   4591 36 00         [10]  622 	ld	(hl),#0x00
   4593                     623 00116$:
                            624 ;src/main.c:144: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4593 21 00 02      [10]  625 	ld	hl,#0x0200
   4596 CD FE 48      [17]  626 	call	_cpct_isKeyPressed
   4599 7D            [ 4]  627 	ld	a,l
   459A B7            [ 4]  628 	or	a, a
   459B 28 32         [12]  629 	jr	Z,00128$
   459D DD 6E F8      [19]  630 	ld	l,-8 (ix)
   45A0 DD 66 F9      [19]  631 	ld	h,-7 (ix)
   45A3 56            [ 7]  632 	ld	d,(hl)
   45A4 7A            [ 4]  633 	ld	a,d
   45A5 D6 4C         [ 7]  634 	sub	a, #0x4C
   45A7 30 26         [12]  635 	jr	NC,00128$
                            636 ;src/main.c:145: if(p.col != 2)
   45A9 DD 6E F0      [19]  637 	ld	l,-16 (ix)
   45AC DD 66 F1      [19]  638 	ld	h,-15 (ix)
   45AF 5E            [ 7]  639 	ld	e,(hl)
   45B0 23            [ 6]  640 	inc	hl
   45B1 66            [ 7]  641 	ld	h,(hl)
   45B2 7B            [ 4]  642 	ld	a,e
   45B3 D6 02         [ 7]  643 	sub	a,#0x02
   45B5 20 03         [12]  644 	jr	NZ,00248$
   45B7 B4            [ 4]  645 	or	a,h
   45B8 28 08         [12]  646 	jr	Z,00118$
   45BA                     647 00248$:
                            648 ;src/main.c:146: p.x += 1;
   45BA 14            [ 4]  649 	inc	d
   45BB DD 6E F8      [19]  650 	ld	l,-8 (ix)
   45BE DD 66 F9      [19]  651 	ld	h,-7 (ix)
   45C1 72            [ 7]  652 	ld	(hl),d
   45C2                     653 00118$:
                            654 ;src/main.c:147: p.dir = 0;
   45C2 DD 6E FA      [19]  655 	ld	l,-6 (ix)
   45C5 DD 66 FB      [19]  656 	ld	h,-5 (ix)
   45C8 AF            [ 4]  657 	xor	a, a
   45C9 77            [ 7]  658 	ld	(hl), a
   45CA 23            [ 6]  659 	inc	hl
   45CB 77            [ 7]  660 	ld	(hl), a
   45CC C3 54 46      [10]  661 	jp	00139$
   45CF                     662 00128$:
                            663 ;src/main.c:148: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   45CF 21 01 01      [10]  664 	ld	hl,#0x0101
   45D2 CD FE 48      [17]  665 	call	_cpct_isKeyPressed
   45D5 7D            [ 4]  666 	ld	a,l
   45D6 B7            [ 4]  667 	or	a, a
   45D7 28 31         [12]  668 	jr	Z,00124$
   45D9 DD 6E F8      [19]  669 	ld	l,-8 (ix)
   45DC DD 66 F9      [19]  670 	ld	h,-7 (ix)
   45DF 56            [ 7]  671 	ld	d,(hl)
   45E0 7A            [ 4]  672 	ld	a,d
   45E1 B7            [ 4]  673 	or	a, a
   45E2 28 26         [12]  674 	jr	Z,00124$
                            675 ;src/main.c:149: if(p.col != 2)
   45E4 DD 6E F0      [19]  676 	ld	l,-16 (ix)
   45E7 DD 66 F1      [19]  677 	ld	h,-15 (ix)
   45EA 5E            [ 7]  678 	ld	e,(hl)
   45EB 23            [ 6]  679 	inc	hl
   45EC 66            [ 7]  680 	ld	h,(hl)
   45ED 7B            [ 4]  681 	ld	a,e
   45EE D6 02         [ 7]  682 	sub	a,#0x02
   45F0 20 03         [12]  683 	jr	NZ,00249$
   45F2 B4            [ 4]  684 	or	a,h
   45F3 28 08         [12]  685 	jr	Z,00120$
   45F5                     686 00249$:
                            687 ;src/main.c:150: p.x -= 1;
   45F5 15            [ 4]  688 	dec	d
   45F6 DD 6E F8      [19]  689 	ld	l,-8 (ix)
   45F9 DD 66 F9      [19]  690 	ld	h,-7 (ix)
   45FC 72            [ 7]  691 	ld	(hl),d
   45FD                     692 00120$:
                            693 ;src/main.c:151: p.dir = 1;
   45FD DD 6E FA      [19]  694 	ld	l,-6 (ix)
   4600 DD 66 FB      [19]  695 	ld	h,-5 (ix)
   4603 36 01         [10]  696 	ld	(hl),#0x01
   4605 23            [ 6]  697 	inc	hl
   4606 36 00         [10]  698 	ld	(hl),#0x00
   4608 18 4A         [12]  699 	jr	00139$
   460A                     700 00124$:
                            701 ;src/main.c:152: }else  if(cpct_isKeyPressed(Key_Esc)){
   460A 21 08 04      [10]  702 	ld	hl,#0x0408
   460D CD FE 48      [17]  703 	call	_cpct_isKeyPressed
   4610 7D            [ 4]  704 	ld	a,l
   4611 B7            [ 4]  705 	or	a, a
   4612 28 40         [12]  706 	jr	Z,00139$
                            707 ;src/main.c:153: return;
   4614 C3 8A 47      [10]  708 	jp	00153$
   4617                     709 00138$:
                            710 ;src/main.c:157: p.x -= 2;
   4617 DD 6E F8      [19]  711 	ld	l,-8 (ix)
   461A DD 66 F9      [19]  712 	ld	h,-7 (ix)
   461D 7E            [ 7]  713 	ld	a,(hl)
   461E C6 FE         [ 7]  714 	add	a,#0xFE
   4620 DD 6E F8      [19]  715 	ld	l,-8 (ix)
   4623 DD 66 F9      [19]  716 	ld	h,-7 (ix)
   4626 77            [ 7]  717 	ld	(hl),a
                            718 ;src/main.c:158: p.rebote -= 2;
   4627 DD 6E EE      [19]  719 	ld	l,-18 (ix)
   462A DD 66 EF      [19]  720 	ld	h,-17 (ix)
   462D 5E            [ 7]  721 	ld	e,(hl)
   462E 23            [ 6]  722 	inc	hl
   462F 56            [ 7]  723 	ld	d,(hl)
   4630 1B            [ 6]  724 	dec	de
   4631 1B            [ 6]  725 	dec	de
   4632 DD 6E EE      [19]  726 	ld	l,-18 (ix)
   4635 DD 66 EF      [19]  727 	ld	h,-17 (ix)
   4638 73            [ 7]  728 	ld	(hl),e
   4639 23            [ 6]  729 	inc	hl
   463A 72            [ 7]  730 	ld	(hl),d
                            731 ;src/main.c:159: if(p.rebote == 0){
   463B 7A            [ 4]  732 	ld	a,d
   463C B3            [ 4]  733 	or	a,e
   463D 20 15         [12]  734 	jr	NZ,00139$
                            735 ;src/main.c:160: p.rebote = 6;
   463F DD 6E EE      [19]  736 	ld	l,-18 (ix)
   4642 DD 66 EF      [19]  737 	ld	h,-17 (ix)
   4645 36 06         [10]  738 	ld	(hl),#0x06
   4647 23            [ 6]  739 	inc	hl
   4648 36 00         [10]  740 	ld	(hl),#0x00
                            741 ;src/main.c:161: p.col = 0;
   464A DD 6E F0      [19]  742 	ld	l,-16 (ix)
   464D DD 66 F1      [19]  743 	ld	h,-15 (ix)
   4650 AF            [ 4]  744 	xor	a, a
   4651 77            [ 7]  745 	ld	(hl), a
   4652 23            [ 6]  746 	inc	hl
   4653 77            [ 7]  747 	ld	(hl), a
   4654                     748 00139$:
                            749 ;src/main.c:166: sprite = checkSprite(p.atk,p.dir);
   4654 DD 6E FA      [19]  750 	ld	l,-6 (ix)
   4657 DD 66 FB      [19]  751 	ld	h,-5 (ix)
   465A 4E            [ 7]  752 	ld	c,(hl)
   465B 23            [ 6]  753 	inc	hl
   465C 46            [ 7]  754 	ld	b,(hl)
   465D DD 6E FE      [19]  755 	ld	l,-2 (ix)
   4660 DD 66 FF      [19]  756 	ld	h,-1 (ix)
   4663 5E            [ 7]  757 	ld	e,(hl)
   4664 23            [ 6]  758 	inc	hl
   4665 56            [ 7]  759 	ld	d,(hl)
   4666 C5            [11]  760 	push	bc
   4667 D5            [11]  761 	push	de
   4668 CD 29 43      [17]  762 	call	_checkSprite
   466B F1            [10]  763 	pop	af
   466C F1            [10]  764 	pop	af
   466D 4D            [ 4]  765 	ld	c, l
   466E 44            [ 4]  766 	ld	b, h
                            767 ;src/main.c:168: if(p.col != 2 && e.vivo == 0)
   466F DD 6E F0      [19]  768 	ld	l,-16 (ix)
   4672 DD 66 F1      [19]  769 	ld	h,-15 (ix)
   4675 56            [ 7]  770 	ld	d,(hl)
   4676 23            [ 6]  771 	inc	hl
   4677 66            [ 7]  772 	ld	h,(hl)
   4678 7A            [ 4]  773 	ld	a,d
   4679 D6 02         [ 7]  774 	sub	a,#0x02
   467B 20 03         [12]  775 	jr	NZ,00250$
   467D B4            [ 4]  776 	or	a,h
   467E 28 7B         [12]  777 	jr	Z,00141$
   4680                     778 00250$:
   4680 DD 6E F6      [19]  779 	ld	l,-10 (ix)
   4683 DD 66 F7      [19]  780 	ld	h,-9 (ix)
   4686 7E            [ 7]  781 	ld	a,(hl)
   4687 B7            [ 4]  782 	or	a, a
   4688 20 71         [12]  783 	jr	NZ,00141$
                            784 ;src/main.c:169: p.col = checkCollisions(p.x,p.y,e.x,e.y,p.dir,p.atk);
   468A DD 6E FE      [19]  785 	ld	l,-2 (ix)
   468D DD 66 FF      [19]  786 	ld	h,-1 (ix)
   4690 7E            [ 7]  787 	ld	a,(hl)
   4691 DD 77 E8      [19]  788 	ld	-24 (ix),a
   4694 23            [ 6]  789 	inc	hl
   4695 7E            [ 7]  790 	ld	a,(hl)
   4696 DD 77 E9      [19]  791 	ld	-23 (ix),a
   4699 DD 6E FA      [19]  792 	ld	l,-6 (ix)
   469C DD 66 FB      [19]  793 	ld	h,-5 (ix)
   469F 7E            [ 7]  794 	ld	a,(hl)
   46A0 DD 77 F4      [19]  795 	ld	-12 (ix),a
   46A3 23            [ 6]  796 	inc	hl
   46A4 7E            [ 7]  797 	ld	a,(hl)
   46A5 DD 77 F5      [19]  798 	ld	-11 (ix),a
   46A8 DD 6E F2      [19]  799 	ld	l,-14 (ix)
   46AB DD 66 F3      [19]  800 	ld	h,-13 (ix)
   46AE 5E            [ 7]  801 	ld	e,(hl)
   46AF DD 6E EC      [19]  802 	ld	l,-20 (ix)
   46B2 DD 66 ED      [19]  803 	ld	h,-19 (ix)
   46B5 7E            [ 7]  804 	ld	a,(hl)
   46B6 DD 77 EA      [19]  805 	ld	-22 (ix),a
   46B9 DD 6E FC      [19]  806 	ld	l,-4 (ix)
   46BC DD 66 FD      [19]  807 	ld	h,-3 (ix)
   46BF 7E            [ 7]  808 	ld	a,(hl)
   46C0 DD 77 EB      [19]  809 	ld	-21 (ix),a
   46C3 DD 6E F8      [19]  810 	ld	l,-8 (ix)
   46C6 DD 66 F9      [19]  811 	ld	h,-7 (ix)
   46C9 56            [ 7]  812 	ld	d,(hl)
   46CA C5            [11]  813 	push	bc
   46CB DD 6E E8      [19]  814 	ld	l,-24 (ix)
   46CE DD 66 E9      [19]  815 	ld	h,-23 (ix)
   46D1 E5            [11]  816 	push	hl
   46D2 DD 6E F4      [19]  817 	ld	l,-12 (ix)
   46D5 DD 66 F5      [19]  818 	ld	h,-11 (ix)
   46D8 E5            [11]  819 	push	hl
   46D9 7B            [ 4]  820 	ld	a,e
   46DA F5            [11]  821 	push	af
   46DB 33            [ 6]  822 	inc	sp
   46DC DD 7E EA      [19]  823 	ld	a,-22 (ix)
   46DF F5            [11]  824 	push	af
   46E0 33            [ 6]  825 	inc	sp
   46E1 DD 7E EB      [19]  826 	ld	a,-21 (ix)
   46E4 F5            [11]  827 	push	af
   46E5 33            [ 6]  828 	inc	sp
   46E6 D5            [11]  829 	push	de
   46E7 33            [ 6]  830 	inc	sp
   46E8 CD 95 42      [17]  831 	call	_checkCollisions
   46EB F1            [10]  832 	pop	af
   46EC F1            [10]  833 	pop	af
   46ED F1            [10]  834 	pop	af
   46EE F1            [10]  835 	pop	af
   46EF 55            [ 4]  836 	ld	d,l
   46F0 5C            [ 4]  837 	ld	e,h
   46F1 C1            [10]  838 	pop	bc
   46F2 DD 6E F0      [19]  839 	ld	l,-16 (ix)
   46F5 DD 66 F1      [19]  840 	ld	h,-15 (ix)
   46F8 72            [ 7]  841 	ld	(hl),d
   46F9 23            [ 6]  842 	inc	hl
   46FA 73            [ 7]  843 	ld	(hl),e
   46FB                     844 00141$:
                            845 ;src/main.c:170: if(p.col == 1)
   46FB DD 6E F0      [19]  846 	ld	l,-16 (ix)
   46FE DD 66 F1      [19]  847 	ld	h,-15 (ix)
   4701 56            [ 7]  848 	ld	d,(hl)
   4702 23            [ 6]  849 	inc	hl
   4703 66            [ 7]  850 	ld	h,(hl)
   4704 15            [ 4]  851 	dec	d
   4705 20 0C         [12]  852 	jr	NZ,00144$
   4707 7C            [ 4]  853 	ld	a,h
   4708 B7            [ 4]  854 	or	a, a
   4709 20 08         [12]  855 	jr	NZ,00144$
                            856 ;src/main.c:171: e.vivo = 1;
   470B DD 6E F6      [19]  857 	ld	l,-10 (ix)
   470E DD 66 F7      [19]  858 	ld	h,-9 (ix)
   4711 36 01         [10]  859 	ld	(hl),#0x01
   4713                     860 00144$:
                            861 ;src/main.c:174: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4713 DD 6E FC      [19]  862 	ld	l,-4 (ix)
   4716 DD 66 FD      [19]  863 	ld	h,-3 (ix)
   4719 56            [ 7]  864 	ld	d,(hl)
   471A DD 6E F8      [19]  865 	ld	l,-8 (ix)
   471D DD 66 F9      [19]  866 	ld	h,-7 (ix)
   4720 7E            [ 7]  867 	ld	a,(hl)
   4721 C5            [11]  868 	push	bc
   4722 D5            [11]  869 	push	de
   4723 33            [ 6]  870 	inc	sp
   4724 F5            [11]  871 	push	af
   4725 33            [ 6]  872 	inc	sp
   4726 21 00 C0      [10]  873 	ld	hl,#0xC000
   4729 E5            [11]  874 	push	hl
   472A CD 97 4B      [17]  875 	call	_cpct_getScreenPtr
   472D C1            [10]  876 	pop	bc
   472E EB            [ 4]  877 	ex	de,hl
                            878 ;src/main.c:177: if(p.atk >= 21)
   472F DD 6E FE      [19]  879 	ld	l,-2 (ix)
   4732 DD 66 FF      [19]  880 	ld	h,-1 (ix)
   4735 7E            [ 7]  881 	ld	a, (hl)
   4736 23            [ 6]  882 	inc	hl
   4737 6E            [ 7]  883 	ld	l,(hl)
                            884 ;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
                            885 ;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
                            886 ;src/main.c:177: if(p.atk >= 21)
   4738 D6 15         [ 7]  887 	sub	a, #0x15
   473A 7D            [ 4]  888 	ld	a,l
   473B DE 00         [ 7]  889 	sbc	a, #0x00
   473D 38 0B         [12]  890 	jr	C,00146$
                            891 ;src/main.c:178: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   473F 21 05 10      [10]  892 	ld	hl,#0x1005
   4742 E5            [11]  893 	push	hl
   4743 D5            [11]  894 	push	de
   4744 C5            [11]  895 	push	bc
   4745 CD 59 4A      [17]  896 	call	_cpct_drawSpriteMasked
   4748 18 09         [12]  897 	jr	00147$
   474A                     898 00146$:
                            899 ;src/main.c:180: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   474A 21 04 10      [10]  900 	ld	hl,#0x1004
   474D E5            [11]  901 	push	hl
   474E D5            [11]  902 	push	de
   474F C5            [11]  903 	push	bc
   4750 CD 59 4A      [17]  904 	call	_cpct_drawSpriteMasked
   4753                     905 00147$:
                            906 ;src/main.c:183: if(e.vivo == 0){
   4753 DD 6E F6      [19]  907 	ld	l,-10 (ix)
   4756 DD 66 F7      [19]  908 	ld	h,-9 (ix)
   4759 7E            [ 7]  909 	ld	a,(hl)
   475A B7            [ 4]  910 	or	a, a
   475B C2 49 44      [10]  911 	jp	NZ,00151$
                            912 ;src/main.c:184: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   475E DD 6E F2      [19]  913 	ld	l,-14 (ix)
   4761 DD 66 F3      [19]  914 	ld	h,-13 (ix)
   4764 56            [ 7]  915 	ld	d,(hl)
   4765 DD 6E EC      [19]  916 	ld	l,-20 (ix)
   4768 DD 66 ED      [19]  917 	ld	h,-19 (ix)
   476B 46            [ 7]  918 	ld	b,(hl)
   476C D5            [11]  919 	push	de
   476D 33            [ 6]  920 	inc	sp
   476E C5            [11]  921 	push	bc
   476F 33            [ 6]  922 	inc	sp
   4770 21 00 C0      [10]  923 	ld	hl,#0xC000
   4773 E5            [11]  924 	push	hl
   4774 CD 97 4B      [17]  925 	call	_cpct_getScreenPtr
                            926 ;src/main.c:185: cpct_drawSolidBox(memptr, 18, 4, 16);
   4777 EB            [ 4]  927 	ex	de,hl
   4778 21 04 10      [10]  928 	ld	hl,#0x1004
   477B E5            [11]  929 	push	hl
   477C 3E 12         [ 7]  930 	ld	a,#0x12
   477E F5            [11]  931 	push	af
   477F 33            [ 6]  932 	inc	sp
   4780 D5            [11]  933 	push	de
   4781 CD DF 4A      [17]  934 	call	_cpct_drawSolidBox
   4784 F1            [10]  935 	pop	af
   4785 F1            [10]  936 	pop	af
   4786 33            [ 6]  937 	inc	sp
   4787 C3 49 44      [10]  938 	jp	00151$
   478A                     939 00153$:
   478A DD F9         [10]  940 	ld	sp, ix
   478C DD E1         [14]  941 	pop	ix
   478E C9            [10]  942 	ret
                            943 ;src/main.c:192: void main(void) {
                            944 ;	---------------------------------
                            945 ; Function main
                            946 ; ---------------------------------
   478F                     947 _main::
                            948 ;src/main.c:194: init();
   478F CD 00 42      [17]  949 	call	_init
                            950 ;src/main.c:197: while(1){
   4792                     951 00102$:
                            952 ;src/main.c:198: menu();
   4792 CD 29 42      [17]  953 	call	_menu
                            954 ;src/main.c:199: game();
   4795 CD 5D 43      [17]  955 	call	_game
   4798 18 F8         [12]  956 	jr	00102$
                            957 	.area _CODE
                            958 	.area _INITIALIZER
                            959 	.area _CABS (ABS)
