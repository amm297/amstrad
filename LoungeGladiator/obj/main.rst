                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct  2 10:37:25 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _game
                             14 	.globl _drawMap
                             15 	.globl _checkSprite
                             16 	.globl _checkCollisions
                             17 	.globl _menu
                             18 	.globl _init
                             19 	.globl _cpct_getScreenPtr
                             20 	.globl _cpct_setPalette
                             21 	.globl _cpct_fw2hw
                             22 	.globl _cpct_waitVSYNC
                             23 	.globl _cpct_setVideoMode
                             24 	.globl _cpct_drawStringM0
                             25 	.globl _cpct_drawSolidBox
                             26 	.globl _cpct_drawSpriteMasked
                             27 	.globl _cpct_isKeyPressed
                             28 	.globl _cpct_scanKeyboard_f
                             29 	.globl _cpct_memset
                             30 	.globl _cpct_disableFirmware
                             31 	.globl _g_palette
                             32 	.globl _mapa
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
                             64 ;src/main.c:58: void init(){
                             65 ;	---------------------------------
                             66 ; Function init
                             67 ; ---------------------------------
   4200                      68 _init::
                             69 ;src/main.c:59: cpct_disableFirmware();
   4200 CD D0 4B      [17]   70 	call	_cpct_disableFirmware
                             71 ;src/main.c:60: cpct_setVideoMode(0);
   4203 AF            [ 4]   72 	xor	a, a
   4204 F5            [11]   73 	push	af
   4205 33            [ 6]   74 	inc	sp
   4206 CD AD 4B      [17]   75 	call	_cpct_setVideoMode
   4209 33            [ 6]   76 	inc	sp
                             77 ;src/main.c:61: cpct_fw2hw(g_palette,4);
   420A 11 C5 42      [10]   78 	ld	de,#_g_palette
   420D 3E 04         [ 7]   79 	ld	a,#0x04
   420F F5            [11]   80 	push	af
   4210 33            [ 6]   81 	inc	sp
   4211 D5            [11]   82 	push	de
   4212 CD 37 4B      [17]   83 	call	_cpct_fw2hw
   4215 F1            [10]   84 	pop	af
   4216 33            [ 6]   85 	inc	sp
                             86 ;src/main.c:62: cpct_setPalette(g_palette,4);
   4217 11 C5 42      [10]   87 	ld	de,#_g_palette
   421A 3E 04         [ 7]   88 	ld	a,#0x04
   421C F5            [11]   89 	push	af
   421D 33            [ 6]   90 	inc	sp
   421E D5            [11]   91 	push	de
   421F CD DC 49      [17]   92 	call	_cpct_setPalette
   4222 F1            [10]   93 	pop	af
   4223 33            [ 6]   94 	inc	sp
   4224 C9            [10]   95 	ret
   4225                      96 _mapa:
   4225 01                   97 	.db #0x01	; 1
   4226 01                   98 	.db #0x01	; 1
   4227 01                   99 	.db #0x01	; 1
   4228 01                  100 	.db #0x01	; 1
   4229 01                  101 	.db #0x01	; 1
   422A 01                  102 	.db #0x01	; 1
   422B 01                  103 	.db #0x01	; 1
   422C 01                  104 	.db #0x01	; 1
   422D 01                  105 	.db #0x01	; 1
   422E 01                  106 	.db #0x01	; 1
   422F 01                  107 	.db #0x01	; 1
   4230 01                  108 	.db #0x01	; 1
   4231 01                  109 	.db #0x01	; 1
   4232 01                  110 	.db #0x01	; 1
   4233 01                  111 	.db #0x01	; 1
   4234 01                  112 	.db #0x01	; 1
   4235 01                  113 	.db #0x01	; 1
   4236 00                  114 	.db #0x00	; 0
   4237 00                  115 	.db #0x00	; 0
   4238 00                  116 	.db #0x00	; 0
   4239 00                  117 	.db #0x00	; 0
   423A 00                  118 	.db #0x00	; 0
   423B 00                  119 	.db #0x00	; 0
   423C 00                  120 	.db #0x00	; 0
   423D 00                  121 	.db #0x00	; 0
   423E 00                  122 	.db #0x00	; 0
   423F 00                  123 	.db #0x00	; 0
   4240 00                  124 	.db #0x00	; 0
   4241 00                  125 	.db #0x00	; 0
   4242 00                  126 	.db #0x00	; 0
   4243 00                  127 	.db #0x00	; 0
   4244 01                  128 	.db #0x01	; 1
   4245 01                  129 	.db #0x01	; 1
   4246 00                  130 	.db #0x00	; 0
   4247 00                  131 	.db #0x00	; 0
   4248 00                  132 	.db #0x00	; 0
   4249 00                  133 	.db #0x00	; 0
   424A 00                  134 	.db #0x00	; 0
   424B 00                  135 	.db #0x00	; 0
   424C 00                  136 	.db #0x00	; 0
   424D 00                  137 	.db #0x00	; 0
   424E 00                  138 	.db #0x00	; 0
   424F 00                  139 	.db #0x00	; 0
   4250 00                  140 	.db #0x00	; 0
   4251 00                  141 	.db #0x00	; 0
   4252 00                  142 	.db #0x00	; 0
   4253 00                  143 	.db #0x00	; 0
   4254 01                  144 	.db #0x01	; 1
   4255 01                  145 	.db #0x01	; 1
   4256 00                  146 	.db #0x00	; 0
   4257 00                  147 	.db #0x00	; 0
   4258 00                  148 	.db #0x00	; 0
   4259 00                  149 	.db #0x00	; 0
   425A 00                  150 	.db #0x00	; 0
   425B 00                  151 	.db #0x00	; 0
   425C 00                  152 	.db #0x00	; 0
   425D 00                  153 	.db #0x00	; 0
   425E 00                  154 	.db #0x00	; 0
   425F 00                  155 	.db #0x00	; 0
   4260 00                  156 	.db #0x00	; 0
   4261 00                  157 	.db #0x00	; 0
   4262 00                  158 	.db #0x00	; 0
   4263 00                  159 	.db #0x00	; 0
   4264 01                  160 	.db #0x01	; 1
   4265 01                  161 	.db #0x01	; 1
   4266 00                  162 	.db #0x00	; 0
   4267 00                  163 	.db #0x00	; 0
   4268 00                  164 	.db #0x00	; 0
   4269 00                  165 	.db #0x00	; 0
   426A 00                  166 	.db #0x00	; 0
   426B 00                  167 	.db #0x00	; 0
   426C 00                  168 	.db #0x00	; 0
   426D 00                  169 	.db #0x00	; 0
   426E 00                  170 	.db #0x00	; 0
   426F 00                  171 	.db #0x00	; 0
   4270 00                  172 	.db #0x00	; 0
   4271 00                  173 	.db #0x00	; 0
   4272 00                  174 	.db #0x00	; 0
   4273 00                  175 	.db #0x00	; 0
   4274 01                  176 	.db #0x01	; 1
   4275 00                  177 	.db #0x00	; 0
   4276 00                  178 	.db #0x00	; 0
   4277 00                  179 	.db #0x00	; 0
   4278 00                  180 	.db #0x00	; 0
   4279 00                  181 	.db #0x00	; 0
   427A 00                  182 	.db #0x00	; 0
   427B 00                  183 	.db #0x00	; 0
   427C 00                  184 	.db #0x00	; 0
   427D 00                  185 	.db #0x00	; 0
   427E 00                  186 	.db #0x00	; 0
   427F 00                  187 	.db #0x00	; 0
   4280 00                  188 	.db #0x00	; 0
   4281 00                  189 	.db #0x00	; 0
   4282 00                  190 	.db #0x00	; 0
   4283 00                  191 	.db #0x00	; 0
   4284 01                  192 	.db #0x01	; 1
   4285 01                  193 	.db #0x01	; 1
   4286 00                  194 	.db #0x00	; 0
   4287 00                  195 	.db #0x00	; 0
   4288 00                  196 	.db #0x00	; 0
   4289 00                  197 	.db #0x00	; 0
   428A 00                  198 	.db #0x00	; 0
   428B 00                  199 	.db #0x00	; 0
   428C 00                  200 	.db #0x00	; 0
   428D 00                  201 	.db #0x00	; 0
   428E 00                  202 	.db #0x00	; 0
   428F 00                  203 	.db #0x00	; 0
   4290 00                  204 	.db #0x00	; 0
   4291 00                  205 	.db #0x00	; 0
   4292 00                  206 	.db #0x00	; 0
   4293 00                  207 	.db #0x00	; 0
   4294 01                  208 	.db #0x01	; 1
   4295 01                  209 	.db #0x01	; 1
   4296 00                  210 	.db #0x00	; 0
   4297 00                  211 	.db #0x00	; 0
   4298 00                  212 	.db #0x00	; 0
   4299 00                  213 	.db #0x00	; 0
   429A 00                  214 	.db #0x00	; 0
   429B 00                  215 	.db #0x00	; 0
   429C 00                  216 	.db #0x00	; 0
   429D 00                  217 	.db #0x00	; 0
   429E 00                  218 	.db #0x00	; 0
   429F 00                  219 	.db #0x00	; 0
   42A0 00                  220 	.db #0x00	; 0
   42A1 00                  221 	.db #0x00	; 0
   42A2 00                  222 	.db #0x00	; 0
   42A3 00                  223 	.db #0x00	; 0
   42A4 01                  224 	.db #0x01	; 1
   42A5 01                  225 	.db #0x01	; 1
   42A6 00                  226 	.db #0x00	; 0
   42A7 00                  227 	.db #0x00	; 0
   42A8 00                  228 	.db #0x00	; 0
   42A9 00                  229 	.db #0x00	; 0
   42AA 00                  230 	.db #0x00	; 0
   42AB 00                  231 	.db #0x00	; 0
   42AC 00                  232 	.db #0x00	; 0
   42AD 00                  233 	.db #0x00	; 0
   42AE 00                  234 	.db #0x00	; 0
   42AF 00                  235 	.db #0x00	; 0
   42B0 00                  236 	.db #0x00	; 0
   42B1 00                  237 	.db #0x00	; 0
   42B2 00                  238 	.db #0x00	; 0
   42B3 00                  239 	.db #0x00	; 0
   42B4 01                  240 	.db #0x01	; 1
   42B5 01                  241 	.db #0x01	; 1
   42B6 01                  242 	.db #0x01	; 1
   42B7 01                  243 	.db #0x01	; 1
   42B8 01                  244 	.db #0x01	; 1
   42B9 01                  245 	.db #0x01	; 1
   42BA 01                  246 	.db #0x01	; 1
   42BB 01                  247 	.db #0x01	; 1
   42BC 01                  248 	.db #0x01	; 1
   42BD 01                  249 	.db #0x01	; 1
   42BE 01                  250 	.db #0x01	; 1
   42BF 01                  251 	.db #0x01	; 1
   42C0 01                  252 	.db #0x01	; 1
   42C1 01                  253 	.db #0x01	; 1
   42C2 01                  254 	.db #0x01	; 1
   42C3 01                  255 	.db #0x01	; 1
   42C4 01                  256 	.db #0x01	; 1
   42C5                     257 _g_palette:
   42C5 00                  258 	.db #0x00	; 0
   42C6 1A                  259 	.db #0x1A	; 26
   42C7 06                  260 	.db #0x06	; 6
   42C8 12                  261 	.db #0x12	; 18
                            262 ;src/main.c:66: void menu(){
                            263 ;	---------------------------------
                            264 ; Function menu
                            265 ; ---------------------------------
   42C9                     266 _menu::
                            267 ;src/main.c:68: cpct_clearScreen(0);
   42C9 21 00 40      [10]  268 	ld	hl,#0x4000
   42CC E5            [11]  269 	push	hl
   42CD AF            [ 4]  270 	xor	a, a
   42CE F5            [11]  271 	push	af
   42CF 33            [ 6]  272 	inc	sp
   42D0 26 C0         [ 7]  273 	ld	h, #0xC0
   42D2 E5            [11]  274 	push	hl
   42D3 CD BF 4B      [17]  275 	call	_cpct_memset
                            276 ;src/main.c:70: memptr = cpct_getScreenPtr(VMEM,20,10);
   42D6 21 14 0A      [10]  277 	ld	hl,#0x0A14
   42D9 E5            [11]  278 	push	hl
   42DA 21 00 C0      [10]  279 	ld	hl,#0xC000
   42DD E5            [11]  280 	push	hl
   42DE CD 99 4C      [17]  281 	call	_cpct_getScreenPtr
                            282 ;src/main.c:71: cpct_drawStringM0("Super Menu",memptr,2,3);
   42E1 EB            [ 4]  283 	ex	de,hl
   42E2 01 1E 43      [10]  284 	ld	bc,#___str_0+0
   42E5 21 02 03      [10]  285 	ld	hl,#0x0302
   42E8 E5            [11]  286 	push	hl
   42E9 D5            [11]  287 	push	de
   42EA C5            [11]  288 	push	bc
   42EB CD 76 4A      [17]  289 	call	_cpct_drawStringM0
   42EE 21 06 00      [10]  290 	ld	hl,#6
   42F1 39            [11]  291 	add	hl,sp
   42F2 F9            [ 6]  292 	ld	sp,hl
                            293 ;src/main.c:73: memptr = cpct_getScreenPtr(VMEM,18,180);
   42F3 21 12 B4      [10]  294 	ld	hl,#0xB412
   42F6 E5            [11]  295 	push	hl
   42F7 21 00 C0      [10]  296 	ld	hl,#0xC000
   42FA E5            [11]  297 	push	hl
   42FB CD 99 4C      [17]  298 	call	_cpct_getScreenPtr
                            299 ;src/main.c:74: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   42FE EB            [ 4]  300 	ex	de,hl
   42FF 01 29 43      [10]  301 	ld	bc,#___str_1+0
   4302 21 04 05      [10]  302 	ld	hl,#0x0504
   4305 E5            [11]  303 	push	hl
   4306 D5            [11]  304 	push	de
   4307 C5            [11]  305 	push	bc
   4308 CD 76 4A      [17]  306 	call	_cpct_drawStringM0
   430B 21 06 00      [10]  307 	ld	hl,#6
   430E 39            [11]  308 	add	hl,sp
   430F F9            [ 6]  309 	ld	sp,hl
                            310 ;src/main.c:76: do{
   4310                     311 00101$:
                            312 ;src/main.c:77: cpct_scanKeyboard_f();
   4310 CD 0C 4A      [17]  313 	call	_cpct_scanKeyboard_f
                            314 ;src/main.c:78: }while(!cpct_isKeyPressed(Key_Enter));
   4313 21 00 40      [10]  315 	ld	hl,#0x4000
   4316 CD 00 4A      [17]  316 	call	_cpct_isKeyPressed
   4319 7D            [ 4]  317 	ld	a,l
   431A B7            [ 4]  318 	or	a, a
   431B 28 F3         [12]  319 	jr	Z,00101$
   431D C9            [10]  320 	ret
   431E                     321 ___str_0:
   431E 53 75 70 65 72 20   322 	.ascii "Super Menu"
        4D 65 6E 75
   4328 00                  323 	.db 0x00
   4329                     324 ___str_1:
   4329 50 75 6C 73 61 20   325 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4334 00                  326 	.db 0x00
                            327 ;src/main.c:83: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            328 ;	---------------------------------
                            329 ; Function checkCollisions
                            330 ; ---------------------------------
   4335                     331 _checkCollisions::
   4335 DD E5         [15]  332 	push	ix
   4337 DD 21 00 00   [14]  333 	ld	ix,#0
   433B DD 39         [15]  334 	add	ix,sp
                            335 ;src/main.c:86: if(eX - pX > -1 && eX - pX < 11)
   433D DD 4E 06      [19]  336 	ld	c,6 (ix)
   4340 06 00         [ 7]  337 	ld	b,#0x00
   4342 DD 6E 04      [19]  338 	ld	l,4 (ix)
   4345 26 00         [ 7]  339 	ld	h,#0x00
   4347 79            [ 4]  340 	ld	a,c
   4348 95            [ 4]  341 	sub	a, l
   4349 5F            [ 4]  342 	ld	e,a
   434A 78            [ 4]  343 	ld	a,b
   434B 9C            [ 4]  344 	sbc	a, h
   434C 57            [ 4]  345 	ld	d,a
                            346 ;src/main.c:84: if(atk >= 21)
   434D DD 7E 0A      [19]  347 	ld	a,10 (ix)
   4350 D6 15         [ 7]  348 	sub	a, #0x15
   4352 DD 7E 0B      [19]  349 	ld	a,11 (ix)
   4355 DE 00         [ 7]  350 	sbc	a, #0x00
   4357 38 4F         [12]  351 	jr	C,00116$
                            352 ;src/main.c:85: if(dir == 0)
   4359 DD 7E 09      [19]  353 	ld	a,9 (ix)
   435C DD B6 08      [19]  354 	or	a,8 (ix)
   435F 20 21         [12]  355 	jr	NZ,00110$
                            356 ;src/main.c:86: if(eX - pX > -1 && eX - pX < 11)
   4361 3E FF         [ 7]  357 	ld	a,#0xFF
   4363 BB            [ 4]  358 	cp	a, e
   4364 9A            [ 4]  359 	sbc	a, d
   4365 E2 6A 43      [10]  360 	jp	PO, 00152$
   4368 EE 80         [ 7]  361 	xor	a, #0x80
   436A                     362 00152$:
   436A F2 7D 43      [10]  363 	jp	P,00102$
   436D 7B            [ 4]  364 	ld	a,e
   436E D6 0B         [ 7]  365 	sub	a, #0x0B
   4370 7A            [ 4]  366 	ld	a,d
   4371 17            [ 4]  367 	rla
   4372 3F            [ 4]  368 	ccf
   4373 1F            [ 4]  369 	rra
   4374 DE 80         [ 7]  370 	sbc	a, #0x80
   4376 30 05         [12]  371 	jr	NC,00102$
                            372 ;src/main.c:87: return 1;
   4378 21 01 00      [10]  373 	ld	hl,#0x0001
   437B 18 49         [12]  374 	jr	00118$
   437D                     375 00102$:
                            376 ;src/main.c:89: return 0;
   437D 21 00 00      [10]  377 	ld	hl,#0x0000
   4380 18 44         [12]  378 	jr	00118$
   4382                     379 00110$:
                            380 ;src/main.c:91: if(pX - eX > -1 && pX - eX < 11)
   4382 BF            [ 4]  381 	cp	a, a
   4383 ED 42         [15]  382 	sbc	hl, bc
   4385 3E FF         [ 7]  383 	ld	a,#0xFF
   4387 BD            [ 4]  384 	cp	a, l
   4388 9C            [ 4]  385 	sbc	a, h
   4389 E2 8E 43      [10]  386 	jp	PO, 00153$
   438C EE 80         [ 7]  387 	xor	a, #0x80
   438E                     388 00153$:
   438E F2 A3 43      [10]  389 	jp	P,00106$
   4391 11 0B 80      [10]  390 	ld	de, #0x800B
   4394 29            [11]  391 	add	hl, hl
   4395 3F            [ 4]  392 	ccf
   4396 CB 1C         [ 8]  393 	rr	h
   4398 CB 1D         [ 8]  394 	rr	l
   439A ED 52         [15]  395 	sbc	hl, de
   439C 30 05         [12]  396 	jr	NC,00106$
                            397 ;src/main.c:92: return 1;
   439E 21 01 00      [10]  398 	ld	hl,#0x0001
   43A1 18 23         [12]  399 	jr	00118$
   43A3                     400 00106$:
                            401 ;src/main.c:94: return 0;
   43A3 21 00 00      [10]  402 	ld	hl,#0x0000
   43A6 18 1E         [12]  403 	jr	00118$
   43A8                     404 00116$:
                            405 ;src/main.c:96: if(eX - pX > 0 && eX - pX < 4)
   43A8 AF            [ 4]  406 	xor	a, a
   43A9 BB            [ 4]  407 	cp	a, e
   43AA 9A            [ 4]  408 	sbc	a, d
   43AB E2 B0 43      [10]  409 	jp	PO, 00154$
   43AE EE 80         [ 7]  410 	xor	a, #0x80
   43B0                     411 00154$:
   43B0 F2 C3 43      [10]  412 	jp	P,00117$
   43B3 7B            [ 4]  413 	ld	a,e
   43B4 D6 04         [ 7]  414 	sub	a, #0x04
   43B6 7A            [ 4]  415 	ld	a,d
   43B7 17            [ 4]  416 	rla
   43B8 3F            [ 4]  417 	ccf
   43B9 1F            [ 4]  418 	rra
   43BA DE 80         [ 7]  419 	sbc	a, #0x80
   43BC 30 05         [12]  420 	jr	NC,00117$
                            421 ;src/main.c:97: return 2;
   43BE 21 02 00      [10]  422 	ld	hl,#0x0002
   43C1 18 03         [12]  423 	jr	00118$
   43C3                     424 00117$:
                            425 ;src/main.c:99: return 0;
   43C3 21 00 00      [10]  426 	ld	hl,#0x0000
   43C6                     427 00118$:
   43C6 DD E1         [14]  428 	pop	ix
   43C8 C9            [10]  429 	ret
                            430 ;src/main.c:102: u8* checkSprite(u8* atk, u8* dir){
                            431 ;	---------------------------------
                            432 ; Function checkSprite
                            433 ; ---------------------------------
   43C9                     434 _checkSprite::
                            435 ;src/main.c:103: if(atk <= 20)
   43C9 3E 14         [ 7]  436 	ld	a,#0x14
   43CB FD 21 02 00   [14]  437 	ld	iy,#2
   43CF FD 39         [15]  438 	add	iy,sp
   43D1 FD BE 00      [19]  439 	cp	a, 0 (iy)
   43D4 3E 00         [ 7]  440 	ld	a,#0x00
   43D6 FD 9E 01      [19]  441 	sbc	a, 1 (iy)
   43D9 38 11         [12]  442 	jr	C,00108$
                            443 ;src/main.c:104: if(dir == 0)
   43DB 21 05 00      [10]  444 	ld	hl, #4+1
   43DE 39            [11]  445 	add	hl, sp
   43DF 7E            [ 7]  446 	ld	a, (hl)
   43E0 2B            [ 6]  447 	dec	hl
   43E1 B6            [ 7]  448 	or	a,(hl)
   43E2 20 04         [12]  449 	jr	NZ,00102$
                            450 ;src/main.c:105: return gladis_quieto_dcha;
   43E4 21 00 41      [10]  451 	ld	hl,#_gladis_quieto_dcha
   43E7 C9            [10]  452 	ret
   43E8                     453 00102$:
                            454 ;src/main.c:107: return gladis_quieto_izda;
   43E8 21 80 41      [10]  455 	ld	hl,#_gladis_quieto_izda
   43EB C9            [10]  456 	ret
   43EC                     457 00108$:
                            458 ;src/main.c:108: else if(dir == 0){
   43EC 21 05 00      [10]  459 	ld	hl, #4+1
   43EF 39            [11]  460 	add	hl, sp
   43F0 7E            [ 7]  461 	ld	a, (hl)
   43F1 2B            [ 6]  462 	dec	hl
   43F2 B6            [ 7]  463 	or	a,(hl)
   43F3 20 04         [12]  464 	jr	NZ,00105$
                            465 ;src/main.c:109: return gladis_atk_dcha;
   43F5 21 9C 48      [10]  466 	ld	hl,#_gladis_atk_dcha
   43F8 C9            [10]  467 	ret
   43F9                     468 00105$:
                            469 ;src/main.c:111: return gladis_atk_izda;
   43F9 21 3C 49      [10]  470 	ld	hl,#_gladis_atk_izda
   43FC C9            [10]  471 	ret
                            472 ;src/main.c:120: void drawMap(){
                            473 ;	---------------------------------
                            474 ; Function drawMap
                            475 ; ---------------------------------
   43FD                     476 _drawMap::
   43FD DD E5         [15]  477 	push	ix
   43FF DD 21 00 00   [14]  478 	ld	ix,#0
   4403 DD 39         [15]  479 	add	ix,sp
   4405 F5            [11]  480 	push	af
   4406 F5            [11]  481 	push	af
                            482 ;src/main.c:124: for(posY=0; posY<height;posY++){
   4407 0E 00         [ 7]  483 	ld	c,#0x00
   4409 1E 00         [ 7]  484 	ld	e,#0x00
                            485 ;src/main.c:125: for(posX=0; posX<width;posX++){
   440B                     486 00112$:
   440B DD 36 FE 00   [19]  487 	ld	-2 (ix),#0x00
   440F DD 36 FF 00   [19]  488 	ld	-1 (ix),#0x00
   4413                     489 00105$:
                            490 ;src/main.c:126: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   4413 C5            [11]  491 	push	bc
   4414 D5            [11]  492 	push	de
   4415 7B            [ 4]  493 	ld	a,e
   4416 F5            [11]  494 	push	af
   4417 33            [ 6]  495 	inc	sp
   4418 DD 7E FF      [19]  496 	ld	a,-1 (ix)
   441B F5            [11]  497 	push	af
   441C 33            [ 6]  498 	inc	sp
   441D 21 00 C0      [10]  499 	ld	hl,#0xC000
   4420 E5            [11]  500 	push	hl
   4421 CD 99 4C      [17]  501 	call	_cpct_getScreenPtr
   4424 D1            [10]  502 	pop	de
   4425 C1            [10]  503 	pop	bc
   4426 33            [ 6]  504 	inc	sp
   4427 33            [ 6]  505 	inc	sp
   4428 E5            [11]  506 	push	hl
                            507 ;src/main.c:127: if(mapa[posY][posX] == 1){
   4429 69            [ 4]  508 	ld	l,c
   442A 26 00         [ 7]  509 	ld	h,#0x00
   442C 29            [11]  510 	add	hl, hl
   442D 29            [11]  511 	add	hl, hl
   442E 29            [11]  512 	add	hl, hl
   442F 29            [11]  513 	add	hl, hl
   4430 3E 25         [ 7]  514 	ld	a,#<(_mapa)
   4432 85            [ 4]  515 	add	a, l
   4433 6F            [ 4]  516 	ld	l,a
   4434 3E 42         [ 7]  517 	ld	a,#>(_mapa)
   4436 8C            [ 4]  518 	adc	a, h
   4437 67            [ 4]  519 	ld	h,a
   4438 7D            [ 4]  520 	ld	a,l
   4439 DD 86 FE      [19]  521 	add	a, -2 (ix)
   443C 6F            [ 4]  522 	ld	l,a
   443D 7C            [ 4]  523 	ld	a,h
   443E CE 00         [ 7]  524 	adc	a, #0x00
   4440 67            [ 4]  525 	ld	h,a
   4441 7E            [ 7]  526 	ld	a,(hl)
   4442 3D            [ 4]  527 	dec	a
   4443 20 1A         [12]  528 	jr	NZ,00106$
                            529 ;src/main.c:128: cpct_drawSolidBox(memptr, 3, 5, 20);
   4445 DD 56 FC      [19]  530 	ld	d,-4 (ix)
   4448 DD 46 FD      [19]  531 	ld	b,-3 (ix)
   444B C5            [11]  532 	push	bc
   444C D5            [11]  533 	push	de
   444D 21 05 14      [10]  534 	ld	hl,#0x1405
   4450 E5            [11]  535 	push	hl
   4451 3E 03         [ 7]  536 	ld	a,#0x03
   4453 F5            [11]  537 	push	af
   4454 33            [ 6]  538 	inc	sp
   4455 4A            [ 4]  539 	ld	c,d
   4456 C5            [11]  540 	push	bc
   4457 CD E1 4B      [17]  541 	call	_cpct_drawSolidBox
   445A F1            [10]  542 	pop	af
   445B F1            [10]  543 	pop	af
   445C 33            [ 6]  544 	inc	sp
   445D D1            [10]  545 	pop	de
   445E C1            [10]  546 	pop	bc
   445F                     547 00106$:
                            548 ;src/main.c:125: for(posX=0; posX<width;posX++){
   445F DD 7E FF      [19]  549 	ld	a,-1 (ix)
   4462 C6 05         [ 7]  550 	add	a, #0x05
   4464 DD 77 FF      [19]  551 	ld	-1 (ix),a
   4467 DD 34 FE      [23]  552 	inc	-2 (ix)
   446A DD 7E FE      [19]  553 	ld	a,-2 (ix)
   446D D6 10         [ 7]  554 	sub	a, #0x10
   446F 38 A2         [12]  555 	jr	C,00105$
                            556 ;src/main.c:124: for(posY=0; posY<height;posY++){
   4471 7B            [ 4]  557 	ld	a,e
   4472 C6 14         [ 7]  558 	add	a, #0x14
   4474 5F            [ 4]  559 	ld	e,a
   4475 0C            [ 4]  560 	inc	c
   4476 79            [ 4]  561 	ld	a,c
   4477 D6 0A         [ 7]  562 	sub	a, #0x0A
   4479 38 90         [12]  563 	jr	C,00112$
   447B DD F9         [10]  564 	ld	sp, ix
   447D DD E1         [14]  565 	pop	ix
   447F C9            [10]  566 	ret
                            567 ;src/main.c:138: void game(){
                            568 ;	---------------------------------
                            569 ; Function game
                            570 ; ---------------------------------
   4480                     571 _game::
   4480 DD E5         [15]  572 	push	ix
   4482 DD 21 00 00   [14]  573 	ld	ix,#0
   4486 DD 39         [15]  574 	add	ix,sp
   4488 21 E4 FF      [10]  575 	ld	hl,#-28
   448B 39            [11]  576 	add	hl,sp
   448C F9            [ 6]  577 	ld	sp,hl
                            578 ;src/main.c:139: TPlayer p = { 0,100 };
   448D 21 00 00      [10]  579 	ld	hl,#0x0000
   4490 39            [11]  580 	add	hl,sp
   4491 36 00         [10]  581 	ld	(hl),#0x00
   4493 21 00 00      [10]  582 	ld	hl,#0x0000
   4496 39            [11]  583 	add	hl,sp
   4497 DD 75 FC      [19]  584 	ld	-4 (ix),l
   449A DD 74 FD      [19]  585 	ld	-3 (ix),h
   449D DD 7E FC      [19]  586 	ld	a,-4 (ix)
   44A0 C6 01         [ 7]  587 	add	a, #0x01
   44A2 DD 77 F9      [19]  588 	ld	-7 (ix),a
   44A5 DD 7E FD      [19]  589 	ld	a,-3 (ix)
   44A8 CE 00         [ 7]  590 	adc	a, #0x00
   44AA DD 77 FA      [19]  591 	ld	-6 (ix),a
   44AD DD 6E F9      [19]  592 	ld	l,-7 (ix)
   44B0 DD 66 FA      [19]  593 	ld	h,-6 (ix)
   44B3 36 64         [10]  594 	ld	(hl),#0x64
                            595 ;src/main.c:140: TEnemy  e = { 55,100,0 };
   44B5 21 02 00      [10]  596 	ld	hl,#0x0002
   44B8 39            [11]  597 	add	hl,sp
   44B9 36 37         [10]  598 	ld	(hl),#0x37
   44BB 21 02 00      [10]  599 	ld	hl,#0x0002
   44BE 39            [11]  600 	add	hl,sp
   44BF DD 75 FE      [19]  601 	ld	-2 (ix),l
   44C2 DD 74 FF      [19]  602 	ld	-1 (ix),h
   44C5 DD 7E FE      [19]  603 	ld	a,-2 (ix)
   44C8 C6 01         [ 7]  604 	add	a, #0x01
   44CA DD 77 F6      [19]  605 	ld	-10 (ix),a
   44CD DD 7E FF      [19]  606 	ld	a,-1 (ix)
   44D0 CE 00         [ 7]  607 	adc	a, #0x00
   44D2 DD 77 F7      [19]  608 	ld	-9 (ix),a
   44D5 DD 6E F6      [19]  609 	ld	l,-10 (ix)
   44D8 DD 66 F7      [19]  610 	ld	h,-9 (ix)
   44DB 36 64         [10]  611 	ld	(hl),#0x64
   44DD DD 7E FE      [19]  612 	ld	a,-2 (ix)
   44E0 C6 02         [ 7]  613 	add	a, #0x02
   44E2 DD 77 F1      [19]  614 	ld	-15 (ix),a
   44E5 DD 7E FF      [19]  615 	ld	a,-1 (ix)
   44E8 CE 00         [ 7]  616 	adc	a, #0x00
   44EA DD 77 F2      [19]  617 	ld	-14 (ix),a
   44ED DD 6E F1      [19]  618 	ld	l,-15 (ix)
   44F0 DD 66 F2      [19]  619 	ld	h,-14 (ix)
   44F3 36 00         [10]  620 	ld	(hl),#0x00
                            621 ;src/main.c:143: u8* dir = 0;
   44F5 DD 36 EF 00   [19]  622 	ld	-17 (ix),#0x00
   44F9 DD 36 F0 00   [19]  623 	ld	-16 (ix),#0x00
                            624 ;src/main.c:144: u8* atk = 20;
   44FD DD 36 ED 14   [19]  625 	ld	-19 (ix),#0x14
   4501 DD 36 EE 00   [19]  626 	ld	-18 (ix),#0x00
                            627 ;src/main.c:145: u8* col = 0;
   4505 DD 36 EB 00   [19]  628 	ld	-21 (ix),#0x00
   4509 DD 36 EC 00   [19]  629 	ld	-20 (ix),#0x00
                            630 ;src/main.c:146: u8* rebote = 6;
   450D DD 36 E9 06   [19]  631 	ld	-23 (ix),#0x06
   4511 DD 36 EA 00   [19]  632 	ld	-22 (ix),#0x00
                            633 ;src/main.c:148: cpct_clearScreen(0);
   4515 21 00 40      [10]  634 	ld	hl,#0x4000
   4518 E5            [11]  635 	push	hl
   4519 AF            [ 4]  636 	xor	a, a
   451A F5            [11]  637 	push	af
   451B 33            [ 6]  638 	inc	sp
   451C 26 C0         [ 7]  639 	ld	h, #0xC0
   451E E5            [11]  640 	push	hl
   451F CD BF 4B      [17]  641 	call	_cpct_memset
                            642 ;src/main.c:149: drawMap();
   4522 CD FD 43      [17]  643 	call	_drawMap
                            644 ;src/main.c:150: while (1){
   4525                     645 00154$:
                            646 ;src/main.c:153: cpct_waitVSYNC();
   4525 CD A5 4B      [17]  647 	call	_cpct_waitVSYNC
                            648 ;src/main.c:156: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4528 DD 6E F9      [19]  649 	ld	l,-7 (ix)
   452B DD 66 FA      [19]  650 	ld	h,-6 (ix)
   452E 46            [ 7]  651 	ld	b,(hl)
   452F DD 6E FC      [19]  652 	ld	l,-4 (ix)
   4532 DD 66 FD      [19]  653 	ld	h,-3 (ix)
   4535 4E            [ 7]  654 	ld	c, (hl)
   4536 C5            [11]  655 	push	bc
   4537 21 00 C0      [10]  656 	ld	hl,#0xC000
   453A E5            [11]  657 	push	hl
   453B CD 99 4C      [17]  658 	call	_cpct_getScreenPtr
                            659 ;src/main.c:158: cpct_drawSolidBox(memptr,0,4,16);
   453E 4D            [ 4]  660 	ld	c, l
   453F 44            [ 4]  661 	ld	b, h
                            662 ;src/main.c:157: if(atk <= 20)
   4540 3E 14         [ 7]  663 	ld	a,#0x14
   4542 DD BE ED      [19]  664 	cp	a, -19 (ix)
   4545 3E 00         [ 7]  665 	ld	a,#0x00
   4547 DD 9E EE      [19]  666 	sbc	a, -18 (ix)
   454A 38 10         [12]  667 	jr	C,00102$
                            668 ;src/main.c:158: cpct_drawSolidBox(memptr,0,4,16);
   454C 21 04 10      [10]  669 	ld	hl,#0x1004
   454F E5            [11]  670 	push	hl
   4550 AF            [ 4]  671 	xor	a, a
   4551 F5            [11]  672 	push	af
   4552 33            [ 6]  673 	inc	sp
   4553 C5            [11]  674 	push	bc
   4554 CD E1 4B      [17]  675 	call	_cpct_drawSolidBox
   4557 F1            [10]  676 	pop	af
   4558 F1            [10]  677 	pop	af
   4559 33            [ 6]  678 	inc	sp
   455A 18 0E         [12]  679 	jr	00103$
   455C                     680 00102$:
                            681 ;src/main.c:160: cpct_drawSolidBox(memptr,0,5,16);
   455C 21 05 10      [10]  682 	ld	hl,#0x1005
   455F E5            [11]  683 	push	hl
   4560 AF            [ 4]  684 	xor	a, a
   4561 F5            [11]  685 	push	af
   4562 33            [ 6]  686 	inc	sp
   4563 C5            [11]  687 	push	bc
   4564 CD E1 4B      [17]  688 	call	_cpct_drawSolidBox
   4567 F1            [10]  689 	pop	af
   4568 F1            [10]  690 	pop	af
   4569 33            [ 6]  691 	inc	sp
   456A                     692 00103$:
                            693 ;src/main.c:162: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   456A DD 6E F6      [19]  694 	ld	l,-10 (ix)
   456D DD 66 F7      [19]  695 	ld	h,-9 (ix)
   4570 46            [ 7]  696 	ld	b,(hl)
   4571 DD 6E FE      [19]  697 	ld	l,-2 (ix)
   4574 DD 66 FF      [19]  698 	ld	h,-1 (ix)
   4577 4E            [ 7]  699 	ld	c, (hl)
   4578 C5            [11]  700 	push	bc
   4579 21 00 C0      [10]  701 	ld	hl,#0xC000
   457C E5            [11]  702 	push	hl
   457D CD 99 4C      [17]  703 	call	_cpct_getScreenPtr
   4580 EB            [ 4]  704 	ex	de,hl
                            705 ;src/main.c:163: if(e.vivo == 0)
   4581 DD 6E F1      [19]  706 	ld	l,-15 (ix)
   4584 DD 66 F2      [19]  707 	ld	h,-14 (ix)
   4587 7E            [ 7]  708 	ld	a,(hl)
   4588 B7            [ 4]  709 	or	a, a
   4589 20 0E         [12]  710 	jr	NZ,00105$
                            711 ;src/main.c:164: cpct_drawSolidBox(memptr,0,4,16);
   458B 21 04 10      [10]  712 	ld	hl,#0x1004
   458E E5            [11]  713 	push	hl
   458F AF            [ 4]  714 	xor	a, a
   4590 F5            [11]  715 	push	af
   4591 33            [ 6]  716 	inc	sp
   4592 D5            [11]  717 	push	de
   4593 CD E1 4B      [17]  718 	call	_cpct_drawSolidBox
   4596 F1            [10]  719 	pop	af
   4597 F1            [10]  720 	pop	af
   4598 33            [ 6]  721 	inc	sp
   4599                     722 00105$:
                            723 ;src/main.c:167: if(col != 2){
   4599 DD 7E EB      [19]  724 	ld	a,-21 (ix)
   459C D6 02         [ 7]  725 	sub	a, #0x02
   459E 20 0A         [12]  726 	jr	NZ,00265$
   45A0 DD 7E EC      [19]  727 	ld	a,-20 (ix)
   45A3 B7            [ 4]  728 	or	a, a
   45A4 20 04         [12]  729 	jr	NZ,00265$
   45A6 3E 01         [ 7]  730 	ld	a,#0x01
   45A8 18 01         [12]  731 	jr	00266$
   45AA                     732 00265$:
   45AA AF            [ 4]  733 	xor	a,a
   45AB                     734 00266$:
   45AB DD 77 F3      [19]  735 	ld	-13 (ix), a
   45AE B7            [ 4]  736 	or	a, a
   45AF C2 BB 46      [10]  737 	jp	NZ,00138$
                            738 ;src/main.c:168: cpct_scanKeyboard_f();
   45B2 CD 0C 4A      [17]  739 	call	_cpct_scanKeyboard_f
                            740 ;src/main.c:169: if(cpct_isKeyPressed(Key_Space) && atk >= 20){
   45B5 21 05 80      [10]  741 	ld	hl,#0x8005
   45B8 CD 00 4A      [17]  742 	call	_cpct_isKeyPressed
   45BB DD 75 F8      [19]  743 	ld	-8 (ix),l
   45BE DD 7E ED      [19]  744 	ld	a,-19 (ix)
   45C1 D6 14         [ 7]  745 	sub	a, #0x14
   45C3 DD 7E EE      [19]  746 	ld	a,-18 (ix)
   45C6 DE 00         [ 7]  747 	sbc	a, #0x00
   45C8 3E 00         [ 7]  748 	ld	a,#0x00
   45CA 17            [ 4]  749 	rla
   45CB DD 77 FB      [19]  750 	ld	-5 (ix),a
                            751 ;src/main.c:173: atk += 1;
   45CE DD 7E ED      [19]  752 	ld	a,-19 (ix)
   45D1 C6 01         [ 7]  753 	add	a, #0x01
   45D3 DD 77 F4      [19]  754 	ld	-12 (ix),a
   45D6 DD 7E EE      [19]  755 	ld	a,-18 (ix)
   45D9 CE 00         [ 7]  756 	adc	a, #0x00
   45DB DD 77 F5      [19]  757 	ld	-11 (ix),a
                            758 ;src/main.c:169: if(cpct_isKeyPressed(Key_Space) && atk >= 20){
   45DE DD 7E F8      [19]  759 	ld	a,-8 (ix)
   45E1 B7            [ 4]  760 	or	a, a
   45E2 28 53         [12]  761 	jr	Z,00132$
   45E4 DD 7E FB      [19]  762 	ld	a,-5 (ix)
   45E7 B7            [ 4]  763 	or	a, a
   45E8 20 4D         [12]  764 	jr	NZ,00132$
                            765 ;src/main.c:170: if(atk >= 50)
   45EA DD 7E ED      [19]  766 	ld	a,-19 (ix)
   45ED D6 32         [ 7]  767 	sub	a, #0x32
   45EF DD 7E EE      [19]  768 	ld	a,-18 (ix)
   45F2 DE 00         [ 7]  769 	sbc	a, #0x00
   45F4 38 0A         [12]  770 	jr	C,00107$
                            771 ;src/main.c:171: atk = 0;
   45F6 DD 36 ED 00   [19]  772 	ld	-19 (ix),#0x00
   45FA DD 36 EE 00   [19]  773 	ld	-18 (ix),#0x00
   45FE 18 0C         [12]  774 	jr	00108$
   4600                     775 00107$:
                            776 ;src/main.c:173: atk += 1;
   4600 DD 7E F4      [19]  777 	ld	a,-12 (ix)
   4603 DD 77 ED      [19]  778 	ld	-19 (ix),a
   4606 DD 7E F5      [19]  779 	ld	a,-11 (ix)
   4609 DD 77 EE      [19]  780 	ld	-18 (ix),a
   460C                     781 00108$:
                            782 ;src/main.c:174: if(cpct_isKeyPressed(Key_CursorRight))
   460C 21 00 02      [10]  783 	ld	hl,#0x0200
   460F CD 00 4A      [17]  784 	call	_cpct_isKeyPressed
   4612 7D            [ 4]  785 	ld	a,l
   4613 B7            [ 4]  786 	or	a, a
   4614 28 0B         [12]  787 	jr	Z,00112$
                            788 ;src/main.c:175: dir = 0;
   4616 DD 36 EF 00   [19]  789 	ld	-17 (ix),#0x00
   461A DD 36 F0 00   [19]  790 	ld	-16 (ix),#0x00
   461E C3 ED 46      [10]  791 	jp	00139$
   4621                     792 00112$:
                            793 ;src/main.c:176: else if(cpct_isKeyPressed(Key_CursorLeft))
   4621 21 01 01      [10]  794 	ld	hl,#0x0101
   4624 CD 00 4A      [17]  795 	call	_cpct_isKeyPressed
   4627 7D            [ 4]  796 	ld	a,l
   4628 B7            [ 4]  797 	or	a, a
   4629 CA ED 46      [10]  798 	jp	Z,00139$
                            799 ;src/main.c:177: dir = 1;
   462C DD 36 EF 01   [19]  800 	ld	-17 (ix),#0x01
   4630 DD 36 F0 00   [19]  801 	ld	-16 (ix),#0x00
   4634 C3 ED 46      [10]  802 	jp	00139$
   4637                     803 00132$:
                            804 ;src/main.c:179: if(atk < 20)
   4637 DD 7E FB      [19]  805 	ld	a,-5 (ix)
   463A B7            [ 4]  806 	or	a, a
   463B 28 0E         [12]  807 	jr	Z,00115$
                            808 ;src/main.c:180: atk += 1;
   463D DD 7E F4      [19]  809 	ld	a,-12 (ix)
   4640 DD 77 ED      [19]  810 	ld	-19 (ix),a
   4643 DD 7E F5      [19]  811 	ld	a,-11 (ix)
   4646 DD 77 EE      [19]  812 	ld	-18 (ix),a
   4649 18 08         [12]  813 	jr	00116$
   464B                     814 00115$:
                            815 ;src/main.c:182: atk = 20;
   464B DD 36 ED 14   [19]  816 	ld	-19 (ix),#0x14
   464F DD 36 EE 00   [19]  817 	ld	-18 (ix),#0x00
   4653                     818 00116$:
                            819 ;src/main.c:183: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   4653 21 00 02      [10]  820 	ld	hl,#0x0200
   4656 CD 00 4A      [17]  821 	call	_cpct_isKeyPressed
   4659 7D            [ 4]  822 	ld	a,l
   465A B7            [ 4]  823 	or	a, a
   465B 28 24         [12]  824 	jr	Z,00128$
   465D DD 6E FC      [19]  825 	ld	l,-4 (ix)
   4660 DD 66 FD      [19]  826 	ld	h,-3 (ix)
   4663 56            [ 7]  827 	ld	d,(hl)
   4664 7A            [ 4]  828 	ld	a,d
   4665 D6 4C         [ 7]  829 	sub	a, #0x4C
   4667 30 18         [12]  830 	jr	NC,00128$
                            831 ;src/main.c:184: if(col != 2)
   4669 DD 7E F3      [19]  832 	ld	a,-13 (ix)
   466C B7            [ 4]  833 	or	a, a
   466D 20 08         [12]  834 	jr	NZ,00118$
                            835 ;src/main.c:185: p.x += 1;
   466F 14            [ 4]  836 	inc	d
   4670 DD 6E FC      [19]  837 	ld	l,-4 (ix)
   4673 DD 66 FD      [19]  838 	ld	h,-3 (ix)
   4676 72            [ 7]  839 	ld	(hl),d
   4677                     840 00118$:
                            841 ;src/main.c:186: dir = 0;
   4677 DD 36 EF 00   [19]  842 	ld	-17 (ix),#0x00
   467B DD 36 F0 00   [19]  843 	ld	-16 (ix),#0x00
   467F 18 6C         [12]  844 	jr	00139$
   4681                     845 00128$:
                            846 ;src/main.c:187: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4681 21 01 01      [10]  847 	ld	hl,#0x0101
   4684 CD 00 4A      [17]  848 	call	_cpct_isKeyPressed
   4687 7D            [ 4]  849 	ld	a,l
   4688 B7            [ 4]  850 	or	a, a
   4689 28 23         [12]  851 	jr	Z,00124$
   468B DD 6E FC      [19]  852 	ld	l,-4 (ix)
   468E DD 66 FD      [19]  853 	ld	h,-3 (ix)
   4691 56            [ 7]  854 	ld	d,(hl)
   4692 7A            [ 4]  855 	ld	a,d
   4693 B7            [ 4]  856 	or	a, a
   4694 28 18         [12]  857 	jr	Z,00124$
                            858 ;src/main.c:188: if(col != 2)
   4696 DD 7E F3      [19]  859 	ld	a,-13 (ix)
   4699 B7            [ 4]  860 	or	a, a
   469A 20 08         [12]  861 	jr	NZ,00120$
                            862 ;src/main.c:189: p.x -= 1;
   469C 15            [ 4]  863 	dec	d
   469D DD 6E FC      [19]  864 	ld	l,-4 (ix)
   46A0 DD 66 FD      [19]  865 	ld	h,-3 (ix)
   46A3 72            [ 7]  866 	ld	(hl),d
   46A4                     867 00120$:
                            868 ;src/main.c:190: dir = 1;
   46A4 DD 36 EF 01   [19]  869 	ld	-17 (ix),#0x01
   46A8 DD 36 F0 00   [19]  870 	ld	-16 (ix),#0x00
   46AC 18 3F         [12]  871 	jr	00139$
   46AE                     872 00124$:
                            873 ;src/main.c:191: }else  if(cpct_isKeyPressed(Key_Esc)){
   46AE 21 08 04      [10]  874 	ld	hl,#0x0408
   46B1 CD 00 4A      [17]  875 	call	_cpct_isKeyPressed
   46B4 7D            [ 4]  876 	ld	a,l
   46B5 B7            [ 4]  877 	or	a, a
   46B6 28 35         [12]  878 	jr	Z,00139$
                            879 ;src/main.c:192: return;
   46B8 C3 85 48      [10]  880 	jp	00159$
   46BB                     881 00138$:
                            882 ;src/main.c:196: p.x -= 2;
   46BB DD 6E FC      [19]  883 	ld	l,-4 (ix)
   46BE DD 66 FD      [19]  884 	ld	h,-3 (ix)
   46C1 7E            [ 7]  885 	ld	a,(hl)
   46C2 C6 FE         [ 7]  886 	add	a,#0xFE
   46C4 DD 6E FC      [19]  887 	ld	l,-4 (ix)
   46C7 DD 66 FD      [19]  888 	ld	h,-3 (ix)
   46CA 77            [ 7]  889 	ld	(hl),a
                            890 ;src/main.c:197: rebote -= 2;
   46CB DD 5E E9      [19]  891 	ld	e,-23 (ix)
   46CE DD 56 EA      [19]  892 	ld	d,-22 (ix)
   46D1 1B            [ 6]  893 	dec	de
   46D2 1B            [ 6]  894 	dec	de
   46D3 DD 73 E9      [19]  895 	ld	-23 (ix),e
   46D6 DD 72 EA      [19]  896 	ld	-22 (ix),d
                            897 ;src/main.c:198: if(rebote == 0){
   46D9 7A            [ 4]  898 	ld	a,d
   46DA B3            [ 4]  899 	or	a,e
   46DB 20 10         [12]  900 	jr	NZ,00139$
                            901 ;src/main.c:199: rebote = 6;
   46DD DD 36 E9 06   [19]  902 	ld	-23 (ix),#0x06
   46E1 DD 36 EA 00   [19]  903 	ld	-22 (ix),#0x00
                            904 ;src/main.c:200: col = 0;
   46E5 DD 36 EB 00   [19]  905 	ld	-21 (ix),#0x00
   46E9 DD 36 EC 00   [19]  906 	ld	-20 (ix),#0x00
   46ED                     907 00139$:
                            908 ;src/main.c:205: sprite = checkSprite(atk,dir);
   46ED DD 6E EF      [19]  909 	ld	l,-17 (ix)
   46F0 DD 66 F0      [19]  910 	ld	h,-16 (ix)
   46F3 E5            [11]  911 	push	hl
   46F4 DD 6E ED      [19]  912 	ld	l,-19 (ix)
   46F7 DD 66 EE      [19]  913 	ld	h,-18 (ix)
   46FA E5            [11]  914 	push	hl
   46FB CD C9 43      [17]  915 	call	_checkSprite
   46FE F1            [10]  916 	pop	af
   46FF F1            [10]  917 	pop	af
   4700 4D            [ 4]  918 	ld	c, l
   4701 44            [ 4]  919 	ld	b, h
                            920 ;src/main.c:207: if(col != 2 && e.vivo == 0)
   4702 DD 7E EB      [19]  921 	ld	a,-21 (ix)
   4705 D6 02         [ 7]  922 	sub	a, #0x02
   4707 20 06         [12]  923 	jr	NZ,00267$
   4709 DD 7E EC      [19]  924 	ld	a,-20 (ix)
   470C B7            [ 4]  925 	or	a, a
   470D 28 58         [12]  926 	jr	Z,00141$
   470F                     927 00267$:
   470F DD 6E F1      [19]  928 	ld	l,-15 (ix)
   4712 DD 66 F2      [19]  929 	ld	h,-14 (ix)
   4715 7E            [ 7]  930 	ld	a,(hl)
   4716 B7            [ 4]  931 	or	a, a
   4717 20 4E         [12]  932 	jr	NZ,00141$
                            933 ;src/main.c:208: col = checkCollisions(p.x,p.y,e.x,e.y,dir,atk);
   4719 DD 6E F6      [19]  934 	ld	l,-10 (ix)
   471C DD 66 F7      [19]  935 	ld	h,-9 (ix)
   471F 5E            [ 7]  936 	ld	e,(hl)
   4720 DD 6E FE      [19]  937 	ld	l,-2 (ix)
   4723 DD 66 FF      [19]  938 	ld	h,-1 (ix)
   4726 7E            [ 7]  939 	ld	a,(hl)
   4727 DD 77 F4      [19]  940 	ld	-12 (ix),a
   472A DD 6E F9      [19]  941 	ld	l,-7 (ix)
   472D DD 66 FA      [19]  942 	ld	h,-6 (ix)
   4730 7E            [ 7]  943 	ld	a,(hl)
   4731 DD 77 FB      [19]  944 	ld	-5 (ix),a
   4734 DD 6E FC      [19]  945 	ld	l,-4 (ix)
   4737 DD 66 FD      [19]  946 	ld	h,-3 (ix)
   473A 56            [ 7]  947 	ld	d,(hl)
   473B C5            [11]  948 	push	bc
   473C DD 6E ED      [19]  949 	ld	l,-19 (ix)
   473F DD 66 EE      [19]  950 	ld	h,-18 (ix)
   4742 E5            [11]  951 	push	hl
   4743 DD 6E EF      [19]  952 	ld	l,-17 (ix)
   4746 DD 66 F0      [19]  953 	ld	h,-16 (ix)
   4749 E5            [11]  954 	push	hl
   474A 7B            [ 4]  955 	ld	a,e
   474B F5            [11]  956 	push	af
   474C 33            [ 6]  957 	inc	sp
   474D DD 7E F4      [19]  958 	ld	a,-12 (ix)
   4750 F5            [11]  959 	push	af
   4751 33            [ 6]  960 	inc	sp
   4752 DD 7E FB      [19]  961 	ld	a,-5 (ix)
   4755 F5            [11]  962 	push	af
   4756 33            [ 6]  963 	inc	sp
   4757 D5            [11]  964 	push	de
   4758 33            [ 6]  965 	inc	sp
   4759 CD 35 43      [17]  966 	call	_checkCollisions
   475C F1            [10]  967 	pop	af
   475D F1            [10]  968 	pop	af
   475E F1            [10]  969 	pop	af
   475F F1            [10]  970 	pop	af
   4760 C1            [10]  971 	pop	bc
   4761 DD 75 EB      [19]  972 	ld	-21 (ix),l
   4764 DD 74 EC      [19]  973 	ld	-20 (ix),h
   4767                     974 00141$:
                            975 ;src/main.c:209: if(col == 1)
   4767 DD 7E EB      [19]  976 	ld	a,-21 (ix)
   476A 3D            [ 4]  977 	dec	a
   476B 20 0E         [12]  978 	jr	NZ,00144$
   476D DD 7E EC      [19]  979 	ld	a,-20 (ix)
   4770 B7            [ 4]  980 	or	a, a
   4771 20 08         [12]  981 	jr	NZ,00144$
                            982 ;src/main.c:210: e.vivo = 1;
   4773 DD 6E F1      [19]  983 	ld	l,-15 (ix)
   4776 DD 66 F2      [19]  984 	ld	h,-14 (ix)
   4779 36 01         [10]  985 	ld	(hl),#0x01
   477B                     986 00144$:
                            987 ;src/main.c:213: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   477B DD 6E F9      [19]  988 	ld	l,-7 (ix)
   477E DD 66 FA      [19]  989 	ld	h,-6 (ix)
   4781 56            [ 7]  990 	ld	d,(hl)
   4782 DD 6E FC      [19]  991 	ld	l,-4 (ix)
   4785 DD 66 FD      [19]  992 	ld	h,-3 (ix)
   4788 7E            [ 7]  993 	ld	a,(hl)
   4789 C5            [11]  994 	push	bc
   478A D5            [11]  995 	push	de
   478B 33            [ 6]  996 	inc	sp
   478C F5            [11]  997 	push	af
   478D 33            [ 6]  998 	inc	sp
   478E 21 00 C0      [10]  999 	ld	hl,#0xC000
   4791 E5            [11] 1000 	push	hl
   4792 CD 99 4C      [17] 1001 	call	_cpct_getScreenPtr
   4795 C1            [10] 1002 	pop	bc
                           1003 ;src/main.c:216: if(atk >= 21)
   4796 DD 7E ED      [19] 1004 	ld	a,-19 (ix)
   4799 D6 15         [ 7] 1005 	sub	a, #0x15
   479B DD 7E EE      [19] 1006 	ld	a,-18 (ix)
   479E DE 00         [ 7] 1007 	sbc	a, #0x00
   47A0 3E 00         [ 7] 1008 	ld	a,#0x00
   47A2 17            [ 4] 1009 	rla
   47A3 5F            [ 4] 1010 	ld	e,a
                           1011 ;src/main.c:158: cpct_drawSolidBox(memptr,0,4,16);
   47A4 DD 75 F4      [19] 1012 	ld	-12 (ix),l
   47A7 DD 74 F5      [19] 1013 	ld	-11 (ix),h
                           1014 ;src/main.c:217: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
                           1015 ;src/main.c:216: if(atk >= 21)
   47AA 7B            [ 4] 1016 	ld	a,e
   47AB B7            [ 4] 1017 	or	a, a
   47AC 20 13         [12] 1018 	jr	NZ,00146$
                           1019 ;src/main.c:217: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   47AE D5            [11] 1020 	push	de
   47AF 21 05 10      [10] 1021 	ld	hl,#0x1005
   47B2 E5            [11] 1022 	push	hl
   47B3 DD 6E F4      [19] 1023 	ld	l,-12 (ix)
   47B6 DD 66 F5      [19] 1024 	ld	h,-11 (ix)
   47B9 E5            [11] 1025 	push	hl
   47BA C5            [11] 1026 	push	bc
   47BB CD 5B 4B      [17] 1027 	call	_cpct_drawSpriteMasked
   47BE D1            [10] 1028 	pop	de
   47BF 18 11         [12] 1029 	jr	00147$
   47C1                    1030 00146$:
                           1031 ;src/main.c:219: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   47C1 D5            [11] 1032 	push	de
   47C2 21 04 10      [10] 1033 	ld	hl,#0x1004
   47C5 E5            [11] 1034 	push	hl
   47C6 DD 6E F4      [19] 1035 	ld	l,-12 (ix)
   47C9 DD 66 F5      [19] 1036 	ld	h,-11 (ix)
   47CC E5            [11] 1037 	push	hl
   47CD C5            [11] 1038 	push	bc
   47CE CD 5B 4B      [17] 1039 	call	_cpct_drawSpriteMasked
   47D1 D1            [10] 1040 	pop	de
   47D2                    1041 00147$:
                           1042 ;src/main.c:222: if(e.vivo == 0){
   47D2 DD 6E F1      [19] 1043 	ld	l,-15 (ix)
   47D5 DD 66 F2      [19] 1044 	ld	h,-14 (ix)
   47D8 7E            [ 7] 1045 	ld	a, (hl)
   47D9 B7            [ 4] 1046 	or	a, a
   47DA 20 2C         [12] 1047 	jr	NZ,00149$
                           1048 ;src/main.c:223: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   47DC DD 6E F6      [19] 1049 	ld	l,-10 (ix)
   47DF DD 66 F7      [19] 1050 	ld	h,-9 (ix)
   47E2 46            [ 7] 1051 	ld	b,(hl)
   47E3 DD 6E FE      [19] 1052 	ld	l,-2 (ix)
   47E6 DD 66 FF      [19] 1053 	ld	h,-1 (ix)
   47E9 56            [ 7] 1054 	ld	d,(hl)
   47EA D5            [11] 1055 	push	de
   47EB 4A            [ 4] 1056 	ld	c, d
   47EC C5            [11] 1057 	push	bc
   47ED 21 00 C0      [10] 1058 	ld	hl,#0xC000
   47F0 E5            [11] 1059 	push	hl
   47F1 CD 99 4C      [17] 1060 	call	_cpct_getScreenPtr
   47F4 D1            [10] 1061 	pop	de
                           1062 ;src/main.c:224: cpct_drawSolidBox(memptr, 18, 4, 16);
   47F5 4D            [ 4] 1063 	ld	c, l
   47F6 44            [ 4] 1064 	ld	b, h
   47F7 D5            [11] 1065 	push	de
   47F8 21 04 10      [10] 1066 	ld	hl,#0x1004
   47FB E5            [11] 1067 	push	hl
   47FC 3E 12         [ 7] 1068 	ld	a,#0x12
   47FE F5            [11] 1069 	push	af
   47FF 33            [ 6] 1070 	inc	sp
   4800 C5            [11] 1071 	push	bc
   4801 CD E1 4B      [17] 1072 	call	_cpct_drawSolidBox
   4804 F1            [10] 1073 	pop	af
   4805 F1            [10] 1074 	pop	af
   4806 33            [ 6] 1075 	inc	sp
   4807 D1            [10] 1076 	pop	de
   4808                    1077 00149$:
                           1078 ;src/main.c:227: memptr = cpct_getScreenPtr(VMEM, 6, 10);
   4808 D5            [11] 1079 	push	de
   4809 21 06 0A      [10] 1080 	ld	hl,#0x0A06
   480C E5            [11] 1081 	push	hl
   480D 21 00 C0      [10] 1082 	ld	hl,#0xC000
   4810 E5            [11] 1083 	push	hl
   4811 CD 99 4C      [17] 1084 	call	_cpct_getScreenPtr
   4814 D1            [10] 1085 	pop	de
                           1086 ;src/main.c:228: cpct_drawStringM0("FATIGA",memptr, 2, 0);
   4815 4D            [ 4] 1087 	ld	c, l
   4816 44            [ 4] 1088 	ld	b, h
   4817 D5            [11] 1089 	push	de
   4818 21 02 00      [10] 1090 	ld	hl,#0x0002
   481B E5            [11] 1091 	push	hl
   481C C5            [11] 1092 	push	bc
   481D 21 8A 48      [10] 1093 	ld	hl,#___str_2
   4820 E5            [11] 1094 	push	hl
   4821 CD 76 4A      [17] 1095 	call	_cpct_drawStringM0
   4824 21 06 00      [10] 1096 	ld	hl,#6
   4827 39            [11] 1097 	add	hl,sp
   4828 F9            [ 6] 1098 	ld	sp,hl
   4829 D1            [10] 1099 	pop	de
                           1100 ;src/main.c:230: if(atk >= 21)
   482A 7B            [ 4] 1101 	ld	a,e
                           1102 ;src/main.c:231: for(i=0; i<(*atk - 20)/10; i++){
   482B B7            [ 4] 1103 	or	a,a
   482C C2 25 45      [10] 1104 	jp	NZ,00154$
   482F 4F            [ 4] 1105 	ld	c,a
   4830                    1106 00157$:
   4830 DD 6E ED      [19] 1107 	ld	l,-19 (ix)
   4833 DD 66 EE      [19] 1108 	ld	h,-18 (ix)
   4836 7E            [ 7] 1109 	ld	a, (hl)
   4837 1E 00         [ 7] 1110 	ld	e, #0x00
   4839 C6 EC         [ 7] 1111 	add	a,#0xEC
   483B 6F            [ 4] 1112 	ld	l,a
   483C 7B            [ 4] 1113 	ld	a,e
   483D CE FF         [ 7] 1114 	adc	a,#0xFF
   483F 67            [ 4] 1115 	ld	h,a
   4840 C5            [11] 1116 	push	bc
   4841 11 0A 00      [10] 1117 	ld	de,#0x000A
   4844 D5            [11] 1118 	push	de
   4845 E5            [11] 1119 	push	hl
   4846 CD B9 4C      [17] 1120 	call	__divsint
   4849 F1            [10] 1121 	pop	af
   484A F1            [10] 1122 	pop	af
   484B C1            [10] 1123 	pop	bc
   484C 51            [ 4] 1124 	ld	d,c
   484D 1E 00         [ 7] 1125 	ld	e,#0x00
   484F 7A            [ 4] 1126 	ld	a,d
   4850 95            [ 4] 1127 	sub	a, l
   4851 7B            [ 4] 1128 	ld	a,e
   4852 9C            [ 4] 1129 	sbc	a, h
   4853 E2 58 48      [10] 1130 	jp	PO, 00270$
   4856 EE 80         [ 7] 1131 	xor	a, #0x80
   4858                    1132 00270$:
   4858 F2 25 45      [10] 1133 	jp	P,00154$
                           1134 ;src/main.c:232: memptr = cpct_getScreenPtr(VMEM, 18+i*4, 10);
   485B 79            [ 4] 1135 	ld	a,c
   485C 87            [ 4] 1136 	add	a, a
   485D 87            [ 4] 1137 	add	a, a
   485E C6 12         [ 7] 1138 	add	a, #0x12
   4860 57            [ 4] 1139 	ld	d,a
   4861 C5            [11] 1140 	push	bc
   4862 3E 0A         [ 7] 1141 	ld	a,#0x0A
   4864 F5            [11] 1142 	push	af
   4865 33            [ 6] 1143 	inc	sp
   4866 D5            [11] 1144 	push	de
   4867 33            [ 6] 1145 	inc	sp
   4868 21 00 C0      [10] 1146 	ld	hl,#0xC000
   486B E5            [11] 1147 	push	hl
   486C CD 99 4C      [17] 1148 	call	_cpct_getScreenPtr
   486F C1            [10] 1149 	pop	bc
                           1150 ;src/main.c:233: cpct_drawSolidBox(memptr, 18, 3, 10);
   4870 EB            [ 4] 1151 	ex	de,hl
   4871 C5            [11] 1152 	push	bc
   4872 21 03 0A      [10] 1153 	ld	hl,#0x0A03
   4875 E5            [11] 1154 	push	hl
   4876 3E 12         [ 7] 1155 	ld	a,#0x12
   4878 F5            [11] 1156 	push	af
   4879 33            [ 6] 1157 	inc	sp
   487A D5            [11] 1158 	push	de
   487B CD E1 4B      [17] 1159 	call	_cpct_drawSolidBox
   487E F1            [10] 1160 	pop	af
   487F F1            [10] 1161 	pop	af
   4880 33            [ 6] 1162 	inc	sp
   4881 C1            [10] 1163 	pop	bc
                           1164 ;src/main.c:231: for(i=0; i<(*atk - 20)/10; i++){
   4882 0C            [ 4] 1165 	inc	c
   4883 18 AB         [12] 1166 	jr	00157$
   4885                    1167 00159$:
   4885 DD F9         [10] 1168 	ld	sp, ix
   4887 DD E1         [14] 1169 	pop	ix
   4889 C9            [10] 1170 	ret
   488A                    1171 ___str_2:
   488A 46 41 54 49 47 41  1172 	.ascii "FATIGA"
   4890 00                 1173 	.db 0x00
                           1174 ;src/main.c:240: void main(void) {
                           1175 ;	---------------------------------
                           1176 ; Function main
                           1177 ; ---------------------------------
   4891                    1178 _main::
                           1179 ;src/main.c:242: init();
   4891 CD 00 42      [17] 1180 	call	_init
                           1181 ;src/main.c:245: while(1){
   4894                    1182 00102$:
                           1183 ;src/main.c:246: menu();
   4894 CD C9 42      [17] 1184 	call	_menu
                           1185 ;src/main.c:247: game();
   4897 CD 80 44      [17] 1186 	call	_game
   489A 18 F8         [12] 1187 	jr	00102$
                           1188 	.area _CODE
                           1189 	.area _INITIALIZER
                           1190 	.area _CABS (ABS)
