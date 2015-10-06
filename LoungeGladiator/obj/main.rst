                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (CYGWIN)
                              4 ; This file was generated Tue Oct  6 12:25:12 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _credits
                             14 	.globl _game
                             15 	.globl _drawSomething
                             16 	.globl _create_Player
                             17 	.globl _move
                             18 	.globl _checkKeyboard
                             19 	.globl _checkEnemiesCollisions
                             20 	.globl _checkArrowCollisions
                             21 	.globl _checkBoundsCollisions
                             22 	.globl _initPlayers
                             23 	.globl _drawPlayers
                             24 	.globl _cleanScreenPlayers
                             25 	.globl _drawObjects
                             26 	.globl _drawMap
                             27 	.globl _menu
                             28 	.globl _init
                             29 	.globl _cpct_getScreenPtr
                             30 	.globl _cpct_setPalette
                             31 	.globl _cpct_fw2hw
                             32 	.globl _cpct_waitVSYNC
                             33 	.globl _cpct_setVideoMode
                             34 	.globl _cpct_drawStringM0
                             35 	.globl _cpct_drawSolidBox
                             36 	.globl _cpct_drawSpriteMasked
                             37 	.globl _cpct_isKeyPressed
                             38 	.globl _cpct_scanKeyboard_f
                             39 	.globl _cpct_scanKeyboard
                             40 	.globl _cpct_memset
                             41 	.globl _cpct_disableFirmware
                             42 	.globl _rand
                             43 	.globl _free
                             44 	.globl _malloc
                             45 	.globl __assert
                             46 	.globl _scene
                             47 	.globl _mapa2
                             48 	.globl _mapa1
                             49 	.globl _g_palette
                             50 ;--------------------------------------------------------
                             51 ; special function registers
                             52 ;--------------------------------------------------------
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DATA
   736E                      57 _scene::
   736E                      58 	.ds 24
                             59 ;--------------------------------------------------------
                             60 ; ram data
                             61 ;--------------------------------------------------------
                             62 	.area _INITIALIZED
                             63 ;--------------------------------------------------------
                             64 ; absolute external ram data
                             65 ;--------------------------------------------------------
                             66 	.area _DABS (ABS)
                             67 ;--------------------------------------------------------
                             68 ; global & static initialisations
                             69 ;--------------------------------------------------------
                             70 	.area _HOME
                             71 	.area _GSINIT
                             72 	.area _GSFINAL
                             73 	.area _GSINIT
                             74 ;--------------------------------------------------------
                             75 ; Home
                             76 ;--------------------------------------------------------
                             77 	.area _HOME
                             78 	.area _HOME
                             79 ;--------------------------------------------------------
                             80 ; code
                             81 ;--------------------------------------------------------
                             82 	.area _CODE
                             83 ;src/main.c:34: void init(){
                             84 ;	---------------------------------
                             85 ; Function init
                             86 ; ---------------------------------
   4784                      87 _init::
                             88 ;src/main.c:35: cpct_disableFirmware();
   4784 CD 46 66      [17]   89 	call	_cpct_disableFirmware
                             90 ;src/main.c:36: cpct_setVideoMode(0);
   4787 AF            [ 4]   91 	xor	a, a
   4788 F5            [11]   92 	push	af
   4789 33            [ 6]   93 	inc	sp
   478A CD DA 65      [17]   94 	call	_cpct_setVideoMode
   478D 33            [ 6]   95 	inc	sp
                             96 ;src/main.c:37: cpct_fw2hw(g_palette,4);
   478E 11 A9 47      [10]   97 	ld	de,#_g_palette
   4791 3E 04         [ 7]   98 	ld	a,#0x04
   4793 F5            [11]   99 	push	af
   4794 33            [ 6]  100 	inc	sp
   4795 D5            [11]  101 	push	de
   4796 CD 31 64      [17]  102 	call	_cpct_fw2hw
   4799 F1            [10]  103 	pop	af
   479A 33            [ 6]  104 	inc	sp
                            105 ;src/main.c:38: cpct_setPalette(g_palette,4);
   479B 11 A9 47      [10]  106 	ld	de,#_g_palette
   479E 3E 04         [ 7]  107 	ld	a,#0x04
   47A0 F5            [11]  108 	push	af
   47A1 33            [ 6]  109 	inc	sp
   47A2 D5            [11]  110 	push	de
   47A3 CD 00 62      [17]  111 	call	_cpct_setPalette
   47A6 F1            [10]  112 	pop	af
   47A7 33            [ 6]  113 	inc	sp
   47A8 C9            [10]  114 	ret
   47A9                     115 _g_palette:
   47A9 00                  116 	.db #0x00	; 0
   47AA 1A                  117 	.db #0x1A	; 26
   47AB 06                  118 	.db #0x06	; 6
   47AC 12                  119 	.db #0x12	; 18
   47AD                     120 _mapa1:
   47AD 01 00               121 	.dw #0x0001
   47AF 01 00               122 	.dw #0x0001
   47B1 01 00               123 	.dw #0x0001
   47B3 01 00               124 	.dw #0x0001
   47B5 01 00               125 	.dw #0x0001
   47B7 01 00               126 	.dw #0x0001
   47B9 01 00               127 	.dw #0x0001
   47BB 01 00               128 	.dw #0x0001
   47BD 01 00               129 	.dw #0x0001
   47BF 01 00               130 	.dw #0x0001
   47C1 01 00               131 	.dw #0x0001
   47C3 01 00               132 	.dw #0x0001
   47C5 01 00               133 	.dw #0x0001
   47C7 01 00               134 	.dw #0x0001
   47C9 01 00               135 	.dw #0x0001
   47CB 01 00               136 	.dw #0x0001
   47CD 01 00               137 	.dw #0x0001
   47CF 01 00               138 	.dw #0x0001
   47D1 01 00               139 	.dw #0x0001
   47D3 01 00               140 	.dw #0x0001
   47D5 01 00               141 	.dw #0x0001
   47D7 00 00               142 	.dw #0x0000
   47D9 00 00               143 	.dw #0x0000
   47DB 00 00               144 	.dw #0x0000
   47DD 00 00               145 	.dw #0x0000
   47DF 00 00               146 	.dw #0x0000
   47E1 00 00               147 	.dw #0x0000
   47E3 00 00               148 	.dw #0x0000
   47E5 00 00               149 	.dw #0x0000
   47E7 00 00               150 	.dw #0x0000
   47E9 00 00               151 	.dw #0x0000
   47EB 00 00               152 	.dw #0x0000
   47ED 00 00               153 	.dw #0x0000
   47EF 00 00               154 	.dw #0x0000
   47F1 00 00               155 	.dw #0x0000
   47F3 00 00               156 	.dw #0x0000
   47F5 00 00               157 	.dw #0x0000
   47F7 00 00               158 	.dw #0x0000
   47F9 00 00               159 	.dw #0x0000
   47FB 01 00               160 	.dw #0x0001
   47FD 01 00               161 	.dw #0x0001
   47FF 00 00               162 	.dw #0x0000
   4801 00 00               163 	.dw #0x0000
   4803 00 00               164 	.dw #0x0000
   4805 00 00               165 	.dw #0x0000
   4807 00 00               166 	.dw #0x0000
   4809 00 00               167 	.dw #0x0000
   480B 00 00               168 	.dw #0x0000
   480D 00 00               169 	.dw #0x0000
   480F 00 00               170 	.dw #0x0000
   4811 00 00               171 	.dw #0x0000
   4813 00 00               172 	.dw #0x0000
   4815 00 00               173 	.dw #0x0000
   4817 00 00               174 	.dw #0x0000
   4819 00 00               175 	.dw #0x0000
   481B 00 00               176 	.dw #0x0000
   481D 00 00               177 	.dw #0x0000
   481F 00 00               178 	.dw #0x0000
   4821 00 00               179 	.dw #0x0000
   4823 01 00               180 	.dw #0x0001
   4825 01 00               181 	.dw #0x0001
   4827 01 00               182 	.dw #0x0001
   4829 01 00               183 	.dw #0x0001
   482B 01 00               184 	.dw #0x0001
   482D 01 00               185 	.dw #0x0001
   482F 01 00               186 	.dw #0x0001
   4831 01 00               187 	.dw #0x0001
   4833 01 00               188 	.dw #0x0001
   4835 01 00               189 	.dw #0x0001
   4837 01 00               190 	.dw #0x0001
   4839 01 00               191 	.dw #0x0001
   483B 01 00               192 	.dw #0x0001
   483D 01 00               193 	.dw #0x0001
   483F 01 00               194 	.dw #0x0001
   4841 01 00               195 	.dw #0x0001
   4843 00 00               196 	.dw #0x0000
   4845 01 00               197 	.dw #0x0001
   4847 01 00               198 	.dw #0x0001
   4849 01 00               199 	.dw #0x0001
   484B 01 00               200 	.dw #0x0001
   484D 01 00               201 	.dw #0x0001
   484F 00 00               202 	.dw #0x0000
   4851 00 00               203 	.dw #0x0000
   4853 00 00               204 	.dw #0x0000
   4855 00 00               205 	.dw #0x0000
   4857 00 00               206 	.dw #0x0000
   4859 00 00               207 	.dw #0x0000
   485B 00 00               208 	.dw #0x0000
   485D 00 00               209 	.dw #0x0000
   485F 00 00               210 	.dw #0x0000
   4861 00 00               211 	.dw #0x0000
   4863 01 00               212 	.dw #0x0001
   4865 00 00               213 	.dw #0x0000
   4867 00 00               214 	.dw #0x0000
   4869 00 00               215 	.dw #0x0000
   486B 00 00               216 	.dw #0x0000
   486D 00 00               217 	.dw #0x0000
   486F 00 00               218 	.dw #0x0000
   4871 00 00               219 	.dw #0x0000
   4873 01 00               220 	.dw #0x0001
   4875 00 00               221 	.dw #0x0000
   4877 00 00               222 	.dw #0x0000
   4879 01 00               223 	.dw #0x0001
   487B 01 00               224 	.dw #0x0001
   487D 00 00               225 	.dw #0x0000
   487F 01 00               226 	.dw #0x0001
   4881 01 00               227 	.dw #0x0001
   4883 01 00               228 	.dw #0x0001
   4885 02 00               229 	.dw #0x0002
   4887 02 00               230 	.dw #0x0002
   4889 02 00               231 	.dw #0x0002
   488B 01 00               232 	.dw #0x0001
   488D 00 00               233 	.dw #0x0000
   488F 00 00               234 	.dw #0x0000
   4891 00 00               235 	.dw #0x0000
   4893 00 00               236 	.dw #0x0000
   4895 00 00               237 	.dw #0x0000
   4897 00 00               238 	.dw #0x0000
   4899 00 00               239 	.dw #0x0000
   489B 01 00               240 	.dw #0x0001
   489D 01 00               241 	.dw #0x0001
   489F 00 00               242 	.dw #0x0000
   48A1 01 00               243 	.dw #0x0001
   48A3 02 00               244 	.dw #0x0002
   48A5 02 00               245 	.dw #0x0002
   48A7 02 00               246 	.dw #0x0002
   48A9 02 00               247 	.dw #0x0002
   48AB 01 00               248 	.dw #0x0001
   48AD 00 00               249 	.dw #0x0000
   48AF 00 00               250 	.dw #0x0000
   48B1 00 00               251 	.dw #0x0000
   48B3 01 00               252 	.dw #0x0001
   48B5 00 00               253 	.dw #0x0000
   48B7 00 00               254 	.dw #0x0000
   48B9 00 00               255 	.dw #0x0000
   48BB 00 00               256 	.dw #0x0000
   48BD 00 00               257 	.dw #0x0000
   48BF 00 00               258 	.dw #0x0000
   48C1 00 00               259 	.dw #0x0000
   48C3 01 00               260 	.dw #0x0001
   48C5 01 00               261 	.dw #0x0001
   48C7 00 00               262 	.dw #0x0000
   48C9 01 00               263 	.dw #0x0001
   48CB 02 00               264 	.dw #0x0002
   48CD 02 00               265 	.dw #0x0002
   48CF 02 00               266 	.dw #0x0002
   48D1 02 00               267 	.dw #0x0002
   48D3 01 00               268 	.dw #0x0001
   48D5 02 00               269 	.dw #0x0002
   48D7 02 00               270 	.dw #0x0002
   48D9 02 00               271 	.dw #0x0002
   48DB 01 00               272 	.dw #0x0001
   48DD 00 00               273 	.dw #0x0000
   48DF 00 00               274 	.dw #0x0000
   48E1 00 00               275 	.dw #0x0000
   48E3 00 00               276 	.dw #0x0000
   48E5 00 00               277 	.dw #0x0000
   48E7 00 00               278 	.dw #0x0000
   48E9 00 00               279 	.dw #0x0000
   48EB 01 00               280 	.dw #0x0001
   48ED 01 00               281 	.dw #0x0001
   48EF 00 00               282 	.dw #0x0000
   48F1 01 00               283 	.dw #0x0001
   48F3 02 00               284 	.dw #0x0002
   48F5 02 00               285 	.dw #0x0002
   48F7 06 00               286 	.dw #0x0006
   48F9 02 00               287 	.dw #0x0002
   48FB 01 00               288 	.dw #0x0001
   48FD 00 00               289 	.dw #0x0000
   48FF 00 00               290 	.dw #0x0000
   4901 00 00               291 	.dw #0x0000
   4903 01 00               292 	.dw #0x0001
   4905 00 00               293 	.dw #0x0000
   4907 00 00               294 	.dw #0x0000
   4909 00 00               295 	.dw #0x0000
   490B 00 00               296 	.dw #0x0000
   490D 00 00               297 	.dw #0x0000
   490F 00 00               298 	.dw #0x0000
   4911 00 00               299 	.dw #0x0000
   4913 01 00               300 	.dw #0x0001
   4915 01 00               301 	.dw #0x0001
   4917 00 00               302 	.dw #0x0000
   4919 01 00               303 	.dw #0x0001
   491B 02 00               304 	.dw #0x0002
   491D 02 00               305 	.dw #0x0002
   491F 02 00               306 	.dw #0x0002
   4921 02 00               307 	.dw #0x0002
   4923 01 00               308 	.dw #0x0001
   4925 02 00               309 	.dw #0x0002
   4927 02 00               310 	.dw #0x0002
   4929 02 00               311 	.dw #0x0002
   492B 01 00               312 	.dw #0x0001
   492D 00 00               313 	.dw #0x0000
   492F 00 00               314 	.dw #0x0000
   4931 00 00               315 	.dw #0x0000
   4933 00 00               316 	.dw #0x0000
   4935 00 00               317 	.dw #0x0000
   4937 00 00               318 	.dw #0x0000
   4939 00 00               319 	.dw #0x0000
   493B 01 00               320 	.dw #0x0001
   493D 01 00               321 	.dw #0x0001
   493F 05 00               322 	.dw #0x0005
   4941 01 00               323 	.dw #0x0001
   4943 02 00               324 	.dw #0x0002
   4945 02 00               325 	.dw #0x0002
   4947 02 00               326 	.dw #0x0002
   4949 02 00               327 	.dw #0x0002
   494B 01 00               328 	.dw #0x0001
   494D 00 00               329 	.dw #0x0000
   494F 00 00               330 	.dw #0x0000
   4951 00 00               331 	.dw #0x0000
   4953 00 00               332 	.dw #0x0000
   4955 00 00               333 	.dw #0x0000
   4957 00 00               334 	.dw #0x0000
   4959 00 00               335 	.dw #0x0000
   495B 00 00               336 	.dw #0x0000
   495D 00 00               337 	.dw #0x0000
   495F 00 00               338 	.dw #0x0000
   4961 00 00               339 	.dw #0x0000
   4963 01 00               340 	.dw #0x0001
   4965 01 00               341 	.dw #0x0001
   4967 01 00               342 	.dw #0x0001
   4969 01 00               343 	.dw #0x0001
   496B 01 00               344 	.dw #0x0001
   496D 01 00               345 	.dw #0x0001
   496F 01 00               346 	.dw #0x0001
   4971 01 00               347 	.dw #0x0001
   4973 01 00               348 	.dw #0x0001
   4975 01 00               349 	.dw #0x0001
   4977 01 00               350 	.dw #0x0001
   4979 01 00               351 	.dw #0x0001
   497B 01 00               352 	.dw #0x0001
   497D 01 00               353 	.dw #0x0001
   497F 01 00               354 	.dw #0x0001
   4981 01 00               355 	.dw #0x0001
   4983 09 00               356 	.dw #0x0009
   4985 01 00               357 	.dw #0x0001
   4987 01 00               358 	.dw #0x0001
   4989 01 00               359 	.dw #0x0001
   498B 01 00               360 	.dw #0x0001
   498D                     361 _mapa2:
   498D 01 00               362 	.dw #0x0001
   498F 01 00               363 	.dw #0x0001
   4991 01 00               364 	.dw #0x0001
   4993 01 00               365 	.dw #0x0001
   4995 01 00               366 	.dw #0x0001
   4997 01 00               367 	.dw #0x0001
   4999 01 00               368 	.dw #0x0001
   499B 01 00               369 	.dw #0x0001
   499D 01 00               370 	.dw #0x0001
   499F 01 00               371 	.dw #0x0001
   49A1 01 00               372 	.dw #0x0001
   49A3 01 00               373 	.dw #0x0001
   49A5 01 00               374 	.dw #0x0001
   49A7 01 00               375 	.dw #0x0001
   49A9 01 00               376 	.dw #0x0001
   49AB 01 00               377 	.dw #0x0001
   49AD 01 00               378 	.dw #0x0001
   49AF 01 00               379 	.dw #0x0001
   49B1 01 00               380 	.dw #0x0001
   49B3 01 00               381 	.dw #0x0001
   49B5 01 00               382 	.dw #0x0001
   49B7 00 00               383 	.dw #0x0000
   49B9 00 00               384 	.dw #0x0000
   49BB 00 00               385 	.dw #0x0000
   49BD 00 00               386 	.dw #0x0000
   49BF 01 00               387 	.dw #0x0001
   49C1 00 00               388 	.dw #0x0000
   49C3 00 00               389 	.dw #0x0000
   49C5 00 00               390 	.dw #0x0000
   49C7 00 00               391 	.dw #0x0000
   49C9 00 00               392 	.dw #0x0000
   49CB 00 00               393 	.dw #0x0000
   49CD 00 00               394 	.dw #0x0000
   49CF 00 00               395 	.dw #0x0000
   49D1 00 00               396 	.dw #0x0000
   49D3 00 00               397 	.dw #0x0000
   49D5 00 00               398 	.dw #0x0000
   49D7 00 00               399 	.dw #0x0000
   49D9 00 00               400 	.dw #0x0000
   49DB 06 00               401 	.dw #0x0006
   49DD 01 00               402 	.dw #0x0001
   49DF 00 00               403 	.dw #0x0000
   49E1 00 00               404 	.dw #0x0000
   49E3 01 00               405 	.dw #0x0001
   49E5 00 00               406 	.dw #0x0000
   49E7 00 00               407 	.dw #0x0000
   49E9 00 00               408 	.dw #0x0000
   49EB 00 00               409 	.dw #0x0000
   49ED 00 00               410 	.dw #0x0000
   49EF 00 00               411 	.dw #0x0000
   49F1 00 00               412 	.dw #0x0000
   49F3 00 00               413 	.dw #0x0000
   49F5 00 00               414 	.dw #0x0000
   49F7 00 00               415 	.dw #0x0000
   49F9 00 00               416 	.dw #0x0000
   49FB 00 00               417 	.dw #0x0000
   49FD 00 00               418 	.dw #0x0000
   49FF 00 00               419 	.dw #0x0000
   4A01 00 00               420 	.dw #0x0000
   4A03 01 00               421 	.dw #0x0001
   4A05 01 00               422 	.dw #0x0001
   4A07 00 00               423 	.dw #0x0000
   4A09 01 00               424 	.dw #0x0001
   4A0B 01 00               425 	.dw #0x0001
   4A0D 01 00               426 	.dw #0x0001
   4A0F 01 00               427 	.dw #0x0001
   4A11 00 00               428 	.dw #0x0000
   4A13 00 00               429 	.dw #0x0000
   4A15 01 00               430 	.dw #0x0001
   4A17 01 00               431 	.dw #0x0001
   4A19 01 00               432 	.dw #0x0001
   4A1B 01 00               433 	.dw #0x0001
   4A1D 01 00               434 	.dw #0x0001
   4A1F 01 00               435 	.dw #0x0001
   4A21 01 00               436 	.dw #0x0001
   4A23 01 00               437 	.dw #0x0001
   4A25 01 00               438 	.dw #0x0001
   4A27 01 00               439 	.dw #0x0001
   4A29 01 00               440 	.dw #0x0001
   4A2B 01 00               441 	.dw #0x0001
   4A2D 01 00               442 	.dw #0x0001
   4A2F 00 00               443 	.dw #0x0000
   4A31 05 00               444 	.dw #0x0005
   4A33 01 00               445 	.dw #0x0001
   4A35 00 00               446 	.dw #0x0000
   4A37 00 00               447 	.dw #0x0000
   4A39 00 00               448 	.dw #0x0000
   4A3B 00 00               449 	.dw #0x0000
   4A3D 00 00               450 	.dw #0x0000
   4A3F 00 00               451 	.dw #0x0000
   4A41 00 00               452 	.dw #0x0000
   4A43 01 00               453 	.dw #0x0001
   4A45 00 00               454 	.dw #0x0000
   4A47 00 00               455 	.dw #0x0000
   4A49 00 00               456 	.dw #0x0000
   4A4B 00 00               457 	.dw #0x0000
   4A4D 00 00               458 	.dw #0x0000
   4A4F 00 00               459 	.dw #0x0000
   4A51 00 00               460 	.dw #0x0000
   4A53 01 00               461 	.dw #0x0001
   4A55 01 00               462 	.dw #0x0001
   4A57 00 00               463 	.dw #0x0000
   4A59 01 00               464 	.dw #0x0001
   4A5B 01 00               465 	.dw #0x0001
   4A5D 00 00               466 	.dw #0x0000
   4A5F 01 00               467 	.dw #0x0001
   4A61 01 00               468 	.dw #0x0001
   4A63 01 00               469 	.dw #0x0001
   4A65 02 00               470 	.dw #0x0002
   4A67 02 00               471 	.dw #0x0002
   4A69 02 00               472 	.dw #0x0002
   4A6B 01 00               473 	.dw #0x0001
   4A6D 00 00               474 	.dw #0x0000
   4A6F 00 00               475 	.dw #0x0000
   4A71 00 00               476 	.dw #0x0000
   4A73 05 00               477 	.dw #0x0005
   4A75 00 00               478 	.dw #0x0000
   4A77 00 00               479 	.dw #0x0000
   4A79 00 00               480 	.dw #0x0000
   4A7B 01 00               481 	.dw #0x0001
   4A7D 01 00               482 	.dw #0x0001
   4A7F 00 00               483 	.dw #0x0000
   4A81 01 00               484 	.dw #0x0001
   4A83 02 00               485 	.dw #0x0002
   4A85 02 00               486 	.dw #0x0002
   4A87 02 00               487 	.dw #0x0002
   4A89 02 00               488 	.dw #0x0002
   4A8B 01 00               489 	.dw #0x0001
   4A8D 00 00               490 	.dw #0x0000
   4A8F 00 00               491 	.dw #0x0000
   4A91 00 00               492 	.dw #0x0000
   4A93 01 00               493 	.dw #0x0001
   4A95 00 00               494 	.dw #0x0000
   4A97 00 00               495 	.dw #0x0000
   4A99 00 00               496 	.dw #0x0000
   4A9B 05 00               497 	.dw #0x0005
   4A9D 00 00               498 	.dw #0x0000
   4A9F 00 00               499 	.dw #0x0000
   4AA1 00 00               500 	.dw #0x0000
   4AA3 01 00               501 	.dw #0x0001
   4AA5 01 00               502 	.dw #0x0001
   4AA7 00 00               503 	.dw #0x0000
   4AA9 01 00               504 	.dw #0x0001
   4AAB 02 00               505 	.dw #0x0002
   4AAD 02 00               506 	.dw #0x0002
   4AAF 02 00               507 	.dw #0x0002
   4AB1 02 00               508 	.dw #0x0002
   4AB3 01 00               509 	.dw #0x0001
   4AB5 02 00               510 	.dw #0x0002
   4AB7 02 00               511 	.dw #0x0002
   4AB9 02 00               512 	.dw #0x0002
   4ABB 01 00               513 	.dw #0x0001
   4ABD 00 00               514 	.dw #0x0000
   4ABF 00 00               515 	.dw #0x0000
   4AC1 00 00               516 	.dw #0x0000
   4AC3 05 00               517 	.dw #0x0005
   4AC5 00 00               518 	.dw #0x0000
   4AC7 00 00               519 	.dw #0x0000
   4AC9 00 00               520 	.dw #0x0000
   4ACB 01 00               521 	.dw #0x0001
   4ACD 01 00               522 	.dw #0x0001
   4ACF 00 00               523 	.dw #0x0000
   4AD1 01 00               524 	.dw #0x0001
   4AD3 02 00               525 	.dw #0x0002
   4AD5 02 00               526 	.dw #0x0002
   4AD7 02 00               527 	.dw #0x0002
   4AD9 02 00               528 	.dw #0x0002
   4ADB 01 00               529 	.dw #0x0001
   4ADD 00 00               530 	.dw #0x0000
   4ADF 00 00               531 	.dw #0x0000
   4AE1 00 00               532 	.dw #0x0000
   4AE3 01 00               533 	.dw #0x0001
   4AE5 00 00               534 	.dw #0x0000
   4AE7 00 00               535 	.dw #0x0000
   4AE9 00 00               536 	.dw #0x0000
   4AEB 00 00               537 	.dw #0x0000
   4AED 00 00               538 	.dw #0x0000
   4AEF 00 00               539 	.dw #0x0000
   4AF1 00 00               540 	.dw #0x0000
   4AF3 01 00               541 	.dw #0x0001
   4AF5 01 00               542 	.dw #0x0001
   4AF7 00 00               543 	.dw #0x0000
   4AF9 01 00               544 	.dw #0x0001
   4AFB 02 00               545 	.dw #0x0002
   4AFD 02 00               546 	.dw #0x0002
   4AFF 02 00               547 	.dw #0x0002
   4B01 02 00               548 	.dw #0x0002
   4B03 01 00               549 	.dw #0x0001
   4B05 02 00               550 	.dw #0x0002
   4B07 02 00               551 	.dw #0x0002
   4B09 02 00               552 	.dw #0x0002
   4B0B 01 00               553 	.dw #0x0001
   4B0D 00 00               554 	.dw #0x0000
   4B0F 00 00               555 	.dw #0x0000
   4B11 00 00               556 	.dw #0x0000
   4B13 00 00               557 	.dw #0x0000
   4B15 00 00               558 	.dw #0x0000
   4B17 00 00               559 	.dw #0x0000
   4B19 00 00               560 	.dw #0x0000
   4B1B 01 00               561 	.dw #0x0001
   4B1D 01 00               562 	.dw #0x0001
   4B1F 05 00               563 	.dw #0x0005
   4B21 01 00               564 	.dw #0x0001
   4B23 02 00               565 	.dw #0x0002
   4B25 02 00               566 	.dw #0x0002
   4B27 02 00               567 	.dw #0x0002
   4B29 02 00               568 	.dw #0x0002
   4B2B 01 00               569 	.dw #0x0001
   4B2D 00 00               570 	.dw #0x0000
   4B2F 00 00               571 	.dw #0x0000
   4B31 00 00               572 	.dw #0x0000
   4B33 00 00               573 	.dw #0x0000
   4B35 00 00               574 	.dw #0x0000
   4B37 00 00               575 	.dw #0x0000
   4B39 00 00               576 	.dw #0x0000
   4B3B 00 00               577 	.dw #0x0000
   4B3D 00 00               578 	.dw #0x0000
   4B3F 00 00               579 	.dw #0x0000
   4B41 00 00               580 	.dw #0x0000
   4B43 01 00               581 	.dw #0x0001
   4B45 01 00               582 	.dw #0x0001
   4B47 01 00               583 	.dw #0x0001
   4B49 01 00               584 	.dw #0x0001
   4B4B 01 00               585 	.dw #0x0001
   4B4D 01 00               586 	.dw #0x0001
   4B4F 01 00               587 	.dw #0x0001
   4B51 01 00               588 	.dw #0x0001
   4B53 01 00               589 	.dw #0x0001
   4B55 01 00               590 	.dw #0x0001
   4B57 01 00               591 	.dw #0x0001
   4B59 01 00               592 	.dw #0x0001
   4B5B 01 00               593 	.dw #0x0001
   4B5D 01 00               594 	.dw #0x0001
   4B5F 01 00               595 	.dw #0x0001
   4B61 01 00               596 	.dw #0x0001
   4B63 00 00               597 	.dw #0x0000
   4B65 01 00               598 	.dw #0x0001
   4B67 01 00               599 	.dw #0x0001
   4B69 01 00               600 	.dw #0x0001
   4B6B 01 00               601 	.dw #0x0001
                            602 ;src/main.c:42: int menu(){
                            603 ;	---------------------------------
                            604 ; Function menu
                            605 ; ---------------------------------
   4B6D                     606 _menu::
   4B6D DD E5         [15]  607 	push	ix
   4B6F DD 21 00 00   [14]  608 	ld	ix,#0
   4B73 DD 39         [15]  609 	add	ix,sp
   4B75 21 FA FF      [10]  610 	ld	hl,#-6
   4B78 39            [11]  611 	add	hl,sp
   4B79 F9            [ 6]  612 	ld	sp,hl
                            613 ;src/main.c:44: int init = 50;
   4B7A DD 36 FC 32   [19]  614 	ld	-4 (ix),#0x32
   4B7E DD 36 FD 00   [19]  615 	ld	-3 (ix),#0x00
                            616 ;src/main.c:45: int pushed =0;
   4B82 21 00 00      [10]  617 	ld	hl,#0x0000
   4B85 E3            [19]  618 	ex	(sp), hl
                            619 ;src/main.c:46: int cont =0;
   4B86 11 00 00      [10]  620 	ld	de,#0x0000
                            621 ;src/main.c:47: cpct_clearScreen(0);
   4B89 D5            [11]  622 	push	de
   4B8A 21 00 40      [10]  623 	ld	hl,#0x4000
   4B8D E5            [11]  624 	push	hl
   4B8E AF            [ 4]  625 	xor	a, a
   4B8F F5            [11]  626 	push	af
   4B90 33            [ 6]  627 	inc	sp
   4B91 26 C0         [ 7]  628 	ld	h, #0xC0
   4B93 E5            [11]  629 	push	hl
   4B94 CD 35 66      [17]  630 	call	_cpct_memset
   4B97 21 0A 0A      [10]  631 	ld	hl,#0x0A0A
   4B9A E5            [11]  632 	push	hl
   4B9B 21 00 C0      [10]  633 	ld	hl,#0xC000
   4B9E E5            [11]  634 	push	hl
   4B9F CD 28 67      [17]  635 	call	_cpct_getScreenPtr
   4BA2 D1            [10]  636 	pop	de
                            637 ;src/main.c:50: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   4BA3 4D            [ 4]  638 	ld	c, l
   4BA4 44            [ 4]  639 	ld	b, h
   4BA5 D5            [11]  640 	push	de
   4BA6 21 01 00      [10]  641 	ld	hl,#0x0001
   4BA9 E5            [11]  642 	push	hl
   4BAA C5            [11]  643 	push	bc
   4BAB 21 50 4D      [10]  644 	ld	hl,#___str_0
   4BAE E5            [11]  645 	push	hl
   4BAF CD 11 63      [17]  646 	call	_cpct_drawStringM0
   4BB2 21 06 00      [10]  647 	ld	hl,#6
   4BB5 39            [11]  648 	add	hl,sp
   4BB6 F9            [ 6]  649 	ld	sp,hl
   4BB7 21 14 32      [10]  650 	ld	hl,#0x3214
   4BBA E5            [11]  651 	push	hl
   4BBB 21 00 C0      [10]  652 	ld	hl,#0xC000
   4BBE E5            [11]  653 	push	hl
   4BBF CD 28 67      [17]  654 	call	_cpct_getScreenPtr
   4BC2 D1            [10]  655 	pop	de
                            656 ;src/main.c:54: cpct_drawStringM0("Nueva Partida",memptr,1,0);
   4BC3 4D            [ 4]  657 	ld	c, l
   4BC4 44            [ 4]  658 	ld	b, h
   4BC5 D5            [11]  659 	push	de
   4BC6 21 01 00      [10]  660 	ld	hl,#0x0001
   4BC9 E5            [11]  661 	push	hl
   4BCA C5            [11]  662 	push	bc
   4BCB 21 61 4D      [10]  663 	ld	hl,#___str_1
   4BCE E5            [11]  664 	push	hl
   4BCF CD 11 63      [17]  665 	call	_cpct_drawStringM0
   4BD2 21 06 00      [10]  666 	ld	hl,#6
   4BD5 39            [11]  667 	add	hl,sp
   4BD6 F9            [ 6]  668 	ld	sp,hl
   4BD7 21 14 46      [10]  669 	ld	hl,#0x4614
   4BDA E5            [11]  670 	push	hl
   4BDB 21 00 C0      [10]  671 	ld	hl,#0xC000
   4BDE E5            [11]  672 	push	hl
   4BDF CD 28 67      [17]  673 	call	_cpct_getScreenPtr
   4BE2 D1            [10]  674 	pop	de
                            675 ;src/main.c:57: cpct_drawStringM0("Creditos",memptr,1,0);
   4BE3 4D            [ 4]  676 	ld	c, l
   4BE4 44            [ 4]  677 	ld	b, h
   4BE5 D5            [11]  678 	push	de
   4BE6 21 01 00      [10]  679 	ld	hl,#0x0001
   4BE9 E5            [11]  680 	push	hl
   4BEA C5            [11]  681 	push	bc
   4BEB 21 6F 4D      [10]  682 	ld	hl,#___str_2
   4BEE E5            [11]  683 	push	hl
   4BEF CD 11 63      [17]  684 	call	_cpct_drawStringM0
   4BF2 21 06 00      [10]  685 	ld	hl,#6
   4BF5 39            [11]  686 	add	hl,sp
   4BF6 F9            [ 6]  687 	ld	sp,hl
   4BF7 21 14 5A      [10]  688 	ld	hl,#0x5A14
   4BFA E5            [11]  689 	push	hl
   4BFB 21 00 C0      [10]  690 	ld	hl,#0xC000
   4BFE E5            [11]  691 	push	hl
   4BFF CD 28 67      [17]  692 	call	_cpct_getScreenPtr
   4C02 D1            [10]  693 	pop	de
                            694 ;src/main.c:50: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   4C03 DD 75 FE      [19]  695 	ld	-2 (ix),l
   4C06 DD 74 FF      [19]  696 	ld	-1 (ix),h
                            697 ;src/main.c:60: cpct_drawStringM0("Salir",memptr,1,0);
   4C09 01 78 4D      [10]  698 	ld	bc,#___str_3
   4C0C D5            [11]  699 	push	de
   4C0D 21 01 00      [10]  700 	ld	hl,#0x0001
   4C10 E5            [11]  701 	push	hl
   4C11 DD 6E FE      [19]  702 	ld	l,-2 (ix)
   4C14 DD 66 FF      [19]  703 	ld	h,-1 (ix)
   4C17 E5            [11]  704 	push	hl
   4C18 C5            [11]  705 	push	bc
   4C19 CD 11 63      [17]  706 	call	_cpct_drawStringM0
   4C1C 21 06 00      [10]  707 	ld	hl,#6
   4C1F 39            [11]  708 	add	hl,sp
   4C20 F9            [ 6]  709 	ld	sp,hl
   4C21 D1            [10]  710 	pop	de
                            711 ;src/main.c:69: while(1){
   4C22                     712 00118$:
                            713 ;src/main.c:71: cpct_scanKeyboard();
   4C22 D5            [11]  714 	push	de
   4C23 CD 48 67      [17]  715 	call	_cpct_scanKeyboard
   4C26 21 00 04      [10]  716 	ld	hl,#0x0400
   4C29 CD 24 62      [17]  717 	call	_cpct_isKeyPressed
   4C2C 7D            [ 4]  718 	ld	a,l
   4C2D D1            [10]  719 	pop	de
   4C2E B7            [ 4]  720 	or	a, a
   4C2F 28 2D         [12]  721 	jr	Z,00102$
   4C31 3E 96         [ 7]  722 	ld	a,#0x96
   4C33 BB            [ 4]  723 	cp	a, e
   4C34 3E 00         [ 7]  724 	ld	a,#0x00
   4C36 9A            [ 4]  725 	sbc	a, d
   4C37 E2 3C 4C      [10]  726 	jp	PO, 00162$
   4C3A EE 80         [ 7]  727 	xor	a, #0x80
   4C3C                     728 00162$:
   4C3C F2 5E 4C      [10]  729 	jp	P,00102$
                            730 ;src/main.c:73: cpct_drawSolidBox(memptr, 0, 2, 8);
   4C3F 21 02 08      [10]  731 	ld	hl,#0x0802
   4C42 E5            [11]  732 	push	hl
   4C43 AF            [ 4]  733 	xor	a, a
   4C44 F5            [11]  734 	push	af
   4C45 33            [ 6]  735 	inc	sp
   4C46 DD 6E FE      [19]  736 	ld	l,-2 (ix)
   4C49 DD 66 FF      [19]  737 	ld	h,-1 (ix)
   4C4C E5            [11]  738 	push	hl
   4C4D CD 57 66      [17]  739 	call	_cpct_drawSolidBox
   4C50 F1            [10]  740 	pop	af
   4C51 F1            [10]  741 	pop	af
   4C52 33            [ 6]  742 	inc	sp
                            743 ;src/main.c:74: pushed ++;
   4C53 DD 34 FA      [23]  744 	inc	-6 (ix)
   4C56 20 03         [12]  745 	jr	NZ,00163$
   4C58 DD 34 FB      [23]  746 	inc	-5 (ix)
   4C5B                     747 00163$:
                            748 ;src/main.c:75: cont =0;
   4C5B 11 00 00      [10]  749 	ld	de,#0x0000
   4C5E                     750 00102$:
                            751 ;src/main.c:77: if(cpct_isKeyPressed(Key_CursorUp) && cont > 150){
   4C5E D5            [11]  752 	push	de
   4C5F 21 00 01      [10]  753 	ld	hl,#0x0100
   4C62 CD 24 62      [17]  754 	call	_cpct_isKeyPressed
   4C65 7D            [ 4]  755 	ld	a,l
   4C66 D1            [10]  756 	pop	de
   4C67 B7            [ 4]  757 	or	a, a
   4C68 28 29         [12]  758 	jr	Z,00105$
   4C6A 3E 96         [ 7]  759 	ld	a,#0x96
   4C6C BB            [ 4]  760 	cp	a, e
   4C6D 3E 00         [ 7]  761 	ld	a,#0x00
   4C6F 9A            [ 4]  762 	sbc	a, d
   4C70 E2 75 4C      [10]  763 	jp	PO, 00164$
   4C73 EE 80         [ 7]  764 	xor	a, #0x80
   4C75                     765 00164$:
   4C75 F2 93 4C      [10]  766 	jp	P,00105$
                            767 ;src/main.c:78: cpct_drawSolidBox(memptr, 0, 2, 8);
   4C78 21 02 08      [10]  768 	ld	hl,#0x0802
   4C7B E5            [11]  769 	push	hl
   4C7C AF            [ 4]  770 	xor	a, a
   4C7D F5            [11]  771 	push	af
   4C7E 33            [ 6]  772 	inc	sp
   4C7F DD 6E FE      [19]  773 	ld	l,-2 (ix)
   4C82 DD 66 FF      [19]  774 	ld	h,-1 (ix)
   4C85 E5            [11]  775 	push	hl
   4C86 CD 57 66      [17]  776 	call	_cpct_drawSolidBox
   4C89 F1            [10]  777 	pop	af
   4C8A F1            [10]  778 	pop	af
   4C8B 33            [ 6]  779 	inc	sp
                            780 ;src/main.c:79: pushed --;
   4C8C E1            [10]  781 	pop	hl
   4C8D E5            [11]  782 	push	hl
   4C8E 2B            [ 6]  783 	dec	hl
   4C8F E3            [19]  784 	ex	(sp), hl
                            785 ;src/main.c:80: cont = 0;
   4C90 11 00 00      [10]  786 	ld	de,#0x0000
   4C93                     787 00105$:
                            788 ;src/main.c:83: switch (pushed){
   4C93 DD 7E FB      [19]  789 	ld	a,-5 (ix)
   4C96 07            [ 4]  790 	rlca
   4C97 E6 01         [ 7]  791 	and	a,#0x01
   4C99 47            [ 4]  792 	ld	b,a
   4C9A 3E 02         [ 7]  793 	ld	a,#0x02
   4C9C DD BE FA      [19]  794 	cp	a, -6 (ix)
   4C9F 3E 00         [ 7]  795 	ld	a,#0x00
   4CA1 DD 9E FB      [19]  796 	sbc	a, -5 (ix)
   4CA4 E2 A9 4C      [10]  797 	jp	PO, 00165$
   4CA7 EE 80         [ 7]  798 	xor	a, #0x80
   4CA9                     799 00165$:
   4CA9 07            [ 4]  800 	rlca
   4CAA E6 01         [ 7]  801 	and	a,#0x01
   4CAC 4F            [ 4]  802 	ld	c,a
   4CAD 78            [ 4]  803 	ld	a,b
   4CAE B7            [ 4]  804 	or	a,a
   4CAF 20 32         [12]  805 	jr	NZ,00110$
   4CB1 B1            [ 4]  806 	or	a,c
   4CB2 20 2F         [12]  807 	jr	NZ,00110$
   4CB4 D5            [11]  808 	push	de
   4CB5 DD 5E FA      [19]  809 	ld	e,-6 (ix)
   4CB8 16 00         [ 7]  810 	ld	d,#0x00
   4CBA 21 C1 4C      [10]  811 	ld	hl,#00166$
   4CBD 19            [11]  812 	add	hl,de
   4CBE 19            [11]  813 	add	hl,de
                            814 ;src/main.c:84: case 0: init = 50;break;
   4CBF D1            [10]  815 	pop	de
   4CC0 E9            [ 4]  816 	jp	(hl)
   4CC1                     817 00166$:
   4CC1 18 04         [12]  818 	jr	00107$
   4CC3 18 0C         [12]  819 	jr	00108$
   4CC5 18 14         [12]  820 	jr	00109$
   4CC7                     821 00107$:
   4CC7 DD 36 FC 32   [19]  822 	ld	-4 (ix),#0x32
   4CCB DD 36 FD 00   [19]  823 	ld	-3 (ix),#0x00
   4CCF 18 12         [12]  824 	jr	00110$
                            825 ;src/main.c:85: case 1: init = 70;break;
   4CD1                     826 00108$:
   4CD1 DD 36 FC 46   [19]  827 	ld	-4 (ix),#0x46
   4CD5 DD 36 FD 00   [19]  828 	ld	-3 (ix),#0x00
   4CD9 18 08         [12]  829 	jr	00110$
                            830 ;src/main.c:86: case 2: init = 90;break;
   4CDB                     831 00109$:
   4CDB DD 36 FC 5A   [19]  832 	ld	-4 (ix),#0x5A
   4CDF DD 36 FD 00   [19]  833 	ld	-3 (ix),#0x00
                            834 ;src/main.c:87: }
   4CE3                     835 00110$:
                            836 ;src/main.c:88: memptr = cpct_getScreenPtr(VMEM,15,init);
   4CE3 DD 66 FC      [19]  837 	ld	h,-4 (ix)
   4CE6 C5            [11]  838 	push	bc
   4CE7 D5            [11]  839 	push	de
   4CE8 E5            [11]  840 	push	hl
   4CE9 33            [ 6]  841 	inc	sp
   4CEA 3E 0F         [ 7]  842 	ld	a,#0x0F
   4CEC F5            [11]  843 	push	af
   4CED 33            [ 6]  844 	inc	sp
   4CEE 21 00 C0      [10]  845 	ld	hl,#0xC000
   4CF1 E5            [11]  846 	push	hl
   4CF2 CD 28 67      [17]  847 	call	_cpct_getScreenPtr
   4CF5 D1            [10]  848 	pop	de
   4CF6 C1            [10]  849 	pop	bc
                            850 ;src/main.c:50: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);
   4CF7 DD 75 FE      [19]  851 	ld	-2 (ix),l
   4CFA DD 74 FF      [19]  852 	ld	-1 (ix),h
                            853 ;src/main.c:89: cpct_drawSolidBox(memptr, 3, 2, 8);
   4CFD C5            [11]  854 	push	bc
   4CFE D5            [11]  855 	push	de
   4CFF 21 02 08      [10]  856 	ld	hl,#0x0802
   4D02 E5            [11]  857 	push	hl
   4D03 3E 03         [ 7]  858 	ld	a,#0x03
   4D05 F5            [11]  859 	push	af
   4D06 33            [ 6]  860 	inc	sp
   4D07 DD 6E FE      [19]  861 	ld	l,-2 (ix)
   4D0A DD 66 FF      [19]  862 	ld	h,-1 (ix)
   4D0D E5            [11]  863 	push	hl
   4D0E CD 57 66      [17]  864 	call	_cpct_drawSolidBox
   4D11 F1            [10]  865 	pop	af
   4D12 F1            [10]  866 	pop	af
   4D13 33            [ 6]  867 	inc	sp
   4D14 21 00 40      [10]  868 	ld	hl,#0x4000
   4D17 CD 24 62      [17]  869 	call	_cpct_isKeyPressed
   4D1A 7D            [ 4]  870 	ld	a,l
   4D1B D1            [10]  871 	pop	de
   4D1C C1            [10]  872 	pop	bc
   4D1D B7            [ 4]  873 	or	a, a
   4D1E 28 27         [12]  874 	jr	Z,00116$
                            875 ;src/main.c:91: switch (pushed){
   4D20 78            [ 4]  876 	ld	a,b
   4D21 B7            [ 4]  877 	or	a,a
   4D22 20 23         [12]  878 	jr	NZ,00116$
   4D24 B1            [ 4]  879 	or	a,c
   4D25 20 20         [12]  880 	jr	NZ,00116$
   4D27 DD 5E FA      [19]  881 	ld	e,-6 (ix)
   4D2A 16 00         [ 7]  882 	ld	d,#0x00
   4D2C 21 32 4D      [10]  883 	ld	hl,#00167$
   4D2F 19            [11]  884 	add	hl,de
   4D30 19            [11]  885 	add	hl,de
                            886 ;src/main.c:92: case 0: return 1;break;
   4D31 E9            [ 4]  887 	jp	(hl)
   4D32                     888 00167$:
   4D32 18 04         [12]  889 	jr	00111$
   4D34 18 07         [12]  890 	jr	00112$
   4D36 18 0A         [12]  891 	jr	00113$
   4D38                     892 00111$:
   4D38 21 01 00      [10]  893 	ld	hl,#0x0001
   4D3B 18 0E         [12]  894 	jr	00120$
                            895 ;src/main.c:93: case 1: return 2;break;
   4D3D                     896 00112$:
   4D3D 21 02 00      [10]  897 	ld	hl,#0x0002
   4D40 18 09         [12]  898 	jr	00120$
                            899 ;src/main.c:94: case 2: return 0;break;
   4D42                     900 00113$:
   4D42 21 00 00      [10]  901 	ld	hl,#0x0000
   4D45 18 04         [12]  902 	jr	00120$
                            903 ;src/main.c:95: }
   4D47                     904 00116$:
                            905 ;src/main.c:97: cont++;
   4D47 13            [ 6]  906 	inc	de
   4D48 C3 22 4C      [10]  907 	jp	00118$
   4D4B                     908 00120$:
   4D4B DD F9         [10]  909 	ld	sp, ix
   4D4D DD E1         [14]  910 	pop	ix
   4D4F C9            [10]  911 	ret
   4D50                     912 ___str_0:
   4D50 4C 6F 75 6E 67 65   913 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   4D60 00                  914 	.db 0x00
   4D61                     915 ___str_1:
   4D61 4E 75 65 76 61 20   916 	.ascii "Nueva Partida"
        50 61 72 74 69 64
        61
   4D6E 00                  917 	.db 0x00
   4D6F                     918 ___str_2:
   4D6F 43 72 65 64 69 74   919 	.ascii "Creditos"
        6F 73
   4D77 00                  920 	.db 0x00
   4D78                     921 ___str_3:
   4D78 53 61 6C 69 72      922 	.ascii "Salir"
   4D7D 00                  923 	.db 0x00
                            924 ;src/main.c:112: void drawMap(int t){
                            925 ;	---------------------------------
                            926 ; Function drawMap
                            927 ; ---------------------------------
   4D7E                     928 _drawMap::
   4D7E DD E5         [15]  929 	push	ix
   4D80 DD 21 00 00   [14]  930 	ld	ix,#0
   4D84 DD 39         [15]  931 	add	ix,sp
   4D86 21 F8 FF      [10]  932 	ld	hl,#-8
   4D89 39            [11]  933 	add	hl,sp
   4D8A F9            [ 6]  934 	ld	sp,hl
                            935 ;src/main.c:116: if(t == 1){ 
   4D8B DD 7E 04      [19]  936 	ld	a,4 (ix)
   4D8E 3D            [ 4]  937 	dec	a
   4D8F 20 43         [12]  938 	jr	NZ,00103$
   4D91 DD 7E 05      [19]  939 	ld	a,5 (ix)
   4D94 B7            [ 4]  940 	or	a, a
   4D95 20 3D         [12]  941 	jr	NZ,00103$
                            942 ;src/main.c:117: for(x=0;x<height;x++){
   4D97 11 00 00      [10]  943 	ld	de,#0x0000
   4D9A 01 00 00      [10]  944 	ld	bc,#0x0000
   4D9D                     945 00113$:
                            946 ;src/main.c:118: scene[x] = mapa1[x];
   4D9D 6B            [ 4]  947 	ld	l, e
   4D9E 62            [ 4]  948 	ld	h, d
   4D9F 29            [11]  949 	add	hl, hl
   4DA0 3E 6E         [ 7]  950 	ld	a,#<(_scene)
   4DA2 85            [ 4]  951 	add	a, l
   4DA3 6F            [ 4]  952 	ld	l,a
   4DA4 3E 73         [ 7]  953 	ld	a,#>(_scene)
   4DA6 8C            [ 4]  954 	adc	a, h
   4DA7 67            [ 4]  955 	ld	h,a
   4DA8 FD 21 AD 47   [14]  956 	ld	iy,#_mapa1
   4DAC FD 09         [15]  957 	add	iy, bc
   4DAE FD E5         [15]  958 	push	iy
   4DB0 F1            [10]  959 	pop	af
   4DB1 DD 77 FD      [19]  960 	ld	-3 (ix),a
   4DB4 FD E5         [15]  961 	push	iy
   4DB6 3B            [ 6]  962 	dec	sp
   4DB7 F1            [10]  963 	pop	af
   4DB8 33            [ 6]  964 	inc	sp
   4DB9 DD 77 FC      [19]  965 	ld	-4 (ix), a
   4DBC 77            [ 7]  966 	ld	(hl),a
   4DBD 23            [ 6]  967 	inc	hl
   4DBE DD 7E FD      [19]  968 	ld	a,-3 (ix)
   4DC1 77            [ 7]  969 	ld	(hl),a
                            970 ;src/main.c:117: for(x=0;x<height;x++){
   4DC2 21 28 00      [10]  971 	ld	hl,#0x0028
   4DC5 09            [11]  972 	add	hl,bc
   4DC6 4D            [ 4]  973 	ld	c,l
   4DC7 44            [ 4]  974 	ld	b,h
   4DC8 13            [ 6]  975 	inc	de
   4DC9 7B            [ 4]  976 	ld	a,e
   4DCA D6 0C         [ 7]  977 	sub	a, #0x0C
   4DCC 7A            [ 4]  978 	ld	a,d
   4DCD 17            [ 4]  979 	rla
   4DCE 3F            [ 4]  980 	ccf
   4DCF 1F            [ 4]  981 	rra
   4DD0 DE 80         [ 7]  982 	sbc	a, #0x80
   4DD2 38 C9         [12]  983 	jr	C,00113$
   4DD4                     984 00103$:
                            985 ;src/main.c:122: if(t == 2){ 
   4DD4 DD 7E 04      [19]  986 	ld	a,4 (ix)
   4DD7 D6 02         [ 7]  987 	sub	a, #0x02
   4DD9 20 34         [12]  988 	jr	NZ,00131$
   4DDB DD 7E 05      [19]  989 	ld	a,5 (ix)
   4DDE B7            [ 4]  990 	or	a, a
   4DDF 20 2E         [12]  991 	jr	NZ,00131$
                            992 ;src/main.c:123: for(x=0;x<height;x++){
   4DE1 01 00 00      [10]  993 	ld	bc,#0x0000
   4DE4 11 00 00      [10]  994 	ld	de,#0x0000
   4DE7                     995 00115$:
                            996 ;src/main.c:124: scene[x] = mapa2[x];
   4DE7 69            [ 4]  997 	ld	l, c
   4DE8 60            [ 4]  998 	ld	h, b
   4DE9 29            [11]  999 	add	hl, hl
   4DEA FD 21 6E 73   [14] 1000 	ld	iy,#_scene
   4DEE C5            [11] 1001 	push	bc
   4DEF 4D            [ 4] 1002 	ld	c, l
   4DF0 44            [ 4] 1003 	ld	b, h
   4DF1 FD 09         [15] 1004 	add	iy, bc
   4DF3 C1            [10] 1005 	pop	bc
   4DF4 21 8D 49      [10] 1006 	ld	hl,#_mapa2
   4DF7 19            [11] 1007 	add	hl,de
   4DF8 FD 75 00      [19] 1008 	ld	0 (iy),l
   4DFB FD 74 01      [19] 1009 	ld	1 (iy),h
                           1010 ;src/main.c:123: for(x=0;x<height;x++){
   4DFE 21 28 00      [10] 1011 	ld	hl,#0x0028
   4E01 19            [11] 1012 	add	hl,de
   4E02 EB            [ 4] 1013 	ex	de,hl
   4E03 03            [ 6] 1014 	inc	bc
   4E04 79            [ 4] 1015 	ld	a,c
   4E05 D6 0C         [ 7] 1016 	sub	a, #0x0C
   4E07 78            [ 4] 1017 	ld	a,b
   4E08 17            [ 4] 1018 	rla
   4E09 3F            [ 4] 1019 	ccf
   4E0A 1F            [ 4] 1020 	rra
   4E0B DE 80         [ 7] 1021 	sbc	a, #0x80
   4E0D 38 D8         [12] 1022 	jr	C,00115$
                           1023 ;src/main.c:128: for(posY=0; posY<height;posY++){
   4E0F                    1024 00131$:
   4E0F 01 00 00      [10] 1025 	ld	bc,#0x0000
                           1026 ;src/main.c:129: for(posX=0; posX<width;posX++){
   4E12                    1027 00129$:
   4E12 69            [ 4] 1028 	ld	l, c
   4E13 60            [ 4] 1029 	ld	h, b
   4E14 29            [11] 1030 	add	hl, hl
   4E15 3E 6E         [ 7] 1031 	ld	a,#<(_scene)
   4E17 85            [ 4] 1032 	add	a, l
   4E18 DD 77 FC      [19] 1033 	ld	-4 (ix),a
   4E1B 3E 73         [ 7] 1034 	ld	a,#>(_scene)
   4E1D 8C            [ 4] 1035 	adc	a, h
   4E1E DD 77 FD      [19] 1036 	ld	-3 (ix),a
   4E21 DD 7E FC      [19] 1037 	ld	a,-4 (ix)
   4E24 DD 77 FE      [19] 1038 	ld	-2 (ix),a
   4E27 DD 7E FD      [19] 1039 	ld	a,-3 (ix)
   4E2A DD 77 FF      [19] 1040 	ld	-1 (ix),a
   4E2D 21 00 00      [10] 1041 	ld	hl,#0x0000
   4E30 E3            [19] 1042 	ex	(sp), hl
   4E31                    1043 00117$:
                           1044 ;src/main.c:130: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight); 
   4E31 79            [ 4] 1045 	ld	a,c
   4E32 07            [ 4] 1046 	rlca
   4E33 07            [ 4] 1047 	rlca
   4E34 07            [ 4] 1048 	rlca
   4E35 07            [ 4] 1049 	rlca
   4E36 E6 F0         [ 7] 1050 	and	a,#0xF0
   4E38 67            [ 4] 1051 	ld	h,a
   4E39 DD 7E F8      [19] 1052 	ld	a,-8 (ix)
   4E3C 87            [ 4] 1053 	add	a, a
   4E3D 87            [ 4] 1054 	add	a, a
   4E3E C5            [11] 1055 	push	bc
   4E3F E5            [11] 1056 	push	hl
   4E40 33            [ 6] 1057 	inc	sp
   4E41 F5            [11] 1058 	push	af
   4E42 33            [ 6] 1059 	inc	sp
   4E43 21 00 C0      [10] 1060 	ld	hl,#0xC000
   4E46 E5            [11] 1061 	push	hl
   4E47 CD 28 67      [17] 1062 	call	_cpct_getScreenPtr
   4E4A C1            [10] 1063 	pop	bc
   4E4B E5            [11] 1064 	push	hl
   4E4C FD E1         [14] 1065 	pop	iy
                           1066 ;src/main.c:131: if(scene[posY][posX] == 1){
   4E4E DD 6E FE      [19] 1067 	ld	l,-2 (ix)
   4E51 DD 66 FF      [19] 1068 	ld	h,-1 (ix)
   4E54 5E            [ 7] 1069 	ld	e,(hl)
   4E55 23            [ 6] 1070 	inc	hl
   4E56 56            [ 7] 1071 	ld	d,(hl)
   4E57 DD 7E F8      [19] 1072 	ld	a,-8 (ix)
   4E5A DD 77 FA      [19] 1073 	ld	-6 (ix),a
   4E5D DD 7E F9      [19] 1074 	ld	a,-7 (ix)
   4E60 DD 77 FB      [19] 1075 	ld	-5 (ix),a
   4E63 DD CB FA 26   [23] 1076 	sla	-6 (ix)
   4E67 DD CB FB 16   [23] 1077 	rl	-5 (ix)
   4E6B DD 6E FA      [19] 1078 	ld	l,-6 (ix)
   4E6E DD 66 FB      [19] 1079 	ld	h,-5 (ix)
   4E71 19            [11] 1080 	add	hl,de
   4E72 7E            [ 7] 1081 	ld	a, (hl)
   4E73 23            [ 6] 1082 	inc	hl
   4E74 66            [ 7] 1083 	ld	h,(hl)
   4E75 6F            [ 4] 1084 	ld	l,a
                           1085 ;src/main.c:132: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4E76 FD E5         [15] 1086 	push	iy
   4E78 D1            [10] 1087 	pop	de
                           1088 ;src/main.c:131: if(scene[posY][posX] == 1){
   4E79 2D            [ 4] 1089 	dec	l
   4E7A 20 17         [12] 1090 	jr	NZ,00108$
   4E7C 7C            [ 4] 1091 	ld	a,h
   4E7D B7            [ 4] 1092 	or	a, a
   4E7E 20 13         [12] 1093 	jr	NZ,00108$
                           1094 ;src/main.c:132: cpct_drawSolidBox(memptr, 3, tilewidth, tileheight);
   4E80 C5            [11] 1095 	push	bc
   4E81 D5            [11] 1096 	push	de
   4E82 21 04 10      [10] 1097 	ld	hl,#0x1004
   4E85 E5            [11] 1098 	push	hl
   4E86 3E 03         [ 7] 1099 	ld	a,#0x03
   4E88 F5            [11] 1100 	push	af
   4E89 33            [ 6] 1101 	inc	sp
   4E8A D5            [11] 1102 	push	de
   4E8B CD 57 66      [17] 1103 	call	_cpct_drawSolidBox
   4E8E F1            [10] 1104 	pop	af
   4E8F F1            [10] 1105 	pop	af
   4E90 33            [ 6] 1106 	inc	sp
   4E91 D1            [10] 1107 	pop	de
   4E92 C1            [10] 1108 	pop	bc
   4E93                    1109 00108$:
                           1110 ;src/main.c:134: if(scene[posY][posX] == 9){
   4E93 DD 6E FC      [19] 1111 	ld	l,-4 (ix)
   4E96 DD 66 FD      [19] 1112 	ld	h,-3 (ix)
   4E99 7E            [ 7] 1113 	ld	a, (hl)
   4E9A 23            [ 6] 1114 	inc	hl
   4E9B 66            [ 7] 1115 	ld	h,(hl)
   4E9C 6F            [ 4] 1116 	ld	l,a
   4E9D DD 7E FA      [19] 1117 	ld	a,-6 (ix)
   4EA0 85            [ 4] 1118 	add	a, l
   4EA1 6F            [ 4] 1119 	ld	l,a
   4EA2 DD 7E FB      [19] 1120 	ld	a,-5 (ix)
   4EA5 8C            [ 4] 1121 	adc	a, h
   4EA6 67            [ 4] 1122 	ld	h,a
   4EA7 7E            [ 7] 1123 	ld	a, (hl)
   4EA8 23            [ 6] 1124 	inc	hl
   4EA9 66            [ 7] 1125 	ld	h,(hl)
   4EAA 6F            [ 4] 1126 	ld	l,a
   4EAB D6 09         [ 7] 1127 	sub	a,#0x09
   4EAD 20 14         [12] 1128 	jr	NZ,00118$
   4EAF B4            [ 4] 1129 	or	a,h
   4EB0 20 11         [12] 1130 	jr	NZ,00118$
                           1131 ;src/main.c:135: cpct_drawSolidBox(memptr, 9, tilewidth, tileheight);
   4EB2 C5            [11] 1132 	push	bc
   4EB3 21 04 10      [10] 1133 	ld	hl,#0x1004
   4EB6 E5            [11] 1134 	push	hl
   4EB7 3E 09         [ 7] 1135 	ld	a,#0x09
   4EB9 F5            [11] 1136 	push	af
   4EBA 33            [ 6] 1137 	inc	sp
   4EBB D5            [11] 1138 	push	de
   4EBC CD 57 66      [17] 1139 	call	_cpct_drawSolidBox
   4EBF F1            [10] 1140 	pop	af
   4EC0 F1            [10] 1141 	pop	af
   4EC1 33            [ 6] 1142 	inc	sp
   4EC2 C1            [10] 1143 	pop	bc
   4EC3                    1144 00118$:
                           1145 ;src/main.c:129: for(posX=0; posX<width;posX++){
   4EC3 DD 34 F8      [23] 1146 	inc	-8 (ix)
   4EC6 20 03         [12] 1147 	jr	NZ,00173$
   4EC8 DD 34 F9      [23] 1148 	inc	-7 (ix)
   4ECB                    1149 00173$:
   4ECB DD 7E F8      [19] 1150 	ld	a,-8 (ix)
   4ECE D6 14         [ 7] 1151 	sub	a, #0x14
   4ED0 DD 7E F9      [19] 1152 	ld	a,-7 (ix)
   4ED3 17            [ 4] 1153 	rla
   4ED4 3F            [ 4] 1154 	ccf
   4ED5 1F            [ 4] 1155 	rra
   4ED6 DE 80         [ 7] 1156 	sbc	a, #0x80
   4ED8 DA 31 4E      [10] 1157 	jp	C,00117$
                           1158 ;src/main.c:128: for(posY=0; posY<height;posY++){
   4EDB 03            [ 6] 1159 	inc	bc
   4EDC 79            [ 4] 1160 	ld	a,c
   4EDD D6 0C         [ 7] 1161 	sub	a, #0x0C
   4EDF 78            [ 4] 1162 	ld	a,b
   4EE0 17            [ 4] 1163 	rla
   4EE1 3F            [ 4] 1164 	ccf
   4EE2 1F            [ 4] 1165 	rra
   4EE3 DE 80         [ 7] 1166 	sbc	a, #0x80
   4EE5 DA 12 4E      [10] 1167 	jp	C,00129$
   4EE8 DD F9         [10] 1168 	ld	sp, ix
   4EEA DD E1         [14] 1169 	pop	ix
   4EEC C9            [10] 1170 	ret
                           1171 ;src/main.c:143: void drawObjects(){
                           1172 ;	---------------------------------
                           1173 ; Function drawObjects
                           1174 ; ---------------------------------
   4EED                    1175 _drawObjects::
   4EED DD E5         [15] 1176 	push	ix
   4EEF DD 21 00 00   [14] 1177 	ld	ix,#0
   4EF3 DD 39         [15] 1178 	add	ix,sp
   4EF5 21 F6 FF      [10] 1179 	ld	hl,#-10
   4EF8 39            [11] 1180 	add	hl,sp
   4EF9 F9            [ 6] 1181 	ld	sp,hl
                           1182 ;src/main.c:146: for(posY=0; posY<height;posY++){
   4EFA 01 00 00      [10] 1183 	ld	bc,#0x0000
                           1184 ;src/main.c:147: for(posX=0; posX<width;posX++){
   4EFD                    1185 00115$:
   4EFD 69            [ 4] 1186 	ld	l, c
   4EFE 60            [ 4] 1187 	ld	h, b
   4EFF 29            [11] 1188 	add	hl, hl
   4F00 3E 6E         [ 7] 1189 	ld	a,#<(_scene)
   4F02 85            [ 4] 1190 	add	a, l
   4F03 DD 77 FE      [19] 1191 	ld	-2 (ix),a
   4F06 3E 73         [ 7] 1192 	ld	a,#>(_scene)
   4F08 8C            [ 4] 1193 	adc	a, h
   4F09 DD 77 FF      [19] 1194 	ld	-1 (ix),a
   4F0C DD 7E FE      [19] 1195 	ld	a,-2 (ix)
   4F0F DD 77 FA      [19] 1196 	ld	-6 (ix),a
   4F12 DD 7E FF      [19] 1197 	ld	a,-1 (ix)
   4F15 DD 77 FB      [19] 1198 	ld	-5 (ix),a
   4F18 21 00 00      [10] 1199 	ld	hl,#0x0000
   4F1B E3            [19] 1200 	ex	(sp), hl
   4F1C                    1201 00107$:
                           1202 ;src/main.c:148: memptr = cpct_getScreenPtr(VMEM, posX*tilewidth, posY*tileheight);
   4F1C 79            [ 4] 1203 	ld	a,c
   4F1D 07            [ 4] 1204 	rlca
   4F1E 07            [ 4] 1205 	rlca
   4F1F 07            [ 4] 1206 	rlca
   4F20 07            [ 4] 1207 	rlca
   4F21 E6 F0         [ 7] 1208 	and	a,#0xF0
   4F23 67            [ 4] 1209 	ld	h,a
   4F24 DD 7E F6      [19] 1210 	ld	a,-10 (ix)
   4F27 87            [ 4] 1211 	add	a, a
   4F28 87            [ 4] 1212 	add	a, a
   4F29 C5            [11] 1213 	push	bc
   4F2A E5            [11] 1214 	push	hl
   4F2B 33            [ 6] 1215 	inc	sp
   4F2C F5            [11] 1216 	push	af
   4F2D 33            [ 6] 1217 	inc	sp
   4F2E 21 00 C0      [10] 1218 	ld	hl,#0xC000
   4F31 E5            [11] 1219 	push	hl
   4F32 CD 28 67      [17] 1220 	call	_cpct_getScreenPtr
   4F35 C1            [10] 1221 	pop	bc
   4F36 EB            [ 4] 1222 	ex	de,hl
                           1223 ;src/main.c:149: if(scene[posY][posX] == 5){
   4F37 DD 6E FA      [19] 1224 	ld	l,-6 (ix)
   4F3A DD 66 FB      [19] 1225 	ld	h,-5 (ix)
   4F3D 7E            [ 7] 1226 	ld	a, (hl)
   4F3E 23            [ 6] 1227 	inc	hl
   4F3F 66            [ 7] 1228 	ld	h,(hl)
   4F40 6F            [ 4] 1229 	ld	l,a
   4F41 DD 7E F6      [19] 1230 	ld	a,-10 (ix)
   4F44 DD 77 F8      [19] 1231 	ld	-8 (ix),a
   4F47 DD 7E F7      [19] 1232 	ld	a,-9 (ix)
   4F4A DD 77 F9      [19] 1233 	ld	-7 (ix),a
   4F4D DD CB F8 26   [23] 1234 	sla	-8 (ix)
   4F51 DD CB F9 16   [23] 1235 	rl	-7 (ix)
   4F55 DD 7E F8      [19] 1236 	ld	a,-8 (ix)
   4F58 85            [ 4] 1237 	add	a, l
   4F59 6F            [ 4] 1238 	ld	l,a
   4F5A DD 7E F9      [19] 1239 	ld	a,-7 (ix)
   4F5D 8C            [ 4] 1240 	adc	a, h
   4F5E 67            [ 4] 1241 	ld	h,a
   4F5F 7E            [ 7] 1242 	ld	a, (hl)
   4F60 23            [ 6] 1243 	inc	hl
   4F61 6E            [ 7] 1244 	ld	l,(hl)
   4F62 67            [ 4] 1245 	ld	h,a
                           1246 ;src/main.c:150: cpct_drawSpriteMasked(flecha_abajo,memptr,4,4);
   4F63 DD 73 FC      [19] 1247 	ld	-4 (ix),e
   4F66 DD 72 FD      [19] 1248 	ld	-3 (ix),d
                           1249 ;src/main.c:149: if(scene[posY][posX] == 5){
   4F69 7C            [ 4] 1250 	ld	a,h
   4F6A D6 05         [ 7] 1251 	sub	a,#0x05
   4F6C 20 17         [12] 1252 	jr	NZ,00102$
   4F6E B5            [ 4] 1253 	or	a,l
   4F6F 20 14         [12] 1254 	jr	NZ,00102$
                           1255 ;src/main.c:150: cpct_drawSpriteMasked(flecha_abajo,memptr,4,4);
   4F71 11 10 60      [10] 1256 	ld	de,#_flecha_abajo
   4F74 C5            [11] 1257 	push	bc
   4F75 21 04 04      [10] 1258 	ld	hl,#0x0404
   4F78 E5            [11] 1259 	push	hl
   4F79 DD 6E FC      [19] 1260 	ld	l,-4 (ix)
   4F7C DD 66 FD      [19] 1261 	ld	h,-3 (ix)
   4F7F E5            [11] 1262 	push	hl
   4F80 D5            [11] 1263 	push	de
   4F81 CD 88 65      [17] 1264 	call	_cpct_drawSpriteMasked
   4F84 C1            [10] 1265 	pop	bc
   4F85                    1266 00102$:
                           1267 ;src/main.c:152: if(scene[posY][posX] == 6){
   4F85 DD 6E FE      [19] 1268 	ld	l,-2 (ix)
   4F88 DD 66 FF      [19] 1269 	ld	h,-1 (ix)
   4F8B 5E            [ 7] 1270 	ld	e,(hl)
   4F8C 23            [ 6] 1271 	inc	hl
   4F8D 56            [ 7] 1272 	ld	d,(hl)
   4F8E DD 6E F8      [19] 1273 	ld	l,-8 (ix)
   4F91 DD 66 F9      [19] 1274 	ld	h,-7 (ix)
   4F94 19            [11] 1275 	add	hl,de
   4F95 5E            [ 7] 1276 	ld	e,(hl)
   4F96 23            [ 6] 1277 	inc	hl
   4F97 56            [ 7] 1278 	ld	d,(hl)
   4F98 7B            [ 4] 1279 	ld	a,e
   4F99 D6 06         [ 7] 1280 	sub	a,#0x06
   4F9B 20 1A         [12] 1281 	jr	NZ,00108$
   4F9D B2            [ 4] 1282 	or	a,d
   4F9E 20 17         [12] 1283 	jr	NZ,00108$
                           1284 ;src/main.c:153: cpct_drawSolidBox(memptr, 6, tilewidth, tileheight);
   4FA0 C5            [11] 1285 	push	bc
   4FA1 21 04 10      [10] 1286 	ld	hl,#0x1004
   4FA4 E5            [11] 1287 	push	hl
   4FA5 3E 06         [ 7] 1288 	ld	a,#0x06
   4FA7 F5            [11] 1289 	push	af
   4FA8 33            [ 6] 1290 	inc	sp
   4FA9 DD 6E FC      [19] 1291 	ld	l,-4 (ix)
   4FAC DD 66 FD      [19] 1292 	ld	h,-3 (ix)
   4FAF E5            [11] 1293 	push	hl
   4FB0 CD 57 66      [17] 1294 	call	_cpct_drawSolidBox
   4FB3 F1            [10] 1295 	pop	af
   4FB4 F1            [10] 1296 	pop	af
   4FB5 33            [ 6] 1297 	inc	sp
   4FB6 C1            [10] 1298 	pop	bc
   4FB7                    1299 00108$:
                           1300 ;src/main.c:147: for(posX=0; posX<width;posX++){
   4FB7 DD 34 F6      [23] 1301 	inc	-10 (ix)
   4FBA 20 03         [12] 1302 	jr	NZ,00141$
   4FBC DD 34 F7      [23] 1303 	inc	-9 (ix)
   4FBF                    1304 00141$:
   4FBF DD 7E F6      [19] 1305 	ld	a,-10 (ix)
   4FC2 D6 14         [ 7] 1306 	sub	a, #0x14
   4FC4 DD 7E F7      [19] 1307 	ld	a,-9 (ix)
   4FC7 17            [ 4] 1308 	rla
   4FC8 3F            [ 4] 1309 	ccf
   4FC9 1F            [ 4] 1310 	rra
   4FCA DE 80         [ 7] 1311 	sbc	a, #0x80
   4FCC DA 1C 4F      [10] 1312 	jp	C,00107$
                           1313 ;src/main.c:146: for(posY=0; posY<height;posY++){
   4FCF 03            [ 6] 1314 	inc	bc
   4FD0 79            [ 4] 1315 	ld	a,c
   4FD1 D6 0C         [ 7] 1316 	sub	a, #0x0C
   4FD3 78            [ 4] 1317 	ld	a,b
   4FD4 17            [ 4] 1318 	rla
   4FD5 3F            [ 4] 1319 	ccf
   4FD6 1F            [ 4] 1320 	rra
   4FD7 DE 80         [ 7] 1321 	sbc	a, #0x80
   4FD9 DA FD 4E      [10] 1322 	jp	C,00115$
   4FDC DD F9         [10] 1323 	ld	sp, ix
   4FDE DD E1         [14] 1324 	pop	ix
   4FE0 C9            [10] 1325 	ret
                           1326 ;src/main.c:160: void cleanScreenPlayers(TPlayer *p,TPlayer *e){
                           1327 ;	---------------------------------
                           1328 ; Function cleanScreenPlayers
                           1329 ; ---------------------------------
   4FE1                    1330 _cleanScreenPlayers::
   4FE1 DD E5         [15] 1331 	push	ix
   4FE3 DD 21 00 00   [14] 1332 	ld	ix,#0
   4FE7 DD 39         [15] 1333 	add	ix,sp
                           1334 ;src/main.c:162: if(p->life > 0){
   4FE9 DD 5E 04      [19] 1335 	ld	e,4 (ix)
   4FEC DD 56 05      [19] 1336 	ld	d,5 (ix)
   4FEF D5            [11] 1337 	push	de
   4FF0 FD E1         [14] 1338 	pop	iy
   4FF2 FD 7E 06      [19] 1339 	ld	a,6 (iy)
   4FF5 B7            [ 4] 1340 	or	a, a
   4FF6 28 2D         [12] 1341 	jr	Z,00102$
                           1342 ;src/main.c:163: memptr = cpct_getScreenPtr(VMEM,p->lx,p->ly);
   4FF8 6B            [ 4] 1343 	ld	l, e
   4FF9 62            [ 4] 1344 	ld	h, d
   4FFA 23            [ 6] 1345 	inc	hl
   4FFB 23            [ 6] 1346 	inc	hl
   4FFC 23            [ 6] 1347 	inc	hl
   4FFD 46            [ 7] 1348 	ld	b,(hl)
   4FFE 6B            [ 4] 1349 	ld	l, e
   4FFF 62            [ 4] 1350 	ld	h, d
   5000 23            [ 6] 1351 	inc	hl
   5001 23            [ 6] 1352 	inc	hl
   5002 7E            [ 7] 1353 	ld	a,(hl)
   5003 D5            [11] 1354 	push	de
   5004 C5            [11] 1355 	push	bc
   5005 33            [ 6] 1356 	inc	sp
   5006 F5            [11] 1357 	push	af
   5007 33            [ 6] 1358 	inc	sp
   5008 21 00 C0      [10] 1359 	ld	hl,#0xC000
   500B E5            [11] 1360 	push	hl
   500C CD 28 67      [17] 1361 	call	_cpct_getScreenPtr
   500F D1            [10] 1362 	pop	de
   5010 4D            [ 4] 1363 	ld	c, l
   5011 44            [ 4] 1364 	ld	b, h
                           1365 ;src/main.c:164: cpct_drawSolidBox(memptr,0,p->size,16);
   5012 EB            [ 4] 1366 	ex	de,hl
   5013 11 08 00      [10] 1367 	ld	de, #0x0008
   5016 19            [11] 1368 	add	hl, de
   5017 5E            [ 7] 1369 	ld	e,(hl)
   5018 16 10         [ 7] 1370 	ld	d,#0x10
   501A D5            [11] 1371 	push	de
   501B AF            [ 4] 1372 	xor	a, a
   501C F5            [11] 1373 	push	af
   501D 33            [ 6] 1374 	inc	sp
   501E C5            [11] 1375 	push	bc
   501F CD 57 66      [17] 1376 	call	_cpct_drawSolidBox
   5022 F1            [10] 1377 	pop	af
   5023 F1            [10] 1378 	pop	af
   5024 33            [ 6] 1379 	inc	sp
   5025                    1380 00102$:
                           1381 ;src/main.c:166: if(e->life > 0 ){
   5025 DD 5E 06      [19] 1382 	ld	e,6 (ix)
   5028 DD 56 07      [19] 1383 	ld	d,7 (ix)
   502B D5            [11] 1384 	push	de
   502C FD E1         [14] 1385 	pop	iy
   502E FD 7E 06      [19] 1386 	ld	a,6 (iy)
   5031 B7            [ 4] 1387 	or	a, a
   5032 28 2D         [12] 1388 	jr	Z,00105$
                           1389 ;src/main.c:167: memptr = cpct_getScreenPtr(VMEM,e->lx,e->ly);
   5034 6B            [ 4] 1390 	ld	l, e
   5035 62            [ 4] 1391 	ld	h, d
   5036 23            [ 6] 1392 	inc	hl
   5037 23            [ 6] 1393 	inc	hl
   5038 23            [ 6] 1394 	inc	hl
   5039 46            [ 7] 1395 	ld	b,(hl)
   503A 6B            [ 4] 1396 	ld	l, e
   503B 62            [ 4] 1397 	ld	h, d
   503C 23            [ 6] 1398 	inc	hl
   503D 23            [ 6] 1399 	inc	hl
   503E 7E            [ 7] 1400 	ld	a,(hl)
   503F D5            [11] 1401 	push	de
   5040 C5            [11] 1402 	push	bc
   5041 33            [ 6] 1403 	inc	sp
   5042 F5            [11] 1404 	push	af
   5043 33            [ 6] 1405 	inc	sp
   5044 21 00 C0      [10] 1406 	ld	hl,#0xC000
   5047 E5            [11] 1407 	push	hl
   5048 CD 28 67      [17] 1408 	call	_cpct_getScreenPtr
   504B D1            [10] 1409 	pop	de
   504C 4D            [ 4] 1410 	ld	c, l
   504D 44            [ 4] 1411 	ld	b, h
                           1412 ;src/main.c:168: cpct_drawSolidBox(memptr,0,e->size,16);
   504E EB            [ 4] 1413 	ex	de,hl
   504F 11 08 00      [10] 1414 	ld	de, #0x0008
   5052 19            [11] 1415 	add	hl, de
   5053 5E            [ 7] 1416 	ld	e,(hl)
   5054 16 10         [ 7] 1417 	ld	d,#0x10
   5056 D5            [11] 1418 	push	de
   5057 AF            [ 4] 1419 	xor	a, a
   5058 F5            [11] 1420 	push	af
   5059 33            [ 6] 1421 	inc	sp
   505A C5            [11] 1422 	push	bc
   505B CD 57 66      [17] 1423 	call	_cpct_drawSolidBox
   505E F1            [10] 1424 	pop	af
   505F F1            [10] 1425 	pop	af
   5060 33            [ 6] 1426 	inc	sp
   5061                    1427 00105$:
   5061 DD E1         [14] 1428 	pop	ix
   5063 C9            [10] 1429 	ret
                           1430 ;src/main.c:173: void drawPlayers(TPlayer *p,TPlayer *e){
                           1431 ;	---------------------------------
                           1432 ; Function drawPlayers
                           1433 ; ---------------------------------
   5064                    1434 _drawPlayers::
   5064 DD E5         [15] 1435 	push	ix
   5066 DD 21 00 00   [14] 1436 	ld	ix,#0
   506A DD 39         [15] 1437 	add	ix,sp
   506C 3B            [ 6] 1438 	dec	sp
                           1439 ;src/main.c:175: if(p->life > 0){
   506D DD 5E 04      [19] 1440 	ld	e,4 (ix)
   5070 DD 56 05      [19] 1441 	ld	d,5 (ix)
   5073 D5            [11] 1442 	push	de
   5074 FD E1         [14] 1443 	pop	iy
   5076 FD 7E 06      [19] 1444 	ld	a,6 (iy)
   5079 B7            [ 4] 1445 	or	a, a
   507A 28 36         [12] 1446 	jr	Z,00102$
                           1447 ;src/main.c:176: memptr = cpct_getScreenPtr(VMEM,p->x,p->y);
   507C 6B            [ 4] 1448 	ld	l, e
   507D 62            [ 4] 1449 	ld	h, d
   507E 23            [ 6] 1450 	inc	hl
   507F 46            [ 7] 1451 	ld	b,(hl)
   5080 1A            [ 7] 1452 	ld	a,(de)
   5081 D5            [11] 1453 	push	de
   5082 C5            [11] 1454 	push	bc
   5083 33            [ 6] 1455 	inc	sp
   5084 F5            [11] 1456 	push	af
   5085 33            [ 6] 1457 	inc	sp
   5086 21 00 C0      [10] 1458 	ld	hl,#0xC000
   5089 E5            [11] 1459 	push	hl
   508A CD 28 67      [17] 1460 	call	_cpct_getScreenPtr
   508D D1            [10] 1461 	pop	de
   508E 4D            [ 4] 1462 	ld	c, l
   508F 44            [ 4] 1463 	ld	b, h
                           1464 ;src/main.c:177: cpct_drawSpriteMasked(p->sprite,memptr,p->size,16);
   5090 6B            [ 4] 1465 	ld	l, e
   5091 62            [ 4] 1466 	ld	h, d
   5092 C5            [11] 1467 	push	bc
   5093 01 08 00      [10] 1468 	ld	bc, #0x0008
   5096 09            [11] 1469 	add	hl, bc
   5097 C1            [10] 1470 	pop	bc
   5098 7E            [ 7] 1471 	ld	a,(hl)
   5099 DD 77 FF      [19] 1472 	ld	-1 (ix),a
   509C EB            [ 4] 1473 	ex	de,hl
   509D 11 04 00      [10] 1474 	ld	de, #0x0004
   50A0 19            [11] 1475 	add	hl, de
   50A1 5E            [ 7] 1476 	ld	e,(hl)
   50A2 23            [ 6] 1477 	inc	hl
   50A3 56            [ 7] 1478 	ld	d,(hl)
   50A4 3E 10         [ 7] 1479 	ld	a,#0x10
   50A6 F5            [11] 1480 	push	af
   50A7 33            [ 6] 1481 	inc	sp
   50A8 DD 7E FF      [19] 1482 	ld	a,-1 (ix)
   50AB F5            [11] 1483 	push	af
   50AC 33            [ 6] 1484 	inc	sp
   50AD C5            [11] 1485 	push	bc
   50AE D5            [11] 1486 	push	de
   50AF CD 88 65      [17] 1487 	call	_cpct_drawSpriteMasked
   50B2                    1488 00102$:
                           1489 ;src/main.c:179: if(e->life > 0 ){
   50B2 DD 5E 06      [19] 1490 	ld	e,6 (ix)
   50B5 DD 56 07      [19] 1491 	ld	d,7 (ix)
   50B8 D5            [11] 1492 	push	de
   50B9 FD E1         [14] 1493 	pop	iy
   50BB FD 7E 06      [19] 1494 	ld	a,6 (iy)
   50BE B7            [ 4] 1495 	or	a, a
   50BF 28 36         [12] 1496 	jr	Z,00105$
                           1497 ;src/main.c:180: memptr = cpct_getScreenPtr(VMEM,e->x,e->y);
   50C1 6B            [ 4] 1498 	ld	l, e
   50C2 62            [ 4] 1499 	ld	h, d
   50C3 23            [ 6] 1500 	inc	hl
   50C4 46            [ 7] 1501 	ld	b,(hl)
   50C5 1A            [ 7] 1502 	ld	a,(de)
   50C6 D5            [11] 1503 	push	de
   50C7 C5            [11] 1504 	push	bc
   50C8 33            [ 6] 1505 	inc	sp
   50C9 F5            [11] 1506 	push	af
   50CA 33            [ 6] 1507 	inc	sp
   50CB 21 00 C0      [10] 1508 	ld	hl,#0xC000
   50CE E5            [11] 1509 	push	hl
   50CF CD 28 67      [17] 1510 	call	_cpct_getScreenPtr
   50D2 D1            [10] 1511 	pop	de
   50D3 4D            [ 4] 1512 	ld	c, l
   50D4 44            [ 4] 1513 	ld	b, h
                           1514 ;src/main.c:181: cpct_drawSpriteMasked(e->sprite,memptr,e->size,16);
   50D5 6B            [ 4] 1515 	ld	l, e
   50D6 62            [ 4] 1516 	ld	h, d
   50D7 C5            [11] 1517 	push	bc
   50D8 01 08 00      [10] 1518 	ld	bc, #0x0008
   50DB 09            [11] 1519 	add	hl, bc
   50DC C1            [10] 1520 	pop	bc
   50DD 7E            [ 7] 1521 	ld	a,(hl)
   50DE DD 77 FF      [19] 1522 	ld	-1 (ix),a
   50E1 EB            [ 4] 1523 	ex	de,hl
   50E2 11 04 00      [10] 1524 	ld	de, #0x0004
   50E5 19            [11] 1525 	add	hl, de
   50E6 5E            [ 7] 1526 	ld	e,(hl)
   50E7 23            [ 6] 1527 	inc	hl
   50E8 56            [ 7] 1528 	ld	d,(hl)
   50E9 3E 10         [ 7] 1529 	ld	a,#0x10
   50EB F5            [11] 1530 	push	af
   50EC 33            [ 6] 1531 	inc	sp
   50ED DD 7E FF      [19] 1532 	ld	a,-1 (ix)
   50F0 F5            [11] 1533 	push	af
   50F1 33            [ 6] 1534 	inc	sp
   50F2 C5            [11] 1535 	push	bc
   50F3 D5            [11] 1536 	push	de
   50F4 CD 88 65      [17] 1537 	call	_cpct_drawSpriteMasked
   50F7                    1538 00105$:
   50F7 33            [ 6] 1539 	inc	sp
   50F8 DD E1         [14] 1540 	pop	ix
   50FA C9            [10] 1541 	ret
                           1542 ;src/main.c:185: void initPlayers(){
                           1543 ;	---------------------------------
                           1544 ; Function initPlayers
                           1545 ; ---------------------------------
   50FB                    1546 _initPlayers::
                           1547 ;src/main.c:187: }
   50FB C9            [10] 1548 	ret
                           1549 ;src/main.c:192: u8 checkBoundsCollisions(u8 *x,u8 *y, u8 lx, u8 ly){
                           1550 ;	---------------------------------
                           1551 ; Function checkBoundsCollisions
                           1552 ; ---------------------------------
   50FC                    1553 _checkBoundsCollisions::
   50FC DD E5         [15] 1554 	push	ix
   50FE DD 21 00 00   [14] 1555 	ld	ix,#0
   5102 DD 39         [15] 1556 	add	ix,sp
   5104 21 EB FF      [10] 1557 	ld	hl,#-21
   5107 39            [11] 1558 	add	hl,sp
   5108 F9            [ 6] 1559 	ld	sp,hl
                           1560 ;src/main.c:194: u8 *posX = x;
   5109 DD 7E 04      [19] 1561 	ld	a,4 (ix)
   510C DD 77 EB      [19] 1562 	ld	-21 (ix),a
   510F DD 7E 05      [19] 1563 	ld	a,5 (ix)
   5112 DD 77 EC      [19] 1564 	ld	-20 (ix),a
                           1565 ;src/main.c:195: u8 *posY = y;
   5115 DD 7E 06      [19] 1566 	ld	a,6 (ix)
   5118 DD 77 EE      [19] 1567 	ld	-18 (ix),a
   511B DD 7E 07      [19] 1568 	ld	a,7 (ix)
   511E DD 77 EF      [19] 1569 	ld	-17 (ix),a
                           1570 ;src/main.c:196: u8 bound = 0;
   5121 DD 36 ED 00   [19] 1571 	ld	-19 (ix),#0x00
                           1572 ;src/main.c:197: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
   5125 DD 6E EE      [19] 1573 	ld	l,-18 (ix)
   5128 DD 66 EF      [19] 1574 	ld	h,-17 (ix)
   512B 7E            [ 7] 1575 	ld	a,(hl)
   512C DD 77 FC      [19] 1576 	ld	-4 (ix), a
   512F 07            [ 4] 1577 	rlca
   5130 07            [ 4] 1578 	rlca
   5131 07            [ 4] 1579 	rlca
   5132 07            [ 4] 1580 	rlca
   5133 E6 0F         [ 7] 1581 	and	a,#0x0F
   5135 6F            [ 4] 1582 	ld	l,a
   5136 26 00         [ 7] 1583 	ld	h,#0x00
   5138 29            [11] 1584 	add	hl, hl
   5139 11 6E 73      [10] 1585 	ld	de,#_scene
   513C 19            [11] 1586 	add	hl,de
   513D 7E            [ 7] 1587 	ld	a,(hl)
   513E DD 77 FA      [19] 1588 	ld	-6 (ix),a
   5141 23            [ 6] 1589 	inc	hl
   5142 7E            [ 7] 1590 	ld	a,(hl)
   5143 DD 77 FB      [19] 1591 	ld	-5 (ix),a
   5146 E1            [10] 1592 	pop	hl
   5147 E5            [11] 1593 	push	hl
   5148 4E            [ 7] 1594 	ld	c,(hl)
   5149 69            [ 4] 1595 	ld	l,c
   514A CB 3D         [ 8] 1596 	srl	l
   514C CB 3D         [ 8] 1597 	srl	l
   514E 26 00         [ 7] 1598 	ld	h,#0x00
   5150 29            [11] 1599 	add	hl, hl
   5151 DD 75 F8      [19] 1600 	ld	-8 (ix),l
   5154 DD 74 F9      [19] 1601 	ld	-7 (ix),h
   5157 DD 7E FA      [19] 1602 	ld	a,-6 (ix)
   515A DD 86 F8      [19] 1603 	add	a, -8 (ix)
   515D 6F            [ 4] 1604 	ld	l,a
   515E DD 7E FB      [19] 1605 	ld	a,-5 (ix)
   5161 DD 8E F9      [19] 1606 	adc	a, -7 (ix)
   5164 67            [ 4] 1607 	ld	h,a
   5165 7E            [ 7] 1608 	ld	a,(hl)
   5166 DD 77 F6      [19] 1609 	ld	-10 (ix),a
   5169 23            [ 6] 1610 	inc	hl
   516A 7E            [ 7] 1611 	ld	a,(hl)
   516B DD 77 F7      [19] 1612 	ld	-9 (ix),a
   516E DD 7E F6      [19] 1613 	ld	a,-10 (ix)
   5171 3D            [ 4] 1614 	dec	a
   5172 20 07         [12] 1615 	jr	NZ,00262$
   5174 DD 7E F7      [19] 1616 	ld	a,-9 (ix)
   5177 B7            [ 4] 1617 	or	a, a
   5178 CA A4 52      [10] 1618 	jp	Z,00118$
   517B                    1619 00262$:
                           1620 ;src/main.c:198: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
   517B 06 00         [ 7] 1621 	ld	b,#0x00
   517D 21 03 00      [10] 1622 	ld	hl,#0x0003
   5180 09            [11] 1623 	add	hl,bc
   5181 DD 75 F0      [19] 1624 	ld	-16 (ix),l
   5184 DD 74 F1      [19] 1625 	ld	-15 (ix),h
   5187 DD 7E F0      [19] 1626 	ld	a,-16 (ix)
   518A DD 77 F4      [19] 1627 	ld	-12 (ix),a
   518D DD 7E F1      [19] 1628 	ld	a,-15 (ix)
   5190 DD 77 F5      [19] 1629 	ld	-11 (ix),a
   5193 DD 7E F1      [19] 1630 	ld	a,-15 (ix)
   5196 07            [ 4] 1631 	rlca
   5197 E6 01         [ 7] 1632 	and	a,#0x01
   5199 DD 77 FD      [19] 1633 	ld	-3 (ix),a
   519C 21 06 00      [10] 1634 	ld	hl,#0x0006
   519F 09            [11] 1635 	add	hl,bc
   51A0 DD 75 F2      [19] 1636 	ld	-14 (ix),l
   51A3 DD 74 F3      [19] 1637 	ld	-13 (ix),h
   51A6 DD 7E FD      [19] 1638 	ld	a,-3 (ix)
   51A9 B7            [ 4] 1639 	or	a, a
   51AA 28 0C         [12] 1640 	jr	Z,00126$
   51AC DD 7E F2      [19] 1641 	ld	a,-14 (ix)
   51AF DD 77 F4      [19] 1642 	ld	-12 (ix),a
   51B2 DD 7E F3      [19] 1643 	ld	a,-13 (ix)
   51B5 DD 77 F5      [19] 1644 	ld	-11 (ix),a
   51B8                    1645 00126$:
   51B8 DD 6E F4      [19] 1646 	ld	l,-12 (ix)
   51BB DD 66 F5      [19] 1647 	ld	h,-11 (ix)
   51BE CB 2C         [ 8] 1648 	sra	h
   51C0 CB 1D         [ 8] 1649 	rr	l
   51C2 CB 2C         [ 8] 1650 	sra	h
   51C4 CB 1D         [ 8] 1651 	rr	l
   51C6 29            [11] 1652 	add	hl, hl
   51C7 DD 5E FA      [19] 1653 	ld	e,-6 (ix)
   51CA DD 56 FB      [19] 1654 	ld	d,-5 (ix)
   51CD 19            [11] 1655 	add	hl,de
   51CE 56            [ 7] 1656 	ld	d,(hl)
   51CF 23            [ 6] 1657 	inc	hl
   51D0 66            [ 7] 1658 	ld	h,(hl)
   51D1 15            [ 4] 1659 	dec	d
   51D2 20 05         [12] 1660 	jr	NZ,00263$
   51D4 7C            [ 4] 1661 	ld	a,h
   51D5 B7            [ 4] 1662 	or	a, a
   51D6 CA A4 52      [10] 1663 	jp	Z,00118$
   51D9                    1664 00263$:
                           1665 ;src/main.c:199: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 1 
   51D9 DD 5E FC      [19] 1666 	ld	e,-4 (ix)
   51DC 16 00         [ 7] 1667 	ld	d,#0x00
   51DE 21 0E 00      [10] 1668 	ld	hl,#0x000E
   51E1 19            [11] 1669 	add	hl,de
   51E2 4D            [ 4] 1670 	ld	c,l
   51E3 44            [ 4] 1671 	ld	b,h
   51E4 DD 71 F4      [19] 1672 	ld	-12 (ix),c
   51E7 DD 70 F5      [19] 1673 	ld	-11 (ix),b
   51EA 78            [ 4] 1674 	ld	a,b
   51EB 07            [ 4] 1675 	rlca
   51EC E6 01         [ 7] 1676 	and	a,#0x01
   51EE DD 77 FC      [19] 1677 	ld	-4 (ix),a
   51F1 21 1D 00      [10] 1678 	ld	hl,#0x001D
   51F4 19            [11] 1679 	add	hl,de
   51F5 DD 75 FE      [19] 1680 	ld	-2 (ix),l
   51F8 DD 74 FF      [19] 1681 	ld	-1 (ix),h
   51FB DD 7E FC      [19] 1682 	ld	a,-4 (ix)
   51FE B7            [ 4] 1683 	or	a, a
   51FF 28 0C         [12] 1684 	jr	Z,00127$
   5201 DD 7E FE      [19] 1685 	ld	a,-2 (ix)
   5204 DD 77 F4      [19] 1686 	ld	-12 (ix),a
   5207 DD 7E FF      [19] 1687 	ld	a,-1 (ix)
   520A DD 77 F5      [19] 1688 	ld	-11 (ix),a
   520D                    1689 00127$:
   520D DD 6E F4      [19] 1690 	ld	l,-12 (ix)
   5210 DD 66 F5      [19] 1691 	ld	h,-11 (ix)
   5213 CB 2C         [ 8] 1692 	sra	h
   5215 CB 1D         [ 8] 1693 	rr	l
   5217 CB 2C         [ 8] 1694 	sra	h
   5219 CB 1D         [ 8] 1695 	rr	l
   521B CB 2C         [ 8] 1696 	sra	h
   521D CB 1D         [ 8] 1697 	rr	l
   521F CB 2C         [ 8] 1698 	sra	h
   5221 CB 1D         [ 8] 1699 	rr	l
   5223 29            [11] 1700 	add	hl, hl
   5224 11 6E 73      [10] 1701 	ld	de,#_scene
   5227 19            [11] 1702 	add	hl,de
   5228 5E            [ 7] 1703 	ld	e,(hl)
   5229 23            [ 6] 1704 	inc	hl
   522A 56            [ 7] 1705 	ld	d,(hl)
   522B DD 6E F8      [19] 1706 	ld	l,-8 (ix)
   522E DD 66 F9      [19] 1707 	ld	h,-7 (ix)
   5231 19            [11] 1708 	add	hl,de
   5232 56            [ 7] 1709 	ld	d,(hl)
   5233 23            [ 6] 1710 	inc	hl
   5234 66            [ 7] 1711 	ld	h,(hl)
   5235 15            [ 4] 1712 	dec	d
   5236 20 04         [12] 1713 	jr	NZ,00264$
   5238 7C            [ 4] 1714 	ld	a,h
   5239 B7            [ 4] 1715 	or	a, a
   523A 28 68         [12] 1716 	jr	Z,00118$
   523C                    1717 00264$:
                           1718 ;src/main.c:200: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 1
   523C DD 71 F4      [19] 1719 	ld	-12 (ix),c
   523F DD 70 F5      [19] 1720 	ld	-11 (ix),b
   5242 DD 7E FC      [19] 1721 	ld	a,-4 (ix)
   5245 B7            [ 4] 1722 	or	a, a
   5246 28 0C         [12] 1723 	jr	Z,00128$
   5248 DD 7E FE      [19] 1724 	ld	a,-2 (ix)
   524B DD 77 F4      [19] 1725 	ld	-12 (ix),a
   524E DD 7E FF      [19] 1726 	ld	a,-1 (ix)
   5251 DD 77 F5      [19] 1727 	ld	-11 (ix),a
   5254                    1728 00128$:
   5254 DD 6E F4      [19] 1729 	ld	l,-12 (ix)
   5257 DD 66 F5      [19] 1730 	ld	h,-11 (ix)
   525A CB 2C         [ 8] 1731 	sra	h
   525C CB 1D         [ 8] 1732 	rr	l
   525E CB 2C         [ 8] 1733 	sra	h
   5260 CB 1D         [ 8] 1734 	rr	l
   5262 CB 2C         [ 8] 1735 	sra	h
   5264 CB 1D         [ 8] 1736 	rr	l
   5266 CB 2C         [ 8] 1737 	sra	h
   5268 CB 1D         [ 8] 1738 	rr	l
   526A 29            [11] 1739 	add	hl, hl
   526B 11 6E 73      [10] 1740 	ld	de,#_scene
   526E 19            [11] 1741 	add	hl,de
   526F 7E            [ 7] 1742 	ld	a,(hl)
   5270 DD 77 F4      [19] 1743 	ld	-12 (ix),a
   5273 23            [ 6] 1744 	inc	hl
   5274 7E            [ 7] 1745 	ld	a,(hl)
   5275 DD 77 F5      [19] 1746 	ld	-11 (ix),a
   5278 DD 6E F0      [19] 1747 	ld	l,-16 (ix)
   527B DD 66 F1      [19] 1748 	ld	h,-15 (ix)
   527E DD 7E FD      [19] 1749 	ld	a,-3 (ix)
   5281 B7            [ 4] 1750 	or	a, a
   5282 28 06         [12] 1751 	jr	Z,00129$
   5284 DD 6E F2      [19] 1752 	ld	l,-14 (ix)
   5287 DD 66 F3      [19] 1753 	ld	h,-13 (ix)
   528A                    1754 00129$:
   528A CB 2C         [ 8] 1755 	sra	h
   528C CB 1D         [ 8] 1756 	rr	l
   528E CB 2C         [ 8] 1757 	sra	h
   5290 CB 1D         [ 8] 1758 	rr	l
   5292 29            [11] 1759 	add	hl, hl
   5293 DD 5E F4      [19] 1760 	ld	e,-12 (ix)
   5296 DD 56 F5      [19] 1761 	ld	d,-11 (ix)
   5299 19            [11] 1762 	add	hl,de
   529A 56            [ 7] 1763 	ld	d,(hl)
   529B 23            [ 6] 1764 	inc	hl
   529C 66            [ 7] 1765 	ld	h,(hl)
   529D 15            [ 4] 1766 	dec	d
   529E 20 1B         [12] 1767 	jr	NZ,00119$
   52A0 7C            [ 4] 1768 	ld	a,h
   52A1 B7            [ 4] 1769 	or	a, a
   52A2 20 17         [12] 1770 	jr	NZ,00119$
   52A4                    1771 00118$:
                           1772 ;src/main.c:202: *posX=lx;
   52A4 E1            [10] 1773 	pop	hl
   52A5 E5            [11] 1774 	push	hl
   52A6 DD 7E 08      [19] 1775 	ld	a,8 (ix)
   52A9 77            [ 7] 1776 	ld	(hl),a
                           1777 ;src/main.c:203: *posY=ly;
   52AA DD 6E EE      [19] 1778 	ld	l,-18 (ix)
   52AD DD 66 EF      [19] 1779 	ld	h,-17 (ix)
   52B0 DD 7E 09      [19] 1780 	ld	a,9 (ix)
   52B3 77            [ 7] 1781 	ld	(hl),a
                           1782 ;src/main.c:204: bound = 1;
   52B4 DD 36 ED 01   [19] 1783 	ld	-19 (ix),#0x01
   52B8 C3 24 55      [10] 1784 	jp	00120$
   52BB                    1785 00119$:
                           1786 ;src/main.c:206: else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 6   
   52BB DD 7E F6      [19] 1787 	ld	a,-10 (ix)
   52BE D6 06         [ 7] 1788 	sub	a, #0x06
   52C0 20 07         [12] 1789 	jr	NZ,00267$
   52C2 DD 7E F7      [19] 1790 	ld	a,-9 (ix)
   52C5 B7            [ 4] 1791 	or	a, a
   52C6 CA 24 55      [10] 1792 	jp	Z,00120$
   52C9                    1793 00267$:
                           1794 ;src/main.c:207: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
   52C9 DD 6E F0      [19] 1795 	ld	l,-16 (ix)
   52CC DD 66 F1      [19] 1796 	ld	h,-15 (ix)
   52CF DD 7E FD      [19] 1797 	ld	a,-3 (ix)
   52D2 B7            [ 4] 1798 	or	a, a
   52D3 28 06         [12] 1799 	jr	Z,00130$
   52D5 DD 6E F2      [19] 1800 	ld	l,-14 (ix)
   52D8 DD 66 F3      [19] 1801 	ld	h,-13 (ix)
   52DB                    1802 00130$:
   52DB CB 2C         [ 8] 1803 	sra	h
   52DD CB 1D         [ 8] 1804 	rr	l
   52DF CB 2C         [ 8] 1805 	sra	h
   52E1 CB 1D         [ 8] 1806 	rr	l
   52E3 29            [11] 1807 	add	hl, hl
   52E4 DD 5E FA      [19] 1808 	ld	e,-6 (ix)
   52E7 DD 56 FB      [19] 1809 	ld	d,-5 (ix)
   52EA 19            [11] 1810 	add	hl,de
   52EB 56            [ 7] 1811 	ld	d,(hl)
   52EC 23            [ 6] 1812 	inc	hl
   52ED 66            [ 7] 1813 	ld	h,(hl)
   52EE 7A            [ 4] 1814 	ld	a,d
   52EF D6 06         [ 7] 1815 	sub	a,#0x06
   52F1 20 04         [12] 1816 	jr	NZ,00268$
   52F3 B4            [ 4] 1817 	or	a,h
   52F4 CA 24 55      [10] 1818 	jp	Z,00120$
   52F7                    1819 00268$:
                           1820 ;src/main.c:208: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 6
   52F7 69            [ 4] 1821 	ld	l, c
   52F8 60            [ 4] 1822 	ld	h, b
   52F9 DD 7E FC      [19] 1823 	ld	a,-4 (ix)
   52FC B7            [ 4] 1824 	or	a, a
   52FD 28 06         [12] 1825 	jr	Z,00131$
   52FF DD 6E FE      [19] 1826 	ld	l,-2 (ix)
   5302 DD 66 FF      [19] 1827 	ld	h,-1 (ix)
   5305                    1828 00131$:
   5305 CB 2C         [ 8] 1829 	sra	h
   5307 CB 1D         [ 8] 1830 	rr	l
   5309 CB 2C         [ 8] 1831 	sra	h
   530B CB 1D         [ 8] 1832 	rr	l
   530D CB 2C         [ 8] 1833 	sra	h
   530F CB 1D         [ 8] 1834 	rr	l
   5311 CB 2C         [ 8] 1835 	sra	h
   5313 CB 1D         [ 8] 1836 	rr	l
   5315 29            [11] 1837 	add	hl, hl
   5316 11 6E 73      [10] 1838 	ld	de,#_scene
   5319 19            [11] 1839 	add	hl,de
   531A 5E            [ 7] 1840 	ld	e,(hl)
   531B 23            [ 6] 1841 	inc	hl
   531C 56            [ 7] 1842 	ld	d,(hl)
   531D DD 6E F8      [19] 1843 	ld	l,-8 (ix)
   5320 DD 66 F9      [19] 1844 	ld	h,-7 (ix)
   5323 19            [11] 1845 	add	hl,de
   5324 56            [ 7] 1846 	ld	d,(hl)
   5325 23            [ 6] 1847 	inc	hl
   5326 66            [ 7] 1848 	ld	h,(hl)
   5327 7A            [ 4] 1849 	ld	a,d
   5328 D6 06         [ 7] 1850 	sub	a,#0x06
   532A 20 04         [12] 1851 	jr	NZ,00269$
   532C B4            [ 4] 1852 	or	a,h
   532D CA 24 55      [10] 1853 	jp	Z,00120$
   5330                    1854 00269$:
                           1855 ;src/main.c:209: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 6
   5330 69            [ 4] 1856 	ld	l, c
   5331 60            [ 4] 1857 	ld	h, b
   5332 DD 7E FC      [19] 1858 	ld	a,-4 (ix)
   5335 B7            [ 4] 1859 	or	a, a
   5336 28 06         [12] 1860 	jr	Z,00132$
   5338 DD 6E FE      [19] 1861 	ld	l,-2 (ix)
   533B DD 66 FF      [19] 1862 	ld	h,-1 (ix)
   533E                    1863 00132$:
   533E CB 2C         [ 8] 1864 	sra	h
   5340 CB 1D         [ 8] 1865 	rr	l
   5342 CB 2C         [ 8] 1866 	sra	h
   5344 CB 1D         [ 8] 1867 	rr	l
   5346 CB 2C         [ 8] 1868 	sra	h
   5348 CB 1D         [ 8] 1869 	rr	l
   534A CB 2C         [ 8] 1870 	sra	h
   534C CB 1D         [ 8] 1871 	rr	l
   534E 29            [11] 1872 	add	hl, hl
   534F 11 6E 73      [10] 1873 	ld	de,#_scene
   5352 19            [11] 1874 	add	hl,de
   5353 5E            [ 7] 1875 	ld	e,(hl)
   5354 23            [ 6] 1876 	inc	hl
   5355 56            [ 7] 1877 	ld	d,(hl)
   5356 DD 6E F0      [19] 1878 	ld	l,-16 (ix)
   5359 DD 66 F1      [19] 1879 	ld	h,-15 (ix)
   535C DD 7E FD      [19] 1880 	ld	a,-3 (ix)
   535F B7            [ 4] 1881 	or	a, a
   5360 28 06         [12] 1882 	jr	Z,00133$
   5362 DD 6E F2      [19] 1883 	ld	l,-14 (ix)
   5365 DD 66 F3      [19] 1884 	ld	h,-13 (ix)
   5368                    1885 00133$:
   5368 CB 2C         [ 8] 1886 	sra	h
   536A CB 1D         [ 8] 1887 	rr	l
   536C CB 2C         [ 8] 1888 	sra	h
   536E CB 1D         [ 8] 1889 	rr	l
   5370 29            [11] 1890 	add	hl, hl
   5371 19            [11] 1891 	add	hl,de
   5372 5E            [ 7] 1892 	ld	e,(hl)
   5373 23            [ 6] 1893 	inc	hl
   5374 56            [ 7] 1894 	ld	d,(hl)
   5375 7B            [ 4] 1895 	ld	a,e
   5376 D6 06         [ 7] 1896 	sub	a,#0x06
   5378 20 04         [12] 1897 	jr	NZ,00270$
   537A B2            [ 4] 1898 	or	a,d
   537B CA 24 55      [10] 1899 	jp	Z,00120$
   537E                    1900 00270$:
                           1901 ;src/main.c:212: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 5   
   537E DD 7E F6      [19] 1902 	ld	a,-10 (ix)
   5381 D6 05         [ 7] 1903 	sub	a, #0x05
   5383 20 07         [12] 1904 	jr	NZ,00271$
   5385 DD 7E F7      [19] 1905 	ld	a,-9 (ix)
   5388 B7            [ 4] 1906 	or	a, a
   5389 CA 24 55      [10] 1907 	jp	Z,00120$
   538C                    1908 00271$:
                           1909 ;src/main.c:213: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 5
   538C DD 6E F0      [19] 1910 	ld	l,-16 (ix)
   538F DD 66 F1      [19] 1911 	ld	h,-15 (ix)
   5392 DD 7E FD      [19] 1912 	ld	a,-3 (ix)
   5395 B7            [ 4] 1913 	or	a, a
   5396 28 06         [12] 1914 	jr	Z,00134$
   5398 DD 6E F2      [19] 1915 	ld	l,-14 (ix)
   539B DD 66 F3      [19] 1916 	ld	h,-13 (ix)
   539E                    1917 00134$:
   539E CB 2C         [ 8] 1918 	sra	h
   53A0 CB 1D         [ 8] 1919 	rr	l
   53A2 CB 2C         [ 8] 1920 	sra	h
   53A4 CB 1D         [ 8] 1921 	rr	l
   53A6 29            [11] 1922 	add	hl, hl
   53A7 DD 5E FA      [19] 1923 	ld	e,-6 (ix)
   53AA DD 56 FB      [19] 1924 	ld	d,-5 (ix)
   53AD 19            [11] 1925 	add	hl,de
   53AE 56            [ 7] 1926 	ld	d,(hl)
   53AF 23            [ 6] 1927 	inc	hl
   53B0 66            [ 7] 1928 	ld	h,(hl)
   53B1 7A            [ 4] 1929 	ld	a,d
   53B2 D6 05         [ 7] 1930 	sub	a,#0x05
   53B4 20 04         [12] 1931 	jr	NZ,00272$
   53B6 B4            [ 4] 1932 	or	a,h
   53B7 CA 24 55      [10] 1933 	jp	Z,00120$
   53BA                    1934 00272$:
                           1935 ;src/main.c:214: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 5
   53BA 69            [ 4] 1936 	ld	l, c
   53BB 60            [ 4] 1937 	ld	h, b
   53BC DD 7E FC      [19] 1938 	ld	a,-4 (ix)
   53BF B7            [ 4] 1939 	or	a, a
   53C0 28 06         [12] 1940 	jr	Z,00135$
   53C2 DD 6E FE      [19] 1941 	ld	l,-2 (ix)
   53C5 DD 66 FF      [19] 1942 	ld	h,-1 (ix)
   53C8                    1943 00135$:
   53C8 CB 2C         [ 8] 1944 	sra	h
   53CA CB 1D         [ 8] 1945 	rr	l
   53CC CB 2C         [ 8] 1946 	sra	h
   53CE CB 1D         [ 8] 1947 	rr	l
   53D0 CB 2C         [ 8] 1948 	sra	h
   53D2 CB 1D         [ 8] 1949 	rr	l
   53D4 CB 2C         [ 8] 1950 	sra	h
   53D6 CB 1D         [ 8] 1951 	rr	l
   53D8 29            [11] 1952 	add	hl, hl
   53D9 11 6E 73      [10] 1953 	ld	de,#_scene
   53DC 19            [11] 1954 	add	hl,de
   53DD 5E            [ 7] 1955 	ld	e,(hl)
   53DE 23            [ 6] 1956 	inc	hl
   53DF 56            [ 7] 1957 	ld	d,(hl)
   53E0 DD 6E F8      [19] 1958 	ld	l,-8 (ix)
   53E3 DD 66 F9      [19] 1959 	ld	h,-7 (ix)
   53E6 19            [11] 1960 	add	hl,de
   53E7 56            [ 7] 1961 	ld	d,(hl)
   53E8 23            [ 6] 1962 	inc	hl
   53E9 66            [ 7] 1963 	ld	h,(hl)
   53EA 7A            [ 4] 1964 	ld	a,d
   53EB D6 05         [ 7] 1965 	sub	a,#0x05
   53ED 20 04         [12] 1966 	jr	NZ,00273$
   53EF B4            [ 4] 1967 	or	a,h
   53F0 CA 24 55      [10] 1968 	jp	Z,00120$
   53F3                    1969 00273$:
                           1970 ;src/main.c:215: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 5
   53F3 69            [ 4] 1971 	ld	l, c
   53F4 60            [ 4] 1972 	ld	h, b
   53F5 DD 7E FC      [19] 1973 	ld	a,-4 (ix)
   53F8 B7            [ 4] 1974 	or	a, a
   53F9 28 06         [12] 1975 	jr	Z,00136$
   53FB DD 6E FE      [19] 1976 	ld	l,-2 (ix)
   53FE DD 66 FF      [19] 1977 	ld	h,-1 (ix)
   5401                    1978 00136$:
   5401 CB 2C         [ 8] 1979 	sra	h
   5403 CB 1D         [ 8] 1980 	rr	l
   5405 CB 2C         [ 8] 1981 	sra	h
   5407 CB 1D         [ 8] 1982 	rr	l
   5409 CB 2C         [ 8] 1983 	sra	h
   540B CB 1D         [ 8] 1984 	rr	l
   540D CB 2C         [ 8] 1985 	sra	h
   540F CB 1D         [ 8] 1986 	rr	l
   5411 29            [11] 1987 	add	hl, hl
   5412 11 6E 73      [10] 1988 	ld	de,#_scene
   5415 19            [11] 1989 	add	hl,de
   5416 5E            [ 7] 1990 	ld	e,(hl)
   5417 23            [ 6] 1991 	inc	hl
   5418 56            [ 7] 1992 	ld	d,(hl)
   5419 DD 6E F0      [19] 1993 	ld	l,-16 (ix)
   541C DD 66 F1      [19] 1994 	ld	h,-15 (ix)
   541F DD 7E FD      [19] 1995 	ld	a,-3 (ix)
   5422 B7            [ 4] 1996 	or	a, a
   5423 28 06         [12] 1997 	jr	Z,00137$
   5425 DD 6E F2      [19] 1998 	ld	l,-14 (ix)
   5428 DD 66 F3      [19] 1999 	ld	h,-13 (ix)
   542B                    2000 00137$:
   542B CB 2C         [ 8] 2001 	sra	h
   542D CB 1D         [ 8] 2002 	rr	l
   542F CB 2C         [ 8] 2003 	sra	h
   5431 CB 1D         [ 8] 2004 	rr	l
   5433 29            [11] 2005 	add	hl, hl
   5434 19            [11] 2006 	add	hl,de
   5435 5E            [ 7] 2007 	ld	e,(hl)
   5436 23            [ 6] 2008 	inc	hl
   5437 56            [ 7] 2009 	ld	d,(hl)
   5438 7B            [ 4] 2010 	ld	a,e
   5439 D6 05         [ 7] 2011 	sub	a,#0x05
   543B 20 04         [12] 2012 	jr	NZ,00274$
   543D B2            [ 4] 2013 	or	a,d
   543E CA 24 55      [10] 2014 	jp	Z,00120$
   5441                    2015 00274$:
                           2016 ;src/main.c:218: }else if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 9   
   5441 DD 7E F6      [19] 2017 	ld	a,-10 (ix)
   5444 D6 09         [ 7] 2018 	sub	a, #0x09
   5446 20 07         [12] 2019 	jr	NZ,00275$
   5448 DD 7E F7      [19] 2020 	ld	a,-9 (ix)
   544B B7            [ 4] 2021 	or	a, a
   544C CA 0F 55      [10] 2022 	jp	Z,00101$
   544F                    2023 00275$:
                           2024 ;src/main.c:219: || scene[(posY[0])/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 9
   544F DD 6E F0      [19] 2025 	ld	l,-16 (ix)
   5452 DD 66 F1      [19] 2026 	ld	h,-15 (ix)
   5455 DD 7E FD      [19] 2027 	ld	a,-3 (ix)
   5458 B7            [ 4] 2028 	or	a, a
   5459 28 06         [12] 2029 	jr	Z,00138$
   545B DD 6E F2      [19] 2030 	ld	l,-14 (ix)
   545E DD 66 F3      [19] 2031 	ld	h,-13 (ix)
   5461                    2032 00138$:
   5461 CB 2C         [ 8] 2033 	sra	h
   5463 CB 1D         [ 8] 2034 	rr	l
   5465 CB 2C         [ 8] 2035 	sra	h
   5467 CB 1D         [ 8] 2036 	rr	l
   5469 29            [11] 2037 	add	hl, hl
   546A DD 5E FA      [19] 2038 	ld	e,-6 (ix)
   546D DD 56 FB      [19] 2039 	ld	d,-5 (ix)
   5470 19            [11] 2040 	add	hl,de
   5471 56            [ 7] 2041 	ld	d,(hl)
   5472 23            [ 6] 2042 	inc	hl
   5473 66            [ 7] 2043 	ld	h,(hl)
   5474 7A            [ 4] 2044 	ld	a,d
   5475 D6 09         [ 7] 2045 	sub	a,#0x09
   5477 20 04         [12] 2046 	jr	NZ,00276$
   5479 B4            [ 4] 2047 	or	a,h
   547A CA 0F 55      [10] 2048 	jp	Z,00101$
   547D                    2049 00276$:
                           2050 ;src/main.c:220: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0])/tilewidth] == 9
   547D 69            [ 4] 2051 	ld	l, c
   547E 60            [ 4] 2052 	ld	h, b
   547F DD 7E FC      [19] 2053 	ld	a,-4 (ix)
   5482 B7            [ 4] 2054 	or	a, a
   5483 28 06         [12] 2055 	jr	Z,00139$
   5485 DD 6E FE      [19] 2056 	ld	l,-2 (ix)
   5488 DD 66 FF      [19] 2057 	ld	h,-1 (ix)
   548B                    2058 00139$:
   548B CB 2C         [ 8] 2059 	sra	h
   548D CB 1D         [ 8] 2060 	rr	l
   548F CB 2C         [ 8] 2061 	sra	h
   5491 CB 1D         [ 8] 2062 	rr	l
   5493 CB 2C         [ 8] 2063 	sra	h
   5495 CB 1D         [ 8] 2064 	rr	l
   5497 CB 2C         [ 8] 2065 	sra	h
   5499 CB 1D         [ 8] 2066 	rr	l
   549B 29            [11] 2067 	add	hl, hl
   549C 11 6E 73      [10] 2068 	ld	de,#_scene
   549F 19            [11] 2069 	add	hl,de
   54A0 5E            [ 7] 2070 	ld	e,(hl)
   54A1 23            [ 6] 2071 	inc	hl
   54A2 56            [ 7] 2072 	ld	d,(hl)
   54A3 DD 6E F8      [19] 2073 	ld	l,-8 (ix)
   54A6 DD 66 F9      [19] 2074 	ld	h,-7 (ix)
   54A9 19            [11] 2075 	add	hl,de
   54AA 56            [ 7] 2076 	ld	d,(hl)
   54AB 23            [ 6] 2077 	inc	hl
   54AC 66            [ 7] 2078 	ld	h,(hl)
   54AD 7A            [ 4] 2079 	ld	a,d
   54AE D6 09         [ 7] 2080 	sub	a,#0x09
   54B0 20 03         [12] 2081 	jr	NZ,00277$
   54B2 B4            [ 4] 2082 	or	a,h
   54B3 28 5A         [12] 2083 	jr	Z,00101$
   54B5                    2084 00277$:
                           2085 ;src/main.c:221: || scene[(posY[0]+playerheight-2)/tileheight][(posX[0]+playerwidth-1)/tilewidth] == 9
   54B5 DD 7E FC      [19] 2086 	ld	a,-4 (ix)
   54B8 B7            [ 4] 2087 	or	a, a
   54B9 28 06         [12] 2088 	jr	Z,00140$
   54BB DD 4E FE      [19] 2089 	ld	c,-2 (ix)
   54BE DD 46 FF      [19] 2090 	ld	b,-1 (ix)
   54C1                    2091 00140$:
   54C1 69            [ 4] 2092 	ld	l, c
   54C2 60            [ 4] 2093 	ld	h, b
   54C3 CB 2C         [ 8] 2094 	sra	h
   54C5 CB 1D         [ 8] 2095 	rr	l
   54C7 CB 2C         [ 8] 2096 	sra	h
   54C9 CB 1D         [ 8] 2097 	rr	l
   54CB CB 2C         [ 8] 2098 	sra	h
   54CD CB 1D         [ 8] 2099 	rr	l
   54CF CB 2C         [ 8] 2100 	sra	h
   54D1 CB 1D         [ 8] 2101 	rr	l
   54D3 29            [11] 2102 	add	hl, hl
   54D4 11 6E 73      [10] 2103 	ld	de,#_scene
   54D7 19            [11] 2104 	add	hl,de
   54D8 7E            [ 7] 2105 	ld	a,(hl)
   54D9 DD 77 FE      [19] 2106 	ld	-2 (ix),a
   54DC 23            [ 6] 2107 	inc	hl
   54DD 7E            [ 7] 2108 	ld	a,(hl)
   54DE DD 77 FF      [19] 2109 	ld	-1 (ix),a
   54E1 DD 5E F0      [19] 2110 	ld	e,-16 (ix)
   54E4 DD 66 F1      [19] 2111 	ld	h,-15 (ix)
   54E7 DD 7E FD      [19] 2112 	ld	a,-3 (ix)
   54EA B7            [ 4] 2113 	or	a, a
   54EB 28 06         [12] 2114 	jr	Z,00141$
   54ED DD 5E F2      [19] 2115 	ld	e,-14 (ix)
   54F0 DD 66 F3      [19] 2116 	ld	h,-13 (ix)
   54F3                    2117 00141$:
   54F3 6B            [ 4] 2118 	ld	l, e
   54F4 CB 2C         [ 8] 2119 	sra	h
   54F6 CB 1D         [ 8] 2120 	rr	l
   54F8 CB 2C         [ 8] 2121 	sra	h
   54FA CB 1D         [ 8] 2122 	rr	l
   54FC 29            [11] 2123 	add	hl, hl
   54FD DD 5E FE      [19] 2124 	ld	e,-2 (ix)
   5500 DD 56 FF      [19] 2125 	ld	d,-1 (ix)
   5503 19            [11] 2126 	add	hl,de
   5504 56            [ 7] 2127 	ld	d,(hl)
   5505 23            [ 6] 2128 	inc	hl
   5506 66            [ 7] 2129 	ld	h,(hl)
   5507 7A            [ 4] 2130 	ld	a,d
   5508 D6 09         [ 7] 2131 	sub	a,#0x09
   550A 20 18         [12] 2132 	jr	NZ,00120$
   550C B4            [ 4] 2133 	or	a,h
   550D 20 15         [12] 2134 	jr	NZ,00120$
   550F                    2135 00101$:
                           2136 ;src/main.c:223: cpct_clearScreen(0);
   550F 21 00 40      [10] 2137 	ld	hl,#0x4000
   5512 E5            [11] 2138 	push	hl
   5513 AF            [ 4] 2139 	xor	a, a
   5514 F5            [11] 2140 	push	af
   5515 33            [ 6] 2141 	inc	sp
   5516 26 C0         [ 7] 2142 	ld	h, #0xC0
   5518 E5            [11] 2143 	push	hl
   5519 CD 35 66      [17] 2144 	call	_cpct_memset
                           2145 ;src/main.c:224: drawMap(2);
   551C 21 02 00      [10] 2146 	ld	hl,#0x0002
   551F E5            [11] 2147 	push	hl
   5520 CD 7E 4D      [17] 2148 	call	_drawMap
   5523 F1            [10] 2149 	pop	af
   5524                    2150 00120$:
                           2151 ;src/main.c:226: return bound;
   5524 DD 6E ED      [19] 2152 	ld	l,-19 (ix)
   5527 DD F9         [10] 2153 	ld	sp, ix
   5529 DD E1         [14] 2154 	pop	ix
   552B C9            [10] 2155 	ret
                           2156 ;src/main.c:229: void checkArrowCollisions(u8 *x,u8 *y, u8 *vivo,u8 w,u8 h){
                           2157 ;	---------------------------------
                           2158 ; Function checkArrowCollisions
                           2159 ; ---------------------------------
   552C                    2160 _checkArrowCollisions::
   552C DD E5         [15] 2161 	push	ix
   552E DD 21 00 00   [14] 2162 	ld	ix,#0
   5532 DD 39         [15] 2163 	add	ix,sp
   5534 21 F8 FF      [10] 2164 	ld	hl,#-8
   5537 39            [11] 2165 	add	hl,sp
   5538 F9            [ 6] 2166 	ld	sp,hl
                           2167 ;src/main.c:231: u8 *posX = x;
   5539 DD 5E 04      [19] 2168 	ld	e,4 (ix)
   553C DD 56 05      [19] 2169 	ld	d,5 (ix)
                           2170 ;src/main.c:232: u8 *posY = y;
   553F DD 4E 06      [19] 2171 	ld	c,6 (ix)
   5542 DD 46 07      [19] 2172 	ld	b,7 (ix)
                           2173 ;src/main.c:233: if(    scene[(posY[0])/tileheight][(posX[0])/tilewidth] == 1   
   5545 0A            [ 7] 2174 	ld	a,(bc)
   5546 DD 77 FD      [19] 2175 	ld	-3 (ix), a
   5549 07            [ 4] 2176 	rlca
   554A 07            [ 4] 2177 	rlca
   554B 07            [ 4] 2178 	rlca
   554C 07            [ 4] 2179 	rlca
   554D E6 0F         [ 7] 2180 	and	a,#0x0F
   554F 6F            [ 4] 2181 	ld	l,a
   5550 26 00         [ 7] 2182 	ld	h,#0x00
   5552 29            [11] 2183 	add	hl, hl
   5553 01 6E 73      [10] 2184 	ld	bc,#_scene
   5556 09            [11] 2185 	add	hl,bc
   5557 7E            [ 7] 2186 	ld	a,(hl)
   5558 DD 77 FE      [19] 2187 	ld	-2 (ix),a
   555B 23            [ 6] 2188 	inc	hl
   555C 7E            [ 7] 2189 	ld	a,(hl)
   555D DD 77 FF      [19] 2190 	ld	-1 (ix),a
   5560 1A            [ 7] 2191 	ld	a,(de)
   5561 DD 77 FC      [19] 2192 	ld	-4 (ix), a
   5564 6F            [ 4] 2193 	ld	l, a
   5565 CB 3D         [ 8] 2194 	srl	l
   5567 CB 3D         [ 8] 2195 	srl	l
   5569 26 00         [ 7] 2196 	ld	h,#0x00
   556B 29            [11] 2197 	add	hl, hl
   556C DD 75 FA      [19] 2198 	ld	-6 (ix),l
   556F DD 74 FB      [19] 2199 	ld	-5 (ix),h
   5572 DD 7E FE      [19] 2200 	ld	a,-2 (ix)
   5575 DD 86 FA      [19] 2201 	add	a, -6 (ix)
   5578 6F            [ 4] 2202 	ld	l,a
   5579 DD 7E FF      [19] 2203 	ld	a,-1 (ix)
   557C DD 8E FB      [19] 2204 	adc	a, -5 (ix)
   557F 67            [ 4] 2205 	ld	h,a
   5580 56            [ 7] 2206 	ld	d,(hl)
   5581 23            [ 6] 2207 	inc	hl
   5582 66            [ 7] 2208 	ld	h,(hl)
   5583 15            [ 4] 2209 	dec	d
   5584 20 05         [12] 2210 	jr	NZ,00137$
   5586 7C            [ 4] 2211 	ld	a,h
   5587 B7            [ 4] 2212 	or	a, a
   5588 CA 2F 56      [10] 2213 	jp	Z,00106$
   558B                    2214 00137$:
                           2215 ;src/main.c:234: || scene[(posY[0])/tileheight][(posX[0]+w-1)/tilewidth] == 1
   558B DD 6E FC      [19] 2216 	ld	l,-4 (ix)
   558E 26 00         [ 7] 2217 	ld	h,#0x00
   5590 DD 5E 0A      [19] 2218 	ld	e,10 (ix)
   5593 16 00         [ 7] 2219 	ld	d,#0x00
   5595 19            [11] 2220 	add	hl,de
   5596 5D            [ 4] 2221 	ld	e,l
   5597 54            [ 4] 2222 	ld	d,h
   5598 1B            [ 6] 2223 	dec	de
   5599 4B            [ 4] 2224 	ld	c, e
   559A 7A            [ 4] 2225 	ld	a,d
   559B 47            [ 4] 2226 	ld	b,a
   559C 07            [ 4] 2227 	rlca
   559D E6 01         [ 7] 2228 	and	a,#0x01
   559F 5F            [ 4] 2229 	ld	e,a
   55A0 23            [ 6] 2230 	inc	hl
   55A1 23            [ 6] 2231 	inc	hl
   55A2 54            [ 4] 2232 	ld	d,h
   55A3 7B            [ 4] 2233 	ld	a,e
   55A4 B7            [ 4] 2234 	or	a, a
   55A5 28 02         [12] 2235 	jr	Z,00108$
   55A7 4D            [ 4] 2236 	ld	c, l
   55A8 42            [ 4] 2237 	ld	b, d
   55A9                    2238 00108$:
   55A9 69            [ 4] 2239 	ld	l, c
   55AA 60            [ 4] 2240 	ld	h, b
   55AB CB 2C         [ 8] 2241 	sra	h
   55AD CB 1D         [ 8] 2242 	rr	l
   55AF CB 2C         [ 8] 2243 	sra	h
   55B1 CB 1D         [ 8] 2244 	rr	l
   55B3 29            [11] 2245 	add	hl, hl
   55B4 DD 5E FE      [19] 2246 	ld	e,-2 (ix)
   55B7 DD 56 FF      [19] 2247 	ld	d,-1 (ix)
   55BA 19            [11] 2248 	add	hl,de
   55BB 56            [ 7] 2249 	ld	d,(hl)
   55BC 23            [ 6] 2250 	inc	hl
   55BD 66            [ 7] 2251 	ld	h,(hl)
   55BE 15            [ 4] 2252 	dec	d
   55BF 20 04         [12] 2253 	jr	NZ,00138$
   55C1 7C            [ 4] 2254 	ld	a,h
   55C2 B7            [ 4] 2255 	or	a, a
   55C3 28 6A         [12] 2256 	jr	Z,00106$
   55C5                    2257 00138$:
                           2258 ;src/main.c:235: || scene[(posY[0]+h-2)/tileheight][(posX[0])/tilewidth] == 1 
   55C5 DD 6E FD      [19] 2259 	ld	l,-3 (ix)
   55C8 26 00         [ 7] 2260 	ld	h,#0x00
   55CA DD 5E 0B      [19] 2261 	ld	e,11 (ix)
   55CD 16 00         [ 7] 2262 	ld	d,#0x00
   55CF 19            [11] 2263 	add	hl,de
   55D0 5D            [ 4] 2264 	ld	e,l
   55D1 54            [ 4] 2265 	ld	d,h
   55D2 1B            [ 6] 2266 	dec	de
   55D3 1B            [ 6] 2267 	dec	de
   55D4 DD 73 FE      [19] 2268 	ld	-2 (ix),e
   55D7 DD 72 FF      [19] 2269 	ld	-1 (ix),d
   55DA 7A            [ 4] 2270 	ld	a,d
   55DB 07            [ 4] 2271 	rlca
   55DC E6 01         [ 7] 2272 	and	a,#0x01
   55DE DD 77 FC      [19] 2273 	ld	-4 (ix),a
   55E1 7D            [ 4] 2274 	ld	a,l
   55E2 C6 0D         [ 7] 2275 	add	a, #0x0D
   55E4 DD 77 F8      [19] 2276 	ld	-8 (ix),a
   55E7 7C            [ 4] 2277 	ld	a,h
   55E8 CE 00         [ 7] 2278 	adc	a, #0x00
   55EA DD 77 F9      [19] 2279 	ld	-7 (ix),a
   55ED DD 7E FC      [19] 2280 	ld	a,-4 (ix)
   55F0 B7            [ 4] 2281 	or	a, a
   55F1 28 0C         [12] 2282 	jr	Z,00109$
   55F3 DD 7E F8      [19] 2283 	ld	a,-8 (ix)
   55F6 DD 77 FE      [19] 2284 	ld	-2 (ix),a
   55F9 DD 7E F9      [19] 2285 	ld	a,-7 (ix)
   55FC DD 77 FF      [19] 2286 	ld	-1 (ix),a
   55FF                    2287 00109$:
   55FF DD 6E FE      [19] 2288 	ld	l,-2 (ix)
   5602 DD 66 FF      [19] 2289 	ld	h,-1 (ix)
   5605 CB 2C         [ 8] 2290 	sra	h
   5607 CB 1D         [ 8] 2291 	rr	l
   5609 CB 2C         [ 8] 2292 	sra	h
   560B CB 1D         [ 8] 2293 	rr	l
   560D CB 2C         [ 8] 2294 	sra	h
   560F CB 1D         [ 8] 2295 	rr	l
   5611 CB 2C         [ 8] 2296 	sra	h
   5613 CB 1D         [ 8] 2297 	rr	l
   5615 29            [11] 2298 	add	hl, hl
   5616 11 6E 73      [10] 2299 	ld	de,#_scene
   5619 19            [11] 2300 	add	hl,de
   561A 5E            [ 7] 2301 	ld	e,(hl)
   561B 23            [ 6] 2302 	inc	hl
   561C 56            [ 7] 2303 	ld	d,(hl)
   561D DD 6E FA      [19] 2304 	ld	l,-6 (ix)
   5620 DD 66 FB      [19] 2305 	ld	h,-5 (ix)
   5623 19            [11] 2306 	add	hl,de
   5624 56            [ 7] 2307 	ld	d,(hl)
   5625 23            [ 6] 2308 	inc	hl
   5626 66            [ 7] 2309 	ld	h,(hl)
   5627 15            [ 4] 2310 	dec	d
   5628 20 04         [12] 2311 	jr	NZ,00139$
   562A 7C            [ 4] 2312 	ld	a,h
   562B B7            [ 4] 2313 	or	a, a
   562C 28 01         [12] 2314 	jr	Z,00140$
   562E                    2315 00139$:
   562E AF            [ 4] 2316 	xor	a,a
   562F                    2317 00140$:
                           2318 ;src/main.c:238: vivo = 1;
   562F                    2319 00106$:
   562F DD F9         [10] 2320 	ld	sp, ix
   5631 DD E1         [14] 2321 	pop	ix
   5633 C9            [10] 2322 	ret
                           2323 ;src/main.c:242: void checkEnemiesCollisions(){
                           2324 ;	---------------------------------
                           2325 ; Function checkEnemiesCollisions
                           2326 ; ---------------------------------
   5634                    2327 _checkEnemiesCollisions::
                           2328 ;src/main.c:245: }
   5634 C9            [10] 2329 	ret
                           2330 ;src/main.c:249: u8* checkKeyboard(u8 *x, u8 *y,int *finish,u8 *s,u8 *dir,u8 *size){
                           2331 ;	---------------------------------
                           2332 ; Function checkKeyboard
                           2333 ; ---------------------------------
   5635                    2334 _checkKeyboard::
   5635 DD E5         [15] 2335 	push	ix
   5637 DD 21 00 00   [14] 2336 	ld	ix,#0
   563B DD 39         [15] 2337 	add	ix,sp
   563D F5            [11] 2338 	push	af
   563E F5            [11] 2339 	push	af
                           2340 ;src/main.c:251: u8 *sprite = s;
   563F DD 5E 0A      [19] 2341 	ld	e,10 (ix)
   5642 DD 56 0B      [19] 2342 	ld	d,11 (ix)
                           2343 ;src/main.c:252: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
   5645 D5            [11] 2344 	push	de
   5646 21 00 02      [10] 2345 	ld	hl,#0x0200
   5649 CD 24 62      [17] 2346 	call	_cpct_isKeyPressed
   564C 4D            [ 4] 2347 	ld	c,l
   564D D1            [10] 2348 	pop	de
   564E DD 6E 04      [19] 2349 	ld	l,4 (ix)
   5651 DD 66 05      [19] 2350 	ld	h,5 (ix)
                           2351 ;src/main.c:254: dir[0] = 6;
   5654 DD 7E 0C      [19] 2352 	ld	a,12 (ix)
   5657 DD 77 FE      [19] 2353 	ld	-2 (ix),a
   565A DD 7E 0D      [19] 2354 	ld	a,13 (ix)
   565D DD 77 FF      [19] 2355 	ld	-1 (ix),a
                           2356 ;src/main.c:255: size[0] = 4;
   5660 DD 7E 0E      [19] 2357 	ld	a,14 (ix)
   5663 DD 77 FC      [19] 2358 	ld	-4 (ix),a
   5666 DD 7E 0F      [19] 2359 	ld	a,15 (ix)
   5669 DD 77 FD      [19] 2360 	ld	-3 (ix),a
                           2361 ;src/main.c:252: if(cpct_isKeyPressed(Key_CursorRight) && x[0] < 76 ){
   566C 79            [ 4] 2362 	ld	a,c
   566D B7            [ 4] 2363 	or	a, a
   566E 28 1A         [12] 2364 	jr	Z,00125$
   5670 46            [ 7] 2365 	ld	b,(hl)
   5671 78            [ 4] 2366 	ld	a,b
   5672 D6 4C         [ 7] 2367 	sub	a, #0x4C
   5674 30 14         [12] 2368 	jr	NC,00125$
                           2369 ;src/main.c:253: x[0] += 1;
   5676 04            [ 4] 2370 	inc	b
   5677 70            [ 7] 2371 	ld	(hl),b
                           2372 ;src/main.c:254: dir[0] = 6;
   5678 DD 6E FE      [19] 2373 	ld	l,-2 (ix)
   567B DD 66 FF      [19] 2374 	ld	h,-1 (ix)
   567E 36 06         [10] 2375 	ld	(hl),#0x06
                           2376 ;src/main.c:255: size[0] = 4;
   5680 E1            [10] 2377 	pop	hl
   5681 E5            [11] 2378 	push	hl
   5682 36 04         [10] 2379 	ld	(hl),#0x04
                           2380 ;src/main.c:256: sprite = gladis_quieto_dcha;
   5684 11 00 46      [10] 2381 	ld	de,#_gladis_quieto_dcha+0
   5687 C3 4B 57      [10] 2382 	jp	00126$
   568A                    2383 00125$:
                           2384 ;src/main.c:257: }else if(cpct_isKeyPressed(Key_CursorLeft) && x[0] > 0 ){
   568A E5            [11] 2385 	push	hl
   568B D5            [11] 2386 	push	de
   568C 21 01 01      [10] 2387 	ld	hl,#0x0101
   568F CD 24 62      [17] 2388 	call	_cpct_isKeyPressed
   5692 7D            [ 4] 2389 	ld	a,l
   5693 D1            [10] 2390 	pop	de
   5694 E1            [10] 2391 	pop	hl
   5695 B7            [ 4] 2392 	or	a, a
   5696 28 19         [12] 2393 	jr	Z,00121$
   5698 7E            [ 7] 2394 	ld	a,(hl)
   5699 B7            [ 4] 2395 	or	a, a
   569A 28 15         [12] 2396 	jr	Z,00121$
                           2397 ;src/main.c:258: x[0] -= 1;
   569C C6 FF         [ 7] 2398 	add	a,#0xFF
   569E 77            [ 7] 2399 	ld	(hl),a
                           2400 ;src/main.c:259: dir[0] = 4;
   569F DD 6E FE      [19] 2401 	ld	l,-2 (ix)
   56A2 DD 66 FF      [19] 2402 	ld	h,-1 (ix)
   56A5 36 04         [10] 2403 	ld	(hl),#0x04
                           2404 ;src/main.c:260: size[0] = 4;
   56A7 E1            [10] 2405 	pop	hl
   56A8 E5            [11] 2406 	push	hl
   56A9 36 04         [10] 2407 	ld	(hl),#0x04
                           2408 ;src/main.c:261: sprite = gladis_quieto_izda;
   56AB 11 80 46      [10] 2409 	ld	de,#_gladis_quieto_izda+0
   56AE C3 4B 57      [10] 2410 	jp	00126$
   56B1                    2411 00121$:
                           2412 ;src/main.c:262: }else  if(cpct_isKeyPressed(Key_CursorDown) && y[0] < 180){
   56B1 D5            [11] 2413 	push	de
   56B2 21 00 04      [10] 2414 	ld	hl,#0x0400
   56B5 CD 24 62      [17] 2415 	call	_cpct_isKeyPressed
   56B8 4D            [ 4] 2416 	ld	c,l
   56B9 D1            [10] 2417 	pop	de
   56BA DD 6E 06      [19] 2418 	ld	l,6 (ix)
   56BD DD 66 07      [19] 2419 	ld	h,7 (ix)
   56C0 79            [ 4] 2420 	ld	a,c
   56C1 B7            [ 4] 2421 	or	a, a
   56C2 28 1A         [12] 2422 	jr	Z,00117$
   56C4 46            [ 7] 2423 	ld	b,(hl)
   56C5 78            [ 4] 2424 	ld	a,b
   56C6 D6 B4         [ 7] 2425 	sub	a, #0xB4
   56C8 30 14         [12] 2426 	jr	NC,00117$
                           2427 ;src/main.c:263: y[0] += 2;
   56CA 04            [ 4] 2428 	inc	b
   56CB 04            [ 4] 2429 	inc	b
   56CC 70            [ 7] 2430 	ld	(hl),b
                           2431 ;src/main.c:264: dir[0] = 2;
   56CD DD 6E FE      [19] 2432 	ld	l,-2 (ix)
   56D0 DD 66 FF      [19] 2433 	ld	h,-1 (ix)
   56D3 36 02         [10] 2434 	ld	(hl),#0x02
                           2435 ;src/main.c:265: size[0] = 4;
   56D5 E1            [10] 2436 	pop	hl
   56D6 E5            [11] 2437 	push	hl
   56D7 36 04         [10] 2438 	ld	(hl),#0x04
                           2439 ;src/main.c:266: sprite = gladis_quieto_dcha;
   56D9 11 00 46      [10] 2440 	ld	de,#_gladis_quieto_dcha+0
   56DC 18 6D         [12] 2441 	jr	00126$
   56DE                    2442 00117$:
                           2443 ;src/main.c:267: }else if(cpct_isKeyPressed(Key_CursorUp) && y[0] > 0 ){
   56DE E5            [11] 2444 	push	hl
   56DF D5            [11] 2445 	push	de
   56E0 21 00 01      [10] 2446 	ld	hl,#0x0100
   56E3 CD 24 62      [17] 2447 	call	_cpct_isKeyPressed
   56E6 7D            [ 4] 2448 	ld	a,l
   56E7 D1            [10] 2449 	pop	de
   56E8 E1            [10] 2450 	pop	hl
   56E9 B7            [ 4] 2451 	or	a, a
   56EA 28 18         [12] 2452 	jr	Z,00113$
   56EC 7E            [ 7] 2453 	ld	a,(hl)
   56ED B7            [ 4] 2454 	or	a, a
   56EE 28 14         [12] 2455 	jr	Z,00113$
                           2456 ;src/main.c:268: y[0] -= 2;
   56F0 C6 FE         [ 7] 2457 	add	a,#0xFE
   56F2 77            [ 7] 2458 	ld	(hl),a
                           2459 ;src/main.c:269: dir[0] = 8;
   56F3 DD 6E FE      [19] 2460 	ld	l,-2 (ix)
   56F6 DD 66 FF      [19] 2461 	ld	h,-1 (ix)
   56F9 36 08         [10] 2462 	ld	(hl),#0x08
                           2463 ;src/main.c:270: size[0] = 4;
   56FB E1            [10] 2464 	pop	hl
   56FC E5            [11] 2465 	push	hl
   56FD 36 04         [10] 2466 	ld	(hl),#0x04
                           2467 ;src/main.c:271: sprite = gladis_arriba_dcha;
   56FF 11 80 43      [10] 2468 	ld	de,#_gladis_arriba_dcha+0
   5702 18 47         [12] 2469 	jr	00126$
   5704                    2470 00113$:
                           2471 ;src/main.c:272: }else  if(cpct_isKeyPressed(Key_Esc)){
   5704 D5            [11] 2472 	push	de
   5705 21 08 04      [10] 2473 	ld	hl,#0x0408
   5708 CD 24 62      [17] 2474 	call	_cpct_isKeyPressed
   570B 7D            [ 4] 2475 	ld	a,l
   570C D1            [10] 2476 	pop	de
   570D B7            [ 4] 2477 	or	a, a
   570E 28 0D         [12] 2478 	jr	Z,00110$
                           2479 ;src/main.c:273: finish[0] = 1;
   5710 DD 6E 08      [19] 2480 	ld	l,8 (ix)
   5713 DD 66 09      [19] 2481 	ld	h,9 (ix)
   5716 36 01         [10] 2482 	ld	(hl),#0x01
   5718 23            [ 6] 2483 	inc	hl
   5719 36 00         [10] 2484 	ld	(hl),#0x00
   571B 18 2E         [12] 2485 	jr	00126$
   571D                    2486 00110$:
                           2487 ;src/main.c:274: }else if(cpct_isKeyPressed(Key_Space)){
   571D D5            [11] 2488 	push	de
   571E 21 05 80      [10] 2489 	ld	hl,#0x8005
   5721 CD 24 62      [17] 2490 	call	_cpct_isKeyPressed
   5724 7D            [ 4] 2491 	ld	a,l
   5725 D1            [10] 2492 	pop	de
   5726 B7            [ 4] 2493 	or	a, a
   5727 28 22         [12] 2494 	jr	Z,00126$
                           2495 ;src/main.c:275: size[0] = 5;
   5729 E1            [10] 2496 	pop	hl
   572A E5            [11] 2497 	push	hl
   572B 36 05         [10] 2498 	ld	(hl),#0x05
                           2499 ;src/main.c:276: if(dir[0] == 6) {sprite = gladis_atk_dcha;}
   572D DD 6E FE      [19] 2500 	ld	l,-2 (ix)
   5730 DD 66 FF      [19] 2501 	ld	h,-1 (ix)
   5733 6E            [ 7] 2502 	ld	l,(hl)
   5734 7D            [ 4] 2503 	ld	a,l
   5735 D6 06         [ 7] 2504 	sub	a, #0x06
   5737 20 05         [12] 2505 	jr	NZ,00105$
   5739 11 30 60      [10] 2506 	ld	de,#_gladis_atk_dcha+0
   573C 18 0D         [12] 2507 	jr	00126$
   573E                    2508 00105$:
                           2509 ;src/main.c:277: else if(dir[0] == 4) {sprite = gladis_atk_izda;}
   573E 7D            [ 4] 2510 	ld	a,l
   573F D6 04         [ 7] 2511 	sub	a, #0x04
   5741 20 05         [12] 2512 	jr	NZ,00102$
   5743 11 D0 60      [10] 2513 	ld	de,#_gladis_atk_izda+0
   5746 18 03         [12] 2514 	jr	00126$
   5748                    2515 00102$:
                           2516 ;src/main.c:278: else {sprite = gladis_quieto_dcha;} 
   5748 11 00 46      [10] 2517 	ld	de,#_gladis_quieto_dcha+0
   574B                    2518 00126$:
                           2519 ;src/main.c:280: return sprite;
   574B EB            [ 4] 2520 	ex	de,hl
   574C DD F9         [10] 2521 	ld	sp, ix
   574E DD E1         [14] 2522 	pop	ix
   5750 C9            [10] 2523 	ret
                           2524 ;src/main.c:284: u8* move(u8 *x,u8 *y,u8 *s,u8 bound,u8 *dir,u8 *size){
                           2525 ;	---------------------------------
                           2526 ; Function move
                           2527 ; ---------------------------------
   5751                    2528 _move::
   5751 DD E5         [15] 2529 	push	ix
   5753 DD 21 00 00   [14] 2530 	ld	ix,#0
   5757 DD 39         [15] 2531 	add	ix,sp
   5759 21 E9 FF      [10] 2532 	ld	hl,#-23
   575C 39            [11] 2533 	add	hl,sp
   575D F9            [ 6] 2534 	ld	sp,hl
                           2535 ;src/main.c:285: int px = x[0];
   575E DD 7E 04      [19] 2536 	ld	a,4 (ix)
   5761 DD 77 FE      [19] 2537 	ld	-2 (ix),a
   5764 DD 7E 05      [19] 2538 	ld	a,5 (ix)
   5767 DD 77 FF      [19] 2539 	ld	-1 (ix),a
   576A DD 6E FE      [19] 2540 	ld	l,-2 (ix)
   576D DD 66 FF      [19] 2541 	ld	h,-1 (ix)
   5770 7E            [ 7] 2542 	ld	a,(hl)
   5771 DD 77 FC      [19] 2543 	ld	-4 (ix),a
   5774 DD 36 FD 00   [19] 2544 	ld	-3 (ix),#0x00
                           2545 ;src/main.c:286: int py = y[0];
   5778 DD 7E 06      [19] 2546 	ld	a,6 (ix)
   577B DD 77 F3      [19] 2547 	ld	-13 (ix),a
   577E DD 7E 07      [19] 2548 	ld	a,7 (ix)
   5781 DD 77 F4      [19] 2549 	ld	-12 (ix),a
   5784 DD 6E F3      [19] 2550 	ld	l,-13 (ix)
   5787 DD 66 F4      [19] 2551 	ld	h,-12 (ix)
   578A 7E            [ 7] 2552 	ld	a,(hl)
   578B DD 77 FA      [19] 2553 	ld	-6 (ix),a
   578E DD 36 FB 00   [19] 2554 	ld	-5 (ix),#0x00
                           2555 ;src/main.c:287: u8 *sprite = s;
   5792 DD 7E 08      [19] 2556 	ld	a,8 (ix)
   5795 DD 77 F8      [19] 2557 	ld	-8 (ix),a
   5798 DD 7E 09      [19] 2558 	ld	a,9 (ix)
   579B DD 77 F9      [19] 2559 	ld	-7 (ix),a
                           2560 ;src/main.c:290: switch(dir[0]){
   579E DD 7E 0B      [19] 2561 	ld	a,11 (ix)
   57A1 DD 77 F6      [19] 2562 	ld	-10 (ix),a
   57A4 DD 7E 0C      [19] 2563 	ld	a,12 (ix)
   57A7 DD 77 F7      [19] 2564 	ld	-9 (ix),a
                           2565 ;src/main.c:289: if(bound == 1){
   57AA DD 7E 0A      [19] 2566 	ld	a,10 (ix)
   57AD 3D            [ 4] 2567 	dec	a
   57AE 20 7C         [12] 2568 	jr	NZ,00126$
                           2569 ;src/main.c:290: switch(dir[0]){
   57B0 DD 6E F6      [19] 2570 	ld	l,-10 (ix)
   57B3 DD 66 F7      [19] 2571 	ld	h,-9 (ix)
   57B6 7E            [ 7] 2572 	ld	a, (hl)
   57B7 FE 02         [ 7] 2573 	cp	a,#0x02
   57B9 28 0F         [12] 2574 	jr	Z,00101$
   57BB FE 04         [ 7] 2575 	cp	a,#0x04
   57BD 28 5B         [12] 2576 	jr	Z,00104$
   57BF FE 06         [ 7] 2577 	cp	a,#0x06
   57C1 28 22         [12] 2578 	jr	Z,00102$
   57C3 D6 08         [ 7] 2579 	sub	a, #0x08
   57C5 28 38         [12] 2580 	jr	Z,00103$
   57C7 C3 AC 5A      [10] 2581 	jp	00127$
                           2582 ;src/main.c:291: case 2: 
   57CA                    2583 00101$:
                           2584 ;src/main.c:292: dir[0] = 8;
   57CA DD 6E F6      [19] 2585 	ld	l,-10 (ix)
   57CD DD 66 F7      [19] 2586 	ld	h,-9 (ix)
   57D0 36 08         [10] 2587 	ld	(hl),#0x08
                           2588 ;src/main.c:293: y[0] -= 2;
   57D2 DD 6E F3      [19] 2589 	ld	l,-13 (ix)
   57D5 DD 66 F4      [19] 2590 	ld	h,-12 (ix)
   57D8 7E            [ 7] 2591 	ld	a,(hl)
   57D9 C6 FE         [ 7] 2592 	add	a,#0xFE
   57DB DD 6E F3      [19] 2593 	ld	l,-13 (ix)
   57DE DD 66 F4      [19] 2594 	ld	h,-12 (ix)
   57E1 77            [ 7] 2595 	ld	(hl),a
                           2596 ;src/main.c:294: break;
   57E2 C3 AC 5A      [10] 2597 	jp	00127$
                           2598 ;src/main.c:295: case 6:
   57E5                    2599 00102$:
                           2600 ;src/main.c:296: dir[0] = 4;
   57E5 DD 6E F6      [19] 2601 	ld	l,-10 (ix)
   57E8 DD 66 F7      [19] 2602 	ld	h,-9 (ix)
   57EB 36 04         [10] 2603 	ld	(hl),#0x04
                           2604 ;src/main.c:297: x[0] -= 1;
   57ED DD 6E FE      [19] 2605 	ld	l,-2 (ix)
   57F0 DD 66 FF      [19] 2606 	ld	h,-1 (ix)
   57F3 56            [ 7] 2607 	ld	d,(hl)
   57F4 15            [ 4] 2608 	dec	d
   57F5 DD 6E FE      [19] 2609 	ld	l,-2 (ix)
   57F8 DD 66 FF      [19] 2610 	ld	h,-1 (ix)
   57FB 72            [ 7] 2611 	ld	(hl),d
                           2612 ;src/main.c:298: break;
   57FC C3 AC 5A      [10] 2613 	jp	00127$
                           2614 ;src/main.c:299: case 8:
   57FF                    2615 00103$:
                           2616 ;src/main.c:300: dir[0] = 6;
   57FF DD 6E F6      [19] 2617 	ld	l,-10 (ix)
   5802 DD 66 F7      [19] 2618 	ld	h,-9 (ix)
   5805 36 06         [10] 2619 	ld	(hl),#0x06
                           2620 ;src/main.c:301: y[0] += 2;
   5807 DD 6E F3      [19] 2621 	ld	l,-13 (ix)
   580A DD 66 F4      [19] 2622 	ld	h,-12 (ix)
   580D 7E            [ 7] 2623 	ld	a,(hl)
   580E C6 02         [ 7] 2624 	add	a, #0x02
   5810 DD 6E F3      [19] 2625 	ld	l,-13 (ix)
   5813 DD 66 F4      [19] 2626 	ld	h,-12 (ix)
   5816 77            [ 7] 2627 	ld	(hl),a
                           2628 ;src/main.c:302: break;
   5817 C3 AC 5A      [10] 2629 	jp	00127$
                           2630 ;src/main.c:303: case 4:
   581A                    2631 00104$:
                           2632 ;src/main.c:304: dir[0] = 6;
   581A DD 6E F6      [19] 2633 	ld	l,-10 (ix)
   581D DD 66 F7      [19] 2634 	ld	h,-9 (ix)
   5820 36 06         [10] 2635 	ld	(hl),#0x06
                           2636 ;src/main.c:305: x[0] += 1;
   5822 DD 6E FE      [19] 2637 	ld	l,-2 (ix)
   5825 DD 66 FF      [19] 2638 	ld	h,-1 (ix)
   5828 34            [11] 2639 	inc	(hl)
                           2640 ;src/main.c:307: }
   5829 C3 AC 5A      [10] 2641 	jp	00127$
   582C                    2642 00126$:
                           2643 ;src/main.c:310: int rnd = (rand()%4)+1;
   582C CD 9A 62      [17] 2644 	call	_rand
   582F 01 04 00      [10] 2645 	ld	bc,#0x0004
   5832 C5            [11] 2646 	push	bc
   5833 E5            [11] 2647 	push	hl
   5834 CD 1C 67      [17] 2648 	call	__modsint
   5837 F1            [10] 2649 	pop	af
   5838 F1            [10] 2650 	pop	af
   5839 23            [ 6] 2651 	inc	hl
   583A E3            [19] 2652 	ex	(sp), hl
                           2653 ;src/main.c:313: if(scene[py/tileheight][px/tilewidth] == 2 ){
   583B DD 7E FB      [19] 2654 	ld	a,-5 (ix)
   583E 07            [ 4] 2655 	rlca
   583F E6 01         [ 7] 2656 	and	a,#0x01
   5841 DD 77 F5      [19] 2657 	ld	-11 (ix),a
   5844 DD 7E FA      [19] 2658 	ld	a,-6 (ix)
   5847 C6 0F         [ 7] 2659 	add	a, #0x0F
   5849 DD 77 F1      [19] 2660 	ld	-15 (ix),a
   584C DD 7E FB      [19] 2661 	ld	a,-5 (ix)
   584F CE 00         [ 7] 2662 	adc	a, #0x00
   5851 DD 77 F2      [19] 2663 	ld	-14 (ix),a
                           2664 ;src/main.c:317: size[0] = 4;
   5854 DD 7E 0D      [19] 2665 	ld	a,13 (ix)
   5857 DD 77 EF      [19] 2666 	ld	-17 (ix),a
   585A DD 7E 0E      [19] 2667 	ld	a,14 (ix)
   585D DD 77 F0      [19] 2668 	ld	-16 (ix),a
                           2669 ;src/main.c:311: if(rnd == 4){
   5860 DD 7E E9      [19] 2670 	ld	a,-23 (ix)
   5863 D6 04         [ 7] 2671 	sub	a, #0x04
   5865 C2 07 59      [10] 2672 	jp	NZ,00123$
   5868 DD 7E EA      [19] 2673 	ld	a,-22 (ix)
   586B B7            [ 4] 2674 	or	a, a
   586C C2 07 59      [10] 2675 	jp	NZ,00123$
                           2676 ;src/main.c:312: px +=1;
   586F DD 7E FC      [19] 2677 	ld	a,-4 (ix)
   5872 C6 01         [ 7] 2678 	add	a, #0x01
   5874 DD 77 EB      [19] 2679 	ld	-21 (ix),a
   5877 DD 7E FD      [19] 2680 	ld	a,-3 (ix)
   587A CE 00         [ 7] 2681 	adc	a, #0x00
   587C DD 77 EC      [19] 2682 	ld	-20 (ix),a
                           2683 ;src/main.c:313: if(scene[py/tileheight][px/tilewidth] == 2 ){
   587F DD 7E FA      [19] 2684 	ld	a,-6 (ix)
   5882 DD 77 ED      [19] 2685 	ld	-19 (ix),a
   5885 DD 7E FB      [19] 2686 	ld	a,-5 (ix)
   5888 DD 77 EE      [19] 2687 	ld	-18 (ix),a
   588B DD 7E F5      [19] 2688 	ld	a,-11 (ix)
   588E B7            [ 4] 2689 	or	a, a
   588F 28 0C         [12] 2690 	jr	Z,00130$
   5891 DD 7E F1      [19] 2691 	ld	a,-15 (ix)
   5894 DD 77 ED      [19] 2692 	ld	-19 (ix),a
   5897 DD 7E F2      [19] 2693 	ld	a,-14 (ix)
   589A DD 77 EE      [19] 2694 	ld	-18 (ix),a
   589D                    2695 00130$:
   589D DD 6E ED      [19] 2696 	ld	l,-19 (ix)
   58A0 DD 66 EE      [19] 2697 	ld	h,-18 (ix)
   58A3 CB 2C         [ 8] 2698 	sra	h
   58A5 CB 1D         [ 8] 2699 	rr	l
   58A7 CB 2C         [ 8] 2700 	sra	h
   58A9 CB 1D         [ 8] 2701 	rr	l
   58AB CB 2C         [ 8] 2702 	sra	h
   58AD CB 1D         [ 8] 2703 	rr	l
   58AF CB 2C         [ 8] 2704 	sra	h
   58B1 CB 1D         [ 8] 2705 	rr	l
   58B3 29            [11] 2706 	add	hl, hl
   58B4 11 6E 73      [10] 2707 	ld	de,#_scene
   58B7 19            [11] 2708 	add	hl,de
   58B8 4E            [ 7] 2709 	ld	c,(hl)
   58B9 23            [ 6] 2710 	inc	hl
   58BA 46            [ 7] 2711 	ld	b,(hl)
   58BB D1            [10] 2712 	pop	de
   58BC E1            [10] 2713 	pop	hl
   58BD E5            [11] 2714 	push	hl
   58BE D5            [11] 2715 	push	de
   58BF DD CB EC 7E   [20] 2716 	bit	7, -20 (ix)
   58C3 28 09         [12] 2717 	jr	Z,00131$
   58C5 DD 6E EB      [19] 2718 	ld	l,-21 (ix)
   58C8 DD 66 EC      [19] 2719 	ld	h,-20 (ix)
   58CB 23            [ 6] 2720 	inc	hl
   58CC 23            [ 6] 2721 	inc	hl
   58CD 23            [ 6] 2722 	inc	hl
   58CE                    2723 00131$:
   58CE CB 2C         [ 8] 2724 	sra	h
   58D0 CB 1D         [ 8] 2725 	rr	l
   58D2 CB 2C         [ 8] 2726 	sra	h
   58D4 CB 1D         [ 8] 2727 	rr	l
   58D6 29            [11] 2728 	add	hl, hl
   58D7 09            [11] 2729 	add	hl,bc
   58D8 56            [ 7] 2730 	ld	d,(hl)
   58D9 23            [ 6] 2731 	inc	hl
   58DA 66            [ 7] 2732 	ld	h,(hl)
   58DB 7A            [ 4] 2733 	ld	a,d
   58DC D6 02         [ 7] 2734 	sub	a,#0x02
   58DE C2 AC 5A      [10] 2735 	jp	NZ,00127$
   58E1 B4            [ 4] 2736 	or	a,h
   58E2 C2 AC 5A      [10] 2737 	jp	NZ,00127$
                           2738 ;src/main.c:314: sprite = chacho_quieto_dcha;
   58E5 DD 36 F8 80   [19] 2739 	ld	-8 (ix),#<(_chacho_quieto_dcha)
   58E9 DD 36 F9 44   [19] 2740 	ld	-7 (ix),#>(_chacho_quieto_dcha)
                           2741 ;src/main.c:315: x[0] += 1;
   58ED DD 6E FE      [19] 2742 	ld	l,-2 (ix)
   58F0 DD 66 FF      [19] 2743 	ld	h,-1 (ix)
   58F3 34            [11] 2744 	inc	(hl)
                           2745 ;src/main.c:316: dir[0] = 6;
   58F4 DD 6E F6      [19] 2746 	ld	l,-10 (ix)
   58F7 DD 66 F7      [19] 2747 	ld	h,-9 (ix)
   58FA 36 06         [10] 2748 	ld	(hl),#0x06
                           2749 ;src/main.c:317: size[0] = 4;
   58FC DD 6E EF      [19] 2750 	ld	l,-17 (ix)
   58FF DD 66 F0      [19] 2751 	ld	h,-16 (ix)
   5902 36 04         [10] 2752 	ld	(hl),#0x04
   5904 C3 AC 5A      [10] 2753 	jp	00127$
   5907                    2754 00123$:
                           2755 ;src/main.c:319: }else if(rnd == 3){
   5907 DD 7E E9      [19] 2756 	ld	a,-23 (ix)
   590A D6 03         [ 7] 2757 	sub	a, #0x03
   590C C2 96 59      [10] 2758 	jp	NZ,00120$
   590F DD 7E EA      [19] 2759 	ld	a,-22 (ix)
   5912 B7            [ 4] 2760 	or	a, a
   5913 C2 96 59      [10] 2761 	jp	NZ,00120$
                           2762 ;src/main.c:320: px -=1;
   5916 DD 4E FC      [19] 2763 	ld	c,-4 (ix)
   5919 DD 46 FD      [19] 2764 	ld	b,-3 (ix)
   591C 0B            [ 6] 2765 	dec	bc
                           2766 ;src/main.c:321: if(scene[py/tileheight][px/tilewidth] == 2 ){
   591D DD 6E FA      [19] 2767 	ld	l,-6 (ix)
   5920 DD 66 FB      [19] 2768 	ld	h,-5 (ix)
   5923 DD 7E F5      [19] 2769 	ld	a,-11 (ix)
   5926 B7            [ 4] 2770 	or	a, a
   5927 28 06         [12] 2771 	jr	Z,00132$
   5929 DD 6E F1      [19] 2772 	ld	l,-15 (ix)
   592C DD 66 F2      [19] 2773 	ld	h,-14 (ix)
   592F                    2774 00132$:
   592F CB 2C         [ 8] 2775 	sra	h
   5931 CB 1D         [ 8] 2776 	rr	l
   5933 CB 2C         [ 8] 2777 	sra	h
   5935 CB 1D         [ 8] 2778 	rr	l
   5937 CB 2C         [ 8] 2779 	sra	h
   5939 CB 1D         [ 8] 2780 	rr	l
   593B CB 2C         [ 8] 2781 	sra	h
   593D CB 1D         [ 8] 2782 	rr	l
   593F 29            [11] 2783 	add	hl, hl
   5940 11 6E 73      [10] 2784 	ld	de,#_scene
   5943 19            [11] 2785 	add	hl,de
   5944 5E            [ 7] 2786 	ld	e,(hl)
   5945 23            [ 6] 2787 	inc	hl
   5946 56            [ 7] 2788 	ld	d,(hl)
   5947 61            [ 4] 2789 	ld	h,c
   5948 68            [ 4] 2790 	ld	l,b
   5949 CB 78         [ 8] 2791 	bit	7, b
   594B 28 05         [12] 2792 	jr	Z,00133$
   594D 03            [ 6] 2793 	inc	bc
   594E 03            [ 6] 2794 	inc	bc
   594F 03            [ 6] 2795 	inc	bc
   5950 61            [ 4] 2796 	ld	h,c
   5951 68            [ 4] 2797 	ld	l,b
   5952                    2798 00133$:
   5952 7D            [ 4] 2799 	ld	a, l
   5953 6C            [ 4] 2800 	ld	l,h
   5954 67            [ 4] 2801 	ld	h,a
   5955 CB 2C         [ 8] 2802 	sra	h
   5957 CB 1D         [ 8] 2803 	rr	l
   5959 CB 2C         [ 8] 2804 	sra	h
   595B CB 1D         [ 8] 2805 	rr	l
   595D 29            [11] 2806 	add	hl, hl
   595E 19            [11] 2807 	add	hl,de
   595F 56            [ 7] 2808 	ld	d,(hl)
   5960 23            [ 6] 2809 	inc	hl
   5961 66            [ 7] 2810 	ld	h,(hl)
   5962 7A            [ 4] 2811 	ld	a,d
   5963 D6 02         [ 7] 2812 	sub	a,#0x02
   5965 C2 AC 5A      [10] 2813 	jp	NZ,00127$
   5968 B4            [ 4] 2814 	or	a,h
   5969 C2 AC 5A      [10] 2815 	jp	NZ,00127$
                           2816 ;src/main.c:322: sprite = chacho_quieto_izda;
   596C DD 36 F8 00   [19] 2817 	ld	-8 (ix),#<(_chacho_quieto_izda)
   5970 DD 36 F9 45   [19] 2818 	ld	-7 (ix),#>(_chacho_quieto_izda)
                           2819 ;src/main.c:323: x[0] -= 1;
   5974 DD 6E FE      [19] 2820 	ld	l,-2 (ix)
   5977 DD 66 FF      [19] 2821 	ld	h,-1 (ix)
   597A 56            [ 7] 2822 	ld	d,(hl)
   597B 15            [ 4] 2823 	dec	d
   597C DD 6E FE      [19] 2824 	ld	l,-2 (ix)
   597F DD 66 FF      [19] 2825 	ld	h,-1 (ix)
   5982 72            [ 7] 2826 	ld	(hl),d
                           2827 ;src/main.c:324: dir[0] = 4;
   5983 DD 6E F6      [19] 2828 	ld	l,-10 (ix)
   5986 DD 66 F7      [19] 2829 	ld	h,-9 (ix)
   5989 36 04         [10] 2830 	ld	(hl),#0x04
                           2831 ;src/main.c:325: size[0] = 4;
   598B DD 6E EF      [19] 2832 	ld	l,-17 (ix)
   598E DD 66 F0      [19] 2833 	ld	h,-16 (ix)
   5991 36 04         [10] 2834 	ld	(hl),#0x04
   5993 C3 AC 5A      [10] 2835 	jp	00127$
   5996                    2836 00120$:
                           2837 ;src/main.c:313: if(scene[py/tileheight][px/tilewidth] == 2 ){
   5996 DD 7E FD      [19] 2838 	ld	a,-3 (ix)
   5999 07            [ 4] 2839 	rlca
   599A E6 01         [ 7] 2840 	and	a,#0x01
   599C DD 77 ED      [19] 2841 	ld	-19 (ix),a
   599F DD 4E FC      [19] 2842 	ld	c,-4 (ix)
   59A2 DD 46 FD      [19] 2843 	ld	b,-3 (ix)
   59A5 03            [ 6] 2844 	inc	bc
   59A6 03            [ 6] 2845 	inc	bc
   59A7 03            [ 6] 2846 	inc	bc
                           2847 ;src/main.c:327: }else if(rnd == 2){
   59A8 DD 7E E9      [19] 2848 	ld	a,-23 (ix)
   59AB D6 02         [ 7] 2849 	sub	a, #0x02
   59AD 20 77         [12] 2850 	jr	NZ,00117$
   59AF DD 7E EA      [19] 2851 	ld	a,-22 (ix)
   59B2 B7            [ 4] 2852 	or	a, a
   59B3 20 71         [12] 2853 	jr	NZ,00117$
                           2854 ;src/main.c:328: py -=1;
   59B5 DD 5E FA      [19] 2855 	ld	e,-6 (ix)
   59B8 DD 56 FB      [19] 2856 	ld	d,-5 (ix)
   59BB 1B            [ 6] 2857 	dec	de
                           2858 ;src/main.c:329: if(scene[py/tileheight][px/tilewidth] == 2 ){
   59BC 6B            [ 4] 2859 	ld	l, e
   59BD 62            [ 4] 2860 	ld	h, d
   59BE CB 7A         [ 8] 2861 	bit	7, d
   59C0 28 04         [12] 2862 	jr	Z,00134$
   59C2 21 0F 00      [10] 2863 	ld	hl,#0x000F
   59C5 19            [11] 2864 	add	hl,de
   59C6                    2865 00134$:
   59C6 CB 2C         [ 8] 2866 	sra	h
   59C8 CB 1D         [ 8] 2867 	rr	l
   59CA CB 2C         [ 8] 2868 	sra	h
   59CC CB 1D         [ 8] 2869 	rr	l
   59CE CB 2C         [ 8] 2870 	sra	h
   59D0 CB 1D         [ 8] 2871 	rr	l
   59D2 CB 2C         [ 8] 2872 	sra	h
   59D4 CB 1D         [ 8] 2873 	rr	l
   59D6 29            [11] 2874 	add	hl, hl
   59D7 11 6E 73      [10] 2875 	ld	de,#_scene
   59DA 19            [11] 2876 	add	hl,de
   59DB 5E            [ 7] 2877 	ld	e,(hl)
   59DC 23            [ 6] 2878 	inc	hl
   59DD 56            [ 7] 2879 	ld	d,(hl)
   59DE DD 6E FC      [19] 2880 	ld	l,-4 (ix)
   59E1 DD 66 FD      [19] 2881 	ld	h,-3 (ix)
   59E4 DD 7E ED      [19] 2882 	ld	a,-19 (ix)
   59E7 B7            [ 4] 2883 	or	a, a
   59E8 28 02         [12] 2884 	jr	Z,00135$
   59EA 69            [ 4] 2885 	ld	l, c
   59EB 60            [ 4] 2886 	ld	h, b
   59EC                    2887 00135$:
   59EC CB 2C         [ 8] 2888 	sra	h
   59EE CB 1D         [ 8] 2889 	rr	l
   59F0 CB 2C         [ 8] 2890 	sra	h
   59F2 CB 1D         [ 8] 2891 	rr	l
   59F4 29            [11] 2892 	add	hl, hl
   59F5 19            [11] 2893 	add	hl,de
   59F6 56            [ 7] 2894 	ld	d,(hl)
   59F7 23            [ 6] 2895 	inc	hl
   59F8 66            [ 7] 2896 	ld	h,(hl)
   59F9 7A            [ 4] 2897 	ld	a,d
   59FA D6 02         [ 7] 2898 	sub	a,#0x02
   59FC C2 AC 5A      [10] 2899 	jp	NZ,00127$
   59FF B4            [ 4] 2900 	or	a,h
   5A00 C2 AC 5A      [10] 2901 	jp	NZ,00127$
                           2902 ;src/main.c:330: y[0] += 2;
   5A03 DD 6E F3      [19] 2903 	ld	l,-13 (ix)
   5A06 DD 66 F4      [19] 2904 	ld	h,-12 (ix)
   5A09 7E            [ 7] 2905 	ld	a,(hl)
   5A0A C6 02         [ 7] 2906 	add	a, #0x02
   5A0C DD 6E F3      [19] 2907 	ld	l,-13 (ix)
   5A0F DD 66 F4      [19] 2908 	ld	h,-12 (ix)
   5A12 77            [ 7] 2909 	ld	(hl),a
                           2910 ;src/main.c:331: dir[0] = 2;
   5A13 DD 6E F6      [19] 2911 	ld	l,-10 (ix)
   5A16 DD 66 F7      [19] 2912 	ld	h,-9 (ix)
   5A19 36 02         [10] 2913 	ld	(hl),#0x02
                           2914 ;src/main.c:332: size[0] = 4;
   5A1B DD 6E EF      [19] 2915 	ld	l,-17 (ix)
   5A1E DD 66 F0      [19] 2916 	ld	h,-16 (ix)
   5A21 36 04         [10] 2917 	ld	(hl),#0x04
   5A23 C3 AC 5A      [10] 2918 	jp	00127$
   5A26                    2919 00117$:
                           2920 ;src/main.c:334: }else if(rnd == 1){
   5A26 DD 7E E9      [19] 2921 	ld	a,-23 (ix)
   5A29 3D            [ 4] 2922 	dec	a
   5A2A C2 AC 5A      [10] 2923 	jp	NZ,00127$
   5A2D DD 7E EA      [19] 2924 	ld	a,-22 (ix)
   5A30 B7            [ 4] 2925 	or	a, a
   5A31 20 79         [12] 2926 	jr	NZ,00127$
                           2927 ;src/main.c:335: py +=1;
   5A33 DD 5E FA      [19] 2928 	ld	e,-6 (ix)
   5A36 DD 56 FB      [19] 2929 	ld	d,-5 (ix)
   5A39 13            [ 6] 2930 	inc	de
                           2931 ;src/main.c:336: if(scene[py/tileheight][px/tilewidth] == 2 ){
   5A3A 6B            [ 4] 2932 	ld	l, e
   5A3B 62            [ 4] 2933 	ld	h, d
   5A3C CB 7A         [ 8] 2934 	bit	7, d
   5A3E 28 04         [12] 2935 	jr	Z,00136$
   5A40 21 0F 00      [10] 2936 	ld	hl,#0x000F
   5A43 19            [11] 2937 	add	hl,de
   5A44                    2938 00136$:
   5A44 CB 2C         [ 8] 2939 	sra	h
   5A46 CB 1D         [ 8] 2940 	rr	l
   5A48 CB 2C         [ 8] 2941 	sra	h
   5A4A CB 1D         [ 8] 2942 	rr	l
   5A4C CB 2C         [ 8] 2943 	sra	h
   5A4E CB 1D         [ 8] 2944 	rr	l
   5A50 CB 2C         [ 8] 2945 	sra	h
   5A52 CB 1D         [ 8] 2946 	rr	l
   5A54 29            [11] 2947 	add	hl, hl
   5A55 11 6E 73      [10] 2948 	ld	de,#_scene
   5A58 19            [11] 2949 	add	hl,de
   5A59 7E            [ 7] 2950 	ld	a,(hl)
   5A5A DD 77 F1      [19] 2951 	ld	-15 (ix),a
   5A5D 23            [ 6] 2952 	inc	hl
   5A5E 7E            [ 7] 2953 	ld	a,(hl)
   5A5F DD 77 F2      [19] 2954 	ld	-14 (ix),a
   5A62 DD 5E FC      [19] 2955 	ld	e,-4 (ix)
   5A65 DD 66 FD      [19] 2956 	ld	h,-3 (ix)
   5A68 DD 7E ED      [19] 2957 	ld	a,-19 (ix)
   5A6B B7            [ 4] 2958 	or	a, a
   5A6C 28 02         [12] 2959 	jr	Z,00137$
   5A6E 59            [ 4] 2960 	ld	e,c
   5A6F 60            [ 4] 2961 	ld	h,b
   5A70                    2962 00137$:
   5A70 6B            [ 4] 2963 	ld	l, e
   5A71 CB 2C         [ 8] 2964 	sra	h
   5A73 CB 1D         [ 8] 2965 	rr	l
   5A75 CB 2C         [ 8] 2966 	sra	h
   5A77 CB 1D         [ 8] 2967 	rr	l
   5A79 29            [11] 2968 	add	hl, hl
   5A7A DD 5E F1      [19] 2969 	ld	e,-15 (ix)
   5A7D DD 56 F2      [19] 2970 	ld	d,-14 (ix)
   5A80 19            [11] 2971 	add	hl,de
   5A81 56            [ 7] 2972 	ld	d,(hl)
   5A82 23            [ 6] 2973 	inc	hl
   5A83 66            [ 7] 2974 	ld	h,(hl)
   5A84 7A            [ 4] 2975 	ld	a,d
   5A85 D6 02         [ 7] 2976 	sub	a,#0x02
   5A87 20 23         [12] 2977 	jr	NZ,00127$
   5A89 B4            [ 4] 2978 	or	a,h
   5A8A 20 20         [12] 2979 	jr	NZ,00127$
                           2980 ;src/main.c:337: y[0] -= 2;
   5A8C DD 6E F3      [19] 2981 	ld	l,-13 (ix)
   5A8F DD 66 F4      [19] 2982 	ld	h,-12 (ix)
   5A92 7E            [ 7] 2983 	ld	a,(hl)
   5A93 C6 FE         [ 7] 2984 	add	a,#0xFE
   5A95 DD 6E F3      [19] 2985 	ld	l,-13 (ix)
   5A98 DD 66 F4      [19] 2986 	ld	h,-12 (ix)
   5A9B 77            [ 7] 2987 	ld	(hl),a
                           2988 ;src/main.c:338: dir[0] = 8;
   5A9C DD 6E F6      [19] 2989 	ld	l,-10 (ix)
   5A9F DD 66 F7      [19] 2990 	ld	h,-9 (ix)
   5AA2 36 08         [10] 2991 	ld	(hl),#0x08
                           2992 ;src/main.c:339: size[0] = 4;
   5AA4 DD 6E EF      [19] 2993 	ld	l,-17 (ix)
   5AA7 DD 66 F0      [19] 2994 	ld	h,-16 (ix)
   5AAA 36 04         [10] 2995 	ld	(hl),#0x04
   5AAC                    2996 00127$:
                           2997 ;src/main.c:346: return sprite;
   5AAC DD 6E F8      [19] 2998 	ld	l,-8 (ix)
   5AAF DD 66 F9      [19] 2999 	ld	h,-7 (ix)
   5AB2 DD F9         [10] 3000 	ld	sp, ix
   5AB4 DD E1         [14] 3001 	pop	ix
   5AB6 C9            [10] 3002 	ret
                           3003 ;src/main.c:351: TPlayer *create_Player(u8 x,u8 y,u8 *sprite,u8 life,u8 dir,u8 size){
                           3004 ;	---------------------------------
                           3005 ; Function create_Player
                           3006 ; ---------------------------------
   5AB7                    3007 _create_Player::
   5AB7 DD E5         [15] 3008 	push	ix
   5AB9 DD 21 00 00   [14] 3009 	ld	ix,#0
   5ABD DD 39         [15] 3010 	add	ix,sp
                           3011 ;src/main.c:352: TPlayer *player = malloc(sizeof *player);
   5ABF 21 09 00      [10] 3012 	ld	hl,#0x0009
   5AC2 E5            [11] 3013 	push	hl
   5AC3 CD 7E 64      [17] 3014 	call	_malloc
   5AC6 F1            [10] 3015 	pop	af
   5AC7 EB            [ 4] 3016 	ex	de,hl
                           3017 ;src/main.c:353: assert(player != NULL);
   5AC8 7B            [ 4] 3018 	ld	a,e
   5AC9 B2            [ 4] 3019 	or	a, d
   5ACA 20 16         [12] 3020 	jr	NZ,00104$
   5ACC 21 16 5B      [10] 3021 	ld	hl,#___str_4
   5ACF D5            [11] 3022 	push	de
   5AD0 01 61 01      [10] 3023 	ld	bc,#0x0161
   5AD3 C5            [11] 3024 	push	bc
   5AD4 01 25 5B      [10] 3025 	ld	bc,#___str_5
   5AD7 C5            [11] 3026 	push	bc
   5AD8 E5            [11] 3027 	push	hl
   5AD9 CD 35 63      [17] 3028 	call	__assert
   5ADC 21 06 00      [10] 3029 	ld	hl,#6
   5ADF 39            [11] 3030 	add	hl,sp
   5AE0 F9            [ 6] 3031 	ld	sp,hl
   5AE1 D1            [10] 3032 	pop	de
   5AE2                    3033 00104$:
                           3034 ;src/main.c:355: player->x = x;
   5AE2 DD 7E 04      [19] 3035 	ld	a,4 (ix)
   5AE5 12            [ 7] 3036 	ld	(de),a
                           3037 ;src/main.c:356: player->y = y;
   5AE6 6B            [ 4] 3038 	ld	l, e
   5AE7 62            [ 4] 3039 	ld	h, d
   5AE8 23            [ 6] 3040 	inc	hl
   5AE9 DD 7E 05      [19] 3041 	ld	a,5 (ix)
   5AEC 77            [ 7] 3042 	ld	(hl),a
                           3043 ;src/main.c:357: player->sprite = sprite;
   5AED 21 04 00      [10] 3044 	ld	hl,#0x0004
   5AF0 19            [11] 3045 	add	hl,de
   5AF1 DD 7E 06      [19] 3046 	ld	a,6 (ix)
   5AF4 77            [ 7] 3047 	ld	(hl),a
   5AF5 23            [ 6] 3048 	inc	hl
   5AF6 DD 7E 07      [19] 3049 	ld	a,7 (ix)
   5AF9 77            [ 7] 3050 	ld	(hl),a
                           3051 ;src/main.c:358: player->life = life;
   5AFA 21 06 00      [10] 3052 	ld	hl,#0x0006
   5AFD 19            [11] 3053 	add	hl,de
   5AFE DD 7E 08      [19] 3054 	ld	a,8 (ix)
   5B01 77            [ 7] 3055 	ld	(hl),a
                           3056 ;src/main.c:359: player->dir = dir;
   5B02 21 07 00      [10] 3057 	ld	hl,#0x0007
   5B05 19            [11] 3058 	add	hl,de
   5B06 DD 7E 09      [19] 3059 	ld	a,9 (ix)
   5B09 77            [ 7] 3060 	ld	(hl),a
                           3061 ;src/main.c:360: player->size = size;
   5B0A 21 08 00      [10] 3062 	ld	hl,#0x0008
   5B0D 19            [11] 3063 	add	hl,de
   5B0E DD 7E 0A      [19] 3064 	ld	a,10 (ix)
   5B11 77            [ 7] 3065 	ld	(hl),a
                           3066 ;src/main.c:362: return player;
   5B12 EB            [ 4] 3067 	ex	de,hl
   5B13 DD E1         [14] 3068 	pop	ix
   5B15 C9            [10] 3069 	ret
   5B16                    3070 ___str_4:
   5B16 70 6C 61 79 65 72  3071 	.ascii "player != NULL"
        20 21 3D 20 4E 55
        4C 4C
   5B24 00                 3072 	.db 0x00
   5B25                    3073 ___str_5:
   5B25 73 72 63 2F 6D 61  3074 	.ascii "src/main.c"
        69 6E 2E 63
   5B2F 00                 3075 	.db 0x00
                           3076 ;src/main.c:367: void drawSomething(){
                           3077 ;	---------------------------------
                           3078 ; Function drawSomething
                           3079 ; ---------------------------------
   5B30                    3080 _drawSomething::
                           3081 ;src/main.c:369: }
   5B30 C9            [10] 3082 	ret
                           3083 ;src/main.c:373: void game(){  
                           3084 ;	---------------------------------
                           3085 ; Function game
                           3086 ; ---------------------------------
   5B31                    3087 _game::
   5B31 DD E5         [15] 3088 	push	ix
   5B33 DD 21 00 00   [14] 3089 	ld	ix,#0
   5B37 DD 39         [15] 3090 	add	ix,sp
   5B39 21 E9 FF      [10] 3091 	ld	hl,#-23
   5B3C 39            [11] 3092 	add	hl,sp
   5B3D F9            [ 6] 3093 	ld	sp,hl
                           3094 ;src/main.c:374: TPlayer *p = create_Player(0,80,gladis_quieto_dcha,10,6,4);
   5B3E 11 00 46      [10] 3095 	ld	de,#_gladis_quieto_dcha
   5B41 21 06 04      [10] 3096 	ld	hl,#0x0406
   5B44 E5            [11] 3097 	push	hl
   5B45 3E 0A         [ 7] 3098 	ld	a,#0x0A
   5B47 F5            [11] 3099 	push	af
   5B48 33            [ 6] 3100 	inc	sp
   5B49 D5            [11] 3101 	push	de
   5B4A 21 00 50      [10] 3102 	ld	hl,#0x5000
   5B4D E5            [11] 3103 	push	hl
   5B4E CD B7 5A      [17] 3104 	call	_create_Player
   5B51 F1            [10] 3105 	pop	af
   5B52 F1            [10] 3106 	pop	af
   5B53 F1            [10] 3107 	pop	af
   5B54 33            [ 6] 3108 	inc	sp
   5B55 EB            [ 4] 3109 	ex	de,hl
                           3110 ;src/main.c:375: TPlayer *e = create_Player(15,120,chacho_quieto_dcha,10,6,4);
   5B56 01 80 44      [10] 3111 	ld	bc,#_chacho_quieto_dcha
   5B59 D5            [11] 3112 	push	de
   5B5A 21 06 04      [10] 3113 	ld	hl,#0x0406
   5B5D E5            [11] 3114 	push	hl
   5B5E 3E 0A         [ 7] 3115 	ld	a,#0x0A
   5B60 F5            [11] 3116 	push	af
   5B61 33            [ 6] 3117 	inc	sp
   5B62 C5            [11] 3118 	push	bc
   5B63 21 0F 78      [10] 3119 	ld	hl,#0x780F
   5B66 E5            [11] 3120 	push	hl
   5B67 CD B7 5A      [17] 3121 	call	_create_Player
   5B6A F1            [10] 3122 	pop	af
   5B6B F1            [10] 3123 	pop	af
   5B6C F1            [10] 3124 	pop	af
   5B6D 33            [ 6] 3125 	inc	sp
   5B6E D1            [10] 3126 	pop	de
   5B6F DD 75 EB      [19] 3127 	ld	-21 (ix),l
   5B72 DD 74 EC      [19] 3128 	ld	-20 (ix),h
                           3129 ;src/main.c:379: int finish = 0,i=1;
   5B75 21 00 00      [10] 3130 	ld	hl,#0x0000
   5B78 E3            [19] 3131 	ex	(sp), hl
                           3132 ;src/main.c:381: u8 bound =0;;
   5B79 DD 36 FF 00   [19] 3133 	ld	-1 (ix),#0x00
                           3134 ;src/main.c:386: cpct_clearScreen(0);
   5B7D D5            [11] 3135 	push	de
   5B7E 21 00 40      [10] 3136 	ld	hl,#0x4000
   5B81 E5            [11] 3137 	push	hl
   5B82 AF            [ 4] 3138 	xor	a, a
   5B83 F5            [11] 3139 	push	af
   5B84 33            [ 6] 3140 	inc	sp
   5B85 26 C0         [ 7] 3141 	ld	h, #0xC0
   5B87 E5            [11] 3142 	push	hl
   5B88 CD 35 66      [17] 3143 	call	_cpct_memset
   5B8B 21 01 00      [10] 3144 	ld	hl,#0x0001
   5B8E E5            [11] 3145 	push	hl
   5B8F CD 7E 4D      [17] 3146 	call	_drawMap
   5B92 F1            [10] 3147 	pop	af
   5B93 D1            [10] 3148 	pop	de
                           3149 ;src/main.c:389: while (1){
   5B94                    3150 00104$:
                           3151 ;src/main.c:392: cpct_waitVSYNC();
   5B94 D5            [11] 3152 	push	de
   5B95 CD D2 65      [17] 3153 	call	_cpct_waitVSYNC
   5B98 D1            [10] 3154 	pop	de
                           3155 ;src/main.c:395: cleanScreenPlayers(p,e);
   5B99 D5            [11] 3156 	push	de
   5B9A DD 6E EB      [19] 3157 	ld	l,-21 (ix)
   5B9D DD 66 EC      [19] 3158 	ld	h,-20 (ix)
   5BA0 E5            [11] 3159 	push	hl
   5BA1 D5            [11] 3160 	push	de
   5BA2 CD E1 4F      [17] 3161 	call	_cleanScreenPlayers
   5BA5 F1            [10] 3162 	pop	af
   5BA6 F1            [10] 3163 	pop	af
   5BA7 D1            [10] 3164 	pop	de
                           3165 ;src/main.c:398: drawPlayers(p,e);
   5BA8 D5            [11] 3166 	push	de
   5BA9 DD 6E EB      [19] 3167 	ld	l,-21 (ix)
   5BAC DD 66 EC      [19] 3168 	ld	h,-20 (ix)
   5BAF E5            [11] 3169 	push	hl
   5BB0 D5            [11] 3170 	push	de
   5BB1 CD 64 50      [17] 3171 	call	_drawPlayers
   5BB4 F1            [10] 3172 	pop	af
   5BB5 F1            [10] 3173 	pop	af
   5BB6 D1            [10] 3174 	pop	de
                           3175 ;src/main.c:405: p->lx = p->x;
   5BB7 21 02 00      [10] 3176 	ld	hl,#0x0002
   5BBA 19            [11] 3177 	add	hl,de
   5BBB DD 75 FD      [19] 3178 	ld	-3 (ix),l
   5BBE DD 74 FE      [19] 3179 	ld	-2 (ix),h
   5BC1 1A            [ 7] 3180 	ld	a,(de)
   5BC2 DD 6E FD      [19] 3181 	ld	l,-3 (ix)
   5BC5 DD 66 FE      [19] 3182 	ld	h,-2 (ix)
   5BC8 77            [ 7] 3183 	ld	(hl),a
                           3184 ;src/main.c:406: p->ly = p->y;
   5BC9 21 03 00      [10] 3185 	ld	hl,#0x0003
   5BCC 19            [11] 3186 	add	hl,de
   5BCD DD 75 FB      [19] 3187 	ld	-5 (ix),l
   5BD0 DD 74 FC      [19] 3188 	ld	-4 (ix),h
   5BD3 21 01 00      [10] 3189 	ld	hl,#0x0001
   5BD6 19            [11] 3190 	add	hl,de
   5BD7 DD 75 F9      [19] 3191 	ld	-7 (ix),l
   5BDA DD 74 FA      [19] 3192 	ld	-6 (ix),h
   5BDD DD 6E F9      [19] 3193 	ld	l,-7 (ix)
   5BE0 DD 66 FA      [19] 3194 	ld	h,-6 (ix)
   5BE3 7E            [ 7] 3195 	ld	a,(hl)
   5BE4 DD 6E FB      [19] 3196 	ld	l,-5 (ix)
   5BE7 DD 66 FC      [19] 3197 	ld	h,-4 (ix)
   5BEA 77            [ 7] 3198 	ld	(hl),a
                           3199 ;src/main.c:407: e->lx = e->x;
   5BEB DD 7E EB      [19] 3200 	ld	a,-21 (ix)
   5BEE C6 02         [ 7] 3201 	add	a, #0x02
   5BF0 DD 77 F7      [19] 3202 	ld	-9 (ix),a
   5BF3 DD 7E EC      [19] 3203 	ld	a,-20 (ix)
   5BF6 CE 00         [ 7] 3204 	adc	a, #0x00
   5BF8 DD 77 F8      [19] 3205 	ld	-8 (ix),a
   5BFB DD 6E EB      [19] 3206 	ld	l,-21 (ix)
   5BFE DD 66 EC      [19] 3207 	ld	h,-20 (ix)
   5C01 7E            [ 7] 3208 	ld	a,(hl)
   5C02 DD 6E F7      [19] 3209 	ld	l,-9 (ix)
   5C05 DD 66 F8      [19] 3210 	ld	h,-8 (ix)
   5C08 77            [ 7] 3211 	ld	(hl),a
                           3212 ;src/main.c:408: e->ly = e->y;
   5C09 DD 7E EB      [19] 3213 	ld	a,-21 (ix)
   5C0C C6 03         [ 7] 3214 	add	a, #0x03
   5C0E DD 77 F5      [19] 3215 	ld	-11 (ix),a
   5C11 DD 7E EC      [19] 3216 	ld	a,-20 (ix)
   5C14 CE 00         [ 7] 3217 	adc	a, #0x00
   5C16 DD 77 F6      [19] 3218 	ld	-10 (ix),a
   5C19 DD 7E EB      [19] 3219 	ld	a,-21 (ix)
   5C1C C6 01         [ 7] 3220 	add	a, #0x01
   5C1E DD 77 F3      [19] 3221 	ld	-13 (ix),a
   5C21 DD 7E EC      [19] 3222 	ld	a,-20 (ix)
   5C24 CE 00         [ 7] 3223 	adc	a, #0x00
   5C26 DD 77 F4      [19] 3224 	ld	-12 (ix),a
   5C29 DD 6E F3      [19] 3225 	ld	l,-13 (ix)
   5C2C DD 66 F4      [19] 3226 	ld	h,-12 (ix)
   5C2F 7E            [ 7] 3227 	ld	a,(hl)
   5C30 DD 6E F5      [19] 3228 	ld	l,-11 (ix)
   5C33 DD 66 F6      [19] 3229 	ld	h,-10 (ix)
   5C36 77            [ 7] 3230 	ld	(hl),a
                           3231 ;src/main.c:411: cpct_scanKeyboard_f();
   5C37 D5            [11] 3232 	push	de
   5C38 CD 30 62      [17] 3233 	call	_cpct_scanKeyboard_f
   5C3B D1            [10] 3234 	pop	de
                           3235 ;src/main.c:412: p->sprite  = checkKeyboard(&p->x,&p->y,&finish,p->sprite,&p->dir,&p->size);
   5C3C 21 04 00      [10] 3236 	ld	hl,#0x0004
   5C3F 19            [11] 3237 	add	hl,de
   5C40 DD 75 F1      [19] 3238 	ld	-15 (ix),l
   5C43 DD 74 F2      [19] 3239 	ld	-14 (ix),h
   5C46 21 08 00      [10] 3240 	ld	hl,#0x0008
   5C49 19            [11] 3241 	add	hl,de
   5C4A 4D            [ 4] 3242 	ld	c,l
   5C4B 44            [ 4] 3243 	ld	b,h
   5C4C 21 07 00      [10] 3244 	ld	hl,#0x0007
   5C4F 19            [11] 3245 	add	hl,de
   5C50 DD 75 EF      [19] 3246 	ld	-17 (ix),l
   5C53 DD 74 F0      [19] 3247 	ld	-16 (ix),h
   5C56 DD 6E F1      [19] 3248 	ld	l,-15 (ix)
   5C59 DD 66 F2      [19] 3249 	ld	h,-14 (ix)
   5C5C 7E            [ 7] 3250 	ld	a,(hl)
   5C5D DD 77 ED      [19] 3251 	ld	-19 (ix),a
   5C60 23            [ 6] 3252 	inc	hl
   5C61 7E            [ 7] 3253 	ld	a,(hl)
   5C62 DD 77 EE      [19] 3254 	ld	-18 (ix),a
   5C65 21 00 00      [10] 3255 	ld	hl,#0x0000
   5C68 39            [11] 3256 	add	hl,sp
   5C69 D5            [11] 3257 	push	de
   5C6A C5            [11] 3258 	push	bc
   5C6B DD 4E EF      [19] 3259 	ld	c,-17 (ix)
   5C6E DD 46 F0      [19] 3260 	ld	b,-16 (ix)
   5C71 C5            [11] 3261 	push	bc
   5C72 DD 4E ED      [19] 3262 	ld	c,-19 (ix)
   5C75 DD 46 EE      [19] 3263 	ld	b,-18 (ix)
   5C78 C5            [11] 3264 	push	bc
   5C79 E5            [11] 3265 	push	hl
   5C7A DD 6E F9      [19] 3266 	ld	l,-7 (ix)
   5C7D DD 66 FA      [19] 3267 	ld	h,-6 (ix)
   5C80 E5            [11] 3268 	push	hl
   5C81 D5            [11] 3269 	push	de
   5C82 CD 35 56      [17] 3270 	call	_checkKeyboard
   5C85 FD 21 0C 00   [14] 3271 	ld	iy,#12
   5C89 FD 39         [15] 3272 	add	iy,sp
   5C8B FD F9         [10] 3273 	ld	sp,iy
   5C8D 45            [ 4] 3274 	ld	b,l
   5C8E 4C            [ 4] 3275 	ld	c,h
   5C8F D1            [10] 3276 	pop	de
   5C90 DD 6E F1      [19] 3277 	ld	l,-15 (ix)
   5C93 DD 66 F2      [19] 3278 	ld	h,-14 (ix)
   5C96 70            [ 7] 3279 	ld	(hl),b
   5C97 23            [ 6] 3280 	inc	hl
   5C98 71            [ 7] 3281 	ld	(hl),c
                           3282 ;src/main.c:413: e->sprite = move(&e->x,&e->y,e->sprite,bound,&e->dir,&e->size);
   5C99 DD 7E EB      [19] 3283 	ld	a,-21 (ix)
   5C9C C6 04         [ 7] 3284 	add	a, #0x04
   5C9E DD 77 ED      [19] 3285 	ld	-19 (ix),a
   5CA1 DD 7E EC      [19] 3286 	ld	a,-20 (ix)
   5CA4 CE 00         [ 7] 3287 	adc	a, #0x00
   5CA6 DD 77 EE      [19] 3288 	ld	-18 (ix),a
   5CA9 FD 21 08 00   [14] 3289 	ld	iy,#0x0008
   5CAD DD 4E EB      [19] 3290 	ld	c,-21 (ix)
   5CB0 DD 46 EC      [19] 3291 	ld	b,-20 (ix)
   5CB3 FD 09         [15] 3292 	add	iy, bc
   5CB5 DD 7E EB      [19] 3293 	ld	a,-21 (ix)
   5CB8 C6 07         [ 7] 3294 	add	a, #0x07
   5CBA DD 77 EF      [19] 3295 	ld	-17 (ix),a
   5CBD DD 7E EC      [19] 3296 	ld	a,-20 (ix)
   5CC0 CE 00         [ 7] 3297 	adc	a, #0x00
   5CC2 DD 77 F0      [19] 3298 	ld	-16 (ix),a
   5CC5 DD 6E ED      [19] 3299 	ld	l,-19 (ix)
   5CC8 DD 66 EE      [19] 3300 	ld	h,-18 (ix)
   5CCB 4E            [ 7] 3301 	ld	c,(hl)
   5CCC 23            [ 6] 3302 	inc	hl
   5CCD 46            [ 7] 3303 	ld	b,(hl)
   5CCE D5            [11] 3304 	push	de
   5CCF FD E5         [15] 3305 	push	iy
   5CD1 DD 6E EF      [19] 3306 	ld	l,-17 (ix)
   5CD4 DD 66 F0      [19] 3307 	ld	h,-16 (ix)
   5CD7 E5            [11] 3308 	push	hl
   5CD8 DD 7E FF      [19] 3309 	ld	a,-1 (ix)
   5CDB F5            [11] 3310 	push	af
   5CDC 33            [ 6] 3311 	inc	sp
   5CDD C5            [11] 3312 	push	bc
   5CDE DD 6E F3      [19] 3313 	ld	l,-13 (ix)
   5CE1 DD 66 F4      [19] 3314 	ld	h,-12 (ix)
   5CE4 E5            [11] 3315 	push	hl
   5CE5 DD 6E EB      [19] 3316 	ld	l,-21 (ix)
   5CE8 DD 66 EC      [19] 3317 	ld	h,-20 (ix)
   5CEB E5            [11] 3318 	push	hl
   5CEC CD 51 57      [17] 3319 	call	_move
   5CEF FD 21 0B 00   [14] 3320 	ld	iy,#11
   5CF3 FD 39         [15] 3321 	add	iy,sp
   5CF5 FD F9         [10] 3322 	ld	sp,iy
   5CF7 45            [ 4] 3323 	ld	b,l
   5CF8 4C            [ 4] 3324 	ld	c,h
   5CF9 D1            [10] 3325 	pop	de
   5CFA DD 6E ED      [19] 3326 	ld	l,-19 (ix)
   5CFD DD 66 EE      [19] 3327 	ld	h,-18 (ix)
   5D00 70            [ 7] 3328 	ld	(hl),b
   5D01 23            [ 6] 3329 	inc	hl
   5D02 71            [ 7] 3330 	ld	(hl),c
                           3331 ;src/main.c:416: checkBoundsCollisions(&p->x,&p->y,p->lx,p->ly);
   5D03 DD 6E FB      [19] 3332 	ld	l,-5 (ix)
   5D06 DD 66 FC      [19] 3333 	ld	h,-4 (ix)
   5D09 46            [ 7] 3334 	ld	b,(hl)
   5D0A DD 6E FD      [19] 3335 	ld	l,-3 (ix)
   5D0D DD 66 FE      [19] 3336 	ld	h,-2 (ix)
   5D10 7E            [ 7] 3337 	ld	a,(hl)
   5D11 D5            [11] 3338 	push	de
   5D12 C5            [11] 3339 	push	bc
   5D13 33            [ 6] 3340 	inc	sp
   5D14 F5            [11] 3341 	push	af
   5D15 33            [ 6] 3342 	inc	sp
   5D16 DD 6E F9      [19] 3343 	ld	l,-7 (ix)
   5D19 DD 66 FA      [19] 3344 	ld	h,-6 (ix)
   5D1C E5            [11] 3345 	push	hl
   5D1D D5            [11] 3346 	push	de
   5D1E CD FC 50      [17] 3347 	call	_checkBoundsCollisions
   5D21 21 06 00      [10] 3348 	ld	hl,#6
   5D24 39            [11] 3349 	add	hl,sp
   5D25 F9            [ 6] 3350 	ld	sp,hl
   5D26 D1            [10] 3351 	pop	de
                           3352 ;src/main.c:417: bound = checkBoundsCollisions(&e->x,&e->y,e->lx,e->ly);
   5D27 DD 6E F5      [19] 3353 	ld	l,-11 (ix)
   5D2A DD 66 F6      [19] 3354 	ld	h,-10 (ix)
   5D2D 46            [ 7] 3355 	ld	b,(hl)
   5D2E DD 6E F7      [19] 3356 	ld	l,-9 (ix)
   5D31 DD 66 F8      [19] 3357 	ld	h,-8 (ix)
   5D34 7E            [ 7] 3358 	ld	a,(hl)
   5D35 D5            [11] 3359 	push	de
   5D36 C5            [11] 3360 	push	bc
   5D37 33            [ 6] 3361 	inc	sp
   5D38 F5            [11] 3362 	push	af
   5D39 33            [ 6] 3363 	inc	sp
   5D3A DD 6E F3      [19] 3364 	ld	l,-13 (ix)
   5D3D DD 66 F4      [19] 3365 	ld	h,-12 (ix)
   5D40 E5            [11] 3366 	push	hl
   5D41 DD 6E EB      [19] 3367 	ld	l,-21 (ix)
   5D44 DD 66 EC      [19] 3368 	ld	h,-20 (ix)
   5D47 E5            [11] 3369 	push	hl
   5D48 CD FC 50      [17] 3370 	call	_checkBoundsCollisions
   5D4B F1            [10] 3371 	pop	af
   5D4C F1            [10] 3372 	pop	af
   5D4D F1            [10] 3373 	pop	af
   5D4E D1            [10] 3374 	pop	de
   5D4F DD 75 FF      [19] 3375 	ld	-1 (ix),l
                           3376 ;src/main.c:422: if(finish == 1) {
   5D52 DD 7E E9      [19] 3377 	ld	a,-23 (ix)
   5D55 3D            [ 4] 3378 	dec	a
   5D56 C2 94 5B      [10] 3379 	jp	NZ,00104$
   5D59 DD 7E EA      [19] 3380 	ld	a,-22 (ix)
   5D5C B7            [ 4] 3381 	or	a, a
   5D5D C2 94 5B      [10] 3382 	jp	NZ,00104$
                           3383 ;src/main.c:423: free(p);
   5D60 D5            [11] 3384 	push	de
   5D61 CD 9C 61      [17] 3385 	call	_free
   5D64 F1            [10] 3386 	pop	af
                           3387 ;src/main.c:424: free(e);
   5D65 C1            [10] 3388 	pop	bc
   5D66 E1            [10] 3389 	pop	hl
   5D67 E5            [11] 3390 	push	hl
   5D68 C5            [11] 3391 	push	bc
   5D69 E5            [11] 3392 	push	hl
   5D6A CD 9C 61      [17] 3393 	call	_free
                           3394 ;src/main.c:425: return;
   5D6D DD F9         [10] 3395 	ld	sp,ix
   5D6F DD E1         [14] 3396 	pop	ix
   5D71 C9            [10] 3397 	ret
                           3398 ;src/main.c:433: void credits(){
                           3399 ;	---------------------------------
                           3400 ; Function credits
                           3401 ; ---------------------------------
   5D72                    3402 _credits::
                           3403 ;src/main.c:435: cpct_clearScreen(0);
   5D72 21 00 40      [10] 3404 	ld	hl,#0x4000
   5D75 E5            [11] 3405 	push	hl
   5D76 AF            [ 4] 3406 	xor	a, a
   5D77 F5            [11] 3407 	push	af
   5D78 33            [ 6] 3408 	inc	sp
   5D79 26 C0         [ 7] 3409 	ld	h, #0xC0
   5D7B E5            [11] 3410 	push	hl
   5D7C CD 35 66      [17] 3411 	call	_cpct_memset
                           3412 ;src/main.c:436: memptr = cpct_getScreenPtr(VMEM,10,10);
   5D7F 21 0A 0A      [10] 3413 	ld	hl,#0x0A0A
   5D82 E5            [11] 3414 	push	hl
   5D83 21 00 C0      [10] 3415 	ld	hl,#0xC000
   5D86 E5            [11] 3416 	push	hl
   5D87 CD 28 67      [17] 3417 	call	_cpct_getScreenPtr
                           3418 ;src/main.c:437: cpct_drawStringM0("Lounge Gladiator",memptr,1,0);  
   5D8A EB            [ 4] 3419 	ex	de,hl
   5D8B 01 AA 5D      [10] 3420 	ld	bc,#___str_6+0
   5D8E 21 01 00      [10] 3421 	ld	hl,#0x0001
   5D91 E5            [11] 3422 	push	hl
   5D92 D5            [11] 3423 	push	de
   5D93 C5            [11] 3424 	push	bc
   5D94 CD 11 63      [17] 3425 	call	_cpct_drawStringM0
   5D97 21 06 00      [10] 3426 	ld	hl,#6
   5D9A 39            [11] 3427 	add	hl,sp
   5D9B F9            [ 6] 3428 	ld	sp,hl
                           3429 ;src/main.c:439: while (1){
   5D9C                    3430 00104$:
                           3431 ;src/main.c:441: cpct_scanKeyboard_f();
   5D9C CD 30 62      [17] 3432 	call	_cpct_scanKeyboard_f
                           3433 ;src/main.c:445: if(cpct_isKeyPressed(Key_Esc)) {
   5D9F 21 08 04      [10] 3434 	ld	hl,#0x0408
   5DA2 CD 24 62      [17] 3435 	call	_cpct_isKeyPressed
   5DA5 7D            [ 4] 3436 	ld	a,l
   5DA6 B7            [ 4] 3437 	or	a, a
   5DA7 28 F3         [12] 3438 	jr	Z,00104$
                           3439 ;src/main.c:447: return;
   5DA9 C9            [10] 3440 	ret
   5DAA                    3441 ___str_6:
   5DAA 4C 6F 75 6E 67 65  3442 	.ascii "Lounge Gladiator"
        20 47 6C 61 64 69
        61 74 6F 72
   5DBA 00                 3443 	.db 0x00
                           3444 ;src/main.c:454: void main(void) {
                           3445 ;	---------------------------------
                           3446 ; Function main
                           3447 ; ---------------------------------
   5DBB                    3448 _main::
                           3449 ;src/main.c:456: init();
   5DBB CD 84 47      [17] 3450 	call	_init
                           3451 ;src/main.c:459: while(1){
   5DBE                    3452 00106$:
                           3453 ;src/main.c:460: x=menu();
   5DBE CD 6D 4B      [17] 3454 	call	_menu
   5DC1 5D            [ 4] 3455 	ld	e, l
   5DC2 54            [ 4] 3456 	ld	d, h
                           3457 ;src/main.c:461: switch(x){
   5DC3 CB 7A         [ 8] 3458 	bit	7, d
   5DC5 20 F7         [12] 3459 	jr	NZ,00106$
   5DC7 3E 02         [ 7] 3460 	ld	a,#0x02
   5DC9 BB            [ 4] 3461 	cp	a, e
   5DCA 3E 00         [ 7] 3462 	ld	a,#0x00
   5DCC 9A            [ 4] 3463 	sbc	a, d
   5DCD E2 D2 5D      [10] 3464 	jp	PO, 00122$
   5DD0 EE 80         [ 7] 3465 	xor	a, #0x80
   5DD2                    3466 00122$:
   5DD2 FA BE 5D      [10] 3467 	jp	M,00106$
   5DD5 16 00         [ 7] 3468 	ld	d,#0x00
   5DD7 21 DD 5D      [10] 3469 	ld	hl,#00123$
   5DDA 19            [11] 3470 	add	hl,de
   5DDB 19            [11] 3471 	add	hl,de
                           3472 ;src/main.c:462: case 0: return;break;
                           3473 ;src/main.c:463: case 1: game(); break;
   5DDC E9            [ 4] 3474 	jp	(hl)
   5DDD                    3475 00123$:
   5DDD 18 10         [12] 3476 	jr	00108$
   5DDF 18 04         [12] 3477 	jr	00102$
   5DE1 18 07         [12] 3478 	jr	00103$
   5DE3 18 0A         [12] 3479 	jr	00108$
   5DE5                    3480 00102$:
   5DE5 CD 31 5B      [17] 3481 	call	_game
   5DE8 18 D4         [12] 3482 	jr	00106$
                           3483 ;src/main.c:464: case 2: credits();break;
   5DEA                    3484 00103$:
   5DEA CD 72 5D      [17] 3485 	call	_credits
                           3486 ;src/main.c:465: }
   5DED 18 CF         [12] 3487 	jr	00106$
   5DEF                    3488 00108$:
   5DEF C9            [10] 3489 	ret
                           3490 	.area _CODE
                           3491 	.area _INITIALIZER
                           3492 	.area _CABS (ABS)
