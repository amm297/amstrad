                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Sun Oct  4 11:56:43 2015
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
                             15 	.globl _checkKeyboard
                             16 	.globl _checkColisions
                             17 	.globl _drawMap
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
                             32 	.globl _scene
                             33 	.globl _mapa2
                             34 	.globl _mapa1
                             35 	.globl _g_palette
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   4EDE                      43 _scene::
   4EDE                      44 	.ds 20
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/main.c:26: void init(){
                             70 ;	---------------------------------
                             71 ; Function init
                             72 ; ---------------------------------
   4200                      73 _init::
                             74 ;src/main.c:27: cpct_disableFirmware();
   4200 CD AD 4D      [17]   75 	call	_cpct_disableFirmware
                             76 ;src/main.c:28: cpct_setVideoMode(0);
   4203 AF            [ 4]   77 	xor	a, a
   4204 F5            [11]   78 	push	af
   4205 33            [ 6]   79 	inc	sp
   4206 CD 8A 4D      [17]   80 	call	_cpct_setVideoMode
   4209 33            [ 6]   81 	inc	sp
                             82 ;src/main.c:29: cpct_fw2hw(g_palette,4);
   420A 11 25 42      [10]   83 	ld	de,#_g_palette
   420D 3E 04         [ 7]   84 	ld	a,#0x04
   420F F5            [11]   85 	push	af
   4210 33            [ 6]   86 	inc	sp
   4211 D5            [11]   87 	push	de
   4212 CD 14 4D      [17]   88 	call	_cpct_fw2hw
   4215 F1            [10]   89 	pop	af
   4216 33            [ 6]   90 	inc	sp
                             91 ;src/main.c:30: cpct_setPalette(g_palette,4);
   4217 11 25 42      [10]   92 	ld	de,#_g_palette
   421A 3E 04         [ 7]   93 	ld	a,#0x04
   421C F5            [11]   94 	push	af
   421D 33            [ 6]   95 	inc	sp
   421E D5            [11]   96 	push	de
   421F CD 78 4B      [17]   97 	call	_cpct_setPalette
   4222 F1            [10]   98 	pop	af
   4223 33            [ 6]   99 	inc	sp
   4224 C9            [10]  100 	ret
   4225                     101 _g_palette:
   4225 00                  102 	.db #0x00	; 0
   4226 1A                  103 	.db #0x1A	; 26
   4227 06                  104 	.db #0x06	; 6
   4228 12                  105 	.db #0x12	; 18
   4229                     106 _mapa1:
   4229 01 00               107 	.dw #0x0001
   422B 01 00               108 	.dw #0x0001
   422D 01 00               109 	.dw #0x0001
   422F 01 00               110 	.dw #0x0001
   4231 01 00               111 	.dw #0x0001
   4233 01 00               112 	.dw #0x0001
   4235 01 00               113 	.dw #0x0001
   4237 01 00               114 	.dw #0x0001
   4239 01 00               115 	.dw #0x0001
   423B 01 00               116 	.dw #0x0001
   423D 01 00               117 	.dw #0x0001
   423F 01 00               118 	.dw #0x0001
   4241 01 00               119 	.dw #0x0001
   4243 01 00               120 	.dw #0x0001
   4245 01 00               121 	.dw #0x0001
   4247 01 00               122 	.dw #0x0001
   4249 01 00               123 	.dw #0x0001
   424B 00 00               124 	.dw #0x0000
   424D 00 00               125 	.dw #0x0000
   424F 00 00               126 	.dw #0x0000
   4251 00 00               127 	.dw #0x0000
   4253 00 00               128 	.dw #0x0000
   4255 00 00               129 	.dw #0x0000
   4257 00 00               130 	.dw #0x0000
   4259 00 00               131 	.dw #0x0000
   425B 00 00               132 	.dw #0x0000
   425D 00 00               133 	.dw #0x0000
   425F 00 00               134 	.dw #0x0000
   4261 00 00               135 	.dw #0x0000
   4263 00 00               136 	.dw #0x0000
   4265 00 00               137 	.dw #0x0000
   4267 01 00               138 	.dw #0x0001
   4269 01 00               139 	.dw #0x0001
   426B 00 00               140 	.dw #0x0000
   426D 00 00               141 	.dw #0x0000
   426F 00 00               142 	.dw #0x0000
   4271 00 00               143 	.dw #0x0000
   4273 00 00               144 	.dw #0x0000
   4275 00 00               145 	.dw #0x0000
   4277 00 00               146 	.dw #0x0000
   4279 00 00               147 	.dw #0x0000
   427B 00 00               148 	.dw #0x0000
   427D 00 00               149 	.dw #0x0000
   427F 00 00               150 	.dw #0x0000
   4281 00 00               151 	.dw #0x0000
   4283 00 00               152 	.dw #0x0000
   4285 00 00               153 	.dw #0x0000
   4287 01 00               154 	.dw #0x0001
   4289 01 00               155 	.dw #0x0001
   428B 00 00               156 	.dw #0x0000
   428D 00 00               157 	.dw #0x0000
   428F 00 00               158 	.dw #0x0000
   4291 00 00               159 	.dw #0x0000
   4293 00 00               160 	.dw #0x0000
   4295 00 00               161 	.dw #0x0000
   4297 00 00               162 	.dw #0x0000
   4299 00 00               163 	.dw #0x0000
   429B 00 00               164 	.dw #0x0000
   429D 00 00               165 	.dw #0x0000
   429F 00 00               166 	.dw #0x0000
   42A1 00 00               167 	.dw #0x0000
   42A3 00 00               168 	.dw #0x0000
   42A5 00 00               169 	.dw #0x0000
   42A7 01 00               170 	.dw #0x0001
   42A9 01 00               171 	.dw #0x0001
   42AB 00 00               172 	.dw #0x0000
   42AD 00 00               173 	.dw #0x0000
   42AF 00 00               174 	.dw #0x0000
   42B1 00 00               175 	.dw #0x0000
   42B3 00 00               176 	.dw #0x0000
   42B5 00 00               177 	.dw #0x0000
   42B7 00 00               178 	.dw #0x0000
   42B9 00 00               179 	.dw #0x0000
   42BB 00 00               180 	.dw #0x0000
   42BD 00 00               181 	.dw #0x0000
   42BF 00 00               182 	.dw #0x0000
   42C1 00 00               183 	.dw #0x0000
   42C3 00 00               184 	.dw #0x0000
   42C5 00 00               185 	.dw #0x0000
   42C7 01 00               186 	.dw #0x0001
   42C9 00 00               187 	.dw #0x0000
   42CB 00 00               188 	.dw #0x0000
   42CD 00 00               189 	.dw #0x0000
   42CF 00 00               190 	.dw #0x0000
   42D1 00 00               191 	.dw #0x0000
   42D3 00 00               192 	.dw #0x0000
   42D5 00 00               193 	.dw #0x0000
   42D7 00 00               194 	.dw #0x0000
   42D9 00 00               195 	.dw #0x0000
   42DB 00 00               196 	.dw #0x0000
   42DD 00 00               197 	.dw #0x0000
   42DF 00 00               198 	.dw #0x0000
   42E1 00 00               199 	.dw #0x0000
   42E3 00 00               200 	.dw #0x0000
   42E5 00 00               201 	.dw #0x0000
   42E7 01 00               202 	.dw #0x0001
   42E9 01 00               203 	.dw #0x0001
   42EB 00 00               204 	.dw #0x0000
   42ED 00 00               205 	.dw #0x0000
   42EF 00 00               206 	.dw #0x0000
   42F1 00 00               207 	.dw #0x0000
   42F3 00 00               208 	.dw #0x0000
   42F5 00 00               209 	.dw #0x0000
   42F7 00 00               210 	.dw #0x0000
   42F9 00 00               211 	.dw #0x0000
   42FB 00 00               212 	.dw #0x0000
   42FD 00 00               213 	.dw #0x0000
   42FF 00 00               214 	.dw #0x0000
   4301 00 00               215 	.dw #0x0000
   4303 00 00               216 	.dw #0x0000
   4305 00 00               217 	.dw #0x0000
   4307 01 00               218 	.dw #0x0001
   4309 01 00               219 	.dw #0x0001
   430B 00 00               220 	.dw #0x0000
   430D 00 00               221 	.dw #0x0000
   430F 00 00               222 	.dw #0x0000
   4311 00 00               223 	.dw #0x0000
   4313 00 00               224 	.dw #0x0000
   4315 00 00               225 	.dw #0x0000
   4317 00 00               226 	.dw #0x0000
   4319 00 00               227 	.dw #0x0000
   431B 00 00               228 	.dw #0x0000
   431D 00 00               229 	.dw #0x0000
   431F 00 00               230 	.dw #0x0000
   4321 00 00               231 	.dw #0x0000
   4323 00 00               232 	.dw #0x0000
   4325 00 00               233 	.dw #0x0000
   4327 01 00               234 	.dw #0x0001
   4329 01 00               235 	.dw #0x0001
   432B 00 00               236 	.dw #0x0000
   432D 00 00               237 	.dw #0x0000
   432F 00 00               238 	.dw #0x0000
   4331 00 00               239 	.dw #0x0000
   4333 00 00               240 	.dw #0x0000
   4335 00 00               241 	.dw #0x0000
   4337 00 00               242 	.dw #0x0000
   4339 00 00               243 	.dw #0x0000
   433B 00 00               244 	.dw #0x0000
   433D 00 00               245 	.dw #0x0000
   433F 00 00               246 	.dw #0x0000
   4341 00 00               247 	.dw #0x0000
   4343 00 00               248 	.dw #0x0000
   4345 00 00               249 	.dw #0x0000
   4347 01 00               250 	.dw #0x0001
   4349 01 00               251 	.dw #0x0001
   434B 01 00               252 	.dw #0x0001
   434D 01 00               253 	.dw #0x0001
   434F 01 00               254 	.dw #0x0001
   4351 01 00               255 	.dw #0x0001
   4353 01 00               256 	.dw #0x0001
   4355 01 00               257 	.dw #0x0001
   4357 01 00               258 	.dw #0x0001
   4359 01 00               259 	.dw #0x0001
   435B 01 00               260 	.dw #0x0001
   435D 01 00               261 	.dw #0x0001
   435F 01 00               262 	.dw #0x0001
   4361 01 00               263 	.dw #0x0001
   4363 01 00               264 	.dw #0x0001
   4365 01 00               265 	.dw #0x0001
   4367 01 00               266 	.dw #0x0001
   4369                     267 _mapa2:
   4369 01 00               268 	.dw #0x0001
   436B 01 00               269 	.dw #0x0001
   436D 01 00               270 	.dw #0x0001
   436F 01 00               271 	.dw #0x0001
   4371 01 00               272 	.dw #0x0001
   4373 01 00               273 	.dw #0x0001
   4375 01 00               274 	.dw #0x0001
   4377 01 00               275 	.dw #0x0001
   4379 01 00               276 	.dw #0x0001
   437B 01 00               277 	.dw #0x0001
   437D 01 00               278 	.dw #0x0001
   437F 01 00               279 	.dw #0x0001
   4381 01 00               280 	.dw #0x0001
   4383 01 00               281 	.dw #0x0001
   4385 01 00               282 	.dw #0x0001
   4387 01 00               283 	.dw #0x0001
   4389 01 00               284 	.dw #0x0001
   438B 01 00               285 	.dw #0x0001
   438D 01 00               286 	.dw #0x0001
   438F 00 00               287 	.dw #0x0000
   4391 00 00               288 	.dw #0x0000
   4393 00 00               289 	.dw #0x0000
   4395 00 00               290 	.dw #0x0000
   4397 00 00               291 	.dw #0x0000
   4399 00 00               292 	.dw #0x0000
   439B 00 00               293 	.dw #0x0000
   439D 00 00               294 	.dw #0x0000
   439F 00 00               295 	.dw #0x0000
   43A1 00 00               296 	.dw #0x0000
   43A3 01 00               297 	.dw #0x0001
   43A5 01 00               298 	.dw #0x0001
   43A7 01 00               299 	.dw #0x0001
   43A9 01 00               300 	.dw #0x0001
   43AB 01 00               301 	.dw #0x0001
   43AD 01 00               302 	.dw #0x0001
   43AF 00 00               303 	.dw #0x0000
   43B1 00 00               304 	.dw #0x0000
   43B3 00 00               305 	.dw #0x0000
   43B5 00 00               306 	.dw #0x0000
   43B7 00 00               307 	.dw #0x0000
   43B9 00 00               308 	.dw #0x0000
   43BB 00 00               309 	.dw #0x0000
   43BD 00 00               310 	.dw #0x0000
   43BF 00 00               311 	.dw #0x0000
   43C1 00 00               312 	.dw #0x0000
   43C3 01 00               313 	.dw #0x0001
   43C5 01 00               314 	.dw #0x0001
   43C7 01 00               315 	.dw #0x0001
   43C9 01 00               316 	.dw #0x0001
   43CB 00 00               317 	.dw #0x0000
   43CD 01 00               318 	.dw #0x0001
   43CF 00 00               319 	.dw #0x0000
   43D1 00 00               320 	.dw #0x0000
   43D3 00 00               321 	.dw #0x0000
   43D5 00 00               322 	.dw #0x0000
   43D7 01 00               323 	.dw #0x0001
   43D9 01 00               324 	.dw #0x0001
   43DB 01 00               325 	.dw #0x0001
   43DD 00 00               326 	.dw #0x0000
   43DF 00 00               327 	.dw #0x0000
   43E1 00 00               328 	.dw #0x0000
   43E3 01 00               329 	.dw #0x0001
   43E5 00 00               330 	.dw #0x0000
   43E7 01 00               331 	.dw #0x0001
   43E9 01 00               332 	.dw #0x0001
   43EB 00 00               333 	.dw #0x0000
   43ED 01 00               334 	.dw #0x0001
   43EF 00 00               335 	.dw #0x0000
   43F1 00 00               336 	.dw #0x0000
   43F3 00 00               337 	.dw #0x0000
   43F5 00 00               338 	.dw #0x0000
   43F7 01 00               339 	.dw #0x0001
   43F9 01 00               340 	.dw #0x0001
   43FB 01 00               341 	.dw #0x0001
   43FD 00 00               342 	.dw #0x0000
   43FF 00 00               343 	.dw #0x0000
   4401 00 00               344 	.dw #0x0000
   4403 01 00               345 	.dw #0x0001
   4405 00 00               346 	.dw #0x0000
   4407 01 00               347 	.dw #0x0001
   4409 00 00               348 	.dw #0x0000
   440B 00 00               349 	.dw #0x0000
   440D 01 00               350 	.dw #0x0001
   440F 00 00               351 	.dw #0x0000
   4411 00 00               352 	.dw #0x0000
   4413 00 00               353 	.dw #0x0000
   4415 00 00               354 	.dw #0x0000
   4417 01 00               355 	.dw #0x0001
   4419 00 00               356 	.dw #0x0000
   441B 01 00               357 	.dw #0x0001
   441D 00 00               358 	.dw #0x0000
   441F 00 00               359 	.dw #0x0000
   4421 00 00               360 	.dw #0x0000
   4423 01 00               361 	.dw #0x0001
   4425 00 00               362 	.dw #0x0000
   4427 01 00               363 	.dw #0x0001
   4429 01 00               364 	.dw #0x0001
   442B 00 00               365 	.dw #0x0000
   442D 01 00               366 	.dw #0x0001
   442F 01 00               367 	.dw #0x0001
   4431 01 00               368 	.dw #0x0001
   4433 01 00               369 	.dw #0x0001
   4435 01 00               370 	.dw #0x0001
   4437 00 00               371 	.dw #0x0000
   4439 00 00               372 	.dw #0x0000
   443B 00 00               373 	.dw #0x0000
   443D 01 00               374 	.dw #0x0001
   443F 01 00               375 	.dw #0x0001
   4441 01 00               376 	.dw #0x0001
   4443 01 00               377 	.dw #0x0001
   4445 00 00               378 	.dw #0x0000
   4447 01 00               379 	.dw #0x0001
   4449 01 00               380 	.dw #0x0001
   444B 00 00               381 	.dw #0x0000
   444D 01 00               382 	.dw #0x0001
   444F 01 00               383 	.dw #0x0001
   4451 01 00               384 	.dw #0x0001
   4453 01 00               385 	.dw #0x0001
   4455 01 00               386 	.dw #0x0001
   4457 00 00               387 	.dw #0x0000
   4459 00 00               388 	.dw #0x0000
   445B 00 00               389 	.dw #0x0000
   445D 01 00               390 	.dw #0x0001
   445F 01 00               391 	.dw #0x0001
   4461 01 00               392 	.dw #0x0001
   4463 01 00               393 	.dw #0x0001
   4465 00 00               394 	.dw #0x0000
   4467 01 00               395 	.dw #0x0001
   4469 01 00               396 	.dw #0x0001
   446B 00 00               397 	.dw #0x0000
   446D 00 00               398 	.dw #0x0000
   446F 00 00               399 	.dw #0x0000
   4471 00 00               400 	.dw #0x0000
   4473 00 00               401 	.dw #0x0000
   4475 00 00               402 	.dw #0x0000
   4477 00 00               403 	.dw #0x0000
   4479 00 00               404 	.dw #0x0000
   447B 00 00               405 	.dw #0x0000
   447D 00 00               406 	.dw #0x0000
   447F 00 00               407 	.dw #0x0000
   4481 00 00               408 	.dw #0x0000
   4483 00 00               409 	.dw #0x0000
   4485 00 00               410 	.dw #0x0000
   4487 01 00               411 	.dw #0x0001
   4489 01 00               412 	.dw #0x0001
   448B 01 00               413 	.dw #0x0001
   448D 01 00               414 	.dw #0x0001
   448F 01 00               415 	.dw #0x0001
   4491 01 00               416 	.dw #0x0001
   4493 01 00               417 	.dw #0x0001
   4495 01 00               418 	.dw #0x0001
   4497 01 00               419 	.dw #0x0001
   4499 01 00               420 	.dw #0x0001
   449B 01 00               421 	.dw #0x0001
   449D 01 00               422 	.dw #0x0001
   449F 01 00               423 	.dw #0x0001
   44A1 01 00               424 	.dw #0x0001
   44A3 01 00               425 	.dw #0x0001
   44A5 01 00               426 	.dw #0x0001
   44A7 01 00               427 	.dw #0x0001
                            428 ;src/main.c:34: void menu(){
                            429 ;	---------------------------------
                            430 ; Function menu
                            431 ; ---------------------------------
   44A9                     432 _menu::
                            433 ;src/main.c:36: cpct_clearScreen(0);
   44A9 21 00 40      [10]  434 	ld	hl,#0x4000
   44AC E5            [11]  435 	push	hl
   44AD AF            [ 4]  436 	xor	a, a
   44AE F5            [11]  437 	push	af
   44AF 33            [ 6]  438 	inc	sp
   44B0 26 C0         [ 7]  439 	ld	h, #0xC0
   44B2 E5            [11]  440 	push	hl
   44B3 CD 9C 4D      [17]  441 	call	_cpct_memset
                            442 ;src/main.c:38: memptr = cpct_getScreenPtr(VMEM,20,10);
   44B6 21 14 0A      [10]  443 	ld	hl,#0x0A14
   44B9 E5            [11]  444 	push	hl
   44BA 21 00 C0      [10]  445 	ld	hl,#0xC000
   44BD E5            [11]  446 	push	hl
   44BE CD 76 4E      [17]  447 	call	_cpct_getScreenPtr
                            448 ;src/main.c:39: cpct_drawStringM0("MENU",memptr,2,3);
   44C1 EB            [ 4]  449 	ex	de,hl
   44C2 01 FE 44      [10]  450 	ld	bc,#___str_0+0
   44C5 21 02 03      [10]  451 	ld	hl,#0x0302
   44C8 E5            [11]  452 	push	hl
   44C9 D5            [11]  453 	push	de
   44CA C5            [11]  454 	push	bc
   44CB CD 12 4C      [17]  455 	call	_cpct_drawStringM0
   44CE 21 06 00      [10]  456 	ld	hl,#6
   44D1 39            [11]  457 	add	hl,sp
   44D2 F9            [ 6]  458 	ld	sp,hl
                            459 ;src/main.c:41: memptr = cpct_getScreenPtr(VMEM,18,180);
   44D3 21 12 B4      [10]  460 	ld	hl,#0xB412
   44D6 E5            [11]  461 	push	hl
   44D7 21 00 C0      [10]  462 	ld	hl,#0xC000
   44DA E5            [11]  463 	push	hl
   44DB CD 76 4E      [17]  464 	call	_cpct_getScreenPtr
                            465 ;src/main.c:42: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   44DE EB            [ 4]  466 	ex	de,hl
   44DF 01 03 45      [10]  467 	ld	bc,#___str_1+0
   44E2 21 04 05      [10]  468 	ld	hl,#0x0504
   44E5 E5            [11]  469 	push	hl
   44E6 D5            [11]  470 	push	de
   44E7 C5            [11]  471 	push	bc
   44E8 CD 12 4C      [17]  472 	call	_cpct_drawStringM0
   44EB 21 06 00      [10]  473 	ld	hl,#6
   44EE 39            [11]  474 	add	hl,sp
   44EF F9            [ 6]  475 	ld	sp,hl
                            476 ;src/main.c:44: do{
   44F0                     477 00101$:
                            478 ;src/main.c:45: cpct_scanKeyboard_f();
   44F0 CD A8 4B      [17]  479 	call	_cpct_scanKeyboard_f
                            480 ;src/main.c:46: }while(!cpct_isKeyPressed(Key_Enter));
   44F3 21 00 40      [10]  481 	ld	hl,#0x4000
   44F6 CD 9C 4B      [17]  482 	call	_cpct_isKeyPressed
   44F9 7D            [ 4]  483 	ld	a,l
   44FA B7            [ 4]  484 	or	a, a
   44FB 28 F3         [12]  485 	jr	Z,00101$
   44FD C9            [10]  486 	ret
   44FE                     487 ___str_0:
   44FE 4D 45 4E 55         488 	.ascii "MENU"
   4502 00                  489 	.db 0x00
   4503                     490 ___str_1:
   4503 50 75 6C 73 61 20   491 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   450E 00                  492 	.db 0x00
                            493 ;src/main.c:52: void drawMap(int t){
                            494 ;	---------------------------------
                            495 ; Function drawMap
                            496 ; ---------------------------------
   450F                     497 _drawMap::
   450F DD E5         [15]  498 	push	ix
   4511 DD 21 00 00   [14]  499 	ld	ix,#0
   4515 DD 39         [15]  500 	add	ix,sp
   4517 21 FA FF      [10]  501 	ld	hl,#-6
   451A 39            [11]  502 	add	hl,sp
   451B F9            [ 6]  503 	ld	sp,hl
                            504 ;src/main.c:56: if(t == 1){ 
   451C DD 7E 04      [19]  505 	ld	a,4 (ix)
   451F 3D            [ 4]  506 	dec	a
   4520 20 3A         [12]  507 	jr	NZ,00103$
   4522 DD 7E 05      [19]  508 	ld	a,5 (ix)
   4525 B7            [ 4]  509 	or	a, a
   4526 20 34         [12]  510 	jr	NZ,00103$
                            511 ;src/main.c:57: for(x=0;x<height;x++){
   4528 11 00 00      [10]  512 	ld	de,#0x0000
   452B                     513 00111$:
                            514 ;src/main.c:58: scene[x] = mapa1[x];
   452B 6B            [ 4]  515 	ld	l, e
   452C 62            [ 4]  516 	ld	h, d
   452D 29            [11]  517 	add	hl, hl
   452E 3E DE         [ 7]  518 	ld	a,#<(_scene)
   4530 85            [ 4]  519 	add	a, l
   4531 DD 77 FE      [19]  520 	ld	-2 (ix),a
   4534 3E 4E         [ 7]  521 	ld	a,#>(_scene)
   4536 8C            [ 4]  522 	adc	a, h
   4537 DD 77 FF      [19]  523 	ld	-1 (ix),a
   453A 6B            [ 4]  524 	ld	l, e
   453B 62            [ 4]  525 	ld	h, d
   453C 29            [11]  526 	add	hl, hl
   453D 29            [11]  527 	add	hl, hl
   453E 29            [11]  528 	add	hl, hl
   453F 29            [11]  529 	add	hl, hl
   4540 29            [11]  530 	add	hl, hl
   4541 01 29 42      [10]  531 	ld	bc,#_mapa1
   4544 09            [11]  532 	add	hl,bc
   4545 45            [ 4]  533 	ld	b,l
   4546 4C            [ 4]  534 	ld	c,h
   4547 DD 6E FE      [19]  535 	ld	l,-2 (ix)
   454A DD 66 FF      [19]  536 	ld	h,-1 (ix)
   454D 70            [ 7]  537 	ld	(hl),b
   454E 23            [ 6]  538 	inc	hl
   454F 71            [ 7]  539 	ld	(hl),c
                            540 ;src/main.c:57: for(x=0;x<height;x++){
   4550 13            [ 6]  541 	inc	de
   4551 7B            [ 4]  542 	ld	a,e
   4552 D6 0A         [ 7]  543 	sub	a, #0x0A
   4554 7A            [ 4]  544 	ld	a,d
   4555 17            [ 4]  545 	rla
   4556 3F            [ 4]  546 	ccf
   4557 1F            [ 4]  547 	rra
   4558 DE 80         [ 7]  548 	sbc	a, #0x80
   455A 38 CF         [12]  549 	jr	C,00111$
   455C                     550 00103$:
                            551 ;src/main.c:62: if(t == 2){ 
   455C DD 7E 04      [19]  552 	ld	a,4 (ix)
   455F D6 02         [ 7]  553 	sub	a, #0x02
   4561 20 30         [12]  554 	jr	NZ,00128$
   4563 DD 7E 05      [19]  555 	ld	a,5 (ix)
   4566 B7            [ 4]  556 	or	a, a
   4567 20 2A         [12]  557 	jr	NZ,00128$
                            558 ;src/main.c:63: for(x=0;x<height;x++){
   4569 01 00 00      [10]  559 	ld	bc,#0x0000
   456C                     560 00113$:
                            561 ;src/main.c:64: scene[x] = mapa2[x];
   456C 69            [ 4]  562 	ld	l, c
   456D 60            [ 4]  563 	ld	h, b
   456E 29            [11]  564 	add	hl, hl
   456F FD 21 DE 4E   [14]  565 	ld	iy,#_scene
   4573 EB            [ 4]  566 	ex	de,hl
   4574 FD 19         [15]  567 	add	iy, de
   4576 69            [ 4]  568 	ld	l, c
   4577 60            [ 4]  569 	ld	h, b
   4578 29            [11]  570 	add	hl, hl
   4579 29            [11]  571 	add	hl, hl
   457A 29            [11]  572 	add	hl, hl
   457B 29            [11]  573 	add	hl, hl
   457C 29            [11]  574 	add	hl, hl
   457D 11 69 43      [10]  575 	ld	de,#_mapa2
   4580 19            [11]  576 	add	hl,de
   4581 FD 75 00      [19]  577 	ld	0 (iy),l
   4584 FD 74 01      [19]  578 	ld	1 (iy),h
                            579 ;src/main.c:63: for(x=0;x<height;x++){
   4587 03            [ 6]  580 	inc	bc
   4588 79            [ 4]  581 	ld	a,c
   4589 D6 0A         [ 7]  582 	sub	a, #0x0A
   458B 78            [ 4]  583 	ld	a,b
   458C 17            [ 4]  584 	rla
   458D 3F            [ 4]  585 	ccf
   458E 1F            [ 4]  586 	rra
   458F DE 80         [ 7]  587 	sbc	a, #0x80
   4591 38 D9         [12]  588 	jr	C,00113$
                            589 ;src/main.c:68: for(posY=0; posY<height;posY++){
   4593                     590 00128$:
   4593 DD 36 FC 00   [19]  591 	ld	-4 (ix),#0x00
   4597 DD 36 FD 00   [19]  592 	ld	-3 (ix),#0x00
                            593 ;src/main.c:69: for(posX=0; posX<width;posX++){
   459B                     594 00126$:
   459B C1            [10]  595 	pop	bc
   459C E1            [10]  596 	pop	hl
   459D E5            [11]  597 	push	hl
   459E C5            [11]  598 	push	bc
   459F 29            [11]  599 	add	hl, hl
   45A0 3E DE         [ 7]  600 	ld	a,#<(_scene)
   45A2 85            [ 4]  601 	add	a, l
   45A3 DD 77 FE      [19]  602 	ld	-2 (ix),a
   45A6 3E 4E         [ 7]  603 	ld	a,#>(_scene)
   45A8 8C            [ 4]  604 	adc	a, h
   45A9 DD 77 FF      [19]  605 	ld	-1 (ix),a
   45AC 11 00 00      [10]  606 	ld	de,#0x0000
   45AF                     607 00115$:
                            608 ;src/main.c:70: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   45AF DD 7E FC      [19]  609 	ld	a,-4 (ix)
   45B2 4F            [ 4]  610 	ld	c,a
   45B3 87            [ 4]  611 	add	a, a
   45B4 87            [ 4]  612 	add	a, a
   45B5 81            [ 4]  613 	add	a, c
   45B6 87            [ 4]  614 	add	a, a
   45B7 87            [ 4]  615 	add	a, a
   45B8 47            [ 4]  616 	ld	b,a
   45B9 4B            [ 4]  617 	ld	c,e
   45BA 79            [ 4]  618 	ld	a,c
   45BB 87            [ 4]  619 	add	a, a
   45BC 87            [ 4]  620 	add	a, a
   45BD 81            [ 4]  621 	add	a, c
   45BE D5            [11]  622 	push	de
   45BF C5            [11]  623 	push	bc
   45C0 33            [ 6]  624 	inc	sp
   45C1 F5            [11]  625 	push	af
   45C2 33            [ 6]  626 	inc	sp
   45C3 21 00 C0      [10]  627 	ld	hl,#0xC000
   45C6 E5            [11]  628 	push	hl
   45C7 CD 76 4E      [17]  629 	call	_cpct_getScreenPtr
   45CA D1            [10]  630 	pop	de
   45CB 33            [ 6]  631 	inc	sp
   45CC 33            [ 6]  632 	inc	sp
   45CD E5            [11]  633 	push	hl
                            634 ;src/main.c:71: if(scene[posY][posX] == 1){
   45CE DD 6E FE      [19]  635 	ld	l,-2 (ix)
   45D1 DD 66 FF      [19]  636 	ld	h,-1 (ix)
   45D4 4E            [ 7]  637 	ld	c,(hl)
   45D5 23            [ 6]  638 	inc	hl
   45D6 46            [ 7]  639 	ld	b,(hl)
   45D7 6B            [ 4]  640 	ld	l, e
   45D8 62            [ 4]  641 	ld	h, d
   45D9 29            [11]  642 	add	hl, hl
   45DA 09            [11]  643 	add	hl,bc
   45DB 46            [ 7]  644 	ld	b,(hl)
   45DC 23            [ 6]  645 	inc	hl
   45DD 66            [ 7]  646 	ld	h,(hl)
   45DE 10 17         [13]  647 	djnz	00116$
   45E0 7C            [ 4]  648 	ld	a,h
   45E1 B7            [ 4]  649 	or	a, a
   45E2 20 13         [12]  650 	jr	NZ,00116$
                            651 ;src/main.c:72: cpct_drawSolidBox(memptr, 3, 5, 20);
   45E4 C1            [10]  652 	pop	bc
   45E5 C5            [11]  653 	push	bc
   45E6 D5            [11]  654 	push	de
   45E7 21 05 14      [10]  655 	ld	hl,#0x1405
   45EA E5            [11]  656 	push	hl
   45EB 3E 03         [ 7]  657 	ld	a,#0x03
   45ED F5            [11]  658 	push	af
   45EE 33            [ 6]  659 	inc	sp
   45EF C5            [11]  660 	push	bc
   45F0 CD BE 4D      [17]  661 	call	_cpct_drawSolidBox
   45F3 F1            [10]  662 	pop	af
   45F4 F1            [10]  663 	pop	af
   45F5 33            [ 6]  664 	inc	sp
   45F6 D1            [10]  665 	pop	de
   45F7                     666 00116$:
                            667 ;src/main.c:69: for(posX=0; posX<width;posX++){
   45F7 13            [ 6]  668 	inc	de
   45F8 7B            [ 4]  669 	ld	a,e
   45F9 D6 10         [ 7]  670 	sub	a, #0x10
   45FB 7A            [ 4]  671 	ld	a,d
   45FC 17            [ 4]  672 	rla
   45FD 3F            [ 4]  673 	ccf
   45FE 1F            [ 4]  674 	rra
   45FF DE 80         [ 7]  675 	sbc	a, #0x80
   4601 38 AC         [12]  676 	jr	C,00115$
                            677 ;src/main.c:68: for(posY=0; posY<height;posY++){
   4603 DD 34 FC      [23]  678 	inc	-4 (ix)
   4606 20 03         [12]  679 	jr	NZ,00163$
   4608 DD 34 FD      [23]  680 	inc	-3 (ix)
   460B                     681 00163$:
   460B DD 7E FC      [19]  682 	ld	a,-4 (ix)
   460E D6 0A         [ 7]  683 	sub	a, #0x0A
   4610 DD 7E FD      [19]  684 	ld	a,-3 (ix)
   4613 17            [ 4]  685 	rla
   4614 3F            [ 4]  686 	ccf
   4615 1F            [ 4]  687 	rra
   4616 DE 80         [ 7]  688 	sbc	a, #0x80
   4618 DA 9B 45      [10]  689 	jp	C,00126$
   461B DD F9         [10]  690 	ld	sp, ix
   461D DD E1         [14]  691 	pop	ix
   461F C9            [10]  692 	ret
                            693 ;src/main.c:82: void checkColisions(u8 *x,u8 *y, u8 lx, u8 ly){
                            694 ;	---------------------------------
                            695 ; Function checkColisions
                            696 ; ---------------------------------
   4620                     697 _checkColisions::
   4620 DD E5         [15]  698 	push	ix
   4622 DD 21 00 00   [14]  699 	ld	ix,#0
   4626 DD 39         [15]  700 	add	ix,sp
   4628 21 F8 FF      [10]  701 	ld	hl,#-8
   462B 39            [11]  702 	add	hl,sp
   462C F9            [ 6]  703 	ld	sp,hl
                            704 ;src/main.c:84: u8 *posX = x;
   462D DD 7E 04      [19]  705 	ld	a,4 (ix)
   4630 DD 77 FA      [19]  706 	ld	-6 (ix),a
   4633 DD 7E 05      [19]  707 	ld	a,5 (ix)
   4636 DD 77 FB      [19]  708 	ld	-5 (ix),a
                            709 ;src/main.c:85: u8 *posY = y;
   4639 DD 7E 06      [19]  710 	ld	a,6 (ix)
   463C DD 77 F8      [19]  711 	ld	-8 (ix),a
   463F DD 7E 07      [19]  712 	ld	a,7 (ix)
   4642 DD 77 F9      [19]  713 	ld	-7 (ix),a
                            714 ;src/main.c:96: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
   4645 E1            [10]  715 	pop	hl
   4646 E5            [11]  716 	push	hl
   4647 5E            [ 7]  717 	ld	e,(hl)
   4648 D5            [11]  718 	push	de
   4649 16 14         [ 7]  719 	ld	d,#0x14
   464B D5            [11]  720 	push	de
   464C CD DB 4C      [17]  721 	call	__divuchar
   464F F1            [10]  722 	pop	af
   4650 D1            [10]  723 	pop	de
   4651 26 00         [ 7]  724 	ld	h,#0x00
   4653 29            [11]  725 	add	hl, hl
   4654 01 DE 4E      [10]  726 	ld	bc,#_scene
   4657 09            [11]  727 	add	hl,bc
   4658 4E            [ 7]  728 	ld	c,(hl)
   4659 23            [ 6]  729 	inc	hl
   465A 46            [ 7]  730 	ld	b,(hl)
   465B DD 6E FA      [19]  731 	ld	l,-6 (ix)
   465E DD 66 FB      [19]  732 	ld	h,-5 (ix)
   4661 56            [ 7]  733 	ld	d,(hl)
   4662 C5            [11]  734 	push	bc
   4663 D5            [11]  735 	push	de
   4664 3E 05         [ 7]  736 	ld	a,#0x05
   4666 F5            [11]  737 	push	af
   4667 33            [ 6]  738 	inc	sp
   4668 D5            [11]  739 	push	de
   4669 33            [ 6]  740 	inc	sp
   466A CD DB 4C      [17]  741 	call	__divuchar
   466D F1            [10]  742 	pop	af
   466E D1            [10]  743 	pop	de
   466F C1            [10]  744 	pop	bc
   4670 26 00         [ 7]  745 	ld	h,#0x00
   4672 29            [11]  746 	add	hl, hl
   4673 DD 75 FE      [19]  747 	ld	-2 (ix),l
   4676 DD 74 FF      [19]  748 	ld	-1 (ix),h
   4679 DD 6E FE      [19]  749 	ld	l,-2 (ix)
   467C DD 66 FF      [19]  750 	ld	h,-1 (ix)
   467F 09            [11]  751 	add	hl,bc
   4680 7E            [ 7]  752 	ld	a, (hl)
   4681 23            [ 6]  753 	inc	hl
   4682 66            [ 7]  754 	ld	h,(hl)
   4683 6F            [ 4]  755 	ld	l,a
   4684 2D            [ 4]  756 	dec	l
   4685 20 04         [12]  757 	jr	NZ,00120$
   4687 7C            [ 4]  758 	ld	a,h
   4688 B7            [ 4]  759 	or	a, a
   4689 28 69         [12]  760 	jr	Z,00101$
   468B                     761 00120$:
                            762 ;src/main.c:97: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
   468B 6A            [ 4]  763 	ld	l,d
   468C 26 00         [ 7]  764 	ld	h,#0x00
   468E 23            [ 6]  765 	inc	hl
   468F 23            [ 6]  766 	inc	hl
   4690 23            [ 6]  767 	inc	hl
   4691 E5            [11]  768 	push	hl
   4692 FD E1         [14]  769 	pop	iy
   4694 C5            [11]  770 	push	bc
   4695 D5            [11]  771 	push	de
   4696 21 05 00      [10]  772 	ld	hl,#0x0005
   4699 E5            [11]  773 	push	hl
   469A FD E5         [15]  774 	push	iy
   469C CD 96 4E      [17]  775 	call	__divsint
   469F F1            [10]  776 	pop	af
   46A0 F1            [10]  777 	pop	af
   46A1 D1            [10]  778 	pop	de
   46A2 C1            [10]  779 	pop	bc
   46A3 29            [11]  780 	add	hl, hl
   46A4 DD 75 FC      [19]  781 	ld	-4 (ix),l
   46A7 DD 74 FD      [19]  782 	ld	-3 (ix),h
   46AA DD 6E FC      [19]  783 	ld	l,-4 (ix)
   46AD DD 66 FD      [19]  784 	ld	h,-3 (ix)
   46B0 09            [11]  785 	add	hl,bc
   46B1 4E            [ 7]  786 	ld	c,(hl)
   46B2 23            [ 6]  787 	inc	hl
   46B3 66            [ 7]  788 	ld	h,(hl)
   46B4 0D            [ 4]  789 	dec	c
   46B5 20 04         [12]  790 	jr	NZ,00121$
   46B7 7C            [ 4]  791 	ld	a,h
   46B8 B7            [ 4]  792 	or	a, a
   46B9 28 39         [12]  793 	jr	Z,00101$
   46BB                     794 00121$:
                            795 ;src/main.c:98: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
   46BB 16 00         [ 7]  796 	ld	d,#0x00
   46BD 21 0E 00      [10]  797 	ld	hl,#0x000E
   46C0 19            [11]  798 	add	hl,de
   46C1 01 14 00      [10]  799 	ld	bc,#0x0014
   46C4 C5            [11]  800 	push	bc
   46C5 E5            [11]  801 	push	hl
   46C6 CD 96 4E      [17]  802 	call	__divsint
   46C9 F1            [10]  803 	pop	af
   46CA F1            [10]  804 	pop	af
   46CB 29            [11]  805 	add	hl, hl
   46CC 11 DE 4E      [10]  806 	ld	de,#_scene
   46CF 19            [11]  807 	add	hl,de
   46D0 5E            [ 7]  808 	ld	e,(hl)
   46D1 23            [ 6]  809 	inc	hl
   46D2 56            [ 7]  810 	ld	d,(hl)
   46D3 DD 6E FE      [19]  811 	ld	l,-2 (ix)
   46D6 DD 66 FF      [19]  812 	ld	h,-1 (ix)
   46D9 19            [11]  813 	add	hl,de
   46DA 46            [ 7]  814 	ld	b,(hl)
   46DB 23            [ 6]  815 	inc	hl
   46DC 66            [ 7]  816 	ld	h,(hl)
   46DD 10 04         [13]  817 	djnz	00122$
   46DF 7C            [ 4]  818 	ld	a,h
   46E0 B7            [ 4]  819 	or	a, a
   46E1 28 11         [12]  820 	jr	Z,00101$
   46E3                     821 00122$:
                            822 ;src/main.c:99: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
   46E3 DD 6E FC      [19]  823 	ld	l,-4 (ix)
   46E6 DD 66 FD      [19]  824 	ld	h,-3 (ix)
   46E9 19            [11]  825 	add	hl,de
   46EA 5E            [ 7]  826 	ld	e,(hl)
   46EB 23            [ 6]  827 	inc	hl
   46EC 66            [ 7]  828 	ld	h,(hl)
   46ED 1D            [ 4]  829 	dec	e
   46EE 20 14         [12]  830 	jr	NZ,00106$
   46F0 7C            [ 4]  831 	ld	a,h
   46F1 B7            [ 4]  832 	or	a, a
   46F2 20 10         [12]  833 	jr	NZ,00106$
   46F4                     834 00101$:
                            835 ;src/main.c:102: *posX=lx;
   46F4 DD 6E FA      [19]  836 	ld	l,-6 (ix)
   46F7 DD 66 FB      [19]  837 	ld	h,-5 (ix)
   46FA DD 7E 08      [19]  838 	ld	a,8 (ix)
   46FD 77            [ 7]  839 	ld	(hl),a
                            840 ;src/main.c:103: *posY=ly;
   46FE E1            [10]  841 	pop	hl
   46FF E5            [11]  842 	push	hl
   4700 DD 7E 09      [19]  843 	ld	a,9 (ix)
   4703 77            [ 7]  844 	ld	(hl),a
   4704                     845 00106$:
   4704 DD F9         [10]  846 	ld	sp, ix
   4706 DD E1         [14]  847 	pop	ix
   4708 C9            [10]  848 	ret
                            849 ;src/main.c:110: u8* checkKeyboard(u8 *x, u8 *y,int *finish,u8 *s,u8 *dir,u8 *size){
                            850 ;	---------------------------------
                            851 ; Function checkKeyboard
                            852 ; ---------------------------------
   4709                     853 _checkKeyboard::
   4709 DD E5         [15]  854 	push	ix
   470B DD 21 00 00   [14]  855 	ld	ix,#0
   470F DD 39         [15]  856 	add	ix,sp
   4711 F5            [11]  857 	push	af
   4712 F5            [11]  858 	push	af
                            859 ;src/main.c:112: u8 *sprite = s;
   4713 DD 5E 0A      [19]  860 	ld	e,10 (ix)
   4716 DD 56 0B      [19]  861 	ld	d,11 (ix)
                            862 ;src/main.c:113: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
   4719 D5            [11]  863 	push	de
   471A 21 00 02      [10]  864 	ld	hl,#0x0200
   471D CD 9C 4B      [17]  865 	call	_cpct_isKeyPressed
   4720 4D            [ 4]  866 	ld	c,l
   4721 D1            [10]  867 	pop	de
   4722 DD 6E 04      [19]  868 	ld	l,4 (ix)
   4725 DD 66 05      [19]  869 	ld	h,5 (ix)
                            870 ;src/main.c:115: dir[0] = 6;
   4728 DD 7E 0C      [19]  871 	ld	a,12 (ix)
   472B DD 77 FE      [19]  872 	ld	-2 (ix),a
   472E DD 7E 0D      [19]  873 	ld	a,13 (ix)
   4731 DD 77 FF      [19]  874 	ld	-1 (ix),a
                            875 ;src/main.c:116: size[0] = 4;
   4734 DD 7E 0E      [19]  876 	ld	a,14 (ix)
   4737 DD 77 FC      [19]  877 	ld	-4 (ix),a
   473A DD 7E 0F      [19]  878 	ld	a,15 (ix)
   473D DD 77 FD      [19]  879 	ld	-3 (ix),a
                            880 ;src/main.c:113: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
   4740 79            [ 4]  881 	ld	a,c
   4741 B7            [ 4]  882 	or	a, a
   4742 28 1A         [12]  883 	jr	Z,00125$
   4744 46            [ 7]  884 	ld	b,(hl)
   4745 78            [ 4]  885 	ld	a,b
   4746 D6 4C         [ 7]  886 	sub	a, #0x4C
   4748 30 14         [12]  887 	jr	NC,00125$
                            888 ;src/main.c:114: x[0] += 1;
   474A 04            [ 4]  889 	inc	b
   474B 70            [ 7]  890 	ld	(hl),b
                            891 ;src/main.c:115: dir[0] = 6;
   474C DD 6E FE      [19]  892 	ld	l,-2 (ix)
   474F DD 66 FF      [19]  893 	ld	h,-1 (ix)
   4752 36 06         [10]  894 	ld	(hl),#0x06
                            895 ;src/main.c:116: size[0] = 4;
   4754 E1            [10]  896 	pop	hl
   4755 E5            [11]  897 	push	hl
   4756 36 04         [10]  898 	ld	(hl),#0x04
                            899 ;src/main.c:117: sprite = gladis_quieto_dcha;
   4758 11 00 41      [10]  900 	ld	de,#_gladis_quieto_dcha+0
   475B C3 1F 48      [10]  901 	jp	00126$
   475E                     902 00125$:
                            903 ;src/main.c:118: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
   475E E5            [11]  904 	push	hl
   475F D5            [11]  905 	push	de
   4760 21 01 01      [10]  906 	ld	hl,#0x0101
   4763 CD 9C 4B      [17]  907 	call	_cpct_isKeyPressed
   4766 7D            [ 4]  908 	ld	a,l
   4767 D1            [10]  909 	pop	de
   4768 E1            [10]  910 	pop	hl
   4769 B7            [ 4]  911 	or	a, a
   476A 28 19         [12]  912 	jr	Z,00121$
   476C 7E            [ 7]  913 	ld	a,(hl)
   476D B7            [ 4]  914 	or	a, a
   476E 28 15         [12]  915 	jr	Z,00121$
                            916 ;src/main.c:119: x[0] -= 1;
   4770 C6 FF         [ 7]  917 	add	a,#0xFF
   4772 77            [ 7]  918 	ld	(hl),a
                            919 ;src/main.c:120: dir[0] = 4;
   4773 DD 6E FE      [19]  920 	ld	l,-2 (ix)
   4776 DD 66 FF      [19]  921 	ld	h,-1 (ix)
   4779 36 04         [10]  922 	ld	(hl),#0x04
                            923 ;src/main.c:121: size[0] = 4;
   477B E1            [10]  924 	pop	hl
   477C E5            [11]  925 	push	hl
   477D 36 04         [10]  926 	ld	(hl),#0x04
                            927 ;src/main.c:122: sprite = gladis_quieto_izda;
   477F 11 80 41      [10]  928 	ld	de,#_gladis_quieto_izda+0
   4782 C3 1F 48      [10]  929 	jp	00126$
   4785                     930 00121$:
                            931 ;src/main.c:123: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
   4785 D5            [11]  932 	push	de
   4786 21 00 04      [10]  933 	ld	hl,#0x0400
   4789 CD 9C 4B      [17]  934 	call	_cpct_isKeyPressed
   478C 4D            [ 4]  935 	ld	c,l
   478D D1            [10]  936 	pop	de
   478E DD 6E 06      [19]  937 	ld	l,6 (ix)
   4791 DD 66 07      [19]  938 	ld	h,7 (ix)
   4794 79            [ 4]  939 	ld	a,c
   4795 B7            [ 4]  940 	or	a, a
   4796 28 1A         [12]  941 	jr	Z,00117$
   4798 46            [ 7]  942 	ld	b,(hl)
   4799 78            [ 4]  943 	ld	a,b
   479A D6 B4         [ 7]  944 	sub	a, #0xB4
   479C 30 14         [12]  945 	jr	NC,00117$
                            946 ;src/main.c:124: y[0] += 2;
   479E 04            [ 4]  947 	inc	b
   479F 04            [ 4]  948 	inc	b
   47A0 70            [ 7]  949 	ld	(hl),b
                            950 ;src/main.c:125: dir[0] = 2;
   47A1 DD 6E FE      [19]  951 	ld	l,-2 (ix)
   47A4 DD 66 FF      [19]  952 	ld	h,-1 (ix)
   47A7 36 02         [10]  953 	ld	(hl),#0x02
                            954 ;src/main.c:126: size[0] = 4;
   47A9 E1            [10]  955 	pop	hl
   47AA E5            [11]  956 	push	hl
   47AB 36 04         [10]  957 	ld	(hl),#0x04
                            958 ;src/main.c:127: sprite = gladis_quieto_dcha;
   47AD 11 00 41      [10]  959 	ld	de,#_gladis_quieto_dcha+0
   47B0 18 6D         [12]  960 	jr	00126$
   47B2                     961 00117$:
                            962 ;src/main.c:128: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
   47B2 E5            [11]  963 	push	hl
   47B3 D5            [11]  964 	push	de
   47B4 21 00 01      [10]  965 	ld	hl,#0x0100
   47B7 CD 9C 4B      [17]  966 	call	_cpct_isKeyPressed
   47BA 7D            [ 4]  967 	ld	a,l
   47BB D1            [10]  968 	pop	de
   47BC E1            [10]  969 	pop	hl
   47BD B7            [ 4]  970 	or	a, a
   47BE 28 18         [12]  971 	jr	Z,00113$
   47C0 7E            [ 7]  972 	ld	a,(hl)
   47C1 B7            [ 4]  973 	or	a, a
   47C2 28 14         [12]  974 	jr	Z,00113$
                            975 ;src/main.c:129: y[0] -= 2;
   47C4 C6 FE         [ 7]  976 	add	a,#0xFE
   47C6 77            [ 7]  977 	ld	(hl),a
                            978 ;src/main.c:130: dir[0] = 8;
   47C7 DD 6E FE      [19]  979 	ld	l,-2 (ix)
   47CA DD 66 FF      [19]  980 	ld	h,-1 (ix)
   47CD 36 08         [10]  981 	ld	(hl),#0x08
                            982 ;src/main.c:131: size[0] = 4;
   47CF E1            [10]  983 	pop	hl
   47D0 E5            [11]  984 	push	hl
   47D1 36 04         [10]  985 	ld	(hl),#0x04
                            986 ;src/main.c:132: sprite = gladis_quieto_dcha;
   47D3 11 00 41      [10]  987 	ld	de,#_gladis_quieto_dcha+0
   47D6 18 47         [12]  988 	jr	00126$
   47D8                     989 00113$:
                            990 ;src/main.c:133: }else  if(cpct_isKeyPressed(Key_Esc)){
   47D8 D5            [11]  991 	push	de
   47D9 21 08 04      [10]  992 	ld	hl,#0x0408
   47DC CD 9C 4B      [17]  993 	call	_cpct_isKeyPressed
   47DF 7D            [ 4]  994 	ld	a,l
   47E0 D1            [10]  995 	pop	de
   47E1 B7            [ 4]  996 	or	a, a
   47E2 28 0D         [12]  997 	jr	Z,00110$
                            998 ;src/main.c:134: finish[0] = 1;
   47E4 DD 6E 08      [19]  999 	ld	l,8 (ix)
   47E7 DD 66 09      [19] 1000 	ld	h,9 (ix)
   47EA 36 01         [10] 1001 	ld	(hl),#0x01
   47EC 23            [ 6] 1002 	inc	hl
   47ED 36 00         [10] 1003 	ld	(hl),#0x00
   47EF 18 2E         [12] 1004 	jr	00126$
   47F1                    1005 00110$:
                           1006 ;src/main.c:135: }else if(cpct_isKeyPressed(Key_Space)){
   47F1 D5            [11] 1007 	push	de
   47F2 21 05 80      [10] 1008 	ld	hl,#0x8005
   47F5 CD 9C 4B      [17] 1009 	call	_cpct_isKeyPressed
   47F8 7D            [ 4] 1010 	ld	a,l
   47F9 D1            [10] 1011 	pop	de
   47FA B7            [ 4] 1012 	or	a, a
   47FB 28 22         [12] 1013 	jr	Z,00126$
                           1014 ;src/main.c:136: size[0] = 5;
   47FD E1            [10] 1015 	pop	hl
   47FE E5            [11] 1016 	push	hl
   47FF 36 05         [10] 1017 	ld	(hl),#0x05
                           1018 ;src/main.c:137: if(dir[0] == 6) {sprite = gladis_atk_dcha;}
   4801 DD 6E FE      [19] 1019 	ld	l,-2 (ix)
   4804 DD 66 FF      [19] 1020 	ld	h,-1 (ix)
   4807 6E            [ 7] 1021 	ld	l,(hl)
   4808 7D            [ 4] 1022 	ld	a,l
   4809 D6 06         [ 7] 1023 	sub	a, #0x06
   480B 20 05         [12] 1024 	jr	NZ,00105$
   480D 11 38 4A      [10] 1025 	ld	de,#_gladis_atk_dcha+0
   4810 18 0D         [12] 1026 	jr	00126$
   4812                    1027 00105$:
                           1028 ;src/main.c:138: else if(dir[0] == 4) {sprite = gladis_atk_izda;}
   4812 7D            [ 4] 1029 	ld	a,l
   4813 D6 04         [ 7] 1030 	sub	a, #0x04
   4815 20 05         [12] 1031 	jr	NZ,00102$
   4817 11 D8 4A      [10] 1032 	ld	de,#_gladis_atk_izda+0
   481A 18 03         [12] 1033 	jr	00126$
   481C                    1034 00102$:
                           1035 ;src/main.c:139: else {sprite = gladis_quieto_dcha;} 
   481C 11 00 41      [10] 1036 	ld	de,#_gladis_quieto_dcha+0
   481F                    1037 00126$:
                           1038 ;src/main.c:141: return sprite;
   481F EB            [ 4] 1039 	ex	de,hl
   4820 DD F9         [10] 1040 	ld	sp, ix
   4822 DD E1         [14] 1041 	pop	ix
   4824 C9            [10] 1042 	ret
                           1043 ;src/main.c:147: void game(){
                           1044 ;	---------------------------------
                           1045 ; Function game
                           1046 ; ---------------------------------
   4825                    1047 _game::
   4825 DD E5         [15] 1048 	push	ix
   4827 DD 21 00 00   [14] 1049 	ld	ix,#0
   482B DD 39         [15] 1050 	add	ix,sp
   482D 21 D6 FF      [10] 1051 	ld	hl,#-42
   4830 39            [11] 1052 	add	hl,sp
   4831 F9            [ 6] 1053 	ld	sp,hl
                           1054 ;src/main.c:148: TPlayer p = {0,100,gladis_quieto_dcha,10,6,4};
   4832 21 00 00      [10] 1055 	ld	hl,#0x0000
   4835 39            [11] 1056 	add	hl,sp
   4836 36 00         [10] 1057 	ld	(hl),#0x00
   4838 21 00 00      [10] 1058 	ld	hl,#0x0000
   483B 39            [11] 1059 	add	hl,sp
   483C 5D            [ 4] 1060 	ld	e, l
   483D 54            [ 4] 1061 	ld	d, h
   483E 23            [ 6] 1062 	inc	hl
   483F DD 75 FE      [19] 1063 	ld	-2 (ix),l
   4842 DD 74 FF      [19] 1064 	ld	-1 (ix),h
   4845 DD 6E FE      [19] 1065 	ld	l,-2 (ix)
   4848 DD 66 FF      [19] 1066 	ld	h,-1 (ix)
   484B 36 64         [10] 1067 	ld	(hl),#0x64
   484D 21 02 00      [10] 1068 	ld	hl,#0x0002
   4850 19            [11] 1069 	add	hl,de
   4851 DD 75 FC      [19] 1070 	ld	-4 (ix),l
   4854 DD 74 FD      [19] 1071 	ld	-3 (ix),h
   4857 DD 6E FC      [19] 1072 	ld	l,-4 (ix)
   485A DD 66 FD      [19] 1073 	ld	h,-3 (ix)
   485D 36 00         [10] 1074 	ld	(hl),#<(_gladis_quieto_dcha)
   485F 23            [ 6] 1075 	inc	hl
   4860 36 41         [10] 1076 	ld	(hl),#>(_gladis_quieto_dcha)
   4862 21 04 00      [10] 1077 	ld	hl,#0x0004
   4865 19            [11] 1078 	add	hl,de
   4866 36 0A         [10] 1079 	ld	(hl),#0x0A
   4868 21 05 00      [10] 1080 	ld	hl,#0x0005
   486B 19            [11] 1081 	add	hl,de
   486C DD 75 FA      [19] 1082 	ld	-6 (ix),l
   486F DD 74 FB      [19] 1083 	ld	-5 (ix),h
   4872 DD 6E FA      [19] 1084 	ld	l,-6 (ix)
   4875 DD 66 FB      [19] 1085 	ld	h,-5 (ix)
   4878 36 06         [10] 1086 	ld	(hl),#0x06
   487A 21 06 00      [10] 1087 	ld	hl,#0x0006
   487D 19            [11] 1088 	add	hl,de
   487E DD 75 F8      [19] 1089 	ld	-8 (ix),l
   4881 DD 74 F9      [19] 1090 	ld	-7 (ix),h
   4884 DD 6E F8      [19] 1091 	ld	l,-8 (ix)
   4887 DD 66 F9      [19] 1092 	ld	h,-7 (ix)
   488A 36 04         [10] 1093 	ld	(hl),#0x04
                           1094 ;src/main.c:149: TPlayer e = {30,100,gladis_quieto_dcha,5,4,4};
   488C 21 07 00      [10] 1095 	ld	hl,#0x0007
   488F 39            [11] 1096 	add	hl,sp
   4890 36 1E         [10] 1097 	ld	(hl),#0x1E
   4892 21 07 00      [10] 1098 	ld	hl,#0x0007
   4895 39            [11] 1099 	add	hl,sp
   4896 4D            [ 4] 1100 	ld	c,l
   4897 44            [ 4] 1101 	ld	b,h
   4898 23            [ 6] 1102 	inc	hl
   4899 36 64         [10] 1103 	ld	(hl),#0x64
   489B 69            [ 4] 1104 	ld	l, c
   489C 60            [ 4] 1105 	ld	h, b
   489D 23            [ 6] 1106 	inc	hl
   489E 23            [ 6] 1107 	inc	hl
   489F 36 00         [10] 1108 	ld	(hl),#<(_gladis_quieto_dcha)
   48A1 23            [ 6] 1109 	inc	hl
   48A2 36 41         [10] 1110 	ld	(hl),#>(_gladis_quieto_dcha)
   48A4 21 04 00      [10] 1111 	ld	hl,#0x0004
   48A7 09            [11] 1112 	add	hl,bc
   48A8 36 05         [10] 1113 	ld	(hl),#0x05
   48AA 21 05 00      [10] 1114 	ld	hl,#0x0005
   48AD 09            [11] 1115 	add	hl,bc
   48AE 36 04         [10] 1116 	ld	(hl),#0x04
   48B0 21 06 00      [10] 1117 	ld	hl,#0x0006
   48B3 09            [11] 1118 	add	hl,bc
   48B4 36 04         [10] 1119 	ld	(hl),#0x04
                           1120 ;src/main.c:153: int finish = 0;
   48B6 DD 36 E6 00   [19] 1121 	ld	-26 (ix),#0x00
   48BA DD 36 E7 00   [19] 1122 	ld	-25 (ix),#0x00
                           1123 ;src/main.c:158: cpct_clearScreen(0);
   48BE D5            [11] 1124 	push	de
   48BF 21 00 40      [10] 1125 	ld	hl,#0x4000
   48C2 E5            [11] 1126 	push	hl
   48C3 AF            [ 4] 1127 	xor	a, a
   48C4 F5            [11] 1128 	push	af
   48C5 33            [ 6] 1129 	inc	sp
   48C6 26 C0         [ 7] 1130 	ld	h, #0xC0
   48C8 E5            [11] 1131 	push	hl
   48C9 CD 9C 4D      [17] 1132 	call	_cpct_memset
   48CC 21 01 00      [10] 1133 	ld	hl,#0x0001
   48CF E5            [11] 1134 	push	hl
   48D0 CD 0F 45      [17] 1135 	call	_drawMap
   48D3 F1            [10] 1136 	pop	af
   48D4 D1            [10] 1137 	pop	de
                           1138 ;src/main.c:161: while (1){
   48D5 DD 7E F8      [19] 1139 	ld	a,-8 (ix)
   48D8 DD 77 F6      [19] 1140 	ld	-10 (ix),a
   48DB DD 7E F9      [19] 1141 	ld	a,-7 (ix)
   48DE DD 77 F7      [19] 1142 	ld	-9 (ix),a
   48E1 DD 7E FE      [19] 1143 	ld	a,-2 (ix)
   48E4 DD 77 F4      [19] 1144 	ld	-12 (ix),a
   48E7 DD 7E FF      [19] 1145 	ld	a,-1 (ix)
   48EA DD 77 F5      [19] 1146 	ld	-11 (ix),a
   48ED DD 73 F2      [19] 1147 	ld	-14 (ix),e
   48F0 DD 72 F3      [19] 1148 	ld	-13 (ix),d
   48F3 DD 7E FE      [19] 1149 	ld	a,-2 (ix)
   48F6 DD 77 F0      [19] 1150 	ld	-16 (ix),a
   48F9 DD 7E FF      [19] 1151 	ld	a,-1 (ix)
   48FC DD 77 F1      [19] 1152 	ld	-15 (ix),a
   48FF DD 73 EE      [19] 1153 	ld	-18 (ix),e
   4902 DD 72 EF      [19] 1154 	ld	-17 (ix),d
   4905                    1155 00104$:
                           1156 ;src/main.c:164: cpct_waitVSYNC();
   4905 D5            [11] 1157 	push	de
   4906 CD 82 4D      [17] 1158 	call	_cpct_waitVSYNC
   4909 D1            [10] 1159 	pop	de
                           1160 ;src/main.c:167: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   490A DD 6E FE      [19] 1161 	ld	l,-2 (ix)
   490D DD 66 FF      [19] 1162 	ld	h,-1 (ix)
   4910 46            [ 7] 1163 	ld	b,(hl)
   4911 1A            [ 7] 1164 	ld	a,(de)
   4912 D5            [11] 1165 	push	de
   4913 C5            [11] 1166 	push	bc
   4914 33            [ 6] 1167 	inc	sp
   4915 F5            [11] 1168 	push	af
   4916 33            [ 6] 1169 	inc	sp
   4917 21 00 C0      [10] 1170 	ld	hl,#0xC000
   491A E5            [11] 1171 	push	hl
   491B CD 76 4E      [17] 1172 	call	_cpct_getScreenPtr
   491E D1            [10] 1173 	pop	de
   491F E5            [11] 1174 	push	hl
   4920 FD E1         [14] 1175 	pop	iy
                           1176 ;src/main.c:168: cpct_drawSolidBox(memptr,0,p.size,16);
   4922 DD 6E F8      [19] 1177 	ld	l,-8 (ix)
   4925 DD 66 F9      [19] 1178 	ld	h,-7 (ix)
   4928 4E            [ 7] 1179 	ld	c,(hl)
   4929 D5            [11] 1180 	push	de
   492A 3E 10         [ 7] 1181 	ld	a,#0x10
   492C F5            [11] 1182 	push	af
   492D 33            [ 6] 1183 	inc	sp
   492E 79            [ 4] 1184 	ld	a,c
   492F F5            [11] 1185 	push	af
   4930 33            [ 6] 1186 	inc	sp
   4931 AF            [ 4] 1187 	xor	a, a
   4932 F5            [11] 1188 	push	af
   4933 33            [ 6] 1189 	inc	sp
   4934 FD E5         [15] 1190 	push	iy
   4936 CD BE 4D      [17] 1191 	call	_cpct_drawSolidBox
   4939 F1            [10] 1192 	pop	af
   493A F1            [10] 1193 	pop	af
   493B 33            [ 6] 1194 	inc	sp
   493C D1            [10] 1195 	pop	de
                           1196 ;src/main.c:173: lx = p.x;
   493D 1A            [ 7] 1197 	ld	a,(de)
   493E DD 77 E4      [19] 1198 	ld	-28 (ix),a
                           1199 ;src/main.c:174: ly = p.y;
   4941 DD 6E FE      [19] 1200 	ld	l,-2 (ix)
   4944 DD 66 FF      [19] 1201 	ld	h,-1 (ix)
   4947 7E            [ 7] 1202 	ld	a,(hl)
   4948 DD 77 E5      [19] 1203 	ld	-27 (ix),a
                           1204 ;src/main.c:177: cpct_scanKeyboard_f();
   494B D5            [11] 1205 	push	de
   494C CD A8 4B      [17] 1206 	call	_cpct_scanKeyboard_f
   494F D1            [10] 1207 	pop	de
                           1208 ;src/main.c:178: p.sprite  = checkKeyboard(&p.x,&p.y,&finish,p.sprite,&p.dir,&p.size);
   4950 DD 4E F6      [19] 1209 	ld	c,-10 (ix)
   4953 DD 46 F7      [19] 1210 	ld	b,-9 (ix)
   4956 DD 7E FA      [19] 1211 	ld	a,-6 (ix)
   4959 DD 77 EC      [19] 1212 	ld	-20 (ix),a
   495C DD 7E FB      [19] 1213 	ld	a,-5 (ix)
   495F DD 77 ED      [19] 1214 	ld	-19 (ix),a
   4962 DD 6E FC      [19] 1215 	ld	l,-4 (ix)
   4965 DD 66 FD      [19] 1216 	ld	h,-3 (ix)
   4968 7E            [ 7] 1217 	ld	a,(hl)
   4969 DD 77 EA      [19] 1218 	ld	-22 (ix),a
   496C 23            [ 6] 1219 	inc	hl
   496D 7E            [ 7] 1220 	ld	a,(hl)
   496E DD 77 EB      [19] 1221 	ld	-21 (ix),a
   4971 FD 21 10 00   [14] 1222 	ld	iy,#0x0010
   4975 FD 39         [15] 1223 	add	iy,sp
   4977 DD 7E F4      [19] 1224 	ld	a,-12 (ix)
   497A DD 77 E8      [19] 1225 	ld	-24 (ix),a
   497D DD 7E F5      [19] 1226 	ld	a,-11 (ix)
   4980 DD 77 E9      [19] 1227 	ld	-23 (ix),a
   4983 DD 6E F2      [19] 1228 	ld	l,-14 (ix)
   4986 DD 66 F3      [19] 1229 	ld	h,-13 (ix)
   4989 D5            [11] 1230 	push	de
   498A C5            [11] 1231 	push	bc
   498B DD 4E EC      [19] 1232 	ld	c,-20 (ix)
   498E DD 46 ED      [19] 1233 	ld	b,-19 (ix)
   4991 C5            [11] 1234 	push	bc
   4992 DD 4E EA      [19] 1235 	ld	c,-22 (ix)
   4995 DD 46 EB      [19] 1236 	ld	b,-21 (ix)
   4998 C5            [11] 1237 	push	bc
   4999 FD E5         [15] 1238 	push	iy
   499B DD 4E E8      [19] 1239 	ld	c,-24 (ix)
   499E DD 46 E9      [19] 1240 	ld	b,-23 (ix)
   49A1 C5            [11] 1241 	push	bc
   49A2 E5            [11] 1242 	push	hl
   49A3 CD 09 47      [17] 1243 	call	_checkKeyboard
   49A6 FD 21 0C 00   [14] 1244 	ld	iy,#12
   49AA FD 39         [15] 1245 	add	iy,sp
   49AC FD F9         [10] 1246 	ld	sp,iy
   49AE 45            [ 4] 1247 	ld	b,l
   49AF 4C            [ 4] 1248 	ld	c,h
   49B0 D1            [10] 1249 	pop	de
   49B1 DD 6E FC      [19] 1250 	ld	l,-4 (ix)
   49B4 DD 66 FD      [19] 1251 	ld	h,-3 (ix)
   49B7 70            [ 7] 1252 	ld	(hl),b
   49B8 23            [ 6] 1253 	inc	hl
   49B9 71            [ 7] 1254 	ld	(hl),c
                           1255 ;src/main.c:181: checkColisions(&p.x,&p.y,lx,ly);
   49BA DD 4E F0      [19] 1256 	ld	c,-16 (ix)
   49BD DD 46 F1      [19] 1257 	ld	b,-15 (ix)
   49C0 C5            [11] 1258 	push	bc
   49C1 FD E1         [14] 1259 	pop	iy
   49C3 DD 4E EE      [19] 1260 	ld	c,-18 (ix)
   49C6 DD 46 EF      [19] 1261 	ld	b,-17 (ix)
   49C9 D5            [11] 1262 	push	de
   49CA DD 66 E5      [19] 1263 	ld	h,-27 (ix)
   49CD DD 6E E4      [19] 1264 	ld	l,-28 (ix)
   49D0 E5            [11] 1265 	push	hl
   49D1 FD E5         [15] 1266 	push	iy
   49D3 C5            [11] 1267 	push	bc
   49D4 CD 20 46      [17] 1268 	call	_checkColisions
   49D7 21 06 00      [10] 1269 	ld	hl,#6
   49DA 39            [11] 1270 	add	hl,sp
   49DB F9            [ 6] 1271 	ld	sp,hl
   49DC D1            [10] 1272 	pop	de
                           1273 ;src/main.c:184: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   49DD DD 6E FE      [19] 1274 	ld	l,-2 (ix)
   49E0 DD 66 FF      [19] 1275 	ld	h,-1 (ix)
   49E3 46            [ 7] 1276 	ld	b,(hl)
   49E4 1A            [ 7] 1277 	ld	a,(de)
   49E5 D5            [11] 1278 	push	de
   49E6 C5            [11] 1279 	push	bc
   49E7 33            [ 6] 1280 	inc	sp
   49E8 F5            [11] 1281 	push	af
   49E9 33            [ 6] 1282 	inc	sp
   49EA 21 00 C0      [10] 1283 	ld	hl,#0xC000
   49ED E5            [11] 1284 	push	hl
   49EE CD 76 4E      [17] 1285 	call	_cpct_getScreenPtr
   49F1 D1            [10] 1286 	pop	de
   49F2 E5            [11] 1287 	push	hl
   49F3 FD E1         [14] 1288 	pop	iy
                           1289 ;src/main.c:185: cpct_drawSpriteMasked(p.sprite,memptr,p.size,16);
   49F5 DD 6E F8      [19] 1290 	ld	l,-8 (ix)
   49F8 DD 66 F9      [19] 1291 	ld	h,-7 (ix)
   49FB 7E            [ 7] 1292 	ld	a,(hl)
   49FC DD 77 E8      [19] 1293 	ld	-24 (ix),a
   49FF DD 6E FC      [19] 1294 	ld	l,-4 (ix)
   4A02 DD 66 FD      [19] 1295 	ld	h,-3 (ix)
   4A05 4E            [ 7] 1296 	ld	c,(hl)
   4A06 23            [ 6] 1297 	inc	hl
   4A07 46            [ 7] 1298 	ld	b,(hl)
   4A08 D5            [11] 1299 	push	de
   4A09 3E 10         [ 7] 1300 	ld	a,#0x10
   4A0B F5            [11] 1301 	push	af
   4A0C 33            [ 6] 1302 	inc	sp
   4A0D DD 7E E8      [19] 1303 	ld	a,-24 (ix)
   4A10 F5            [11] 1304 	push	af
   4A11 33            [ 6] 1305 	inc	sp
   4A12 FD E5         [15] 1306 	push	iy
   4A14 C5            [11] 1307 	push	bc
   4A15 CD 38 4D      [17] 1308 	call	_cpct_drawSpriteMasked
   4A18 D1            [10] 1309 	pop	de
                           1310 ;src/main.c:187: if(finish == 1) {return;}
   4A19 DD 7E E6      [19] 1311 	ld	a,-26 (ix)
   4A1C 3D            [ 4] 1312 	dec	a
   4A1D C2 05 49      [10] 1313 	jp	NZ,00104$
   4A20 DD 7E E7      [19] 1314 	ld	a,-25 (ix)
   4A23 B7            [ 4] 1315 	or	a, a
   4A24 C2 05 49      [10] 1316 	jp	NZ,00104$
   4A27 DD F9         [10] 1317 	ld	sp, ix
   4A29 DD E1         [14] 1318 	pop	ix
   4A2B C9            [10] 1319 	ret
                           1320 ;src/main.c:196: void loadMap(){
                           1321 ;	---------------------------------
                           1322 ; Function loadMap
                           1323 ; ---------------------------------
   4A2C                    1324 _loadMap::
                           1325 ;src/main.c:198: }
   4A2C C9            [10] 1326 	ret
                           1327 ;src/main.c:203: void main(void) {
                           1328 ;	---------------------------------
                           1329 ; Function main
                           1330 ; ---------------------------------
   4A2D                    1331 _main::
                           1332 ;src/main.c:205: init();
   4A2D CD 00 42      [17] 1333 	call	_init
                           1334 ;src/main.c:209: while(1){
   4A30                    1335 00102$:
                           1336 ;src/main.c:210: menu();
   4A30 CD A9 44      [17] 1337 	call	_menu
                           1338 ;src/main.c:212: game();
   4A33 CD 25 48      [17] 1339 	call	_game
   4A36 18 F8         [12] 1340 	jr	00102$
                           1341 	.area _CODE
                           1342 	.area _INITIALIZER
                           1343 	.area _CABS (ABS)
