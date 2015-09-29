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
