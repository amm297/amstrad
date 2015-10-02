                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct  2 18:22:59 2015
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
                             15 	.globl _checkColisions
                             16 	.globl _drawMap
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
                             31 	.globl _sprite
                             32 	.globl _scene
                             33 	.globl _g_palette
                             34 	.globl _mapa2
                             35 	.globl _mapa1
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   4D6C                      43 _scene::
   4D6C                      44 	.ds 6
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
   4D72                      49 _sprite::
   4D72                      50 	.ds 2
                             51 ;--------------------------------------------------------
                             52 ; absolute external ram data
                             53 ;--------------------------------------------------------
                             54 	.area _DABS (ABS)
                             55 ;--------------------------------------------------------
                             56 ; global & static initialisations
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _GSINIT
                             60 	.area _GSFINAL
                             61 	.area _GSINIT
                             62 ;--------------------------------------------------------
                             63 ; Home
                             64 ;--------------------------------------------------------
                             65 	.area _HOME
                             66 	.area _HOME
                             67 ;--------------------------------------------------------
                             68 ; code
                             69 ;--------------------------------------------------------
                             70 	.area _CODE
                             71 ;src/main.c:67: void init(){
                             72 ;	---------------------------------
                             73 ; Function init
                             74 ; ---------------------------------
   4200                      75 _init::
                             76 ;src/main.c:68: cpct_disableFirmware();
   4200 CD 3B 4C      [17]   77 	call	_cpct_disableFirmware
                             78 ;src/main.c:69: cpct_setVideoMode(0);
   4203 AF            [ 4]   79 	xor	a, a
   4204 F5            [11]   80 	push	af
   4205 33            [ 6]   81 	inc	sp
   4206 CD 18 4C      [17]   82 	call	_cpct_setVideoMode
   4209 33            [ 6]   83 	inc	sp
                             84 ;src/main.c:70: cpct_fw2hw(g_palette,4);
   420A 11 A5 44      [10]   85 	ld	de,#_g_palette
   420D 3E 04         [ 7]   86 	ld	a,#0x04
   420F F5            [11]   87 	push	af
   4210 33            [ 6]   88 	inc	sp
   4211 D5            [11]   89 	push	de
   4212 CD A2 4B      [17]   90 	call	_cpct_fw2hw
   4215 F1            [10]   91 	pop	af
   4216 33            [ 6]   92 	inc	sp
                             93 ;src/main.c:71: cpct_setPalette(g_palette,4);
   4217 11 A5 44      [10]   94 	ld	de,#_g_palette
   421A 3E 04         [ 7]   95 	ld	a,#0x04
   421C F5            [11]   96 	push	af
   421D 33            [ 6]   97 	inc	sp
   421E D5            [11]   98 	push	de
   421F CD 06 4A      [17]   99 	call	_cpct_setPalette
   4222 F1            [10]  100 	pop	af
   4223 33            [ 6]  101 	inc	sp
   4224 C9            [10]  102 	ret
   4225                     103 _mapa1:
   4225 01 00               104 	.dw #0x0001
   4227 01 00               105 	.dw #0x0001
   4229 01 00               106 	.dw #0x0001
   422B 01 00               107 	.dw #0x0001
   422D 01 00               108 	.dw #0x0001
   422F 01 00               109 	.dw #0x0001
   4231 01 00               110 	.dw #0x0001
   4233 01 00               111 	.dw #0x0001
   4235 01 00               112 	.dw #0x0001
   4237 01 00               113 	.dw #0x0001
   4239 01 00               114 	.dw #0x0001
   423B 01 00               115 	.dw #0x0001
   423D 01 00               116 	.dw #0x0001
   423F 01 00               117 	.dw #0x0001
   4241 01 00               118 	.dw #0x0001
   4243 01 00               119 	.dw #0x0001
   4245 01 00               120 	.dw #0x0001
   4247 00 00               121 	.dw #0x0000
   4249 00 00               122 	.dw #0x0000
   424B 00 00               123 	.dw #0x0000
   424D 00 00               124 	.dw #0x0000
   424F 00 00               125 	.dw #0x0000
   4251 00 00               126 	.dw #0x0000
   4253 00 00               127 	.dw #0x0000
   4255 00 00               128 	.dw #0x0000
   4257 00 00               129 	.dw #0x0000
   4259 00 00               130 	.dw #0x0000
   425B 00 00               131 	.dw #0x0000
   425D 00 00               132 	.dw #0x0000
   425F 00 00               133 	.dw #0x0000
   4261 00 00               134 	.dw #0x0000
   4263 01 00               135 	.dw #0x0001
   4265 01 00               136 	.dw #0x0001
   4267 00 00               137 	.dw #0x0000
   4269 00 00               138 	.dw #0x0000
   426B 00 00               139 	.dw #0x0000
   426D 00 00               140 	.dw #0x0000
   426F 00 00               141 	.dw #0x0000
   4271 00 00               142 	.dw #0x0000
   4273 00 00               143 	.dw #0x0000
   4275 00 00               144 	.dw #0x0000
   4277 00 00               145 	.dw #0x0000
   4279 00 00               146 	.dw #0x0000
   427B 00 00               147 	.dw #0x0000
   427D 00 00               148 	.dw #0x0000
   427F 00 00               149 	.dw #0x0000
   4281 00 00               150 	.dw #0x0000
   4283 01 00               151 	.dw #0x0001
   4285 01 00               152 	.dw #0x0001
   4287 00 00               153 	.dw #0x0000
   4289 00 00               154 	.dw #0x0000
   428B 00 00               155 	.dw #0x0000
   428D 00 00               156 	.dw #0x0000
   428F 00 00               157 	.dw #0x0000
   4291 00 00               158 	.dw #0x0000
   4293 00 00               159 	.dw #0x0000
   4295 00 00               160 	.dw #0x0000
   4297 00 00               161 	.dw #0x0000
   4299 00 00               162 	.dw #0x0000
   429B 00 00               163 	.dw #0x0000
   429D 00 00               164 	.dw #0x0000
   429F 00 00               165 	.dw #0x0000
   42A1 00 00               166 	.dw #0x0000
   42A3 01 00               167 	.dw #0x0001
   42A5 01 00               168 	.dw #0x0001
   42A7 00 00               169 	.dw #0x0000
   42A9 00 00               170 	.dw #0x0000
   42AB 00 00               171 	.dw #0x0000
   42AD 00 00               172 	.dw #0x0000
   42AF 00 00               173 	.dw #0x0000
   42B1 00 00               174 	.dw #0x0000
   42B3 00 00               175 	.dw #0x0000
   42B5 00 00               176 	.dw #0x0000
   42B7 00 00               177 	.dw #0x0000
   42B9 00 00               178 	.dw #0x0000
   42BB 00 00               179 	.dw #0x0000
   42BD 00 00               180 	.dw #0x0000
   42BF 00 00               181 	.dw #0x0000
   42C1 00 00               182 	.dw #0x0000
   42C3 01 00               183 	.dw #0x0001
   42C5 00 00               184 	.dw #0x0000
   42C7 00 00               185 	.dw #0x0000
   42C9 00 00               186 	.dw #0x0000
   42CB 00 00               187 	.dw #0x0000
   42CD 00 00               188 	.dw #0x0000
   42CF 00 00               189 	.dw #0x0000
   42D1 00 00               190 	.dw #0x0000
   42D3 00 00               191 	.dw #0x0000
   42D5 00 00               192 	.dw #0x0000
   42D7 00 00               193 	.dw #0x0000
   42D9 00 00               194 	.dw #0x0000
   42DB 00 00               195 	.dw #0x0000
   42DD 00 00               196 	.dw #0x0000
   42DF 00 00               197 	.dw #0x0000
   42E1 00 00               198 	.dw #0x0000
   42E3 01 00               199 	.dw #0x0001
   42E5 01 00               200 	.dw #0x0001
   42E7 00 00               201 	.dw #0x0000
   42E9 00 00               202 	.dw #0x0000
   42EB 00 00               203 	.dw #0x0000
   42ED 00 00               204 	.dw #0x0000
   42EF 00 00               205 	.dw #0x0000
   42F1 00 00               206 	.dw #0x0000
   42F3 00 00               207 	.dw #0x0000
   42F5 00 00               208 	.dw #0x0000
   42F7 00 00               209 	.dw #0x0000
   42F9 00 00               210 	.dw #0x0000
   42FB 00 00               211 	.dw #0x0000
   42FD 00 00               212 	.dw #0x0000
   42FF 00 00               213 	.dw #0x0000
   4301 00 00               214 	.dw #0x0000
   4303 01 00               215 	.dw #0x0001
   4305 01 00               216 	.dw #0x0001
   4307 00 00               217 	.dw #0x0000
   4309 00 00               218 	.dw #0x0000
   430B 00 00               219 	.dw #0x0000
   430D 00 00               220 	.dw #0x0000
   430F 00 00               221 	.dw #0x0000
   4311 00 00               222 	.dw #0x0000
   4313 00 00               223 	.dw #0x0000
   4315 00 00               224 	.dw #0x0000
   4317 00 00               225 	.dw #0x0000
   4319 00 00               226 	.dw #0x0000
   431B 00 00               227 	.dw #0x0000
   431D 00 00               228 	.dw #0x0000
   431F 00 00               229 	.dw #0x0000
   4321 00 00               230 	.dw #0x0000
   4323 01 00               231 	.dw #0x0001
   4325 01 00               232 	.dw #0x0001
   4327 00 00               233 	.dw #0x0000
   4329 00 00               234 	.dw #0x0000
   432B 00 00               235 	.dw #0x0000
   432D 00 00               236 	.dw #0x0000
   432F 00 00               237 	.dw #0x0000
   4331 00 00               238 	.dw #0x0000
   4333 00 00               239 	.dw #0x0000
   4335 00 00               240 	.dw #0x0000
   4337 00 00               241 	.dw #0x0000
   4339 00 00               242 	.dw #0x0000
   433B 00 00               243 	.dw #0x0000
   433D 00 00               244 	.dw #0x0000
   433F 00 00               245 	.dw #0x0000
   4341 00 00               246 	.dw #0x0000
   4343 01 00               247 	.dw #0x0001
   4345 01 00               248 	.dw #0x0001
   4347 01 00               249 	.dw #0x0001
   4349 01 00               250 	.dw #0x0001
   434B 01 00               251 	.dw #0x0001
   434D 01 00               252 	.dw #0x0001
   434F 01 00               253 	.dw #0x0001
   4351 01 00               254 	.dw #0x0001
   4353 01 00               255 	.dw #0x0001
   4355 01 00               256 	.dw #0x0001
   4357 01 00               257 	.dw #0x0001
   4359 01 00               258 	.dw #0x0001
   435B 01 00               259 	.dw #0x0001
   435D 01 00               260 	.dw #0x0001
   435F 01 00               261 	.dw #0x0001
   4361 01 00               262 	.dw #0x0001
   4363 01 00               263 	.dw #0x0001
   4365                     264 _mapa2:
   4365 01 00               265 	.dw #0x0001
   4367 01 00               266 	.dw #0x0001
   4369 01 00               267 	.dw #0x0001
   436B 01 00               268 	.dw #0x0001
   436D 01 00               269 	.dw #0x0001
   436F 01 00               270 	.dw #0x0001
   4371 01 00               271 	.dw #0x0001
   4373 01 00               272 	.dw #0x0001
   4375 01 00               273 	.dw #0x0001
   4377 01 00               274 	.dw #0x0001
   4379 01 00               275 	.dw #0x0001
   437B 01 00               276 	.dw #0x0001
   437D 01 00               277 	.dw #0x0001
   437F 01 00               278 	.dw #0x0001
   4381 01 00               279 	.dw #0x0001
   4383 01 00               280 	.dw #0x0001
   4385 01 00               281 	.dw #0x0001
   4387 01 00               282 	.dw #0x0001
   4389 01 00               283 	.dw #0x0001
   438B 00 00               284 	.dw #0x0000
   438D 00 00               285 	.dw #0x0000
   438F 00 00               286 	.dw #0x0000
   4391 00 00               287 	.dw #0x0000
   4393 00 00               288 	.dw #0x0000
   4395 00 00               289 	.dw #0x0000
   4397 00 00               290 	.dw #0x0000
   4399 00 00               291 	.dw #0x0000
   439B 00 00               292 	.dw #0x0000
   439D 00 00               293 	.dw #0x0000
   439F 01 00               294 	.dw #0x0001
   43A1 01 00               295 	.dw #0x0001
   43A3 01 00               296 	.dw #0x0001
   43A5 01 00               297 	.dw #0x0001
   43A7 01 00               298 	.dw #0x0001
   43A9 01 00               299 	.dw #0x0001
   43AB 00 00               300 	.dw #0x0000
   43AD 00 00               301 	.dw #0x0000
   43AF 00 00               302 	.dw #0x0000
   43B1 00 00               303 	.dw #0x0000
   43B3 00 00               304 	.dw #0x0000
   43B5 00 00               305 	.dw #0x0000
   43B7 00 00               306 	.dw #0x0000
   43B9 00 00               307 	.dw #0x0000
   43BB 00 00               308 	.dw #0x0000
   43BD 00 00               309 	.dw #0x0000
   43BF 01 00               310 	.dw #0x0001
   43C1 01 00               311 	.dw #0x0001
   43C3 01 00               312 	.dw #0x0001
   43C5 01 00               313 	.dw #0x0001
   43C7 00 00               314 	.dw #0x0000
   43C9 01 00               315 	.dw #0x0001
   43CB 00 00               316 	.dw #0x0000
   43CD 00 00               317 	.dw #0x0000
   43CF 00 00               318 	.dw #0x0000
   43D1 00 00               319 	.dw #0x0000
   43D3 01 00               320 	.dw #0x0001
   43D5 01 00               321 	.dw #0x0001
   43D7 01 00               322 	.dw #0x0001
   43D9 00 00               323 	.dw #0x0000
   43DB 00 00               324 	.dw #0x0000
   43DD 00 00               325 	.dw #0x0000
   43DF 01 00               326 	.dw #0x0001
   43E1 00 00               327 	.dw #0x0000
   43E3 01 00               328 	.dw #0x0001
   43E5 01 00               329 	.dw #0x0001
   43E7 00 00               330 	.dw #0x0000
   43E9 01 00               331 	.dw #0x0001
   43EB 00 00               332 	.dw #0x0000
   43ED 00 00               333 	.dw #0x0000
   43EF 00 00               334 	.dw #0x0000
   43F1 00 00               335 	.dw #0x0000
   43F3 01 00               336 	.dw #0x0001
   43F5 01 00               337 	.dw #0x0001
   43F7 01 00               338 	.dw #0x0001
   43F9 00 00               339 	.dw #0x0000
   43FB 00 00               340 	.dw #0x0000
   43FD 00 00               341 	.dw #0x0000
   43FF 01 00               342 	.dw #0x0001
   4401 00 00               343 	.dw #0x0000
   4403 01 00               344 	.dw #0x0001
   4405 00 00               345 	.dw #0x0000
   4407 00 00               346 	.dw #0x0000
   4409 01 00               347 	.dw #0x0001
   440B 00 00               348 	.dw #0x0000
   440D 00 00               349 	.dw #0x0000
   440F 00 00               350 	.dw #0x0000
   4411 00 00               351 	.dw #0x0000
   4413 01 00               352 	.dw #0x0001
   4415 00 00               353 	.dw #0x0000
   4417 01 00               354 	.dw #0x0001
   4419 00 00               355 	.dw #0x0000
   441B 00 00               356 	.dw #0x0000
   441D 00 00               357 	.dw #0x0000
   441F 01 00               358 	.dw #0x0001
   4421 00 00               359 	.dw #0x0000
   4423 01 00               360 	.dw #0x0001
   4425 01 00               361 	.dw #0x0001
   4427 00 00               362 	.dw #0x0000
   4429 01 00               363 	.dw #0x0001
   442B 01 00               364 	.dw #0x0001
   442D 01 00               365 	.dw #0x0001
   442F 01 00               366 	.dw #0x0001
   4431 01 00               367 	.dw #0x0001
   4433 00 00               368 	.dw #0x0000
   4435 00 00               369 	.dw #0x0000
   4437 00 00               370 	.dw #0x0000
   4439 01 00               371 	.dw #0x0001
   443B 01 00               372 	.dw #0x0001
   443D 01 00               373 	.dw #0x0001
   443F 01 00               374 	.dw #0x0001
   4441 00 00               375 	.dw #0x0000
   4443 01 00               376 	.dw #0x0001
   4445 01 00               377 	.dw #0x0001
   4447 00 00               378 	.dw #0x0000
   4449 01 00               379 	.dw #0x0001
   444B 01 00               380 	.dw #0x0001
   444D 01 00               381 	.dw #0x0001
   444F 01 00               382 	.dw #0x0001
   4451 01 00               383 	.dw #0x0001
   4453 00 00               384 	.dw #0x0000
   4455 00 00               385 	.dw #0x0000
   4457 00 00               386 	.dw #0x0000
   4459 01 00               387 	.dw #0x0001
   445B 01 00               388 	.dw #0x0001
   445D 01 00               389 	.dw #0x0001
   445F 01 00               390 	.dw #0x0001
   4461 00 00               391 	.dw #0x0000
   4463 01 00               392 	.dw #0x0001
   4465 01 00               393 	.dw #0x0001
   4467 00 00               394 	.dw #0x0000
   4469 00 00               395 	.dw #0x0000
   446B 00 00               396 	.dw #0x0000
   446D 00 00               397 	.dw #0x0000
   446F 00 00               398 	.dw #0x0000
   4471 00 00               399 	.dw #0x0000
   4473 00 00               400 	.dw #0x0000
   4475 00 00               401 	.dw #0x0000
   4477 00 00               402 	.dw #0x0000
   4479 00 00               403 	.dw #0x0000
   447B 00 00               404 	.dw #0x0000
   447D 00 00               405 	.dw #0x0000
   447F 00 00               406 	.dw #0x0000
   4481 00 00               407 	.dw #0x0000
   4483 01 00               408 	.dw #0x0001
   4485 01 00               409 	.dw #0x0001
   4487 01 00               410 	.dw #0x0001
   4489 01 00               411 	.dw #0x0001
   448B 01 00               412 	.dw #0x0001
   448D 01 00               413 	.dw #0x0001
   448F 01 00               414 	.dw #0x0001
   4491 01 00               415 	.dw #0x0001
   4493 01 00               416 	.dw #0x0001
   4495 01 00               417 	.dw #0x0001
   4497 01 00               418 	.dw #0x0001
   4499 01 00               419 	.dw #0x0001
   449B 01 00               420 	.dw #0x0001
   449D 01 00               421 	.dw #0x0001
   449F 01 00               422 	.dw #0x0001
   44A1 01 00               423 	.dw #0x0001
   44A3 01 00               424 	.dw #0x0001
   44A5                     425 _g_palette:
   44A5 00                  426 	.db #0x00	; 0
   44A6 1A                  427 	.db #0x1A	; 26
   44A7 06                  428 	.db #0x06	; 6
   44A8 12                  429 	.db #0x12	; 18
                            430 ;src/main.c:75: void menu(){
                            431 ;	---------------------------------
                            432 ; Function menu
                            433 ; ---------------------------------
   44A9                     434 _menu::
                            435 ;src/main.c:77: cpct_clearScreen(0);
   44A9 21 00 40      [10]  436 	ld	hl,#0x4000
   44AC E5            [11]  437 	push	hl
   44AD AF            [ 4]  438 	xor	a, a
   44AE F5            [11]  439 	push	af
   44AF 33            [ 6]  440 	inc	sp
   44B0 26 C0         [ 7]  441 	ld	h, #0xC0
   44B2 E5            [11]  442 	push	hl
   44B3 CD 2A 4C      [17]  443 	call	_cpct_memset
                            444 ;src/main.c:79: memptr = cpct_getScreenPtr(VMEM,20,10);
   44B6 21 14 0A      [10]  445 	ld	hl,#0x0A14
   44B9 E5            [11]  446 	push	hl
   44BA 21 00 C0      [10]  447 	ld	hl,#0xC000
   44BD E5            [11]  448 	push	hl
   44BE CD 04 4D      [17]  449 	call	_cpct_getScreenPtr
                            450 ;src/main.c:80: cpct_drawStringM0("MENU",memptr,2,3);
   44C1 EB            [ 4]  451 	ex	de,hl
   44C2 01 FE 44      [10]  452 	ld	bc,#___str_0+0
   44C5 21 02 03      [10]  453 	ld	hl,#0x0302
   44C8 E5            [11]  454 	push	hl
   44C9 D5            [11]  455 	push	de
   44CA C5            [11]  456 	push	bc
   44CB CD A0 4A      [17]  457 	call	_cpct_drawStringM0
   44CE 21 06 00      [10]  458 	ld	hl,#6
   44D1 39            [11]  459 	add	hl,sp
   44D2 F9            [ 6]  460 	ld	sp,hl
                            461 ;src/main.c:82: memptr = cpct_getScreenPtr(VMEM,18,180);
   44D3 21 12 B4      [10]  462 	ld	hl,#0xB412
   44D6 E5            [11]  463 	push	hl
   44D7 21 00 C0      [10]  464 	ld	hl,#0xC000
   44DA E5            [11]  465 	push	hl
   44DB CD 04 4D      [17]  466 	call	_cpct_getScreenPtr
                            467 ;src/main.c:83: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   44DE EB            [ 4]  468 	ex	de,hl
   44DF 01 03 45      [10]  469 	ld	bc,#___str_1+0
   44E2 21 04 05      [10]  470 	ld	hl,#0x0504
   44E5 E5            [11]  471 	push	hl
   44E6 D5            [11]  472 	push	de
   44E7 C5            [11]  473 	push	bc
   44E8 CD A0 4A      [17]  474 	call	_cpct_drawStringM0
   44EB 21 06 00      [10]  475 	ld	hl,#6
   44EE 39            [11]  476 	add	hl,sp
   44EF F9            [ 6]  477 	ld	sp,hl
                            478 ;src/main.c:85: do{
   44F0                     479 00101$:
                            480 ;src/main.c:86: cpct_scanKeyboard_f();
   44F0 CD 36 4A      [17]  481 	call	_cpct_scanKeyboard_f
                            482 ;src/main.c:87: }while(!cpct_isKeyPressed(Key_Enter));
   44F3 21 00 40      [10]  483 	ld	hl,#0x4000
   44F6 CD 2A 4A      [17]  484 	call	_cpct_isKeyPressed
   44F9 7D            [ 4]  485 	ld	a,l
   44FA B7            [ 4]  486 	or	a, a
   44FB 28 F3         [12]  487 	jr	Z,00101$
   44FD C9            [10]  488 	ret
   44FE                     489 ___str_0:
   44FE 4D 45 4E 55         490 	.ascii "MENU"
   4502 00                  491 	.db 0x00
   4503                     492 ___str_1:
   4503 50 75 6C 73 61 20   493 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   450E 00                  494 	.db 0x00
                            495 ;src/main.c:93: void drawMap(int t){
                            496 ;	---------------------------------
                            497 ; Function drawMap
                            498 ; ---------------------------------
   450F                     499 _drawMap::
   450F DD E5         [15]  500 	push	ix
   4511 DD 21 00 00   [14]  501 	ld	ix,#0
   4515 DD 39         [15]  502 	add	ix,sp
   4517 21 FA FF      [10]  503 	ld	hl,#-6
   451A 39            [11]  504 	add	hl,sp
   451B F9            [ 6]  505 	ld	sp,hl
                            506 ;src/main.c:97: if(t == 1){ 
   451C DD 7E 04      [19]  507 	ld	a,4 (ix)
   451F 3D            [ 4]  508 	dec	a
   4520 20 3A         [12]  509 	jr	NZ,00103$
   4522 DD 7E 05      [19]  510 	ld	a,5 (ix)
   4525 B7            [ 4]  511 	or	a, a
   4526 20 34         [12]  512 	jr	NZ,00103$
                            513 ;src/main.c:98: for(x=0;x<height;x++){
   4528 11 00 00      [10]  514 	ld	de,#0x0000
   452B                     515 00111$:
                            516 ;src/main.c:99: scene[x] = mapa1[x];
   452B 6B            [ 4]  517 	ld	l, e
   452C 62            [ 4]  518 	ld	h, d
   452D 29            [11]  519 	add	hl, hl
   452E 3E 6C         [ 7]  520 	ld	a,#<(_scene)
   4530 85            [ 4]  521 	add	a, l
   4531 DD 77 FE      [19]  522 	ld	-2 (ix),a
   4534 3E 4D         [ 7]  523 	ld	a,#>(_scene)
   4536 8C            [ 4]  524 	adc	a, h
   4537 DD 77 FF      [19]  525 	ld	-1 (ix),a
   453A 6B            [ 4]  526 	ld	l, e
   453B 62            [ 4]  527 	ld	h, d
   453C 29            [11]  528 	add	hl, hl
   453D 29            [11]  529 	add	hl, hl
   453E 29            [11]  530 	add	hl, hl
   453F 29            [11]  531 	add	hl, hl
   4540 29            [11]  532 	add	hl, hl
   4541 01 25 42      [10]  533 	ld	bc,#_mapa1
   4544 09            [11]  534 	add	hl,bc
   4545 45            [ 4]  535 	ld	b,l
   4546 4C            [ 4]  536 	ld	c,h
   4547 DD 6E FE      [19]  537 	ld	l,-2 (ix)
   454A DD 66 FF      [19]  538 	ld	h,-1 (ix)
   454D 70            [ 7]  539 	ld	(hl),b
   454E 23            [ 6]  540 	inc	hl
   454F 71            [ 7]  541 	ld	(hl),c
                            542 ;src/main.c:98: for(x=0;x<height;x++){
   4550 13            [ 6]  543 	inc	de
   4551 7B            [ 4]  544 	ld	a,e
   4552 D6 0A         [ 7]  545 	sub	a, #0x0A
   4554 7A            [ 4]  546 	ld	a,d
   4555 17            [ 4]  547 	rla
   4556 3F            [ 4]  548 	ccf
   4557 1F            [ 4]  549 	rra
   4558 DE 80         [ 7]  550 	sbc	a, #0x80
   455A 38 CF         [12]  551 	jr	C,00111$
   455C                     552 00103$:
                            553 ;src/main.c:103: if(t == 2){ 
   455C DD 7E 04      [19]  554 	ld	a,4 (ix)
   455F D6 02         [ 7]  555 	sub	a, #0x02
   4561 20 30         [12]  556 	jr	NZ,00128$
   4563 DD 7E 05      [19]  557 	ld	a,5 (ix)
   4566 B7            [ 4]  558 	or	a, a
   4567 20 2A         [12]  559 	jr	NZ,00128$
                            560 ;src/main.c:104: for(x=0;x<height;x++){
   4569 01 00 00      [10]  561 	ld	bc,#0x0000
   456C                     562 00113$:
                            563 ;src/main.c:105: scene[x] = mapa2[x];
   456C 69            [ 4]  564 	ld	l, c
   456D 60            [ 4]  565 	ld	h, b
   456E 29            [11]  566 	add	hl, hl
   456F FD 21 6C 4D   [14]  567 	ld	iy,#_scene
   4573 EB            [ 4]  568 	ex	de,hl
   4574 FD 19         [15]  569 	add	iy, de
   4576 69            [ 4]  570 	ld	l, c
   4577 60            [ 4]  571 	ld	h, b
   4578 29            [11]  572 	add	hl, hl
   4579 29            [11]  573 	add	hl, hl
   457A 29            [11]  574 	add	hl, hl
   457B 29            [11]  575 	add	hl, hl
   457C 29            [11]  576 	add	hl, hl
   457D 11 65 43      [10]  577 	ld	de,#_mapa2
   4580 19            [11]  578 	add	hl,de
   4581 FD 75 00      [19]  579 	ld	0 (iy),l
   4584 FD 74 01      [19]  580 	ld	1 (iy),h
                            581 ;src/main.c:104: for(x=0;x<height;x++){
   4587 03            [ 6]  582 	inc	bc
   4588 79            [ 4]  583 	ld	a,c
   4589 D6 0A         [ 7]  584 	sub	a, #0x0A
   458B 78            [ 4]  585 	ld	a,b
   458C 17            [ 4]  586 	rla
   458D 3F            [ 4]  587 	ccf
   458E 1F            [ 4]  588 	rra
   458F DE 80         [ 7]  589 	sbc	a, #0x80
   4591 38 D9         [12]  590 	jr	C,00113$
                            591 ;src/main.c:109: for(posY=0; posY<height;posY++){
   4593                     592 00128$:
   4593 DD 36 FC 00   [19]  593 	ld	-4 (ix),#0x00
   4597 DD 36 FD 00   [19]  594 	ld	-3 (ix),#0x00
                            595 ;src/main.c:110: for(posX=0; posX<width;posX++){
   459B                     596 00126$:
   459B C1            [10]  597 	pop	bc
   459C E1            [10]  598 	pop	hl
   459D E5            [11]  599 	push	hl
   459E C5            [11]  600 	push	bc
   459F 29            [11]  601 	add	hl, hl
   45A0 3E 6C         [ 7]  602 	ld	a,#<(_scene)
   45A2 85            [ 4]  603 	add	a, l
   45A3 DD 77 FE      [19]  604 	ld	-2 (ix),a
   45A6 3E 4D         [ 7]  605 	ld	a,#>(_scene)
   45A8 8C            [ 4]  606 	adc	a, h
   45A9 DD 77 FF      [19]  607 	ld	-1 (ix),a
   45AC 11 00 00      [10]  608 	ld	de,#0x0000
   45AF                     609 00115$:
                            610 ;src/main.c:111: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   45AF DD 7E FC      [19]  611 	ld	a,-4 (ix)
   45B2 4F            [ 4]  612 	ld	c,a
   45B3 87            [ 4]  613 	add	a, a
   45B4 87            [ 4]  614 	add	a, a
   45B5 81            [ 4]  615 	add	a, c
   45B6 87            [ 4]  616 	add	a, a
   45B7 87            [ 4]  617 	add	a, a
   45B8 47            [ 4]  618 	ld	b,a
   45B9 4B            [ 4]  619 	ld	c,e
   45BA 79            [ 4]  620 	ld	a,c
   45BB 87            [ 4]  621 	add	a, a
   45BC 87            [ 4]  622 	add	a, a
   45BD 81            [ 4]  623 	add	a, c
   45BE D5            [11]  624 	push	de
   45BF C5            [11]  625 	push	bc
   45C0 33            [ 6]  626 	inc	sp
   45C1 F5            [11]  627 	push	af
   45C2 33            [ 6]  628 	inc	sp
   45C3 21 00 C0      [10]  629 	ld	hl,#0xC000
   45C6 E5            [11]  630 	push	hl
   45C7 CD 04 4D      [17]  631 	call	_cpct_getScreenPtr
   45CA D1            [10]  632 	pop	de
   45CB 33            [ 6]  633 	inc	sp
   45CC 33            [ 6]  634 	inc	sp
   45CD E5            [11]  635 	push	hl
                            636 ;src/main.c:112: if(scene[posY][posX] == 1){
   45CE DD 6E FE      [19]  637 	ld	l,-2 (ix)
   45D1 DD 66 FF      [19]  638 	ld	h,-1 (ix)
   45D4 4E            [ 7]  639 	ld	c,(hl)
   45D5 23            [ 6]  640 	inc	hl
   45D6 46            [ 7]  641 	ld	b,(hl)
   45D7 6B            [ 4]  642 	ld	l, e
   45D8 62            [ 4]  643 	ld	h, d
   45D9 29            [11]  644 	add	hl, hl
   45DA 09            [11]  645 	add	hl,bc
   45DB 46            [ 7]  646 	ld	b,(hl)
   45DC 23            [ 6]  647 	inc	hl
   45DD 66            [ 7]  648 	ld	h,(hl)
   45DE 10 17         [13]  649 	djnz	00116$
   45E0 7C            [ 4]  650 	ld	a,h
   45E1 B7            [ 4]  651 	or	a, a
   45E2 20 13         [12]  652 	jr	NZ,00116$
                            653 ;src/main.c:113: cpct_drawSolidBox(memptr, 3, 5, 20);
   45E4 C1            [10]  654 	pop	bc
   45E5 C5            [11]  655 	push	bc
   45E6 D5            [11]  656 	push	de
   45E7 21 05 14      [10]  657 	ld	hl,#0x1405
   45EA E5            [11]  658 	push	hl
   45EB 3E 03         [ 7]  659 	ld	a,#0x03
   45ED F5            [11]  660 	push	af
   45EE 33            [ 6]  661 	inc	sp
   45EF C5            [11]  662 	push	bc
   45F0 CD 4C 4C      [17]  663 	call	_cpct_drawSolidBox
   45F3 F1            [10]  664 	pop	af
   45F4 F1            [10]  665 	pop	af
   45F5 33            [ 6]  666 	inc	sp
   45F6 D1            [10]  667 	pop	de
   45F7                     668 00116$:
                            669 ;src/main.c:110: for(posX=0; posX<width;posX++){
   45F7 13            [ 6]  670 	inc	de
   45F8 7B            [ 4]  671 	ld	a,e
   45F9 D6 10         [ 7]  672 	sub	a, #0x10
   45FB 7A            [ 4]  673 	ld	a,d
   45FC 17            [ 4]  674 	rla
   45FD 3F            [ 4]  675 	ccf
   45FE 1F            [ 4]  676 	rra
   45FF DE 80         [ 7]  677 	sbc	a, #0x80
   4601 38 AC         [12]  678 	jr	C,00115$
                            679 ;src/main.c:109: for(posY=0; posY<height;posY++){
   4603 DD 34 FC      [23]  680 	inc	-4 (ix)
   4606 20 03         [12]  681 	jr	NZ,00163$
   4608 DD 34 FD      [23]  682 	inc	-3 (ix)
   460B                     683 00163$:
   460B DD 7E FC      [19]  684 	ld	a,-4 (ix)
   460E D6 0A         [ 7]  685 	sub	a, #0x0A
   4610 DD 7E FD      [19]  686 	ld	a,-3 (ix)
   4613 17            [ 4]  687 	rla
   4614 3F            [ 4]  688 	ccf
   4615 1F            [ 4]  689 	rra
   4616 DE 80         [ 7]  690 	sbc	a, #0x80
   4618 DA 9B 45      [10]  691 	jp	C,00126$
   461B DD F9         [10]  692 	ld	sp, ix
   461D DD E1         [14]  693 	pop	ix
   461F C9            [10]  694 	ret
                            695 ;src/main.c:123: void checkColisions(u8 *x,u8 *y, u8 lx, u8 ly){
                            696 ;	---------------------------------
                            697 ; Function checkColisions
                            698 ; ---------------------------------
   4620                     699 _checkColisions::
   4620 DD E5         [15]  700 	push	ix
   4622 DD 21 00 00   [14]  701 	ld	ix,#0
   4626 DD 39         [15]  702 	add	ix,sp
   4628 21 F8 FF      [10]  703 	ld	hl,#-8
   462B 39            [11]  704 	add	hl,sp
   462C F9            [ 6]  705 	ld	sp,hl
                            706 ;src/main.c:125: u8 *posX = x;
   462D DD 7E 04      [19]  707 	ld	a,4 (ix)
   4630 DD 77 FA      [19]  708 	ld	-6 (ix),a
   4633 DD 7E 05      [19]  709 	ld	a,5 (ix)
   4636 DD 77 FB      [19]  710 	ld	-5 (ix),a
                            711 ;src/main.c:126: u8 *posY = y;
   4639 DD 7E 06      [19]  712 	ld	a,6 (ix)
   463C DD 77 F8      [19]  713 	ld	-8 (ix),a
   463F DD 7E 07      [19]  714 	ld	a,7 (ix)
   4642 DD 77 F9      [19]  715 	ld	-7 (ix),a
                            716 ;src/main.c:137: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
   4645 E1            [10]  717 	pop	hl
   4646 E5            [11]  718 	push	hl
   4647 5E            [ 7]  719 	ld	e,(hl)
   4648 D5            [11]  720 	push	de
   4649 16 14         [ 7]  721 	ld	d,#0x14
   464B D5            [11]  722 	push	de
   464C CD 69 4B      [17]  723 	call	__divuchar
   464F F1            [10]  724 	pop	af
   4650 D1            [10]  725 	pop	de
   4651 26 00         [ 7]  726 	ld	h,#0x00
   4653 29            [11]  727 	add	hl, hl
   4654 01 6C 4D      [10]  728 	ld	bc,#_scene
   4657 09            [11]  729 	add	hl,bc
   4658 4E            [ 7]  730 	ld	c,(hl)
   4659 23            [ 6]  731 	inc	hl
   465A 46            [ 7]  732 	ld	b,(hl)
   465B DD 6E FA      [19]  733 	ld	l,-6 (ix)
   465E DD 66 FB      [19]  734 	ld	h,-5 (ix)
   4661 56            [ 7]  735 	ld	d,(hl)
   4662 C5            [11]  736 	push	bc
   4663 D5            [11]  737 	push	de
   4664 3E 05         [ 7]  738 	ld	a,#0x05
   4666 F5            [11]  739 	push	af
   4667 33            [ 6]  740 	inc	sp
   4668 D5            [11]  741 	push	de
   4669 33            [ 6]  742 	inc	sp
   466A CD 69 4B      [17]  743 	call	__divuchar
   466D F1            [10]  744 	pop	af
   466E D1            [10]  745 	pop	de
   466F C1            [10]  746 	pop	bc
   4670 26 00         [ 7]  747 	ld	h,#0x00
   4672 29            [11]  748 	add	hl, hl
   4673 DD 75 FE      [19]  749 	ld	-2 (ix),l
   4676 DD 74 FF      [19]  750 	ld	-1 (ix),h
   4679 DD 6E FE      [19]  751 	ld	l,-2 (ix)
   467C DD 66 FF      [19]  752 	ld	h,-1 (ix)
   467F 09            [11]  753 	add	hl,bc
   4680 7E            [ 7]  754 	ld	a, (hl)
   4681 23            [ 6]  755 	inc	hl
   4682 66            [ 7]  756 	ld	h,(hl)
   4683 6F            [ 4]  757 	ld	l,a
   4684 2D            [ 4]  758 	dec	l
   4685 20 04         [12]  759 	jr	NZ,00120$
   4687 7C            [ 4]  760 	ld	a,h
   4688 B7            [ 4]  761 	or	a, a
   4689 28 69         [12]  762 	jr	Z,00101$
   468B                     763 00120$:
                            764 ;src/main.c:138: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
   468B 6A            [ 4]  765 	ld	l,d
   468C 26 00         [ 7]  766 	ld	h,#0x00
   468E 23            [ 6]  767 	inc	hl
   468F 23            [ 6]  768 	inc	hl
   4690 23            [ 6]  769 	inc	hl
   4691 E5            [11]  770 	push	hl
   4692 FD E1         [14]  771 	pop	iy
   4694 C5            [11]  772 	push	bc
   4695 D5            [11]  773 	push	de
   4696 21 05 00      [10]  774 	ld	hl,#0x0005
   4699 E5            [11]  775 	push	hl
   469A FD E5         [15]  776 	push	iy
   469C CD 24 4D      [17]  777 	call	__divsint
   469F F1            [10]  778 	pop	af
   46A0 F1            [10]  779 	pop	af
   46A1 D1            [10]  780 	pop	de
   46A2 C1            [10]  781 	pop	bc
   46A3 29            [11]  782 	add	hl, hl
   46A4 DD 75 FC      [19]  783 	ld	-4 (ix),l
   46A7 DD 74 FD      [19]  784 	ld	-3 (ix),h
   46AA DD 6E FC      [19]  785 	ld	l,-4 (ix)
   46AD DD 66 FD      [19]  786 	ld	h,-3 (ix)
   46B0 09            [11]  787 	add	hl,bc
   46B1 4E            [ 7]  788 	ld	c,(hl)
   46B2 23            [ 6]  789 	inc	hl
   46B3 66            [ 7]  790 	ld	h,(hl)
   46B4 0D            [ 4]  791 	dec	c
   46B5 20 04         [12]  792 	jr	NZ,00121$
   46B7 7C            [ 4]  793 	ld	a,h
   46B8 B7            [ 4]  794 	or	a, a
   46B9 28 39         [12]  795 	jr	Z,00101$
   46BB                     796 00121$:
                            797 ;src/main.c:139: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
   46BB 16 00         [ 7]  798 	ld	d,#0x00
   46BD 21 0E 00      [10]  799 	ld	hl,#0x000E
   46C0 19            [11]  800 	add	hl,de
   46C1 01 14 00      [10]  801 	ld	bc,#0x0014
   46C4 C5            [11]  802 	push	bc
   46C5 E5            [11]  803 	push	hl
   46C6 CD 24 4D      [17]  804 	call	__divsint
   46C9 F1            [10]  805 	pop	af
   46CA F1            [10]  806 	pop	af
   46CB 29            [11]  807 	add	hl, hl
   46CC 11 6C 4D      [10]  808 	ld	de,#_scene
   46CF 19            [11]  809 	add	hl,de
   46D0 5E            [ 7]  810 	ld	e,(hl)
   46D1 23            [ 6]  811 	inc	hl
   46D2 56            [ 7]  812 	ld	d,(hl)
   46D3 DD 6E FE      [19]  813 	ld	l,-2 (ix)
   46D6 DD 66 FF      [19]  814 	ld	h,-1 (ix)
   46D9 19            [11]  815 	add	hl,de
   46DA 46            [ 7]  816 	ld	b,(hl)
   46DB 23            [ 6]  817 	inc	hl
   46DC 66            [ 7]  818 	ld	h,(hl)
   46DD 10 04         [13]  819 	djnz	00122$
   46DF 7C            [ 4]  820 	ld	a,h
   46E0 B7            [ 4]  821 	or	a, a
   46E1 28 11         [12]  822 	jr	Z,00101$
   46E3                     823 00122$:
                            824 ;src/main.c:140: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
   46E3 DD 6E FC      [19]  825 	ld	l,-4 (ix)
   46E6 DD 66 FD      [19]  826 	ld	h,-3 (ix)
   46E9 19            [11]  827 	add	hl,de
   46EA 5E            [ 7]  828 	ld	e,(hl)
   46EB 23            [ 6]  829 	inc	hl
   46EC 66            [ 7]  830 	ld	h,(hl)
   46ED 1D            [ 4]  831 	dec	e
   46EE 20 14         [12]  832 	jr	NZ,00106$
   46F0 7C            [ 4]  833 	ld	a,h
   46F1 B7            [ 4]  834 	or	a, a
   46F2 20 10         [12]  835 	jr	NZ,00106$
   46F4                     836 00101$:
                            837 ;src/main.c:144: *posX=lx;
   46F4 DD 6E FA      [19]  838 	ld	l,-6 (ix)
   46F7 DD 66 FB      [19]  839 	ld	h,-5 (ix)
   46FA DD 7E 08      [19]  840 	ld	a,8 (ix)
   46FD 77            [ 7]  841 	ld	(hl),a
                            842 ;src/main.c:145: *posY=ly;
   46FE E1            [10]  843 	pop	hl
   46FF E5            [11]  844 	push	hl
   4700 DD 7E 09      [19]  845 	ld	a,9 (ix)
   4703 77            [ 7]  846 	ld	(hl),a
   4704                     847 00106$:
   4704 DD F9         [10]  848 	ld	sp, ix
   4706 DD E1         [14]  849 	pop	ix
   4708 C9            [10]  850 	ret
                            851 ;src/main.c:152: void game(){
                            852 ;	---------------------------------
                            853 ; Function game
                            854 ; ---------------------------------
   4709                     855 _game::
   4709 DD E5         [15]  856 	push	ix
   470B DD 21 00 00   [14]  857 	ld	ix,#0
   470F DD 39         [15]  858 	add	ix,sp
   4711 21 F3 FF      [10]  859 	ld	hl,#-13
   4714 39            [11]  860 	add	hl,sp
   4715 F9            [ 6]  861 	ld	sp,hl
                            862 ;src/main.c:153: TPlayer p = { 0,100 };
   4716 21 01 00      [10]  863 	ld	hl,#0x0001
   4719 39            [11]  864 	add	hl,sp
   471A 36 00         [10]  865 	ld	(hl),#0x00
   471C 21 01 00      [10]  866 	ld	hl,#0x0001
   471F 39            [11]  867 	add	hl,sp
   4720 4D            [ 4]  868 	ld	c,l
   4721 44            [ 4]  869 	ld	b,h
   4722 21 01 00      [10]  870 	ld	hl,#0x0001
   4725 09            [11]  871 	add	hl,bc
   4726 DD 75 FE      [19]  872 	ld	-2 (ix),l
   4729 DD 74 FF      [19]  873 	ld	-1 (ix),h
   472C DD 6E FE      [19]  874 	ld	l,-2 (ix)
   472F DD 66 FF      [19]  875 	ld	h,-1 (ix)
   4732 36 64         [10]  876 	ld	(hl),#0x64
                            877 ;src/main.c:155: int i =1;
   4734 11 01 00      [10]  878 	ld	de,#0x0001
                            879 ;src/main.c:160: cpct_clearScreen(0);
   4737 C5            [11]  880 	push	bc
   4738 D5            [11]  881 	push	de
   4739 21 00 40      [10]  882 	ld	hl,#0x4000
   473C E5            [11]  883 	push	hl
   473D AF            [ 4]  884 	xor	a, a
   473E F5            [11]  885 	push	af
   473F 33            [ 6]  886 	inc	sp
   4740 26 C0         [ 7]  887 	ld	h, #0xC0
   4742 E5            [11]  888 	push	hl
   4743 CD 2A 4C      [17]  889 	call	_cpct_memset
   4746 21 01 00      [10]  890 	ld	hl,#0x0001
   4749 E5            [11]  891 	push	hl
   474A CD 0F 45      [17]  892 	call	_drawMap
   474D F1            [10]  893 	pop	af
   474E D1            [10]  894 	pop	de
   474F C1            [10]  895 	pop	bc
                            896 ;src/main.c:162: while (1){
   4750 DD 7E FE      [19]  897 	ld	a,-2 (ix)
   4753 DD 77 FC      [19]  898 	ld	-4 (ix),a
   4756 DD 7E FF      [19]  899 	ld	a,-1 (ix)
   4759 DD 77 FD      [19]  900 	ld	-3 (ix),a
   475C DD 71 FA      [19]  901 	ld	-6 (ix),c
   475F DD 70 FB      [19]  902 	ld	-5 (ix),b
   4762                     903 00118$:
                            904 ;src/main.c:165: cpct_waitVSYNC();
   4762 C5            [11]  905 	push	bc
   4763 D5            [11]  906 	push	de
   4764 CD 10 4C      [17]  907 	call	_cpct_waitVSYNC
   4767 D1            [10]  908 	pop	de
   4768 C1            [10]  909 	pop	bc
                            910 ;src/main.c:168: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4769 DD 6E FE      [19]  911 	ld	l,-2 (ix)
   476C DD 66 FF      [19]  912 	ld	h,-1 (ix)
   476F 7E            [ 7]  913 	ld	a,(hl)
   4770 F5            [11]  914 	push	af
   4771 0A            [ 7]  915 	ld	a,(bc)
   4772 DD 77 F9      [19]  916 	ld	-7 (ix),a
   4775 F1            [10]  917 	pop	af
   4776 C5            [11]  918 	push	bc
   4777 D5            [11]  919 	push	de
   4778 F5            [11]  920 	push	af
   4779 33            [ 6]  921 	inc	sp
   477A DD 7E F9      [19]  922 	ld	a,-7 (ix)
   477D F5            [11]  923 	push	af
   477E 33            [ 6]  924 	inc	sp
   477F 21 00 C0      [10]  925 	ld	hl,#0xC000
   4782 E5            [11]  926 	push	hl
   4783 CD 04 4D      [17]  927 	call	_cpct_getScreenPtr
   4786 D1            [10]  928 	pop	de
   4787 C1            [10]  929 	pop	bc
   4788 E5            [11]  930 	push	hl
   4789 FD E1         [14]  931 	pop	iy
                            932 ;src/main.c:169: cpct_drawSolidBox(memptr,0,4,16);
   478B C5            [11]  933 	push	bc
   478C D5            [11]  934 	push	de
   478D 21 04 10      [10]  935 	ld	hl,#0x1004
   4790 E5            [11]  936 	push	hl
   4791 AF            [ 4]  937 	xor	a, a
   4792 F5            [11]  938 	push	af
   4793 33            [ 6]  939 	inc	sp
   4794 FD E5         [15]  940 	push	iy
   4796 CD 4C 4C      [17]  941 	call	_cpct_drawSolidBox
   4799 F1            [10]  942 	pop	af
   479A F1            [10]  943 	pop	af
   479B 33            [ 6]  944 	inc	sp
   479C D1            [10]  945 	pop	de
   479D C1            [10]  946 	pop	bc
                            947 ;src/main.c:174: lx = p.x;
   479E 0A            [ 7]  948 	ld	a,(bc)
   479F DD 77 F6      [19]  949 	ld	-10 (ix),a
                            950 ;src/main.c:175: ly = p.y;
   47A2 DD 6E FE      [19]  951 	ld	l,-2 (ix)
   47A5 DD 66 FF      [19]  952 	ld	h,-1 (ix)
   47A8 7E            [ 7]  953 	ld	a,(hl)
   47A9 DD 77 F3      [19]  954 	ld	-13 (ix),a
                            955 ;src/main.c:178: cpct_scanKeyboard_f();
   47AC C5            [11]  956 	push	bc
   47AD D5            [11]  957 	push	de
   47AE CD 36 4A      [17]  958 	call	_cpct_scanKeyboard_f
   47B1 21 00 02      [10]  959 	ld	hl,#0x0200
   47B4 CD 2A 4A      [17]  960 	call	_cpct_isKeyPressed
   47B7 7D            [ 4]  961 	ld	a,l
   47B8 D1            [10]  962 	pop	de
   47B9 C1            [10]  963 	pop	bc
   47BA B7            [ 4]  964 	or	a, a
   47BB 28 1B         [12]  965 	jr	Z,00114$
   47BD 0A            [ 7]  966 	ld	a,(bc)
   47BE 67            [ 4]  967 	ld	h,a
   47BF D6 4C         [ 7]  968 	sub	a, #0x4C
   47C1 30 15         [12]  969 	jr	NC,00114$
                            970 ;src/main.c:180: p.x += 1;
   47C3 7C            [ 4]  971 	ld	a,h
   47C4 3C            [ 4]  972 	inc	a
   47C5 02            [ 7]  973 	ld	(bc),a
                            974 ;src/main.c:181: sprite = gladis_quieto_dcha;
   47C6 FD 21 72 4D   [14]  975 	ld	iy,#_sprite
   47CA FD 36 00 00   [19]  976 	ld	0 (iy),#<(_gladis_quieto_dcha)
   47CE FD 21 72 4D   [14]  977 	ld	iy,#_sprite
   47D2 FD 36 01 41   [19]  978 	ld	1 (iy),#>(_gladis_quieto_dcha)
   47D6 18 6A         [12]  979 	jr	00115$
   47D8                     980 00114$:
                            981 ;src/main.c:182: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   47D8 C5            [11]  982 	push	bc
   47D9 D5            [11]  983 	push	de
   47DA 21 01 01      [10]  984 	ld	hl,#0x0101
   47DD CD 2A 4A      [17]  985 	call	_cpct_isKeyPressed
   47E0 7D            [ 4]  986 	ld	a,l
   47E1 D1            [10]  987 	pop	de
   47E2 C1            [10]  988 	pop	bc
   47E3 B7            [ 4]  989 	or	a, a
   47E4 28 19         [12]  990 	jr	Z,00110$
   47E6 0A            [ 7]  991 	ld	a,(bc)
   47E7 B7            [ 4]  992 	or	a, a
   47E8 28 15         [12]  993 	jr	Z,00110$
                            994 ;src/main.c:183: p.x -= 1;
   47EA C6 FF         [ 7]  995 	add	a,#0xFF
   47EC 02            [ 7]  996 	ld	(bc),a
                            997 ;src/main.c:184: sprite = gladis_quieto_izda;
   47ED FD 21 72 4D   [14]  998 	ld	iy,#_sprite
   47F1 FD 36 00 80   [19]  999 	ld	0 (iy),#<(_gladis_quieto_izda)
   47F5 FD 21 72 4D   [14] 1000 	ld	iy,#_sprite
   47F9 FD 36 01 41   [19] 1001 	ld	1 (iy),#>(_gladis_quieto_izda)
   47FD 18 43         [12] 1002 	jr	00115$
   47FF                    1003 00110$:
                           1004 ;src/main.c:185: }else  if(cpct_isKeyPressed(Key_Esc)){
   47FF C5            [11] 1005 	push	bc
   4800 D5            [11] 1006 	push	de
   4801 21 08 04      [10] 1007 	ld	hl,#0x0408
   4804 CD 2A 4A      [17] 1008 	call	_cpct_isKeyPressed
   4807 7D            [ 4] 1009 	ld	a,l
   4808 D1            [10] 1010 	pop	de
   4809 C1            [10] 1011 	pop	bc
   480A B7            [ 4] 1012 	or	a, a
                           1013 ;src/main.c:186: return;
   480B C2 B5 48      [10] 1014 	jp	NZ,00120$
                           1015 ;src/main.c:187: }else if(cpct_isKeyPressed(Key_Space)){
   480E C5            [11] 1016 	push	bc
   480F D5            [11] 1017 	push	de
   4810 21 05 80      [10] 1018 	ld	hl,#0x8005
   4813 CD 2A 4A      [17] 1019 	call	_cpct_isKeyPressed
   4816 7D            [ 4] 1020 	ld	a,l
   4817 D1            [10] 1021 	pop	de
   4818 C1            [10] 1022 	pop	bc
   4819 B7            [ 4] 1023 	or	a, a
   481A 28 26         [12] 1024 	jr	Z,00115$
                           1025 ;src/main.c:188: cpct_clearScreen(0);
   481C C5            [11] 1026 	push	bc
   481D D5            [11] 1027 	push	de
   481E 21 00 40      [10] 1028 	ld	hl,#0x4000
   4821 E5            [11] 1029 	push	hl
   4822 AF            [ 4] 1030 	xor	a, a
   4823 F5            [11] 1031 	push	af
   4824 33            [ 6] 1032 	inc	sp
   4825 26 C0         [ 7] 1033 	ld	h, #0xC0
   4827 E5            [11] 1034 	push	hl
   4828 CD 2A 4C      [17] 1035 	call	_cpct_memset
   482B D1            [10] 1036 	pop	de
   482C C1            [10] 1037 	pop	bc
                           1038 ;src/main.c:189: if(i ==1 ) {i++;}
   482D 7B            [ 4] 1039 	ld	a,e
   482E 3D            [ 4] 1040 	dec	a
   482F 20 07         [12] 1041 	jr	NZ,00102$
   4831 7A            [ 4] 1042 	ld	a,d
   4832 B7            [ 4] 1043 	or	a, a
   4833 20 03         [12] 1044 	jr	NZ,00102$
   4835 13            [ 6] 1045 	inc	de
   4836 18 01         [12] 1046 	jr	00103$
   4838                    1047 00102$:
                           1048 ;src/main.c:190: else {i--;}
   4838 1B            [ 6] 1049 	dec	de
   4839                    1050 00103$:
                           1051 ;src/main.c:191: drawMap(i);
   4839 C5            [11] 1052 	push	bc
   483A D5            [11] 1053 	push	de
   483B D5            [11] 1054 	push	de
   483C CD 0F 45      [17] 1055 	call	_drawMap
   483F F1            [10] 1056 	pop	af
   4840 D1            [10] 1057 	pop	de
   4841 C1            [10] 1058 	pop	bc
   4842                    1059 00115$:
                           1060 ;src/main.c:195: checkColisions(&p.x,&p.y,lx,ly);
   4842 E5            [11] 1061 	push	hl
   4843 DD 6E FC      [19] 1062 	ld	l,-4 (ix)
   4846 DD 66 FD      [19] 1063 	ld	h,-3 (ix)
   4849 E5            [11] 1064 	push	hl
   484A FD E1         [14] 1065 	pop	iy
   484C E1            [10] 1066 	pop	hl
   484D DD 7E FA      [19] 1067 	ld	a,-6 (ix)
   4850 DD 77 F7      [19] 1068 	ld	-9 (ix),a
   4853 DD 7E FB      [19] 1069 	ld	a,-5 (ix)
   4856 DD 77 F8      [19] 1070 	ld	-8 (ix),a
   4859 C5            [11] 1071 	push	bc
   485A D5            [11] 1072 	push	de
   485B DD 66 F3      [19] 1073 	ld	h,-13 (ix)
   485E DD 6E F6      [19] 1074 	ld	l,-10 (ix)
   4861 E5            [11] 1075 	push	hl
   4862 FD E5         [15] 1076 	push	iy
   4864 DD 6E F7      [19] 1077 	ld	l,-9 (ix)
   4867 DD 66 F8      [19] 1078 	ld	h,-8 (ix)
   486A E5            [11] 1079 	push	hl
   486B CD 20 46      [17] 1080 	call	_checkColisions
   486E 21 06 00      [10] 1081 	ld	hl,#6
   4871 39            [11] 1082 	add	hl,sp
   4872 F9            [ 6] 1083 	ld	sp,hl
   4873 D1            [10] 1084 	pop	de
   4874 C1            [10] 1085 	pop	bc
                           1086 ;src/main.c:198: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4875 DD 6E FE      [19] 1087 	ld	l,-2 (ix)
   4878 DD 66 FF      [19] 1088 	ld	h,-1 (ix)
   487B 7E            [ 7] 1089 	ld	a,(hl)
   487C F5            [11] 1090 	push	af
   487D 0A            [ 7] 1091 	ld	a,(bc)
   487E DD 77 F7      [19] 1092 	ld	-9 (ix),a
   4881 F1            [10] 1093 	pop	af
   4882 C5            [11] 1094 	push	bc
   4883 D5            [11] 1095 	push	de
   4884 F5            [11] 1096 	push	af
   4885 33            [ 6] 1097 	inc	sp
   4886 DD 7E F7      [19] 1098 	ld	a,-9 (ix)
   4889 F5            [11] 1099 	push	af
   488A 33            [ 6] 1100 	inc	sp
   488B 21 00 C0      [10] 1101 	ld	hl,#0xC000
   488E E5            [11] 1102 	push	hl
   488F CD 04 4D      [17] 1103 	call	_cpct_getScreenPtr
   4892 D1            [10] 1104 	pop	de
   4893 C1            [10] 1105 	pop	bc
                           1106 ;src/main.c:199: cpct_drawSpriteMasked(sprite,memptr,4,16);
   4894 DD 75 F7      [19] 1107 	ld	-9 (ix),l
   4897 DD 74 F8      [19] 1108 	ld	-8 (ix),h
   489A FD 2A 72 4D   [20] 1109 	ld	iy,(_sprite)
   489E C5            [11] 1110 	push	bc
   489F D5            [11] 1111 	push	de
   48A0 21 04 10      [10] 1112 	ld	hl,#0x1004
   48A3 E5            [11] 1113 	push	hl
   48A4 DD 6E F7      [19] 1114 	ld	l,-9 (ix)
   48A7 DD 66 F8      [19] 1115 	ld	h,-8 (ix)
   48AA E5            [11] 1116 	push	hl
   48AB FD E5         [15] 1117 	push	iy
   48AD CD C6 4B      [17] 1118 	call	_cpct_drawSpriteMasked
   48B0 D1            [10] 1119 	pop	de
   48B1 C1            [10] 1120 	pop	bc
   48B2 C3 62 47      [10] 1121 	jp	00118$
   48B5                    1122 00120$:
   48B5 DD F9         [10] 1123 	ld	sp, ix
   48B7 DD E1         [14] 1124 	pop	ix
   48B9 C9            [10] 1125 	ret
                           1126 ;src/main.c:210: void loadMap(){
                           1127 ;	---------------------------------
                           1128 ; Function loadMap
                           1129 ; ---------------------------------
   48BA                    1130 _loadMap::
                           1131 ;src/main.c:212: }
   48BA C9            [10] 1132 	ret
                           1133 ;src/main.c:217: void main(void) {
                           1134 ;	---------------------------------
                           1135 ; Function main
                           1136 ; ---------------------------------
   48BB                    1137 _main::
                           1138 ;src/main.c:219: init();
   48BB CD 00 42      [17] 1139 	call	_init
                           1140 ;src/main.c:223: while(1){
   48BE                    1141 00102$:
                           1142 ;src/main.c:224: menu();
   48BE CD A9 44      [17] 1143 	call	_menu
                           1144 ;src/main.c:226: game();
   48C1 CD 09 47      [17] 1145 	call	_game
   48C4 18 F8         [12] 1146 	jr	00102$
                           1147 	.area _CODE
                           1148 	.area _INITIALIZER
   4D74                    1149 __xinit__sprite:
   4D74 00 41              1150 	.dw _gladis_quieto_dcha
                           1151 	.area _CABS (ABS)
