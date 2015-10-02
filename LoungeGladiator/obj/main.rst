                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Fri Oct  2 14:59:01 2015
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
                             34 	.globl _p
                             35 ;--------------------------------------------------------
                             36 ; special function registers
                             37 ;--------------------------------------------------------
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DATA
   4BE0                      42 _scene::
   4BE0                      43 	.ds 6
                             44 ;--------------------------------------------------------
                             45 ; ram data
                             46 ;--------------------------------------------------------
                             47 	.area _INITIALIZED
                             48 ;--------------------------------------------------------
                             49 ; absolute external ram data
                             50 ;--------------------------------------------------------
                             51 	.area _DABS (ABS)
                             52 ;--------------------------------------------------------
                             53 ; global & static initialisations
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _GSINIT
                             57 	.area _GSFINAL
                             58 	.area _GSINIT
                             59 ;--------------------------------------------------------
                             60 ; Home
                             61 ;--------------------------------------------------------
                             62 	.area _HOME
                             63 	.area _HOME
                             64 ;--------------------------------------------------------
                             65 ; code
                             66 ;--------------------------------------------------------
                             67 	.area _CODE
                             68 ;src/main.c:65: void init(){
                             69 ;	---------------------------------
                             70 ; Function init
                             71 ; ---------------------------------
   4200                      72 _init::
                             73 ;src/main.c:66: cpct_disableFirmware();
   4200 CD F7 4A      [17]   74 	call	_cpct_disableFirmware
                             75 ;src/main.c:67: cpct_setVideoMode(0);
   4203 AF            [ 4]   76 	xor	a, a
   4204 F5            [11]   77 	push	af
   4205 33            [ 6]   78 	inc	sp
   4206 CD D4 4A      [17]   79 	call	_cpct_setVideoMode
   4209 33            [ 6]   80 	inc	sp
                             81 ;src/main.c:68: cpct_fw2hw(g_palette,4);
   420A 11 B7 44      [10]   82 	ld	de,#_g_palette
   420D 3E 04         [ 7]   83 	ld	a,#0x04
   420F F5            [11]   84 	push	af
   4210 33            [ 6]   85 	inc	sp
   4211 D5            [11]   86 	push	de
   4212 CD 5E 4A      [17]   87 	call	_cpct_fw2hw
   4215 F1            [10]   88 	pop	af
   4216 33            [ 6]   89 	inc	sp
                             90 ;src/main.c:69: cpct_setPalette(g_palette,4);
   4217 11 B7 44      [10]   91 	ld	de,#_g_palette
   421A 3E 04         [ 7]   92 	ld	a,#0x04
   421C F5            [11]   93 	push	af
   421D 33            [ 6]   94 	inc	sp
   421E D5            [11]   95 	push	de
   421F CD 03 49      [17]   96 	call	_cpct_setPalette
   4222 F1            [10]   97 	pop	af
   4223 33            [ 6]   98 	inc	sp
   4224 C9            [10]   99 	ret
   4225                     100 _p:
   4225 01 00               101 	.dw #0x0001
   4227 01 00               102 	.dw #0x0001
   4229 01 00               103 	.dw #0x0001
   422B 00 00               104 	.dw #0x0000
   422D 01 00               105 	.dw #0x0001
   422F 00 00               106 	.dw #0x0000
   4231 01 00               107 	.dw #0x0001
   4233 01 00               108 	.dw #0x0001
   4235 01 00               109 	.dw #0x0001
   4237                     110 _mapa1:
   4237 01 00               111 	.dw #0x0001
   4239 01 00               112 	.dw #0x0001
   423B 01 00               113 	.dw #0x0001
   423D 01 00               114 	.dw #0x0001
   423F 01 00               115 	.dw #0x0001
   4241 01 00               116 	.dw #0x0001
   4243 01 00               117 	.dw #0x0001
   4245 01 00               118 	.dw #0x0001
   4247 01 00               119 	.dw #0x0001
   4249 01 00               120 	.dw #0x0001
   424B 01 00               121 	.dw #0x0001
   424D 01 00               122 	.dw #0x0001
   424F 01 00               123 	.dw #0x0001
   4251 01 00               124 	.dw #0x0001
   4253 01 00               125 	.dw #0x0001
   4255 01 00               126 	.dw #0x0001
   4257 01 00               127 	.dw #0x0001
   4259 00 00               128 	.dw #0x0000
   425B 00 00               129 	.dw #0x0000
   425D 00 00               130 	.dw #0x0000
   425F 00 00               131 	.dw #0x0000
   4261 00 00               132 	.dw #0x0000
   4263 00 00               133 	.dw #0x0000
   4265 00 00               134 	.dw #0x0000
   4267 00 00               135 	.dw #0x0000
   4269 00 00               136 	.dw #0x0000
   426B 00 00               137 	.dw #0x0000
   426D 00 00               138 	.dw #0x0000
   426F 00 00               139 	.dw #0x0000
   4271 00 00               140 	.dw #0x0000
   4273 00 00               141 	.dw #0x0000
   4275 01 00               142 	.dw #0x0001
   4277 01 00               143 	.dw #0x0001
   4279 00 00               144 	.dw #0x0000
   427B 00 00               145 	.dw #0x0000
   427D 00 00               146 	.dw #0x0000
   427F 00 00               147 	.dw #0x0000
   4281 00 00               148 	.dw #0x0000
   4283 00 00               149 	.dw #0x0000
   4285 00 00               150 	.dw #0x0000
   4287 00 00               151 	.dw #0x0000
   4289 00 00               152 	.dw #0x0000
   428B 00 00               153 	.dw #0x0000
   428D 00 00               154 	.dw #0x0000
   428F 00 00               155 	.dw #0x0000
   4291 00 00               156 	.dw #0x0000
   4293 00 00               157 	.dw #0x0000
   4295 01 00               158 	.dw #0x0001
   4297 01 00               159 	.dw #0x0001
   4299 00 00               160 	.dw #0x0000
   429B 00 00               161 	.dw #0x0000
   429D 00 00               162 	.dw #0x0000
   429F 00 00               163 	.dw #0x0000
   42A1 00 00               164 	.dw #0x0000
   42A3 00 00               165 	.dw #0x0000
   42A5 00 00               166 	.dw #0x0000
   42A7 00 00               167 	.dw #0x0000
   42A9 00 00               168 	.dw #0x0000
   42AB 00 00               169 	.dw #0x0000
   42AD 00 00               170 	.dw #0x0000
   42AF 00 00               171 	.dw #0x0000
   42B1 00 00               172 	.dw #0x0000
   42B3 00 00               173 	.dw #0x0000
   42B5 01 00               174 	.dw #0x0001
   42B7 01 00               175 	.dw #0x0001
   42B9 00 00               176 	.dw #0x0000
   42BB 00 00               177 	.dw #0x0000
   42BD 00 00               178 	.dw #0x0000
   42BF 00 00               179 	.dw #0x0000
   42C1 00 00               180 	.dw #0x0000
   42C3 00 00               181 	.dw #0x0000
   42C5 00 00               182 	.dw #0x0000
   42C7 00 00               183 	.dw #0x0000
   42C9 00 00               184 	.dw #0x0000
   42CB 00 00               185 	.dw #0x0000
   42CD 00 00               186 	.dw #0x0000
   42CF 00 00               187 	.dw #0x0000
   42D1 00 00               188 	.dw #0x0000
   42D3 00 00               189 	.dw #0x0000
   42D5 01 00               190 	.dw #0x0001
   42D7 00 00               191 	.dw #0x0000
   42D9 00 00               192 	.dw #0x0000
   42DB 00 00               193 	.dw #0x0000
   42DD 00 00               194 	.dw #0x0000
   42DF 00 00               195 	.dw #0x0000
   42E1 00 00               196 	.dw #0x0000
   42E3 00 00               197 	.dw #0x0000
   42E5 00 00               198 	.dw #0x0000
   42E7 00 00               199 	.dw #0x0000
   42E9 00 00               200 	.dw #0x0000
   42EB 00 00               201 	.dw #0x0000
   42ED 00 00               202 	.dw #0x0000
   42EF 00 00               203 	.dw #0x0000
   42F1 00 00               204 	.dw #0x0000
   42F3 00 00               205 	.dw #0x0000
   42F5 01 00               206 	.dw #0x0001
   42F7 01 00               207 	.dw #0x0001
   42F9 00 00               208 	.dw #0x0000
   42FB 00 00               209 	.dw #0x0000
   42FD 00 00               210 	.dw #0x0000
   42FF 00 00               211 	.dw #0x0000
   4301 00 00               212 	.dw #0x0000
   4303 00 00               213 	.dw #0x0000
   4305 00 00               214 	.dw #0x0000
   4307 00 00               215 	.dw #0x0000
   4309 00 00               216 	.dw #0x0000
   430B 00 00               217 	.dw #0x0000
   430D 00 00               218 	.dw #0x0000
   430F 00 00               219 	.dw #0x0000
   4311 00 00               220 	.dw #0x0000
   4313 00 00               221 	.dw #0x0000
   4315 01 00               222 	.dw #0x0001
   4317 01 00               223 	.dw #0x0001
   4319 00 00               224 	.dw #0x0000
   431B 00 00               225 	.dw #0x0000
   431D 00 00               226 	.dw #0x0000
   431F 00 00               227 	.dw #0x0000
   4321 00 00               228 	.dw #0x0000
   4323 00 00               229 	.dw #0x0000
   4325 00 00               230 	.dw #0x0000
   4327 00 00               231 	.dw #0x0000
   4329 00 00               232 	.dw #0x0000
   432B 00 00               233 	.dw #0x0000
   432D 00 00               234 	.dw #0x0000
   432F 00 00               235 	.dw #0x0000
   4331 00 00               236 	.dw #0x0000
   4333 00 00               237 	.dw #0x0000
   4335 01 00               238 	.dw #0x0001
   4337 01 00               239 	.dw #0x0001
   4339 00 00               240 	.dw #0x0000
   433B 00 00               241 	.dw #0x0000
   433D 00 00               242 	.dw #0x0000
   433F 00 00               243 	.dw #0x0000
   4341 00 00               244 	.dw #0x0000
   4343 00 00               245 	.dw #0x0000
   4345 00 00               246 	.dw #0x0000
   4347 00 00               247 	.dw #0x0000
   4349 00 00               248 	.dw #0x0000
   434B 00 00               249 	.dw #0x0000
   434D 00 00               250 	.dw #0x0000
   434F 00 00               251 	.dw #0x0000
   4351 00 00               252 	.dw #0x0000
   4353 00 00               253 	.dw #0x0000
   4355 01 00               254 	.dw #0x0001
   4357 01 00               255 	.dw #0x0001
   4359 01 00               256 	.dw #0x0001
   435B 01 00               257 	.dw #0x0001
   435D 01 00               258 	.dw #0x0001
   435F 01 00               259 	.dw #0x0001
   4361 01 00               260 	.dw #0x0001
   4363 01 00               261 	.dw #0x0001
   4365 01 00               262 	.dw #0x0001
   4367 01 00               263 	.dw #0x0001
   4369 01 00               264 	.dw #0x0001
   436B 01 00               265 	.dw #0x0001
   436D 01 00               266 	.dw #0x0001
   436F 01 00               267 	.dw #0x0001
   4371 01 00               268 	.dw #0x0001
   4373 01 00               269 	.dw #0x0001
   4375 01 00               270 	.dw #0x0001
   4377                     271 _mapa2:
   4377 01 00               272 	.dw #0x0001
   4379 01 00               273 	.dw #0x0001
   437B 01 00               274 	.dw #0x0001
   437D 01 00               275 	.dw #0x0001
   437F 01 00               276 	.dw #0x0001
   4381 01 00               277 	.dw #0x0001
   4383 01 00               278 	.dw #0x0001
   4385 01 00               279 	.dw #0x0001
   4387 01 00               280 	.dw #0x0001
   4389 01 00               281 	.dw #0x0001
   438B 01 00               282 	.dw #0x0001
   438D 01 00               283 	.dw #0x0001
   438F 01 00               284 	.dw #0x0001
   4391 01 00               285 	.dw #0x0001
   4393 01 00               286 	.dw #0x0001
   4395 01 00               287 	.dw #0x0001
   4397 01 00               288 	.dw #0x0001
   4399 01 00               289 	.dw #0x0001
   439B 01 00               290 	.dw #0x0001
   439D 00 00               291 	.dw #0x0000
   439F 00 00               292 	.dw #0x0000
   43A1 00 00               293 	.dw #0x0000
   43A3 00 00               294 	.dw #0x0000
   43A5 00 00               295 	.dw #0x0000
   43A7 00 00               296 	.dw #0x0000
   43A9 00 00               297 	.dw #0x0000
   43AB 00 00               298 	.dw #0x0000
   43AD 00 00               299 	.dw #0x0000
   43AF 00 00               300 	.dw #0x0000
   43B1 01 00               301 	.dw #0x0001
   43B3 01 00               302 	.dw #0x0001
   43B5 01 00               303 	.dw #0x0001
   43B7 01 00               304 	.dw #0x0001
   43B9 01 00               305 	.dw #0x0001
   43BB 01 00               306 	.dw #0x0001
   43BD 00 00               307 	.dw #0x0000
   43BF 00 00               308 	.dw #0x0000
   43C1 00 00               309 	.dw #0x0000
   43C3 00 00               310 	.dw #0x0000
   43C5 00 00               311 	.dw #0x0000
   43C7 00 00               312 	.dw #0x0000
   43C9 00 00               313 	.dw #0x0000
   43CB 00 00               314 	.dw #0x0000
   43CD 00 00               315 	.dw #0x0000
   43CF 00 00               316 	.dw #0x0000
   43D1 01 00               317 	.dw #0x0001
   43D3 01 00               318 	.dw #0x0001
   43D5 01 00               319 	.dw #0x0001
   43D7 01 00               320 	.dw #0x0001
   43D9 00 00               321 	.dw #0x0000
   43DB 01 00               322 	.dw #0x0001
   43DD 00 00               323 	.dw #0x0000
   43DF 00 00               324 	.dw #0x0000
   43E1 00 00               325 	.dw #0x0000
   43E3 00 00               326 	.dw #0x0000
   43E5 01 00               327 	.dw #0x0001
   43E7 01 00               328 	.dw #0x0001
   43E9 01 00               329 	.dw #0x0001
   43EB 00 00               330 	.dw #0x0000
   43ED 00 00               331 	.dw #0x0000
   43EF 00 00               332 	.dw #0x0000
   43F1 01 00               333 	.dw #0x0001
   43F3 00 00               334 	.dw #0x0000
   43F5 01 00               335 	.dw #0x0001
   43F7 01 00               336 	.dw #0x0001
   43F9 00 00               337 	.dw #0x0000
   43FB 01 00               338 	.dw #0x0001
   43FD 00 00               339 	.dw #0x0000
   43FF 00 00               340 	.dw #0x0000
   4401 00 00               341 	.dw #0x0000
   4403 00 00               342 	.dw #0x0000
   4405 01 00               343 	.dw #0x0001
   4407 01 00               344 	.dw #0x0001
   4409 01 00               345 	.dw #0x0001
   440B 00 00               346 	.dw #0x0000
   440D 00 00               347 	.dw #0x0000
   440F 00 00               348 	.dw #0x0000
   4411 01 00               349 	.dw #0x0001
   4413 00 00               350 	.dw #0x0000
   4415 01 00               351 	.dw #0x0001
   4417 00 00               352 	.dw #0x0000
   4419 00 00               353 	.dw #0x0000
   441B 01 00               354 	.dw #0x0001
   441D 00 00               355 	.dw #0x0000
   441F 00 00               356 	.dw #0x0000
   4421 00 00               357 	.dw #0x0000
   4423 00 00               358 	.dw #0x0000
   4425 01 00               359 	.dw #0x0001
   4427 00 00               360 	.dw #0x0000
   4429 01 00               361 	.dw #0x0001
   442B 00 00               362 	.dw #0x0000
   442D 00 00               363 	.dw #0x0000
   442F 00 00               364 	.dw #0x0000
   4431 01 00               365 	.dw #0x0001
   4433 00 00               366 	.dw #0x0000
   4435 01 00               367 	.dw #0x0001
   4437 01 00               368 	.dw #0x0001
   4439 00 00               369 	.dw #0x0000
   443B 01 00               370 	.dw #0x0001
   443D 01 00               371 	.dw #0x0001
   443F 01 00               372 	.dw #0x0001
   4441 01 00               373 	.dw #0x0001
   4443 01 00               374 	.dw #0x0001
   4445 00 00               375 	.dw #0x0000
   4447 00 00               376 	.dw #0x0000
   4449 00 00               377 	.dw #0x0000
   444B 01 00               378 	.dw #0x0001
   444D 01 00               379 	.dw #0x0001
   444F 01 00               380 	.dw #0x0001
   4451 01 00               381 	.dw #0x0001
   4453 00 00               382 	.dw #0x0000
   4455 01 00               383 	.dw #0x0001
   4457 01 00               384 	.dw #0x0001
   4459 00 00               385 	.dw #0x0000
   445B 01 00               386 	.dw #0x0001
   445D 01 00               387 	.dw #0x0001
   445F 01 00               388 	.dw #0x0001
   4461 01 00               389 	.dw #0x0001
   4463 01 00               390 	.dw #0x0001
   4465 00 00               391 	.dw #0x0000
   4467 00 00               392 	.dw #0x0000
   4469 00 00               393 	.dw #0x0000
   446B 01 00               394 	.dw #0x0001
   446D 01 00               395 	.dw #0x0001
   446F 01 00               396 	.dw #0x0001
   4471 01 00               397 	.dw #0x0001
   4473 00 00               398 	.dw #0x0000
   4475 01 00               399 	.dw #0x0001
   4477 01 00               400 	.dw #0x0001
   4479 00 00               401 	.dw #0x0000
   447B 00 00               402 	.dw #0x0000
   447D 00 00               403 	.dw #0x0000
   447F 00 00               404 	.dw #0x0000
   4481 00 00               405 	.dw #0x0000
   4483 00 00               406 	.dw #0x0000
   4485 00 00               407 	.dw #0x0000
   4487 00 00               408 	.dw #0x0000
   4489 00 00               409 	.dw #0x0000
   448B 00 00               410 	.dw #0x0000
   448D 00 00               411 	.dw #0x0000
   448F 00 00               412 	.dw #0x0000
   4491 00 00               413 	.dw #0x0000
   4493 00 00               414 	.dw #0x0000
   4495 01 00               415 	.dw #0x0001
   4497 01 00               416 	.dw #0x0001
   4499 01 00               417 	.dw #0x0001
   449B 01 00               418 	.dw #0x0001
   449D 01 00               419 	.dw #0x0001
   449F 01 00               420 	.dw #0x0001
   44A1 01 00               421 	.dw #0x0001
   44A3 01 00               422 	.dw #0x0001
   44A5 01 00               423 	.dw #0x0001
   44A7 01 00               424 	.dw #0x0001
   44A9 01 00               425 	.dw #0x0001
   44AB 01 00               426 	.dw #0x0001
   44AD 01 00               427 	.dw #0x0001
   44AF 01 00               428 	.dw #0x0001
   44B1 01 00               429 	.dw #0x0001
   44B3 01 00               430 	.dw #0x0001
   44B5 01 00               431 	.dw #0x0001
   44B7                     432 _g_palette:
   44B7 00                  433 	.db #0x00	; 0
   44B8 1A                  434 	.db #0x1A	; 26
   44B9 06                  435 	.db #0x06	; 6
   44BA 12                  436 	.db #0x12	; 18
                            437 ;src/main.c:73: void menu(){
                            438 ;	---------------------------------
                            439 ; Function menu
                            440 ; ---------------------------------
   44BB                     441 _menu::
                            442 ;src/main.c:75: cpct_clearScreen(0);
   44BB 21 00 40      [10]  443 	ld	hl,#0x4000
   44BE E5            [11]  444 	push	hl
   44BF AF            [ 4]  445 	xor	a, a
   44C0 F5            [11]  446 	push	af
   44C1 33            [ 6]  447 	inc	sp
   44C2 26 C0         [ 7]  448 	ld	h, #0xC0
   44C4 E5            [11]  449 	push	hl
   44C5 CD E6 4A      [17]  450 	call	_cpct_memset
                            451 ;src/main.c:77: memptr = cpct_getScreenPtr(VMEM,20,10);
   44C8 21 14 0A      [10]  452 	ld	hl,#0x0A14
   44CB E5            [11]  453 	push	hl
   44CC 21 00 C0      [10]  454 	ld	hl,#0xC000
   44CF E5            [11]  455 	push	hl
   44D0 CD C0 4B      [17]  456 	call	_cpct_getScreenPtr
                            457 ;src/main.c:78: cpct_drawStringM0("MENU",memptr,2,3);
   44D3 EB            [ 4]  458 	ex	de,hl
   44D4 01 10 45      [10]  459 	ld	bc,#___str_0+0
   44D7 21 02 03      [10]  460 	ld	hl,#0x0302
   44DA E5            [11]  461 	push	hl
   44DB D5            [11]  462 	push	de
   44DC C5            [11]  463 	push	bc
   44DD CD 9D 49      [17]  464 	call	_cpct_drawStringM0
   44E0 21 06 00      [10]  465 	ld	hl,#6
   44E3 39            [11]  466 	add	hl,sp
   44E4 F9            [ 6]  467 	ld	sp,hl
                            468 ;src/main.c:80: memptr = cpct_getScreenPtr(VMEM,18,180);
   44E5 21 12 B4      [10]  469 	ld	hl,#0xB412
   44E8 E5            [11]  470 	push	hl
   44E9 21 00 C0      [10]  471 	ld	hl,#0xC000
   44EC E5            [11]  472 	push	hl
   44ED CD C0 4B      [17]  473 	call	_cpct_getScreenPtr
                            474 ;src/main.c:81: cpct_drawStringM0("Pulsa Intro",memptr,4,5);
   44F0 EB            [ 4]  475 	ex	de,hl
   44F1 01 15 45      [10]  476 	ld	bc,#___str_1+0
   44F4 21 04 05      [10]  477 	ld	hl,#0x0504
   44F7 E5            [11]  478 	push	hl
   44F8 D5            [11]  479 	push	de
   44F9 C5            [11]  480 	push	bc
   44FA CD 9D 49      [17]  481 	call	_cpct_drawStringM0
   44FD 21 06 00      [10]  482 	ld	hl,#6
   4500 39            [11]  483 	add	hl,sp
   4501 F9            [ 6]  484 	ld	sp,hl
                            485 ;src/main.c:83: do{
   4502                     486 00101$:
                            487 ;src/main.c:84: cpct_scanKeyboard_f();
   4502 CD 33 49      [17]  488 	call	_cpct_scanKeyboard_f
                            489 ;src/main.c:85: }while(!cpct_isKeyPressed(Key_Enter));
   4505 21 00 40      [10]  490 	ld	hl,#0x4000
   4508 CD 27 49      [17]  491 	call	_cpct_isKeyPressed
   450B 7D            [ 4]  492 	ld	a,l
   450C B7            [ 4]  493 	or	a, a
   450D 28 F3         [12]  494 	jr	Z,00101$
   450F C9            [10]  495 	ret
   4510                     496 ___str_0:
   4510 4D 45 4E 55         497 	.ascii "MENU"
   4514 00                  498 	.db 0x00
   4515                     499 ___str_1:
   4515 50 75 6C 73 61 20   500 	.ascii "Pulsa Intro"
        49 6E 74 72 6F
   4520 00                  501 	.db 0x00
                            502 ;src/main.c:91: void drawMap(int t){
                            503 ;	---------------------------------
                            504 ; Function drawMap
                            505 ; ---------------------------------
   4521                     506 _drawMap::
   4521 DD E5         [15]  507 	push	ix
   4523 DD 21 00 00   [14]  508 	ld	ix,#0
   4527 DD 39         [15]  509 	add	ix,sp
   4529 21 FA FF      [10]  510 	ld	hl,#-6
   452C 39            [11]  511 	add	hl,sp
   452D F9            [ 6]  512 	ld	sp,hl
                            513 ;src/main.c:95: if(t == 1){ 
   452E DD 7E 04      [19]  514 	ld	a,4 (ix)
   4531 3D            [ 4]  515 	dec	a
   4532 20 3A         [12]  516 	jr	NZ,00103$
   4534 DD 7E 05      [19]  517 	ld	a,5 (ix)
   4537 B7            [ 4]  518 	or	a, a
   4538 20 34         [12]  519 	jr	NZ,00103$
                            520 ;src/main.c:96: for(x=0;x<height;x++){
   453A 11 00 00      [10]  521 	ld	de,#0x0000
   453D                     522 00111$:
                            523 ;src/main.c:97: scene[x] = mapa1[x];
   453D 6B            [ 4]  524 	ld	l, e
   453E 62            [ 4]  525 	ld	h, d
   453F 29            [11]  526 	add	hl, hl
   4540 3E E0         [ 7]  527 	ld	a,#<(_scene)
   4542 85            [ 4]  528 	add	a, l
   4543 DD 77 FE      [19]  529 	ld	-2 (ix),a
   4546 3E 4B         [ 7]  530 	ld	a,#>(_scene)
   4548 8C            [ 4]  531 	adc	a, h
   4549 DD 77 FF      [19]  532 	ld	-1 (ix),a
   454C 6B            [ 4]  533 	ld	l, e
   454D 62            [ 4]  534 	ld	h, d
   454E 29            [11]  535 	add	hl, hl
   454F 29            [11]  536 	add	hl, hl
   4550 29            [11]  537 	add	hl, hl
   4551 29            [11]  538 	add	hl, hl
   4552 29            [11]  539 	add	hl, hl
   4553 01 37 42      [10]  540 	ld	bc,#_mapa1
   4556 09            [11]  541 	add	hl,bc
   4557 45            [ 4]  542 	ld	b,l
   4558 4C            [ 4]  543 	ld	c,h
   4559 DD 6E FE      [19]  544 	ld	l,-2 (ix)
   455C DD 66 FF      [19]  545 	ld	h,-1 (ix)
   455F 70            [ 7]  546 	ld	(hl),b
   4560 23            [ 6]  547 	inc	hl
   4561 71            [ 7]  548 	ld	(hl),c
                            549 ;src/main.c:96: for(x=0;x<height;x++){
   4562 13            [ 6]  550 	inc	de
   4563 7B            [ 4]  551 	ld	a,e
   4564 D6 0A         [ 7]  552 	sub	a, #0x0A
   4566 7A            [ 4]  553 	ld	a,d
   4567 17            [ 4]  554 	rla
   4568 3F            [ 4]  555 	ccf
   4569 1F            [ 4]  556 	rra
   456A DE 80         [ 7]  557 	sbc	a, #0x80
   456C 38 CF         [12]  558 	jr	C,00111$
   456E                     559 00103$:
                            560 ;src/main.c:101: if(t == 2){ 
   456E DD 7E 04      [19]  561 	ld	a,4 (ix)
   4571 D6 02         [ 7]  562 	sub	a, #0x02
   4573 20 30         [12]  563 	jr	NZ,00128$
   4575 DD 7E 05      [19]  564 	ld	a,5 (ix)
   4578 B7            [ 4]  565 	or	a, a
   4579 20 2A         [12]  566 	jr	NZ,00128$
                            567 ;src/main.c:102: for(x=0;x<height;x++){
   457B 01 00 00      [10]  568 	ld	bc,#0x0000
   457E                     569 00113$:
                            570 ;src/main.c:103: scene[x] = mapa2[x];
   457E 69            [ 4]  571 	ld	l, c
   457F 60            [ 4]  572 	ld	h, b
   4580 29            [11]  573 	add	hl, hl
   4581 FD 21 E0 4B   [14]  574 	ld	iy,#_scene
   4585 EB            [ 4]  575 	ex	de,hl
   4586 FD 19         [15]  576 	add	iy, de
   4588 69            [ 4]  577 	ld	l, c
   4589 60            [ 4]  578 	ld	h, b
   458A 29            [11]  579 	add	hl, hl
   458B 29            [11]  580 	add	hl, hl
   458C 29            [11]  581 	add	hl, hl
   458D 29            [11]  582 	add	hl, hl
   458E 29            [11]  583 	add	hl, hl
   458F 11 77 43      [10]  584 	ld	de,#_mapa2
   4592 19            [11]  585 	add	hl,de
   4593 FD 75 00      [19]  586 	ld	0 (iy),l
   4596 FD 74 01      [19]  587 	ld	1 (iy),h
                            588 ;src/main.c:102: for(x=0;x<height;x++){
   4599 03            [ 6]  589 	inc	bc
   459A 79            [ 4]  590 	ld	a,c
   459B D6 0A         [ 7]  591 	sub	a, #0x0A
   459D 78            [ 4]  592 	ld	a,b
   459E 17            [ 4]  593 	rla
   459F 3F            [ 4]  594 	ccf
   45A0 1F            [ 4]  595 	rra
   45A1 DE 80         [ 7]  596 	sbc	a, #0x80
   45A3 38 D9         [12]  597 	jr	C,00113$
                            598 ;src/main.c:107: for(posY=0; posY<height;posY++){
   45A5                     599 00128$:
   45A5 DD 36 FC 00   [19]  600 	ld	-4 (ix),#0x00
   45A9 DD 36 FD 00   [19]  601 	ld	-3 (ix),#0x00
                            602 ;src/main.c:108: for(posX=0; posX<width;posX++){
   45AD                     603 00126$:
   45AD C1            [10]  604 	pop	bc
   45AE E1            [10]  605 	pop	hl
   45AF E5            [11]  606 	push	hl
   45B0 C5            [11]  607 	push	bc
   45B1 29            [11]  608 	add	hl, hl
   45B2 3E E0         [ 7]  609 	ld	a,#<(_scene)
   45B4 85            [ 4]  610 	add	a, l
   45B5 DD 77 FE      [19]  611 	ld	-2 (ix),a
   45B8 3E 4B         [ 7]  612 	ld	a,#>(_scene)
   45BA 8C            [ 4]  613 	adc	a, h
   45BB DD 77 FF      [19]  614 	ld	-1 (ix),a
   45BE 11 00 00      [10]  615 	ld	de,#0x0000
   45C1                     616 00115$:
                            617 ;src/main.c:109: memptr = cpct_getScreenPtr(VMEM, posX*5, posY*20); 
   45C1 DD 7E FC      [19]  618 	ld	a,-4 (ix)
   45C4 4F            [ 4]  619 	ld	c,a
   45C5 87            [ 4]  620 	add	a, a
   45C6 87            [ 4]  621 	add	a, a
   45C7 81            [ 4]  622 	add	a, c
   45C8 87            [ 4]  623 	add	a, a
   45C9 87            [ 4]  624 	add	a, a
   45CA 47            [ 4]  625 	ld	b,a
   45CB 4B            [ 4]  626 	ld	c,e
   45CC 79            [ 4]  627 	ld	a,c
   45CD 87            [ 4]  628 	add	a, a
   45CE 87            [ 4]  629 	add	a, a
   45CF 81            [ 4]  630 	add	a, c
   45D0 D5            [11]  631 	push	de
   45D1 C5            [11]  632 	push	bc
   45D2 33            [ 6]  633 	inc	sp
   45D3 F5            [11]  634 	push	af
   45D4 33            [ 6]  635 	inc	sp
   45D5 21 00 C0      [10]  636 	ld	hl,#0xC000
   45D8 E5            [11]  637 	push	hl
   45D9 CD C0 4B      [17]  638 	call	_cpct_getScreenPtr
   45DC D1            [10]  639 	pop	de
   45DD 33            [ 6]  640 	inc	sp
   45DE 33            [ 6]  641 	inc	sp
   45DF E5            [11]  642 	push	hl
                            643 ;src/main.c:110: if(scene[posY][posX] == 1){
   45E0 DD 6E FE      [19]  644 	ld	l,-2 (ix)
   45E3 DD 66 FF      [19]  645 	ld	h,-1 (ix)
   45E6 4E            [ 7]  646 	ld	c,(hl)
   45E7 23            [ 6]  647 	inc	hl
   45E8 46            [ 7]  648 	ld	b,(hl)
   45E9 6B            [ 4]  649 	ld	l, e
   45EA 62            [ 4]  650 	ld	h, d
   45EB 29            [11]  651 	add	hl, hl
   45EC 09            [11]  652 	add	hl,bc
   45ED 46            [ 7]  653 	ld	b,(hl)
   45EE 23            [ 6]  654 	inc	hl
   45EF 66            [ 7]  655 	ld	h,(hl)
   45F0 10 17         [13]  656 	djnz	00116$
   45F2 7C            [ 4]  657 	ld	a,h
   45F3 B7            [ 4]  658 	or	a, a
   45F4 20 13         [12]  659 	jr	NZ,00116$
                            660 ;src/main.c:111: cpct_drawSolidBox(memptr, 3, 5, 20);
   45F6 C1            [10]  661 	pop	bc
   45F7 C5            [11]  662 	push	bc
   45F8 D5            [11]  663 	push	de
   45F9 21 05 14      [10]  664 	ld	hl,#0x1405
   45FC E5            [11]  665 	push	hl
   45FD 3E 03         [ 7]  666 	ld	a,#0x03
   45FF F5            [11]  667 	push	af
   4600 33            [ 6]  668 	inc	sp
   4601 C5            [11]  669 	push	bc
   4602 CD 08 4B      [17]  670 	call	_cpct_drawSolidBox
   4605 F1            [10]  671 	pop	af
   4606 F1            [10]  672 	pop	af
   4607 33            [ 6]  673 	inc	sp
   4608 D1            [10]  674 	pop	de
   4609                     675 00116$:
                            676 ;src/main.c:108: for(posX=0; posX<width;posX++){
   4609 13            [ 6]  677 	inc	de
   460A 7B            [ 4]  678 	ld	a,e
   460B D6 10         [ 7]  679 	sub	a, #0x10
   460D 7A            [ 4]  680 	ld	a,d
   460E 17            [ 4]  681 	rla
   460F 3F            [ 4]  682 	ccf
   4610 1F            [ 4]  683 	rra
   4611 DE 80         [ 7]  684 	sbc	a, #0x80
   4613 38 AC         [12]  685 	jr	C,00115$
                            686 ;src/main.c:107: for(posY=0; posY<height;posY++){
   4615 DD 34 FC      [23]  687 	inc	-4 (ix)
   4618 20 03         [12]  688 	jr	NZ,00163$
   461A DD 34 FD      [23]  689 	inc	-3 (ix)
   461D                     690 00163$:
   461D DD 7E FC      [19]  691 	ld	a,-4 (ix)
   4620 D6 0A         [ 7]  692 	sub	a, #0x0A
   4622 DD 7E FD      [19]  693 	ld	a,-3 (ix)
   4625 17            [ 4]  694 	rla
   4626 3F            [ 4]  695 	ccf
   4627 1F            [ 4]  696 	rra
   4628 DE 80         [ 7]  697 	sbc	a, #0x80
   462A DA AD 45      [10]  698 	jp	C,00126$
   462D DD F9         [10]  699 	ld	sp, ix
   462F DD E1         [14]  700 	pop	ix
   4631 C9            [10]  701 	ret
                            702 ;src/main.c:120: void game(){
                            703 ;	---------------------------------
                            704 ; Function game
                            705 ; ---------------------------------
   4632                     706 _game::
   4632 DD E5         [15]  707 	push	ix
   4634 DD 21 00 00   [14]  708 	ld	ix,#0
   4638 DD 39         [15]  709 	add	ix,sp
   463A 21 F0 FF      [10]  710 	ld	hl,#-16
   463D 39            [11]  711 	add	hl,sp
                            712 ;src/main.c:121: TPlayer p = { 0,100 };
   463E F9            [ 6]  713 	ld	sp, hl
   463F 23            [ 6]  714 	inc	hl
   4640 23            [ 6]  715 	inc	hl
   4641 36 00         [10]  716 	ld	(hl),#0x00
   4643 21 02 00      [10]  717 	ld	hl,#0x0002
   4646 39            [11]  718 	add	hl,sp
   4647 DD 75 FC      [19]  719 	ld	-4 (ix),l
   464A DD 74 FD      [19]  720 	ld	-3 (ix),h
   464D DD 7E FC      [19]  721 	ld	a,-4 (ix)
   4650 C6 01         [ 7]  722 	add	a, #0x01
   4652 DD 77 FE      [19]  723 	ld	-2 (ix),a
   4655 DD 7E FD      [19]  724 	ld	a,-3 (ix)
   4658 CE 00         [ 7]  725 	adc	a, #0x00
   465A DD 77 FF      [19]  726 	ld	-1 (ix),a
   465D DD 6E FE      [19]  727 	ld	l,-2 (ix)
   4660 DD 66 FF      [19]  728 	ld	h,-1 (ix)
   4663 36 64         [10]  729 	ld	(hl),#0x64
                            730 ;src/main.c:123: int i =1;
   4665 21 01 00      [10]  731 	ld	hl,#0x0001
   4668 E3            [19]  732 	ex	(sp), hl
                            733 ;src/main.c:124: u8* sprite = gladis_quieto_dcha;
   4669 DD 36 F6 00   [19]  734 	ld	-10 (ix),#<(_gladis_quieto_dcha)
   466D DD 36 F7 41   [19]  735 	ld	-9 (ix),#>(_gladis_quieto_dcha)
                            736 ;src/main.c:125: cpct_clearScreen(0);
   4671 21 00 40      [10]  737 	ld	hl,#0x4000
   4674 E5            [11]  738 	push	hl
   4675 AF            [ 4]  739 	xor	a, a
   4676 F5            [11]  740 	push	af
   4677 33            [ 6]  741 	inc	sp
   4678 26 C0         [ 7]  742 	ld	h, #0xC0
   467A E5            [11]  743 	push	hl
   467B CD E6 4A      [17]  744 	call	_cpct_memset
                            745 ;src/main.c:126: drawMap(i);
   467E 21 01 00      [10]  746 	ld	hl,#0x0001
   4681 E5            [11]  747 	push	hl
   4682 CD 21 45      [17]  748 	call	_drawMap
   4685 F1            [10]  749 	pop	af
                            750 ;src/main.c:127: while (1){
   4686                     751 00118$:
                            752 ;src/main.c:130: cpct_waitVSYNC();
   4686 CD CC 4A      [17]  753 	call	_cpct_waitVSYNC
                            754 ;src/main.c:133: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   4689 DD 6E FE      [19]  755 	ld	l,-2 (ix)
   468C DD 66 FF      [19]  756 	ld	h,-1 (ix)
   468F 46            [ 7]  757 	ld	b,(hl)
   4690 DD 6E FC      [19]  758 	ld	l,-4 (ix)
   4693 DD 66 FD      [19]  759 	ld	h,-3 (ix)
   4696 4E            [ 7]  760 	ld	c, (hl)
   4697 C5            [11]  761 	push	bc
   4698 21 00 C0      [10]  762 	ld	hl,#0xC000
   469B E5            [11]  763 	push	hl
   469C CD C0 4B      [17]  764 	call	_cpct_getScreenPtr
   469F DD 74 F5      [19]  765 	ld	-11 (ix),h
   46A2 DD 75 F4      [19]  766 	ld	-12 (ix), l
   46A5 DD 75 FA      [19]  767 	ld	-6 (ix), l
   46A8 DD 7E F5      [19]  768 	ld	a,-11 (ix)
   46AB DD 77 FB      [19]  769 	ld	-5 (ix),a
                            770 ;src/main.c:134: cpct_drawSolidBox(memptr,0,4,16);
   46AE 21 04 10      [10]  771 	ld	hl,#0x1004
   46B1 E5            [11]  772 	push	hl
   46B2 AF            [ 4]  773 	xor	a, a
   46B3 F5            [11]  774 	push	af
   46B4 33            [ 6]  775 	inc	sp
   46B5 DD 6E FA      [19]  776 	ld	l,-6 (ix)
   46B8 DD 66 FB      [19]  777 	ld	h,-5 (ix)
   46BB E5            [11]  778 	push	hl
   46BC CD 08 4B      [17]  779 	call	_cpct_drawSolidBox
   46BF F1            [10]  780 	pop	af
   46C0 F1            [10]  781 	pop	af
   46C1 33            [ 6]  782 	inc	sp
                            783 ;src/main.c:138: cpct_scanKeyboard_f();
   46C2 CD 33 49      [17]  784 	call	_cpct_scanKeyboard_f
                            785 ;src/main.c:139: if(cpct_isKeyPressed(Key_CursorRight) && p.x < 76 ){
   46C5 21 00 02      [10]  786 	ld	hl,#0x0200
   46C8 CD 27 49      [17]  787 	call	_cpct_isKeyPressed
   46CB DD 75 FA      [19]  788 	ld	-6 (ix), l
   46CE 7D            [ 4]  789 	ld	a, l
   46CF B7            [ 4]  790 	or	a, a
   46D0 28 1E         [12]  791 	jr	Z,00114$
   46D2 DD 6E FC      [19]  792 	ld	l,-4 (ix)
   46D5 DD 66 FD      [19]  793 	ld	h,-3 (ix)
   46D8 56            [ 7]  794 	ld	d,(hl)
   46D9 7A            [ 4]  795 	ld	a,d
   46DA D6 4C         [ 7]  796 	sub	a, #0x4C
   46DC 30 12         [12]  797 	jr	NC,00114$
                            798 ;src/main.c:140: p.x += 1;
   46DE 14            [ 4]  799 	inc	d
   46DF DD 6E FC      [19]  800 	ld	l,-4 (ix)
   46E2 DD 66 FD      [19]  801 	ld	h,-3 (ix)
   46E5 72            [ 7]  802 	ld	(hl),d
                            803 ;src/main.c:141: sprite = gladis_quieto_dcha;
   46E6 DD 36 F6 00   [19]  804 	ld	-10 (ix),#<(_gladis_quieto_dcha)
   46EA DD 36 F7 41   [19]  805 	ld	-9 (ix),#>(_gladis_quieto_dcha)
   46EE 18 6A         [12]  806 	jr	00115$
   46F0                     807 00114$:
                            808 ;src/main.c:142: }else if(cpct_isKeyPressed(Key_CursorLeft) && p.x > 0 ){
   46F0 21 01 01      [10]  809 	ld	hl,#0x0101
   46F3 CD 27 49      [17]  810 	call	_cpct_isKeyPressed
   46F6 7D            [ 4]  811 	ld	a,l
   46F7 B7            [ 4]  812 	or	a, a
   46F8 28 1D         [12]  813 	jr	Z,00110$
   46FA DD 6E FC      [19]  814 	ld	l,-4 (ix)
   46FD DD 66 FD      [19]  815 	ld	h,-3 (ix)
   4700 7E            [ 7]  816 	ld	a,(hl)
   4701 B7            [ 4]  817 	or	a, a
   4702 28 13         [12]  818 	jr	Z,00110$
                            819 ;src/main.c:143: p.x -= 1;
   4704 C6 FF         [ 7]  820 	add	a,#0xFF
   4706 DD 6E FC      [19]  821 	ld	l,-4 (ix)
   4709 DD 66 FD      [19]  822 	ld	h,-3 (ix)
   470C 77            [ 7]  823 	ld	(hl),a
                            824 ;src/main.c:144: sprite = gladis_quieto_izda;
   470D DD 36 F6 80   [19]  825 	ld	-10 (ix),#<(_gladis_quieto_izda)
   4711 DD 36 F7 41   [19]  826 	ld	-9 (ix),#>(_gladis_quieto_izda)
   4715 18 43         [12]  827 	jr	00115$
   4717                     828 00110$:
                            829 ;src/main.c:145: }else  if(cpct_isKeyPressed(Key_Esc)){
   4717 21 08 04      [10]  830 	ld	hl,#0x0408
   471A CD 27 49      [17]  831 	call	_cpct_isKeyPressed
   471D 7D            [ 4]  832 	ld	a,l
   471E B7            [ 4]  833 	or	a, a
                            834 ;src/main.c:146: return;
   471F C2 B2 47      [10]  835 	jp	NZ,00120$
                            836 ;src/main.c:147: }else if(cpct_isKeyPressed(Key_Space)){
   4722 21 05 80      [10]  837 	ld	hl,#0x8005
   4725 CD 27 49      [17]  838 	call	_cpct_isKeyPressed
   4728 7D            [ 4]  839 	ld	a,l
   4729 B7            [ 4]  840 	or	a, a
   472A 28 2E         [12]  841 	jr	Z,00115$
                            842 ;src/main.c:148: cpct_clearScreen(0);
   472C 21 00 40      [10]  843 	ld	hl,#0x4000
   472F E5            [11]  844 	push	hl
   4730 AF            [ 4]  845 	xor	a, a
   4731 F5            [11]  846 	push	af
   4732 33            [ 6]  847 	inc	sp
   4733 26 C0         [ 7]  848 	ld	h, #0xC0
   4735 E5            [11]  849 	push	hl
   4736 CD E6 4A      [17]  850 	call	_cpct_memset
                            851 ;src/main.c:149: if(i ==1 ) {i++;}
   4739 DD 7E F0      [19]  852 	ld	a,-16 (ix)
   473C 3D            [ 4]  853 	dec	a
   473D 20 10         [12]  854 	jr	NZ,00102$
   473F DD 7E F1      [19]  855 	ld	a,-15 (ix)
   4742 B7            [ 4]  856 	or	a, a
   4743 20 0A         [12]  857 	jr	NZ,00102$
   4745 DD 34 F0      [23]  858 	inc	-16 (ix)
   4748 20 09         [12]  859 	jr	NZ,00103$
   474A DD 34 F1      [23]  860 	inc	-15 (ix)
   474D 18 04         [12]  861 	jr	00103$
   474F                     862 00102$:
                            863 ;src/main.c:150: else {i--;}
   474F E1            [10]  864 	pop	hl
   4750 E5            [11]  865 	push	hl
   4751 2B            [ 6]  866 	dec	hl
   4752 E3            [19]  867 	ex	(sp), hl
   4753                     868 00103$:
                            869 ;src/main.c:151: drawMap(i);
   4753 E1            [10]  870 	pop	hl
   4754 E5            [11]  871 	push	hl
   4755 E5            [11]  872 	push	hl
   4756 CD 21 45      [17]  873 	call	_drawMap
   4759 F1            [10]  874 	pop	af
   475A                     875 00115$:
                            876 ;src/main.c:156: memptr = cpct_getScreenPtr(VMEM,p.x,p.y);
   475A DD 6E FE      [19]  877 	ld	l,-2 (ix)
   475D DD 66 FF      [19]  878 	ld	h,-1 (ix)
   4760 56            [ 7]  879 	ld	d,(hl)
   4761 DD 6E FC      [19]  880 	ld	l,-4 (ix)
   4764 DD 66 FD      [19]  881 	ld	h,-3 (ix)
   4767 46            [ 7]  882 	ld	b,(hl)
   4768 D5            [11]  883 	push	de
   4769 33            [ 6]  884 	inc	sp
   476A C5            [11]  885 	push	bc
   476B 33            [ 6]  886 	inc	sp
   476C 21 00 C0      [10]  887 	ld	hl,#0xC000
   476F E5            [11]  888 	push	hl
   4770 CD C0 4B      [17]  889 	call	_cpct_getScreenPtr
   4773 DD 74 FB      [19]  890 	ld	-5 (ix),h
   4776 DD 75 FA      [19]  891 	ld	-6 (ix), l
   4779 DD 75 F4      [19]  892 	ld	-12 (ix), l
   477C DD 7E FB      [19]  893 	ld	a,-5 (ix)
   477F DD 77 F5      [19]  894 	ld	-11 (ix),a
                            895 ;src/main.c:157: cpct_drawSpriteMasked(sprite,memptr,4,16);
   4782 DD 7E F4      [19]  896 	ld	a,-12 (ix)
   4785 DD 77 FA      [19]  897 	ld	-6 (ix),a
   4788 DD 7E F5      [19]  898 	ld	a,-11 (ix)
   478B DD 77 FB      [19]  899 	ld	-5 (ix),a
   478E DD 7E F6      [19]  900 	ld	a,-10 (ix)
   4791 DD 77 F8      [19]  901 	ld	-8 (ix),a
   4794 DD 7E F7      [19]  902 	ld	a,-9 (ix)
   4797 DD 77 F9      [19]  903 	ld	-7 (ix),a
   479A 21 04 10      [10]  904 	ld	hl,#0x1004
   479D E5            [11]  905 	push	hl
   479E DD 6E FA      [19]  906 	ld	l,-6 (ix)
   47A1 DD 66 FB      [19]  907 	ld	h,-5 (ix)
   47A4 E5            [11]  908 	push	hl
   47A5 DD 6E F8      [19]  909 	ld	l,-8 (ix)
   47A8 DD 66 F9      [19]  910 	ld	h,-7 (ix)
   47AB E5            [11]  911 	push	hl
   47AC CD 82 4A      [17]  912 	call	_cpct_drawSpriteMasked
   47AF C3 86 46      [10]  913 	jp	00118$
   47B2                     914 00120$:
   47B2 DD F9         [10]  915 	ld	sp, ix
   47B4 DD E1         [14]  916 	pop	ix
   47B6 C9            [10]  917 	ret
                            918 ;src/main.c:168: void loadMap(){
                            919 ;	---------------------------------
                            920 ; Function loadMap
                            921 ; ---------------------------------
   47B7                     922 _loadMap::
                            923 ;src/main.c:170: }
   47B7 C9            [10]  924 	ret
                            925 ;src/main.c:175: void main(void) {
                            926 ;	---------------------------------
                            927 ; Function main
                            928 ; ---------------------------------
   47B8                     929 _main::
                            930 ;src/main.c:177: init();
   47B8 CD 00 42      [17]  931 	call	_init
                            932 ;src/main.c:181: while(1){
   47BB                     933 00102$:
                            934 ;src/main.c:182: menu();
   47BB CD BB 44      [17]  935 	call	_menu
                            936 ;src/main.c:184: game();
   47BE CD 32 46      [17]  937 	call	_game
   47C1 18 F8         [12]  938 	jr	00102$
                            939 	.area _CODE
                            940 	.area _INITIALIZER
                            941 	.area _CABS (ABS)
