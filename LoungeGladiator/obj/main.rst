                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Sep 29 15:46:34 2015
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
                             15 	.globl _menu
                             16 	.globl _init
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_setPalette
                             19 	.globl _cpct_fw2hw
                             20 	.globl _cpct_waitVSYNC
                             21 	.globl _cpct_setVideoMode
                             22 	.globl _cpct_drawStringM0
                             23 	.globl _cpct_drawSolidBox
                             24 	.globl _cpct_drawSpriteMasked
                             25 	.globl _cpct_isKeyPressed
                             26 	.globl _cpct_scanKeyboard_f
                             27 	.globl _cpct_memset
                             28 	.globl _cpct_disableFirmware
                             29 	.globl _g_palette
                             30 ;--------------------------------------------------------
                             31 ; special function registers
                             32 ;--------------------------------------------------------
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DATA
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/main.c:34: void init(){
                             62 ;	---------------------------------
                             63 ; Function init
                             64 ; ---------------------------------
   4000                      65 _init::
                             66 ;src/main.c:35: cpct_disableFirmware();
   4000 CD 98 44      [17]   67 	call	_cpct_disableFirmware
                             68 ;src/main.c:36: cpct_setVideoMode(0);
   4003 AF            [ 4]   69 	xor	a, a
   4004 F5            [11]   70 	push	af
   4005 33            [ 6]   71 	inc	sp
   4006 CD 75 44      [17]   72 	call	_cpct_setVideoMode
   4009 33            [ 6]   73 	inc	sp
                             74 ;src/main.c:37: cpct_fw2hw(g_palette,4);
   400A 11 25 40      [10]   75 	ld	de,#_g_palette
   400D 3E 04         [ 7]   76 	ld	a,#0x04
   400F F5            [11]   77 	push	af
   4010 33            [ 6]   78 	inc	sp
   4011 D5            [11]   79 	push	de
   4012 CD FF 43      [17]   80 	call	_cpct_fw2hw
   4015 F1            [10]   81 	pop	af
   4016 33            [ 6]   82 	inc	sp
                             83 ;src/main.c:38: cpct_setPalette(g_palette,4);
   4017 11 25 40      [10]   84 	ld	de,#_g_palette
   401A 3E 04         [ 7]   85 	ld	a,#0x04
   401C F5            [11]   86 	push	af
   401D 33            [ 6]   87 	inc	sp
   401E D5            [11]   88 	push	de
   401F CD A4 42      [17]   89 	call	_cpct_setPalette
   4022 F1            [10]   90 	pop	af
   4023 33            [ 6]   91 	inc	sp
   4024 C9            [10]   92 	ret
   4025                      93 _g_palette:
   4025 00                   94 	.db #0x00	; 0
   4026 1A                   95 	.db #0x1A	; 26
   4027 06                   96 	.db #0x06	; 6
   4028 12                   97 	.db #0x12	; 18
                             98 ;src/main.c:42: void menu(){
                             99 ;	---------------------------------
                            100 ; Function menu
                            101 ; ---------------------------------
   4029                     102 _menu::
                            103 ;src/main.c:44: cpct_clearScreen(0);
   4029 21 00 40      [10]  104 	ld	hl,#0x4000
   402C E5            [11]  105 	push	hl
   402D AF            [ 4]  106 	xor	a, a
   402E F5            [11]  107 	push	af
   402F 33            [ 6]  108 	inc	sp
   4030 26 C0         [ 7]  109 	ld	h, #0xC0
   4032 E5            [11]  110 	push	hl
   4033 CD 87 44      [17]  111 	call	_cpct_memset
                            112 ;src/main.c:46: memptr = cpct_getScreenPtr(VMEM,20,10);
   4036 21 14 0A      [10]  113 	ld	hl,#0x0A14
   4039 E5            [11]  114 	push	hl
   403A 21 00 C0      [10]  115 	ld	hl,#0xC000
   403D E5            [11]  116 	push	hl
   403E CD 61 45      [17]  117 	call	_cpct_getScreenPtr
                            118 ;src/main.c:47: cpct_drawStringM0("Super Menu",memptr,2,3);
   4041 EB            [ 4]  119 	ex	de,hl
   4042 01 7E 40      [10]  120 	ld	bc,#___str_0+0
   4045 21 02 03      [10]  121 	ld	hl,#0x0302
   4048 E5            [11]  122 	push	hl
   4049 D5            [11]  123 	push	de
   404A C5            [11]  124 	push	bc
   404B CD 3E 43      [17]  125 	call	_cpct_drawStringM0
   404E 21 06 00      [10]  126 	ld	hl,#6
   4051 39            [11]  127 	add	hl,sp
   4052 F9            [ 6]  128 	ld	sp,hl
                            129 ;src/main.c:49: memptr = cpct_getScreenPtr(VMEM,18,180);
   4053 21 12 B4      [10]  130 	ld	hl,#0xB412
   4056 E5            [11]  131 	push	hl
   4057 21 00 C0      [10]  132 	ld	hl,#0xC000
   405A E5            [11]  133 	push	hl
   405B CD 61 45      [17]  134 	call	_cpct_getScreenPtr
                            135 ;src/main.c:50: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   405E EB            [ 4]  136 	ex	de,hl
   405F 01 89 40      [10]  137 	ld	bc,#___str_1+0
   4062 21 04 05      [10]  138 	ld	hl,#0x0504
   4065 E5            [11]  139 	push	hl
   4066 D5            [11]  140 	push	de
   4067 C5            [11]  141 	push	bc
   4068 CD 3E 43      [17]  142 	call	_cpct_drawStringM0
   406B 21 06 00      [10]  143 	ld	hl,#6
   406E 39            [11]  144 	add	hl,sp
   406F F9            [ 6]  145 	ld	sp,hl
                            146 ;src/main.c:52: do{
   4070                     147 00101$:
                            148 ;src/main.c:53: cpct_scanKeyboard_f();
   4070 CD D4 42      [17]  149 	call	_cpct_scanKeyboard_f
                            150 ;src/main.c:54: }while(!cpct_isKeyPressed(Key_Enter));
   4073 21 00 40      [10]  151 	ld	hl,#0x4000
   4076 CD C8 42      [17]  152 	call	_cpct_isKeyPressed
   4079 7D            [ 4]  153 	ld	a,l
   407A B7            [ 4]  154 	or	a, a
   407B 28 F3         [12]  155 	jr	Z,00101$
   407D C9            [10]  156 	ret
   407E                     157 ___str_0:
   407E 53 75 70 65 72 20   158 	.ascii "Super Menu"
        4D 65 6E 75
   4088 00                  159 	.db 0x00
   4089                     160 ___str_1:
   4089 50 75 6C 73 61 20   161 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4094 00                  162 	.db 0x00
                            163 ;src/main.c:60: void game(){
                            164 ;	---------------------------------
                            165 ; Function game
                            166 ; ---------------------------------
   4095                     167 _game::
   4095 DD E5         [15]  168 	push	ix
   4097 DD 21 00 00   [14]  169 	ld	ix,#0
   409B DD 39         [15]  170 	add	ix,sp
   409D 21 F8 FF      [10]  171 	ld	hl,#-8
   40A0 39            [11]  172 	add	hl,sp
   40A1 F9            [ 6]  173 	ld	sp,hl
                            174 ;src/main.c:61: TPlayer p = { 0,100 };
   40A2 21 00 00      [10]  175 	ld	hl,#0x0000
   40A5 39            [11]  176 	add	hl,sp
   40A6 36 00         [10]  177 	ld	(hl),#0x00
   40A8 21 00 00      [10]  178 	ld	hl,#0x0000
   40AB 39            [11]  179 	add	hl,sp
   40AC DD 75 FC      [19]  180 	ld	-4 (ix),l
   40AF DD 74 FD      [19]  181 	ld	-3 (ix),h
   40B2 DD 7E FC      [19]  182 	ld	a,-4 (ix)
   40B5 C6 01         [ 7]  183 	add	a, #0x01
   40B7 DD 77 FE      [19]  184 	ld	-2 (ix),a
   40BA DD 7E FD      [19]  185 	ld	a,-3 (ix)
   40BD CE 00         [ 7]  186 	adc	a, #0x00
   40BF DD 77 FF      [19]  187 	ld	-1 (ix),a
   40C2 DD 6E FE      [19]  188 	ld	l,-2 (ix)
   40C5 DD 66 FF      [19]  189 	ld	h,-1 (ix)
   40C8 36 64         [10]  190 	ld	(hl),#0x64
                            191 ;src/main.c:63: u8* sprite = gladis_quieto_dcha;
   40CA DD 36 FA A4   [19]  192 	ld	-6 (ix),#<(_gladis_quieto_dcha)
   40CE DD 36 FB 41   [19]  193 	ld	-5 (ix),#>(_gladis_quieto_dcha)
                            194 ;src/main.c:64: cpct_clearScreen(0);
   40D2 21 00 40      [10]  195 	ld	hl,#0x4000
   40D5 E5            [11]  196 	push	hl
   40D6 AF            [ 4]  197 	xor	a, a
   40D7 F5            [11]  198 	push	af
   40D8 33            [ 6]  199 	inc	sp
   40D9 26 C0         [ 7]  200 	ld	h, #0xC0
   40DB E5            [11]  201 	push	hl
   40DC CD 87 44      [17]  202 	call	_cpct_memset
                            203 ;src/main.c:66: while (1){
   40DF                     204 00112$:
                            205 ;src/main.c:69: cpct_waitVSYNC();
   40DF CD 6D 44      [17]  206 	call	_cpct_waitVSYNC
                            207 ;src/main.c:72: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   40E2 DD 6E FE      [19]  208 	ld	l,-2 (ix)
   40E5 DD 66 FF      [19]  209 	ld	h,-1 (ix)
   40E8 46            [ 7]  210 	ld	b,(hl)
   40E9 DD 6E FC      [19]  211 	ld	l,-4 (ix)
   40EC DD 66 FD      [19]  212 	ld	h,-3 (ix)
   40EF 4E            [ 7]  213 	ld	c, (hl)
   40F0 C5            [11]  214 	push	bc
   40F1 21 00 C0      [10]  215 	ld	hl,#0xC000
   40F4 E5            [11]  216 	push	hl
   40F5 CD 61 45      [17]  217 	call	_cpct_getScreenPtr
                            218 ;src/main.c:73: cpct_drawSolidBox(memptr,0,4,16);
   40F8 EB            [ 4]  219 	ex	de,hl
   40F9 21 04 10      [10]  220 	ld	hl,#0x1004
   40FC E5            [11]  221 	push	hl
   40FD AF            [ 4]  222 	xor	a, a
   40FE F5            [11]  223 	push	af
   40FF 33            [ 6]  224 	inc	sp
   4100 D5            [11]  225 	push	de
   4101 CD A9 44      [17]  226 	call	_cpct_drawSolidBox
   4104 F1            [10]  227 	pop	af
   4105 F1            [10]  228 	pop	af
   4106 33            [ 6]  229 	inc	sp
                            230 ;src/main.c:77: cpct_scanKeyboard_f();
   4107 CD D4 42      [17]  231 	call	_cpct_scanKeyboard_f
                            232 ;src/main.c:78: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 69 ){
   410A 21 00 02      [10]  233 	ld	hl,#0x0200
   410D CD C8 42      [17]  234 	call	_cpct_isKeyPressed
   4110 7D            [ 4]  235 	ld	a,l
   4111 B7            [ 4]  236 	or	a, a
   4112 28 1E         [12]  237 	jr	Z,00108$
   4114 DD 6E FC      [19]  238 	ld	l,-4 (ix)
   4117 DD 66 FD      [19]  239 	ld	h,-3 (ix)
   411A 56            [ 7]  240 	ld	d,(hl)
   411B 7A            [ 4]  241 	ld	a,d
   411C D6 45         [ 7]  242 	sub	a, #0x45
   411E 30 12         [12]  243 	jr	NC,00108$
                            244 ;src/main.c:79: p.x += 1;
   4120 14            [ 4]  245 	inc	d
   4121 DD 6E FC      [19]  246 	ld	l,-4 (ix)
   4124 DD 66 FD      [19]  247 	ld	h,-3 (ix)
   4127 72            [ 7]  248 	ld	(hl),d
                            249 ;src/main.c:80: sprite = gladis_quieto_dcha;
   4128 DD 36 FA A4   [19]  250 	ld	-6 (ix),#<(_gladis_quieto_dcha)
   412C DD 36 FB 41   [19]  251 	ld	-5 (ix),#>(_gladis_quieto_dcha)
   4130 18 31         [12]  252 	jr	00109$
   4132                     253 00108$:
                            254 ;src/main.c:81: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   4132 21 01 01      [10]  255 	ld	hl,#0x0101
   4135 CD C8 42      [17]  256 	call	_cpct_isKeyPressed
   4138 7D            [ 4]  257 	ld	a,l
   4139 B7            [ 4]  258 	or	a, a
   413A 28 1D         [12]  259 	jr	Z,00104$
   413C DD 6E FC      [19]  260 	ld	l,-4 (ix)
   413F DD 66 FD      [19]  261 	ld	h,-3 (ix)
   4142 7E            [ 7]  262 	ld	a,(hl)
   4143 B7            [ 4]  263 	or	a, a
   4144 28 13         [12]  264 	jr	Z,00104$
                            265 ;src/main.c:82: p.x -= 1;
   4146 C6 FF         [ 7]  266 	add	a,#0xFF
   4148 DD 6E FC      [19]  267 	ld	l,-4 (ix)
   414B DD 66 FD      [19]  268 	ld	h,-3 (ix)
   414E 77            [ 7]  269 	ld	(hl),a
                            270 ;src/main.c:83: sprite = gladis_quieto_izda;
   414F DD 36 FA 24   [19]  271 	ld	-6 (ix),#<(_gladis_quieto_izda)
   4153 DD 36 FB 42   [19]  272 	ld	-5 (ix),#>(_gladis_quieto_izda)
   4157 18 0A         [12]  273 	jr	00109$
   4159                     274 00104$:
                            275 ;src/main.c:84: }else  if(cpct_isKeyPressed(Key_Esc)){
   4159 21 08 04      [10]  276 	ld	hl,#0x0408
   415C CD C8 42      [17]  277 	call	_cpct_isKeyPressed
   415F 7D            [ 4]  278 	ld	a,l
   4160 B7            [ 4]  279 	or	a, a
                            280 ;src/main.c:85: return;
   4161 20 2C         [12]  281 	jr	NZ,00114$
   4163                     282 00109$:
                            283 ;src/main.c:88: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4163 DD 6E FE      [19]  284 	ld	l,-2 (ix)
   4166 DD 66 FF      [19]  285 	ld	h,-1 (ix)
   4169 56            [ 7]  286 	ld	d,(hl)
   416A DD 6E FC      [19]  287 	ld	l,-4 (ix)
   416D DD 66 FD      [19]  288 	ld	h,-3 (ix)
   4170 46            [ 7]  289 	ld	b,(hl)
   4171 D5            [11]  290 	push	de
   4172 33            [ 6]  291 	inc	sp
   4173 C5            [11]  292 	push	bc
   4174 33            [ 6]  293 	inc	sp
   4175 21 00 C0      [10]  294 	ld	hl,#0xC000
   4178 E5            [11]  295 	push	hl
   4179 CD 61 45      [17]  296 	call	_cpct_getScreenPtr
                            297 ;src/main.c:89: cpct_drawSpriteMasked(sprite,memptr,4,16);
   417C EB            [ 4]  298 	ex	de,hl
   417D DD 4E FA      [19]  299 	ld	c,-6 (ix)
   4180 DD 46 FB      [19]  300 	ld	b,-5 (ix)
   4183 21 04 10      [10]  301 	ld	hl,#0x1004
   4186 E5            [11]  302 	push	hl
   4187 D5            [11]  303 	push	de
   4188 C5            [11]  304 	push	bc
   4189 CD 23 44      [17]  305 	call	_cpct_drawSpriteMasked
   418C C3 DF 40      [10]  306 	jp	00112$
   418F                     307 00114$:
   418F DD F9         [10]  308 	ld	sp, ix
   4191 DD E1         [14]  309 	pop	ix
   4193 C9            [10]  310 	ret
                            311 ;src/main.c:97: void loadMap(){
                            312 ;	---------------------------------
                            313 ; Function loadMap
                            314 ; ---------------------------------
   4194                     315 _loadMap::
                            316 ;src/main.c:99: }
   4194 C9            [10]  317 	ret
                            318 ;src/main.c:104: void main(void) {
                            319 ;	---------------------------------
                            320 ; Function main
                            321 ; ---------------------------------
   4195                     322 _main::
                            323 ;src/main.c:106: init();
   4195 CD 00 40      [17]  324 	call	_init
                            325 ;src/main.c:109: while(1){
   4198                     326 00102$:
                            327 ;src/main.c:110: menu();
   4198 CD 29 40      [17]  328 	call	_menu
                            329 ;src/main.c:111: game();
   419B CD 95 40      [17]  330 	call	_game
   419E 18 F8         [12]  331 	jr	00102$
                            332 	.area _CODE
                            333 	.area _INITIALIZER
                            334 	.area _CABS (ABS)
