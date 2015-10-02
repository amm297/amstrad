                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 22 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct  2 17:01:34 2015
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
                             30 	.globl _scene
                             31 	.globl _g_palette
                             32 	.globl _mapa2
                             33 	.globl _mapa1
                             34 ;--------------------------------------------------------
                             35 ; special function registers
                             36 ;--------------------------------------------------------
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DATA
   4BCE                      41 _scene::
   4BCE                      42 	.ds 6
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _INITIALIZED
                             47 ;--------------------------------------------------------
                             48 ; absolute external ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DABS (ABS)
                             51 ;--------------------------------------------------------
                             52 ; global & static initialisations
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _GSINIT
                             56 	.area _GSFINAL
                             57 	.area _GSINIT
                             58 ;--------------------------------------------------------
                             59 ; Home
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _HOME
                             63 ;--------------------------------------------------------
                             64 ; code
                             65 ;--------------------------------------------------------
                             66 	.area _CODE
                             67 ;src/main.c:61: void init(){
                             68 ;	---------------------------------
                             69 ; Function init
                             70 ; ---------------------------------
   4200                      71 _init::
                             72 ;src/main.c:62: cpct_disableFirmware();
   4200 CD E5 4A      [17]   73 	call	_cpct_disableFirmware
                             74 ;src/main.c:63: cpct_setVideoMode(0);
   4203 AF            [ 4]   75 	xor	a, a
   4204 F5            [11]   76 	push	af
   4205 33            [ 6]   77 	inc	sp
   4206 CD C2 4A      [17]   78 	call	_cpct_setVideoMode
   4209 33            [ 6]   79 	inc	sp
                             80 ;src/main.c:64: cpct_fw2hw(g_palette,4);
   420A 11 A5 44      [10]   81 	ld	de,#_g_palette
   420D 3E 04         [ 7]   82 	ld	a,#0x04
   420F F5            [11]   83 	push	af
   4210 33            [ 6]   84 	inc	sp
   4211 D5            [11]   85 	push	de
   4212 CD 4C 4A      [17]   86 	call	_cpct_fw2hw
   4215 F1            [10]   87 	pop	af
   4216 33            [ 6]   88 	inc	sp
                             89 ;src/main.c:65: cpct_setPalette(g_palette,4);
   4217 11 A5 44      [10]   90 	ld	de,#_g_palette
   421A 3E 04         [ 7]   91 	ld	a,#0x04
   421C F5            [11]   92 	push	af
   421D 33            [ 6]   93 	inc	sp
   421E D5            [11]   94 	push	de
   421F CD F1 48      [17]   95 	call	_cpct_setPalette
   4222 F1            [10]   96 	pop	af
   4223 33            [ 6]   97 	inc	sp
   4224 C9            [10]   98 	ret
   4225                      99 _mapa1:
   4225 01 00               100 	.dw #0x0001
   4227 01 00               101 	.dw #0x0001
   4229 01 00               102 	.dw #0x0001
   422B 01 00               103 	.dw #0x0001
   422D 01 00               104 	.dw #0x0001
   422F 01 00               105 	.dw #0x0001
   4231 01 00               106 	.dw #0x0001
   4233 01 00               107 	.dw #0x0001
   4235 01 00               108 	.dw #0x0001
   4237 01 00               109 	.dw #0x0001
   4239 01 00               110 	.dw #0x0001
   423B 01 00               111 	.dw #0x0001
   423D 01 00               112 	.dw #0x0001
   423F 01 00               113 	.dw #0x0001
   4241 01 00               114 	.dw #0x0001
   4243 01 00               115 	.dw #0x0001
   4245 01 00               116 	.dw #0x0001
   4247 00 00               117 	.dw #0x0000
   4249 00 00               118 	.dw #0x0000
   424B 00 00               119 	.dw #0x0000
   424D 00 00               120 	.dw #0x0000
   424F 00 00               121 	.dw #0x0000
   4251 00 00               122 	.dw #0x0000
   4253 00 00               123 	.dw #0x0000
   4255 00 00               124 	.dw #0x0000
   4257 00 00               125 	.dw #0x0000
   4259 00 00               126 	.dw #0x0000
   425B 00 00               127 	.dw #0x0000
   425D 00 00               128 	.dw #0x0000
   425F 00 00               129 	.dw #0x0000
   4261 00 00               130 	.dw #0x0000
   4263 01 00               131 	.dw #0x0001
   4265 01 00               132 	.dw #0x0001
   4267 00 00               133 	.dw #0x0000
   4269 00 00               134 	.dw #0x0000
   426B 00 00               135 	.dw #0x0000
   426D 00 00               136 	.dw #0x0000
   426F 00 00               137 	.dw #0x0000
   4271 00 00               138 	.dw #0x0000
   4273 00 00               139 	.dw #0x0000
   4275 00 00               140 	.dw #0x0000
   4277 00 00               141 	.dw #0x0000
   4279 00 00               142 	.dw #0x0000
   427B 00 00               143 	.dw #0x0000
   427D 00 00               144 	.dw #0x0000
   427F 00 00               145 	.dw #0x0000
   4281 00 00               146 	.dw #0x0000
   4283 01 00               147 	.dw #0x0001
   4285 01 00               148 	.dw #0x0001
   4287 00 00               149 	.dw #0x0000
   4289 00 00               150 	.dw #0x0000
   428B 00 00               151 	.dw #0x0000
   428D 00 00               152 	.dw #0x0000
   428F 00 00               153 	.dw #0x0000
   4291 00 00               154 	.dw #0x0000
   4293 00 00               155 	.dw #0x0000
   4295 00 00               156 	.dw #0x0000
   4297 00 00               157 	.dw #0x0000
   4299 00 00               158 	.dw #0x0000
   429B 00 00               159 	.dw #0x0000
   429D 00 00               160 	.dw #0x0000
   429F 00 00               161 	.dw #0x0000
   42A1 00 00               162 	.dw #0x0000
   42A3 01 00               163 	.dw #0x0001
   42A5 01 00               164 	.dw #0x0001
   42A7 00 00               165 	.dw #0x0000
   42A9 00 00               166 	.dw #0x0000
   42AB 00 00               167 	.dw #0x0000
   42AD 00 00               168 	.dw #0x0000
   42AF 00 00               169 	.dw #0x0000
   42B1 00 00               170 	.dw #0x0000
   42B3 00 00               171 	.dw #0x0000
   42B5 00 00               172 	.dw #0x0000
   42B7 00 00               173 	.dw #0x0000
   42B9 00 00               174 	.dw #0x0000
   42BB 00 00               175 	.dw #0x0000
   42BD 00 00               176 	.dw #0x0000
   42BF 00 00               177 	.dw #0x0000
   42C1 00 00               178 	.dw #0x0000
   42C3 01 00               179 	.dw #0x0001
   42C5 00 00               180 	.dw #0x0000
   42C7 00 00               181 	.dw #0x0000
   42C9 00 00               182 	.dw #0x0000
   42CB 00 00               183 	.dw #0x0000
   42CD 00 00               184 	.dw #0x0000
   42CF 00 00               185 	.dw #0x0000
   42D1 00 00               186 	.dw #0x0000
   42D3 00 00               187 	.dw #0x0000
   42D5 00 00               188 	.dw #0x0000
   42D7 00 00               189 	.dw #0x0000
   42D9 00 00               190 	.dw #0x0000
   42DB 00 00               191 	.dw #0x0000
   42DD 00 00               192 	.dw #0x0000
   42DF 00 00               193 	.dw #0x0000
   42E1 00 00               194 	.dw #0x0000
   42E3 01 00               195 	.dw #0x0001
   42E5 01 00               196 	.dw #0x0001
   42E7 00 00               197 	.dw #0x0000
   42E9 00 00               198 	.dw #0x0000
   42EB 00 00               199 	.dw #0x0000
   42ED 00 00               200 	.dw #0x0000
   42EF 00 00               201 	.dw #0x0000
   42F1 00 00               202 	.dw #0x0000
   42F3 00 00               203 	.dw #0x0000
   42F5 00 00               204 	.dw #0x0000
   42F7 00 00               205 	.dw #0x0000
   42F9 00 00               206 	.dw #0x0000
   42FB 00 00               207 	.dw #0x0000
   42FD 00 00               208 	.dw #0x0000
   42FF 00 00               209 	.dw #0x0000
   4301 00 00               210 	.dw #0x0000
   4303 01 00               211 	.dw #0x0001
   4305 01 00               212 	.dw #0x0001
   4307 00 00               213 	.dw #0x0000
   4309 00 00               214 	.dw #0x0000
   430B 00 00               215 	.dw #0x0000
   430D 00 00               216 	.dw #0x0000
   430F 00 00               217 	.dw #0x0000
   4311 00 00               218 	.dw #0x0000
   4313 00 00               219 	.dw #0x0000
   4315 00 00               220 	.dw #0x0000
   4317 00 00               221 	.dw #0x0000
   4319 00 00               222 	.dw #0x0000
   431B 00 00               223 	.dw #0x0000
   431D 00 00               224 	.dw #0x0000
   431F 00 00               225 	.dw #0x0000
   4321 00 00               226 	.dw #0x0000
   4323 01 00               227 	.dw #0x0001
   4325 01 00               228 	.dw #0x0001
   4327 00 00               229 	.dw #0x0000
   4329 00 00               230 	.dw #0x0000
   432B 00 00               231 	.dw #0x0000
   432D 00 00               232 	.dw #0x0000
   432F 00 00               233 	.dw #0x0000
   4331 00 00               234 	.dw #0x0000
   4333 00 00               235 	.dw #0x0000
   4335 00 00               236 	.dw #0x0000
   4337 00 00               237 	.dw #0x0000
   4339 00 00               238 	.dw #0x0000
   433B 00 00               239 	.dw #0x0000
   433D 00 00               240 	.dw #0x0000
   433F 00 00               241 	.dw #0x0000
   4341 00 00               242 	.dw #0x0000
   4343 01 00               243 	.dw #0x0001
   4345 01 00               244 	.dw #0x0001
   4347 01 00               245 	.dw #0x0001
   4349 01 00               246 	.dw #0x0001
   434B 01 00               247 	.dw #0x0001
   434D 01 00               248 	.dw #0x0001
   434F 01 00               249 	.dw #0x0001
   4351 01 00               250 	.dw #0x0001
   4353 01 00               251 	.dw #0x0001
   4355 01 00               252 	.dw #0x0001
   4357 01 00               253 	.dw #0x0001
   4359 01 00               254 	.dw #0x0001
   435B 01 00               255 	.dw #0x0001
   435D 01 00               256 	.dw #0x0001
   435F 01 00               257 	.dw #0x0001
   4361 01 00               258 	.dw #0x0001
   4363 01 00               259 	.dw #0x0001
   4365                     260 _mapa2:
   4365 01 00               261 	.dw #0x0001
   4367 01 00               262 	.dw #0x0001
   4369 01 00               263 	.dw #0x0001
   436B 01 00               264 	.dw #0x0001
   436D 01 00               265 	.dw #0x0001
   436F 01 00               266 	.dw #0x0001
   4371 01 00               267 	.dw #0x0001
   4373 01 00               268 	.dw #0x0001
   4375 01 00               269 	.dw #0x0001
   4377 01 00               270 	.dw #0x0001
   4379 01 00               271 	.dw #0x0001
   437B 01 00               272 	.dw #0x0001
   437D 01 00               273 	.dw #0x0001
   437F 01 00               274 	.dw #0x0001
   4381 01 00               275 	.dw #0x0001
   4383 01 00               276 	.dw #0x0001
   4385 01 00               277 	.dw #0x0001
   4387 01 00               278 	.dw #0x0001
   4389 01 00               279 	.dw #0x0001
   438B 00 00               280 	.dw #0x0000
   438D 00 00               281 	.dw #0x0000
   438F 00 00               282 	.dw #0x0000
   4391 00 00               283 	.dw #0x0000
   4393 00 00               284 	.dw #0x0000
   4395 00 00               285 	.dw #0x0000
   4397 00 00               286 	.dw #0x0000
   4399 00 00               287 	.dw #0x0000
   439B 00 00               288 	.dw #0x0000
   439D 00 00               289 	.dw #0x0000
   439F 01 00               290 	.dw #0x0001
   43A1 01 00               291 	.dw #0x0001
   43A3 01 00               292 	.dw #0x0001
   43A5 01 00               293 	.dw #0x0001
   43A7 01 00               294 	.dw #0x0001
   43A9 01 00               295 	.dw #0x0001
   43AB 00 00               296 	.dw #0x0000
   43AD 00 00               297 	.dw #0x0000
   43AF 00 00               298 	.dw #0x0000
   43B1 00 00               299 	.dw #0x0000
   43B3 00 00               300 	.dw #0x0000
   43B5 00 00               301 	.dw #0x0000
   43B7 00 00               302 	.dw #0x0000
   43B9 00 00               303 	.dw #0x0000
   43BB 00 00               304 	.dw #0x0000
   43BD 00 00               305 	.dw #0x0000
   43BF 01 00               306 	.dw #0x0001
   43C1 01 00               307 	.dw #0x0001
   43C3 01 00               308 	.dw #0x0001
   43C5 01 00               309 	.dw #0x0001
   43C7 00 00               310 	.dw #0x0000
   43C9 01 00               311 	.dw #0x0001
   43CB 00 00               312 	.dw #0x0000
   43CD 00 00               313 	.dw #0x0000
   43CF 00 00               314 	.dw #0x0000
   43D1 00 00               315 	.dw #0x0000
   43D3 01 00               316 	.dw #0x0001
   43D5 01 00               317 	.dw #0x0001
   43D7 01 00               318 	.dw #0x0001
   43D9 00 00               319 	.dw #0x0000
   43DB 00 00               320 	.dw #0x0000
   43DD 00 00               321 	.dw #0x0000
   43DF 01 00               322 	.dw #0x0001
   43E1 00 00               323 	.dw #0x0000
   43E3 01 00               324 	.dw #0x0001
   43E5 01 00               325 	.dw #0x0001
   43E7 00 00               326 	.dw #0x0000
   43E9 01 00               327 	.dw #0x0001
   43EB 00 00               328 	.dw #0x0000
   43ED 00 00               329 	.dw #0x0000
   43EF 00 00               330 	.dw #0x0000
   43F1 00 00               331 	.dw #0x0000
   43F3 01 00               332 	.dw #0x0001
   43F5 01 00               333 	.dw #0x0001
   43F7 01 00               334 	.dw #0x0001
   43F9 00 00               335 	.dw #0x0000
   43FB 00 00               336 	.dw #0x0000
   43FD 00 00               337 	.dw #0x0000
   43FF 01 00               338 	.dw #0x0001
   4401 00 00               339 	.dw #0x0000
   4403 01 00               340 	.dw #0x0001
   4405 00 00               341 	.dw #0x0000
   4407 00 00               342 	.dw #0x0000
   4409 01 00               343 	.dw #0x0001
   440B 00 00               344 	.dw #0x0000
   440D 00 00               345 	.dw #0x0000
   440F 00 00               346 	.dw #0x0000
   4411 00 00               347 	.dw #0x0000
   4413 01 00               348 	.dw #0x0001
   4415 00 00               349 	.dw #0x0000
   4417 01 00               350 	.dw #0x0001
   4419 00 00               351 	.dw #0x0000
   441B 00 00               352 	.dw #0x0000
   441D 00 00               353 	.dw #0x0000
   441F 01 00               354 	.dw #0x0001
   4421 00 00               355 	.dw #0x0000
   4423 01 00               356 	.dw #0x0001
   4425 01 00               357 	.dw #0x0001
   4427 00 00               358 	.dw #0x0000
   4429 01 00               359 	.dw #0x0001
   442B 01 00               360 	.dw #0x0001
   442D 01 00               361 	.dw #0x0001
   442F 01 00               362 	.dw #0x0001
   4431 01 00               363 	.dw #0x0001
   4433 00 00               364 	.dw #0x0000
   4435 00 00               365 	.dw #0x0000
   4437 00 00               366 	.dw #0x0000
   4439 01 00               367 	.dw #0x0001
   443B 01 00               368 	.dw #0x0001
   443D 01 00               369 	.dw #0x0001
   443F 01 00               370 	.dw #0x0001
   4441 00 00               371 	.dw #0x0000
   4443 01 00               372 	.dw #0x0001
   4445 01 00               373 	.dw #0x0001
   4447 00 00               374 	.dw #0x0000
   4449 01 00               375 	.dw #0x0001
   444B 01 00               376 	.dw #0x0001
   444D 01 00               377 	.dw #0x0001
   444F 01 00               378 	.dw #0x0001
   4451 01 00               379 	.dw #0x0001
   4453 00 00               380 	.dw #0x0000
   4455 00 00               381 	.dw #0x0000
   4457 00 00               382 	.dw #0x0000
   4459 01 00               383 	.dw #0x0001
   445B 01 00               384 	.dw #0x0001
   445D 01 00               385 	.dw #0x0001
   445F 01 00               386 	.dw #0x0001
   4461 00 00               387 	.dw #0x0000
   4463 01 00               388 	.dw #0x0001
   4465 01 00               389 	.dw #0x0001
   4467 00 00               390 	.dw #0x0000
   4469 00 00               391 	.dw #0x0000
   446B 00 00               392 	.dw #0x0000
   446D 00 00               393 	.dw #0x0000
   446F 00 00               394 	.dw #0x0000
   4471 00 00               395 	.dw #0x0000
   4473 00 00               396 	.dw #0x0000
   4475 00 00               397 	.dw #0x0000
   4477 00 00               398 	.dw #0x0000
   4479 00 00               399 	.dw #0x0000
   447B 00 00               400 	.dw #0x0000
   447D 00 00               401 	.dw #0x0000
   447F 00 00               402 	.dw #0x0000
   4481 00 00               403 	.dw #0x0000
   4483 01 00               404 	.dw #0x0001
   4485 01 00               405 	.dw #0x0001
   4487 01 00               406 	.dw #0x0001
   4489 01 00               407 	.dw #0x0001
   448B 01 00               408 	.dw #0x0001
   448D 01 00               409 	.dw #0x0001
   448F 01 00               410 	.dw #0x0001
   4491 01 00               411 	.dw #0x0001
   4493 01 00               412 	.dw #0x0001
   4495 01 00               413 	.dw #0x0001
   4497 01 00               414 	.dw #0x0001
   4499 01 00               415 	.dw #0x0001
   449B 01 00               416 	.dw #0x0001
   449D 01 00               417 	.dw #0x0001
   449F 01 00               418 	.dw #0x0001
   44A1 01 00               419 	.dw #0x0001
   44A3 01 00               420 	.dw #0x0001
   44A5                     421 _g_palette:
   44A5 00                  422 	.db #0x00	; 0
   44A6 1A                  423 	.db #0x1A	; 26
   44A7 06                  424 	.db #0x06	; 6
   44A8 12                  425 	.db #0x12	; 18
                            426 ;src/main.c:69: void menu(){
                            427 ;	---------------------------------
                            428 ; Function menu
                            429 ; ---------------------------------
   44A9                     430 _menu::
                            431 ;src/main.c:71: cpct_clearScreen(0);
   44A9 21 00 40      [10]  432 	ld	hl,#0x4000
   44AC E5            [11]  433 	push	hl
   44AD AF            [ 4]  434 	xor	a, a
   44AE F5            [11]  435 	push	af
   44AF 33            [ 6]  436 	inc	sp
   44B0 26 C0         [ 7]  437 	ld	h, #0xC0
   44B2 E5            [11]  438 	push	hl
   44B3 CD D4 4A      [17]  439 	call	_cpct_memset
                            440 ;src/main.c:73: memptr = cpct_getScreenPtr(VMEM,20,10);
   44B6 21 14 0A      [10]  441 	ld	hl,#0x0A14
   44B9 E5            [11]  442 	push	hl
   44BA 21 00 C0      [10]  443 	ld	hl,#0xC000
   44BD E5            [11]  444 	push	hl
   44BE CD AE 4B      [17]  445 	call	_cpct_getScreenPtr
                            446 ;src/main.c:74: cpct_drawStringM0("MENU",memptr,2,3);
   44C1 EB            [ 4]  447 	ex	de,hl
   44C2 01 FE 44      [10]  448 	ld	bc,#___str_0+0
   44C5 21 02 03      [10]  449 	ld	hl,#0x0302
   44C8 E5            [11]  450 	push	hl
   44C9 D5            [11]  451 	push	de
   44CA C5            [11]  452 	push	bc
   44CB CD 8B 49      [17]  453 	call	_cpct_drawStringM0
   44CE 21 06 00      [10]  454 	ld	hl,#6
   44D1 39            [11]  455 	add	hl,sp
   44D2 F9            [ 6]  456 	ld	sp,hl
                            457 ;src/main.c:76: memptr = cpct_getScreenPtr(VMEM,18,180);
   44D3 21 12 B4      [10]  458 	ld	hl,#0xB412
   44D6 E5            [11]  459 	push	hl
   44D7 21 00 C0      [10]  460 	ld	hl,#0xC000
   44DA E5            [11]  461 	push	hl
   44DB CD AE 4B      [17]  462 	call	_cpct_getScreenPtr
                            463 ;src/main.c:77: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   44DE EB            [ 4]  464 	ex	de,hl
   44DF 01 03 45      [10]  465 	ld	bc,#___str_1+0
   44E2 21 04 05      [10]  466 	ld	hl,#0x0504
   44E5 E5            [11]  467 	push	hl
   44E6 D5            [11]  468 	push	de
   44E7 C5            [11]  469 	push	bc
   44E8 CD 8B 49      [17]  470 	call	_cpct_drawStringM0
   44EB 21 06 00      [10]  471 	ld	hl,#6
   44EE 39            [11]  472 	add	hl,sp
   44EF F9            [ 6]  473 	ld	sp,hl
                            474 ;src/main.c:79: do{
   44F0                     475 00101$:
                            476 ;src/main.c:80: cpct_scanKeyboard_f();
   44F0 CD 21 49      [17]  477 	call	_cpct_scanKeyboard_f
                            478 ;src/main.c:81: }while(!cpct_isKeyPressed(Key_Enter));
   44F3 21 00 40      [10]  479 	ld	hl,#0x4000
   44F6 CD 15 49      [17]  480 	call	_cpct_isKeyPressed
   44F9 7D            [ 4]  481 	ld	a,l
   44FA B7            [ 4]  482 	or	a, a
   44FB 28 F3         [12]  483 	jr	Z,00101$
   44FD C9            [10]  484 	ret
   44FE                     485 ___str_0:
   44FE 4D 45 4E 55         486 	.ascii "MENU"
   4502 00                  487 	.db 0x00
   4503                     488 ___str_1:
   4503 50 75 6C 73 61 20   489 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   450E 00                  490 	.db 0x00
                            491 ;src/main.c:87: void drawMap(int t){
                            492 ;	---------------------------------
                            493 ; Function drawMap
                            494 ; ---------------------------------
   450F                     495 _drawMap::
   450F DD E5         [15]  496 	push	ix
   4511 DD 21 00 00   [14]  497 	ld	ix,#0
   4515 DD 39         [15]  498 	add	ix,sp
   4517 21 FA FF      [10]  499 	ld	hl,#-6
   451A 39            [11]  500 	add	hl,sp
   451B F9            [ 6]  501 	ld	sp,hl
                            502 ;src/main.c:91: if(t == 1){ 
   451C DD 7E 04      [19]  503 	ld	a,4 (ix)
   451F 3D            [ 4]  504 	dec	a
   4520 20 3A         [12]  505 	jr	NZ,00103$
   4522 DD 7E 05      [19]  506 	ld	a,5 (ix)
   4525 B7            [ 4]  507 	or	a, a
   4526 20 34         [12]  508 	jr	NZ,00103$
                            509 ;src/main.c:92: for(x=0;x<height;x++){
   4528 11 00 00      [10]  510 	ld	de,#0x0000
   452B                     511 00111$:
                            512 ;src/main.c:93: scene[x] = mapa1[x];
   452B 6B            [ 4]  513 	ld	l, e
   452C 62            [ 4]  514 	ld	h, d
   452D 29            [11]  515 	add	hl, hl
   452E 3E CE         [ 7]  516 	ld	a,#<(_scene)
   4530 85            [ 4]  517 	add	a, l
   4531 DD 77 FE      [19]  518 	ld	-2 (ix),a
   4534 3E 4B         [ 7]  519 	ld	a,#>(_scene)
   4536 8C            [ 4]  520 	adc	a, h
   4537 DD 77 FF      [19]  521 	ld	-1 (ix),a
   453A 6B            [ 4]  522 	ld	l, e
   453B 62            [ 4]  523 	ld	h, d
   453C 29            [11]  524 	add	hl, hl
   453D 29            [11]  525 	add	hl, hl
   453E 29            [11]  526 	add	hl, hl
   453F 29            [11]  527 	add	hl, hl
   4540 29            [11]  528 	add	hl, hl
   4541 01 25 42      [10]  529 	ld	bc,#_mapa1
   4544 09            [11]  530 	add	hl,bc
   4545 45            [ 4]  531 	ld	b,l
   4546 4C            [ 4]  532 	ld	c,h
   4547 DD 6E FE      [19]  533 	ld	l,-2 (ix)
   454A DD 66 FF      [19]  534 	ld	h,-1 (ix)
   454D 70            [ 7]  535 	ld	(hl),b
   454E 23            [ 6]  536 	inc	hl
   454F 71            [ 7]  537 	ld	(hl),c
                            538 ;src/main.c:92: for(x=0;x<height;x++){
   4550 13            [ 6]  539 	inc	de
   4551 7B            [ 4]  540 	ld	a,e
   4552 D6 0A         [ 7]  541 	sub	a, #0x0A
   4554 7A            [ 4]  542 	ld	a,d
   4555 17            [ 4]  543 	rla
   4556 3F            [ 4]  544 	ccf
   4557 1F            [ 4]  545 	rra
   4558 DE 80         [ 7]  546 	sbc	a, #0x80
   455A 38 CF         [12]  547 	jr	C,00111$
   455C                     548 00103$:
                            549 ;src/main.c:97: if(t == 2){ 
   455C DD 7E 04      [19]  550 	ld	a,4 (ix)
   455F D6 02         [ 7]  551 	sub	a, #0x02
   4561 20 30         [12]  552 	jr	NZ,00128$
   4563 DD 7E 05      [19]  553 	ld	a,5 (ix)
   4566 B7            [ 4]  554 	or	a, a
   4567 20 2A         [12]  555 	jr	NZ,00128$
                            556 ;src/main.c:98: for(x=0;x<height;x++){
   4569 01 00 00      [10]  557 	ld	bc,#0x0000
   456C                     558 00113$:
                            559 ;src/main.c:99: scene[x] = mapa2[x];
   456C 69            [ 4]  560 	ld	l, c
   456D 60            [ 4]  561 	ld	h, b
   456E 29            [11]  562 	add	hl, hl
   456F FD 21 CE 4B   [14]  563 	ld	iy,#_scene
   4573 EB            [ 4]  564 	ex	de,hl
   4574 FD 19         [15]  565 	add	iy, de
   4576 69            [ 4]  566 	ld	l, c
   4577 60            [ 4]  567 	ld	h, b
   4578 29            [11]  568 	add	hl, hl
   4579 29            [11]  569 	add	hl, hl
   457A 29            [11]  570 	add	hl, hl
   457B 29            [11]  571 	add	hl, hl
   457C 29            [11]  572 	add	hl, hl
   457D 11 65 43      [10]  573 	ld	de,#_mapa2
   4580 19            [11]  574 	add	hl,de
   4581 FD 75 00      [19]  575 	ld	0 (iy),l
   4584 FD 74 01      [19]  576 	ld	1 (iy),h
                            577 ;src/main.c:98: for(x=0;x<height;x++){
   4587 03            [ 6]  578 	inc	bc
   4588 79            [ 4]  579 	ld	a,c
   4589 D6 0A         [ 7]  580 	sub	a, #0x0A
   458B 78            [ 4]  581 	ld	a,b
   458C 17            [ 4]  582 	rla
   458D 3F            [ 4]  583 	ccf
   458E 1F            [ 4]  584 	rra
   458F DE 80         [ 7]  585 	sbc	a, #0x80
   4591 38 D9         [12]  586 	jr	C,00113$
                            587 ;src/main.c:103: for(posY=0; posY<height;posY++){
   4593                     588 00128$:
   4593 DD 36 FC 00   [19]  589 	ld	-4 (ix),#0x00
   4597 DD 36 FD 00   [19]  590 	ld	-3 (ix),#0x00
                            591 ;src/main.c:104: for(posX=0; posX<width;posX++){
   459B                     592 00126$:
   459B C1            [10]  593 	pop	bc
   459C E1            [10]  594 	pop	hl
   459D E5            [11]  595 	push	hl
   459E C5            [11]  596 	push	bc
   459F 29            [11]  597 	add	hl, hl
   45A0 3E CE         [ 7]  598 	ld	a,#<(_scene)
   45A2 85            [ 4]  599 	add	a, l
   45A3 DD 77 FE      [19]  600 	ld	-2 (ix),a
   45A6 3E 4B         [ 7]  601 	ld	a,#>(_scene)
   45A8 8C            [ 4]  602 	adc	a, h
   45A9 DD 77 FF      [19]  603 	ld	-1 (ix),a
   45AC 11 00 00      [10]  604 	ld	de,#0x0000
   45AF                     605 00115$:
                            606 ;src/main.c:105: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   45AF DD 7E FC      [19]  607 	ld	a,-4 (ix)
   45B2 4F            [ 4]  608 	ld	c,a
   45B3 87            [ 4]  609 	add	a, a
   45B4 87            [ 4]  610 	add	a, a
   45B5 81            [ 4]  611 	add	a, c
   45B6 87            [ 4]  612 	add	a, a
   45B7 87            [ 4]  613 	add	a, a
   45B8 47            [ 4]  614 	ld	b,a
   45B9 4B            [ 4]  615 	ld	c,e
   45BA 79            [ 4]  616 	ld	a,c
   45BB 87            [ 4]  617 	add	a, a
   45BC 87            [ 4]  618 	add	a, a
   45BD 81            [ 4]  619 	add	a, c
   45BE D5            [11]  620 	push	de
   45BF C5            [11]  621 	push	bc
   45C0 33            [ 6]  622 	inc	sp
   45C1 F5            [11]  623 	push	af
   45C2 33            [ 6]  624 	inc	sp
   45C3 21 00 C0      [10]  625 	ld	hl,#0xC000
   45C6 E5            [11]  626 	push	hl
   45C7 CD AE 4B      [17]  627 	call	_cpct_getScreenPtr
   45CA D1            [10]  628 	pop	de
   45CB 33            [ 6]  629 	inc	sp
   45CC 33            [ 6]  630 	inc	sp
   45CD E5            [11]  631 	push	hl
                            632 ;src/main.c:106: if(scene[posY][posX] == 1){
   45CE DD 6E FE      [19]  633 	ld	l,-2 (ix)
   45D1 DD 66 FF      [19]  634 	ld	h,-1 (ix)
   45D4 4E            [ 7]  635 	ld	c,(hl)
   45D5 23            [ 6]  636 	inc	hl
   45D6 46            [ 7]  637 	ld	b,(hl)
   45D7 6B            [ 4]  638 	ld	l, e
   45D8 62            [ 4]  639 	ld	h, d
   45D9 29            [11]  640 	add	hl, hl
   45DA 09            [11]  641 	add	hl,bc
   45DB 46            [ 7]  642 	ld	b,(hl)
   45DC 23            [ 6]  643 	inc	hl
   45DD 66            [ 7]  644 	ld	h,(hl)
   45DE 10 17         [13]  645 	djnz	00116$
   45E0 7C            [ 4]  646 	ld	a,h
   45E1 B7            [ 4]  647 	or	a, a
   45E2 20 13         [12]  648 	jr	NZ,00116$
                            649 ;src/main.c:107: cpct_drawSolidBox(memptr, 3, 5, 20);
   45E4 C1            [10]  650 	pop	bc
   45E5 C5            [11]  651 	push	bc
   45E6 D5            [11]  652 	push	de
   45E7 21 05 14      [10]  653 	ld	hl,#0x1405
   45EA E5            [11]  654 	push	hl
   45EB 3E 03         [ 7]  655 	ld	a,#0x03
   45ED F5            [11]  656 	push	af
   45EE 33            [ 6]  657 	inc	sp
   45EF C5            [11]  658 	push	bc
   45F0 CD F6 4A      [17]  659 	call	_cpct_drawSolidBox
   45F3 F1            [10]  660 	pop	af
   45F4 F1            [10]  661 	pop	af
   45F5 33            [ 6]  662 	inc	sp
   45F6 D1            [10]  663 	pop	de
   45F7                     664 00116$:
                            665 ;src/main.c:104: for(posX=0; posX<width;posX++){
   45F7 13            [ 6]  666 	inc	de
   45F8 7B            [ 4]  667 	ld	a,e
   45F9 D6 10         [ 7]  668 	sub	a, #0x10
   45FB 7A            [ 4]  669 	ld	a,d
   45FC 17            [ 4]  670 	rla
   45FD 3F            [ 4]  671 	ccf
   45FE 1F            [ 4]  672 	rra
   45FF DE 80         [ 7]  673 	sbc	a, #0x80
   4601 38 AC         [12]  674 	jr	C,00115$
                            675 ;src/main.c:103: for(posY=0; posY<height;posY++){
   4603 DD 34 FC      [23]  676 	inc	-4 (ix)
   4606 20 03         [12]  677 	jr	NZ,00163$
   4608 DD 34 FD      [23]  678 	inc	-3 (ix)
   460B                     679 00163$:
   460B DD 7E FC      [19]  680 	ld	a,-4 (ix)
   460E D6 0A         [ 7]  681 	sub	a, #0x0A
   4610 DD 7E FD      [19]  682 	ld	a,-3 (ix)
   4613 17            [ 4]  683 	rla
   4614 3F            [ 4]  684 	ccf
   4615 1F            [ 4]  685 	rra
   4616 DE 80         [ 7]  686 	sbc	a, #0x80
   4618 DA 9B 45      [10]  687 	jp	C,00126$
   461B DD F9         [10]  688 	ld	sp, ix
   461D DD E1         [14]  689 	pop	ix
   461F C9            [10]  690 	ret
                            691 ;src/main.c:116: void game(){
                            692 ;	---------------------------------
                            693 ; Function game
                            694 ; ---------------------------------
   4620                     695 _game::
   4620 DD E5         [15]  696 	push	ix
   4622 DD 21 00 00   [14]  697 	ld	ix,#0
   4626 DD 39         [15]  698 	add	ix,sp
   4628 21 F0 FF      [10]  699 	ld	hl,#-16
   462B 39            [11]  700 	add	hl,sp
                            701 ;src/main.c:117: TPlayer p = { 0,100 };
   462C F9            [ 6]  702 	ld	sp, hl
   462D 23            [ 6]  703 	inc	hl
   462E 23            [ 6]  704 	inc	hl
   462F 36 00         [10]  705 	ld	(hl),#0x00
   4631 21 02 00      [10]  706 	ld	hl,#0x0002
   4634 39            [11]  707 	add	hl,sp
   4635 DD 75 FC      [19]  708 	ld	-4 (ix),l
   4638 DD 74 FD      [19]  709 	ld	-3 (ix),h
   463B DD 7E FC      [19]  710 	ld	a,-4 (ix)
   463E C6 01         [ 7]  711 	add	a, #0x01
   4640 DD 77 FE      [19]  712 	ld	-2 (ix),a
   4643 DD 7E FD      [19]  713 	ld	a,-3 (ix)
   4646 CE 00         [ 7]  714 	adc	a, #0x00
   4648 DD 77 FF      [19]  715 	ld	-1 (ix),a
   464B DD 6E FE      [19]  716 	ld	l,-2 (ix)
   464E DD 66 FF      [19]  717 	ld	h,-1 (ix)
   4651 36 64         [10]  718 	ld	(hl),#0x64
                            719 ;src/main.c:119: int i =1;
   4653 21 01 00      [10]  720 	ld	hl,#0x0001
   4656 E3            [19]  721 	ex	(sp), hl
                            722 ;src/main.c:120: u8* sprite = gladis_quieto_dcha;
   4657 DD 36 F6 00   [19]  723 	ld	-10 (ix),#<(_gladis_quieto_dcha)
   465B DD 36 F7 41   [19]  724 	ld	-9 (ix),#>(_gladis_quieto_dcha)
                            725 ;src/main.c:121: cpct_clearScreen(0);
   465F 21 00 40      [10]  726 	ld	hl,#0x4000
   4662 E5            [11]  727 	push	hl
   4663 AF            [ 4]  728 	xor	a, a
   4664 F5            [11]  729 	push	af
   4665 33            [ 6]  730 	inc	sp
   4666 26 C0         [ 7]  731 	ld	h, #0xC0
   4668 E5            [11]  732 	push	hl
   4669 CD D4 4A      [17]  733 	call	_cpct_memset
                            734 ;src/main.c:122: drawMap(i);
   466C 21 01 00      [10]  735 	ld	hl,#0x0001
   466F E5            [11]  736 	push	hl
   4670 CD 0F 45      [17]  737 	call	_drawMap
   4673 F1            [10]  738 	pop	af
                            739 ;src/main.c:123: while (1){
   4674                     740 00118$:
                            741 ;src/main.c:126: cpct_waitVSYNC();
   4674 CD BA 4A      [17]  742 	call	_cpct_waitVSYNC
                            743 ;src/main.c:129: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4677 DD 6E FE      [19]  744 	ld	l,-2 (ix)
   467A DD 66 FF      [19]  745 	ld	h,-1 (ix)
   467D 46            [ 7]  746 	ld	b,(hl)
   467E DD 6E FC      [19]  747 	ld	l,-4 (ix)
   4681 DD 66 FD      [19]  748 	ld	h,-3 (ix)
   4684 4E            [ 7]  749 	ld	c, (hl)
   4685 C5            [11]  750 	push	bc
   4686 21 00 C0      [10]  751 	ld	hl,#0xC000
   4689 E5            [11]  752 	push	hl
   468A CD AE 4B      [17]  753 	call	_cpct_getScreenPtr
   468D DD 74 F5      [19]  754 	ld	-11 (ix),h
   4690 DD 75 F4      [19]  755 	ld	-12 (ix), l
   4693 DD 75 FA      [19]  756 	ld	-6 (ix), l
   4696 DD 7E F5      [19]  757 	ld	a,-11 (ix)
   4699 DD 77 FB      [19]  758 	ld	-5 (ix),a
                            759 ;src/main.c:130: cpct_drawSolidBox(memptr,0,4,16);
   469C 21 04 10      [10]  760 	ld	hl,#0x1004
   469F E5            [11]  761 	push	hl
   46A0 AF            [ 4]  762 	xor	a, a
   46A1 F5            [11]  763 	push	af
   46A2 33            [ 6]  764 	inc	sp
   46A3 DD 6E FA      [19]  765 	ld	l,-6 (ix)
   46A6 DD 66 FB      [19]  766 	ld	h,-5 (ix)
   46A9 E5            [11]  767 	push	hl
   46AA CD F6 4A      [17]  768 	call	_cpct_drawSolidBox
   46AD F1            [10]  769 	pop	af
   46AE F1            [10]  770 	pop	af
   46AF 33            [ 6]  771 	inc	sp
                            772 ;src/main.c:134: cpct_scanKeyboard_f();
   46B0 CD 21 49      [17]  773 	call	_cpct_scanKeyboard_f
                            774 ;src/main.c:135: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   46B3 21 00 02      [10]  775 	ld	hl,#0x0200
   46B6 CD 15 49      [17]  776 	call	_cpct_isKeyPressed
   46B9 DD 75 FA      [19]  777 	ld	-6 (ix), l
   46BC 7D            [ 4]  778 	ld	a, l
   46BD B7            [ 4]  779 	or	a, a
   46BE 28 1E         [12]  780 	jr	Z,00114$
   46C0 DD 6E FC      [19]  781 	ld	l,-4 (ix)
   46C3 DD 66 FD      [19]  782 	ld	h,-3 (ix)
   46C6 56            [ 7]  783 	ld	d,(hl)
   46C7 7A            [ 4]  784 	ld	a,d
   46C8 D6 4C         [ 7]  785 	sub	a, #0x4C
   46CA 30 12         [12]  786 	jr	NC,00114$
                            787 ;src/main.c:136: p.x += 1;
   46CC 14            [ 4]  788 	inc	d
   46CD DD 6E FC      [19]  789 	ld	l,-4 (ix)
   46D0 DD 66 FD      [19]  790 	ld	h,-3 (ix)
   46D3 72            [ 7]  791 	ld	(hl),d
                            792 ;src/main.c:137: sprite = gladis_quieto_dcha;
   46D4 DD 36 F6 00   [19]  793 	ld	-10 (ix),#<(_gladis_quieto_dcha)
   46D8 DD 36 F7 41   [19]  794 	ld	-9 (ix),#>(_gladis_quieto_dcha)
   46DC 18 6A         [12]  795 	jr	00115$
   46DE                     796 00114$:
                            797 ;src/main.c:138: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   46DE 21 01 01      [10]  798 	ld	hl,#0x0101
   46E1 CD 15 49      [17]  799 	call	_cpct_isKeyPressed
   46E4 7D            [ 4]  800 	ld	a,l
   46E5 B7            [ 4]  801 	or	a, a
   46E6 28 1D         [12]  802 	jr	Z,00110$
   46E8 DD 6E FC      [19]  803 	ld	l,-4 (ix)
   46EB DD 66 FD      [19]  804 	ld	h,-3 (ix)
   46EE 7E            [ 7]  805 	ld	a,(hl)
   46EF B7            [ 4]  806 	or	a, a
   46F0 28 13         [12]  807 	jr	Z,00110$
                            808 ;src/main.c:139: p.x -= 1;
   46F2 C6 FF         [ 7]  809 	add	a,#0xFF
   46F4 DD 6E FC      [19]  810 	ld	l,-4 (ix)
   46F7 DD 66 FD      [19]  811 	ld	h,-3 (ix)
   46FA 77            [ 7]  812 	ld	(hl),a
                            813 ;src/main.c:140: sprite = gladis_quieto_izda;
   46FB DD 36 F6 80   [19]  814 	ld	-10 (ix),#<(_gladis_quieto_izda)
   46FF DD 36 F7 41   [19]  815 	ld	-9 (ix),#>(_gladis_quieto_izda)
   4703 18 43         [12]  816 	jr	00115$
   4705                     817 00110$:
                            818 ;src/main.c:141: }else  if(cpct_isKeyPressed(Key_Esc)){
   4705 21 08 04      [10]  819 	ld	hl,#0x0408
   4708 CD 15 49      [17]  820 	call	_cpct_isKeyPressed
   470B 7D            [ 4]  821 	ld	a,l
   470C B7            [ 4]  822 	or	a, a
                            823 ;src/main.c:142: return;
   470D C2 A0 47      [10]  824 	jp	NZ,00120$
                            825 ;src/main.c:143: }else if(cpct_isKeyPressed(Key_Space)){
   4710 21 05 80      [10]  826 	ld	hl,#0x8005
   4713 CD 15 49      [17]  827 	call	_cpct_isKeyPressed
   4716 7D            [ 4]  828 	ld	a,l
   4717 B7            [ 4]  829 	or	a, a
   4718 28 2E         [12]  830 	jr	Z,00115$
                            831 ;src/main.c:144: cpct_clearScreen(0);
   471A 21 00 40      [10]  832 	ld	hl,#0x4000
   471D E5            [11]  833 	push	hl
   471E AF            [ 4]  834 	xor	a, a
   471F F5            [11]  835 	push	af
   4720 33            [ 6]  836 	inc	sp
   4721 26 C0         [ 7]  837 	ld	h, #0xC0
   4723 E5            [11]  838 	push	hl
   4724 CD D4 4A      [17]  839 	call	_cpct_memset
                            840 ;src/main.c:145: if(i ==1 ) {i++;}
   4727 DD 7E F0      [19]  841 	ld	a,-16 (ix)
   472A 3D            [ 4]  842 	dec	a
   472B 20 10         [12]  843 	jr	NZ,00102$
   472D DD 7E F1      [19]  844 	ld	a,-15 (ix)
   4730 B7            [ 4]  845 	or	a, a
   4731 20 0A         [12]  846 	jr	NZ,00102$
   4733 DD 34 F0      [23]  847 	inc	-16 (ix)
   4736 20 09         [12]  848 	jr	NZ,00103$
   4738 DD 34 F1      [23]  849 	inc	-15 (ix)
   473B 18 04         [12]  850 	jr	00103$
   473D                     851 00102$:
                            852 ;src/main.c:146: else {i--;}
   473D E1            [10]  853 	pop	hl
   473E E5            [11]  854 	push	hl
   473F 2B            [ 6]  855 	dec	hl
   4740 E3            [19]  856 	ex	(sp), hl
   4741                     857 00103$:
                            858 ;src/main.c:147: drawMap(i);
   4741 E1            [10]  859 	pop	hl
   4742 E5            [11]  860 	push	hl
   4743 E5            [11]  861 	push	hl
   4744 CD 0F 45      [17]  862 	call	_drawMap
   4747 F1            [10]  863 	pop	af
   4748                     864 00115$:
                            865 ;src/main.c:152: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4748 DD 6E FE      [19]  866 	ld	l,-2 (ix)
   474B DD 66 FF      [19]  867 	ld	h,-1 (ix)
   474E 56            [ 7]  868 	ld	d,(hl)
   474F DD 6E FC      [19]  869 	ld	l,-4 (ix)
   4752 DD 66 FD      [19]  870 	ld	h,-3 (ix)
   4755 46            [ 7]  871 	ld	b,(hl)
   4756 D5            [11]  872 	push	de
   4757 33            [ 6]  873 	inc	sp
   4758 C5            [11]  874 	push	bc
   4759 33            [ 6]  875 	inc	sp
   475A 21 00 C0      [10]  876 	ld	hl,#0xC000
   475D E5            [11]  877 	push	hl
   475E CD AE 4B      [17]  878 	call	_cpct_getScreenPtr
   4761 DD 74 FB      [19]  879 	ld	-5 (ix),h
   4764 DD 75 FA      [19]  880 	ld	-6 (ix), l
   4767 DD 75 F4      [19]  881 	ld	-12 (ix), l
   476A DD 7E FB      [19]  882 	ld	a,-5 (ix)
   476D DD 77 F5      [19]  883 	ld	-11 (ix),a
                            884 ;src/main.c:153: cpct_drawSpriteMasked(sprite,memptr,4,16);
   4770 DD 7E F4      [19]  885 	ld	a,-12 (ix)
   4773 DD 77 FA      [19]  886 	ld	-6 (ix),a
   4776 DD 7E F5      [19]  887 	ld	a,-11 (ix)
   4779 DD 77 FB      [19]  888 	ld	-5 (ix),a
   477C DD 7E F6      [19]  889 	ld	a,-10 (ix)
   477F DD 77 F8      [19]  890 	ld	-8 (ix),a
   4782 DD 7E F7      [19]  891 	ld	a,-9 (ix)
   4785 DD 77 F9      [19]  892 	ld	-7 (ix),a
   4788 21 04 10      [10]  893 	ld	hl,#0x1004
   478B E5            [11]  894 	push	hl
   478C DD 6E FA      [19]  895 	ld	l,-6 (ix)
   478F DD 66 FB      [19]  896 	ld	h,-5 (ix)
   4792 E5            [11]  897 	push	hl
   4793 DD 6E F8      [19]  898 	ld	l,-8 (ix)
   4796 DD 66 F9      [19]  899 	ld	h,-7 (ix)
   4799 E5            [11]  900 	push	hl
   479A CD 70 4A      [17]  901 	call	_cpct_drawSpriteMasked
   479D C3 74 46      [10]  902 	jp	00118$
   47A0                     903 00120$:
   47A0 DD F9         [10]  904 	ld	sp, ix
   47A2 DD E1         [14]  905 	pop	ix
   47A4 C9            [10]  906 	ret
                            907 ;src/main.c:164: void loadMap(){
                            908 ;	---------------------------------
                            909 ; Function loadMap
                            910 ; ---------------------------------
   47A5                     911 _loadMap::
                            912 ;src/main.c:166: }
   47A5 C9            [10]  913 	ret
                            914 ;src/main.c:171: void main(void) {
                            915 ;	---------------------------------
                            916 ; Function main
                            917 ; ---------------------------------
   47A6                     918 _main::
                            919 ;src/main.c:173: init();
   47A6 CD 00 42      [17]  920 	call	_init
                            921 ;src/main.c:177: while(1){
   47A9                     922 00102$:
                            923 ;src/main.c:178: menu();
   47A9 CD A9 44      [17]  924 	call	_menu
                            925 ;src/main.c:180: game();
   47AC CD 20 46      [17]  926 	call	_game
   47AF 18 F8         [12]  927 	jr	00102$
                            928 	.area _CODE
                            929 	.area _INITIALIZER
                            930 	.area _CABS (ABS)
