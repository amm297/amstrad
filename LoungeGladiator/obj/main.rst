                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Sep 29 18:54:00 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _loadMap
                             14 	.globl _game
                             15 	.globl _checkCollisions
                             16 	.globl _checkIntersect
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
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 ;src/main.c:40: void init(){
                             64 ;	---------------------------------
                             65 ; Function init
                             66 ; ---------------------------------
   4200                      67 _init::
                             68 ;src/main.c:41: cpct_disableFirmware();
   4200 CD B5 49      [17]   69 	call	_cpct_disableFirmware
                             70 ;src/main.c:42: cpct_setVideoMode(0);
   4203 AF            [ 4]   71 	xor	a, a
   4204 F5            [11]   72 	push	af
   4205 33            [ 6]   73 	inc	sp
   4206 CD 92 49      [17]   74 	call	_cpct_setVideoMode
   4209 33            [ 6]   75 	inc	sp
                             76 ;src/main.c:43: cpct_fw2hw(g_palette,4);
   420A 11 25 42      [10]   77 	ld	de,#_g_palette
   420D 3E 04         [ 7]   78 	ld	a,#0x04
   420F F5            [11]   79 	push	af
   4210 33            [ 6]   80 	inc	sp
   4211 D5            [11]   81 	push	de
   4212 CD 1C 49      [17]   82 	call	_cpct_fw2hw
   4215 F1            [10]   83 	pop	af
   4216 33            [ 6]   84 	inc	sp
                             85 ;src/main.c:44: cpct_setPalette(g_palette,4);
   4217 11 25 42      [10]   86 	ld	de,#_g_palette
   421A 3E 04         [ 7]   87 	ld	a,#0x04
   421C F5            [11]   88 	push	af
   421D 33            [ 6]   89 	inc	sp
   421E D5            [11]   90 	push	de
   421F CD C1 47      [17]   91 	call	_cpct_setPalette
   4222 F1            [10]   92 	pop	af
   4223 33            [ 6]   93 	inc	sp
   4224 C9            [10]   94 	ret
   4225                      95 _g_palette:
   4225 00                   96 	.db #0x00	; 0
   4226 1A                   97 	.db #0x1A	; 26
   4227 06                   98 	.db #0x06	; 6
   4228 12                   99 	.db #0x12	; 18
                            100 ;src/main.c:48: void menu(){
                            101 ;	---------------------------------
                            102 ; Function menu
                            103 ; ---------------------------------
   4229                     104 _menu::
                            105 ;src/main.c:50: cpct_clearScreen(0);
   4229 21 00 40      [10]  106 	ld	hl,#0x4000
   422C E5            [11]  107 	push	hl
   422D AF            [ 4]  108 	xor	a, a
   422E F5            [11]  109 	push	af
   422F 33            [ 6]  110 	inc	sp
   4230 26 C0         [ 7]  111 	ld	h, #0xC0
   4232 E5            [11]  112 	push	hl
   4233 CD A4 49      [17]  113 	call	_cpct_memset
                            114 ;src/main.c:52: memptr = cpct_getScreenPtr(VMEM,20,10);
   4236 21 14 0A      [10]  115 	ld	hl,#0x0A14
   4239 E5            [11]  116 	push	hl
   423A 21 00 C0      [10]  117 	ld	hl,#0xC000
   423D E5            [11]  118 	push	hl
   423E CD 7E 4A      [17]  119 	call	_cpct_getScreenPtr
                            120 ;src/main.c:53: cpct_drawStringM0("Super Menu",memptr,2,3);
   4241 EB            [ 4]  121 	ex	de,hl
   4242 01 7E 42      [10]  122 	ld	bc,#___str_0+0
   4245 21 02 03      [10]  123 	ld	hl,#0x0302
   4248 E5            [11]  124 	push	hl
   4249 D5            [11]  125 	push	de
   424A C5            [11]  126 	push	bc
   424B CD 5B 48      [17]  127 	call	_cpct_drawStringM0
   424E 21 06 00      [10]  128 	ld	hl,#6
   4251 39            [11]  129 	add	hl,sp
   4252 F9            [ 6]  130 	ld	sp,hl
                            131 ;src/main.c:55: memptr = cpct_getScreenPtr(VMEM,18,180);
   4253 21 12 B4      [10]  132 	ld	hl,#0xB412
   4256 E5            [11]  133 	push	hl
   4257 21 00 C0      [10]  134 	ld	hl,#0xC000
   425A E5            [11]  135 	push	hl
   425B CD 7E 4A      [17]  136 	call	_cpct_getScreenPtr
                            137 ;src/main.c:56: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   425E EB            [ 4]  138 	ex	de,hl
   425F 01 89 42      [10]  139 	ld	bc,#___str_1+0
   4262 21 04 05      [10]  140 	ld	hl,#0x0504
   4265 E5            [11]  141 	push	hl
   4266 D5            [11]  142 	push	de
   4267 C5            [11]  143 	push	bc
   4268 CD 5B 48      [17]  144 	call	_cpct_drawStringM0
   426B 21 06 00      [10]  145 	ld	hl,#6
   426E 39            [11]  146 	add	hl,sp
   426F F9            [ 6]  147 	ld	sp,hl
                            148 ;src/main.c:58: do{
   4270                     149 00101$:
                            150 ;src/main.c:59: cpct_scanKeyboard_f();
   4270 CD F1 47      [17]  151 	call	_cpct_scanKeyboard_f
                            152 ;src/main.c:60: }while(!cpct_isKeyPressed(Key_Enter));
   4273 21 00 40      [10]  153 	ld	hl,#0x4000
   4276 CD E5 47      [17]  154 	call	_cpct_isKeyPressed
   4279 7D            [ 4]  155 	ld	a,l
   427A B7            [ 4]  156 	or	a, a
   427B 28 F3         [12]  157 	jr	Z,00101$
   427D C9            [10]  158 	ret
   427E                     159 ___str_0:
   427E 53 75 70 65 72 20   160 	.ascii "Super Menu"
        4D 65 6E 75
   4288 00                  161 	.db 0x00
   4289                     162 ___str_1:
   4289 50 75 6C 73 61 20   163 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4294 00                  164 	.db 0x00
                            165 ;src/main.c:64: u8 checkIntersect(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir){
                            166 ;	---------------------------------
                            167 ; Function checkIntersect
                            168 ; ---------------------------------
   4295                     169 _checkIntersect::
                            170 ;src/main.c:66: }
   4295 C9            [10]  171 	ret
                            172 ;src/main.c:69: u8* checkCollisions(u8 pX, u8 pY, u8 eX, u8 eY, u8* dir, u8* atk){
                            173 ;	---------------------------------
                            174 ; Function checkCollisions
                            175 ; ---------------------------------
   4296                     176 _checkCollisions::
   4296 DD E5         [15]  177 	push	ix
   4298 DD 21 00 00   [14]  178 	ld	ix,#0
   429C DD 39         [15]  179 	add	ix,sp
                            180 ;src/main.c:72: if(eX - pX > -1 && eX - pX < 11)
   429E DD 4E 06      [19]  181 	ld	c,6 (ix)
   42A1 06 00         [ 7]  182 	ld	b,#0x00
   42A3 DD 6E 04      [19]  183 	ld	l,4 (ix)
   42A6 26 00         [ 7]  184 	ld	h,#0x00
   42A8 79            [ 4]  185 	ld	a,c
   42A9 95            [ 4]  186 	sub	a, l
   42AA 5F            [ 4]  187 	ld	e,a
   42AB 78            [ 4]  188 	ld	a,b
   42AC 9C            [ 4]  189 	sbc	a, h
   42AD 57            [ 4]  190 	ld	d,a
                            191 ;src/main.c:70: if(atk == 1)
   42AE DD 7E 0A      [19]  192 	ld	a,10 (ix)
   42B1 3D            [ 4]  193 	dec	a
   42B2 20 55         [12]  194 	jr	NZ,00116$
   42B4 DD 7E 0B      [19]  195 	ld	a,11 (ix)
   42B7 B7            [ 4]  196 	or	a, a
   42B8 20 4F         [12]  197 	jr	NZ,00116$
                            198 ;src/main.c:71: if(dir == 0)
   42BA DD 7E 09      [19]  199 	ld	a,9 (ix)
   42BD DD B6 08      [19]  200 	or	a,8 (ix)
   42C0 20 21         [12]  201 	jr	NZ,00110$
                            202 ;src/main.c:72: if(eX - pX > -1 && eX - pX < 11)
   42C2 3E FF         [ 7]  203 	ld	a,#0xFF
   42C4 BB            [ 4]  204 	cp	a, e
   42C5 9A            [ 4]  205 	sbc	a, d
   42C6 E2 CB 42      [10]  206 	jp	PO, 00154$
   42C9 EE 80         [ 7]  207 	xor	a, #0x80
   42CB                     208 00154$:
   42CB F2 DE 42      [10]  209 	jp	P,00102$
   42CE 7B            [ 4]  210 	ld	a,e
   42CF D6 0B         [ 7]  211 	sub	a, #0x0B
   42D1 7A            [ 4]  212 	ld	a,d
   42D2 17            [ 4]  213 	rla
   42D3 3F            [ 4]  214 	ccf
   42D4 1F            [ 4]  215 	rra
   42D5 DE 80         [ 7]  216 	sbc	a, #0x80
   42D7 30 05         [12]  217 	jr	NC,00102$
                            218 ;src/main.c:73: return 1;
   42D9 21 01 00      [10]  219 	ld	hl,#0x0001
   42DC 18 49         [12]  220 	jr	00118$
   42DE                     221 00102$:
                            222 ;src/main.c:75: return 0;
   42DE 21 00 00      [10]  223 	ld	hl,#0x0000
   42E1 18 44         [12]  224 	jr	00118$
   42E3                     225 00110$:
                            226 ;src/main.c:77: if(pX - eX > -1 && pX - eX < 11)
   42E3 BF            [ 4]  227 	cp	a, a
   42E4 ED 42         [15]  228 	sbc	hl, bc
   42E6 3E FF         [ 7]  229 	ld	a,#0xFF
   42E8 BD            [ 4]  230 	cp	a, l
   42E9 9C            [ 4]  231 	sbc	a, h
   42EA E2 EF 42      [10]  232 	jp	PO, 00155$
   42ED EE 80         [ 7]  233 	xor	a, #0x80
   42EF                     234 00155$:
   42EF F2 04 43      [10]  235 	jp	P,00106$
   42F2 11 0B 80      [10]  236 	ld	de, #0x800B
   42F5 29            [11]  237 	add	hl, hl
   42F6 3F            [ 4]  238 	ccf
   42F7 CB 1C         [ 8]  239 	rr	h
   42F9 CB 1D         [ 8]  240 	rr	l
   42FB ED 52         [15]  241 	sbc	hl, de
   42FD 30 05         [12]  242 	jr	NC,00106$
                            243 ;src/main.c:78: return 1;
   42FF 21 01 00      [10]  244 	ld	hl,#0x0001
   4302 18 23         [12]  245 	jr	00118$
   4304                     246 00106$:
                            247 ;src/main.c:80: return 0;
   4304 21 00 00      [10]  248 	ld	hl,#0x0000
   4307 18 1E         [12]  249 	jr	00118$
   4309                     250 00116$:
                            251 ;src/main.c:82: if(eX - pX > 0 && eX - pX < 4)
   4309 AF            [ 4]  252 	xor	a, a
   430A BB            [ 4]  253 	cp	a, e
   430B 9A            [ 4]  254 	sbc	a, d
   430C E2 11 43      [10]  255 	jp	PO, 00156$
   430F EE 80         [ 7]  256 	xor	a, #0x80
   4311                     257 00156$:
   4311 F2 24 43      [10]  258 	jp	P,00117$
   4314 7B            [ 4]  259 	ld	a,e
   4315 D6 04         [ 7]  260 	sub	a, #0x04
   4317 7A            [ 4]  261 	ld	a,d
   4318 17            [ 4]  262 	rla
   4319 3F            [ 4]  263 	ccf
   431A 1F            [ 4]  264 	rra
   431B DE 80         [ 7]  265 	sbc	a, #0x80
   431D 30 05         [12]  266 	jr	NC,00117$
                            267 ;src/main.c:83: return 2;
   431F 21 02 00      [10]  268 	ld	hl,#0x0002
   4322 18 03         [12]  269 	jr	00118$
   4324                     270 00117$:
                            271 ;src/main.c:85: return 0;
   4324 21 00 00      [10]  272 	ld	hl,#0x0000
   4327                     273 00118$:
   4327 DD E1         [14]  274 	pop	ix
   4329 C9            [10]  275 	ret
                            276 ;src/main.c:90: void game(){
                            277 ;	---------------------------------
                            278 ; Function game
                            279 ; ---------------------------------
   432A                     280 _game::
   432A DD E5         [15]  281 	push	ix
   432C DD 21 00 00   [14]  282 	ld	ix,#0
   4330 DD 39         [15]  283 	add	ix,sp
   4332 21 E4 FF      [10]  284 	ld	hl,#-28
   4335 39            [11]  285 	add	hl,sp
   4336 F9            [ 6]  286 	ld	sp,hl
                            287 ;src/main.c:91: TPlayer p = { 0,100 };
   4337 21 0D 00      [10]  288 	ld	hl,#0x000D
   433A 39            [11]  289 	add	hl,sp
   433B 36 00         [10]  290 	ld	(hl),#0x00
   433D 21 0D 00      [10]  291 	ld	hl,#0x000D
   4340 39            [11]  292 	add	hl,sp
   4341 DD 75 F5      [19]  293 	ld	-11 (ix),l
   4344 DD 74 F6      [19]  294 	ld	-10 (ix),h
   4347 DD 7E F5      [19]  295 	ld	a,-11 (ix)
   434A C6 01         [ 7]  296 	add	a, #0x01
   434C DD 77 F3      [19]  297 	ld	-13 (ix),a
   434F DD 7E F6      [19]  298 	ld	a,-10 (ix)
   4352 CE 00         [ 7]  299 	adc	a, #0x00
   4354 DD 77 F4      [19]  300 	ld	-12 (ix),a
   4357 DD 6E F3      [19]  301 	ld	l,-13 (ix)
   435A DD 66 F4      [19]  302 	ld	h,-12 (ix)
   435D 36 64         [10]  303 	ld	(hl),#0x64
                            304 ;src/main.c:92: TEnemy  e = { 50,100,0 };
   435F 21 0A 00      [10]  305 	ld	hl,#0x000A
   4362 39            [11]  306 	add	hl,sp
   4363 36 32         [10]  307 	ld	(hl),#0x32
   4365 21 0A 00      [10]  308 	ld	hl,#0x000A
   4368 39            [11]  309 	add	hl,sp
   4369 DD 75 FE      [19]  310 	ld	-2 (ix),l
   436C DD 74 FF      [19]  311 	ld	-1 (ix),h
   436F DD 7E FE      [19]  312 	ld	a,-2 (ix)
   4372 C6 01         [ 7]  313 	add	a, #0x01
   4374 DD 77 FC      [19]  314 	ld	-4 (ix),a
   4377 DD 7E FF      [19]  315 	ld	a,-1 (ix)
   437A CE 00         [ 7]  316 	adc	a, #0x00
   437C DD 77 FD      [19]  317 	ld	-3 (ix),a
   437F DD 6E FC      [19]  318 	ld	l,-4 (ix)
   4382 DD 66 FD      [19]  319 	ld	h,-3 (ix)
   4385 36 64         [10]  320 	ld	(hl),#0x64
   4387 DD 7E FE      [19]  321 	ld	a,-2 (ix)
   438A C6 02         [ 7]  322 	add	a, #0x02
   438C DD 77 FA      [19]  323 	ld	-6 (ix),a
   438F DD 7E FF      [19]  324 	ld	a,-1 (ix)
   4392 CE 00         [ 7]  325 	adc	a, #0x00
   4394 DD 77 FB      [19]  326 	ld	-5 (ix),a
   4397 DD 6E FA      [19]  327 	ld	l,-6 (ix)
   439A DD 66 FB      [19]  328 	ld	h,-5 (ix)
   439D 36 00         [10]  329 	ld	(hl),#0x00
                            330 ;src/main.c:95: u8* dir = 0;
   439F DD 36 EC 00   [19]  331 	ld	-20 (ix),#0x00
   43A3 DD 36 ED 00   [19]  332 	ld	-19 (ix),#0x00
                            333 ;src/main.c:96: u8* atk = 0;
   43A7 DD 36 EA 00   [19]  334 	ld	-22 (ix),#0x00
   43AB DD 36 EB 00   [19]  335 	ld	-21 (ix),#0x00
                            336 ;src/main.c:97: u8* col = 0;
   43AF DD 36 E8 00   [19]  337 	ld	-24 (ix),#0x00
   43B3 DD 36 E9 00   [19]  338 	ld	-23 (ix),#0x00
                            339 ;src/main.c:98: u8* rebote = 12;
   43B7 DD 36 E6 0C   [19]  340 	ld	-26 (ix),#0x0C
   43BB DD 36 E7 00   [19]  341 	ld	-25 (ix),#0x00
                            342 ;src/main.c:99: cpct_clearScreen(0);
   43BF 21 00 40      [10]  343 	ld	hl,#0x4000
   43C2 E5            [11]  344 	push	hl
   43C3 AF            [ 4]  345 	xor	a, a
   43C4 F5            [11]  346 	push	af
   43C5 33            [ 6]  347 	inc	sp
   43C6 26 C0         [ 7]  348 	ld	h, #0xC0
   43C8 E5            [11]  349 	push	hl
   43C9 CD A4 49      [17]  350 	call	_cpct_memset
                            351 ;src/main.c:101: while (1){
   43CC                     352 00152$:
                            353 ;src/main.c:104: cpct_waitVSYNC();
   43CC CD 8A 49      [17]  354 	call	_cpct_waitVSYNC
                            355 ;src/main.c:107: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   43CF DD 6E F3      [19]  356 	ld	l,-13 (ix)
   43D2 DD 66 F4      [19]  357 	ld	h,-12 (ix)
   43D5 46            [ 7]  358 	ld	b,(hl)
   43D6 DD 6E F5      [19]  359 	ld	l,-11 (ix)
   43D9 DD 66 F6      [19]  360 	ld	h,-10 (ix)
   43DC 4E            [ 7]  361 	ld	c, (hl)
   43DD C5            [11]  362 	push	bc
   43DE 21 00 C0      [10]  363 	ld	hl,#0xC000
   43E1 E5            [11]  364 	push	hl
   43E2 CD 7E 4A      [17]  365 	call	_cpct_getScreenPtr
   43E5 DD 74 E5      [19]  366 	ld	-27 (ix),h
   43E8 DD 75 E4      [19]  367 	ld	-28 (ix), l
   43EB DD 75 F8      [19]  368 	ld	-8 (ix), l
   43EE DD 7E E5      [19]  369 	ld	a,-27 (ix)
   43F1 DD 77 F9      [19]  370 	ld	-7 (ix),a
                            371 ;src/main.c:109: cpct_drawSolidBox(memptr,0,4,16);
                            372 ;src/main.c:108: if(atk == 0)
   43F4 DD 7E EB      [19]  373 	ld	a,-21 (ix)
   43F7 DD B6 EA      [19]  374 	or	a,-22 (ix)
   43FA 20 16         [12]  375 	jr	NZ,00102$
                            376 ;src/main.c:109: cpct_drawSolidBox(memptr,0,4,16);
   43FC 21 04 10      [10]  377 	ld	hl,#0x1004
   43FF E5            [11]  378 	push	hl
   4400 AF            [ 4]  379 	xor	a, a
   4401 F5            [11]  380 	push	af
   4402 33            [ 6]  381 	inc	sp
   4403 DD 6E F8      [19]  382 	ld	l,-8 (ix)
   4406 DD 66 F9      [19]  383 	ld	h,-7 (ix)
   4409 E5            [11]  384 	push	hl
   440A CD C6 49      [17]  385 	call	_cpct_drawSolidBox
   440D F1            [10]  386 	pop	af
   440E F1            [10]  387 	pop	af
   440F 33            [ 6]  388 	inc	sp
   4410 18 14         [12]  389 	jr	00103$
   4412                     390 00102$:
                            391 ;src/main.c:111: cpct_drawSolidBox(memptr,0,5,16);
   4412 21 05 10      [10]  392 	ld	hl,#0x1005
   4415 E5            [11]  393 	push	hl
   4416 AF            [ 4]  394 	xor	a, a
   4417 F5            [11]  395 	push	af
   4418 33            [ 6]  396 	inc	sp
   4419 DD 6E F8      [19]  397 	ld	l,-8 (ix)
   441C DD 66 F9      [19]  398 	ld	h,-7 (ix)
   441F E5            [11]  399 	push	hl
   4420 CD C6 49      [17]  400 	call	_cpct_drawSolidBox
   4423 F1            [10]  401 	pop	af
   4424 F1            [10]  402 	pop	af
   4425 33            [ 6]  403 	inc	sp
   4426                     404 00103$:
                            405 ;src/main.c:113: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4426 DD 6E FC      [19]  406 	ld	l,-4 (ix)
   4429 DD 66 FD      [19]  407 	ld	h,-3 (ix)
   442C 46            [ 7]  408 	ld	b,(hl)
   442D DD 6E FE      [19]  409 	ld	l,-2 (ix)
   4430 DD 66 FF      [19]  410 	ld	h,-1 (ix)
   4433 4E            [ 7]  411 	ld	c, (hl)
   4434 C5            [11]  412 	push	bc
   4435 21 00 C0      [10]  413 	ld	hl,#0xC000
   4438 E5            [11]  414 	push	hl
   4439 CD 7E 4A      [17]  415 	call	_cpct_getScreenPtr
   443C 4D            [ 4]  416 	ld	c, l
   443D 44            [ 4]  417 	ld	b, h
                            418 ;src/main.c:114: if(e.vivo == 0)
   443E DD 6E FA      [19]  419 	ld	l,-6 (ix)
   4441 DD 66 FB      [19]  420 	ld	h,-5 (ix)
   4444 7E            [ 7]  421 	ld	a,(hl)
   4445 B7            [ 4]  422 	or	a, a
   4446 20 0E         [12]  423 	jr	NZ,00105$
                            424 ;src/main.c:115: cpct_drawSolidBox(memptr,0,4,16);
   4448 21 04 10      [10]  425 	ld	hl,#0x1004
   444B E5            [11]  426 	push	hl
   444C AF            [ 4]  427 	xor	a, a
   444D F5            [11]  428 	push	af
   444E 33            [ 6]  429 	inc	sp
   444F C5            [11]  430 	push	bc
   4450 CD C6 49      [17]  431 	call	_cpct_drawSolidBox
   4453 F1            [10]  432 	pop	af
   4454 F1            [10]  433 	pop	af
   4455 33            [ 6]  434 	inc	sp
   4456                     435 00105$:
                            436 ;src/main.c:117: atk = 0;
   4456 DD 36 EA 00   [19]  437 	ld	-22 (ix),#0x00
   445A DD 36 EB 00   [19]  438 	ld	-21 (ix),#0x00
                            439 ;src/main.c:119: if(col != 2){
   445E DD 7E E8      [19]  440 	ld	a,-24 (ix)
   4461 D6 02         [ 7]  441 	sub	a, #0x02
   4463 20 0A         [12]  442 	jr	NZ,00244$
   4465 DD 7E E9      [19]  443 	ld	a,-23 (ix)
   4468 B7            [ 4]  444 	or	a, a
   4469 20 04         [12]  445 	jr	NZ,00244$
   446B 3E 01         [ 7]  446 	ld	a,#0x01
   446D 18 01         [12]  447 	jr	00245$
   446F                     448 00244$:
   446F AF            [ 4]  449 	xor	a,a
   4470                     450 00245$:
   4470 4F            [ 4]  451 	ld	c,a
   4471 B7            [ 4]  452 	or	a, a
   4472 C2 20 45      [10]  453 	jp	NZ,00131$
                            454 ;src/main.c:120: cpct_scanKeyboard_f();
   4475 C5            [11]  455 	push	bc
   4476 CD F1 47      [17]  456 	call	_cpct_scanKeyboard_f
   4479 21 05 80      [10]  457 	ld	hl,#0x8005
   447C CD E5 47      [17]  458 	call	_cpct_isKeyPressed
   447F 7D            [ 4]  459 	ld	a,l
   4480 C1            [10]  460 	pop	bc
   4481 B7            [ 4]  461 	or	a, a
   4482 28 33         [12]  462 	jr	Z,00126$
                            463 ;src/main.c:122: atk = 1;
   4484 DD 36 EA 01   [19]  464 	ld	-22 (ix),#0x01
   4488 DD 36 EB 00   [19]  465 	ld	-21 (ix),#0x00
                            466 ;src/main.c:123: if(cpct_isKeyPressed(Key_CursorRight))
   448C 21 00 02      [10]  467 	ld	hl,#0x0200
   448F CD E5 47      [17]  468 	call	_cpct_isKeyPressed
   4492 7D            [ 4]  469 	ld	a,l
   4493 B7            [ 4]  470 	or	a, a
   4494 28 0B         [12]  471 	jr	Z,00109$
                            472 ;src/main.c:124: dir = 0;
   4496 DD 36 EC 00   [19]  473 	ld	-20 (ix),#0x00
   449A DD 36 ED 00   [19]  474 	ld	-19 (ix),#0x00
   449E C3 64 45      [10]  475 	jp	00132$
   44A1                     476 00109$:
                            477 ;src/main.c:125: else if(cpct_isKeyPressed(Key_CursorLeft))
   44A1 21 01 01      [10]  478 	ld	hl,#0x0101
   44A4 CD E5 47      [17]  479 	call	_cpct_isKeyPressed
   44A7 7D            [ 4]  480 	ld	a,l
   44A8 B7            [ 4]  481 	or	a, a
   44A9 CA 64 45      [10]  482 	jp	Z,00132$
                            483 ;src/main.c:126: dir = 1;
   44AC DD 36 EC 01   [19]  484 	ld	-20 (ix),#0x01
   44B0 DD 36 ED 00   [19]  485 	ld	-19 (ix),#0x00
   44B4 C3 64 45      [10]  486 	jp	00132$
   44B7                     487 00126$:
                            488 ;src/main.c:127: }else if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   44B7 C5            [11]  489 	push	bc
   44B8 21 00 02      [10]  490 	ld	hl,#0x0200
   44BB CD E5 47      [17]  491 	call	_cpct_isKeyPressed
   44BE 7D            [ 4]  492 	ld	a,l
   44BF C1            [10]  493 	pop	bc
   44C0 B7            [ 4]  494 	or	a, a
   44C1 28 23         [12]  495 	jr	Z,00122$
   44C3 DD 6E F5      [19]  496 	ld	l,-11 (ix)
   44C6 DD 66 F6      [19]  497 	ld	h,-10 (ix)
   44C9 56            [ 7]  498 	ld	d,(hl)
   44CA 7A            [ 4]  499 	ld	a,d
   44CB D6 4C         [ 7]  500 	sub	a, #0x4C
   44CD 30 17         [12]  501 	jr	NC,00122$
                            502 ;src/main.c:128: if(col != 2)
   44CF 79            [ 4]  503 	ld	a,c
   44D0 B7            [ 4]  504 	or	a, a
   44D1 20 08         [12]  505 	jr	NZ,00112$
                            506 ;src/main.c:129: p.x += 1;
   44D3 14            [ 4]  507 	inc	d
   44D4 DD 6E F5      [19]  508 	ld	l,-11 (ix)
   44D7 DD 66 F6      [19]  509 	ld	h,-10 (ix)
   44DA 72            [ 7]  510 	ld	(hl),d
   44DB                     511 00112$:
                            512 ;src/main.c:130: dir = 0;
   44DB DD 36 EC 00   [19]  513 	ld	-20 (ix),#0x00
   44DF DD 36 ED 00   [19]  514 	ld	-19 (ix),#0x00
   44E3 C3 64 45      [10]  515 	jp	00132$
   44E6                     516 00122$:
                            517 ;src/main.c:131: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   44E6 C5            [11]  518 	push	bc
   44E7 21 01 01      [10]  519 	ld	hl,#0x0101
   44EA CD E5 47      [17]  520 	call	_cpct_isKeyPressed
   44ED 7D            [ 4]  521 	ld	a,l
   44EE C1            [10]  522 	pop	bc
   44EF B7            [ 4]  523 	or	a, a
   44F0 28 21         [12]  524 	jr	Z,00118$
   44F2 DD 6E F5      [19]  525 	ld	l,-11 (ix)
   44F5 DD 66 F6      [19]  526 	ld	h,-10 (ix)
   44F8 56            [ 7]  527 	ld	d,(hl)
   44F9 7A            [ 4]  528 	ld	a,d
   44FA B7            [ 4]  529 	or	a, a
   44FB 28 16         [12]  530 	jr	Z,00118$
                            531 ;src/main.c:132: if(col != 2)
   44FD 79            [ 4]  532 	ld	a,c
   44FE B7            [ 4]  533 	or	a, a
   44FF 20 08         [12]  534 	jr	NZ,00114$
                            535 ;src/main.c:133: p.x -= 1;
   4501 15            [ 4]  536 	dec	d
   4502 DD 6E F5      [19]  537 	ld	l,-11 (ix)
   4505 DD 66 F6      [19]  538 	ld	h,-10 (ix)
   4508 72            [ 7]  539 	ld	(hl),d
   4509                     540 00114$:
                            541 ;src/main.c:134: dir = 1;
   4509 DD 36 EC 01   [19]  542 	ld	-20 (ix),#0x01
   450D DD 36 ED 00   [19]  543 	ld	-19 (ix),#0x00
   4511 18 51         [12]  544 	jr	00132$
   4513                     545 00118$:
                            546 ;src/main.c:135: }else  if(cpct_isKeyPressed(Key_Esc)){
   4513 21 08 04      [10]  547 	ld	hl,#0x0408
   4516 CD E5 47      [17]  548 	call	_cpct_isKeyPressed
   4519 7D            [ 4]  549 	ld	a,l
   451A B7            [ 4]  550 	or	a, a
   451B 28 47         [12]  551 	jr	Z,00132$
                            552 ;src/main.c:136: return;
   451D C3 70 46      [10]  553 	jp	00154$
   4520                     554 00131$:
                            555 ;src/main.c:139: p.x -= 2;
   4520 DD 6E F5      [19]  556 	ld	l,-11 (ix)
   4523 DD 66 F6      [19]  557 	ld	h,-10 (ix)
   4526 7E            [ 7]  558 	ld	a,(hl)
   4527 C6 FE         [ 7]  559 	add	a,#0xFE
   4529 DD 6E F5      [19]  560 	ld	l,-11 (ix)
   452C DD 66 F6      [19]  561 	ld	h,-10 (ix)
   452F 77            [ 7]  562 	ld	(hl),a
                            563 ;src/main.c:140: rebote -= 2;
   4530 DD 7E E6      [19]  564 	ld	a,-26 (ix)
   4533 C6 FE         [ 7]  565 	add	a,#0xFE
   4535 DD 77 F8      [19]  566 	ld	-8 (ix),a
   4538 DD 7E E7      [19]  567 	ld	a,-25 (ix)
   453B CE FF         [ 7]  568 	adc	a,#0xFF
   453D DD 77 F9      [19]  569 	ld	-7 (ix),a
   4540 DD 7E F8      [19]  570 	ld	a,-8 (ix)
   4543 DD 77 E6      [19]  571 	ld	-26 (ix),a
   4546 DD 7E F9      [19]  572 	ld	a,-7 (ix)
   4549 DD 77 E7      [19]  573 	ld	-25 (ix),a
                            574 ;src/main.c:141: if(rebote == 0){
   454C DD 7E F9      [19]  575 	ld	a,-7 (ix)
   454F DD B6 F8      [19]  576 	or	a,-8 (ix)
   4552 20 10         [12]  577 	jr	NZ,00132$
                            578 ;src/main.c:142: rebote = 12;
   4554 DD 36 E6 0C   [19]  579 	ld	-26 (ix),#0x0C
   4558 DD 36 E7 00   [19]  580 	ld	-25 (ix),#0x00
                            581 ;src/main.c:143: col = 0;
   455C DD 36 E8 00   [19]  582 	ld	-24 (ix),#0x00
   4560 DD 36 E9 00   [19]  583 	ld	-23 (ix),#0x00
   4564                     584 00132$:
                            585 ;src/main.c:148: if(atk == 0)
   4564 DD 7E EB      [19]  586 	ld	a,-21 (ix)
   4567 DD B6 EA      [19]  587 	or	a,-22 (ix)
   456A 20 12         [12]  588 	jr	NZ,00140$
                            589 ;src/main.c:149: if(dir == 0)
   456C DD 7E ED      [19]  590 	ld	a,-19 (ix)
   456F DD B6 EC      [19]  591 	or	a,-20 (ix)
   4572 20 05         [12]  592 	jr	NZ,00134$
                            593 ;src/main.c:150: sprite = gladis_quieto_dcha;
   4574 01 00 41      [10]  594 	ld	bc,#_gladis_quieto_dcha
   4577 18 15         [12]  595 	jr	00141$
   4579                     596 00134$:
                            597 ;src/main.c:152: sprite = gladis_quieto_izda;
   4579 01 80 41      [10]  598 	ld	bc,#_gladis_quieto_izda
   457C 18 10         [12]  599 	jr	00141$
   457E                     600 00140$:
                            601 ;src/main.c:153: else if(dir == 0){
   457E DD 7E ED      [19]  602 	ld	a,-19 (ix)
   4581 DD B6 EC      [19]  603 	or	a,-20 (ix)
   4584 20 05         [12]  604 	jr	NZ,00137$
                            605 ;src/main.c:154: sprite = gladis_atk_dcha;
   4586 01 81 46      [10]  606 	ld	bc,#_gladis_atk_dcha
   4589 18 03         [12]  607 	jr	00141$
   458B                     608 00137$:
                            609 ;src/main.c:156: sprite = gladis_atk_izda;
   458B 01 21 47      [10]  610 	ld	bc,#_gladis_atk_izda
   458E                     611 00141$:
                            612 ;src/main.c:159: if(col != 2)
   458E DD 7E E8      [19]  613 	ld	a,-24 (ix)
   4591 D6 02         [ 7]  614 	sub	a, #0x02
   4593 20 06         [12]  615 	jr	NZ,00246$
   4595 DD 7E E9      [19]  616 	ld	a,-23 (ix)
   4598 B7            [ 4]  617 	or	a, a
   4599 28 4E         [12]  618 	jr	Z,00143$
   459B                     619 00246$:
                            620 ;src/main.c:160: col = checkCollisions(p.x,p.y,e.x,e.y,dir,atk);
   459B DD 6E FC      [19]  621 	ld	l,-4 (ix)
   459E DD 66 FD      [19]  622 	ld	h,-3 (ix)
   45A1 5E            [ 7]  623 	ld	e,(hl)
   45A2 DD 6E FE      [19]  624 	ld	l,-2 (ix)
   45A5 DD 66 FF      [19]  625 	ld	h,-1 (ix)
   45A8 7E            [ 7]  626 	ld	a,(hl)
   45A9 DD 77 F8      [19]  627 	ld	-8 (ix),a
   45AC DD 6E F3      [19]  628 	ld	l,-13 (ix)
   45AF DD 66 F4      [19]  629 	ld	h,-12 (ix)
   45B2 7E            [ 7]  630 	ld	a,(hl)
   45B3 DD 77 F7      [19]  631 	ld	-9 (ix),a
   45B6 DD 6E F5      [19]  632 	ld	l,-11 (ix)
   45B9 DD 66 F6      [19]  633 	ld	h,-10 (ix)
   45BC 56            [ 7]  634 	ld	d,(hl)
   45BD C5            [11]  635 	push	bc
   45BE DD 6E EA      [19]  636 	ld	l,-22 (ix)
   45C1 DD 66 EB      [19]  637 	ld	h,-21 (ix)
   45C4 E5            [11]  638 	push	hl
   45C5 DD 6E EC      [19]  639 	ld	l,-20 (ix)
   45C8 DD 66 ED      [19]  640 	ld	h,-19 (ix)
   45CB E5            [11]  641 	push	hl
   45CC 7B            [ 4]  642 	ld	a,e
   45CD F5            [11]  643 	push	af
   45CE 33            [ 6]  644 	inc	sp
   45CF DD 7E F8      [19]  645 	ld	a,-8 (ix)
   45D2 F5            [11]  646 	push	af
   45D3 33            [ 6]  647 	inc	sp
   45D4 DD 7E F7      [19]  648 	ld	a,-9 (ix)
   45D7 F5            [11]  649 	push	af
   45D8 33            [ 6]  650 	inc	sp
   45D9 D5            [11]  651 	push	de
   45DA 33            [ 6]  652 	inc	sp
   45DB CD 96 42      [17]  653 	call	_checkCollisions
   45DE F1            [10]  654 	pop	af
   45DF F1            [10]  655 	pop	af
   45E0 F1            [10]  656 	pop	af
   45E1 F1            [10]  657 	pop	af
   45E2 C1            [10]  658 	pop	bc
   45E3 DD 75 E8      [19]  659 	ld	-24 (ix),l
   45E6 DD 74 E9      [19]  660 	ld	-23 (ix),h
   45E9                     661 00143$:
                            662 ;src/main.c:161: if(col == 1)
   45E9 DD 7E E8      [19]  663 	ld	a,-24 (ix)
   45EC 3D            [ 4]  664 	dec	a
   45ED 20 0E         [12]  665 	jr	NZ,00145$
   45EF DD 7E E9      [19]  666 	ld	a,-23 (ix)
   45F2 B7            [ 4]  667 	or	a, a
   45F3 20 08         [12]  668 	jr	NZ,00145$
                            669 ;src/main.c:162: e.vivo = 1;
   45F5 DD 6E FA      [19]  670 	ld	l,-6 (ix)
   45F8 DD 66 FB      [19]  671 	ld	h,-5 (ix)
   45FB 36 01         [10]  672 	ld	(hl),#0x01
   45FD                     673 00145$:
                            674 ;src/main.c:165: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   45FD DD 6E F3      [19]  675 	ld	l,-13 (ix)
   4600 DD 66 F4      [19]  676 	ld	h,-12 (ix)
   4603 56            [ 7]  677 	ld	d,(hl)
   4604 DD 6E F5      [19]  678 	ld	l,-11 (ix)
   4607 DD 66 F6      [19]  679 	ld	h,-10 (ix)
   460A 7E            [ 7]  680 	ld	a,(hl)
   460B C5            [11]  681 	push	bc
   460C D5            [11]  682 	push	de
   460D 33            [ 6]  683 	inc	sp
   460E F5            [11]  684 	push	af
   460F 33            [ 6]  685 	inc	sp
   4610 21 00 C0      [10]  686 	ld	hl,#0xC000
   4613 E5            [11]  687 	push	hl
   4614 CD 7E 4A      [17]  688 	call	_cpct_getScreenPtr
   4617 C1            [10]  689 	pop	bc
                            690 ;src/main.c:109: cpct_drawSolidBox(memptr,0,4,16);
   4618 EB            [ 4]  691 	ex	de,hl
                            692 ;src/main.c:168: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
                            693 ;src/main.c:167: if(atk == 1)
   4619 DD 7E EA      [19]  694 	ld	a,-22 (ix)
   461C 3D            [ 4]  695 	dec	a
   461D 20 11         [12]  696 	jr	NZ,00147$
   461F DD 7E EB      [19]  697 	ld	a,-21 (ix)
   4622 B7            [ 4]  698 	or	a, a
   4623 20 0B         [12]  699 	jr	NZ,00147$
                            700 ;src/main.c:168: cpct_drawSpriteMasked(sprite, memptr, 5, 16);
   4625 21 05 10      [10]  701 	ld	hl,#0x1005
   4628 E5            [11]  702 	push	hl
   4629 D5            [11]  703 	push	de
   462A C5            [11]  704 	push	bc
   462B CD 40 49      [17]  705 	call	_cpct_drawSpriteMasked
   462E 18 09         [12]  706 	jr	00148$
   4630                     707 00147$:
                            708 ;src/main.c:170: cpct_drawSpriteMasked(sprite, memptr, 4, 16);
   4630 21 04 10      [10]  709 	ld	hl,#0x1004
   4633 E5            [11]  710 	push	hl
   4634 D5            [11]  711 	push	de
   4635 C5            [11]  712 	push	bc
   4636 CD 40 49      [17]  713 	call	_cpct_drawSpriteMasked
   4639                     714 00148$:
                            715 ;src/main.c:172: if(e.vivo == 0){
   4639 DD 6E FA      [19]  716 	ld	l,-6 (ix)
   463C DD 66 FB      [19]  717 	ld	h,-5 (ix)
   463F 7E            [ 7]  718 	ld	a,(hl)
   4640 B7            [ 4]  719 	or	a, a
   4641 C2 CC 43      [10]  720 	jp	NZ,00152$
                            721 ;src/main.c:173: memptr = cpct_getScreenPtr(VMEM,e.x,e.y);
   4644 DD 6E FC      [19]  722 	ld	l,-4 (ix)
   4647 DD 66 FD      [19]  723 	ld	h,-3 (ix)
   464A 56            [ 7]  724 	ld	d,(hl)
   464B DD 6E FE      [19]  725 	ld	l,-2 (ix)
   464E DD 66 FF      [19]  726 	ld	h,-1 (ix)
   4651 46            [ 7]  727 	ld	b,(hl)
   4652 D5            [11]  728 	push	de
   4653 33            [ 6]  729 	inc	sp
   4654 C5            [11]  730 	push	bc
   4655 33            [ 6]  731 	inc	sp
   4656 21 00 C0      [10]  732 	ld	hl,#0xC000
   4659 E5            [11]  733 	push	hl
   465A CD 7E 4A      [17]  734 	call	_cpct_getScreenPtr
                            735 ;src/main.c:174: cpct_drawSolidBox(memptr, 18, 4, 16);
   465D EB            [ 4]  736 	ex	de,hl
   465E 21 04 10      [10]  737 	ld	hl,#0x1004
   4661 E5            [11]  738 	push	hl
   4662 3E 12         [ 7]  739 	ld	a,#0x12
   4664 F5            [11]  740 	push	af
   4665 33            [ 6]  741 	inc	sp
   4666 D5            [11]  742 	push	de
   4667 CD C6 49      [17]  743 	call	_cpct_drawSolidBox
   466A F1            [10]  744 	pop	af
   466B F1            [10]  745 	pop	af
   466C 33            [ 6]  746 	inc	sp
   466D C3 CC 43      [10]  747 	jp	00152$
   4670                     748 00154$:
   4670 DD F9         [10]  749 	ld	sp, ix
   4672 DD E1         [14]  750 	pop	ix
   4674 C9            [10]  751 	ret
                            752 ;src/main.c:184: void loadMap(){
                            753 ;	---------------------------------
                            754 ; Function loadMap
                            755 ; ---------------------------------
   4675                     756 _loadMap::
                            757 ;src/main.c:186: }
   4675 C9            [10]  758 	ret
                            759 ;src/main.c:191: void main(void) {
                            760 ;	---------------------------------
                            761 ; Function main
                            762 ; ---------------------------------
   4676                     763 _main::
                            764 ;src/main.c:193: init();
   4676 CD 00 42      [17]  765 	call	_init
                            766 ;src/main.c:196: while(1){
   4679                     767 00102$:
                            768 ;src/main.c:197: menu();
   4679 CD 29 42      [17]  769 	call	_menu
                            770 ;src/main.c:198: game();
   467C CD 2A 43      [17]  771 	call	_game
   467F 18 F8         [12]  772 	jr	00102$
                            773 	.area _CODE
                            774 	.area _INITIALIZER
                            775 	.area _CABS (ABS)
