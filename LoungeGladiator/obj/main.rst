                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
<<<<<<< HEAD
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Tue Sep 29 18:54:00 2015
=======
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Sep 29 21:11:55 2015
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
<<<<<<< HEAD
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
=======
                             15 	.globl _drawMap
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
                             31 	.globl _mapa
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
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
<<<<<<< HEAD
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
=======
                             63 ;src/main.c:47: void init(){
                             64 ;	---------------------------------
                             65 ; Function init
                             66 ; ---------------------------------
   4000                      67 _init::
                             68 ;src/main.c:48: cpct_disableFirmware();
   4000 CD BB 45      [17]   69 	call	_cpct_disableFirmware
                             70 ;src/main.c:49: cpct_setVideoMode(0);
   4003 AF            [ 4]   71 	xor	a, a
   4004 F5            [11]   72 	push	af
   4005 33            [ 6]   73 	inc	sp
   4006 CD 98 45      [17]   74 	call	_cpct_setVideoMode
   4009 33            [ 6]   75 	inc	sp
                             76 ;src/main.c:50: cpct_fw2hw(g_palette,4);
   400A 11 C5 40      [10]   77 	ld	de,#_g_palette
   400D 3E 04         [ 7]   78 	ld	a,#0x04
   400F F5            [11]   79 	push	af
   4010 33            [ 6]   80 	inc	sp
   4011 D5            [11]   81 	push	de
   4012 CD 22 45      [17]   82 	call	_cpct_fw2hw
   4015 F1            [10]   83 	pop	af
   4016 33            [ 6]   84 	inc	sp
                             85 ;src/main.c:51: cpct_setPalette(g_palette,4);
   4017 11 C5 40      [10]   86 	ld	de,#_g_palette
   401A 3E 04         [ 7]   87 	ld	a,#0x04
   401C F5            [11]   88 	push	af
   401D 33            [ 6]   89 	inc	sp
   401E D5            [11]   90 	push	de
   401F CD C7 43      [17]   91 	call	_cpct_setPalette
   4022 F1            [10]   92 	pop	af
   4023 33            [ 6]   93 	inc	sp
   4024 C9            [10]   94 	ret
   4025                      95 _mapa:
   4025 01                   96 	.db #0x01	; 1
   4026 01                   97 	.db #0x01	; 1
   4027 01                   98 	.db #0x01	; 1
   4028 01                   99 	.db #0x01	; 1
   4029 00                  100 	.db #0x00	; 0
   402A 01                  101 	.db #0x01	; 1
   402B 01                  102 	.db #0x01	; 1
   402C 01                  103 	.db #0x01	; 1
   402D 00                  104 	.db #0x00	; 0
   402E 01                  105 	.db #0x01	; 1
   402F 01                  106 	.db #0x01	; 1
   4030 00                  107 	.db #0x00	; 0
   4031 01                  108 	.db #0x01	; 1
   4032 01                  109 	.db #0x01	; 1
   4033 01                  110 	.db #0x01	; 1
   4034 01                  111 	.db #0x01	; 1
   4035 01                  112 	.db #0x01	; 1
   4036 01                  113 	.db #0x01	; 1
   4037 01                  114 	.db #0x01	; 1
   4038 01                  115 	.db #0x01	; 1
   4039 00                  116 	.db #0x00	; 0
   403A 01                  117 	.db #0x01	; 1
   403B 01                  118 	.db #0x01	; 1
   403C 01                  119 	.db #0x01	; 1
   403D 00                  120 	.db #0x00	; 0
   403E 01                  121 	.db #0x01	; 1
   403F 01                  122 	.db #0x01	; 1
   4040 00                  123 	.db #0x00	; 0
   4041 00                  124 	.db #0x00	; 0
   4042 00                  125 	.db #0x00	; 0
   4043 01                  126 	.db #0x01	; 1
   4044 01                  127 	.db #0x01	; 1
   4045 01                  128 	.db #0x01	; 1
   4046 01                  129 	.db #0x01	; 1
   4047 01                  130 	.db #0x01	; 1
   4048 01                  131 	.db #0x01	; 1
   4049 00                  132 	.db #0x00	; 0
   404A 01                  133 	.db #0x01	; 1
   404B 01                  134 	.db #0x01	; 1
   404C 01                  135 	.db #0x01	; 1
   404D 00                  136 	.db #0x00	; 0
   404E 01                  137 	.db #0x01	; 1
   404F 01                  138 	.db #0x01	; 1
   4050 00                  139 	.db #0x00	; 0
   4051 01                  140 	.db #0x01	; 1
   4052 00                  141 	.db #0x00	; 0
   4053 01                  142 	.db #0x01	; 1
   4054 01                  143 	.db #0x01	; 1
   4055 01                  144 	.db #0x01	; 1
   4056 01                  145 	.db #0x01	; 1
   4057 01                  146 	.db #0x01	; 1
   4058 01                  147 	.db #0x01	; 1
   4059 00                  148 	.db #0x00	; 0
   405A 01                  149 	.db #0x01	; 1
   405B 01                  150 	.db #0x01	; 1
   405C 01                  151 	.db #0x01	; 1
   405D 00                  152 	.db #0x00	; 0
   405E 01                  153 	.db #0x01	; 1
   405F 01                  154 	.db #0x01	; 1
   4060 00                  155 	.db #0x00	; 0
   4061 01                  156 	.db #0x01	; 1
   4062 00                  157 	.db #0x00	; 0
   4063 01                  158 	.db #0x01	; 1
   4064 01                  159 	.db #0x01	; 1
   4065 01                  160 	.db #0x01	; 1
   4066 01                  161 	.db #0x01	; 1
   4067 01                  162 	.db #0x01	; 1
   4068 01                  163 	.db #0x01	; 1
   4069 00                  164 	.db #0x00	; 0
   406A 00                  165 	.db #0x00	; 0
   406B 00                  166 	.db #0x00	; 0
   406C 00                  167 	.db #0x00	; 0
   406D 00                  168 	.db #0x00	; 0
   406E 00                  169 	.db #0x00	; 0
   406F 00                  170 	.db #0x00	; 0
   4070 00                  171 	.db #0x00	; 0
   4071 01                  172 	.db #0x01	; 1
   4072 00                  173 	.db #0x00	; 0
   4073 01                  174 	.db #0x01	; 1
   4074 01                  175 	.db #0x01	; 1
   4075 01                  176 	.db #0x01	; 1
   4076 01                  177 	.db #0x01	; 1
   4077 01                  178 	.db #0x01	; 1
   4078 01                  179 	.db #0x01	; 1
   4079 00                  180 	.db #0x00	; 0
   407A 01                  181 	.db #0x01	; 1
   407B 01                  182 	.db #0x01	; 1
   407C 01                  183 	.db #0x01	; 1
   407D 00                  184 	.db #0x00	; 0
   407E 01                  185 	.db #0x01	; 1
   407F 01                  186 	.db #0x01	; 1
   4080 01                  187 	.db #0x01	; 1
   4081 01                  188 	.db #0x01	; 1
   4082 00                  189 	.db #0x00	; 0
   4083 01                  190 	.db #0x01	; 1
   4084 01                  191 	.db #0x01	; 1
   4085 01                  192 	.db #0x01	; 1
   4086 01                  193 	.db #0x01	; 1
   4087 01                  194 	.db #0x01	; 1
   4088 01                  195 	.db #0x01	; 1
   4089 00                  196 	.db #0x00	; 0
   408A 01                  197 	.db #0x01	; 1
   408B 01                  198 	.db #0x01	; 1
   408C 01                  199 	.db #0x01	; 1
   408D 00                  200 	.db #0x00	; 0
   408E 01                  201 	.db #0x01	; 1
   408F 01                  202 	.db #0x01	; 1
   4090 01                  203 	.db #0x01	; 1
   4091 01                  204 	.db #0x01	; 1
   4092 00                  205 	.db #0x00	; 0
   4093 01                  206 	.db #0x01	; 1
   4094 01                  207 	.db #0x01	; 1
   4095 01                  208 	.db #0x01	; 1
   4096 01                  209 	.db #0x01	; 1
   4097 01                  210 	.db #0x01	; 1
   4098 01                  211 	.db #0x01	; 1
   4099 00                  212 	.db #0x00	; 0
   409A 01                  213 	.db #0x01	; 1
   409B 01                  214 	.db #0x01	; 1
   409C 01                  215 	.db #0x01	; 1
   409D 00                  216 	.db #0x00	; 0
   409E 01                  217 	.db #0x01	; 1
   409F 01                  218 	.db #0x01	; 1
   40A0 01                  219 	.db #0x01	; 1
   40A1 01                  220 	.db #0x01	; 1
   40A2 00                  221 	.db #0x00	; 0
   40A3 01                  222 	.db #0x01	; 1
   40A4 01                  223 	.db #0x01	; 1
   40A5 01                  224 	.db #0x01	; 1
   40A6 01                  225 	.db #0x01	; 1
   40A7 01                  226 	.db #0x01	; 1
   40A8 01                  227 	.db #0x01	; 1
   40A9 00                  228 	.db #0x00	; 0
   40AA 01                  229 	.db #0x01	; 1
   40AB 01                  230 	.db #0x01	; 1
   40AC 01                  231 	.db #0x01	; 1
   40AD 00                  232 	.db #0x00	; 0
   40AE 00                  233 	.db #0x00	; 0
   40AF 00                  234 	.db #0x00	; 0
   40B0 00                  235 	.db #0x00	; 0
   40B1 00                  236 	.db #0x00	; 0
   40B2 00                  237 	.db #0x00	; 0
   40B3 01                  238 	.db #0x01	; 1
   40B4 01                  239 	.db #0x01	; 1
   40B5 01                  240 	.db #0x01	; 1
   40B6 01                  241 	.db #0x01	; 1
   40B7 01                  242 	.db #0x01	; 1
   40B8 01                  243 	.db #0x01	; 1
   40B9 00                  244 	.db #0x00	; 0
   40BA 01                  245 	.db #0x01	; 1
   40BB 01                  246 	.db #0x01	; 1
   40BC 01                  247 	.db #0x01	; 1
   40BD 00                  248 	.db #0x00	; 0
   40BE 01                  249 	.db #0x01	; 1
   40BF 01                  250 	.db #0x01	; 1
   40C0 01                  251 	.db #0x01	; 1
   40C1 01                  252 	.db #0x01	; 1
   40C2 01                  253 	.db #0x01	; 1
   40C3 01                  254 	.db #0x01	; 1
   40C4 01                  255 	.db #0x01	; 1
   40C5                     256 _g_palette:
   40C5 00                  257 	.db #0x00	; 0
   40C6 1A                  258 	.db #0x1A	; 26
   40C7 06                  259 	.db #0x06	; 6
   40C8 12                  260 	.db #0x12	; 18
                            261 ;src/main.c:55: void menu(){
                            262 ;	---------------------------------
                            263 ; Function menu
                            264 ; ---------------------------------
   40C9                     265 _menu::
                            266 ;src/main.c:57: cpct_clearScreen(0);
   40C9 21 00 40      [10]  267 	ld	hl,#0x4000
   40CC E5            [11]  268 	push	hl
   40CD AF            [ 4]  269 	xor	a, a
   40CE F5            [11]  270 	push	af
   40CF 33            [ 6]  271 	inc	sp
   40D0 26 C0         [ 7]  272 	ld	h, #0xC0
   40D2 E5            [11]  273 	push	hl
   40D3 CD AA 45      [17]  274 	call	_cpct_memset
                            275 ;src/main.c:59: memptr = cpct_getScreenPtr(VMEM,20,10);
   40D6 21 14 0A      [10]  276 	ld	hl,#0x0A14
   40D9 E5            [11]  277 	push	hl
   40DA 21 00 C0      [10]  278 	ld	hl,#0xC000
   40DD E5            [11]  279 	push	hl
   40DE CD 84 46      [17]  280 	call	_cpct_getScreenPtr
                            281 ;src/main.c:60: cpct_drawStringM0("MENU",memptr,2,3);
   40E1 EB            [ 4]  282 	ex	de,hl
   40E2 01 1E 41      [10]  283 	ld	bc,#___str_0+0
   40E5 21 02 03      [10]  284 	ld	hl,#0x0302
   40E8 E5            [11]  285 	push	hl
   40E9 D5            [11]  286 	push	de
   40EA C5            [11]  287 	push	bc
   40EB CD 61 44      [17]  288 	call	_cpct_drawStringM0
   40EE 21 06 00      [10]  289 	ld	hl,#6
   40F1 39            [11]  290 	add	hl,sp
   40F2 F9            [ 6]  291 	ld	sp,hl
                            292 ;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,18,180);
   40F3 21 12 B4      [10]  293 	ld	hl,#0xB412
   40F6 E5            [11]  294 	push	hl
   40F7 21 00 C0      [10]  295 	ld	hl,#0xC000
   40FA E5            [11]  296 	push	hl
   40FB CD 84 46      [17]  297 	call	_cpct_getScreenPtr
                            298 ;src/main.c:63: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   40FE EB            [ 4]  299 	ex	de,hl
   40FF 01 23 41      [10]  300 	ld	bc,#___str_1+0
   4102 21 04 05      [10]  301 	ld	hl,#0x0504
   4105 E5            [11]  302 	push	hl
   4106 D5            [11]  303 	push	de
   4107 C5            [11]  304 	push	bc
   4108 CD 61 44      [17]  305 	call	_cpct_drawStringM0
   410B 21 06 00      [10]  306 	ld	hl,#6
   410E 39            [11]  307 	add	hl,sp
   410F F9            [ 6]  308 	ld	sp,hl
                            309 ;src/main.c:65: do{
   4110                     310 00101$:
                            311 ;src/main.c:66: cpct_scanKeyboard_f();
   4110 CD F7 43      [17]  312 	call	_cpct_scanKeyboard_f
                            313 ;src/main.c:67: }while(!cpct_isKeyPressed(Key_Enter));
   4113 21 00 40      [10]  314 	ld	hl,#0x4000
   4116 CD EB 43      [17]  315 	call	_cpct_isKeyPressed
   4119 7D            [ 4]  316 	ld	a,l
   411A B7            [ 4]  317 	or	a, a
   411B 28 F3         [12]  318 	jr	Z,00101$
   411D C9            [10]  319 	ret
   411E                     320 ___str_0:
   411E 4D 45 4E 55         321 	.ascii "MENU"
   4122 00                  322 	.db 0x00
   4123                     323 ___str_1:
   4123 50 75 6C 73 61 20   324 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   412E 00                  325 	.db 0x00
                            326 ;src/main.c:73: void drawMap(){
                            327 ;	---------------------------------
                            328 ; Function drawMap
                            329 ; ---------------------------------
   412F                     330 _drawMap::
   412F DD E5         [15]  331 	push	ix
   4131 DD 21 00 00   [14]  332 	ld	ix,#0
   4135 DD 39         [15]  333 	add	ix,sp
   4137 F5            [11]  334 	push	af
   4138 F5            [11]  335 	push	af
                            336 ;src/main.c:77: for(posY=0; posY<height;posY++){
   4139 0E 00         [ 7]  337 	ld	c,#0x00
   413B 1E 00         [ 7]  338 	ld	e,#0x00
                            339 ;src/main.c:78: for(posX=0; posX<width;posX++){
   413D                     340 00112$:
   413D DD 36 FC 00   [19]  341 	ld	-4 (ix),#0x00
   4141 DD 36 FF 00   [19]  342 	ld	-1 (ix),#0x00
   4145                     343 00105$:
                            344 ;src/main.c:79: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   4145 C5            [11]  345 	push	bc
   4146 D5            [11]  346 	push	de
   4147 7B            [ 4]  347 	ld	a,e
   4148 F5            [11]  348 	push	af
   4149 33            [ 6]  349 	inc	sp
   414A DD 7E FF      [19]  350 	ld	a,-1 (ix)
   414D F5            [11]  351 	push	af
   414E 33            [ 6]  352 	inc	sp
   414F 21 00 C0      [10]  353 	ld	hl,#0xC000
   4152 E5            [11]  354 	push	hl
   4153 CD 84 46      [17]  355 	call	_cpct_getScreenPtr
   4156 D1            [10]  356 	pop	de
   4157 C1            [10]  357 	pop	bc
   4158 DD 75 FD      [19]  358 	ld	-3 (ix),l
   415B DD 74 FE      [19]  359 	ld	-2 (ix),h
                            360 ;src/main.c:80: if(mapa[posY][posX] == 1){
   415E 69            [ 4]  361 	ld	l,c
   415F 26 00         [ 7]  362 	ld	h,#0x00
   4161 29            [11]  363 	add	hl, hl
   4162 29            [11]  364 	add	hl, hl
   4163 29            [11]  365 	add	hl, hl
   4164 29            [11]  366 	add	hl, hl
   4165 3E 25         [ 7]  367 	ld	a,#<(_mapa)
   4167 85            [ 4]  368 	add	a, l
   4168 6F            [ 4]  369 	ld	l,a
   4169 3E 40         [ 7]  370 	ld	a,#>(_mapa)
   416B 8C            [ 4]  371 	adc	a, h
   416C 67            [ 4]  372 	ld	h,a
   416D 7D            [ 4]  373 	ld	a,l
   416E DD 86 FC      [19]  374 	add	a, -4 (ix)
   4171 6F            [ 4]  375 	ld	l,a
   4172 7C            [ 4]  376 	ld	a,h
   4173 CE 00         [ 7]  377 	adc	a, #0x00
   4175 67            [ 4]  378 	ld	h,a
   4176 7E            [ 7]  379 	ld	a,(hl)
   4177 3D            [ 4]  380 	dec	a
   4178 20 1A         [12]  381 	jr	NZ,00106$
                            382 ;src/main.c:81: cpct_drawSolidBox(memptr, 3, 5, 20);
   417A DD 56 FD      [19]  383 	ld	d,-3 (ix)
   417D DD 46 FE      [19]  384 	ld	b,-2 (ix)
   4180 C5            [11]  385 	push	bc
   4181 D5            [11]  386 	push	de
   4182 21 05 14      [10]  387 	ld	hl,#0x1405
   4185 E5            [11]  388 	push	hl
   4186 3E 03         [ 7]  389 	ld	a,#0x03
   4188 F5            [11]  390 	push	af
   4189 33            [ 6]  391 	inc	sp
   418A 4A            [ 4]  392 	ld	c,d
   418B C5            [11]  393 	push	bc
   418C CD CC 45      [17]  394 	call	_cpct_drawSolidBox
   418F F1            [10]  395 	pop	af
   4190 F1            [10]  396 	pop	af
   4191 33            [ 6]  397 	inc	sp
   4192 D1            [10]  398 	pop	de
   4193 C1            [10]  399 	pop	bc
   4194                     400 00106$:
                            401 ;src/main.c:78: for(posX=0; posX<width;posX++){
   4194 DD 7E FF      [19]  402 	ld	a,-1 (ix)
   4197 C6 05         [ 7]  403 	add	a, #0x05
   4199 DD 77 FF      [19]  404 	ld	-1 (ix),a
   419C DD 34 FC      [23]  405 	inc	-4 (ix)
   419F DD 7E FC      [19]  406 	ld	a,-4 (ix)
   41A2 D6 10         [ 7]  407 	sub	a, #0x10
   41A4 38 9F         [12]  408 	jr	C,00105$
                            409 ;src/main.c:77: for(posY=0; posY<height;posY++){
   41A6 7B            [ 4]  410 	ld	a,e
   41A7 C6 14         [ 7]  411 	add	a, #0x14
   41A9 5F            [ 4]  412 	ld	e,a
   41AA 0C            [ 4]  413 	inc	c
   41AB 79            [ 4]  414 	ld	a,c
   41AC D6 0A         [ 7]  415 	sub	a, #0x0A
   41AE 38 8D         [12]  416 	jr	C,00112$
   41B0 DD F9         [10]  417 	ld	sp, ix
   41B2 DD E1         [14]  418 	pop	ix
   41B4 C9            [10]  419 	ret
                            420 ;src/main.c:89: void game(){
                            421 ;	---------------------------------
                            422 ; Function game
                            423 ; ---------------------------------
   41B5                     424 _game::
   41B5 DD E5         [15]  425 	push	ix
   41B7 DD 21 00 00   [14]  426 	ld	ix,#0
   41BB DD 39         [15]  427 	add	ix,sp
   41BD 21 F8 FF      [10]  428 	ld	hl,#-8
   41C0 39            [11]  429 	add	hl,sp
   41C1 F9            [ 6]  430 	ld	sp,hl
                            431 ;src/main.c:90: TPlayer p = { 0,100 };
   41C2 21 00 00      [10]  432 	ld	hl,#0x0000
   41C5 39            [11]  433 	add	hl,sp
   41C6 36 00         [10]  434 	ld	(hl),#0x00
   41C8 21 00 00      [10]  435 	ld	hl,#0x0000
   41CB 39            [11]  436 	add	hl,sp
   41CC DD 75 FE      [19]  437 	ld	-2 (ix),l
   41CF DD 74 FF      [19]  438 	ld	-1 (ix),h
   41D2 DD 7E FE      [19]  439 	ld	a,-2 (ix)
   41D5 C6 01         [ 7]  440 	add	a, #0x01
   41D7 DD 77 FC      [19]  441 	ld	-4 (ix),a
   41DA DD 7E FF      [19]  442 	ld	a,-1 (ix)
   41DD CE 00         [ 7]  443 	adc	a, #0x00
   41DF DD 77 FD      [19]  444 	ld	-3 (ix),a
   41E2 DD 6E FC      [19]  445 	ld	l,-4 (ix)
   41E5 DD 66 FD      [19]  446 	ld	h,-3 (ix)
   41E8 36 64         [10]  447 	ld	(hl),#0x64
                            448 ;src/main.c:92: u8* sprite = gladis_quieto_dcha;
   41EA DD 36 FA C7   [19]  449 	ld	-6 (ix),#<(_gladis_quieto_dcha)
   41EE DD 36 FB 42   [19]  450 	ld	-5 (ix),#>(_gladis_quieto_dcha)
                            451 ;src/main.c:93: cpct_clearScreen(0);
   41F2 21 00 40      [10]  452 	ld	hl,#0x4000
   41F5 E5            [11]  453 	push	hl
   41F6 AF            [ 4]  454 	xor	a, a
   41F7 F5            [11]  455 	push	af
   41F8 33            [ 6]  456 	inc	sp
   41F9 26 C0         [ 7]  457 	ld	h, #0xC0
   41FB E5            [11]  458 	push	hl
   41FC CD AA 45      [17]  459 	call	_cpct_memset
                            460 ;src/main.c:94: drawMap();
   41FF CD 2F 41      [17]  461 	call	_drawMap
                            462 ;src/main.c:95: while (1){
   4202                     463 00112$:
                            464 ;src/main.c:98: cpct_waitVSYNC();
   4202 CD 90 45      [17]  465 	call	_cpct_waitVSYNC
                            466 ;src/main.c:101: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4205 DD 6E FC      [19]  467 	ld	l,-4 (ix)
   4208 DD 66 FD      [19]  468 	ld	h,-3 (ix)
   420B 46            [ 7]  469 	ld	b,(hl)
   420C DD 6E FE      [19]  470 	ld	l,-2 (ix)
   420F DD 66 FF      [19]  471 	ld	h,-1 (ix)
   4212 4E            [ 7]  472 	ld	c, (hl)
   4213 C5            [11]  473 	push	bc
   4214 21 00 C0      [10]  474 	ld	hl,#0xC000
   4217 E5            [11]  475 	push	hl
   4218 CD 84 46      [17]  476 	call	_cpct_getScreenPtr
                            477 ;src/main.c:102: cpct_drawSolidBox(memptr,0,4,16);
   421B EB            [ 4]  478 	ex	de,hl
   421C 21 04 10      [10]  479 	ld	hl,#0x1004
   421F E5            [11]  480 	push	hl
   4220 AF            [ 4]  481 	xor	a, a
   4221 F5            [11]  482 	push	af
   4222 33            [ 6]  483 	inc	sp
   4223 D5            [11]  484 	push	de
   4224 CD CC 45      [17]  485 	call	_cpct_drawSolidBox
   4227 F1            [10]  486 	pop	af
   4228 F1            [10]  487 	pop	af
   4229 33            [ 6]  488 	inc	sp
                            489 ;src/main.c:106: cpct_scanKeyboard_f();
   422A CD F7 43      [17]  490 	call	_cpct_scanKeyboard_f
                            491 ;src/main.c:107: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   422D 21 00 02      [10]  492 	ld	hl,#0x0200
   4230 CD EB 43      [17]  493 	call	_cpct_isKeyPressed
   4233 7D            [ 4]  494 	ld	a,l
   4234 B7            [ 4]  495 	or	a, a
   4235 28 1E         [12]  496 	jr	Z,00108$
   4237 DD 6E FE      [19]  497 	ld	l,-2 (ix)
   423A DD 66 FF      [19]  498 	ld	h,-1 (ix)
   423D 56            [ 7]  499 	ld	d,(hl)
   423E 7A            [ 4]  500 	ld	a,d
   423F D6 4C         [ 7]  501 	sub	a, #0x4C
   4241 30 12         [12]  502 	jr	NC,00108$
                            503 ;src/main.c:108: p.x += 1;
   4243 14            [ 4]  504 	inc	d
   4244 DD 6E FE      [19]  505 	ld	l,-2 (ix)
   4247 DD 66 FF      [19]  506 	ld	h,-1 (ix)
   424A 72            [ 7]  507 	ld	(hl),d
                            508 ;src/main.c:109: sprite = gladis_quieto_dcha;
   424B DD 36 FA C7   [19]  509 	ld	-6 (ix),#<(_gladis_quieto_dcha)
   424F DD 36 FB 42   [19]  510 	ld	-5 (ix),#>(_gladis_quieto_dcha)
   4253 18 31         [12]  511 	jr	00109$
   4255                     512 00108$:
                            513 ;src/main.c:110: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4255 21 01 01      [10]  514 	ld	hl,#0x0101
   4258 CD EB 43      [17]  515 	call	_cpct_isKeyPressed
   425B 7D            [ 4]  516 	ld	a,l
   425C B7            [ 4]  517 	or	a, a
   425D 28 1D         [12]  518 	jr	Z,00104$
   425F DD 6E FE      [19]  519 	ld	l,-2 (ix)
   4262 DD 66 FF      [19]  520 	ld	h,-1 (ix)
   4265 7E            [ 7]  521 	ld	a,(hl)
   4266 B7            [ 4]  522 	or	a, a
   4267 28 13         [12]  523 	jr	Z,00104$
                            524 ;src/main.c:111: p.x -= 1;
   4269 C6 FF         [ 7]  525 	add	a,#0xFF
   426B DD 6E FE      [19]  526 	ld	l,-2 (ix)
   426E DD 66 FF      [19]  527 	ld	h,-1 (ix)
   4271 77            [ 7]  528 	ld	(hl),a
                            529 ;src/main.c:112: sprite = gladis_quieto_izda;
   4272 DD 36 FA 47   [19]  530 	ld	-6 (ix),#<(_gladis_quieto_izda)
   4276 DD 36 FB 43   [19]  531 	ld	-5 (ix),#>(_gladis_quieto_izda)
   427A 18 0A         [12]  532 	jr	00109$
   427C                     533 00104$:
                            534 ;src/main.c:113: }else  if(cpct_isKeyPressed(Key_Esc)){
   427C 21 08 04      [10]  535 	ld	hl,#0x0408
   427F CD EB 43      [17]  536 	call	_cpct_isKeyPressed
   4282 7D            [ 4]  537 	ld	a,l
   4283 B7            [ 4]  538 	or	a, a
                            539 ;src/main.c:114: return;
   4284 20 2C         [12]  540 	jr	NZ,00114$
   4286                     541 00109$:
                            542 ;src/main.c:119: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4286 DD 6E FC      [19]  543 	ld	l,-4 (ix)
   4289 DD 66 FD      [19]  544 	ld	h,-3 (ix)
   428C 56            [ 7]  545 	ld	d,(hl)
   428D DD 6E FE      [19]  546 	ld	l,-2 (ix)
   4290 DD 66 FF      [19]  547 	ld	h,-1 (ix)
   4293 46            [ 7]  548 	ld	b,(hl)
   4294 D5            [11]  549 	push	de
   4295 33            [ 6]  550 	inc	sp
   4296 C5            [11]  551 	push	bc
   4297 33            [ 6]  552 	inc	sp
   4298 21 00 C0      [10]  553 	ld	hl,#0xC000
   429B E5            [11]  554 	push	hl
   429C CD 84 46      [17]  555 	call	_cpct_getScreenPtr
                            556 ;src/main.c:120: cpct_drawSpriteMasked(sprite,memptr,4,16);
   429F EB            [ 4]  557 	ex	de,hl
   42A0 DD 4E FA      [19]  558 	ld	c,-6 (ix)
   42A3 DD 46 FB      [19]  559 	ld	b,-5 (ix)
   42A6 21 04 10      [10]  560 	ld	hl,#0x1004
   42A9 E5            [11]  561 	push	hl
   42AA D5            [11]  562 	push	de
   42AB C5            [11]  563 	push	bc
   42AC CD 46 45      [17]  564 	call	_cpct_drawSpriteMasked
   42AF C3 02 42      [10]  565 	jp	00112$
   42B2                     566 00114$:
   42B2 DD F9         [10]  567 	ld	sp, ix
   42B4 DD E1         [14]  568 	pop	ix
   42B6 C9            [10]  569 	ret
                            570 ;src/main.c:131: void loadMap(){
                            571 ;	---------------------------------
                            572 ; Function loadMap
                            573 ; ---------------------------------
   42B7                     574 _loadMap::
                            575 ;src/main.c:133: }
   42B7 C9            [10]  576 	ret
                            577 ;src/main.c:138: void main(void) {
                            578 ;	---------------------------------
                            579 ; Function main
                            580 ; ---------------------------------
   42B8                     581 _main::
                            582 ;src/main.c:140: init();
   42B8 CD 00 40      [17]  583 	call	_init
                            584 ;src/main.c:144: while(1){
   42BB                     585 00102$:
                            586 ;src/main.c:145: menu();
   42BB CD C9 40      [17]  587 	call	_menu
                            588 ;src/main.c:147: game();
   42BE CD B5 41      [17]  589 	call	_game
   42C1 18 F8         [12]  590 	jr	00102$
                            591 	.area _CODE
                            592 	.area _INITIALIZER
                            593 	.area _CABS (ABS)
>>>>>>> e54a3f15918467d29456e86cd5164e20c7e609d8
