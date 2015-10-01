                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Sep 29 21:11:55 2015
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
                             63 ;src/main.c:47: void init(){
                             64 ;	---------------------------------
                             65 ; Function init
                             66 ; ---------------------------------
   4200                      67 _init::
                             68 ;src/main.c:48: cpct_disableFirmware();
   4200 CD F7 47      [17]   69 	call	_cpct_disableFirmware
                             70 ;src/main.c:49: cpct_setVideoMode(0);
   4203 AF            [ 4]   71 	xor	a, a
   4204 F5            [11]   72 	push	af
   4205 33            [ 6]   73 	inc	sp
   4206 CD D4 47      [17]   74 	call	_cpct_setVideoMode
   4209 33            [ 6]   75 	inc	sp
                             76 ;src/main.c:50: cpct_fw2hw(g_palette,4);
   420A 11 C5 42      [10]   77 	ld	de,#_g_palette
   420D 3E 04         [ 7]   78 	ld	a,#0x04
   420F F5            [11]   79 	push	af
   4210 33            [ 6]   80 	inc	sp
   4211 D5            [11]   81 	push	de
   4212 CD 5E 47      [17]   82 	call	_cpct_fw2hw
   4215 F1            [10]   83 	pop	af
   4216 33            [ 6]   84 	inc	sp
                             85 ;src/main.c:51: cpct_setPalette(g_palette,4);
   4217 11 C5 42      [10]   86 	ld	de,#_g_palette
   421A 3E 04         [ 7]   87 	ld	a,#0x04
   421C F5            [11]   88 	push	af
   421D 33            [ 6]   89 	inc	sp
   421E D5            [11]   90 	push	de
   421F CD 03 46      [17]   91 	call	_cpct_setPalette
   4222 F1            [10]   92 	pop	af
   4223 33            [ 6]   93 	inc	sp
   4224 C9            [10]   94 	ret
   4225                      95 _mapa:
   4225 01                   96 	.db #0x01	; 1
   4226 01                   97 	.db #0x01	; 1
   4227 01                   98 	.db #0x01	; 1
   4228 01                   99 	.db #0x01	; 1
   4229 00                  100 	.db #0x00	; 0
   422A 01                  101 	.db #0x01	; 1
   422B 01                  102 	.db #0x01	; 1
   422C 01                  103 	.db #0x01	; 1
   422D 00                  104 	.db #0x00	; 0
   422E 01                  105 	.db #0x01	; 1
   422F 01                  106 	.db #0x01	; 1
   4230 00                  107 	.db #0x00	; 0
   4231 01                  108 	.db #0x01	; 1
   4232 01                  109 	.db #0x01	; 1
   4233 01                  110 	.db #0x01	; 1
   4234 01                  111 	.db #0x01	; 1
   4235 01                  112 	.db #0x01	; 1
   4236 01                  113 	.db #0x01	; 1
   4237 01                  114 	.db #0x01	; 1
   4238 01                  115 	.db #0x01	; 1
   4239 00                  116 	.db #0x00	; 0
   423A 01                  117 	.db #0x01	; 1
   423B 01                  118 	.db #0x01	; 1
   423C 01                  119 	.db #0x01	; 1
   423D 00                  120 	.db #0x00	; 0
   423E 01                  121 	.db #0x01	; 1
   423F 01                  122 	.db #0x01	; 1
   4240 00                  123 	.db #0x00	; 0
   4241 00                  124 	.db #0x00	; 0
   4242 00                  125 	.db #0x00	; 0
   4243 01                  126 	.db #0x01	; 1
   4244 01                  127 	.db #0x01	; 1
   4245 01                  128 	.db #0x01	; 1
   4246 01                  129 	.db #0x01	; 1
   4247 01                  130 	.db #0x01	; 1
   4248 01                  131 	.db #0x01	; 1
   4249 00                  132 	.db #0x00	; 0
   424A 01                  133 	.db #0x01	; 1
   424B 01                  134 	.db #0x01	; 1
   424C 01                  135 	.db #0x01	; 1
   424D 00                  136 	.db #0x00	; 0
   424E 01                  137 	.db #0x01	; 1
   424F 01                  138 	.db #0x01	; 1
   4250 00                  139 	.db #0x00	; 0
   4251 01                  140 	.db #0x01	; 1
   4252 00                  141 	.db #0x00	; 0
   4253 01                  142 	.db #0x01	; 1
   4254 01                  143 	.db #0x01	; 1
   4255 01                  144 	.db #0x01	; 1
   4256 01                  145 	.db #0x01	; 1
   4257 01                  146 	.db #0x01	; 1
   4258 01                  147 	.db #0x01	; 1
   4259 00                  148 	.db #0x00	; 0
   425A 01                  149 	.db #0x01	; 1
   425B 01                  150 	.db #0x01	; 1
   425C 01                  151 	.db #0x01	; 1
   425D 00                  152 	.db #0x00	; 0
   425E 01                  153 	.db #0x01	; 1
   425F 01                  154 	.db #0x01	; 1
   4260 00                  155 	.db #0x00	; 0
   4261 01                  156 	.db #0x01	; 1
   4262 00                  157 	.db #0x00	; 0
   4263 01                  158 	.db #0x01	; 1
   4264 01                  159 	.db #0x01	; 1
   4265 01                  160 	.db #0x01	; 1
   4266 01                  161 	.db #0x01	; 1
   4267 01                  162 	.db #0x01	; 1
   4268 01                  163 	.db #0x01	; 1
   4269 00                  164 	.db #0x00	; 0
   426A 00                  165 	.db #0x00	; 0
   426B 00                  166 	.db #0x00	; 0
   426C 00                  167 	.db #0x00	; 0
   426D 00                  168 	.db #0x00	; 0
   426E 00                  169 	.db #0x00	; 0
   426F 00                  170 	.db #0x00	; 0
   4270 00                  171 	.db #0x00	; 0
   4271 01                  172 	.db #0x01	; 1
   4272 00                  173 	.db #0x00	; 0
   4273 01                  174 	.db #0x01	; 1
   4274 01                  175 	.db #0x01	; 1
   4275 01                  176 	.db #0x01	; 1
   4276 01                  177 	.db #0x01	; 1
   4277 01                  178 	.db #0x01	; 1
   4278 01                  179 	.db #0x01	; 1
   4279 00                  180 	.db #0x00	; 0
   427A 01                  181 	.db #0x01	; 1
   427B 01                  182 	.db #0x01	; 1
   427C 01                  183 	.db #0x01	; 1
   427D 00                  184 	.db #0x00	; 0
   427E 01                  185 	.db #0x01	; 1
   427F 01                  186 	.db #0x01	; 1
   4280 01                  187 	.db #0x01	; 1
   4281 01                  188 	.db #0x01	; 1
   4282 00                  189 	.db #0x00	; 0
   4283 01                  190 	.db #0x01	; 1
   4284 01                  191 	.db #0x01	; 1
   4285 01                  192 	.db #0x01	; 1
   4286 01                  193 	.db #0x01	; 1
   4287 01                  194 	.db #0x01	; 1
   4288 01                  195 	.db #0x01	; 1
   4289 00                  196 	.db #0x00	; 0
   428A 01                  197 	.db #0x01	; 1
   428B 01                  198 	.db #0x01	; 1
   428C 01                  199 	.db #0x01	; 1
   428D 00                  200 	.db #0x00	; 0
   428E 01                  201 	.db #0x01	; 1
   428F 01                  202 	.db #0x01	; 1
   4290 01                  203 	.db #0x01	; 1
   4291 01                  204 	.db #0x01	; 1
   4292 00                  205 	.db #0x00	; 0
   4293 01                  206 	.db #0x01	; 1
   4294 01                  207 	.db #0x01	; 1
   4295 01                  208 	.db #0x01	; 1
   4296 01                  209 	.db #0x01	; 1
   4297 01                  210 	.db #0x01	; 1
   4298 01                  211 	.db #0x01	; 1
   4299 00                  212 	.db #0x00	; 0
   429A 01                  213 	.db #0x01	; 1
   429B 01                  214 	.db #0x01	; 1
   429C 01                  215 	.db #0x01	; 1
   429D 00                  216 	.db #0x00	; 0
   429E 01                  217 	.db #0x01	; 1
   429F 01                  218 	.db #0x01	; 1
   42A0 01                  219 	.db #0x01	; 1
   42A1 01                  220 	.db #0x01	; 1
   42A2 00                  221 	.db #0x00	; 0
   42A3 01                  222 	.db #0x01	; 1
   42A4 01                  223 	.db #0x01	; 1
   42A5 01                  224 	.db #0x01	; 1
   42A6 01                  225 	.db #0x01	; 1
   42A7 01                  226 	.db #0x01	; 1
   42A8 01                  227 	.db #0x01	; 1
   42A9 00                  228 	.db #0x00	; 0
   42AA 01                  229 	.db #0x01	; 1
   42AB 01                  230 	.db #0x01	; 1
   42AC 01                  231 	.db #0x01	; 1
   42AD 00                  232 	.db #0x00	; 0
   42AE 00                  233 	.db #0x00	; 0
   42AF 00                  234 	.db #0x00	; 0
   42B0 00                  235 	.db #0x00	; 0
   42B1 00                  236 	.db #0x00	; 0
   42B2 00                  237 	.db #0x00	; 0
   42B3 01                  238 	.db #0x01	; 1
   42B4 01                  239 	.db #0x01	; 1
   42B5 01                  240 	.db #0x01	; 1
   42B6 01                  241 	.db #0x01	; 1
   42B7 01                  242 	.db #0x01	; 1
   42B8 01                  243 	.db #0x01	; 1
   42B9 00                  244 	.db #0x00	; 0
   42BA 01                  245 	.db #0x01	; 1
   42BB 01                  246 	.db #0x01	; 1
   42BC 01                  247 	.db #0x01	; 1
   42BD 00                  248 	.db #0x00	; 0
   42BE 01                  249 	.db #0x01	; 1
   42BF 01                  250 	.db #0x01	; 1
   42C0 01                  251 	.db #0x01	; 1
   42C1 01                  252 	.db #0x01	; 1
   42C2 01                  253 	.db #0x01	; 1
   42C3 01                  254 	.db #0x01	; 1
   42C4 01                  255 	.db #0x01	; 1
   42C5                     256 _g_palette:
   42C5 00                  257 	.db #0x00	; 0
   42C6 1A                  258 	.db #0x1A	; 26
   42C7 06                  259 	.db #0x06	; 6
   42C8 12                  260 	.db #0x12	; 18
                            261 ;src/main.c:55: void menu(){
                            262 ;	---------------------------------
                            263 ; Function menu
                            264 ; ---------------------------------
   42C9                     265 _menu::
                            266 ;src/main.c:57: cpct_clearScreen(0);
   42C9 21 00 40      [10]  267 	ld	hl,#0x4000
   42CC E5            [11]  268 	push	hl
   42CD AF            [ 4]  269 	xor	a, a
   42CE F5            [11]  270 	push	af
   42CF 33            [ 6]  271 	inc	sp
   42D0 26 C0         [ 7]  272 	ld	h, #0xC0
   42D2 E5            [11]  273 	push	hl
   42D3 CD E6 47      [17]  274 	call	_cpct_memset
                            275 ;src/main.c:59: memptr = cpct_getScreenPtr(VMEM,20,10);
   42D6 21 14 0A      [10]  276 	ld	hl,#0x0A14
   42D9 E5            [11]  277 	push	hl
   42DA 21 00 C0      [10]  278 	ld	hl,#0xC000
   42DD E5            [11]  279 	push	hl
   42DE CD C0 48      [17]  280 	call	_cpct_getScreenPtr
                            281 ;src/main.c:60: cpct_drawStringM0("MENU",memptr,2,3);
   42E1 EB            [ 4]  282 	ex	de,hl
   42E2 01 1E 43      [10]  283 	ld	bc,#___str_0+0
   42E5 21 02 03      [10]  284 	ld	hl,#0x0302
   42E8 E5            [11]  285 	push	hl
   42E9 D5            [11]  286 	push	de
   42EA C5            [11]  287 	push	bc
   42EB CD 9D 46      [17]  288 	call	_cpct_drawStringM0
   42EE 21 06 00      [10]  289 	ld	hl,#6
   42F1 39            [11]  290 	add	hl,sp
   42F2 F9            [ 6]  291 	ld	sp,hl
                            292 ;src/main.c:62: memptr = cpct_getScreenPtr(VMEM,18,180);
   42F3 21 12 B4      [10]  293 	ld	hl,#0xB412
   42F6 E5            [11]  294 	push	hl
   42F7 21 00 C0      [10]  295 	ld	hl,#0xC000
   42FA E5            [11]  296 	push	hl
   42FB CD C0 48      [17]  297 	call	_cpct_getScreenPtr
                            298 ;src/main.c:63: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   42FE EB            [ 4]  299 	ex	de,hl
   42FF 01 23 43      [10]  300 	ld	bc,#___str_1+0
   4302 21 04 05      [10]  301 	ld	hl,#0x0504
   4305 E5            [11]  302 	push	hl
   4306 D5            [11]  303 	push	de
   4307 C5            [11]  304 	push	bc
   4308 CD 9D 46      [17]  305 	call	_cpct_drawStringM0
   430B 21 06 00      [10]  306 	ld	hl,#6
   430E 39            [11]  307 	add	hl,sp
   430F F9            [ 6]  308 	ld	sp,hl
                            309 ;src/main.c:65: do{
   4310                     310 00101$:
                            311 ;src/main.c:66: cpct_scanKeyboard_f();
   4310 CD 33 46      [17]  312 	call	_cpct_scanKeyboard_f
                            313 ;src/main.c:67: }while(!cpct_isKeyPressed(Key_Enter));
   4313 21 00 40      [10]  314 	ld	hl,#0x4000
   4316 CD 27 46      [17]  315 	call	_cpct_isKeyPressed
   4319 7D            [ 4]  316 	ld	a,l
   431A B7            [ 4]  317 	or	a, a
   431B 28 F3         [12]  318 	jr	Z,00101$
   431D C9            [10]  319 	ret
   431E                     320 ___str_0:
   431E 4D 45 4E 55         321 	.ascii "MENU"
   4322 00                  322 	.db 0x00
   4323                     323 ___str_1:
   4323 50 75 6C 73 61 20   324 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   432E 00                  325 	.db 0x00
                            326 ;src/main.c:73: void drawMap(){
                            327 ;	---------------------------------
                            328 ; Function drawMap
                            329 ; ---------------------------------
   432F                     330 _drawMap::
   432F DD E5         [15]  331 	push	ix
   4331 DD 21 00 00   [14]  332 	ld	ix,#0
   4335 DD 39         [15]  333 	add	ix,sp
   4337 F5            [11]  334 	push	af
   4338 F5            [11]  335 	push	af
                            336 ;src/main.c:77: for(posY=0; posY<height;posY++){
   4339 0E 00         [ 7]  337 	ld	c,#0x00
   433B 1E 00         [ 7]  338 	ld	e,#0x00
                            339 ;src/main.c:78: for(posX=0; posX<width;posX++){
   433D                     340 00112$:
   433D DD 36 FC 00   [19]  341 	ld	-4 (ix),#0x00
   4341 DD 36 FF 00   [19]  342 	ld	-1 (ix),#0x00
   4345                     343 00105$:
                            344 ;src/main.c:79: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   4345 C5            [11]  345 	push	bc
   4346 D5            [11]  346 	push	de
   4347 7B            [ 4]  347 	ld	a,e
   4348 F5            [11]  348 	push	af
   4349 33            [ 6]  349 	inc	sp
   434A DD 7E FF      [19]  350 	ld	a,-1 (ix)
   434D F5            [11]  351 	push	af
   434E 33            [ 6]  352 	inc	sp
   434F 21 00 C0      [10]  353 	ld	hl,#0xC000
   4352 E5            [11]  354 	push	hl
   4353 CD C0 48      [17]  355 	call	_cpct_getScreenPtr
   4356 D1            [10]  356 	pop	de
   4357 C1            [10]  357 	pop	bc
   4358 DD 75 FD      [19]  358 	ld	-3 (ix),l
   435B DD 74 FE      [19]  359 	ld	-2 (ix),h
                            360 ;src/main.c:80: if(mapa[posY][posX] == 1){
   435E 69            [ 4]  361 	ld	l,c
   435F 26 00         [ 7]  362 	ld	h,#0x00
   4361 29            [11]  363 	add	hl, hl
   4362 29            [11]  364 	add	hl, hl
   4363 29            [11]  365 	add	hl, hl
   4364 29            [11]  366 	add	hl, hl
   4365 3E 25         [ 7]  367 	ld	a,#<(_mapa)
   4367 85            [ 4]  368 	add	a, l
   4368 6F            [ 4]  369 	ld	l,a
   4369 3E 42         [ 7]  370 	ld	a,#>(_mapa)
   436B 8C            [ 4]  371 	adc	a, h
   436C 67            [ 4]  372 	ld	h,a
   436D 7D            [ 4]  373 	ld	a,l
   436E DD 86 FC      [19]  374 	add	a, -4 (ix)
   4371 6F            [ 4]  375 	ld	l,a
   4372 7C            [ 4]  376 	ld	a,h
   4373 CE 00         [ 7]  377 	adc	a, #0x00
   4375 67            [ 4]  378 	ld	h,a
   4376 7E            [ 7]  379 	ld	a,(hl)
   4377 3D            [ 4]  380 	dec	a
   4378 20 1A         [12]  381 	jr	NZ,00106$
                            382 ;src/main.c:81: cpct_drawSolidBox(memptr, 3, 5, 20);
   437A DD 56 FD      [19]  383 	ld	d,-3 (ix)
   437D DD 46 FE      [19]  384 	ld	b,-2 (ix)
   4380 C5            [11]  385 	push	bc
   4381 D5            [11]  386 	push	de
   4382 21 05 14      [10]  387 	ld	hl,#0x1405
   4385 E5            [11]  388 	push	hl
   4386 3E 03         [ 7]  389 	ld	a,#0x03
   4388 F5            [11]  390 	push	af
   4389 33            [ 6]  391 	inc	sp
   438A 4A            [ 4]  392 	ld	c,d
   438B C5            [11]  393 	push	bc
   438C CD 08 48      [17]  394 	call	_cpct_drawSolidBox
   438F F1            [10]  395 	pop	af
   4390 F1            [10]  396 	pop	af
   4391 33            [ 6]  397 	inc	sp
   4392 D1            [10]  398 	pop	de
   4393 C1            [10]  399 	pop	bc
   4394                     400 00106$:
                            401 ;src/main.c:78: for(posX=0; posX<width;posX++){
   4394 DD 7E FF      [19]  402 	ld	a,-1 (ix)
   4397 C6 05         [ 7]  403 	add	a, #0x05
   4399 DD 77 FF      [19]  404 	ld	-1 (ix),a
   439C DD 34 FC      [23]  405 	inc	-4 (ix)
   439F DD 7E FC      [19]  406 	ld	a,-4 (ix)
   43A2 D6 10         [ 7]  407 	sub	a, #0x10
   43A4 38 9F         [12]  408 	jr	C,00105$
                            409 ;src/main.c:77: for(posY=0; posY<height;posY++){
   43A6 7B            [ 4]  410 	ld	a,e
   43A7 C6 14         [ 7]  411 	add	a, #0x14
   43A9 5F            [ 4]  412 	ld	e,a
   43AA 0C            [ 4]  413 	inc	c
   43AB 79            [ 4]  414 	ld	a,c
   43AC D6 0A         [ 7]  415 	sub	a, #0x0A
   43AE 38 8D         [12]  416 	jr	C,00112$
   43B0 DD F9         [10]  417 	ld	sp, ix
   43B2 DD E1         [14]  418 	pop	ix
   43B4 C9            [10]  419 	ret
                            420 ;src/main.c:89: void game(){
                            421 ;	---------------------------------
                            422 ; Function game
                            423 ; ---------------------------------
   43B5                     424 _game::
   43B5 DD E5         [15]  425 	push	ix
   43B7 DD 21 00 00   [14]  426 	ld	ix,#0
   43BB DD 39         [15]  427 	add	ix,sp
   43BD 21 F8 FF      [10]  428 	ld	hl,#-8
   43C0 39            [11]  429 	add	hl,sp
   43C1 F9            [ 6]  430 	ld	sp,hl
                            431 ;src/main.c:90: TPlayer p = { 0,100 };
   43C2 21 00 00      [10]  432 	ld	hl,#0x0000
   43C5 39            [11]  433 	add	hl,sp
   43C6 36 00         [10]  434 	ld	(hl),#0x00
   43C8 21 00 00      [10]  435 	ld	hl,#0x0000
   43CB 39            [11]  436 	add	hl,sp
   43CC DD 75 FE      [19]  437 	ld	-2 (ix),l
   43CF DD 74 FF      [19]  438 	ld	-1 (ix),h
   43D2 DD 7E FE      [19]  439 	ld	a,-2 (ix)
   43D5 C6 01         [ 7]  440 	add	a, #0x01
   43D7 DD 77 FC      [19]  441 	ld	-4 (ix),a
   43DA DD 7E FF      [19]  442 	ld	a,-1 (ix)
   43DD CE 00         [ 7]  443 	adc	a, #0x00
   43DF DD 77 FD      [19]  444 	ld	-3 (ix),a
   43E2 DD 6E FC      [19]  445 	ld	l,-4 (ix)
   43E5 DD 66 FD      [19]  446 	ld	h,-3 (ix)
   43E8 36 64         [10]  447 	ld	(hl),#0x64
                            448 ;src/main.c:92: u8* sprite = gladis_quieto_dcha;
   43EA DD 36 FA 00   [19]  449 	ld	-6 (ix),#<(_gladis_quieto_dcha)
   43EE DD 36 FB 41   [19]  450 	ld	-5 (ix),#>(_gladis_quieto_dcha)
                            451 ;src/main.c:93: cpct_clearScreen(0);
   43F2 21 00 40      [10]  452 	ld	hl,#0x4000
   43F5 E5            [11]  453 	push	hl
   43F6 AF            [ 4]  454 	xor	a, a
   43F7 F5            [11]  455 	push	af
   43F8 33            [ 6]  456 	inc	sp
   43F9 26 C0         [ 7]  457 	ld	h, #0xC0
   43FB E5            [11]  458 	push	hl
   43FC CD E6 47      [17]  459 	call	_cpct_memset
                            460 ;src/main.c:94: drawMap();
   43FF CD 2F 43      [17]  461 	call	_drawMap
                            462 ;src/main.c:95: while (1){
   4402                     463 00112$:
                            464 ;src/main.c:98: cpct_waitVSYNC();
   4402 CD CC 47      [17]  465 	call	_cpct_waitVSYNC
                            466 ;src/main.c:101: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4405 DD 6E FC      [19]  467 	ld	l,-4 (ix)
   4408 DD 66 FD      [19]  468 	ld	h,-3 (ix)
   440B 46            [ 7]  469 	ld	b,(hl)
   440C DD 6E FE      [19]  470 	ld	l,-2 (ix)
   440F DD 66 FF      [19]  471 	ld	h,-1 (ix)
   4412 4E            [ 7]  472 	ld	c, (hl)
   4413 C5            [11]  473 	push	bc
   4414 21 00 C0      [10]  474 	ld	hl,#0xC000
   4417 E5            [11]  475 	push	hl
   4418 CD C0 48      [17]  476 	call	_cpct_getScreenPtr
                            477 ;src/main.c:102: cpct_drawSolidBox(memptr,0,4,16);
   441B EB            [ 4]  478 	ex	de,hl
   441C 21 04 10      [10]  479 	ld	hl,#0x1004
   441F E5            [11]  480 	push	hl
   4420 AF            [ 4]  481 	xor	a, a
   4421 F5            [11]  482 	push	af
   4422 33            [ 6]  483 	inc	sp
   4423 D5            [11]  484 	push	de
   4424 CD 08 48      [17]  485 	call	_cpct_drawSolidBox
   4427 F1            [10]  486 	pop	af
   4428 F1            [10]  487 	pop	af
   4429 33            [ 6]  488 	inc	sp
                            489 ;src/main.c:106: cpct_scanKeyboard_f();
   442A CD 33 46      [17]  490 	call	_cpct_scanKeyboard_f
                            491 ;src/main.c:107: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   442D 21 00 02      [10]  492 	ld	hl,#0x0200
   4430 CD 27 46      [17]  493 	call	_cpct_isKeyPressed
   4433 7D            [ 4]  494 	ld	a,l
   4434 B7            [ 4]  495 	or	a, a
   4435 28 1E         [12]  496 	jr	Z,00108$
   4437 DD 6E FE      [19]  497 	ld	l,-2 (ix)
   443A DD 66 FF      [19]  498 	ld	h,-1 (ix)
   443D 56            [ 7]  499 	ld	d,(hl)
   443E 7A            [ 4]  500 	ld	a,d
   443F D6 4C         [ 7]  501 	sub	a, #0x4C
   4441 30 12         [12]  502 	jr	NC,00108$
                            503 ;src/main.c:108: p.x += 1;
   4443 14            [ 4]  504 	inc	d
   4444 DD 6E FE      [19]  505 	ld	l,-2 (ix)
   4447 DD 66 FF      [19]  506 	ld	h,-1 (ix)
   444A 72            [ 7]  507 	ld	(hl),d
                            508 ;src/main.c:109: sprite = gladis_quieto_dcha;
   444B DD 36 FA 00   [19]  509 	ld	-6 (ix),#<(_gladis_quieto_dcha)
   444F DD 36 FB 41   [19]  510 	ld	-5 (ix),#>(_gladis_quieto_dcha)
   4453 18 31         [12]  511 	jr	00109$
   4455                     512 00108$:
                            513 ;src/main.c:110: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4455 21 01 01      [10]  514 	ld	hl,#0x0101
   4458 CD 27 46      [17]  515 	call	_cpct_isKeyPressed
   445B 7D            [ 4]  516 	ld	a,l
   445C B7            [ 4]  517 	or	a, a
   445D 28 1D         [12]  518 	jr	Z,00104$
   445F DD 6E FE      [19]  519 	ld	l,-2 (ix)
   4462 DD 66 FF      [19]  520 	ld	h,-1 (ix)
   4465 7E            [ 7]  521 	ld	a,(hl)
   4466 B7            [ 4]  522 	or	a, a
   4467 28 13         [12]  523 	jr	Z,00104$
                            524 ;src/main.c:111: p.x -= 1;
   4469 C6 FF         [ 7]  525 	add	a,#0xFF
   446B DD 6E FE      [19]  526 	ld	l,-2 (ix)
   446E DD 66 FF      [19]  527 	ld	h,-1 (ix)
   4471 77            [ 7]  528 	ld	(hl),a
                            529 ;src/main.c:112: sprite = gladis_quieto_izda;
   4472 DD 36 FA 80   [19]  530 	ld	-6 (ix),#<(_gladis_quieto_izda)
   4476 DD 36 FB 41   [19]  531 	ld	-5 (ix),#>(_gladis_quieto_izda)
   447A 18 0A         [12]  532 	jr	00109$
   447C                     533 00104$:
                            534 ;src/main.c:113: }else  if(cpct_isKeyPressed(Key_Esc)){
   447C 21 08 04      [10]  535 	ld	hl,#0x0408
   447F CD 27 46      [17]  536 	call	_cpct_isKeyPressed
   4482 7D            [ 4]  537 	ld	a,l
   4483 B7            [ 4]  538 	or	a, a
                            539 ;src/main.c:114: return;
   4484 20 2C         [12]  540 	jr	NZ,00114$
   4486                     541 00109$:
                            542 ;src/main.c:119: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4486 DD 6E FC      [19]  543 	ld	l,-4 (ix)
   4489 DD 66 FD      [19]  544 	ld	h,-3 (ix)
   448C 56            [ 7]  545 	ld	d,(hl)
   448D DD 6E FE      [19]  546 	ld	l,-2 (ix)
   4490 DD 66 FF      [19]  547 	ld	h,-1 (ix)
   4493 46            [ 7]  548 	ld	b,(hl)
   4494 D5            [11]  549 	push	de
   4495 33            [ 6]  550 	inc	sp
   4496 C5            [11]  551 	push	bc
   4497 33            [ 6]  552 	inc	sp
   4498 21 00 C0      [10]  553 	ld	hl,#0xC000
   449B E5            [11]  554 	push	hl
   449C CD C0 48      [17]  555 	call	_cpct_getScreenPtr
                            556 ;src/main.c:120: cpct_drawSpriteMasked(sprite,memptr,4,16);
   449F EB            [ 4]  557 	ex	de,hl
   44A0 DD 4E FA      [19]  558 	ld	c,-6 (ix)
   44A3 DD 46 FB      [19]  559 	ld	b,-5 (ix)
   44A6 21 04 10      [10]  560 	ld	hl,#0x1004
   44A9 E5            [11]  561 	push	hl
   44AA D5            [11]  562 	push	de
   44AB C5            [11]  563 	push	bc
   44AC CD 82 47      [17]  564 	call	_cpct_drawSpriteMasked
   44AF C3 02 44      [10]  565 	jp	00112$
   44B2                     566 00114$:
   44B2 DD F9         [10]  567 	ld	sp, ix
   44B4 DD E1         [14]  568 	pop	ix
   44B6 C9            [10]  569 	ret
                            570 ;src/main.c:131: void loadMap(){
                            571 ;	---------------------------------
                            572 ; Function loadMap
                            573 ; ---------------------------------
   44B7                     574 _loadMap::
                            575 ;src/main.c:133: }
   44B7 C9            [10]  576 	ret
                            577 ;src/main.c:138: void main(void) {
                            578 ;	---------------------------------
                            579 ; Function main
                            580 ; ---------------------------------
   44B8                     581 _main::
                            582 ;src/main.c:140: init();
   44B8 CD 00 42      [17]  583 	call	_init
                            584 ;src/main.c:144: while(1){
   44BB                     585 00102$:
                            586 ;src/main.c:145: menu();
   44BB CD C9 42      [17]  587 	call	_menu
                            588 ;src/main.c:147: game();
   44BE CD B5 43      [17]  589 	call	_game
   44C1 18 F8         [12]  590 	jr	00102$
                            591 	.area _CODE
                            592 	.area _INITIALIZER
                            593 	.area _CABS (ABS)
