                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Thu Oct  1 16:38:38 2015
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
                             62 ;src/main.c:40: void init(){
                             63 ;	---------------------------------
                             64 ; Function init
                             65 ; ---------------------------------
   4200                      66 _init::
                             67 ;src/main.c:41: cpct_disableFirmware();
   4200 CD 9F 4A      [17]   68 	call	_cpct_disableFirmware
                             69 ;src/main.c:42: cpct_setVideoMode(0);
   4203 AF            [ 4]   70 	xor	a, a
   4204 F5            [11]   71 	push	af
   4205 33            [ 6]   72 	inc	sp
   4206 CD 7C 4A      [17]   73 	call	_cpct_setVideoMode
   4209 33            [ 6]   74 	inc	sp
                             75 ;src/main.c:43: cpct_fw2hw(g_palette,4);
   420A 11 25 42      [10]   76 	ld	de,#_g_palette
   420D 3E 04         [ 7]   77 	ld	a,#0x04
   420F F5            [11]   78 	push	af
   4210 33            [ 6]   79 	inc	sp
   4211 D5            [11]   80 	push	de
   4212 CD 06 4A      [17]   81 	call	_cpct_fw2hw
   4215 F1            [10]   82 	pop	af
   4216 33            [ 6]   83 	inc	sp
                             84 ;src/main.c:44: cpct_setPalette(g_palette,4);
   4217 11 25 42      [10]   85 	ld	de,#_g_palette
   421A 3E 04         [ 7]   86 	ld	a,#0x04
   421C F5            [11]   87 	push	af
   421D 33            [ 6]   88 	inc	sp
   421E D5            [11]   89 	push	de
   421F CD AB 48      [17]   90 	call	_cpct_setPalette
   4222 F1            [10]   91 	pop	af
   4223 33            [ 6]   92 	inc	sp
   4224 C9            [10]   93 	ret
   4225                      94 _g_palette:
   4225 00                   95 	.db #0x00	; 0
   4226 1A                   96 	.db #0x1A	; 26
   4227 06                   97 	.db #0x06	; 6
   4228 12                   98 	.db #0x12	; 18
                             99 ;src/main.c:48: void menu(){
                            100 ;	---------------------------------
                            101 ; Function menu
                            102 ; ---------------------------------
   4229                     103 _menu::
                            104 ;src/main.c:50: cpct_clearScreen(0);
   4229 21 00 40      [10]  105 	ld	hl,#0x4000
   422C E5            [11]  106 	push	hl
   422D AF            [ 4]  107 	xor	a, a
   422E F5            [11]  108 	push	af
   422F 33            [ 6]  109 	inc	sp
   4230 26 C0         [ 7]  110 	ld	h, #0xC0
   4232 E5            [11]  111 	push	hl
   4233 CD 8E 4A      [17]  112 	call	_cpct_memset
                            113 ;src/main.c:52: memptr = cpct_getScreenPtr(VMEM,20,10);
   4236 21 14 0A      [10]  114 	ld	hl,#0x0A14
   4239 E5            [11]  115 	push	hl
   423A 21 00 C0      [10]  116 	ld	hl,#0xC000
   423D E5            [11]  117 	push	hl
   423E CD 68 4B      [17]  118 	call	_cpct_getScreenPtr
                            119 ;src/main.c:53: cpct_drawStringM0("Super Menu",memptr,2,3);
   4241 EB            [ 4]  120 	ex	de,hl
   4242 01 7E 42      [10]  121 	ld	bc,#___str_0+0
   4245 21 02 03      [10]  122 	ld	hl,#0x0302
   4248 E5            [11]  123 	push	hl
   4249 D5            [11]  124 	push	de
   424A C5            [11]  125 	push	bc
   424B CD 45 49      [17]  126 	call	_cpct_drawStringM0
   424E 21 06 00      [10]  127 	ld	hl,#6
   4251 39            [11]  128 	add	hl,sp
   4252 F9            [ 6]  129 	ld	sp,hl
                            130 ;src/main.c:55: memptr = cpct_getScreenPtr(VMEM,18,180);
   4253 21 12 B4      [10]  131 	ld	hl,#0xB412
   4256 E5            [11]  132 	push	hl
   4257 21 00 C0      [10]  133 	ld	hl,#0xC000
   425A E5            [11]  134 	push	hl
   425B CD 68 4B      [17]  135 	call	_cpct_getScreenPtr
                            136 ;src/main.c:56: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   425E EB            [ 4]  137 	ex	de,hl
   425F 01 89 42      [10]  138 	ld	bc,#___str_1+0
   4262 21 04 05      [10]  139 	ld	hl,#0x0504
   4265 E5            [11]  140 	push	hl
   4266 D5            [11]  141 	push	de
   4267 C5            [11]  142 	push	bc
   4268 CD 45 49      [17]  143 	call	_cpct_drawStringM0
   426B 21 06 00      [10]  144 	ld	hl,#6
   426E 39            [11]  145 	add	hl,sp
   426F F9            [ 6]  146 	ld	sp,hl
                            147 ;src/main.c:58: do{
   4270                     148 00101$:
                            149 ;src/main.c:59: cpct_scanKeyboard_f();
   4270 CD DB 48      [17]  150 	call	_cpct_scanKeyboard_f
                            151 ;src/main.c:60: }while(!cpct_isKeyPressed(Key_Enter));
   4273 21 00 40      [10]  152 	ld	hl,#0x4000
   4276 CD CF 48      [17]  153 	call	_cpct_isKeyPressed
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
                            164 ;src/main.c:65: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            165 ;	---------------------------------
                            166 ; Function checkCollisions
                            167 ; ---------------------------------
   4295                     168 _checkCollisions::
   4295 DD E5         [15]  169 	push	ix
   4297 DD 21 00 00   [14]  170 	ld	ix,#0
   429B DD 39         [15]  171 	add	ix,sp
                            172 ;src/main.c:68: if(eX - pX > -1 && eX - pX < 11)
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
                            183 ;src/main.c:66: if(atk >= 21)
   42AD DD 7E 0A      [19]  184 	ld	a,10 (ix)
   42B0 D6 15         [ 7]  185 	sub	a, #0x15
   42B2 DD 7E 0B      [19]  186 	ld	a,11 (ix)
   42B5 DE 00         [ 7]  187 	sbc	a, #0x00
   42B7 38 4F         [12]  188 	jr	C,00116$
                            189 ;src/main.c:67: if(dir == 0)
   42B9 DD 7E 09      [19]  190 	ld	a,9 (ix)
   42BC DD B6 08      [19]  191 	or	a,8 (ix)
   42BF 20 21         [12]  192 	jr	NZ,00110$
                            193 ;src/main.c:68: if(eX - pX > -1 && eX - pX < 11)
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
                            209 ;src/main.c:69: return 1;
   42D8 21 01 00      [10]  210 	ld	hl,#0x0001
   42DB 18 49         [12]  211 	jr	00118$
   42DD                     212 00102$:
                            213 ;src/main.c:71: return 0;
   42DD 21 00 00      [10]  214 	ld	hl,#0x0000
   42E0 18 44         [12]  215 	jr	00118$
   42E2                     216 00110$:
                            217 ;src/main.c:73: if(pX - eX > -1 && pX - eX < 11)
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
                            234 ;src/main.c:74: return 1;
   42FE 21 01 00      [10]  235 	ld	hl,#0x0001
   4301 18 23         [12]  236 	jr	00118$
   4303                     237 00106$:
                            238 ;src/main.c:76: return 0;
   4303 21 00 00      [10]  239 	ld	hl,#0x0000
   4306 18 1E         [12]  240 	jr	00118$
   4308                     241 00116$:
                            242 ;src/main.c:78: if(eX - pX > 0 && eX - pX < 4)
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
                            258 ;src/main.c:79: return 2;
   431E 21 02 00      [10]  259 	ld	hl,#0x0002
   4321 18 03         [12]  260 	jr	00118$
   4323                     261 00117$:
                            262 ;src/main.c:81: return 0;
   4323 21 00 00      [10]  263 	ld	hl,#0x0000
   4326                     264 00118$:
   4326 DD E1         [14]  265 	pop	ix
   4328 C9            [10]  266 	ret
                            267 ;src/main.c:84: u8* checkSprite(u8* atk, u8* dir){
                            268 ;	---------------------------------
                            269 ; Function checkSprite
                            270 ; ---------------------------------
   4329                     271 _checkSprite::
                            272 ;src/main.c:85: if(atk <= 20)
   4329 3E 14         [ 7]  273 	ld	a,#0x14
   432B FD 21 02 00   [14]  274 	ld	iy,#2
   432F FD 39         [15]  275 	add	iy,sp
   4331 FD BE 00      [19]  276 	cp	a, 0 (iy)
   4334 3E 00         [ 7]  277 	ld	a,#0x00
   4336 FD 9E 01      [19]  278 	sbc	a, 1 (iy)
   4339 38 11         [12]  279 	jr	C,00108$
                            280 ;src/main.c:86: if(dir == 0)
   433B 21 05 00      [10]  281 	ld	hl, #4+1
   433E 39            [11]  282 	add	hl, sp
   433F 7E            [ 7]  283 	ld	a, (hl)
   4340 2B            [ 6]  284 	dec	hl
   4341 B6            [ 7]  285 	or	a,(hl)
   4342 20 04         [12]  286 	jr	NZ,00102$
                            287 ;src/main.c:87: return gladis_quieto_dcha;
   4344 21 00 41      [10]  288 	ld	hl,#_gladis_quieto_dcha
   4347 C9            [10]  289 	ret
   4348                     290 00102$:
                            291 ;src/main.c:89: return gladis_quieto_izda;
   4348 21 80 41      [10]  292 	ld	hl,#_gladis_quieto_izda
   434B C9            [10]  293 	ret
   434C                     294 00108$:
                            295 ;src/main.c:90: else if(dir == 0){
   434C 21 05 00      [10]  296 	ld	hl, #4+1
   434F 39            [11]  297 	add	hl, sp
   4350 7E            [ 7]  298 	ld	a, (hl)
   4351 2B            [ 6]  299 	dec	hl
   4352 B6            [ 7]  300 	or	a,(hl)
   4353 20 04         [12]  301 	jr	NZ,00105$
                            302 ;src/main.c:91: return gladis_atk_dcha;
   4355 21 6B 47      [10]  303 	ld	hl,#_gladis_atk_dcha
   4358 C9            [10]  304 	ret
   4359                     305 00105$:
                            306 ;src/main.c:93: return gladis_atk_izda;
   4359 21 0B 48      [10]  307 	ld	hl,#_gladis_atk_izda
   435C C9            [10]  308 	ret
                            309 ;src/main.c:99: void game(){
                            310 ;	---------------------------------
                            311 ; Function game
                            312 ; ---------------------------------
   435D                     313 _game::
   435D DD E5         [15]  314 	push	ix
   435F DD 21 00 00   [14]  315 	ld	ix,#0
   4363 DD 39         [15]  316 	add	ix,sp
   4365 21 E4 FF      [10]  317 	ld	hl,#-28
   4368 39            [11]  318 	add	hl,sp
   4369 F9            [ 6]  319 	ld	sp,hl
                            320 ;src/main.c:100: TPlayer p = { 0,100 };
   436A 21 05 00      [10]  321 	ld	hl,#0x0005
   436D 39            [11]  322 	add	hl,sp
   436E 36 00         [10]  323 	ld	(hl),#0x00
   4370 21 05 00      [10]  324 	ld	hl,#0x0005
   4373 39            [11]  325 	add	hl,sp
   4374 DD 75 F3      [19]  326 	ld	-13 (ix),l
   4377 DD 74 F4      [19]  327 	ld	-12 (ix),h
   437A DD 7E F3      [19]  328 	ld	a,-13 (ix)
   437D C6 01         [ 7]  329 	add	a, #0x01
   437F DD 77 F5      [19]  330 	ld	-11 (ix),a
   4382 DD 7E F4      [19]  331 	ld	a,-12 (ix)
   4385 CE 00         [ 7]  332 	adc	a, #0x00
   4387 DD 77 F6      [19]  333 	ld	-10 (ix),a
   438A DD 6E F5      [19]  334 	ld	l,-11 (ix)
   438D DD 66 F6      [19]  335 	ld	h,-10 (ix)
   4390 36 64         [10]  336 	ld	(hl),#0x64
                            337 ;src/main.c:101: TEnemy  e = { 55,100,0 };
   4392 21 02 00      [10]  338 	ld	hl,#0x0002
   4395 39            [11]  339 	add	hl,sp
   4396 36 37         [10]  340 	ld	(hl),#0x37
   4398 21 02 00      [10]  341 	ld	hl,#0x0002
   439B 39            [11]  342 	add	hl,sp
   439C DD 75 FC      [19]  343 	ld	-4 (ix),l
   439F DD 74 FD      [19]  344 	ld	-3 (ix),h
   43A2 DD 7E FC      [19]  345 	ld	a,-4 (ix)
   43A5 C6 01         [ 7]  346 	add	a, #0x01
   43A7 DD 77 F1      [19]  347 	ld	-15 (ix),a
   43AA DD 7E FD      [19]  348 	ld	a,-3 (ix)
   43AD CE 00         [ 7]  349 	adc	a, #0x00
   43AF DD 77 F2      [19]  350 	ld	-14 (ix),a
   43B2 DD 6E F1      [19]  351 	ld	l,-15 (ix)
   43B5 DD 66 F2      [19]  352 	ld	h,-14 (ix)
   43B8 36 64         [10]  353 	ld	(hl),#0x64
   43BA DD 7E FC      [19]  354 	ld	a,-4 (ix)
   43BD C6 02         [ 7]  355 	add	a, #0x02
   43BF DD 77 F8      [19]  356 	ld	-8 (ix),a
   43C2 DD 7E FD      [19]  357 	ld	a,-3 (ix)
   43C5 CE 00         [ 7]  358 	adc	a, #0x00
   43C7 DD 77 F9      [19]  359 	ld	-7 (ix),a
   43CA DD 6E F8      [19]  360 	ld	l,-8 (ix)
   43CD DD 66 F9      [19]  361 	ld	h,-7 (ix)
   43D0 36 00         [10]  362 	ld	(hl),#0x00
                            363 ;src/main.c:104: u8* dir = 0;
   43D2 DD 36 EF 00   [19]  364 	ld	-17 (ix),#0x00
   43D6 DD 36 F0 00   [19]  365 	ld	-16 (ix),#0x00
                            366 ;src/main.c:105: u8* atk = 20;
   43DA DD 36 ED 14   [19]  367 	ld	-19 (ix),#0x14
   43DE DD 36 EE 00   [19]  368 	ld	-18 (ix),#0x00
                            369 ;src/main.c:106: u8* col = 0;
   43E2 DD 36 EB 00   [19]  370 	ld	-21 (ix),#0x00
   43E6 DD 36 EC 00   [19]  371 	ld	-20 (ix),#0x00
                            372 ;src/main.c:107: u8* rebote = 6;
   43EA 21 06 00      [10]  373 	ld	hl,#0x0006
   43ED E3            [19]  374 	ex	(sp), hl
                            375 ;src/main.c:109: cpct_clearScreen(0);
   43EE 21 00 40      [10]  376 	ld	hl,#0x4000
   43F1 E5            [11]  377 	push	hl
   43F2 AF            [ 4]  378 	xor	a, a
   43F3 F5            [11]  379 	push	af
   43F4 33            [ 6]  380 	inc	sp
   43F5 26 C0         [ 7]  381 	ld	h, #0xC0
   43F7 E5            [11]  382 	push	hl
   43F8 CD 8E 4A      [17]  383 	call	_cpct_memset
                            384 ;src/main.c:111: while (1){
   43FB                     385 00154$:
                            386 ;src/main.c:114: cpct_waitVSYNC();
   43FB CD 74 4A      [17]  387 	call	_cpct_waitVSYNC
                            388 ;src/main.c:117: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   43FE DD 6E F5      [19]  389 	ld	l,-11 (ix)
   4401 DD 66 F6      [19]  390 	ld	h,-10 (ix)
   4404 46            [ 7]  391 	ld	b,(hl)
   4405 DD 6E F3      [19]  392 	ld	l,-13 (ix)
   4408 DD 66 F4      [19]  393 	ld	h,-12 (ix)
   440B 4E            [ 7]  394 	ld	c, (hl)
   440C C5            [11]  395 	push	bc
   440D 21 00 C0      [10]  396 	ld	hl,#0xC000
   4410 E5            [11]  397 	push	hl
   4411 CD 68 4B      [17]  398 	call	_cpct_getScreenPtr
                            399 ;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
   4414 4D            [ 4]  400 	ld	c, l
   4415 44            [ 4]  401 	ld	b, h
                            402 ;src/main.c:118: if(atk <= 20)
   4416 3E 14         [ 7]  403 	ld	a,#0x14
   4418 DD BE ED      [19]  404 	cp	a, -19 (ix)
   441B 3E 00         [ 7]  405 	ld	a,#0x00
   441D DD 9E EE      [19]  406 	sbc	a, -18 (ix)
   4420 38 10         [12]  407 	jr	C,00102$
                            408 ;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
   4422 21 04 10      [10]  409 	ld	hl,#0x1004
   4425 E5            [11]  410 	push	hl
   4426 AF            [ 4]  411 	xor	a, a
   4427 F5            [11]  412 	push	af
   4428 33            [ 6]  413 	inc	sp
   4429 C5            [11]  414 	push	bc
   442A CD B0 4A      [17]  415 	call	_cpct_drawSolidBox
   442D F1            [10]  416 	pop	af
   442E F1            [10]  417 	pop	af
   442F 33            [ 6]  418 	inc	sp
   4430 18 0E         [12]  419 	jr	00103$
   4432                     420 00102$:
                            421 ;src/main.c:121: cpct_drawSolidBox(memptr,0,5,16);
   4432 21 05 10      [10]  422 	ld	hl,#0x1005
   4435 E5            [11]  423 	push	hl
   4436 AF            [ 4]  424 	xor	a, a
   4437 F5            [11]  425 	push	af
   4438 33            [ 6]  426 	inc	sp
   4439 C5            [11]  427 	push	bc
   443A CD B0 4A      [17]  428 	call	_cpct_drawSolidBox
   443D F1            [10]  429 	pop	af
   443E F1            [10]  430 	pop	af
   443F 33            [ 6]  431 	inc	sp
   4440                     432 00103$:
                            433 ;src/main.c:123: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4440 DD 6E F1      [19]  434 	ld	l,-15 (ix)
   4443 DD 66 F2      [19]  435 	ld	h,-14 (ix)
   4446 46            [ 7]  436 	ld	b,(hl)
   4447 DD 6E FC      [19]  437 	ld	l,-4 (ix)
   444A DD 66 FD      [19]  438 	ld	h,-3 (ix)
   444D 4E            [ 7]  439 	ld	c, (hl)
   444E C5            [11]  440 	push	bc
   444F 21 00 C0      [10]  441 	ld	hl,#0xC000
   4452 E5            [11]  442 	push	hl
   4453 CD 68 4B      [17]  443 	call	_cpct_getScreenPtr
   4456 EB            [ 4]  444 	ex	de,hl
                            445 ;src/main.c:124: if(e.vivo == 0)
   4457 DD 6E F8      [19]  446 	ld	l,-8 (ix)
   445A DD 66 F9      [19]  447 	ld	h,-7 (ix)
   445D 7E            [ 7]  448 	ld	a,(hl)
   445E B7            [ 4]  449 	or	a, a
   445F 20 0E         [12]  450 	jr	NZ,00105$
                            451 ;src/main.c:125: cpct_drawSolidBox(memptr,0,4,16);
   4461 21 04 10      [10]  452 	ld	hl,#0x1004
   4464 E5            [11]  453 	push	hl
   4465 AF            [ 4]  454 	xor	a, a
   4466 F5            [11]  455 	push	af
   4467 33            [ 6]  456 	inc	sp
   4468 D5            [11]  457 	push	de
   4469 CD B0 4A      [17]  458 	call	_cpct_drawSolidBox
   446C F1            [10]  459 	pop	af
   446D F1            [10]  460 	pop	af
   446E 33            [ 6]  461 	inc	sp
   446F                     462 00105$:
                            463 ;src/main.c:129: if(col != 2){
   446F DD 7E EB      [19]  464 	ld	a,-21 (ix)
   4472 D6 02         [ 7]  465 	sub	a, #0x02
   4474 20 0A         [12]  466 	jr	NZ,00265$
   4476 DD 7E EC      [19]  467 	ld	a,-20 (ix)
   4479 B7            [ 4]  468 	or	a, a
   447A 20 04         [12]  469 	jr	NZ,00265$
   447C 3E 01         [ 7]  470 	ld	a,#0x01
   447E 18 01         [12]  471 	jr	00266$
   4480                     472 00265$:
   4480 AF            [ 4]  473 	xor	a,a
   4481                     474 00266$:
   4481 DD 77 FB      [19]  475 	ld	-5 (ix), a
   4484 B7            [ 4]  476 	or	a, a
   4485 C2 91 45      [10]  477 	jp	NZ,00138$
                            478 ;src/main.c:130: cpct_scanKeyboard_f();
   4488 CD DB 48      [17]  479 	call	_cpct_scanKeyboard_f
                            480 ;src/main.c:131: if(cpct_isKeyPressed(Key_Space) && atk >= 20){
   448B 21 05 80      [10]  481 	ld	hl,#0x8005
   448E CD CF 48      [17]  482 	call	_cpct_isKeyPressed
   4491 DD 75 FA      [19]  483 	ld	-6 (ix),l
   4494 DD 7E ED      [19]  484 	ld	a,-19 (ix)
   4497 D6 14         [ 7]  485 	sub	a, #0x14
   4499 DD 7E EE      [19]  486 	ld	a,-18 (ix)
   449C DE 00         [ 7]  487 	sbc	a, #0x00
   449E 3E 00         [ 7]  488 	ld	a,#0x00
   44A0 17            [ 4]  489 	rla
   44A1 DD 77 F7      [19]  490 	ld	-9 (ix),a
                            491 ;src/main.c:135: atk += 1;
   44A4 DD 7E ED      [19]  492 	ld	a,-19 (ix)
   44A7 C6 01         [ 7]  493 	add	a, #0x01
   44A9 DD 77 FE      [19]  494 	ld	-2 (ix),a
   44AC DD 7E EE      [19]  495 	ld	a,-18 (ix)
   44AF CE 00         [ 7]  496 	adc	a, #0x00
   44B1 DD 77 FF      [19]  497 	ld	-1 (ix),a
                            498 ;src/main.c:131: if(cpct_isKeyPressed(Key_Space) && atk >= 20){
   44B4 DD 7E FA      [19]  499 	ld	a,-6 (ix)
   44B7 B7            [ 4]  500 	or	a, a
   44B8 28 53         [12]  501 	jr	Z,00132$
   44BA DD 7E F7      [19]  502 	ld	a,-9 (ix)
   44BD B7            [ 4]  503 	or	a, a
   44BE 20 4D         [12]  504 	jr	NZ,00132$
                            505 ;src/main.c:132: if(atk >= 50)
   44C0 DD 7E ED      [19]  506 	ld	a,-19 (ix)
   44C3 D6 32         [ 7]  507 	sub	a, #0x32
   44C5 DD 7E EE      [19]  508 	ld	a,-18 (ix)
   44C8 DE 00         [ 7]  509 	sbc	a, #0x00
   44CA 38 0A         [12]  510 	jr	C,00107$
                            511 ;src/main.c:133: atk = 0;
   44CC DD 36 ED 00   [19]  512 	ld	-19 (ix),#0x00
   44D0 DD 36 EE 00   [19]  513 	ld	-18 (ix),#0x00
   44D4 18 0C         [12]  514 	jr	00108$
   44D6                     515 00107$:
                            516 ;src/main.c:135: atk += 1;
   44D6 DD 7E FE      [19]  517 	ld	a,-2 (ix)
   44D9 DD 77 ED      [19]  518 	ld	-19 (ix),a
   44DC DD 7E FF      [19]  519 	ld	a,-1 (ix)
   44DF DD 77 EE      [19]  520 	ld	-18 (ix),a
   44E2                     521 00108$:
                            522 ;src/main.c:136: if(cpct_isKeyPressed(Key_CursorRight))
   44E2 21 00 02      [10]  523 	ld	hl,#0x0200
   44E5 CD CF 48      [17]  524 	call	_cpct_isKeyPressed
   44E8 7D            [ 4]  525 	ld	a,l
   44E9 B7            [ 4]  526 	or	a, a
   44EA 28 0B         [12]  527 	jr	Z,00112$
                            528 ;src/main.c:137: dir = 0;
   44EC DD 36 EF 00   [19]  529 	ld	-17 (ix),#0x00
   44F0 DD 36 F0 00   [19]  530 	ld	-16 (ix),#0x00
   44F4 C3 BC 45      [10]  531 	jp	00139$
   44F7                     532 00112$:
                            533 ;src/main.c:138: else if(cpct_isKeyPressed(Key_CursorLeft))
   44F7 21 01 01      [10]  534 	ld	hl,#0x0101
   44FA CD CF 48      [17]  535 	call	_cpct_isKeyPressed
   44FD 7D            [ 4]  536 	ld	a,l
   44FE B7            [ 4]  537 	or	a, a
   44FF CA BC 45      [10]  538 	jp	Z,00139$
                            539 ;src/main.c:139: dir = 1;
   4502 DD 36 EF 01   [19]  540 	ld	-17 (ix),#0x01
   4506 DD 36 F0 00   [19]  541 	ld	-16 (ix),#0x00
   450A C3 BC 45      [10]  542 	jp	00139$
   450D                     543 00132$:
                            544 ;src/main.c:141: if(atk < 20)
   450D DD 7E F7      [19]  545 	ld	a,-9 (ix)
   4510 B7            [ 4]  546 	or	a, a
   4511 28 0E         [12]  547 	jr	Z,00115$
                            548 ;src/main.c:142: atk += 1;
   4513 DD 7E FE      [19]  549 	ld	a,-2 (ix)
   4516 DD 77 ED      [19]  550 	ld	-19 (ix),a
   4519 DD 7E FF      [19]  551 	ld	a,-1 (ix)
   451C DD 77 EE      [19]  552 	ld	-18 (ix),a
   451F 18 08         [12]  553 	jr	00116$
   4521                     554 00115$:
                            555 ;src/main.c:144: atk = 20;
   4521 DD 36 ED 14   [19]  556 	ld	-19 (ix),#0x14
   4525 DD 36 EE 00   [19]  557 	ld	-18 (ix),#0x00
   4529                     558 00116$:
                            559 ;src/main.c:145: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4529 21 00 02      [10]  560 	ld	hl,#0x0200
   452C CD CF 48      [17]  561 	call	_cpct_isKeyPressed
   452F 7D            [ 4]  562 	ld	a,l
   4530 B7            [ 4]  563 	or	a, a
   4531 28 24         [12]  564 	jr	Z,00128$
   4533 DD 6E F3      [19]  565 	ld	l,-13 (ix)
   4536 DD 66 F4      [19]  566 	ld	h,-12 (ix)
   4539 56            [ 7]  567 	ld	d,(hl)
   453A 7A            [ 4]  568 	ld	a,d
   453B D6 4C         [ 7]  569 	sub	a, #0x4C
   453D 30 18         [12]  570 	jr	NC,00128$
                            571 ;src/main.c:146: if(col != 2)
   453F DD 7E FB      [19]  572 	ld	a,-5 (ix)
   4542 B7            [ 4]  573 	or	a, a
   4543 20 08         [12]  574 	jr	NZ,00118$
                            575 ;src/main.c:147: p.x += 1;
   4545 14            [ 4]  576 	inc	d
   4546 DD 6E F3      [19]  577 	ld	l,-13 (ix)
   4549 DD 66 F4      [19]  578 	ld	h,-12 (ix)
   454C 72            [ 7]  579 	ld	(hl),d
   454D                     580 00118$:
                            581 ;src/main.c:148: dir = 0;
   454D DD 36 EF 00   [19]  582 	ld	-17 (ix),#0x00
   4551 DD 36 F0 00   [19]  583 	ld	-16 (ix),#0x00
   4555 18 65         [12]  584 	jr	00139$
   4557                     585 00128$:
                            586 ;src/main.c:149: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4557 21 01 01      [10]  587 	ld	hl,#0x0101
   455A CD CF 48      [17]  588 	call	_cpct_isKeyPressed
   455D 7D            [ 4]  589 	ld	a,l
   455E B7            [ 4]  590 	or	a, a
   455F 28 23         [12]  591 	jr	Z,00124$
   4561 DD 6E F3      [19]  592 	ld	l,-13 (ix)
   4564 DD 66 F4      [19]  593 	ld	h,-12 (ix)
   4567 56            [ 7]  594 	ld	d,(hl)
   4568 7A            [ 4]  595 	ld	a,d
   4569 B7            [ 4]  596 	or	a, a
   456A 28 18         [12]  597 	jr	Z,00124$
                            598 ;src/main.c:150: if(col != 2)
   456C DD 7E FB      [19]  599 	ld	a,-5 (ix)
   456F B7            [ 4]  600 	or	a, a
   4570 20 08         [12]  601 	jr	NZ,00120$
                            602 ;src/main.c:151: p.x -= 1;
   4572 15            [ 4]  603 	dec	d
   4573 DD 6E F3      [19]  604 	ld	l,-13 (ix)
   4576 DD 66 F4      [19]  605 	ld	h,-12 (ix)
   4579 72            [ 7]  606 	ld	(hl),d
   457A                     607 00120$:
                            608 ;src/main.c:152: dir = 1;
   457A DD 36 EF 01   [19]  609 	ld	-17 (ix),#0x01
   457E DD 36 F0 00   [19]  610 	ld	-16 (ix),#0x00
   4582 18 38         [12]  611 	jr	00139$
   4584                     612 00124$:
                            613 ;src/main.c:153: }else  if(cpct_isKeyPressed(Key_Esc)){
   4584 21 08 04      [10]  614 	ld	hl,#0x0408
   4587 CD CF 48      [17]  615 	call	_cpct_isKeyPressed
   458A 7D            [ 4]  616 	ld	a,l
   458B B7            [ 4]  617 	or	a, a
   458C 28 2E         [12]  618 	jr	Z,00139$
                            619 ;src/main.c:154: return;
   458E C3 54 47      [10]  620 	jp	00159$
   4591                     621 00138$:
                            622 ;src/main.c:158: p.x -= 2;
   4591 DD 6E F3      [19]  623 	ld	l,-13 (ix)
   4594 DD 66 F4      [19]  624 	ld	h,-12 (ix)
   4597 7E            [ 7]  625 	ld	a,(hl)
   4598 C6 FE         [ 7]  626 	add	a,#0xFE
   459A DD 6E F3      [19]  627 	ld	l,-13 (ix)
   459D DD 66 F4      [19]  628 	ld	h,-12 (ix)
   45A0 77            [ 7]  629 	ld	(hl),a
                            630 ;src/main.c:159: rebote -= 2;
   45A1 DD 5E E4      [19]  631 	ld	e,-28 (ix)
   45A4 DD 56 E5      [19]  632 	ld	d,-27 (ix)
   45A7 1B            [ 6]  633 	dec	de
   45A8 1B            [ 6]  634 	dec	de
   45A9 33            [ 6]  635 	inc	sp
   45AA 33            [ 6]  636 	inc	sp
   45AB D5            [11]  637 	push	de
                            638 ;src/main.c:160: if(rebote == 0){
   45AC 7A            [ 4]  639 	ld	a,d
   45AD B3            [ 4]  640 	or	a,e
   45AE 20 0C         [12]  641 	jr	NZ,00139$
                            642 ;src/main.c:161: rebote = 6;
   45B0 21 06 00      [10]  643 	ld	hl,#0x0006
   45B3 E3            [19]  644 	ex	(sp), hl
                            645 ;src/main.c:162: col = 0;
   45B4 DD 36 EB 00   [19]  646 	ld	-21 (ix),#0x00
   45B8 DD 36 EC 00   [19]  647 	ld	-20 (ix),#0x00
   45BC                     648 00139$:
                            649 ;src/main.c:167: sprite = checkSprite(atk,dir);
   45BC DD 6E EF      [19]  650 	ld	l,-17 (ix)
   45BF DD 66 F0      [19]  651 	ld	h,-16 (ix)
   45C2 E5            [11]  652 	push	hl
   45C3 DD 6E ED      [19]  653 	ld	l,-19 (ix)
   45C6 DD 66 EE      [19]  654 	ld	h,-18 (ix)
   45C9 E5            [11]  655 	push	hl
   45CA CD 29 43      [17]  656 	call	_checkSprite
   45CD F1            [10]  657 	pop	af
   45CE F1            [10]  658 	pop	af
   45CF 4D            [ 4]  659 	ld	c, l
   45D0 44            [ 4]  660 	ld	b, h
                            661 ;src/main.c:169: if(col != 2 && e.vivo == 0)
   45D1 DD 7E EB      [19]  662 	ld	a,-21 (ix)
   45D4 D6 02         [ 7]  663 	sub	a, #0x02
   45D6 20 06         [12]  664 	jr	NZ,00267$
   45D8 DD 7E EC      [19]  665 	ld	a,-20 (ix)
   45DB B7            [ 4]  666 	or	a, a
   45DC 28 58         [12]  667 	jr	Z,00141$
   45DE                     668 00267$:
   45DE DD 6E F8      [19]  669 	ld	l,-8 (ix)
   45E1 DD 66 F9      [19]  670 	ld	h,-7 (ix)
   45E4 7E            [ 7]  671 	ld	a,(hl)
   45E5 B7            [ 4]  672 	or	a, a
   45E6 20 4E         [12]  673 	jr	NZ,00141$
                            674 ;src/main.c:170: col = checkCollisions(p.x,p.y,e.x,e.y,dir,atk);
   45E8 DD 6E F1      [19]  675 	ld	l,-15 (ix)
   45EB DD 66 F2      [19]  676 	ld	h,-14 (ix)
   45EE 5E            [ 7]  677 	ld	e,(hl)
   45EF DD 6E FC      [19]  678 	ld	l,-4 (ix)
   45F2 DD 66 FD      [19]  679 	ld	h,-3 (ix)
   45F5 7E            [ 7]  680 	ld	a,(hl)
   45F6 DD 77 FE      [19]  681 	ld	-2 (ix),a
   45F9 DD 6E F5      [19]  682 	ld	l,-11 (ix)
   45FC DD 66 F6      [19]  683 	ld	h,-10 (ix)
   45FF 7E            [ 7]  684 	ld	a,(hl)
   4600 DD 77 F7      [19]  685 	ld	-9 (ix),a
   4603 DD 6E F3      [19]  686 	ld	l,-13 (ix)
   4606 DD 66 F4      [19]  687 	ld	h,-12 (ix)
   4609 56            [ 7]  688 	ld	d,(hl)
   460A C5            [11]  689 	push	bc
   460B DD 6E ED      [19]  690 	ld	l,-19 (ix)
   460E DD 66 EE      [19]  691 	ld	h,-18 (ix)
   4611 E5            [11]  692 	push	hl
   4612 DD 6E EF      [19]  693 	ld	l,-17 (ix)
   4615 DD 66 F0      [19]  694 	ld	h,-16 (ix)
   4618 E5            [11]  695 	push	hl
   4619 7B            [ 4]  696 	ld	a,e
   461A F5            [11]  697 	push	af
   461B 33            [ 6]  698 	inc	sp
   461C DD 7E FE      [19]  699 	ld	a,-2 (ix)
   461F F5            [11]  700 	push	af
   4620 33            [ 6]  701 	inc	sp
   4621 DD 7E F7      [19]  702 	ld	a,-9 (ix)
   4624 F5            [11]  703 	push	af
   4625 33            [ 6]  704 	inc	sp
   4626 D5            [11]  705 	push	de
   4627 33            [ 6]  706 	inc	sp
   4628 CD 95 42      [17]  707 	call	_checkCollisions
   462B F1            [10]  708 	pop	af
   462C F1            [10]  709 	pop	af
   462D F1            [10]  710 	pop	af
   462E F1            [10]  711 	pop	af
   462F C1            [10]  712 	pop	bc
   4630 DD 75 EB      [19]  713 	ld	-21 (ix),l
   4633 DD 74 EC      [19]  714 	ld	-20 (ix),h
   4636                     715 00141$:
                            716 ;src/main.c:171: if(col == 1)
   4636 DD 7E EB      [19]  717 	ld	a,-21 (ix)
   4639 3D            [ 4]  718 	dec	a
   463A 20 0E         [12]  719 	jr	NZ,00144$
   463C DD 7E EC      [19]  720 	ld	a,-20 (ix)
   463F B7            [ 4]  721 	or	a, a
   4640 20 08         [12]  722 	jr	NZ,00144$
                            723 ;src/main.c:172: e.vivo = 1;
   4642 DD 6E F8      [19]  724 	ld	l,-8 (ix)
   4645 DD 66 F9      [19]  725 	ld	h,-7 (ix)
   4648 36 01         [10]  726 	ld	(hl),#0x01
   464A                     727 00144$:
                            728 ;src/main.c:175: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   464A DD 6E F5      [19]  729 	ld	l,-11 (ix)
   464D DD 66 F6      [19]  730 	ld	h,-10 (ix)
   4650 56            [ 7]  731 	ld	d,(hl)
   4651 DD 6E F3      [19]  732 	ld	l,-13 (ix)
   4654 DD 66 F4      [19]  733 	ld	h,-12 (ix)
   4657 7E            [ 7]  734 	ld	a,(hl)
   4658 C5            [11]  735 	push	bc
   4659 D5            [11]  736 	push	de
   465A 33            [ 6]  737 	inc	sp
   465B F5            [11]  738 	push	af
   465C 33            [ 6]  739 	inc	sp
   465D 21 00 C0      [10]  740 	ld	hl,#0xC000
   4660 E5            [11]  741 	push	hl
   4661 CD 68 4B      [17]  742 	call	_cpct_getScreenPtr
   4664 C1            [10]  743 	pop	bc
                            744 ;src/main.c:178: if(atk >= 21)
   4665 DD 7E ED      [19]  745 	ld	a,-19 (ix)
   4668 D6 15         [ 7]  746 	sub	a, #0x15
   466A DD 7E EE      [19]  747 	ld	a,-18 (ix)
   466D DE 00         [ 7]  748 	sbc	a, #0x00
   466F 3E 00         [ 7]  749 	ld	a,#0x00
   4671 17            [ 4]  750 	rla
   4672 5F            [ 4]  751 	ld	e,a
                            752 ;src/main.c:119: cpct_drawSolidBox(memptr,0,4,16);
   4673 DD 75 FE      [19]  753 	ld	-2 (ix),l
   4676 DD 74 FF      [19]  754 	ld	-1 (ix),h
                            755 ;src/main.c:179: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
                            756 ;src/main.c:178: if(atk >= 21)
   4679 7B            [ 4]  757 	ld	a,e
   467A B7            [ 4]  758 	or	a, a
   467B 20 13         [12]  759 	jr	NZ,00146$
                            760 ;src/main.c:179: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   467D D5            [11]  761 	push	de
   467E 21 05 10      [10]  762 	ld	hl,#0x1005
   4681 E5            [11]  763 	push	hl
   4682 DD 6E FE      [19]  764 	ld	l,-2 (ix)
   4685 DD 66 FF      [19]  765 	ld	h,-1 (ix)
   4688 E5            [11]  766 	push	hl
   4689 C5            [11]  767 	push	bc
   468A CD 2A 4A      [17]  768 	call	_cpct_drawSpriteMasked
   468D D1            [10]  769 	pop	de
   468E 18 11         [12]  770 	jr	00147$
   4690                     771 00146$:
                            772 ;src/main.c:181: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4690 D5            [11]  773 	push	de
   4691 21 04 10      [10]  774 	ld	hl,#0x1004
   4694 E5            [11]  775 	push	hl
   4695 DD 6E FE      [19]  776 	ld	l,-2 (ix)
   4698 DD 66 FF      [19]  777 	ld	h,-1 (ix)
   469B E5            [11]  778 	push	hl
   469C C5            [11]  779 	push	bc
   469D CD 2A 4A      [17]  780 	call	_cpct_drawSpriteMasked
   46A0 D1            [10]  781 	pop	de
   46A1                     782 00147$:
                            783 ;src/main.c:184: if(e.vivo == 0){
   46A1 DD 6E F8      [19]  784 	ld	l,-8 (ix)
   46A4 DD 66 F9      [19]  785 	ld	h,-7 (ix)
   46A7 7E            [ 7]  786 	ld	a, (hl)
   46A8 B7            [ 4]  787 	or	a, a
   46A9 20 2C         [12]  788 	jr	NZ,00149$
                            789 ;src/main.c:185: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   46AB DD 6E F1      [19]  790 	ld	l,-15 (ix)
   46AE DD 66 F2      [19]  791 	ld	h,-14 (ix)
   46B1 46            [ 7]  792 	ld	b,(hl)
   46B2 DD 6E FC      [19]  793 	ld	l,-4 (ix)
   46B5 DD 66 FD      [19]  794 	ld	h,-3 (ix)
   46B8 56            [ 7]  795 	ld	d,(hl)
   46B9 D5            [11]  796 	push	de
   46BA 4A            [ 4]  797 	ld	c, d
   46BB C5            [11]  798 	push	bc
   46BC 21 00 C0      [10]  799 	ld	hl,#0xC000
   46BF E5            [11]  800 	push	hl
   46C0 CD 68 4B      [17]  801 	call	_cpct_getScreenPtr
   46C3 D1            [10]  802 	pop	de
                            803 ;src/main.c:186: cpct_drawSolidBox(memptr, 18, 4, 16);
   46C4 4D            [ 4]  804 	ld	c, l
   46C5 44            [ 4]  805 	ld	b, h
   46C6 D5            [11]  806 	push	de
   46C7 21 04 10      [10]  807 	ld	hl,#0x1004
   46CA E5            [11]  808 	push	hl
   46CB 3E 12         [ 7]  809 	ld	a,#0x12
   46CD F5            [11]  810 	push	af
   46CE 33            [ 6]  811 	inc	sp
   46CF C5            [11]  812 	push	bc
   46D0 CD B0 4A      [17]  813 	call	_cpct_drawSolidBox
   46D3 F1            [10]  814 	pop	af
   46D4 F1            [10]  815 	pop	af
   46D5 33            [ 6]  816 	inc	sp
   46D6 D1            [10]  817 	pop	de
   46D7                     818 00149$:
                            819 ;src/main.c:189: memptr = cpct_getScreenPtr(VMEM, 6, 10);
   46D7 D5            [11]  820 	push	de
   46D8 21 06 0A      [10]  821 	ld	hl,#0x0A06
   46DB E5            [11]  822 	push	hl
   46DC 21 00 C0      [10]  823 	ld	hl,#0xC000
   46DF E5            [11]  824 	push	hl
   46E0 CD 68 4B      [17]  825 	call	_cpct_getScreenPtr
   46E3 D1            [10]  826 	pop	de
                            827 ;src/main.c:190: cpct_drawStringM0("FATIGA",memptr, 2, 0);
   46E4 4D            [ 4]  828 	ld	c, l
   46E5 44            [ 4]  829 	ld	b, h
   46E6 D5            [11]  830 	push	de
   46E7 21 02 00      [10]  831 	ld	hl,#0x0002
   46EA E5            [11]  832 	push	hl
   46EB C5            [11]  833 	push	bc
   46EC 21 59 47      [10]  834 	ld	hl,#___str_2
   46EF E5            [11]  835 	push	hl
   46F0 CD 45 49      [17]  836 	call	_cpct_drawStringM0
   46F3 21 06 00      [10]  837 	ld	hl,#6
   46F6 39            [11]  838 	add	hl,sp
   46F7 F9            [ 6]  839 	ld	sp,hl
   46F8 D1            [10]  840 	pop	de
                            841 ;src/main.c:192: if(atk >= 21)
   46F9 7B            [ 4]  842 	ld	a,e
                            843 ;src/main.c:193: for(i=0; i<(*atk - 20)/10; i++){
   46FA B7            [ 4]  844 	or	a,a
   46FB C2 FB 43      [10]  845 	jp	NZ,00154$
   46FE 4F            [ 4]  846 	ld	c,a
   46FF                     847 00157$:
   46FF DD 6E ED      [19]  848 	ld	l,-19 (ix)
   4702 DD 66 EE      [19]  849 	ld	h,-18 (ix)
   4705 7E            [ 7]  850 	ld	a, (hl)
   4706 1E 00         [ 7]  851 	ld	e, #0x00
   4708 C6 EC         [ 7]  852 	add	a,#0xEC
   470A 6F            [ 4]  853 	ld	l,a
   470B 7B            [ 4]  854 	ld	a,e
   470C CE FF         [ 7]  855 	adc	a,#0xFF
   470E 67            [ 4]  856 	ld	h,a
   470F C5            [11]  857 	push	bc
   4710 11 0A 00      [10]  858 	ld	de,#0x000A
   4713 D5            [11]  859 	push	de
   4714 E5            [11]  860 	push	hl
   4715 CD 88 4B      [17]  861 	call	__divsint
   4718 F1            [10]  862 	pop	af
   4719 F1            [10]  863 	pop	af
   471A C1            [10]  864 	pop	bc
   471B 51            [ 4]  865 	ld	d,c
   471C 1E 00         [ 7]  866 	ld	e,#0x00
   471E 7A            [ 4]  867 	ld	a,d
   471F 95            [ 4]  868 	sub	a, l
   4720 7B            [ 4]  869 	ld	a,e
   4721 9C            [ 4]  870 	sbc	a, h
   4722 E2 27 47      [10]  871 	jp	PO, 00270$
   4725 EE 80         [ 7]  872 	xor	a, #0x80
   4727                     873 00270$:
   4727 F2 FB 43      [10]  874 	jp	P,00154$
                            875 ;src/main.c:194: memptr = cpct_getScreenPtr(VMEM, 18+i*4, 10);
   472A 79            [ 4]  876 	ld	a,c
   472B 87            [ 4]  877 	add	a, a
   472C 87            [ 4]  878 	add	a, a
   472D C6 12         [ 7]  879 	add	a, #0x12
   472F 57            [ 4]  880 	ld	d,a
   4730 C5            [11]  881 	push	bc
   4731 3E 0A         [ 7]  882 	ld	a,#0x0A
   4733 F5            [11]  883 	push	af
   4734 33            [ 6]  884 	inc	sp
   4735 D5            [11]  885 	push	de
   4736 33            [ 6]  886 	inc	sp
   4737 21 00 C0      [10]  887 	ld	hl,#0xC000
   473A E5            [11]  888 	push	hl
   473B CD 68 4B      [17]  889 	call	_cpct_getScreenPtr
   473E C1            [10]  890 	pop	bc
                            891 ;src/main.c:195: cpct_drawSolidBox(memptr, 18, 3, 10);
   473F EB            [ 4]  892 	ex	de,hl
   4740 C5            [11]  893 	push	bc
   4741 21 03 0A      [10]  894 	ld	hl,#0x0A03
   4744 E5            [11]  895 	push	hl
   4745 3E 12         [ 7]  896 	ld	a,#0x12
   4747 F5            [11]  897 	push	af
   4748 33            [ 6]  898 	inc	sp
   4749 D5            [11]  899 	push	de
   474A CD B0 4A      [17]  900 	call	_cpct_drawSolidBox
   474D F1            [10]  901 	pop	af
   474E F1            [10]  902 	pop	af
   474F 33            [ 6]  903 	inc	sp
   4750 C1            [10]  904 	pop	bc
                            905 ;src/main.c:193: for(i=0; i<(*atk - 20)/10; i++){
   4751 0C            [ 4]  906 	inc	c
   4752 18 AB         [12]  907 	jr	00157$
   4754                     908 00159$:
   4754 DD F9         [10]  909 	ld	sp, ix
   4756 DD E1         [14]  910 	pop	ix
   4758 C9            [10]  911 	ret
   4759                     912 ___str_2:
   4759 46 41 54 49 47 41   913 	.ascii "FATIGA"
   475F 00                  914 	.db 0x00
                            915 ;src/main.c:202: void main(void) {
                            916 ;	---------------------------------
                            917 ; Function main
                            918 ; ---------------------------------
   4760                     919 _main::
                            920 ;src/main.c:204: init();
   4760 CD 00 42      [17]  921 	call	_init
                            922 ;src/main.c:207: while(1){
   4763                     923 00102$:
                            924 ;src/main.c:208: menu();
   4763 CD 29 42      [17]  925 	call	_menu
                            926 ;src/main.c:209: game();
   4766 CD 5D 43      [17]  927 	call	_game
   4769 18 F8         [12]  928 	jr	00102$
                            929 	.area _CODE
                            930 	.area _INITIALIZER
                            931 	.area _CABS (ABS)
