SECTION "rom0", ROM0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Restart and interrupt vectors:                                               ;
; https://gbdev.gg8.se/wiki/articles/Memory_Map#Jump_Vectors_in_first_ROM_bank ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jp $020c                          ;$0000        ;rst $00 handler        
nop                               ;$0003
nop                               ;$0004
nop                               ;$0005
nop                               ;$0006
nop                               ;$0007
;---------------------------------------
jp $020c                          ;$0008        ;rst $08 handler  
rst $38                           ;$000b
rst $38                           ;$000c
rst $38                           ;$000d
rst $38                           ;$000e
rst $38                           ;$000f
;---------------------------------------
rst $38                           ;$0010        ;rst $10 handler 
rst $38                           ;$0011
rst $38                           ;$0012
rst $38                           ;$0013
rst $38                           ;$0014
rst $38                           ;$0015
rst $38                           ;$0016
rst $38                           ;$0017
;---------------------------------------
rst $38                           ;$0018        ;rst $18 handler 
rst $38                           ;$0019
rst $38                           ;$001a
rst $38                           ;$001b
rst $38                           ;$001c
rst $38                           ;$001d
rst $38                           ;$001e
rst $38                           ;$001f
;---------------------------------------
rst $38                           ;$0020        ;rst $20 handler 
rst $38                           ;$0021
rst $38                           ;$0022
rst $38                           ;$0023
rst $38                           ;$0024
rst $38                           ;$0025
rst $38                           ;$0026
rst $38                           ;$0027
;---------------------------------------
add a                             ;$0028        ;rst $28 handler 
pop hl                            ;$0029
ld e, a                           ;$002a
ld d, $00                         ;$002b
add hl, de                        ;$002d
ld e, [hl]                        ;$002e
inc hl                            ;$002f
;---------------------------------------
ld d, [hl]                        ;$0030        ;rst $30 handler 
push de                           ;$0031
pop hl                            ;$0032
jp hl                             ;$0033
rst $38                           ;$0034
rst $38                           ;$0035
rst $38                           ;$0036
rst $38                           ;$0037
;---------------------------------------
rst $38                           ;$0038        ;rst $38 handler 
rst $38                           ;$0039
rst $38                           ;$003a
rst $38                           ;$003b
rst $38                           ;$003c
rst $38                           ;$003d
rst $38                           ;$003e
rst $38                           ;$003f
;---------------------------------------
jp $017e                          ;$0040        ;vblank interrupt handler
rst $38                           ;$0043
rst $38                           ;$0044
rst $38                           ;$0045
rst $38                           ;$0046
rst $38                           ;$0047
;---------------------------------------
jp $26be                          ;$0048        ;LCDSTAT interrupt handler
rst $38                           ;$004b
rst $38                           ;$004c
rst $38                           ;$004d
rst $38                           ;$004e
rst $38                           ;$004f
;---------------------------------------
jp $26be                          ;$0050        ;timer interrupt handler
rst $38                           ;$0053
rst $38                           ;$0054
rst $38                           ;$0055
rst $38                           ;$0056
rst $38                           ;$0057
;---------------------------------------
jp $005b                          ;$0058        ;link cable interrupt handler
push af                           ;$005b
push hl                           ;$005c
push de                           ;$005d
push bc                           ;$005e
db $cd                            ;$005f
;---------------------------------------
ld l, e                           ;$0060        ;joypad interrupt handler
nop                               ;$0061
ld a, $01                         ;$0062
ldh [$ffcc], a                    ;$0064
pop bc                            ;$0066
pop de                            ;$0067
pop hl                            ;$0068
pop af                            ;$0069
reti                              ;$006a
;---------------------------------------
ldh a, [$ffcd]                    ;$006b
rst $28                           ;$006d
ld a, b                           ;$006e
nop                               ;$006f
sbc a                             ;$0070
nop                               ;$0071
and h                             ;$0072
nop                               ;$0073
cp d                              ;$0074
nop                               ;$0075
ld [$f027], a                     ;$0076
pop hl                            ;$0079
cp $07                            ;$007a
jr z, $0086                       ;$007c
cp $06                            ;$007e
ret z                             ;$0080
ld a, $06                         ;$0081
ldh [$ffe1], a                    ;$0083
ret                               ;$0085
;---------------------------------------
ldh a, [$ff01]                    ;$0086
cp $55                            ;$0088
jr nz, $0094                      ;$008a
ld a, $29                         ;$008c
ldh [$ffcb], a                    ;$008e
ld a, $01                         ;$0090
jr $009c                          ;$0092
cp $29                            ;$0094
ret nz                            ;$0096
ld a, $55                         ;$0097
ldh [$ffcb], a                    ;$0099
xor a                             ;$009b
ldh [$ff02], a                    ;$009c
ret                               ;$009e
;---------------------------------------
ldh a, [$ff01]                    ;$009f
ldh [$ffd0], a                    ;$00a1
ret                               ;$00a3
;---------------------------------------
ldh a, [$ff01]                    ;$00a4
ldh [$ffd0], a                    ;$00a6
ldh a, [$ffcb]                    ;$00a8
cp $29                            ;$00aa
ret z                             ;$00ac
ldh a, [$ffcf]                    ;$00ad
ldh [$ff01], a                    ;$00af
ld a, $ff                         ;$00b1
ldh [$ffcf], a                    ;$00b3
ld a, $80                         ;$00b5
ldh [$ff02], a                    ;$00b7
ret                               ;$00b9
;---------------------------------------
ldh a, [$ff01]                    ;$00ba
ldh [$ffd0], a                    ;$00bc
ldh a, [$ffcb]                    ;$00be
cp $29                            ;$00c0
ret z                             ;$00c2
ldh a, [$ffcf]                    ;$00c3
ldh [$ff01], a                    ;$00c5
ei                                ;$00c7
call $0a98                        ;$00c8
ld a, $80                         ;$00cb
ldh [$ff02], a                    ;$00cd
ret                               ;$00cf
;---------------------------------------
ldh a, [$ffcd]                    ;$00d0
cp $02                            ;$00d2
ret nz                            ;$00d4
xor a                             ;$00d5
ldh [$ff0f], a                    ;$00d6
ei                                ;$00d8
ret                               ;$00d9
;---------------------------------------
db $ff, $ff, $ff, $ff, $ff, $ff   ;$00da
db $ff, $ff, $ff, $ff, $ff, $ff   ;$00e0
db $ff, $ff, $ff, $ff, $ff, $ff   ;$00e6
db $ff, $ff, $ff, $ff, $ff, $ff   ;$00ec
db $ff, $ff, $ff, $ff, $ff, $ff   ;$00f2
db $ff, $ff, $ff, $ff, $ff, $ff   ;$00f8
db $ff, $ff                       ;$00fe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cartridge Header: https://gbdev.gg8.se/wiki/articles/The_Cartridge_Header    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
nop                               ;$0100        ;entry point        
jp $0150                          ;$0101        ;jump over header data to de-facto entry point
db $ce, $ed, $66, $66, $cc, $0d   ;$0104        ;begin Nintendo logo tile data
db $00, $0b, $03, $73, $00, $83   ;$010a        ;...
db $00, $0c, $00, $0d, $00, $08   ;$0110        ;...
db $11, $1f, $88, $89, $00, $0e   ;$0116        ;...
db $dc, $cc, $6e, $e6, $dd, $dd   ;$011c        ;...
db $d9, $99, $bb, $bb, $67, $63   ;$0122        ;...
db $6e, $0e, $ec, $cc, $dd, $dc   ;$0128        ;...
db $99, $9f, $bb, $b9, $33, $3e   ;$012e        ;end Nintendo logo tile data
db "TETRIS"                       ;$0134        ;title
db 0, 0, 0, 0, 0, 0, 0, 0, 0      ;$013a        ;title padding (15 chars)
db $00                            ;$0143
db $00                            ;$0144
db $00                            ;$0145
db $00                            ;$0146
db $00                            ;$0147
db $00                            ;$0148
db $00                            ;$0149
db $00                            ;$014a
db $01                            ;$014b
db $01                            ;$014c
db $0a                            ;$014d
db $16                            ;$014e
db $bf                            ;$014f
jp $020c                          ;$0150
call $29e3                        ;$0153
ldh a, [$ff41]                    ;$0156
and a, $03                        ;$0158
jr nz, $0156                      ;$015a
ld b, [hl]                        ;$015c
ldh a, [$ff41]                    ;$015d
and a, $03                        ;$015f
jr nz, $015d                      ;$0161
ld a, [hl]                        ;$0163
and b                             ;$0164
ret                               ;$0165
ld a, e                           ;$0166
add [hl]                          ;$0167
daa                               ;$0168
ldi [hl], a                       ;$0169
ld a, d                           ;$016a
adc [hl]                          ;$016b
daa                               ;$016c
ldi [hl], a                       ;$016d
ld a, $00                         ;$016e
adc [hl]                          ;$0170
daa                               ;$0171
ld [hl], a                        ;$0172
ld a, $01                         ;$0173
ldh [$ffe0], a                    ;$0175
ret nc                            ;$0177
ld a, $99                         ;$0178
ldd [hl], a                       ;$017a
ldd [hl], a                       ;$017b
ld [hl], a                        ;$017c
ret                               ;$017d
push af                           ;$017e
push bc                           ;$017f
push de                           ;$0180
push hl                           ;$0181
ldh a, [$ffce]                    ;$0182
and a                             ;$0184
jr z, $0199                       ;$0185
ldh a, [$ffcb]                    ;$0187
cp $29                            ;$0189
jr nz, $0199                      ;$018b
xor a                             ;$018d
ldh [$ffce], a                    ;$018e
ldh a, [$ffcf]                    ;$0190
ldh [$ff01], a                    ;$0192
ld hl, $ff02                      ;$0194
ld [hl], $81                      ;$0197
call $21e0                        ;$0199
call $23cc                        ;$019c
call $23b7                        ;$019f
call $239e                        ;$01a2
call $238c                        ;$01a5
call $237d                        ;$01a8
call $236e                        ;$01ab
call $235f                        ;$01ae
call $2350                        ;$01b1
call $2341                        ;$01b4
call $2332                        ;$01b7
call $2323                        ;$01ba
call $22f8                        ;$01bd
call $22e9                        ;$01c0
call $22da                        ;$01c3
call $22cb                        ;$01c6
call $22bc                        ;$01c9
call $22ad                        ;$01cc
call $229e                        ;$01cf
call $1ed7                        ;$01d2
call $ffb6                        ;$01d5
call $18ca                        ;$01d8
ld a, [$c0ce]                     ;$01db
and a                             ;$01de
jr z, $01fb                       ;$01df
ldh a, [$ff98]                    ;$01e1
cp $03                            ;$01e3
jr nz, $01fb                      ;$01e5
ld hl, $986d                      ;$01e7
call $243b                        ;$01ea
ld a, $01                         ;$01ed
ldh [$ffe0], a                    ;$01ef
ld hl, $9c6d                      ;$01f1
call $243b                        ;$01f4
xor a                             ;$01f7
ld [$c0ce], a                     ;$01f8
ld hl, $ffe2                      ;$01fb
inc [hl]                          ;$01fe
xor a                             ;$01ff
ldh [$ff43], a                    ;$0200
ldh [$ff42], a                    ;$0202
inc a                             ;$0204
ldh [$ff85], a                    ;$0205
pop hl                            ;$0207
pop de                            ;$0208
pop bc                            ;$0209
pop af                            ;$020a
reti                              ;$020b
xor a                             ;$020c
ld hl, $dfff                      ;$020d
ld c, $10                         ;$0210
ld b, $00                         ;$0212
ldd [hl], a                       ;$0214
dec b                             ;$0215
jr nz, $0214                      ;$0216
dec c                             ;$0218
jr nz, $0214                      ;$0219
ld a, $01                         ;$021b
di                                ;$021d
ldh [$ff0f], a                    ;$021e
ldh [$ffff], a                    ;$0220
xor a                             ;$0222
ldh [$ff42], a                    ;$0223
ldh [$ff43], a                    ;$0225
ldh [$ffa4], a                    ;$0227
ldh [$ff41], a                    ;$0229
ldh [$ff01], a                    ;$022b
ldh [$ff02], a                    ;$022d
ld a, $80                         ;$022f
ldh [$ff40], a                    ;$0231
ldh a, [$ff44]                    ;$0233
cp $94                            ;$0235
jr nz, $0233                      ;$0237
ld a, $03                         ;$0239
ldh [$ff40], a                    ;$023b
ld a, $e4                         ;$023d
ldh [$ff47], a                    ;$023f
ldh [$ff48], a                    ;$0241
ld a, $c4                         ;$0243
ldh [$ff49], a                    ;$0245
ld hl, $ff26                      ;$0247
ld a, $80                         ;$024a
ldd [hl], a                       ;$024c
ld a, $ff                         ;$024d
ldd [hl], a                       ;$024f
ld [hl], $77                      ;$0250
ld a, $01                         ;$0252
ld [$2000], a                     ;$0254
ld sp, $cfff                      ;$0257
xor a                             ;$025a
ld hl, $dfff                      ;$025b
ld b, $00                         ;$025e
ldd [hl], a                       ;$0260
dec b                             ;$0261
jr nz, $0260                      ;$0262
ld hl, $cfff                      ;$0264
ld c, $10                         ;$0267
ld b, $00                         ;$0269
ldd [hl], a                       ;$026b
dec b                             ;$026c
jr nz, $026b                      ;$026d
dec c                             ;$026f
jr nz, $026b                      ;$0270
ld hl, $9fff                      ;$0272
ld c, $20                         ;$0275
xor a                             ;$0277
ld b, $00                         ;$0278
ldd [hl], a                       ;$027a
dec b                             ;$027b
jr nz, $027a                      ;$027c
dec c                             ;$027e
jr nz, $027a                      ;$027f
ld hl, $feff                      ;$0281
ld b, $00                         ;$0284
ldd [hl], a                       ;$0286
dec b                             ;$0287
jr nz, $0286                      ;$0288
ld hl, $fffe                      ;$028a
ld b, $80                         ;$028d
ldd [hl], a                       ;$028f
dec b                             ;$0290
jr nz, $028f                      ;$0291
ld c, $b6                         ;$0293
ld b, $0c                         ;$0295
ld hl, $2a7f                      ;$0297
ldi a, [hl]                       ;$029a
ld [$ff00+c], a                   ;$029b
inc c                             ;$029c
dec b                             ;$029d
jr nz, $029a                      ;$029e
call $2795                        ;$02a0
call $7ff3                        ;$02a3
ld a, $09                         ;$02a6
ldh [$ffff], a                    ;$02a8
ld a, $37                         ;$02aa
ldh [$ffc0], a                    ;$02ac
ld a, $1c                         ;$02ae
ldh [$ffc1], a                    ;$02b0
ld a, $24                         ;$02b2
ldh [$ffe1], a                    ;$02b4
ld a, $80                         ;$02b6
ldh [$ff40], a                    ;$02b8
ei                                ;$02ba
xor a                             ;$02bb
ldh [$ff0f], a                    ;$02bc
ldh [$ff4a], a                    ;$02be
ldh [$ff4b], a                    ;$02c0
ldh [$ff06], a                    ;$02c2
call $29a6                        ;$02c4
call $02f8                        ;$02c7
call $7ff0                        ;$02ca
ldh a, [$ff80]                    ;$02cd
and a, $0f                        ;$02cf
cp $0f                            ;$02d1
jp z, $021b                       ;$02d3
ld hl, $ffa6                      ;$02d6
ld b, $02                         ;$02d9
ld a, [hl]                        ;$02db
and a                             ;$02dc
jr z, $02e0                       ;$02dd
dec [hl]                          ;$02df
inc l                             ;$02e0
dec b                             ;$02e1
jr nz, $02db                      ;$02e2
ldh a, [$ffc5]                    ;$02e4
and a                             ;$02e6
jr z, $02ed                       ;$02e7
ld a, $09                         ;$02e9
ldh [$ffff], a                    ;$02eb
ldh a, [$ff85]                    ;$02ed
and a                             ;$02ef
jr z, $02ed                       ;$02f0
xor a                             ;$02f2
ldh [$ff85], a                    ;$02f3
jp $02c4                          ;$02f5
ldh a, [$ffe1]                    ;$02f8
rst $28                           ;$02fa
adc a, $1b                        ;$02fb
ld [$ff00+c], a                   ;$02fd
inc e                             ;$02fe
ld b, h                           ;$02ff
ld [de], a                        ;$0300
ld a, e                           ;$0301
ld [de], a                        ;$0302
ld b, $1d                         ;$0303
ld h, $1d                         ;$0305
xor [hl]                          ;$0307
inc bc                            ;$0308
ld a, c                           ;$0309
inc b                             ;$030a
ld b, h                           ;$030b
inc d                             ;$030c
adc h                             ;$030d
inc d                             ;$030e
rlca                              ;$030f
ld a, [de]                        ;$0310
ret nz                            ;$0311
dec e                             ;$0312
ld d, $1f                         ;$0313
rra                               ;$0315
rra                               ;$0316
dec h                             ;$0317
dec d                             ;$0318
or b                              ;$0319
inc d                             ;$031a
ld a, e                           ;$031b
dec d                             ;$031c
cp a                              ;$031d
dec d                             ;$031e
add hl, hl                        ;$031f
ld d, $7a                         ;$0320
ld d, $eb                         ;$0322
ld d, $13                         ;$0324
add hl, de                        ;$0326
ld [hl], a                        ;$0327
ld b, $2c                         ;$0328
rlca                              ;$032a
dec h                             ;$032b
ld [$08e4], sp                    ;$032c
ld sp, $eb0b                      ;$032f
inc c                             ;$0332
jp nc, $320a                      ;$0333
dec c                             ;$0336
inc hl                            ;$0337
ld c, $12                         ;$0338
ld de, $0d99                      ;$033a
adc d                             ;$033d
ld c, $ce                         ;$033e
dec e                             ;$0340
ld b, c                           ;$0341
ld e, $69                         ;$0342
inc bc                            ;$0344
sub e                             ;$0345
inc bc                            ;$0346
ld h, a                           ;$0347
ld de, $11e6                      ;$0348
db $fc ;<unknown instruction>     ;$034b
ld de, $121c                      ;$034c
rst $00                           ;$034f
dec b                             ;$0350
rst $30                           ;$0351
dec b                             ;$0352
or e                              ;$0353
ld [de], a                        ;$0354
dec b                             ;$0355
inc de                            ;$0356
inc h                             ;$0357
inc de                            ;$0358
ld d, c                           ;$0359
inc de                            ;$035a
ld h, a                           ;$035b
inc de                            ;$035c
ld a, [hl]                        ;$035d
inc de                            ;$035e
or l                              ;$035f
inc de                            ;$0360
push hl                           ;$0361
inc de                            ;$0362
dec de                            ;$0363
inc de                            ;$0364
and b                             ;$0365
inc bc                            ;$0366
ld [$cd27], a                     ;$0367
jr nz, $0394                      ;$036a
call $27d7                        ;$036c
ld de, $4a07                      ;$036f
call $27eb                        ;$0372
call $178a                        ;$0375
ld hl, $c300                      ;$0378
ld de, $6450                      ;$037b
ld a, [de]                        ;$037e
ldi [hl], a                       ;$037f
inc de                            ;$0380
ld a, h                           ;$0381
cp $c4                            ;$0382
jr nz, $037e                      ;$0384
ld a, $d3                         ;$0386
ldh [$ff40], a                    ;$0388
ld a, $fa                         ;$038a
ldh [$ffa6], a                    ;$038c
ld a, $25                         ;$038e
ldh [$ffe1], a                    ;$0390
ret                               ;$0392
ldh a, [$ffa6]                    ;$0393
and a                             ;$0395
ret nz                            ;$0396
ld a, $fa                         ;$0397
ldh [$ffa6], a                    ;$0399
ld a, $35                         ;$039b
ldh [$ffe1], a                    ;$039d
ret                               ;$039f
ldh a, [$ff81]                    ;$03a0
and a                             ;$03a2
jr nz, $03a9                      ;$03a3
ldh a, [$ffa6]                    ;$03a5
and a                             ;$03a7
ret nz                            ;$03a8
ld a, $06                         ;$03a9
ldh [$ffe1], a                    ;$03ab
ret                               ;$03ad
call $2820                        ;$03ae
xor a                             ;$03b1
ldh [$ffe9], a                    ;$03b2
ldh [$ff98], a                    ;$03b4
ldh [$ff9c], a                    ;$03b6
ldh [$ff9b], a                    ;$03b8
ldh [$fffb], a                    ;$03ba
ldh [$ff9f], a                    ;$03bc
ldh [$ffe3], a                    ;$03be
ldh [$ffc7], a                    ;$03c0
call $2293                        ;$03c2
call $2651                        ;$03c5
call $27d7                        ;$03c8
ld hl, $c800                      ;$03cb
ld a, $2f                         ;$03ce
ldi [hl], a                       ;$03d0
ld a, h                           ;$03d1
cp $cc                            ;$03d2
jr nz, $03ce                      ;$03d4
ld hl, $c801                      ;$03d6
call $26a9                        ;$03d9
ld hl, $c80c                      ;$03dc
call $26a9                        ;$03df
ld hl, $ca41                      ;$03e2
ld b, $0c                         ;$03e5
ld a, $8e                         ;$03e7
ldi [hl], a                       ;$03e9
dec b                             ;$03ea
jr nz, $03e9                      ;$03eb
ld de, $4b6f                      ;$03ed
call $27eb                        ;$03f0
call $178a                        ;$03f3
ld hl, $c000                      ;$03f6
ld [hl], $80                      ;$03f9
inc l                             ;$03fb
ld [hl], $10                      ;$03fc
inc l                             ;$03fe
ld [hl], $58                      ;$03ff
ld a, $03                         ;$0401
ld [$dfe8], a                     ;$0403
ld a, $d3                         ;$0406
ldh [$ff40], a                    ;$0408
ld a, $07                         ;$040a
ldh [$ffe1], a                    ;$040c
ld a, $7d                         ;$040e
ldh [$ffa6], a                    ;$0410
ld a, $04                         ;$0412
ldh [$ffc6], a                    ;$0414
ldh a, [$ffe4]                    ;$0416
and a                             ;$0418
ret nz                            ;$0419
ld a, $13                         ;$041a
ldh [$ffc6], a                    ;$041c
ret                               ;$041e
ld a, $37                         ;$041f
ldh [$ffc0], a                    ;$0421
ld a, $09                         ;$0423
ldh [$ffc2], a                    ;$0425
xor a                             ;$0427
ldh [$ffc5], a                    ;$0428
ldh [$ffb0], a                    ;$042a
ldh [$ffed], a                    ;$042c
ldh [$ffea], a                    ;$042e
ld a, $62                         ;$0430
ldh [$ffeb], a                    ;$0432
ld a, $b0                         ;$0434
ldh [$ffec], a                    ;$0436
ldh a, [$ffe4]                    ;$0438
cp $02                            ;$043a
ld a, $02                         ;$043c
jr nz, $045a                      ;$043e
ld a, $77                         ;$0440
ldh [$ffc0], a                    ;$0442
ld a, $09                         ;$0444
ldh [$ffc3], a                    ;$0446
ld a, $02                         ;$0448
ldh [$ffc4], a                    ;$044a
ld a, $63                         ;$044c
ldh [$ffeb], a                    ;$044e
ld a, $b0                         ;$0450
ldh [$ffec], a                    ;$0452
ld a, $11                         ;$0454
ldh [$ffb0], a                    ;$0456
ld a, $01                         ;$0458
ldh [$ffe4], a                    ;$045a
ld a, $0a                         ;$045c
ldh [$ffe1], a                    ;$045e
call $2820                        ;$0460
call $27ad                        ;$0463
ld de, $4cd7                      ;$0466
call $27eb                        ;$0469
call $178a                        ;$046c
ld a, $d3                         ;$046f
ldh [$ff40], a                    ;$0471
ret                               ;$0473
ld a, $ff                         ;$0474
ldh [$ffe9], a                    ;$0476
ret                               ;$0478
ldh a, [$ffa6]                    ;$0479
and a                             ;$047b
jr nz, $0488                      ;$047c
ld hl, $ffc6                      ;$047e
dec [hl]                          ;$0481
jr z, $041f                       ;$0482
ld a, $7d                         ;$0484
ldh [$ffa6], a                    ;$0486
call $0a98                        ;$0488
ld a, $55                         ;$048b
ldh [$ff01], a                    ;$048d
ld a, $80                         ;$048f
ldh [$ff02], a                    ;$0491
ldh a, [$ffcc]                    ;$0493
and a                             ;$0495
jr z, $04a2                       ;$0496
ldh a, [$ffcb]                    ;$0498
and a                             ;$049a
jr nz, $04d7                      ;$049b
xor a                             ;$049d
ldh [$ffcc], a                    ;$049e
jr $0509                          ;$04a0
ldh a, [$ff81]                    ;$04a2
ld b, a                           ;$04a4
ldh a, [$ffc5]                    ;$04a5
bit 2, b                          ;$04a7
jr nz, $04f3                      ;$04a9
bit 4, b                          ;$04ab
jr nz, $0502                      ;$04ad
bit 5, b                          ;$04af
jr nz, $0507                      ;$04b1
bit 3, b                          ;$04b3
ret z                             ;$04b5
and a                             ;$04b6
ld a, $08                         ;$04b7
jr z, $04e7                       ;$04b9
ld a, b                           ;$04bb
cp $08                            ;$04bc
ret nz                            ;$04be
ldh a, [$ffcb]                    ;$04bf
cp $29                            ;$04c1
jr z, $04d7                       ;$04c3
ld a, $29                         ;$04c5
ldh [$ff01], a                    ;$04c7
ld a, $81                         ;$04c9
ldh [$ff02], a                    ;$04cb
ldh a, [$ffcc]                    ;$04cd
and a                             ;$04cf
jr z, $04cd                       ;$04d0
ldh a, [$ffcb]                    ;$04d2
and a                             ;$04d4
jr z, $0509                       ;$04d5
ld a, $2a                         ;$04d7
ldh [$ffe1], a                    ;$04d9
xor a                             ;$04db
ldh [$ffa6], a                    ;$04dc
ldh [$ffc2], a                    ;$04de
ldh [$ffc3], a                    ;$04e0
ldh [$ffc4], a                    ;$04e2
ldh [$ffe4], a                    ;$04e4
ret                               ;$04e6
push af                           ;$04e7
ldh a, [$ff80]                    ;$04e8
bit 7, a                          ;$04ea
jr z, $04f0                       ;$04ec
ldh [$fff4], a                    ;$04ee
pop af                            ;$04f0
jr $04d9                          ;$04f1
xor $01                           ;$04f3
ldh [$ffc5], a                    ;$04f5
and a                             ;$04f7
ld a, $10                         ;$04f8
jr z, $04fe                       ;$04fa
ld a, $60                         ;$04fc
ld [$c001], a                     ;$04fe
ret                               ;$0501
and a                             ;$0502
ret nz                            ;$0503
xor a                             ;$0504
jr $04f3                          ;$0505
and a                             ;$0507
ret z                             ;$0508
xor a                             ;$0509
jr $04f5                          ;$050a
ldh a, [$ffe4]                    ;$050c
and a                             ;$050e
ret z                             ;$050f
call $0a98                        ;$0510
xor a                             ;$0513
ldh [$ff01], a                    ;$0514
ld a, $80                         ;$0516
ldh [$ff02], a                    ;$0518
ldh a, [$ff81]                    ;$051a
bit 3, a                          ;$051c
jr z, $052d                       ;$051e
ld a, $33                         ;$0520
ldh [$ff01], a                    ;$0522
ld a, $81                         ;$0524
ldh [$ff02], a                    ;$0526
ld a, $06                         ;$0528
ldh [$ffe1], a                    ;$052a
ret                               ;$052c
ld hl, $ffb0                      ;$052d
ldh a, [$ffe4]                    ;$0530
cp $02                            ;$0532
ld b, $10                         ;$0534
jr z, $053a                       ;$0536
ld b, $1d                         ;$0538
ld a, [hl]                        ;$053a
cp b                              ;$053b
ret nz                            ;$053c
ld a, $06                         ;$053d
ldh [$ffe1], a                    ;$053f
ret                               ;$0541
ldh a, [$ffe4]                    ;$0542
and a                             ;$0544
ret z                             ;$0545
ldh a, [$ffe9]                    ;$0546
cp $ff                            ;$0548
ret z                             ;$054a
ldh a, [$ffea]                    ;$054b
and a                             ;$054d
jr z, $0555                       ;$054e
dec a                             ;$0550
ldh [$ffea], a                    ;$0551
jr $0571                          ;$0553
ldh a, [$ffeb]                    ;$0555
ld h, a                           ;$0557
ldh a, [$ffec]                    ;$0558
ld l, a                           ;$055a
ldi a, [hl]                       ;$055b
ld b, a                           ;$055c
ldh a, [$ffed]                    ;$055d
xor b                             ;$055f
and b                             ;$0560
ldh [$ff81], a                    ;$0561
ld a, b                           ;$0563
ldh [$ffed], a                    ;$0564
ldi a, [hl]                       ;$0566
ldh [$ffea], a                    ;$0567
ld a, h                           ;$0569
ldh [$ffeb], a                    ;$056a
ld a, l                           ;$056c
ldh [$ffec], a                    ;$056d
jr $0574                          ;$056f
xor a                             ;$0571
ldh [$ff81], a                    ;$0572
ldh a, [$ff80]                    ;$0574
ldh [$ffee], a                    ;$0576
ldh a, [$ffed]                    ;$0578
ldh [$ff80], a                    ;$057a
ret                               ;$057c
xor a                             ;$057d
ldh [$ffed], a                    ;$057e
jr $0571                          ;$0580
ret                               ;$0582
ldh a, [$ffe4]                    ;$0583
and a                             ;$0585
ret z                             ;$0586
ldh a, [$ffe9]                    ;$0587
cp $ff                            ;$0589
ret nz                            ;$058b
ldh a, [$ff80]                    ;$058c
ld b, a                           ;$058e
ldh a, [$ffed]                    ;$058f
cp b                              ;$0591
jr z, $05ad                       ;$0592
ldh a, [$ffeb]                    ;$0594
ld h, a                           ;$0596
ldh a, [$ffec]                    ;$0597
ld l, a                           ;$0599
ldh a, [$ffed]                    ;$059a
ldi [hl], a                       ;$059c
ldh a, [$ffea]                    ;$059d
ldi [hl], a                       ;$059f
ld a, h                           ;$05a0
ldh [$ffeb], a                    ;$05a1
ld a, l                           ;$05a3
ldh [$ffec], a                    ;$05a4
ld a, b                           ;$05a6
ldh [$ffed], a                    ;$05a7
xor a                             ;$05a9
ldh [$ffea], a                    ;$05aa
ret                               ;$05ac
ldh a, [$ffea]                    ;$05ad
inc a                             ;$05af
ldh [$ffea], a                    ;$05b0
ret                               ;$05b2
ldh a, [$ffe4]                    ;$05b3
and a                             ;$05b5
ret z                             ;$05b6
ldh a, [$ffe9]                    ;$05b7
and a                             ;$05b9
ret nz                            ;$05ba
ldh a, [$ffee]                    ;$05bb
ldh [$ff80], a                    ;$05bd
ret                               ;$05bf
ld hl, $ff02                      ;$05c0
set 7, [hl]                       ;$05c3
jr $05d1                          ;$05c5
ld a, $03                         ;$05c7
ldh [$ffcd], a                    ;$05c9
ldh a, [$ffcb]                    ;$05cb
cp $29                            ;$05cd
jr nz, $05c0                      ;$05cf
call $144f                        ;$05d1
ld a, $80                         ;$05d4
ld [$c210], a                     ;$05d6
call $2671                        ;$05d9
ldh [$ffce], a                    ;$05dc
xor a                             ;$05de
ldh [$ff01], a                    ;$05df
ldh [$ffcf], a                    ;$05e1
ldh [$ffdc], a                    ;$05e3
ldh [$ffd2], a                    ;$05e5
ldh [$ffd3], a                    ;$05e7
ldh [$ffd4], a                    ;$05e9
ldh [$ffd5], a                    ;$05eb
ldh [$ffe3], a                    ;$05ed
call $7ff3                        ;$05ef
ld a, $2b                         ;$05f2
ldh [$ffe1], a                    ;$05f4
ret                               ;$05f6
ldh a, [$ffcb]                    ;$05f7
cp $29                            ;$05f9
jr z, $0613                       ;$05fb
ldh a, [$fff0]                    ;$05fd
and a                             ;$05ff
jr z, $0620                       ;$0600
xor a                             ;$0602
ldh [$fff0], a                    ;$0603
ld de, $c201                      ;$0605
call $1492                        ;$0608
call $1517                        ;$060b
call $2671                        ;$060e
jr $0620                          ;$0611
ldh a, [$ff81]                    ;$0613
bit 0, a                          ;$0615
jr nz, $0620                      ;$0617
bit 3, a                          ;$0619
jr nz, $0620                      ;$061b
call $14b0                        ;$061d
ldh a, [$ffcb]                    ;$0620
cp $29                            ;$0622
jr z, $0644                       ;$0624
ldh a, [$ffcc]                    ;$0626
and a                             ;$0628
ret z                             ;$0629
xor a                             ;$062a
ldh [$ffcc], a                    ;$062b
ld a, $39                         ;$062d
ldh [$ffcf], a                    ;$062f
ldh a, [$ffd0]                    ;$0631
cp $50                            ;$0633
jr z, $0664                       ;$0635
ld b, a                           ;$0637
ldh a, [$ffc1]                    ;$0638
cp b                              ;$063a
ret z                             ;$063b
ld a, b                           ;$063c
ldh [$ffc1], a                    ;$063d
ld a, $01                         ;$063f
ldh [$fff0], a                    ;$0641
ret                               ;$0643
ldh a, [$ff81]                    ;$0644
bit 3, a                          ;$0646
jr nz, $066c                      ;$0648
bit 0, a                          ;$064a
jr nz, $066c                      ;$064c
ldh a, [$ffcc]                    ;$064e
and a                             ;$0650
ret z                             ;$0651
xor a                             ;$0652
ldh [$ffcc], a                    ;$0653
ldh a, [$ffcf]                    ;$0655
cp $50                            ;$0657
jr z, $0664                       ;$0659
ldh a, [$ffc1]                    ;$065b
ldh [$ffcf], a                    ;$065d
ld a, $01                         ;$065f
ldh [$ffce], a                    ;$0661
ret                               ;$0663
call $178a                        ;$0664
ld a, $16                         ;$0667
ldh [$ffe1], a                    ;$0669
ret                               ;$066b
ld a, $50                         ;$066c
jr $065d                          ;$066e
ld hl, $ff02                      ;$0670
set 7, [hl]                       ;$0673
jr $0696                          ;$0675
ld a, $03                         ;$0677
ldh [$ffcd], a                    ;$0679
ldh a, [$ffcb]                    ;$067b
cp $29                            ;$067d
jr nz, $0670                      ;$067f
call $0aa1                        ;$0681
call $0aa1                        ;$0684
call $0aa1                        ;$0687
ld b, $00                         ;$068a
ld hl, $c300                      ;$068c
call $0aa1                        ;$068f
ldi [hl], a                       ;$0692
dec b                             ;$0693
jr nz, $068f                      ;$0694
call $2820                        ;$0696
call $27ad                        ;$0699
ld de, $5214                      ;$069c
call $27eb                        ;$069f
call $178a                        ;$06a2
ld a, $2f                         ;$06a5
call $1fdd                        ;$06a7
ld a, $03                         ;$06aa
ldh [$ffce], a                    ;$06ac
xor a                             ;$06ae
ldh [$ff01], a                    ;$06af
ldh [$ffcf], a                    ;$06b1
ldh [$ffdc], a                    ;$06b3
ldh [$ffd2], a                    ;$06b5
ldh [$ffd3], a                    ;$06b7
ldh [$ffd4], a                    ;$06b9
ldh [$ffd5], a                    ;$06bb
ldh [$ffe3], a                    ;$06bd
ldh [$ffcc], a                    ;$06bf
ld hl, $c400                      ;$06c1
ld b, $0a                         ;$06c4
ld a, $28                         ;$06c6
ldi [hl], a                       ;$06c8
dec b                             ;$06c9
jr nz, $06c8                      ;$06ca
ldh a, [$ffd6]                    ;$06cc
and a                             ;$06ce
jp nz, $076d                      ;$06cf
call $1517                        ;$06d2
ld a, $d3                         ;$06d5
ldh [$ff40], a                    ;$06d7
ld hl, $c080                      ;$06d9
ld de, $0705                      ;$06dc
ld b, $20                         ;$06df
call $0725                        ;$06e1
ld hl, $c200                      ;$06e4
ld de, $26ed                      ;$06e7
ld c, $02                         ;$06ea
call $1776                        ;$06ec
call $080e                        ;$06ef
call $2671                        ;$06f2
xor a                             ;$06f5
ldh [$ffd7], a                    ;$06f6
ldh [$ffd8], a                    ;$06f8
ldh [$ffd9], a                    ;$06fa
ldh [$ffda], a                    ;$06fc
ldh [$ffdb], a                    ;$06fe
ld a, $17                         ;$0700
ldh [$ffe1], a                    ;$0702
ret                               ;$0704
ld b, b                           ;$0705
jr z, $06b6                       ;$0706
nop                               ;$0708
ld b, b                           ;$0709
jr nc, $06ba                      ;$070a
jr nz, $0756                      ;$070c
jr z, $06bf                       ;$070e
nop                               ;$0710
ld c, b                           ;$0711
jr nc, $06c3                      ;$0712
jr nz, $078e                      ;$0714
jr z, $06d8                       ;$0716
nop                               ;$0718
ld a, b                           ;$0719
jr nc, $06dc                      ;$071a
jr nz, $069e                      ;$071c
jr z, $06e1                       ;$071e
nop                               ;$0720
add b                             ;$0721
jr nc, $06e5                      ;$0722
jr nz, $0740                      ;$0724
ldi [hl], a                       ;$0726
inc de                            ;$0727
dec b                             ;$0728
jr nz, $0725                      ;$0729
ret                               ;$072b
ldh a, [$ffcb]                    ;$072c
cp $29                            ;$072e
jr z, $0755                       ;$0730
ldh a, [$ffcc]                    ;$0732
and a                             ;$0734
jr z, $074a                       ;$0735
ldh a, [$ffd0]                    ;$0737
cp $60                            ;$0739
jr z, $076a                       ;$073b
cp $06                            ;$073d
jr nc, $0743                      ;$073f
ldh [$ffac], a                    ;$0741
ldh a, [$ffad]                    ;$0743
ldh [$ffcf], a                    ;$0745
xor a                             ;$0747
ldh [$ffcc], a                    ;$0748
ld de, $c210                      ;$074a
call $1766                        ;$074d
ld hl, $ffad                      ;$0750
jr $07bd                          ;$0753
ldh a, [$ff81]                    ;$0755
bit 3, a                          ;$0757
jr z, $075f                       ;$0759
ld a, $60                         ;$075b
jr $07ac                          ;$075d
ldh a, [$ffcc]                    ;$075f
and a                             ;$0761
jr z, $07b4                       ;$0762
ldh a, [$ffcf]                    ;$0764
cp $60                            ;$0766
jr nz, $07a2                      ;$0768
call $178a                        ;$076a
ldh a, [$ffd6]                    ;$076d
and a                             ;$076f
jr nz, $078a                      ;$0770
ld a, $18                         ;$0772
ldh [$ffe1], a                    ;$0774
ldh a, [$ffcb]                    ;$0776
cp $29                            ;$0778
ret nz                            ;$077a
xor a                             ;$077b
ldh [$ffa0], a                    ;$077c
ld a, $06                         ;$077e
ld de, $ffe0                      ;$0780
ld hl, $c9a2                      ;$0783
call $1b68                        ;$0786
ret                               ;$0789
ldh a, [$ffcb]                    ;$078a
cp $29                            ;$078c
jp nz, $0828                      ;$078e
xor a                             ;$0791
ldh [$ffa0], a                    ;$0792
ld a, $06                         ;$0794
ld de, $ffe0                      ;$0796
ld hl, $c9a2                      ;$0799
call $1b68                        ;$079c
jp $0828                          ;$079f
ldh a, [$ffd0]                    ;$07a2
cp $06                            ;$07a4
jr nc, $07aa                      ;$07a6
ldh [$ffad], a                    ;$07a8
ldh a, [$ffac]                    ;$07aa
ldh [$ffcf], a                    ;$07ac
xor a                             ;$07ae
ldh [$ffcc], a                    ;$07af
inc a                             ;$07b1
ldh [$ffce], a                    ;$07b2
ld de, $c200                      ;$07b4
call $1766                        ;$07b7
ld hl, $ffac                      ;$07ba
ld a, [hl]                        ;$07bd
bit 4, b                          ;$07be
jr nz, $07d6                      ;$07c0
bit 5, b                          ;$07c2
jr nz, $07e8                      ;$07c4
bit 6, b                          ;$07c6
jr nz, $07ee                      ;$07c8
bit 7, b                          ;$07ca
jr z, $07e1                       ;$07cc
cp $03                            ;$07ce
jr nc, $07e1                      ;$07d0
add a, $03                        ;$07d2
jr $07db                          ;$07d4
cp $05                            ;$07d6
jr z, $07e1                       ;$07d8
inc a                             ;$07da
ld [hl], a                        ;$07db
ld a, $01                         ;$07dc
ld [$dfe0], a                     ;$07de
call $080e                        ;$07e1
call $2671                        ;$07e4
ret                               ;$07e7
and a                             ;$07e8
jr z, $07e1                       ;$07e9
dec a                             ;$07eb
jr $07db                          ;$07ec
cp $03                            ;$07ee
jr c, $07e1                       ;$07f0
sub a, $03                        ;$07f2
jr $07db                          ;$07f4
ld b, b                           ;$07f6
ld h, b                           ;$07f7
ld b, b                           ;$07f8
ld [hl], b                        ;$07f9
ld b, b                           ;$07fa
add b                             ;$07fb
ld d, b                           ;$07fc
ld h, b                           ;$07fd
ld d, b                           ;$07fe
ld [hl], b                        ;$07ff
ld d, b                           ;$0800
add b                             ;$0801
ld a, b                           ;$0802
ld h, b                           ;$0803
ld a, b                           ;$0804
ld [hl], b                        ;$0805
ld a, b                           ;$0806
add b                             ;$0807
adc b                             ;$0808
ld h, b                           ;$0809
adc b                             ;$080a
ld [hl], b                        ;$080b
adc b                             ;$080c
add b                             ;$080d
ldh a, [$ffac]                    ;$080e
ld de, $c201                      ;$0810
ld hl, $07f6                      ;$0813
call $1755                        ;$0816
ldh a, [$ffad]                    ;$0819
ld de, $c211                      ;$081b
ld hl, $0802                      ;$081e
call $1755                        ;$0821
ret                               ;$0824
call $2820                        ;$0825
xor a                             ;$0828
ld [$c210], a                     ;$0829
ldh [$ff98], a                    ;$082c
ldh [$ff9c], a                    ;$082e
ldh [$ff9b], a                    ;$0830
ldh [$fffb], a                    ;$0832
ldh [$ff9f], a                    ;$0834
ldh [$ffcc], a                    ;$0836
ldh [$ff01], a                    ;$0838
ldh [$ffce], a                    ;$083a
ldh [$ffd0], a                    ;$083c
ldh [$ffcf], a                    ;$083e
ldh [$ffd1], a                    ;$0840
call $2651                        ;$0842
call $2293                        ;$0845
call $1ff2                        ;$0848
xor a                             ;$084b
ldh [$ffe3], a                    ;$084c
call $178a                        ;$084e
ld de, $537c                      ;$0851
push de                           ;$0854
ld a, $01                         ;$0855
ldh [$ffa9], a                    ;$0857
ldh [$ffc5], a                    ;$0859
call $27eb                        ;$085b
pop de                            ;$085e
ld hl, $9c00                      ;$085f
call $27ee                        ;$0862
ld de, $2839                      ;$0865
ld hl, $9c63                      ;$0868
ld c, $0a                         ;$086b
call $1f7d                        ;$086d
ld hl, $c200                      ;$0870
ld de, $26bf                      ;$0873
call $26b6                        ;$0876
ld hl, $c210                      ;$0879
ld de, $26c7                      ;$087c
call $26b6                        ;$087f
ld hl, $9951                      ;$0882
ld a, $30                         ;$0885
ldh [$ff9e], a                    ;$0887
ld [hl], $00                      ;$0889
dec l                             ;$088b
ld [hl], $03                      ;$088c
call $1ae8                        ;$088e
xor a                             ;$0891
ldh [$ffa0], a                    ;$0892
ldh a, [$ffcb]                    ;$0894
cp $29                            ;$0896
ld de, $08d4                      ;$0898
ldh a, [$ffac]                    ;$089b
jr z, $08a4                       ;$089d
ld de, $08c4                      ;$089f
ldh a, [$ffad]                    ;$08a2
ld hl, $98b0                      ;$08a4
ld [hl], a                        ;$08a7
ld h, $9c                         ;$08a8
ld [hl], a                        ;$08aa
ld hl, $c080                      ;$08ab
ld b, $10                         ;$08ae
call $0725                        ;$08b0
ld a, $77                         ;$08b3
ldh [$ffc0], a                    ;$08b5
ld a, $d3                         ;$08b7
ldh [$ff40], a                    ;$08b9
ld a, $19                         ;$08bb
ldh [$ffe1], a                    ;$08bd
ld a, $01                         ;$08bf
ldh [$ffcd], a                    ;$08c1
ret                               ;$08c3
jr $084a                          ;$08c4
ret nz                            ;$08c6
nop                               ;$08c7
jr $0856                          ;$08c8
ret nz                            ;$08ca
jr nz, $08ed                      ;$08cb
add h                             ;$08cd
pop bc                            ;$08ce
nop                               ;$08cf
jr nz, $085e                      ;$08d0
pop bc                            ;$08d2
jr nz, $08ed                      ;$08d3
add h                             ;$08d5
xor [hl]                          ;$08d6
nop                               ;$08d7
jr $0866                          ;$08d8
xor [hl]                          ;$08da
jr nz, $08fd                      ;$08db
add h                             ;$08dd
xor a                             ;$08de
nop                               ;$08df
jr nz, $086e                      ;$08e0
xor a                             ;$08e2
jr nz, $0923                      ;$08e3
ld [$ffe0], sp                    ;$08e5
xor a                             ;$08e8
ldh [$ff0f], a                    ;$08e9
ldh a, [$ffcb]                    ;$08eb
cp $29                            ;$08ed
jp nz, $09f6                      ;$08ef
call $0a98                        ;$08f2
call $0a98                        ;$08f5
xor a                             ;$08f8
ldh [$ffcc], a                    ;$08f9
ld a, $29                         ;$08fb
ldh [$ff01], a                    ;$08fd
ld a, $81                         ;$08ff
ldh [$ff02], a                    ;$0901
ldh a, [$ffcc]                    ;$0903
and a                             ;$0905
jr z, $0903                       ;$0906
ldh a, [$ff01]                    ;$0908
cp $55                            ;$090a
jr nz, $08f2                      ;$090c
ld de, $0016                      ;$090e
ld c, $0a                         ;$0911
ld hl, $c902                      ;$0913
ld b, $0a                         ;$0916
xor a                             ;$0918
ldh [$ffcc], a                    ;$0919
call $0a98                        ;$091b
ldi a, [hl]                       ;$091e
ldh [$ff01], a                    ;$091f
ld a, $81                         ;$0921
ldh [$ff02], a                    ;$0923
ldh a, [$ffcc]                    ;$0925
and a                             ;$0927
jr z, $0925                       ;$0928
dec b                             ;$092a
jr nz, $0918                      ;$092b
add hl, de                        ;$092d
dec c                             ;$092e
jr nz, $0916                      ;$092f
ldh a, [$ffac]                    ;$0931
cp $05                            ;$0933
jr z, $0974                       ;$0935
ld hl, $ca22                      ;$0937
ld de, $0040                      ;$093a
add hl, de                        ;$093d
inc a                             ;$093e
cp $05                            ;$093f
jr nz, $093d                      ;$0941
ld de, $ca22                      ;$0943
ld c, $0a                         ;$0946
ld b, $0a                         ;$0948
ld a, [de]                        ;$094a
ldi [hl], a                       ;$094b
inc e                             ;$094c
dec b                             ;$094d
jr nz, $094a                      ;$094e
push de                           ;$0950
ld de, $ffd6                      ;$0951
add hl, de                        ;$0954
pop de                            ;$0955
push hl                           ;$0956
ld hl, $ffd6                      ;$0957
add hl, de                        ;$095a
push hl                           ;$095b
pop de                            ;$095c
pop hl                            ;$095d
dec c                             ;$095e
jr nz, $0948                      ;$095f
ld de, $ffd6                      ;$0961
ld b, $0a                         ;$0964
ld a, h                           ;$0966
cp $c8                            ;$0967
jr z, $0974                       ;$0969
ld a, $2f                         ;$096b
ldi [hl], a                       ;$096d
dec b                             ;$096e
jr nz, $096d                      ;$096f
add hl, de                        ;$0971
jr $0964                          ;$0972
call $0a98                        ;$0974
call $0a98                        ;$0977
xor a                             ;$097a
ldh [$ffcc], a                    ;$097b
ld a, $29                         ;$097d
ldh [$ff01], a                    ;$097f
ld a, $81                         ;$0981
ldh [$ff02], a                    ;$0983
ldh a, [$ffcc]                    ;$0985
and a                             ;$0987
jr z, $0985                       ;$0988
ldh a, [$ff01]                    ;$098a
cp $55                            ;$098c
jr nz, $0974                      ;$098e
ld hl, $c300                      ;$0990
ld b, $00                         ;$0993
xor a                             ;$0995
ldh [$ffcc], a                    ;$0996
ldi a, [hl]                       ;$0998
call $0a98                        ;$0999
ldh [$ff01], a                    ;$099c
ld a, $81                         ;$099e
ldh [$ff02], a                    ;$09a0
ldh a, [$ffcc]                    ;$09a2
and a                             ;$09a4
jr z, $09a2                       ;$09a5
inc b                             ;$09a7
jr nz, $0995                      ;$09a8
call $0a98                        ;$09aa
call $0a98                        ;$09ad
xor a                             ;$09b0
ldh [$ffcc], a                    ;$09b1
ld a, $30                         ;$09b3
ldh [$ff01], a                    ;$09b5
ld a, $81                         ;$09b7
ldh [$ff02], a                    ;$09b9
ldh a, [$ffcc]                    ;$09bb
and a                             ;$09bd
jr z, $09bb                       ;$09be
ldh a, [$ff01]                    ;$09c0
cp $56                            ;$09c2
jr nz, $09aa                      ;$09c4
call $0a8c                        ;$09c6
ld a, $09                         ;$09c9
ldh [$ffff], a                    ;$09cb
ld a, $1c                         ;$09cd
ldh [$ffe1], a                    ;$09cf
ld a, $02                         ;$09d1
ldh [$ffe3], a                    ;$09d3
ld a, $03                         ;$09d5
ldh [$ffcd], a                    ;$09d7
ldh a, [$ffcb]                    ;$09d9
cp $29                            ;$09db
jr z, $09e4                       ;$09dd
ld hl, $ff02                      ;$09df
set 7, [hl]                       ;$09e2
ld hl, $c300                      ;$09e4
ldi a, [hl]                       ;$09e7
ld [$c203], a                     ;$09e8
ldi a, [hl]                       ;$09eb
ld [$c213], a                     ;$09ec
ld a, h                           ;$09ef
ldh [$ffaf], a                    ;$09f0
ld a, l                           ;$09f2
ldh [$ffb0], a                    ;$09f3
ret                               ;$09f5
ldh a, [$ffad]                    ;$09f6
inc a                             ;$09f8
ld b, a                           ;$09f9
ld hl, $ca42                      ;$09fa
ld de, $ffc0                      ;$09fd
dec b                             ;$0a00
jr z, $0a06                       ;$0a01
add hl, de                        ;$0a03
jr $0a00                          ;$0a04
call $0a98                        ;$0a06
xor a                             ;$0a09
ldh [$ffcc], a                    ;$0a0a
ld a, $55                         ;$0a0c
ldh [$ff01], a                    ;$0a0e
ld a, $80                         ;$0a10
ldh [$ff02], a                    ;$0a12
ldh a, [$ffcc]                    ;$0a14
and a                             ;$0a16
jr z, $0a14                       ;$0a17
ldh a, [$ff01]                    ;$0a19
cp $29                            ;$0a1b
jr nz, $0a06                      ;$0a1d
ld de, $0016                      ;$0a1f
ld c, $0a                         ;$0a22
ld b, $0a                         ;$0a24
xor a                             ;$0a26
ldh [$ffcc], a                    ;$0a27
ldh [$ff01], a                    ;$0a29
ld a, $80                         ;$0a2b
ldh [$ff02], a                    ;$0a2d
ldh a, [$ffcc]                    ;$0a2f
and a                             ;$0a31
jr z, $0a2f                       ;$0a32
ldh a, [$ff01]                    ;$0a34
ldi [hl], a                       ;$0a36
dec b                             ;$0a37
jr nz, $0a26                      ;$0a38
add hl, de                        ;$0a3a
dec c                             ;$0a3b
jr nz, $0a24                      ;$0a3c
call $0a98                        ;$0a3e
xor a                             ;$0a41
ldh [$ffcc], a                    ;$0a42
ld a, $55                         ;$0a44
ldh [$ff01], a                    ;$0a46
ld a, $80                         ;$0a48
ldh [$ff02], a                    ;$0a4a
ldh a, [$ffcc]                    ;$0a4c
and a                             ;$0a4e
jr z, $0a4c                       ;$0a4f
ldh a, [$ff01]                    ;$0a51
cp $29                            ;$0a53
jr nz, $0a3e                      ;$0a55
ld b, $00                         ;$0a57
ld hl, $c300                      ;$0a59
xor a                             ;$0a5c
ldh [$ffcc], a                    ;$0a5d
ldh [$ff01], a                    ;$0a5f
ld a, $80                         ;$0a61
ldh [$ff02], a                    ;$0a63
ldh a, [$ffcc]                    ;$0a65
and a                             ;$0a67
jr z, $0a65                       ;$0a68
ldh a, [$ff01]                    ;$0a6a
ldi [hl], a                       ;$0a6c
inc b                             ;$0a6d
jr nz, $0a5c                      ;$0a6e
call $0a98                        ;$0a70
xor a                             ;$0a73
ldh [$ffcc], a                    ;$0a74
ld a, $56                         ;$0a76
ldh [$ff01], a                    ;$0a78
ld a, $80                         ;$0a7a
ldh [$ff02], a                    ;$0a7c
ldh a, [$ffcc]                    ;$0a7e
and a                             ;$0a80
jr z, $0a7e                       ;$0a81
ldh a, [$ff01]                    ;$0a83
cp $30                            ;$0a85
jr nz, $0a70                      ;$0a87
jp $09c6                          ;$0a89
ld hl, $ca42                      ;$0a8c
ld a, $80                         ;$0a8f
ld b, $0a                         ;$0a91
ldi [hl], a                       ;$0a93
dec b                             ;$0a94
jr nz, $0a93                      ;$0a95
ret                               ;$0a97
push bc                           ;$0a98
ld b, $fa                         ;$0a99
ld b, b                           ;$0a9b
dec b                             ;$0a9c
jr nz, $0a9b                      ;$0a9d
pop bc                            ;$0a9f
ret                               ;$0aa0
push hl                           ;$0aa1
push bc                           ;$0aa2
ldh a, [$fffc]                    ;$0aa3
and a, $fc                        ;$0aa5
ld c, a                           ;$0aa7
ld h, $03                         ;$0aa8
ldh a, [$ff04]                    ;$0aaa
ld b, a                           ;$0aac
xor a                             ;$0aad
dec b                             ;$0aae
jr z, $0abb                       ;$0aaf
inc a                             ;$0ab1
inc a                             ;$0ab2
inc a                             ;$0ab3
inc a                             ;$0ab4
cp $1c                            ;$0ab5
jr z, $0aad                       ;$0ab7
jr $0aae                          ;$0ab9
ld d, a                           ;$0abb
ldh a, [$ffae]                    ;$0abc
ld e, a                           ;$0abe
dec h                             ;$0abf
jr z, $0ac9                       ;$0ac0
or d                              ;$0ac2
or c                              ;$0ac3
and a, $fc                        ;$0ac4
cp c                              ;$0ac6
jr z, $0aaa                       ;$0ac7
ld a, d                           ;$0ac9
ldh [$ffae], a                    ;$0aca
ld a, e                           ;$0acc
ldh [$fffc], a                    ;$0acd
pop bc                            ;$0acf
pop hl                            ;$0ad0
ret                               ;$0ad1
ld a, $01                         ;$0ad2
ldh [$ffff], a                    ;$0ad4
ldh a, [$ffe3]                    ;$0ad6
and a                             ;$0ad8
jr nz, $0b02                      ;$0ad9
ld b, $44                         ;$0adb
ld c, $20                         ;$0add
call $113f                        ;$0adf
ld a, $02                         ;$0ae2
ldh [$ffcd], a                    ;$0ae4
ld a, [$c0de]                     ;$0ae6
and a                             ;$0ae9
jr z, $0af1                       ;$0aea
ld a, $80                         ;$0aec
ld [$c210], a                     ;$0aee
call $2683                        ;$0af1
call $2696                        ;$0af4
call $1517                        ;$0af7
xor a                             ;$0afa
ldh [$ffd6], a                    ;$0afb
ld a, $1a                         ;$0afd
ldh [$ffe1], a                    ;$0aff
ret                               ;$0b01
cp $05                            ;$0b02
ret nz                            ;$0b04
ld hl, $c030                      ;$0b05
ld b, $12                         ;$0b08
ld [hl], $f0                      ;$0b0a
inc hl                            ;$0b0c
ld [hl], $10                      ;$0b0d
inc hl                            ;$0b0f
ld [hl], $b6                      ;$0b10
inc hl                            ;$0b12
ld [hl], $80                      ;$0b13
inc hl                            ;$0b15
dec b                             ;$0b16
jr nz, $0b0a                      ;$0b17
ld a, [$c3ff]                     ;$0b19
ld b, $0a                         ;$0b1c
ld hl, $c400                      ;$0b1e
dec a                             ;$0b21
jr z, $0b2a                       ;$0b22
inc l                             ;$0b24
dec b                             ;$0b25
jr nz, $0b21                      ;$0b26
jr $0b1c                          ;$0b28
ld [hl], $2f                      ;$0b2a
ld a, $03                         ;$0b2c
ldh [$ffce], a                    ;$0b2e
ret                               ;$0b30
ld a, $01                         ;$0b31
ldh [$ffff], a                    ;$0b33
ld hl, $c09c                      ;$0b35
xor a                             ;$0b38
ldi [hl], a                       ;$0b39
ld [hl], $50                      ;$0b3a
inc l                             ;$0b3c
ld [hl], $27                      ;$0b3d
inc l                             ;$0b3f
ld [hl], $00                      ;$0b40
call $1c0d                        ;$0b42
call $1c88                        ;$0b45
call $24bb                        ;$0b48
call $209c                        ;$0b4b
call $213e                        ;$0b4e
call $25a1                        ;$0b51
call $224d                        ;$0b54
call $0b9b                        ;$0b57
ldh a, [$ffd5]                    ;$0b5a
and a                             ;$0b5c
jr z, $0b73                       ;$0b5d
ld a, $77                         ;$0b5f
ldh [$ffcf], a                    ;$0b61
ldh [$ffb1], a                    ;$0b63
ld a, $aa                         ;$0b65
ldh [$ffd1], a                    ;$0b67
ld a, $1b                         ;$0b69
ldh [$ffe1], a                    ;$0b6b
ld a, $05                         ;$0b6d
ldh [$ffa7], a                    ;$0b6f
jr $0b83                          ;$0b71
ldh a, [$ffe1]                    ;$0b73
cp $01                            ;$0b75
jr nz, $0b94                      ;$0b77
ld a, $aa                         ;$0b79
ldh [$ffcf], a                    ;$0b7b
ldh [$ffb1], a                    ;$0b7d
ld a, $77                         ;$0b7f
ldh [$ffd1], a                    ;$0b81
xor a                             ;$0b83
ldh [$ffdc], a                    ;$0b84
ldh [$ffd2], a                    ;$0b86
ldh [$ffd3], a                    ;$0b88
ldh [$ffd4], a                    ;$0b8a
ldh a, [$ffcb]                    ;$0b8c
cp $29                            ;$0b8e
jr nz, $0b94                      ;$0b90
ldh [$ffce], a                    ;$0b92
call $0bf0                        ;$0b94
call $0c8c                        ;$0b97
ret                               ;$0b9a
ld de, $0020                      ;$0b9b
ld hl, $c802                      ;$0b9e
ld a, $2f                         ;$0ba1
ld c, $12                         ;$0ba3
ld b, $0a                         ;$0ba5
push hl                           ;$0ba7
cp [hl]                           ;$0ba8
jr nz, $0bb5                      ;$0ba9
inc hl                            ;$0bab
dec b                             ;$0bac
jr nz, $0ba8                      ;$0bad
pop hl                            ;$0baf
add hl, de                        ;$0bb0
dec c                             ;$0bb1
jr nz, $0ba5                      ;$0bb2
push hl                           ;$0bb4
pop hl                            ;$0bb5
ld a, c                           ;$0bb6
ldh [$ffb1], a                    ;$0bb7
cp $0c                            ;$0bb9
ld a, [$dfe9]                     ;$0bbb
jr nc, $0bc7                      ;$0bbe
cp $08                            ;$0bc0
ret nz                            ;$0bc2
call $1517                        ;$0bc3
ret                               ;$0bc6
cp $08                            ;$0bc7
ret z                             ;$0bc9
ld a, [$dff0]                     ;$0bca
cp $02                            ;$0bcd
ret z                             ;$0bcf
ld a, $08                         ;$0bd0
ld [$dfe8], a                     ;$0bd2
ret                               ;$0bd5
ldh a, [$ffcb]                    ;$0bd6
cp $29                            ;$0bd8
jr z, $0c2e                       ;$0bda
ld a, $01                         ;$0bdc
ld [$df7f], a                     ;$0bde
ldh [$ffab], a                    ;$0be1
ldh a, [$ffcf]                    ;$0be3
ldh [$fff1], a                    ;$0be5
xor a                             ;$0be7
ldh [$fff2], a                    ;$0be8
ldh [$ffcf], a                    ;$0bea
call $1ccb                        ;$0bec
ret                               ;$0bef
ldh a, [$ffcc]                    ;$0bf0
and a                             ;$0bf2
ret z                             ;$0bf3
ld hl, $c030                      ;$0bf4
ld de, $0004                      ;$0bf7
xor a                             ;$0bfa
ldh [$ffcc], a                    ;$0bfb
ldh a, [$ffd0]                    ;$0bfd
cp $aa                            ;$0bff
jr z, $0c64                       ;$0c01
cp $77                            ;$0c03
jr z, $0c50                       ;$0c05
cp $94                            ;$0c07
jr z, $0bd6                       ;$0c09
ld b, a                           ;$0c0b
and a                             ;$0c0c
jr z, $0c60                       ;$0c0d
bit 7, a                          ;$0c0f
jr nz, $0c82                      ;$0c11
cp $13                            ;$0c13
jr nc, $0c2e                      ;$0c15
ld a, $12                         ;$0c17
sub b                             ;$0c19
ld c, a                           ;$0c1a
inc c                             ;$0c1b
ld a, $98                         ;$0c1c
ld [hl], a                        ;$0c1e
add hl, de                        ;$0c1f
sub a, $08                        ;$0c20
dec b                             ;$0c22
jr nz, $0c1e                      ;$0c23
ld a, $f0                         ;$0c25
dec c                             ;$0c27
jr z, $0c2e                       ;$0c28
ld [hl], a                        ;$0c2a
add hl, de                        ;$0c2b
jr $0c27                          ;$0c2c
ldh a, [$ffdc]                    ;$0c2e
and a                             ;$0c30
jr z, $0c3a                       ;$0c31
or $80                            ;$0c33
ldh [$ffb1], a                    ;$0c35
xor a                             ;$0c37
ldh [$ffdc], a                    ;$0c38
ld a, $ff                         ;$0c3a
ldh [$ffd0], a                    ;$0c3c
ldh a, [$ffcb]                    ;$0c3e
cp $29                            ;$0c40
ldh a, [$ffb1]                    ;$0c42
jr nz, $0c4d                      ;$0c44
ldh [$ffcf], a                    ;$0c46
ld a, $01                         ;$0c48
ldh [$ffce], a                    ;$0c4a
ret                               ;$0c4c
ldh [$ffcf], a                    ;$0c4d
ret                               ;$0c4f
ldh a, [$ffd1]                    ;$0c50
cp $aa                            ;$0c52
jr z, $0c7c                       ;$0c54
ld a, $77                         ;$0c56
ldh [$ffd1], a                    ;$0c58
ld a, $01                         ;$0c5a
ldh [$ffe1], a                    ;$0c5c
jr $0c2e                          ;$0c5e
ld c, $13                         ;$0c60
jr $0c25                          ;$0c62
ldh a, [$ffd1]                    ;$0c64
cp $77                            ;$0c66
jr z, $0c7c                       ;$0c68
ld a, $aa                         ;$0c6a
ldh [$ffd1], a                    ;$0c6c
ld a, $1b                         ;$0c6e
ldh [$ffe1], a                    ;$0c70
ld a, $05                         ;$0c72
ldh [$ffa7], a                    ;$0c74
ld c, $01                         ;$0c76
ld b, $12                         ;$0c78
jr $0c1c                          ;$0c7a
ld a, $01                         ;$0c7c
ldh [$ffef], a                    ;$0c7e
jr $0c2e                          ;$0c80
and a, $7f                        ;$0c82
cp $05                            ;$0c84
jr nc, $0c2e                      ;$0c86
ldh [$ffd2], a                    ;$0c88
jr $0c3a                          ;$0c8a
ldh a, [$ffd3]                    ;$0c8c
and a                             ;$0c8e
jr z, $0c98                       ;$0c8f
bit 7, a                          ;$0c91
ret z                             ;$0c93
and a, $07                        ;$0c94
jr $0ca2                          ;$0c96
ldh a, [$ffd2]                    ;$0c98
and a                             ;$0c9a
ret z                             ;$0c9b
ldh [$ffd3], a                    ;$0c9c
xor a                             ;$0c9e
ldh [$ffd2], a                    ;$0c9f
ret                               ;$0ca1
ld c, a                           ;$0ca2
push bc                           ;$0ca3
ld hl, $c822                      ;$0ca4
ld de, $ffe0                      ;$0ca7
add hl, de                        ;$0caa
dec c                             ;$0cab
jr nz, $0caa                      ;$0cac
ld de, $c822                      ;$0cae
ld c, $11                         ;$0cb1
ld b, $0a                         ;$0cb3
ld a, [de]                        ;$0cb5
ldi [hl], a                       ;$0cb6
inc e                             ;$0cb7
dec b                             ;$0cb8
jr nz, $0cb5                      ;$0cb9
push de                           ;$0cbb
ld de, $0016                      ;$0cbc
add hl, de                        ;$0cbf
pop de                            ;$0cc0
push hl                           ;$0cc1
ld hl, $0016                      ;$0cc2
add hl, de                        ;$0cc5
push hl                           ;$0cc6
pop de                            ;$0cc7
pop hl                            ;$0cc8
dec c                             ;$0cc9
jr nz, $0cb3                      ;$0cca
pop bc                            ;$0ccc
ld de, $c400                      ;$0ccd
ld b, $0a                         ;$0cd0
ld a, [de]                        ;$0cd2
ldi [hl], a                       ;$0cd3
inc de                            ;$0cd4
dec b                             ;$0cd5
jr nz, $0cd2                      ;$0cd6
push de                           ;$0cd8
ld de, $0016                      ;$0cd9
add hl, de                        ;$0cdc
pop de                            ;$0cdd
dec c                             ;$0cde
jr nz, $0ccd                      ;$0cdf
ld a, $02                         ;$0ce1
ldh [$ffe3], a                    ;$0ce3
ldh [$ffd4], a                    ;$0ce5
xor a                             ;$0ce7
ldh [$ffd3], a                    ;$0ce8
ret                               ;$0cea
ldh a, [$ffa6]                    ;$0ceb
and a                             ;$0ced
ret nz                            ;$0cee
ld a, $01                         ;$0cef
ldh [$ffff], a                    ;$0cf1
ld a, $03                         ;$0cf3
ldh [$ffcd], a                    ;$0cf5
ldh a, [$ffd1]                    ;$0cf7
cp $77                            ;$0cf9
jr nz, $0d09                      ;$0cfb
ldh a, [$ffd0]                    ;$0cfd
cp $aa                            ;$0cff
jr nz, $0d13                      ;$0d01
ld a, $01                         ;$0d03
ldh [$ffef], a                    ;$0d05
jr $0d13                          ;$0d07
cp $aa                            ;$0d09
jr nz, $0d13                      ;$0d0b
ldh a, [$ffd0]                    ;$0d0d
cp $77                            ;$0d0f
jr z, $0d03                       ;$0d11
ld b, $34                         ;$0d13
ld c, $43                         ;$0d15
call $113f                        ;$0d17
xor a                             ;$0d1a
ldh [$ffe3], a                    ;$0d1b
ldh a, [$ffd1]                    ;$0d1d
cp $aa                            ;$0d1f
ld a, $1e                         ;$0d21
jr nz, $0d27                      ;$0d23
ld a, $1d                         ;$0d25
ldh [$ffe1], a                    ;$0d27
ld a, $28                         ;$0d29
ldh [$ffa6], a                    ;$0d2b
ld a, $1d                         ;$0d2d
ldh [$ffc6], a                    ;$0d2f
ret                               ;$0d31
ldh a, [$ffa6]                    ;$0d32
and a                             ;$0d34
ret nz                            ;$0d35
ldh a, [$ffef]                    ;$0d36
and a                             ;$0d38
jr nz, $0d40                      ;$0d39
ldh a, [$ffd7]                    ;$0d3b
inc a                             ;$0d3d
ldh [$ffd7], a                    ;$0d3e
call $0f6f                        ;$0d40
ld de, $26f9                      ;$0d43
ldh a, [$ffcb]                    ;$0d46
cp $29                            ;$0d48
jr z, $0d4f                       ;$0d4a
ld de, $270b                      ;$0d4c
ld hl, $c200                      ;$0d4f
ld c, $03                         ;$0d52
call $1776                        ;$0d54
ld a, $19                         ;$0d57
ldh [$ffa6], a                    ;$0d59
ldh a, [$ffef]                    ;$0d5b
and a                             ;$0d5d
jr z, $0d65                       ;$0d5e
ld hl, $c220                      ;$0d60
ld [hl], $80                      ;$0d63
ld a, $03                         ;$0d65
call $2673                        ;$0d67
ld a, $20                         ;$0d6a
ldh [$ffe1], a                    ;$0d6c
ld a, $09                         ;$0d6e
ld [$dfe8], a                     ;$0d70
ldh a, [$ffd7]                    ;$0d73
cp $05                            ;$0d75
ret nz                            ;$0d77
ld a, $11                         ;$0d78
ld [$dfe8], a                     ;$0d7a
ret                               ;$0d7d
ldh a, [$ffd7]                    ;$0d7e
cp $05                            ;$0d80
jr nz, $0d8b                      ;$0d82
ldh a, [$ffc6]                    ;$0d84
and a                             ;$0d86
jr z, $0d91                       ;$0d87
jr $0dad                          ;$0d89
ldh a, [$ff81]                    ;$0d8b
bit 3, a                          ;$0d8d
jr z, $0dad                       ;$0d8f
ld a, $60                         ;$0d91
ldh [$ffcf], a                    ;$0d93
ldh [$ffce], a                    ;$0d95
jr $0db6                          ;$0d97
ld a, $01                         ;$0d99
ldh [$ffff], a                    ;$0d9b
ldh a, [$ffcc]                    ;$0d9d
jr z, $0dad                       ;$0d9f
ldh a, [$ffcb]                    ;$0da1
cp $29                            ;$0da3
jr z, $0d7e                       ;$0da5
ldh a, [$ffd0]                    ;$0da7
cp $60                            ;$0da9
jr z, $0db6                       ;$0dab
call $0dbd                        ;$0dad
ld a, $03                         ;$0db0
call $2673                        ;$0db2
ret                               ;$0db5
ld a, $1f                         ;$0db6
ldh [$ffe1], a                    ;$0db8
ldh [$ffcc], a                    ;$0dba
ret                               ;$0dbc
ldh a, [$ffa6]                    ;$0dbd
and a                             ;$0dbf
jr nz, $0de5                      ;$0dc0
ld hl, $ffc6                      ;$0dc2
dec [hl]                          ;$0dc5
ld a, $19                         ;$0dc6
ldh [$ffa6], a                    ;$0dc8
call $0f60                        ;$0dca
ld hl, $c201                      ;$0dcd
ld a, [hl]                        ;$0dd0
xor $30                           ;$0dd1
ldi [hl], a                       ;$0dd3
cp $60                            ;$0dd4
call z, $0f17                     ;$0dd6
inc l                             ;$0dd9
push af                           ;$0dda
ld a, [hl]                        ;$0ddb
xor $01                           ;$0ddc
ld [hl], a                        ;$0dde
ld l, $13                         ;$0ddf
ldd [hl], a                       ;$0de1
pop af                            ;$0de2
dec l                             ;$0de3
ld [hl], a                        ;$0de4
ldh a, [$ffd7]                    ;$0de5
cp $05                            ;$0de7
jr nz, $0e13                      ;$0de9
ldh a, [$ffc6]                    ;$0deb
ld hl, $c221                      ;$0ded
cp $06                            ;$0df0
jr z, $0e0f                       ;$0df2
cp $08                            ;$0df4
jr nc, $0e13                      ;$0df6
ld a, [hl]                        ;$0df8
cp $72                            ;$0df9
jr nc, $0e03                      ;$0dfb
cp $69                            ;$0dfd
ret z                             ;$0dff
inc [hl]                          ;$0e00
inc [hl]                          ;$0e01
ret                               ;$0e02
ld [hl], $69                      ;$0e03
inc l                             ;$0e05
inc l                             ;$0e06
ld [hl], $57                      ;$0e07
ld a, $06                         ;$0e09
ld [$dfe0], a                     ;$0e0b
ret                               ;$0e0e
dec l                             ;$0e0f
ld [hl], $80                      ;$0e10
ret                               ;$0e12
ldh a, [$ffa7]                    ;$0e13
and a                             ;$0e15
ret nz                            ;$0e16
ld a, $0f                         ;$0e17
ldh [$ffa7], a                    ;$0e19
ld hl, $c223                      ;$0e1b
ld a, [hl]                        ;$0e1e
xor $01                           ;$0e1f
ld [hl], a                        ;$0e21
ret                               ;$0e22
ldh a, [$ffa6]                    ;$0e23
and a                             ;$0e25
ret nz                            ;$0e26
ldh a, [$ffef]                    ;$0e27
and a                             ;$0e29
jr nz, $0e31                      ;$0e2a
ldh a, [$ffd8]                    ;$0e2c
inc a                             ;$0e2e
ldh [$ffd8], a                    ;$0e2f
call $0f6f                        ;$0e31
ld de, $271d                      ;$0e34
ldh a, [$ffcb]                    ;$0e37
cp $29                            ;$0e39
jr z, $0e40                       ;$0e3b
ld de, $2729                      ;$0e3d
ld hl, $c200                      ;$0e40
ld c, $02                         ;$0e43
call $1776                        ;$0e45
ld a, $19                         ;$0e48
ldh [$ffa6], a                    ;$0e4a
ldh a, [$ffef]                    ;$0e4c
and a                             ;$0e4e
jr z, $0e56                       ;$0e4f
ld hl, $c210                      ;$0e51
ld [hl], $80                      ;$0e54
ld a, $02                         ;$0e56
call $2673                        ;$0e58
ld a, $21                         ;$0e5b
ldh [$ffe1], a                    ;$0e5d
ld a, $09                         ;$0e5f
ld [$dfe8], a                     ;$0e61
ldh a, [$ffd8]                    ;$0e64
cp $05                            ;$0e66
ret nz                            ;$0e68
ld a, $11                         ;$0e69
ld [$dfe8], a                     ;$0e6b
ret                               ;$0e6e
ldh a, [$ffd8]                    ;$0e6f
cp $05                            ;$0e71
jr nz, $0e7c                      ;$0e73
ldh a, [$ffc6]                    ;$0e75
and a                             ;$0e77
jr z, $0e82                       ;$0e78
jr $0e9e                          ;$0e7a
ldh a, [$ff81]                    ;$0e7c
bit 3, a                          ;$0e7e
jr z, $0e9e                       ;$0e80
ld a, $60                         ;$0e82
ldh [$ffcf], a                    ;$0e84
ldh [$ffce], a                    ;$0e86
jr $0ea7                          ;$0e88
ld a, $01                         ;$0e8a
ldh [$ffff], a                    ;$0e8c
ldh a, [$ffcc]                    ;$0e8e
jr z, $0e9e                       ;$0e90
ldh a, [$ffcb]                    ;$0e92
cp $29                            ;$0e94
jr z, $0e6f                       ;$0e96
ldh a, [$ffd0]                    ;$0e98
cp $60                            ;$0e9a
jr z, $0ea7                       ;$0e9c
call $0eae                        ;$0e9e
ld a, $02                         ;$0ea1
call $2673                        ;$0ea3
ret                               ;$0ea6
ld a, $1f                         ;$0ea7
ldh [$ffe1], a                    ;$0ea9
ldh [$ffcc], a                    ;$0eab
ret                               ;$0ead
ldh a, [$ffa6]                    ;$0eae
and a                             ;$0eb0
jr nz, $0ecf                      ;$0eb1
ld hl, $ffc6                      ;$0eb3
dec [hl]                          ;$0eb6
ld a, $19                         ;$0eb7
ldh [$ffa6], a                    ;$0eb9
call $0f60                        ;$0ebb
ld hl, $c211                      ;$0ebe
ld a, [hl]                        ;$0ec1
xor $08                           ;$0ec2
ldi [hl], a                       ;$0ec4
cp $68                            ;$0ec5
call z, $0f17                     ;$0ec7
inc l                             ;$0eca
ld a, [hl]                        ;$0ecb
xor $01                           ;$0ecc
ld [hl], a                        ;$0ece
ldh a, [$ffd8]                    ;$0ecf
cp $05                            ;$0ed1
jr nz, $0f07                      ;$0ed3
ldh a, [$ffc6]                    ;$0ed5
ld hl, $c201                      ;$0ed7
cp $05                            ;$0eda
jr z, $0f03                       ;$0edc
cp $06                            ;$0ede
jr z, $0ef3                       ;$0ee0
cp $08                            ;$0ee2
jr nc, $0f07                      ;$0ee4
ld a, [hl]                        ;$0ee6
cp $72                            ;$0ee7
jr nc, $0f03                      ;$0ee9
cp $61                            ;$0eeb
ret z                             ;$0eed
inc [hl]                          ;$0eee
inc [hl]                          ;$0eef
inc [hl]                          ;$0ef0
inc [hl]                          ;$0ef1
ret                               ;$0ef2
dec l                             ;$0ef3
ld [hl], $00                      ;$0ef4
inc l                             ;$0ef6
ld [hl], $61                      ;$0ef7
inc l                             ;$0ef9
inc l                             ;$0efa
ld [hl], $56                      ;$0efb
ld a, $06                         ;$0efd
ld [$dfe0], a                     ;$0eff
ret                               ;$0f02
dec l                             ;$0f03
ld [hl], $80                      ;$0f04
ret                               ;$0f06
ldh a, [$ffa7]                    ;$0f07
and a                             ;$0f09
ret nz                            ;$0f0a
ld a, $0f                         ;$0f0b
ldh [$ffa7], a                    ;$0f0d
ld hl, $c203                      ;$0f0f
ld a, [hl]                        ;$0f12
xor $01                           ;$0f13
ld [hl], a                        ;$0f15
ret                               ;$0f16
push af                           ;$0f17
push hl                           ;$0f18
ldh a, [$ffd7]                    ;$0f19
cp $05                            ;$0f1b
jr z, $0f39                       ;$0f1d
ldh a, [$ffd8]                    ;$0f1f
cp $05                            ;$0f21
jr z, $0f39                       ;$0f23
ldh a, [$ffcb]                    ;$0f25
cp $29                            ;$0f27
jr nz, $0f39                      ;$0f29
ld hl, $c060                      ;$0f2b
ld b, $24                         ;$0f2e
ld de, $0f3c                      ;$0f30
ld a, [de]                        ;$0f33
ldi [hl], a                       ;$0f34
inc de                            ;$0f35
dec b                             ;$0f36
jr nz, $0f33                      ;$0f37
pop hl                            ;$0f39
pop af                            ;$0f3a
ret                               ;$0f3b
ld b, d                           ;$0f3c
jr nc, $0f4c                      ;$0f3d
nop                               ;$0f3f
ld b, d                           ;$0f40
jr c, $0ef5                       ;$0f41
nop                               ;$0f43
ld b, d                           ;$0f44
ld b, b                           ;$0f45
ld c, $00                         ;$0f46
ld b, d                           ;$0f48
ld c, b                           ;$0f49
inc e                             ;$0f4a
nop                               ;$0f4b
ld b, d                           ;$0f4c
ld e, b                           ;$0f4d
ld c, $00                         ;$0f4e
ld b, d                           ;$0f50
ld h, b                           ;$0f51
dec e                             ;$0f52
nop                               ;$0f53
ld b, d                           ;$0f54
ld l, b                           ;$0f55
or l                              ;$0f56
nop                               ;$0f57
ld b, d                           ;$0f58
ld [hl], b                        ;$0f59
cp e                              ;$0f5a
nop                               ;$0f5b
ld b, d                           ;$0f5c
ld a, b                           ;$0f5d
dec e                             ;$0f5e
nop                               ;$0f5f
ld hl, $c060                      ;$0f60
ld de, $0004                      ;$0f63
ld b, $09                         ;$0f66
xor a                             ;$0f68
ld [hl], a                        ;$0f69
add hl, de                        ;$0f6a
dec b                             ;$0f6b
jr nz, $0f69                      ;$0f6c
ret                               ;$0f6e
call $2820                        ;$0f6f
ld hl, $55ac                      ;$0f72
ld bc, $1000                      ;$0f75
call $27e4                        ;$0f78
call $2795                        ;$0f7b
ld hl, $9800                      ;$0f7e
ld de, $54e4                      ;$0f81
ld b, $04                         ;$0f84
call $27f0                        ;$0f86
ld hl, $9980                      ;$0f89
ld b, $06                         ;$0f8c
call $27f0                        ;$0f8e
ldh a, [$ffcb]                    ;$0f91
cp $29                            ;$0f93
jr nz, $0fb9                      ;$0f95
ld hl, $9841                      ;$0f97
ld [hl], $bd                      ;$0f9a
inc l                             ;$0f9c
ld [hl], $b2                      ;$0f9d
inc l                             ;$0f9f
ld [hl], $2e                      ;$0fa0
inc l                             ;$0fa2
ld [hl], $be                      ;$0fa3
inc l                             ;$0fa5
ld [hl], $2e                      ;$0fa6
ld hl, $9a01                      ;$0fa8
ld [hl], $b4                      ;$0fab
inc l                             ;$0fad
ld [hl], $b5                      ;$0fae
inc l                             ;$0fb0
ld [hl], $bb                      ;$0fb1
inc l                             ;$0fb3
ld [hl], $2e                      ;$0fb4
inc l                             ;$0fb6
ld [hl], $bc                      ;$0fb7
ldh a, [$ffef]                    ;$0fb9
and a                             ;$0fbb
jr nz, $0fc1                      ;$0fbc
call $1085                        ;$0fbe
ldh a, [$ffd7]                    ;$0fc1
and a                             ;$0fc3
jr z, $100f                       ;$0fc4
cp $05                            ;$0fc6
jr nz, $0fe0                      ;$0fc8
ld hl, $98a5                      ;$0fca
ld b, $0b                         ;$0fcd
ldh a, [$ffcb]                    ;$0fcf
cp $29                            ;$0fd1
ld de, $10f3                      ;$0fd3
jr z, $0fdb                       ;$0fd6
ld de, $10fe                      ;$0fd8
call $10d8                        ;$0fdb
ld a, $04                         ;$0fde
ld c, a                           ;$0fe0
ldh a, [$ffcb]                    ;$0fe1
cp $29                            ;$0fe3
ld a, $93                         ;$0fe5
jr nz, $0feb                      ;$0fe7
ld a, $8f                         ;$0fe9
ldh [$ffa0], a                    ;$0feb
ld hl, $99e7                      ;$0fed
call $106a                        ;$0ff0
ldh a, [$ffd9]                    ;$0ff3
and a                             ;$0ff5
jr z, $100f                       ;$0ff6
ld a, $ac                         ;$0ff8
ldh [$ffa0], a                    ;$0ffa
ld hl, $99f0                      ;$0ffc
ld c, $01                         ;$0fff
call $106a                        ;$1001
ld hl, $98a6                      ;$1004
ld de, $1109                      ;$1007
ld b, $09                         ;$100a
call $10d8                        ;$100c
ldh a, [$ffd8]                    ;$100f
and a                             ;$1011
jr z, $1052                       ;$1012
cp $05                            ;$1014
jr nz, $102e                      ;$1016
ld hl, $98a5                      ;$1018
ld b, $0b                         ;$101b
ldh a, [$ffcb]                    ;$101d
cp $29                            ;$101f
ld de, $10fe                      ;$1021
jr z, $1029                       ;$1024
ld de, $10f3                      ;$1026
call $10d8                        ;$1029
ld a, $04                         ;$102c
ld c, a                           ;$102e
ldh a, [$ffcb]                    ;$102f
cp $29                            ;$1031
ld a, $8f                         ;$1033
jr nz, $1039                      ;$1035
ld a, $93                         ;$1037
ldh [$ffa0], a                    ;$1039
ld hl, $9827                      ;$103b
call $106a                        ;$103e
ldh a, [$ffda]                    ;$1041
and a                             ;$1043
jr z, $1052                       ;$1044
ld a, $ac                         ;$1046
ldh [$ffa0], a                    ;$1048
ld hl, $9830                      ;$104a
ld c, $01                         ;$104d
call $106a                        ;$104f
ldh a, [$ffdb]                    ;$1052
and a                             ;$1054
jr z, $1062                       ;$1055
ld hl, $98a7                      ;$1057
ld de, $10ed                      ;$105a
ld b, $06                         ;$105d
call $10d8                        ;$105f
ld a, $d3                         ;$1062
ldh [$ff40], a                    ;$1064
call $178a                        ;$1066
ret                               ;$1069
ldh a, [$ffa0]                    ;$106a
push hl                           ;$106c
ld de, $0020                      ;$106d
ld b, $02                         ;$1070
push hl                           ;$1072
ldi [hl], a                       ;$1073
inc a                             ;$1074
ld [hl], a                        ;$1075
inc a                             ;$1076
pop hl                            ;$1077
add hl, de                        ;$1078
dec b                             ;$1079
jr nz, $1072                      ;$107a
pop hl                            ;$107c
ld de, $0003                      ;$107d
add hl, de                        ;$1080
dec c                             ;$1081
jr nz, $106a                      ;$1082
ret                               ;$1084
ld hl, $ffd7                      ;$1085
ld de, $ffd8                      ;$1088
ldh a, [$ffd9]                    ;$108b
and a                             ;$108d
jr nz, $10ca                      ;$108e
ldh a, [$ffda]                    ;$1090
and a                             ;$1092
jr nz, $10d1                      ;$1093
ldh a, [$ffdb]                    ;$1095
and a                             ;$1097
jr nz, $10bb                      ;$1098
ld a, [hl]                        ;$109a
cp $04                            ;$109b
jr z, $10b0                       ;$109d
ld a, [de]                        ;$109f
cp $04                            ;$10a0
ret nz                            ;$10a2
ld a, $05                         ;$10a3
ld [de], a                        ;$10a5
jr $10b2                          ;$10a6
ld a, [de]                        ;$10a8
cp $03                            ;$10a9
ret nz                            ;$10ab
ld a, $03                         ;$10ac
jr $10b5                          ;$10ae
ld [hl], $05                      ;$10b0
xor a                             ;$10b2
ldh [$ffdb], a                    ;$10b3
xor a                             ;$10b5
ldh [$ffd9], a                    ;$10b6
ldh [$ffda], a                    ;$10b8
ret                               ;$10ba
ld a, [hl]                        ;$10bb
cp $04                            ;$10bc
jr nz, $10c6                      ;$10be
ldh [$ffd9], a                    ;$10c0
xor a                             ;$10c2
ldh [$ffdb], a                    ;$10c3
ret                               ;$10c5
ldh [$ffda], a                    ;$10c6
jr $10c2                          ;$10c8
ld a, [hl]                        ;$10ca
cp $05                            ;$10cb
jr z, $10b0                       ;$10cd
jr $10ac                          ;$10cf
ld a, [de]                        ;$10d1
cp $05                            ;$10d2
jr z, $10a3                       ;$10d4
jr $10ac                          ;$10d6
push bc                           ;$10d8
push hl                           ;$10d9
ld a, [de]                        ;$10da
ldi [hl], a                       ;$10db
inc de                            ;$10dc
dec b                             ;$10dd
jr nz, $10da                      ;$10de
pop hl                            ;$10e0
ld de, $0020                      ;$10e1
add hl, de                        ;$10e4
pop bc                            ;$10e5
ld a, $b6                         ;$10e6
ldi [hl], a                       ;$10e8
dec b                             ;$10e9
jr nz, $10e8                      ;$10ea
ret                               ;$10ec
or b                              ;$10ed
or c                              ;$10ee
or d                              ;$10ef
or e                              ;$10f0
or c                              ;$10f1
ld a, $b4                         ;$10f2
or l                              ;$10f4
cp e                              ;$10f5
ld l, $bc                         ;$10f6
cpl                               ;$10f8
dec l                             ;$10f9
ld l, $3d                         ;$10fa
ld c, $3e                         ;$10fc
cp l                              ;$10fe
or d                              ;$10ff
ld l, $be                         ;$1100
ld l, $2f                         ;$1102
dec l                             ;$1104
ld l, $3d                         ;$1105
ld c, $3e                         ;$1107
or l                              ;$1109
or b                              ;$110a
ld b, c                           ;$110b
or l                              ;$110c
dec a                             ;$110d
dec e                             ;$110e
or l                              ;$110f
cp [hl]                           ;$1110
or c                              ;$1111
ld a, $01                         ;$1112
ldh [$ffff], a                    ;$1114
ldh a, [$ffa6]                    ;$1116
and a                             ;$1118
ret nz                            ;$1119
call $178a                        ;$111a
xor a                             ;$111d
ldh [$ffef], a                    ;$111e
ld b, $27                         ;$1120
ld c, $79                         ;$1122
call $113f                        ;$1124
call $7ff3                        ;$1127
ldh a, [$ffd7]                    ;$112a
cp $05                            ;$112c
jr z, $113a                       ;$112e
ldh a, [$ffd8]                    ;$1130
cp $05                            ;$1132
jr z, $113a                       ;$1134
ld a, $01                         ;$1136
ldh [$ffd6], a                    ;$1138
ld a, $16                         ;$113a
ldh [$ffe1], a                    ;$113c
ret                               ;$113e
ldh a, [$ffcc]                    ;$113f
and a                             ;$1141
jr z, $1158                       ;$1142
xor a                             ;$1144
ldh [$ffcc], a                    ;$1145
ldh a, [$ffcb]                    ;$1147
cp $29                            ;$1149
ldh a, [$ffd0]                    ;$114b
jr nz, $1160                      ;$114d
cp b                              ;$114f
jr z, $115a                       ;$1150
ld a, $02                         ;$1152
ldh [$ffcf], a                    ;$1154
ldh [$ffce], a                    ;$1156
pop hl                            ;$1158
ret                               ;$1159
ld a, c                           ;$115a
ldh [$ffcf], a                    ;$115b
ldh [$ffce], a                    ;$115d
ret                               ;$115f
cp c                              ;$1160
ret z                             ;$1161
ld a, b                           ;$1162
ldh [$ffcf], a                    ;$1163
pop hl                            ;$1165
ret                               ;$1166
call $11b2                        ;$1167
ld hl, $9ce6                      ;$116a
ld de, $141b                      ;$116d
ld b, $07                         ;$1170
call $1437                        ;$1172
ld hl, $9ce7                      ;$1175
ld de, $1422                      ;$1178
ld b, $07                         ;$117b
call $1437                        ;$117d
ld hl, $9d08                      ;$1180
ld [hl], $72                      ;$1183
inc l                             ;$1185
ld [hl], $c4                      ;$1186
ld hl, $9d28                      ;$1188
ld [hl], $b7                      ;$118b
inc l                             ;$118d
ld [hl], $b8                      ;$118e
ld de, $2771                      ;$1190
ld hl, $c200                      ;$1193
ld c, $03                         ;$1196
call $1776                        ;$1198
ld a, $03                         ;$119b
call $2673                        ;$119d
ld a, $db                         ;$11a0
ldh [$ff40], a                    ;$11a2
ld a, $bb                         ;$11a4
ldh [$ffa6], a                    ;$11a6
ld a, $27                         ;$11a8
ldh [$ffe1], a                    ;$11aa
ld a, $10                         ;$11ac
ld [$dfe8], a                     ;$11ae
ret                               ;$11b1
call $2820                        ;$11b2
ld hl, $55ac                      ;$11b5
ld bc, $1000                      ;$11b8
call $27e4                        ;$11bb
ld hl, $9fff                      ;$11be
call $2798                        ;$11c1
ld hl, $9dc0                      ;$11c4
ld de, $51c4                      ;$11c7
ld b, $04                         ;$11ca
call $27f0                        ;$11cc
ld hl, $9cec                      ;$11cf
ld de, $1429                      ;$11d2
ld b, $07                         ;$11d5
call $1437                        ;$11d7
ld hl, $9ced                      ;$11da
ld de, $1430                      ;$11dd
ld b, $07                         ;$11e0
call $1437                        ;$11e2
ret                               ;$11e5
ldh a, [$ffa6]                    ;$11e6
and a                             ;$11e8
ret nz                            ;$11e9
ld hl, $c210                      ;$11ea
ld [hl], $00                      ;$11ed
ld l, $20                         ;$11ef
ld [hl], $00                      ;$11f1
ld a, $ff                         ;$11f3
ldh [$ffa6], a                    ;$11f5
ld a, $28                         ;$11f7
ldh [$ffe1], a                    ;$11f9
ret                               ;$11fb
ldh a, [$ffa6]                    ;$11fc
and a                             ;$11fe
jr z, $1205                       ;$11ff
call $13fa                        ;$1201
ret                               ;$1204
ld a, $29                         ;$1205
ldh [$ffe1], a                    ;$1207
ld hl, $c213                      ;$1209
ld [hl], $35                      ;$120c
ld l, $23                         ;$120e
ld [hl], $35                      ;$1210
ld a, $ff                         ;$1212
ldh [$ffa6], a                    ;$1214
ld a, $2f                         ;$1216
call $1fd7                        ;$1218
ret                               ;$121b
ldh a, [$ffa6]                    ;$121c
and a                             ;$121e
jr z, $1225                       ;$121f
call $13fa                        ;$1221
ret                               ;$1224
ld a, $02                         ;$1225
ldh [$ffe1], a                    ;$1227
ld hl, $9d08                      ;$1229
ld b, $2f                         ;$122c
call $19ff                        ;$122e
ld hl, $9d09                      ;$1231
call $19ff                        ;$1234
ld hl, $9d28                      ;$1237
call $19ff                        ;$123a
ld hl, $9d29                      ;$123d
call $19ff                        ;$1240
ret                               ;$1243
ldh a, [$ffa6]                    ;$1244
and a                             ;$1246
jr nz, $1277                      ;$1247
ld a, $0a                         ;$1249
ldh [$ffa6], a                    ;$124b
ld hl, $c201                      ;$124d
dec [hl]                          ;$1250
ld a, [hl]                        ;$1251
cp $58                            ;$1252
jr nz, $1277                      ;$1254
ld hl, $c210                      ;$1256
ld [hl], $00                      ;$1259
inc l                             ;$125b
add a, $20                        ;$125c
ldi [hl], a                       ;$125e
ld [hl], $4c                      ;$125f
inc l                             ;$1261
ld [hl], $40                      ;$1262
ld l, $20                         ;$1264
ld [hl], $80                      ;$1266
ld a, $03                         ;$1268
call $2673                        ;$126a
ld a, $03                         ;$126d
ldh [$ffe1], a                    ;$126f
ld a, $04                         ;$1271
ld [$dff8], a                     ;$1273
ret                               ;$1276
call $13fa                        ;$1277
ret                               ;$127a
ldh a, [$ffa6]                    ;$127b
and a                             ;$127d
jr nz, $129d                      ;$127e
ld a, $0a                         ;$1280
ldh [$ffa6], a                    ;$1282
ld hl, $c211                      ;$1284
dec [hl]                          ;$1287
ld l, $01                         ;$1288
dec [hl]                          ;$128a
ld a, [hl]                        ;$128b
cp $d0                            ;$128c
jr nz, $129d                      ;$128e
ld a, $9c                         ;$1290
ldh [$ffc9], a                    ;$1292
ld a, $82                         ;$1294
ldh [$ffca], a                    ;$1296
ld a, $2c                         ;$1298
ldh [$ffe1], a                    ;$129a
ret                               ;$129c
ldh a, [$ffa7]                    ;$129d
and a                             ;$129f
jr nz, $12ad                      ;$12a0
ld a, $06                         ;$12a2
ldh [$ffa7], a                    ;$12a4
ld hl, $c213                      ;$12a6
ld a, [hl]                        ;$12a9
xor $01                           ;$12aa
ld [hl], a                        ;$12ac
ld a, $03                         ;$12ad
call $2673                        ;$12af
ret                               ;$12b2
ldh a, [$ffa6]                    ;$12b3
and a                             ;$12b5
ret nz                            ;$12b6
ld a, $06                         ;$12b7
ldh [$ffa6], a                    ;$12b9
ldh a, [$ffca]                    ;$12bb
sub a, $82                        ;$12bd
ld e, a                           ;$12bf
ld d, $00                         ;$12c0
ld hl, $12f5                      ;$12c2
add hl, de                        ;$12c5
push hl                           ;$12c6
pop de                            ;$12c7
ldh a, [$ffc9]                    ;$12c8
ld h, a                           ;$12ca
ldh a, [$ffca]                    ;$12cb
ld l, a                           ;$12cd
ld a, [de]                        ;$12ce
call $19fe                        ;$12cf
push hl                           ;$12d2
ld de, $0020                      ;$12d3
add hl, de                        ;$12d6
ld b, $b6                         ;$12d7
call $19ff                        ;$12d9
pop hl                            ;$12dc
inc hl                            ;$12dd
ld a, $02                         ;$12de
ld [$dfe0], a                     ;$12e0
ld a, h                           ;$12e3
ldh [$ffc9], a                    ;$12e4
ld a, l                           ;$12e6
ldh [$ffca], a                    ;$12e7
cp $92                            ;$12e9
ret nz                            ;$12eb
ld a, $ff                         ;$12ec
ldh [$ffa6], a                    ;$12ee
ld a, $2d                         ;$12f0
ldh [$ffe1], a                    ;$12f2
ret                               ;$12f4
or e                              ;$12f5
cp h                              ;$12f6
dec a                             ;$12f7
cp [hl]                           ;$12f8
cp e                              ;$12f9
or l                              ;$12fa
dec e                             ;$12fb
or d                              ;$12fc
cp l                              ;$12fd
or l                              ;$12fe
dec e                             ;$12ff
ld l, $bc                         ;$1300
dec a                             ;$1302
ld c, $3e                         ;$1303
ldh a, [$ffa6]                    ;$1305
and a                             ;$1307
ret nz                            ;$1308
call $2820                        ;$1309
call $27ad                        ;$130c
call $2293                        ;$130f
ld a, $93                         ;$1312
ldh [$ff40], a                    ;$1314
ld a, $05                         ;$1316
ldh [$ffe1], a                    ;$1318
ret                               ;$131a
ldh a, [$ffa6]                    ;$131b
and a                             ;$131d
ret nz                            ;$131e
ld a, $2e                         ;$131f
ldh [$ffe1], a                    ;$1321
ret                               ;$1323
call $11b2                        ;$1324
ld de, $2783                      ;$1327
ld hl, $c200                      ;$132a
ld c, $03                         ;$132d
call $1776                        ;$132f
ldh a, [$fff3]                    ;$1332
ld [$c203], a                     ;$1334
ld a, $03                         ;$1337
call $2673                        ;$1339
xor a                             ;$133c
ldh [$fff3], a                    ;$133d
ld a, $db                         ;$133f
ldh [$ff40], a                    ;$1341
ld a, $bb                         ;$1343
ldh [$ffa6], a                    ;$1345
ld a, $2f                         ;$1347
ldh [$ffe1], a                    ;$1349
ld a, $10                         ;$134b
ld [$dfe8], a                     ;$134d
ret                               ;$1350
ldh a, [$ffa6]                    ;$1351
and a                             ;$1353
ret nz                            ;$1354
ld hl, $c210                      ;$1355
ld [hl], $00                      ;$1358
ld l, $20                         ;$135a
ld [hl], $00                      ;$135c
ld a, $a0                         ;$135e
ldh [$ffa6], a                    ;$1360
ld a, $30                         ;$1362
ldh [$ffe1], a                    ;$1364
ret                               ;$1366
ldh a, [$ffa6]                    ;$1367
and a                             ;$1369
jr z, $1370                       ;$136a
call $13fa                        ;$136c
ret                               ;$136f
ld a, $31                         ;$1370
ldh [$ffe1], a                    ;$1372
ld a, $80                         ;$1374
ldh [$ffa6], a                    ;$1376
ld a, $2f                         ;$1378
call $1fd7                        ;$137a
ret                               ;$137d
ldh a, [$ffa6]                    ;$137e
and a                             ;$1380
jr nz, $13b1                      ;$1381
ld a, $0a                         ;$1383
ldh [$ffa6], a                    ;$1385
ld hl, $c201                      ;$1387
dec [hl]                          ;$138a
ld a, [hl]                        ;$138b
cp $6a                            ;$138c
jr nz, $13b1                      ;$138e
ld hl, $c210                      ;$1390
ld [hl], $00                      ;$1393
inc l                             ;$1395
add a, $10                        ;$1396
ldi [hl], a                       ;$1398
ld [hl], $54                      ;$1399
inc l                             ;$139b
ld [hl], $5c                      ;$139c
ld l, $20                         ;$139e
ld [hl], $80                      ;$13a0
ld a, $03                         ;$13a2
call $2673                        ;$13a4
ld a, $32                         ;$13a7
ldh [$ffe1], a                    ;$13a9
ld a, $04                         ;$13ab
ld [$dff8], a                     ;$13ad
ret                               ;$13b0
call $13fa                        ;$13b1
ret                               ;$13b4
ldh a, [$ffa6]                    ;$13b5
and a                             ;$13b7
jr nz, $13cf                      ;$13b8
ld a, $0a                         ;$13ba
ldh [$ffa6], a                    ;$13bc
ld hl, $c211                      ;$13be
dec [hl]                          ;$13c1
ld l, $01                         ;$13c2
dec [hl]                          ;$13c4
ld a, [hl]                        ;$13c5
cp $e0                            ;$13c6
jr nz, $13cf                      ;$13c8
ld a, $33                         ;$13ca
ldh [$ffe1], a                    ;$13cc
ret                               ;$13ce
ldh a, [$ffa7]                    ;$13cf
and a                             ;$13d1
jr nz, $13df                      ;$13d2
ld a, $06                         ;$13d4
ldh [$ffa7], a                    ;$13d6
ld hl, $c213                      ;$13d8
ld a, [hl]                        ;$13db
xor $01                           ;$13dc
ld [hl], a                        ;$13de
ld a, $03                         ;$13df
call $2673                        ;$13e1
ret                               ;$13e4
call $2820                        ;$13e5
call $27ad                        ;$13e8
call $7ff3                        ;$13eb
call $2293                        ;$13ee
ld a, $93                         ;$13f1
ldh [$ff40], a                    ;$13f3
ld a, $10                         ;$13f5
ldh [$ffe1], a                    ;$13f7
ret                               ;$13f9
ldh a, [$ffa7]                    ;$13fa
and a                             ;$13fc
ret nz                            ;$13fd
ld a, $0a                         ;$13fe
ldh [$ffa7], a                    ;$1400
ld a, $03                         ;$1402
ld [$dff8], a                     ;$1404
ld b, $02                         ;$1407
ld hl, $c210                      ;$1409
ld a, [hl]                        ;$140c
xor $80                           ;$140d
ld [hl], a                        ;$140f
ld l, $20                         ;$1410
dec b                             ;$1412
jr nz, $140c                      ;$1413
ld a, $03                         ;$1415
call $2673                        ;$1417
ret                               ;$141a
jp nz, $caca                      ;$141b
jp z, $caca                       ;$141e
jp z, $cbc3                       ;$1421
ld e, b                           ;$1424
ld c, b                           ;$1425
ld c, b                           ;$1426
ld c, b                           ;$1427
ld c, b                           ;$1428
ret z                             ;$1429
ld [hl], e                        ;$142a
ld [hl], e                        ;$142b
ld [hl], e                        ;$142c
ld [hl], e                        ;$142d
ld [hl], e                        ;$142e
ld [hl], e                        ;$142f
ret                               ;$1430
ld [hl], h                        ;$1431
ld [hl], h                        ;$1432
ld [hl], h                        ;$1433
ld [hl], h                        ;$1434
ld [hl], h                        ;$1435
ld [hl], h                        ;$1436
ld a, [de]                        ;$1437
ld [hl], a                        ;$1438
inc de                            ;$1439
push de                           ;$143a
ld de, $0020                      ;$143b
add hl, de                        ;$143e
pop de                            ;$143f
dec b                             ;$1440
jr nz, $1437                      ;$1441
ret                               ;$1443
ld a, $01                         ;$1444
ldh [$ffff], a                    ;$1446
xor a                             ;$1448
ldh [$ff01], a                    ;$1449
ldh [$ff02], a                    ;$144b
ldh [$ff0f], a                    ;$144d
call $2820                        ;$144f
call $27ad                        ;$1452
ld de, $4cd7                      ;$1455
call $27eb                        ;$1458
call $178a                        ;$145b
ld hl, $c200                      ;$145e
ld de, $26cf                      ;$1461
ld c, $02                         ;$1464
call $1776                        ;$1466
ld de, $c201                      ;$1469
call $148d                        ;$146c
ldh a, [$ffc0]                    ;$146f
ld e, $12                         ;$1471
ld [de], a                        ;$1473
inc de                            ;$1474
cp $37                            ;$1475
ld a, $1c                         ;$1477
jr z, $147d                       ;$1479
ld a, $1d                         ;$147b
ld [de], a                        ;$147d
call $2671                        ;$147e
call $1517                        ;$1481
ld a, $d3                         ;$1484
ldh [$ff40], a                    ;$1486
ld a, $0e                         ;$1488
ldh [$ffe1], a                    ;$148a
ret                               ;$148c
ld a, $01                         ;$148d
ld [$dfe0], a                     ;$148f
ldh a, [$ffc1]                    ;$1492
push af                           ;$1494
sub a, $1c                        ;$1495
add a                             ;$1497
ld c, a                           ;$1498
ld b, $00                         ;$1499
ld hl, $14a8                      ;$149b
add hl, bc                        ;$149e
ldi a, [hl]                       ;$149f
ld [de], a                        ;$14a0
inc de                            ;$14a1
ld a, [hl]                        ;$14a2
ld [de], a                        ;$14a3
inc de                            ;$14a4
pop af                            ;$14a5
ld [de], a                        ;$14a6
ret                               ;$14a7
ld [hl], b                        ;$14a8
scf                               ;$14a9
ld [hl], b                        ;$14aa
ld [hl], a                        ;$14ab
add b                             ;$14ac
scf                               ;$14ad
add b                             ;$14ae
ld [hl], a                        ;$14af
ld de, $c200                      ;$14b0
call $1766                        ;$14b3
ld hl, $ffc1                      ;$14b6
ld a, [hl]                        ;$14b9
bit 3, b                          ;$14ba
jp nz, $1563                      ;$14bc
bit 0, b                          ;$14bf
jp nz, $1563                      ;$14c1
bit 1, b                          ;$14c4
jr nz, $1509                      ;$14c6
inc e                             ;$14c8
bit 4, b                          ;$14c9
jr nz, $14f3                      ;$14cb
bit 5, b                          ;$14cd
jr nz, $14fe                      ;$14cf
bit 6, b                          ;$14d1
jr nz, $14eb                      ;$14d3
bit 7, b                          ;$14d5
jp z, $155f                       ;$14d7
cp $1e                            ;$14da
jr nc, $14e7                      ;$14dc
add a, $02                        ;$14de
ld [hl], a                        ;$14e0
call $148d                        ;$14e1
call $1517                        ;$14e4
call $2671                        ;$14e7
ret                               ;$14ea
cp $1e                            ;$14eb
jr c, $14e7                       ;$14ed
sub a, $02                        ;$14ef
jr $14e0                          ;$14f1
cp $1d                            ;$14f3
jr z, $14e7                       ;$14f5
cp $1f                            ;$14f7
jr z, $14e7                       ;$14f9
inc a                             ;$14fb
jr $14e0                          ;$14fc
cp $1c                            ;$14fe
jr z, $14e7                       ;$1500
cp $1e                            ;$1502
jr z, $14e7                       ;$1504
dec a                             ;$1506
jr $14e0                          ;$1507
push af                           ;$1509
ldh a, [$ffc5]                    ;$150a
and a                             ;$150c
jr z, $1512                       ;$150d
pop af                            ;$150f
jr $14c8                          ;$1510
pop af                            ;$1512
ld a, $0e                         ;$1513
jr $1572                          ;$1515
ldh a, [$ffc1]                    ;$1517
sub a, $17                        ;$1519
cp $08                            ;$151b
jr nz, $1521                      ;$151d
ld a, $ff                         ;$151f
ld [$dfe8], a                     ;$1521
ret                               ;$1524
ld de, $c210                      ;$1525
call $1766                        ;$1528
ld hl, $ffc0                      ;$152b
ld a, [hl]                        ;$152e
bit 3, b                          ;$152f
jr nz, $1563                      ;$1531
bit 0, b                          ;$1533
jr nz, $1577                      ;$1535
inc e                             ;$1537
inc e                             ;$1538
bit 4, b                          ;$1539
jr nz, $154b                      ;$153b
bit 5, b                          ;$153d
jr z, $155f                       ;$153f
cp $37                            ;$1541
jr z, $155f                       ;$1543
ld a, $37                         ;$1545
ld b, $1c                         ;$1547
jr $1553                          ;$1549
cp $77                            ;$154b
jr z, $155f                       ;$154d
ld a, $77                         ;$154f
ld b, $1d                         ;$1551
ld [hl], a                        ;$1553
push af                           ;$1554
ld a, $01                         ;$1555
ld [$dfe0], a                     ;$1557
pop af                            ;$155a
ld [de], a                        ;$155b
inc de                            ;$155c
ld a, b                           ;$155d
ld [de], a                        ;$155e
call $2671                        ;$155f
ret                               ;$1562
ld a, $02                         ;$1563
ld [$dfe0], a                     ;$1565
ldh a, [$ffc0]                    ;$1568
cp $37                            ;$156a
ld a, $10                         ;$156c
jr z, $1572                       ;$156e
ld a, $12                         ;$1570
ldh [$ffe1], a                    ;$1572
xor a                             ;$1574
jr $155e                          ;$1575
ld a, $0f                         ;$1577
jr $1572                          ;$1579
call $2820                        ;$157b
ld de, $4e3f                      ;$157e
call $27eb                        ;$1581
call $18fc                        ;$1584
call $178a                        ;$1587
ld hl, $c200                      ;$158a
ld de, $26db                      ;$158d
ld c, $01                         ;$1590
call $1776                        ;$1592
ld de, $c201                      ;$1595
ldh a, [$ffc2]                    ;$1598
ld hl, $1615                      ;$159a
call $174e                        ;$159d
call $2671                        ;$15a0
call $1795                        ;$15a3
call $18ca                        ;$15a6
ld a, $d3                         ;$15a9
ldh [$ff40], a                    ;$15ab
ld a, $11                         ;$15ad
ldh [$ffe1], a                    ;$15af
ldh a, [$ffc7]                    ;$15b1
and a                             ;$15b3
jr nz, $15ba                      ;$15b4
call $1517                        ;$15b6
ret                               ;$15b9
ld a, $15                         ;$15ba
ldh [$ffe1], a                    ;$15bc
ret                               ;$15be
ld de, $c200                      ;$15bf
call $1766                        ;$15c2
ld hl, $ffc2                      ;$15c5
ld a, $0a                         ;$15c8
bit 3, b                          ;$15ca
jr nz, $15bc                      ;$15cc
bit 0, b                          ;$15ce
jr nz, $15bc                      ;$15d0
ld a, $08                         ;$15d2
bit 1, b                          ;$15d4
jr nz, $15bc                      ;$15d6
ld a, [hl]                        ;$15d8
bit 4, b                          ;$15d9
jr nz, $15f1                      ;$15db
bit 5, b                          ;$15dd
jr nz, $1607                      ;$15df
bit 6, b                          ;$15e1
jr nz, $160d                      ;$15e3
bit 7, b                          ;$15e5
jr z, $1603                       ;$15e7
cp $05                            ;$15e9
jr nc, $1603                      ;$15eb
add a, $05                        ;$15ed
jr $15f6                          ;$15ef
cp $09                            ;$15f1
jr z, $1603                       ;$15f3
inc a                             ;$15f5
ld [hl], a                        ;$15f6
ld de, $c201                      ;$15f7
ld hl, $1615                      ;$15fa
call $174e                        ;$15fd
call $1795                        ;$1600
call $2671                        ;$1603
ret                               ;$1606
and a                             ;$1607
jr z, $1603                       ;$1608
dec a                             ;$160a
jr $15f6                          ;$160b
cp $05                            ;$160d
jr c, $1603                       ;$160f
sub a, $05                        ;$1611
jr $15f6                          ;$1613
ld b, b                           ;$1615
jr nc, $1658                      ;$1616
ld b, b                           ;$1618
ld b, b                           ;$1619
ld d, b                           ;$161a
ld b, b                           ;$161b
ld h, b                           ;$161c
ld b, b                           ;$161d
ld [hl], b                        ;$161e
ld d, b                           ;$161f
jr nc, $1672                      ;$1620
ld b, b                           ;$1622
ld d, b                           ;$1623
ld d, b                           ;$1624
ld d, b                           ;$1625
ld h, b                           ;$1626
ld d, b                           ;$1627
ld [hl], b                        ;$1628
call $2820                        ;$1629
ld de, $4fa7                      ;$162c
call $27eb                        ;$162f
call $178a                        ;$1632
ld hl, $c200                      ;$1635
ld de, $26e1                      ;$1638
ld c, $02                         ;$163b
call $1776                        ;$163d
ld de, $c201                      ;$1640
ldh a, [$ffc3]                    ;$1643
ld hl, $16d2                      ;$1645
call $174e                        ;$1648
ld de, $c211                      ;$164b
ldh a, [$ffc4]                    ;$164e
ld hl, $1741                      ;$1650
call $174e                        ;$1653
call $2671                        ;$1656
call $17af                        ;$1659
call $18ca                        ;$165c
ld a, $d3                         ;$165f
ldh [$ff40], a                    ;$1661
ld a, $13                         ;$1663
ldh [$ffe1], a                    ;$1665
ldh a, [$ffc7]                    ;$1667
and a                             ;$1669
jr nz, $1670                      ;$166a
call $1517                        ;$166c
ret                               ;$166f
ld a, $15                         ;$1670
ldh [$ffe1], a                    ;$1672
ret                               ;$1674
ldh [$ffe1], a                    ;$1675
xor a                             ;$1677
ld [de], a                        ;$1678
ret                               ;$1679
ld de, $c200                      ;$167a
call $1766                        ;$167d
ld hl, $ffc3                      ;$1680
ld a, $0a                         ;$1683
bit 3, b                          ;$1685
jr nz, $1675                      ;$1687
ld a, $14                         ;$1689
bit 0, b                          ;$168b
jr nz, $1675                      ;$168d
ld a, $08                         ;$168f
bit 1, b                          ;$1691
jr nz, $1675                      ;$1693
ld a, [hl]                        ;$1695
bit 4, b                          ;$1696
jr nz, $16ae                      ;$1698
bit 5, b                          ;$169a
jr nz, $16c4                      ;$169c
bit 6, b                          ;$169e
jr nz, $16ca                      ;$16a0
bit 7, b                          ;$16a2
jr z, $16c0                       ;$16a4
cp $05                            ;$16a6
jr nc, $16c0                      ;$16a8
add a, $05                        ;$16aa
jr $16b3                          ;$16ac
cp $09                            ;$16ae
jr z, $16c0                       ;$16b0
inc a                             ;$16b2
ld [hl], a                        ;$16b3
ld de, $c201                      ;$16b4
ld hl, $16d2                      ;$16b7
call $174e                        ;$16ba
call $17af                        ;$16bd
call $2671                        ;$16c0
ret                               ;$16c3
and a                             ;$16c4
jr z, $16c0                       ;$16c5
dec a                             ;$16c7
jr $16b3                          ;$16c8
cp $05                            ;$16ca
jr c, $16c0                       ;$16cc
sub a, $05                        ;$16ce
jr $16b3                          ;$16d0
ld b, b                           ;$16d2
jr $1715                          ;$16d3
jr z, $1717                       ;$16d5
jr c, $1719                       ;$16d7
ld c, b                           ;$16d9
ld b, b                           ;$16da
ld e, b                           ;$16db
ld d, b                           ;$16dc
jr $172f                          ;$16dd
jr z, $1731                       ;$16df
jr c, $1733                       ;$16e1
ld c, b                           ;$16e3
ld d, b                           ;$16e4
ld e, b                           ;$16e5
ldh [$ffe1], a                    ;$16e6
xor a                             ;$16e8
ld [de], a                        ;$16e9
ret                               ;$16ea
ld de, $c210                      ;$16eb
call $1766                        ;$16ee
ld hl, $ffc4                      ;$16f1
ld a, $0a                         ;$16f4
bit 3, b                          ;$16f6
jr nz, $16e6                      ;$16f8
bit 0, b                          ;$16fa
jr nz, $16e6                      ;$16fc
ld a, $13                         ;$16fe
bit 1, b                          ;$1700
jr nz, $16e6                      ;$1702
ld a, [hl]                        ;$1704
bit 4, b                          ;$1705
jr nz, $171d                      ;$1707
bit 5, b                          ;$1709
jr nz, $1733                      ;$170b
bit 6, b                          ;$170d
jr nz, $1739                      ;$170f
bit 7, b                          ;$1711
jr z, $172f                       ;$1713
cp $03                            ;$1715
jr nc, $172f                      ;$1717
add a, $03                        ;$1719
jr $1722                          ;$171b
cp $05                            ;$171d
jr z, $172f                       ;$171f
inc a                             ;$1721
ld [hl], a                        ;$1722
ld de, $c211                      ;$1723
ld hl, $1741                      ;$1726
call $174e                        ;$1729
call $17af                        ;$172c
call $2671                        ;$172f
ret                               ;$1732
and a                             ;$1733
jr z, $172f                       ;$1734
dec a                             ;$1736
jr $1722                          ;$1737
cp $03                            ;$1739
jr c, $172f                       ;$173b
sub a, $03                        ;$173d
jr $1722                          ;$173f
ld b, b                           ;$1741
ld [hl], b                        ;$1742
ld b, b                           ;$1743
add b                             ;$1744
ld b, b                           ;$1745
sub b                             ;$1746
ld d, b                           ;$1747
ld [hl], b                        ;$1748
ld d, b                           ;$1749
add b                             ;$174a
ld d, b                           ;$174b
sub b                             ;$174c
nop                               ;$174d
push af                           ;$174e
ld a, $01                         ;$174f
ld [$dfe0], a                     ;$1751
pop af                            ;$1754
push af                           ;$1755
add a                             ;$1756
ld c, a                           ;$1757
ld b, $00                         ;$1758
add hl, bc                        ;$175a
ldi a, [hl]                       ;$175b
ld [de], a                        ;$175c
inc de                            ;$175d
ld a, [hl]                        ;$175e
ld [de], a                        ;$175f
inc de                            ;$1760
pop af                            ;$1761
add a, $20                        ;$1762
ld [de], a                        ;$1764
ret                               ;$1765
ldh a, [$ff81]                    ;$1766
ld b, a                           ;$1768
ldh a, [$ffa6]                    ;$1769
and a                             ;$176b
ret nz                            ;$176c
ld a, $10                         ;$176d
ldh [$ffa6], a                    ;$176f
ld a, [de]                        ;$1771
xor $80                           ;$1772
ld [de], a                        ;$1774
ret                               ;$1775
push hl                           ;$1776
ld b, $06                         ;$1777
ld a, [de]                        ;$1779
ldi [hl], a                       ;$177a
inc de                            ;$177b
dec b                             ;$177c
jr nz, $1779                      ;$177d
pop hl                            ;$177f
ld a, $10                         ;$1780
add l                             ;$1782
ld l, a                           ;$1783
dec c                             ;$1784
jr nz, $1776                      ;$1785
ld [hl], $80                      ;$1787
ret                               ;$1789
xor a                             ;$178a
ld hl, $c000                      ;$178b
ld b, $a0                         ;$178e
ldi [hl], a                       ;$1790
dec b                             ;$1791
jr nz, $1790                      ;$1792
ret                               ;$1794
call $18fc                        ;$1795
ldh a, [$ffc2]                    ;$1798
ld hl, $d654                      ;$179a
ld de, $001b                      ;$179d
and a                             ;$17a0
jr z, $17a7                       ;$17a1
dec a                             ;$17a3
add hl, de                        ;$17a4
jr $17a0                          ;$17a5
inc hl                            ;$17a7
inc hl                            ;$17a8
push hl                           ;$17a9
pop de                            ;$17aa
call $1800                        ;$17ab
ret                               ;$17ae
call $18fc                        ;$17af
ldh a, [$ffc3]                    ;$17b2
ld hl, $d000                      ;$17b4
ld de, $00a2                      ;$17b7
and a                             ;$17ba
jr z, $17c1                       ;$17bb
dec a                             ;$17bd
add hl, de                        ;$17be
jr $17ba                          ;$17bf
ldh a, [$ffc4]                    ;$17c1
ld de, $001b                      ;$17c3
and a                             ;$17c6
jr z, $17cd                       ;$17c7
dec a                             ;$17c9
add hl, de                        ;$17ca
jr $17c6                          ;$17cb
inc hl                            ;$17cd
inc hl                            ;$17ce
push hl                           ;$17cf
pop de                            ;$17d0
call $1800                        ;$17d1
ret                               ;$17d4
ld b, $03                         ;$17d5
ld a, [hl]                        ;$17d7
and a, $f0                        ;$17d8
jr nz, $17e7                      ;$17da
inc e                             ;$17dc
ldd a, [hl]                       ;$17dd
and a, $0f                        ;$17de
jr nz, $17f1                      ;$17e0
inc e                             ;$17e2
dec b                             ;$17e3
jr nz, $17d7                      ;$17e4
ret                               ;$17e6
ld a, [hl]                        ;$17e7
and a, $f0                        ;$17e8
swap a                            ;$17ea
ld [de], a                        ;$17ec
inc e                             ;$17ed
ldd a, [hl]                       ;$17ee
and a, $0f                        ;$17ef
ld [de], a                        ;$17f1
inc e                             ;$17f2
dec b                             ;$17f3
jr nz, $17e7                      ;$17f4
ret                               ;$17f6
ld b, $03                         ;$17f7
ldd a, [hl]                       ;$17f9
ld [de], a                        ;$17fa
dec de                            ;$17fb
dec b                             ;$17fc
jr nz, $17f9                      ;$17fd
ret                               ;$17ff
ld a, d                           ;$1800
ldh [$fffb], a                    ;$1801
ld a, e                           ;$1803
ldh [$fffc], a                    ;$1804
ld c, $03                         ;$1806
ld hl, $c0a2                      ;$1808
push de                           ;$180b
ld b, $03                         ;$180c
ld a, [de]                        ;$180e
sub [hl]                          ;$180f
jr c, $1822                       ;$1810
jr nz, $1819                      ;$1812
dec l                             ;$1814
dec de                            ;$1815
dec b                             ;$1816
jr nz, $180e                      ;$1817
pop de                            ;$1819
inc de                            ;$181a
inc de                            ;$181b
inc de                            ;$181c
dec c                             ;$181d
jr nz, $1808                      ;$181e
jr $1880                          ;$1820
pop de                            ;$1822
ldh a, [$fffb]                    ;$1823
ld d, a                           ;$1825
ldh a, [$fffc]                    ;$1826
ld e, a                           ;$1828
push de                           ;$1829
push bc                           ;$182a
ld hl, $0006                      ;$182b
add hl, de                        ;$182e
push hl                           ;$182f
pop de                            ;$1830
dec hl                            ;$1831
dec hl                            ;$1832
dec hl                            ;$1833
dec c                             ;$1834
jr z, $183c                       ;$1835
call $17f7                        ;$1837
jr $1834                          ;$183a
ld hl, $c0a2                      ;$183c
ld b, $03                         ;$183f
ldd a, [hl]                       ;$1841
ld [de], a                        ;$1842
dec e                             ;$1843
dec b                             ;$1844
jr nz, $1841                      ;$1845
pop bc                            ;$1847
pop de                            ;$1848
ld a, c                           ;$1849
ldh [$ffc8], a                    ;$184a
ld hl, $0012                      ;$184c
add hl, de                        ;$184f
push hl                           ;$1850
ld de, $0006                      ;$1851
add hl, de                        ;$1854
push hl                           ;$1855
pop de                            ;$1856
pop hl                            ;$1857
dec c                             ;$1858
jr z, $1862                       ;$1859
ld b, $06                         ;$185b
call $17f9                        ;$185d
jr $1858                          ;$1860
ld a, $60                         ;$1862
ld b, $05                         ;$1864
ld [de], a                        ;$1866
dec de                            ;$1867
dec b                             ;$1868
jr nz, $1866                      ;$1869
ld a, $0a                         ;$186b
ld [de], a                        ;$186d
ld a, d                           ;$186e
ldh [$ffc9], a                    ;$186f
ld a, e                           ;$1871
ldh [$ffca], a                    ;$1872
xor a                             ;$1874
ldh [$ff9c], a                    ;$1875
ldh [$ffc6], a                    ;$1877
ld a, $01                         ;$1879
ld [$dfe8], a                     ;$187b
ldh [$ffc7], a                    ;$187e
ld de, $c9ac                      ;$1880
ldh a, [$fffb]                    ;$1883
ld h, a                           ;$1885
ldh a, [$fffc]                    ;$1886
ld l, a                           ;$1888
ld b, $03                         ;$1889
push hl                           ;$188b
push de                           ;$188c
push bc                           ;$188d
call $17d5                        ;$188e
pop bc                            ;$1891
pop de                            ;$1892
ld hl, $0020                      ;$1893
add hl, de                        ;$1896
push hl                           ;$1897
pop de                            ;$1898
pop hl                            ;$1899
push de                           ;$189a
ld de, $0003                      ;$189b
add hl, de                        ;$189e
pop de                            ;$189f
dec b                             ;$18a0
jr nz, $188b                      ;$18a1
dec hl                            ;$18a3
dec hl                            ;$18a4
ld b, $03                         ;$18a5
ld de, $c9a4                      ;$18a7
push de                           ;$18aa
ld c, $06                         ;$18ab
ldi a, [hl]                       ;$18ad
and a                             ;$18ae
jr z, $18b6                       ;$18af
ld [de], a                        ;$18b1
inc de                            ;$18b2
dec c                             ;$18b3
jr nz, $18ad                      ;$18b4
pop de                            ;$18b6
push hl                           ;$18b7
ld hl, $0020                      ;$18b8
add hl, de                        ;$18bb
push hl                           ;$18bc
pop de                            ;$18bd
pop hl                            ;$18be
dec b                             ;$18bf
jr nz, $18aa                      ;$18c0
call $2651                        ;$18c2
ld a, $01                         ;$18c5
ldh [$ffe8], a                    ;$18c7
ret                               ;$18c9
ldh a, [$ffe8]                    ;$18ca
and a                             ;$18cc
ret z                             ;$18cd
ld hl, $99a4                      ;$18ce
ld de, $c9a4                      ;$18d1
ld c, $06                         ;$18d4
push hl                           ;$18d6
ld b, $06                         ;$18d7
ld a, [de]                        ;$18d9
ldi [hl], a                       ;$18da
inc e                             ;$18db
dec b                             ;$18dc
jr nz, $18d9                      ;$18dd
inc e                             ;$18df
inc l                             ;$18e0
inc e                             ;$18e1
inc l                             ;$18e2
dec c                             ;$18e3
jr z, $18f7                       ;$18e4
bit 0, c                          ;$18e6
jr nz, $18d7                      ;$18e8
pop hl                            ;$18ea
ld de, $0020                      ;$18eb
add hl, de                        ;$18ee
push hl                           ;$18ef
pop de                            ;$18f0
ld a, $30                         ;$18f1
add d                             ;$18f3
ld d, a                           ;$18f4
jr $18d6                          ;$18f5
pop hl                            ;$18f7
xor a                             ;$18f8
ldh [$ffe8], a                    ;$18f9
ret                               ;$18fb
ld hl, $c9a4                      ;$18fc
ld de, $0020                      ;$18ff
ld a, $60                         ;$1902
ld c, $03                         ;$1904
ld b, $0e                         ;$1906
push hl                           ;$1908
ldi [hl], a                       ;$1909
dec b                             ;$190a
jr nz, $1909                      ;$190b
pop hl                            ;$190d
add hl, de                        ;$190e
dec c                             ;$190f
jr nz, $1906                      ;$1910
ret                               ;$1912
ldh a, [$ffc8]                    ;$1913
ld hl, $99e4                      ;$1915
ld de, $ffe0                      ;$1918
dec a                             ;$191b
jr z, $1921                       ;$191c
add hl, de                        ;$191e
jr $191b                          ;$191f
ldh a, [$ffc6]                    ;$1921
ld e, a                           ;$1923
ld d, $00                         ;$1924
add hl, de                        ;$1926
ldh a, [$ffc9]                    ;$1927
ld d, a                           ;$1929
ldh a, [$ffca]                    ;$192a
ld e, a                           ;$192c
ldh a, [$ffa6]                    ;$192d
and a                             ;$192f
jr nz, $1944                      ;$1930
ld a, $07                         ;$1932
ldh [$ffa6], a                    ;$1934
ldh a, [$ff9c]                    ;$1936
xor $01                           ;$1938
ldh [$ff9c], a                    ;$193a
ld a, [de]                        ;$193c
jr z, $1941                       ;$193d
ld a, $2f                         ;$193f
call $19fe                        ;$1941
ldh a, [$ff81]                    ;$1944
ld b, a                           ;$1946
ldh a, [$ff80]                    ;$1947
ld c, a                           ;$1949
ld a, $17                         ;$194a
bit 6, b                          ;$194c
jr nz, $1987                      ;$194e
bit 6, c                          ;$1950
jr nz, $197f                      ;$1952
bit 7, b                          ;$1954
jr nz, $19b0                      ;$1956
bit 7, c                          ;$1958
jr nz, $19a8                      ;$195a
bit 0, b                          ;$195c
jr nz, $19cc                      ;$195e
bit 1, b                          ;$1960
jp nz, $19ee                      ;$1962
bit 3, b                          ;$1965
ret z                             ;$1967
ld a, [de]                        ;$1968
call $19fe                        ;$1969
call $1517                        ;$196c
xor a                             ;$196f
ldh [$ffc7], a                    ;$1970
ldh a, [$ffc0]                    ;$1972
cp $37                            ;$1974
ld a, $11                         ;$1976
jr z, $197c                       ;$1978
ld a, $13                         ;$197a
ldh [$ffe1], a                    ;$197c
ret                               ;$197e
ldh a, [$ffaa]                    ;$197f
dec a                             ;$1981
ldh [$ffaa], a                    ;$1982
ret nz                            ;$1984
ld a, $09                         ;$1985
ldh [$ffaa], a                    ;$1987
ld b, $26                         ;$1989
ldh a, [$fff4]                    ;$198b
and a                             ;$198d
jr z, $1992                       ;$198e
ld b, $27                         ;$1990
ld a, [de]                        ;$1992
cp b                              ;$1993
jr nz, $19a0                      ;$1994
ld a, $2e                         ;$1996
inc a                             ;$1998
ld [de], a                        ;$1999
ld a, $01                         ;$199a
ld [$dfe0], a                     ;$199c
ret                               ;$199f
cp $2f                            ;$19a0
jr nz, $1998                      ;$19a2
ld a, $0a                         ;$19a4
jr $1999                          ;$19a6
ldh a, [$ffaa]                    ;$19a8
dec a                             ;$19aa
ldh [$ffaa], a                    ;$19ab
ret nz                            ;$19ad
ld a, $09                         ;$19ae
ldh [$ffaa], a                    ;$19b0
ld b, $26                         ;$19b2
ldh a, [$fff4]                    ;$19b4
and a                             ;$19b6
jr z, $19bb                       ;$19b7
ld b, $27                         ;$19b9
ld a, [de]                        ;$19bb
cp $0a                            ;$19bc
jr nz, $19c5                      ;$19be
ld a, $30                         ;$19c0
dec a                             ;$19c2
jr $1999                          ;$19c3
cp $2f                            ;$19c5
jr nz, $19c2                      ;$19c7
ld a, b                           ;$19c9
jr $1999                          ;$19ca
ld a, [de]                        ;$19cc
call $19fe                        ;$19cd
ld a, $02                         ;$19d0
ld [$dfe0], a                     ;$19d2
ldh a, [$ffc6]                    ;$19d5
inc a                             ;$19d7
cp $06                            ;$19d8
jr z, $1968                       ;$19da
ldh [$ffc6], a                    ;$19dc
inc de                            ;$19de
ld a, [de]                        ;$19df
cp $60                            ;$19e0
jr nz, $19e7                      ;$19e2
ld a, $0a                         ;$19e4
ld [de], a                        ;$19e6
ld a, d                           ;$19e7
ldh [$ffc9], a                    ;$19e8
ld a, e                           ;$19ea
ldh [$ffca], a                    ;$19eb
ret                               ;$19ed
ldh a, [$ffc6]                    ;$19ee
and a                             ;$19f0
ret z                             ;$19f1
ld a, [de]                        ;$19f2
call $19fe                        ;$19f3
ldh a, [$ffc6]                    ;$19f6
dec a                             ;$19f8
ldh [$ffc6], a                    ;$19f9
dec de                            ;$19fb
jr $19e7                          ;$19fc
ld b, a                           ;$19fe
ldh a, [$ff41]                    ;$19ff
and a, $03                        ;$1a01
jr nz, $19ff                      ;$1a03
ld [hl], b                        ;$1a05
ret                               ;$1a06
call $2820                        ;$1a07
xor a                             ;$1a0a
ld [$c210], a                     ;$1a0b
ldh [$ff98], a                    ;$1a0e
ldh [$ff9c], a                    ;$1a10
ldh [$ff9b], a                    ;$1a12
ldh [$fffb], a                    ;$1a14
ldh [$ff9f], a                    ;$1a16
ld a, $2f                         ;$1a18
call $1fd7                        ;$1a1a
call $1ff2                        ;$1a1d
call $2651                        ;$1a20
xor a                             ;$1a23
ldh [$ffe3], a                    ;$1a24
call $178a                        ;$1a26
ldh a, [$ffc0]                    ;$1a29
ld de, $3ff7                      ;$1a2b
ld hl, $ffc3                      ;$1a2e
cp $77                            ;$1a31
ld a, $50                         ;$1a33
jr z, $1a3f                       ;$1a35
ld a, $f1                         ;$1a37
ld hl, $ffc2                      ;$1a39
ld de, $3e8f                      ;$1a3c
push de                           ;$1a3f
ldh [$ffe6], a                    ;$1a40
ld a, [hl]                        ;$1a42
ldh [$ffa9], a                    ;$1a43
call $27eb                        ;$1a45
pop de                            ;$1a48
ld hl, $9c00                      ;$1a49
call $27ee                        ;$1a4c
ld de, $2839                      ;$1a4f
ld hl, $9c63                      ;$1a52
ld c, $0a                         ;$1a55
call $1f7d                        ;$1a57
ld h, $98                         ;$1a5a
ldh a, [$ffe6]                    ;$1a5c
ld l, a                           ;$1a5e
ldh a, [$ffa9]                    ;$1a5f
ld [hl], a                        ;$1a61
ld h, $9c                         ;$1a62
ld [hl], a                        ;$1a64
ldh a, [$fff4]                    ;$1a65
and a                             ;$1a67
jr z, $1a71                       ;$1a68
inc hl                            ;$1a6a
ld [hl], $27                      ;$1a6b
ld h, $98                         ;$1a6d
ld [hl], $27                      ;$1a6f
ld hl, $c200                      ;$1a71
ld de, $26bf                      ;$1a74
call $26b6                        ;$1a77
ld hl, $c210                      ;$1a7a
ld de, $26c7                      ;$1a7d
call $26b6                        ;$1a80
ld hl, $9951                      ;$1a83
ldh a, [$ffc0]                    ;$1a86
cp $77                            ;$1a88
ld a, $25                         ;$1a8a
jr z, $1a8f                       ;$1a8c
xor a                             ;$1a8e
ldh [$ff9e], a                    ;$1a8f
and a, $0f                        ;$1a91
ldd [hl], a                       ;$1a93
jr z, $1a98                       ;$1a94
ld [hl], $02                      ;$1a96
call $1ae8                        ;$1a98
ld a, [$c0de]                     ;$1a9b
and a                             ;$1a9e
jr z, $1aa6                       ;$1a9f
ld a, $80                         ;$1aa1
ld [$c210], a                     ;$1aa3
call $2007                        ;$1aa6
call $2007                        ;$1aa9
call $2007                        ;$1aac
call $2683                        ;$1aaf
xor a                             ;$1ab2
ldh [$ffa0], a                    ;$1ab3
ldh a, [$ffc0]                    ;$1ab5
cp $77                            ;$1ab7
jr nz, $1ae0                      ;$1ab9
ld a, $34                         ;$1abb
ldh [$ff99], a                    ;$1abd
ldh a, [$ffc4]                    ;$1abf
ld hl, $98b0                      ;$1ac1
ld [hl], a                        ;$1ac4
ld h, $9c                         ;$1ac5
ld [hl], a                        ;$1ac7
and a                             ;$1ac8
jr z, $1ae0                       ;$1ac9
ld b, a                           ;$1acb
ldh a, [$ffe4]                    ;$1acc
and a                             ;$1ace
jr z, $1ad6                       ;$1acf
call $1b1b                        ;$1ad1
jr $1ae0                          ;$1ad4
ld a, b                           ;$1ad6
ld de, $ffc0                      ;$1ad7
ld hl, $9a02                      ;$1ada
call $1b68                        ;$1add
ld a, $d3                         ;$1ae0
ldh [$ff40], a                    ;$1ae2
xor a                             ;$1ae4
ldh [$ffe1], a                    ;$1ae5
ret                               ;$1ae7
ldh a, [$ffa9]                    ;$1ae8
ld e, a                           ;$1aea
ldh a, [$fff4]                    ;$1aeb
and a                             ;$1aed
jr z, $1afa                       ;$1aee
ld a, $0a                         ;$1af0
add e                             ;$1af2
cp $15                            ;$1af3
jr c, $1af9                       ;$1af5
ld a, $14                         ;$1af7
ld e, a                           ;$1af9
ld hl, $1b06                      ;$1afa
ld d, $00                         ;$1afd
add hl, de                        ;$1aff
ld a, [hl]                        ;$1b00
ldh [$ff99], a                    ;$1b01
ldh [$ff9a], a                    ;$1b03
ret                               ;$1b05
inc [hl]                          ;$1b06
jr nc, $1b35                      ;$1b07
jr z, $1b2f                       ;$1b09
jr nz, $1b28                      ;$1b0b
dec d                             ;$1b0d
db $10 ;<corrupted stop>          ;$1b0e
ld a, [bc]                        ;$1b0f
add hl, bc                        ;$1b10
ld [$0607], sp                    ;$1b11
dec b                             ;$1b14
dec b                             ;$1b15
inc b                             ;$1b16
inc b                             ;$1b17
inc bc                            ;$1b18
inc bc                            ;$1b19
ld [bc], a                        ;$1b1a
ld hl, $99c2                      ;$1b1b
ld de, $1b40                      ;$1b1e
ld c, $04                         ;$1b21
ld b, $0a                         ;$1b23
push hl                           ;$1b25
ld a, [de]                        ;$1b26
ld [hl], a                        ;$1b27
push hl                           ;$1b28
ld a, h                           ;$1b29
add a, $30                        ;$1b2a
ld h, a                           ;$1b2c
ld a, [de]                        ;$1b2d
ld [hl], a                        ;$1b2e
pop hl                            ;$1b2f
inc l                             ;$1b30
inc de                            ;$1b31
dec b                             ;$1b32
jr nz, $1b26                      ;$1b33
pop hl                            ;$1b35
push de                           ;$1b36
ld de, $0020                      ;$1b37
add hl, de                        ;$1b3a
pop de                            ;$1b3b
dec c                             ;$1b3c
jr nz, $1b23                      ;$1b3d
ret                               ;$1b3f
add l                             ;$1b40
cpl                               ;$1b41
add d                             ;$1b42
add [hl]                          ;$1b43
add e                             ;$1b44
cpl                               ;$1b45
cpl                               ;$1b46
add b                             ;$1b47
add d                             ;$1b48
add l                             ;$1b49
cpl                               ;$1b4a
add d                             ;$1b4b
add h                             ;$1b4c
add d                             ;$1b4d
add e                             ;$1b4e
cpl                               ;$1b4f
add e                             ;$1b50
cpl                               ;$1b51
add a                             ;$1b52
cpl                               ;$1b53
cpl                               ;$1b54
add l                             ;$1b55
cpl                               ;$1b56
add e                             ;$1b57
cpl                               ;$1b58
add [hl]                          ;$1b59
add d                             ;$1b5a
add b                             ;$1b5b
add c                             ;$1b5c
cpl                               ;$1b5d
add e                             ;$1b5e
cpl                               ;$1b5f
add [hl]                          ;$1b60
add e                             ;$1b61
cpl                               ;$1b62
add l                             ;$1b63
cpl                               ;$1b64
add l                             ;$1b65
cpl                               ;$1b66
cpl                               ;$1b67
ld b, a                           ;$1b68
dec b                             ;$1b69
jr z, $1b6f                       ;$1b6a
add hl, de                        ;$1b6c
jr $1b69                          ;$1b6d
ldh a, [$ff04]                    ;$1b6f
ld b, a                           ;$1b71
ld a, $80                         ;$1b72
dec b                             ;$1b74
jr z, $1b7f                       ;$1b75
cp $80                            ;$1b77
jr nz, $1b72                      ;$1b79
ld a, $2f                         ;$1b7b
jr $1b74                          ;$1b7d
cp $2f                            ;$1b7f
jr z, $1b8b                       ;$1b81
ldh a, [$ff04]                    ;$1b83
and a, $07                        ;$1b85
or $80                            ;$1b87
jr $1b8d                          ;$1b89
ldh [$ffa0], a                    ;$1b8b
push af                           ;$1b8d
ld a, l                           ;$1b8e
and a, $0f                        ;$1b8f
cp $0b                            ;$1b91
jr nz, $1ba0                      ;$1b93
ldh a, [$ffa0]                    ;$1b95
cp $2f                            ;$1b97
jr z, $1ba0                       ;$1b99
pop af                            ;$1b9b
ld a, $2f                         ;$1b9c
jr $1ba1                          ;$1b9e
pop af                            ;$1ba0
ld [hl], a                        ;$1ba1
push hl                           ;$1ba2
push af                           ;$1ba3
ldh a, [$ffc5]                    ;$1ba4
and a                             ;$1ba6
jr nz, $1bad                      ;$1ba7
ld de, $3000                      ;$1ba9
add hl, de                        ;$1bac
pop af                            ;$1bad
ld [hl], a                        ;$1bae
pop hl                            ;$1baf
inc hl                            ;$1bb0
ld a, l                           ;$1bb1
and a, $0f                        ;$1bb2
cp $0c                            ;$1bb4
jr nz, $1b6f                      ;$1bb6
xor a                             ;$1bb8
ldh [$ffa0], a                    ;$1bb9
ld a, h                           ;$1bbb
and a, $0f                        ;$1bbc
cp $0a                            ;$1bbe
jr z, $1bc8                       ;$1bc0
ld de, $0016                      ;$1bc2
add hl, de                        ;$1bc5
jr $1b6f                          ;$1bc6
ld a, l                           ;$1bc8
cp $2c                            ;$1bc9
jr nz, $1bc2                      ;$1bcb
ret                               ;$1bcd
call $1c0d                        ;$1bce
ldh a, [$ffab]                    ;$1bd1
and a                             ;$1bd3
ret nz                            ;$1bd4
call $050c                        ;$1bd5
call $0542                        ;$1bd8
call $0583                        ;$1bdb
call $24bb                        ;$1bde
call $209c                        ;$1be1
call $213e                        ;$1be4
call $25a1                        ;$1be7
call $224d                        ;$1bea
call $1f91                        ;$1bed
call $05b3                        ;$1bf0
ret                               ;$1bf3
bit 2, a                          ;$1bf4
ret z                             ;$1bf6
ld a, [$c0de]                     ;$1bf7
xor $01                           ;$1bfa
ld [$c0de], a                     ;$1bfc
jr z, $1c0a                       ;$1bff
ld a, $80                         ;$1c01
ld [$c210], a                     ;$1c03
call $2696                        ;$1c06
ret                               ;$1c09
xor a                             ;$1c0a
jr $1c03                          ;$1c0b
ldh a, [$ff80]                    ;$1c0d
and a, $0f                        ;$1c0f
cp $0f                            ;$1c11
jp z, $021b                       ;$1c13
ldh a, [$ffe4]                    ;$1c16
and a                             ;$1c18
ret nz                            ;$1c19
ldh a, [$ff81]                    ;$1c1a
bit 3, a                          ;$1c1c
jr z, $1bf4                       ;$1c1e
ldh a, [$ffc5]                    ;$1c20
and a                             ;$1c22
jr nz, $1c6a                      ;$1c23
ld hl, $ff40                      ;$1c25
ldh a, [$ffab]                    ;$1c28
xor $01                           ;$1c2a
ldh [$ffab], a                    ;$1c2c
jr z, $1c5a                       ;$1c2e
set 3, [hl]                       ;$1c30
ld a, $01                         ;$1c32
ld [$df7f], a                     ;$1c34
ld hl, $994e                      ;$1c37
ld de, $9d4e                      ;$1c3a
ld b, $04                         ;$1c3d
ldh a, [$ff41]                    ;$1c3f
and a, $03                        ;$1c41
jr nz, $1c3f                      ;$1c43
ldi a, [hl]                       ;$1c45
ld [de], a                        ;$1c46
inc de                            ;$1c47
dec b                             ;$1c48
jr nz, $1c3f                      ;$1c49
ld a, $80                         ;$1c4b
ld [$c210], a                     ;$1c4d
ld [$c200], a                     ;$1c50
call $2683                        ;$1c53
call $2696                        ;$1c56
ret                               ;$1c59
res 3, [hl]                       ;$1c5a
ld a, $02                         ;$1c5c
ld [$df7f], a                     ;$1c5e
ld a, [$c0de]                     ;$1c61
and a                             ;$1c64
jr z, $1c4d                       ;$1c65
xor a                             ;$1c67
jr $1c50                          ;$1c68
ldh a, [$ffcb]                    ;$1c6a
cp $29                            ;$1c6c
ret nz                            ;$1c6e
ldh a, [$ffab]                    ;$1c6f
xor $01                           ;$1c71
ldh [$ffab], a                    ;$1c73
jr z, $1caa                       ;$1c75
ld a, $01                         ;$1c77
ld [$df7f], a                     ;$1c79
ldh a, [$ffd0]                    ;$1c7c
ldh [$fff2], a                    ;$1c7e
ldh a, [$ffcf]                    ;$1c80
ldh [$fff1], a                    ;$1c82
call $1ccb                        ;$1c84
ret                               ;$1c87
ldh a, [$ffab]                    ;$1c88
and a                             ;$1c8a
ret z                             ;$1c8b
ldh a, [$ffcc]                    ;$1c8c
jr z, $1cc9                       ;$1c8e
xor a                             ;$1c90
ldh [$ffcc], a                    ;$1c91
ldh a, [$ffcb]                    ;$1c93
cp $29                            ;$1c95
jr nz, $1ca1                      ;$1c97
ld a, $94                         ;$1c99
ldh [$ffcf], a                    ;$1c9b
ldh [$ffce], a                    ;$1c9d
pop hl                            ;$1c9f
ret                               ;$1ca0
xor a                             ;$1ca1
ldh [$ffcf], a                    ;$1ca2
ldh a, [$ffd0]                    ;$1ca4
cp $94                            ;$1ca6
jr z, $1cc9                       ;$1ca8
ldh a, [$fff2]                    ;$1caa
ldh [$ffd0], a                    ;$1cac
ldh a, [$fff1]                    ;$1cae
ldh [$ffcf], a                    ;$1cb0
ld a, $02                         ;$1cb2
ld [$df7f], a                     ;$1cb4
xor a                             ;$1cb7
ldh [$ffab], a                    ;$1cb8
ld hl, $98ee                      ;$1cba
ld b, $8e                         ;$1cbd
ld c, $05                         ;$1cbf
call $19ff                        ;$1cc1
inc l                             ;$1cc4
dec c                             ;$1cc5
jr nz, $1cc1                      ;$1cc6
ret                               ;$1cc8
pop hl                            ;$1cc9
ret                               ;$1cca
ld hl, $98ee                      ;$1ccb
ld c, $05                         ;$1cce
ld de, $1cdd                      ;$1cd0
ld a, [de]                        ;$1cd3
call $19fe                        ;$1cd4
inc de                            ;$1cd7
inc l                             ;$1cd8
dec c                             ;$1cd9
jr nz, $1cd3                      ;$1cda
ret                               ;$1cdc
add hl, de                        ;$1cdd
ld a, [bc]                        ;$1cde
ld e, $1c                         ;$1cdf
ld c, $3e                         ;$1ce1
add b                             ;$1ce3
ld [$c200], a                     ;$1ce4
ld [$c210], a                     ;$1ce7
call $2683                        ;$1cea
call $2696                        ;$1ced
xor a                             ;$1cf0
ldh [$ff98], a                    ;$1cf1
ldh [$ff9c], a                    ;$1cf3
call $2293                        ;$1cf5
ld a, $87                         ;$1cf8
call $1fd7                        ;$1cfa
ld a, $46                         ;$1cfd
ldh [$ffa6], a                    ;$1cff
ld a, $0d                         ;$1d01
ldh [$ffe1], a                    ;$1d03
ret                               ;$1d05
ldh a, [$ff81]                    ;$1d06
bit 0, a                          ;$1d08
jr nz, $1d0f                      ;$1d0a
bit 3, a                          ;$1d0c
ret z                             ;$1d0e
xor a                             ;$1d0f
ldh [$ffe3], a                    ;$1d10
ldh a, [$ffc5]                    ;$1d12
and a                             ;$1d14
ld a, $16                         ;$1d15
jr nz, $1d23                      ;$1d17
ldh a, [$ffc0]                    ;$1d19
cp $37                            ;$1d1b
ld a, $10                         ;$1d1d
jr z, $1d23                       ;$1d1f
ld a, $12                         ;$1d21
ldh [$ffe1], a                    ;$1d23
ret                               ;$1d25
ldh a, [$ffa6]                    ;$1d26
and a                             ;$1d28
ret nz                            ;$1d29
ld hl, $c802                      ;$1d2a
ld de, $2889                      ;$1d2d
call $2804                        ;$1d30
ldh a, [$ffc3]                    ;$1d33
and a                             ;$1d35
jr z, $1d66                       ;$1d36
ld de, $0040                      ;$1d38
ld hl, $c827                      ;$1d3b
call $1d84                        ;$1d3e
ld de, $0100                      ;$1d41
ld hl, $c887                      ;$1d44
call $1d84                        ;$1d47
ld de, $0300                      ;$1d4a
ld hl, $c8e7                      ;$1d4d
call $1d84                        ;$1d50
ld de, $1200                      ;$1d53
ld hl, $c947                      ;$1d56
call $1d84                        ;$1d59
ld hl, $c0a0                      ;$1d5c
ld b, $03                         ;$1d5f
xor a                             ;$1d61
ldi [hl], a                       ;$1d62
dec b                             ;$1d63
jr nz, $1d62                      ;$1d64
ld a, $80                         ;$1d66
ldh [$ffa6], a                    ;$1d68
ld a, $80                         ;$1d6a
ld [$c200], a                     ;$1d6c
ld [$c210], a                     ;$1d6f
call $2683                        ;$1d72
call $2696                        ;$1d75
call $7ff3                        ;$1d78
ld a, $25                         ;$1d7b
ldh [$ff9e], a                    ;$1d7d
ld a, $0b                         ;$1d7f
ldh [$ffe1], a                    ;$1d81
ret                               ;$1d83
push hl                           ;$1d84
ld hl, $c0a0                      ;$1d85
ld b, $03                         ;$1d88
xor a                             ;$1d8a
ldi [hl], a                       ;$1d8b
dec b                             ;$1d8c
jr nz, $1d8b                      ;$1d8d
ldh a, [$ffc3]                    ;$1d8f
ld b, a                           ;$1d91
inc b                             ;$1d92
ld hl, $c0a0                      ;$1d93
call $0166                        ;$1d96
dec b                             ;$1d99
jr nz, $1d93                      ;$1d9a
pop hl                            ;$1d9c
ld b, $03                         ;$1d9d
ld de, $c0a2                      ;$1d9f
ld a, [de]                        ;$1da2
and a, $f0                        ;$1da3
jr nz, $1db1                      ;$1da5
ld a, [de]                        ;$1da7
and a, $0f                        ;$1da8
jr nz, $1db7                      ;$1daa
dec e                             ;$1dac
dec b                             ;$1dad
jr nz, $1da2                      ;$1dae
ret                               ;$1db0
ld a, [de]                        ;$1db1
and a, $f0                        ;$1db2
swap a                            ;$1db4
ldi [hl], a                       ;$1db6
ld a, [de]                        ;$1db7
and a, $0f                        ;$1db8
ldi [hl], a                       ;$1dba
dec e                             ;$1dbb
dec b                             ;$1dbc
jr nz, $1db1                      ;$1dbd
ret                               ;$1dbf
ldh a, [$ffa6]                    ;$1dc0
and a                             ;$1dc2
ret nz                            ;$1dc3
ld a, $01                         ;$1dc4
ld [$c0c6], a                     ;$1dc6
ld a, $05                         ;$1dc9
ldh [$ffa6], a                    ;$1dcb
ret                               ;$1dcd
ldh a, [$ffa6]                    ;$1dce
and a                             ;$1dd0
ret nz                            ;$1dd1
ld hl, $c802                      ;$1dd2
ld de, $510f                      ;$1dd5
call $2804                        ;$1dd8
call $178a                        ;$1ddb
ld hl, $c200                      ;$1dde
ld de, $2735                      ;$1de1
ld c, $0a                         ;$1de4
call $1776                        ;$1de6
ld a, $10                         ;$1de9
ld hl, $c266                      ;$1deb
ld [hl], a                        ;$1dee
ld l, $76                         ;$1def
ld [hl], a                        ;$1df1
ld hl, $c20e                      ;$1df2
ld de, $1e31                      ;$1df5
ld b, $0a                         ;$1df8
ld a, [de]                        ;$1dfa
ldi [hl], a                       ;$1dfb
ldi [hl], a                       ;$1dfc
inc de                            ;$1dfd
push de                           ;$1dfe
ld de, $000e                      ;$1dff
add hl, de                        ;$1e02
pop de                            ;$1e03
dec b                             ;$1e04
jr nz, $1dfa                      ;$1e05
ldh a, [$ffc4]                    ;$1e07
cp $05                            ;$1e09
jr nz, $1e0f                      ;$1e0b
ld a, $09                         ;$1e0d
inc a                             ;$1e0f
ld b, a                           ;$1e10
ld hl, $c200                      ;$1e11
ld de, $0010                      ;$1e14
xor a                             ;$1e17
ld [hl], a                        ;$1e18
add hl, de                        ;$1e19
dec b                             ;$1e1a
jr nz, $1e18                      ;$1e1b
ldh a, [$ffc4]                    ;$1e1d
add a, $0a                        ;$1e1f
ld [$dfe8], a                     ;$1e21
ld a, $25                         ;$1e24
ldh [$ff9e], a                    ;$1e26
ld a, $1b                         ;$1e28
ldh [$ffa6], a                    ;$1e2a
ld a, $23                         ;$1e2c
ldh [$ffe1], a                    ;$1e2e
ret                               ;$1e30
inc e                             ;$1e31
rrca                              ;$1e32
ld e, $32                         ;$1e33
jr nz, $1e4f                      ;$1e35
ld h, $1d                         ;$1e37
jr z, $1e66                       ;$1e39
ld a, $0a                         ;$1e3b
call $2673                        ;$1e3d
ret                               ;$1e40
ldh a, [$ffa6]                    ;$1e41
cp $14                            ;$1e43
jr z, $1e3b                       ;$1e45
and a                             ;$1e47
ret nz                            ;$1e48
ld hl, $c20e                      ;$1e49
ld de, $0010                      ;$1e4c
ld b, $0a                         ;$1e4f
push hl                           ;$1e51
dec [hl]                          ;$1e52
jr nz, $1e6a                      ;$1e53
inc l                             ;$1e55
ldd a, [hl]                       ;$1e56
ld [hl], a                        ;$1e57
ld a, l                           ;$1e58
and a, $f0                        ;$1e59
or $03                            ;$1e5b
ld l, a                           ;$1e5d
ld a, [hl]                        ;$1e5e
xor $01                           ;$1e5f
ld [hl], a                        ;$1e61
cp $50                            ;$1e62
jr z, $1e89                       ;$1e64
cp $51                            ;$1e66
jr z, $1e8f                       ;$1e68
pop hl                            ;$1e6a
add hl, de                        ;$1e6b
dec b                             ;$1e6c
jr nz, $1e51                      ;$1e6d
ld a, $0a                         ;$1e6f
call $2673                        ;$1e71
ld a, [$dfe9]                     ;$1e74
and a                             ;$1e77
ret nz                            ;$1e78
call $178a                        ;$1e79
ldh a, [$ffc4]                    ;$1e7c
cp $05                            ;$1e7e
ld a, $26                         ;$1e80
jr z, $1e86                       ;$1e82
ld a, $05                         ;$1e84
ldh [$ffe1], a                    ;$1e86
ret                               ;$1e88
dec l                             ;$1e89
dec l                             ;$1e8a
ld [hl], $67                      ;$1e8b
jr $1e6a                          ;$1e8d
dec l                             ;$1e8f
dec l                             ;$1e90
ld [hl], $5d                      ;$1e91
jr $1e6a                          ;$1e93
xor a                             ;$1e95
ld [$c0c6], a                     ;$1e96
ld de, $c0c0                      ;$1e99
ld a, [de]                        ;$1e9c
ld l, a                           ;$1e9d
inc de                            ;$1e9e
ld a, [de]                        ;$1e9f
ld h, a                           ;$1ea0
or l                              ;$1ea1
jp z, $263a                       ;$1ea2
dec hl                            ;$1ea5
ld a, h                           ;$1ea6
ld [de], a                        ;$1ea7
dec de                            ;$1ea8
ld a, l                           ;$1ea9
ld [de], a                        ;$1eaa
ld de, $0001                      ;$1eab
ld hl, $c0c2                      ;$1eae
push de                           ;$1eb1
call $0166                        ;$1eb2
ld de, $c0c4                      ;$1eb5
ld hl, $99a5                      ;$1eb8
call $2a36                        ;$1ebb
xor a                             ;$1ebe
ldh [$ffa6], a                    ;$1ebf
pop de                            ;$1ec1
ld hl, $c0a0                      ;$1ec2
call $0166                        ;$1ec5
ld de, $c0a2                      ;$1ec8
ld hl, $9a25                      ;$1ecb
call $2a3a                        ;$1ece
ld a, $02                         ;$1ed1
ld [$dfe0], a                     ;$1ed3
ret                               ;$1ed6
ld a, [$c0c6]                     ;$1ed7
and a                             ;$1eda
ret z                             ;$1edb
ld a, [$c0c5]                     ;$1edc
cp $04                            ;$1edf
jr z, $1e95                       ;$1ee1
ld de, $0040                      ;$1ee3
ld bc, $9823                      ;$1ee6
ld hl, $c0ac                      ;$1ee9
and a                             ;$1eec
jr z, $1f12                       ;$1eed
ld de, $0100                      ;$1eef
ld bc, $9883                      ;$1ef2
ld hl, $c0b1                      ;$1ef5
cp $01                            ;$1ef8
jr z, $1f12                       ;$1efa
ld de, $0300                      ;$1efc
ld bc, $98e3                      ;$1eff
ld hl, $c0b6                      ;$1f02
cp $02                            ;$1f05
jr z, $1f12                       ;$1f07
ld de, $1200                      ;$1f09
ld bc, $9943                      ;$1f0c
ld hl, $c0bb                      ;$1f0f
call $25d9                        ;$1f12
ret                               ;$1f15
ldh a, [$ff81]                    ;$1f16
and a                             ;$1f18
ret z                             ;$1f19
ld a, $02                         ;$1f1a
ldh [$ffe1], a                    ;$1f1c
ret                               ;$1f1e
ldh a, [$ffa6]                    ;$1f1f
and a                             ;$1f21
ret nz                            ;$1f22
ld a, $04                         ;$1f23
ld [$dfe8], a                     ;$1f25
ldh a, [$ffc5]                    ;$1f28
and a                             ;$1f2a
jr z, $1f37                       ;$1f2b
ld a, $3f                         ;$1f2d
ldh [$ffa6], a                    ;$1f2f
ld a, $1b                         ;$1f31
ldh [$ffcc], a                    ;$1f33
jr $1f6e                          ;$1f35
ld a, $2f                         ;$1f37
call $1fd7                        ;$1f39
ld hl, $c843                      ;$1f3c
ld de, $293e                      ;$1f3f
ld c, $07                         ;$1f42
call $1f7d                        ;$1f44
ld hl, $c983                      ;$1f47
ld de, $2976                      ;$1f4a
ld c, $06                         ;$1f4d
call $1f7d                        ;$1f4f
ldh a, [$ffc0]                    ;$1f52
cp $37                            ;$1f54
jr nz, $1f6c                      ;$1f56
ld hl, $c0a2                      ;$1f58
ld a, [hl]                        ;$1f5b
ld b, $58                         ;$1f5c
cp $20                            ;$1f5e
jr nc, $1f71                      ;$1f60
inc b                             ;$1f62
cp $15                            ;$1f63
jr nc, $1f71                      ;$1f65
inc b                             ;$1f67
cp $10                            ;$1f68
jr nc, $1f71                      ;$1f6a
ld a, $04                         ;$1f6c
ldh [$ffe1], a                    ;$1f6e
ret                               ;$1f70
ld a, b                           ;$1f71
ldh [$fff3], a                    ;$1f72
ld a, $90                         ;$1f74
ldh [$ffa6], a                    ;$1f76
ld a, $34                         ;$1f78
ldh [$ffe1], a                    ;$1f7a
ret                               ;$1f7c
ld b, $08                         ;$1f7d
push hl                           ;$1f7f
ld a, [de]                        ;$1f80
ldi [hl], a                       ;$1f81
inc de                            ;$1f82
dec b                             ;$1f83
jr nz, $1f80                      ;$1f84
pop hl                            ;$1f86
push de                           ;$1f87
ld de, $0020                      ;$1f88
add hl, de                        ;$1f8b
pop de                            ;$1f8c
dec c                             ;$1f8d
jr nz, $1f7d                      ;$1f8e
ret                               ;$1f90
ldh a, [$ffc0]                    ;$1f91
cp $37                            ;$1f93
ret nz                            ;$1f95
ldh a, [$ffe1]                    ;$1f96
and a                             ;$1f98
ret nz                            ;$1f99
ldh a, [$ffe3]                    ;$1f9a
cp $05                            ;$1f9c
ret nz                            ;$1f9e
ld hl, $c0ac                      ;$1f9f
ld bc, $0005                      ;$1fa2
ld a, [hl]                        ;$1fa5
ld de, $0040                      ;$1fa6
and a                             ;$1fa9
jr nz, $1fc3                      ;$1faa
add hl, bc                        ;$1fac
ld a, [hl]                        ;$1fad
ld de, $0100                      ;$1fae
and a                             ;$1fb1
jr nz, $1fc3                      ;$1fb2
add hl, bc                        ;$1fb4
ld a, [hl]                        ;$1fb5
ld de, $0300                      ;$1fb6
and a                             ;$1fb9
jr nz, $1fc3                      ;$1fba
add hl, bc                        ;$1fbc
ld de, $1200                      ;$1fbd
ld a, [hl]                        ;$1fc0
and a                             ;$1fc1
ret z                             ;$1fc2
ld [hl], $00                      ;$1fc3
ldh a, [$ffa9]                    ;$1fc5
ld b, a                           ;$1fc7
inc b                             ;$1fc8
push bc                           ;$1fc9
push de                           ;$1fca
ld hl, $c0a0                      ;$1fcb
call $0166                        ;$1fce
pop de                            ;$1fd1
pop bc                            ;$1fd2
dec b                             ;$1fd3
jr nz, $1fc9                      ;$1fd4
ret                               ;$1fd6
push af                           ;$1fd7
ld a, $02                         ;$1fd8
ldh [$ffe3], a                    ;$1fda
pop af                            ;$1fdc
ld hl, $c802                      ;$1fdd
ld c, $12                         ;$1fe0
ld de, $0020                      ;$1fe2
push hl                           ;$1fe5
ld b, $0a                         ;$1fe6
ldi [hl], a                       ;$1fe8
dec b                             ;$1fe9
jr nz, $1fe8                      ;$1fea
pop hl                            ;$1fec
add hl, de                        ;$1fed
dec c                             ;$1fee
jr nz, $1fe5                      ;$1fef
ret                               ;$1ff1
ld hl, $cbc2                      ;$1ff2
ld de, $0016                      ;$1ff5
ld c, $02                         ;$1ff8
ld a, $2f                         ;$1ffa
ld b, $0a                         ;$1ffc
ldi [hl], a                       ;$1ffe
dec b                             ;$1fff
jr nz, $1ffe                      ;$2000
add hl, de                        ;$2002
dec c                             ;$2003
jr nz, $1ffc                      ;$2004
ret                               ;$2006
ld hl, $c200                      ;$2007
ld [hl], $00                      ;$200a
inc l                             ;$200c
ld [hl], $18                      ;$200d
inc l                             ;$200f
ld [hl], $3f                      ;$2010
inc l                             ;$2012
ld a, [$c213]                     ;$2013
ld [hl], a                        ;$2016
and a, $fc                        ;$2017
ld c, a                           ;$2019
ldh a, [$ffe4]                    ;$201a
and a                             ;$201c
jr nz, $2024                      ;$201d
ldh a, [$ffc5]                    ;$201f
and a                             ;$2021
jr z, $2041                       ;$2022
ld h, $c3                         ;$2024
ldh a, [$ffb0]                    ;$2026
ld l, a                           ;$2028
ld e, [hl]                        ;$2029
inc hl                            ;$202a
ld a, h                           ;$202b
cp $c4                            ;$202c
jr nz, $2033                      ;$202e
ld hl, $c300                      ;$2030
ld a, l                           ;$2033
ldh [$ffb0], a                    ;$2034
ldh a, [$ffd3]                    ;$2036
and a                             ;$2038
jr z, $2065                       ;$2039
or $80                            ;$203b
ldh [$ffd3], a                    ;$203d
jr $2065                          ;$203f
ld h, $03                         ;$2041
ldh a, [$ff04]                    ;$2043
ld b, a                           ;$2045
xor a                             ;$2046
dec b                             ;$2047
jr z, $2054                       ;$2048
inc a                             ;$204a
inc a                             ;$204b
inc a                             ;$204c
inc a                             ;$204d
cp $1c                            ;$204e
jr z, $2046                       ;$2050
jr $2047                          ;$2052
ld d, a                           ;$2054
ldh a, [$ffae]                    ;$2055
ld e, a                           ;$2057
dec h                             ;$2058
jr z, $2062                       ;$2059
or d                              ;$205b
or c                              ;$205c
and a, $fc                        ;$205d
cp c                              ;$205f
jr z, $2043                       ;$2060
ld a, d                           ;$2062
ldh [$ffae], a                    ;$2063
ld a, e                           ;$2065
ld [$c213], a                     ;$2066
call $2696                        ;$2069
ldh a, [$ff9a]                    ;$206c
ldh [$ff99], a                    ;$206e
ret                               ;$2070
ld a, [$c0c7]                     ;$2071
and a                             ;$2074
jr z, $2083                       ;$2075
ldh a, [$ff81]                    ;$2077
and a, $b0                        ;$2079
cp $80                            ;$207b
jr nz, $20a4                      ;$207d
xor a                             ;$207f
ld [$c0c7], a                     ;$2080
ldh a, [$ffa7]                    ;$2083
and a                             ;$2085
jr nz, $20b1                      ;$2086
ldh a, [$ff98]                    ;$2088
and a                             ;$208a
jr nz, $20b1                      ;$208b
ldh a, [$ffe3]                    ;$208d
and a                             ;$208f
jr nz, $20b1                      ;$2090
ld a, $03                         ;$2092
ldh [$ffa7], a                    ;$2094
ld hl, $ffe5                      ;$2096
inc [hl]                          ;$2099
jr $20c2                          ;$209a
ldh a, [$ff80]                    ;$209c
and a, $b0                        ;$209e
cp $80                            ;$20a0
jr z, $2071                       ;$20a2
ld hl, $ffe5                      ;$20a4
ld [hl], $00                      ;$20a7
ldh a, [$ff99]                    ;$20a9
and a                             ;$20ab
jr z, $20b5                       ;$20ac
dec a                             ;$20ae
ldh [$ff99], a                    ;$20af
call $2683                        ;$20b1
ret                               ;$20b4
ldh a, [$ff98]                    ;$20b5
cp $03                            ;$20b7
ret z                             ;$20b9
ldh a, [$ffe3]                    ;$20ba
and a                             ;$20bc
ret nz                            ;$20bd
ldh a, [$ff9a]                    ;$20be
ldh [$ff99], a                    ;$20c0
ld hl, $c201                      ;$20c2
ld a, [hl]                        ;$20c5
ldh [$ffa0], a                    ;$20c6
add a, $08                        ;$20c8
ld [hl], a                        ;$20ca
call $2683                        ;$20cb
call $2573                        ;$20ce
and a                             ;$20d1
ret z                             ;$20d2
ldh a, [$ffa0]                    ;$20d3
ld hl, $c201                      ;$20d5
ld [hl], a                        ;$20d8
call $2683                        ;$20d9
ld a, $01                         ;$20dc
ldh [$ff98], a                    ;$20de
ld [$c0c7], a                     ;$20e0
ldh a, [$ffe5]                    ;$20e3
and a                             ;$20e5
jr z, $2103                       ;$20e6
ld c, a                           ;$20e8
ldh a, [$ffc0]                    ;$20e9
cp $37                            ;$20eb
jr z, $2126                       ;$20ed
ld de, $c0c0                      ;$20ef
ld a, [de]                        ;$20f2
ld l, a                           ;$20f3
inc de                            ;$20f4
ld a, [de]                        ;$20f5
ld h, a                           ;$20f6
ld b, $00                         ;$20f7
dec c                             ;$20f9
add hl, bc                        ;$20fa
ld a, h                           ;$20fb
ld [de], a                        ;$20fc
ld a, l                           ;$20fd
dec de                            ;$20fe
ld [de], a                        ;$20ff
xor a                             ;$2100
ldh [$ffe5], a                    ;$2101
ld a, [$c201]                     ;$2103
cp $18                            ;$2106
ret nz                            ;$2108
ld a, [$c202]                     ;$2109
cp $3f                            ;$210c
ret nz                            ;$210e
ld hl, $fffb                      ;$210f
ld a, [hl]                        ;$2112
cp $01                            ;$2113
jr nz, $2124                      ;$2115
call $7ff3                        ;$2117
ld a, $01                         ;$211a
ldh [$ffe1], a                    ;$211c
ld a, $02                         ;$211e
ld [$dff0], a                     ;$2120
ret                               ;$2123
inc [hl]                          ;$2124
ret                               ;$2125
xor a                             ;$2126
dec c                             ;$2127
jr z, $212e                       ;$2128
inc a                             ;$212a
daa                               ;$212b
jr $2127                          ;$212c
ld e, a                           ;$212e
ld d, $00                         ;$212f
ld hl, $c0a0                      ;$2131
call $0166                        ;$2134
ld a, $01                         ;$2137
ld [$c0ce], a                     ;$2139
jr $2100                          ;$213c
ldh a, [$ff98]                    ;$213e
cp $02                            ;$2140
ret nz                            ;$2142
ld a, $02                         ;$2143
ld [$dff8], a                     ;$2145
xor a                             ;$2148
ldh [$ffa0], a                    ;$2149
ld de, $c0a3                      ;$214b
ld hl, $c842                      ;$214e
ld b, $10                         ;$2151
ld c, $0a                         ;$2153
push hl                           ;$2155
ldi a, [hl]                       ;$2156
cp $2f                            ;$2157
jp z, $21d8                       ;$2159
dec c                             ;$215c
jr nz, $2156                      ;$215d
pop hl                            ;$215f
ld a, h                           ;$2160
ld [de], a                        ;$2161
inc de                            ;$2162
ld a, l                           ;$2163
ld [de], a                        ;$2164
inc de                            ;$2165
ldh a, [$ffa0]                    ;$2166
inc a                             ;$2168
ldh [$ffa0], a                    ;$2169
push de                           ;$216b
ld de, $0020                      ;$216c
add hl, de                        ;$216f
pop de                            ;$2170
dec b                             ;$2171
jr nz, $2153                      ;$2172
ld a, $03                         ;$2174
ldh [$ff98], a                    ;$2176
dec a                             ;$2178
ldh [$ffa6], a                    ;$2179
ldh a, [$ffa0]                    ;$217b
and a                             ;$217d
ret z                             ;$217e
ld b, a                           ;$217f
ld hl, $ff9e                      ;$2180
ldh a, [$ffc0]                    ;$2183
cp $77                            ;$2185
jr z, $219b                       ;$2187
ld a, b                           ;$2189
add [hl]                          ;$218a
daa                               ;$218b
ldi [hl], a                       ;$218c
ld a, $00                         ;$218d
adc [hl]                          ;$218f
daa                               ;$2190
ld [hl], a                        ;$2191
jr nc, $21aa                      ;$2192
ld [hl], $99                      ;$2194
dec hl                            ;$2196
ld [hl], $99                      ;$2197
jr $21aa                          ;$2199
ld a, [hl]                        ;$219b
or a                              ;$219c
sub b                             ;$219d
jr z, $21db                       ;$219e
jr c, $21db                       ;$21a0
daa                               ;$21a2
ld [hl], a                        ;$21a3
and a, $f0                        ;$21a4
cp $90                            ;$21a6
jr z, $21db                       ;$21a8
ld a, b                           ;$21aa
ld c, $06                         ;$21ab
ld hl, $c0ac                      ;$21ad
ld b, $00                         ;$21b0
cp $01                            ;$21b2
jr z, $21cf                       ;$21b4
ld hl, $c0b1                      ;$21b6
ld b, $01                         ;$21b9
cp $02                            ;$21bb
jr z, $21cf                       ;$21bd
ld hl, $c0b6                      ;$21bf
ld b, $02                         ;$21c2
cp $03                            ;$21c4
jr z, $21cf                       ;$21c6
ld hl, $c0bb                      ;$21c8
ld b, $04                         ;$21cb
ld c, $07                         ;$21cd
inc [hl]                          ;$21cf
ld a, b                           ;$21d0
ldh [$ffdc], a                    ;$21d1
ld a, c                           ;$21d3
ld [$dfe0], a                     ;$21d4
ret                               ;$21d7
pop hl                            ;$21d8
jr $216b                          ;$21d9
xor a                             ;$21db
ldh [$ff9e], a                    ;$21dc
jr $21aa                          ;$21de
ldh a, [$ff98]                    ;$21e0
cp $03                            ;$21e2
ret nz                            ;$21e4
ldh a, [$ffa6]                    ;$21e5
and a                             ;$21e7
ret nz                            ;$21e8
ld de, $c0a3                      ;$21e9
ldh a, [$ff9c]                    ;$21ec
bit 0, a                          ;$21ee
jr nz, $222e                      ;$21f0
ld a, [de]                        ;$21f2
and a                             ;$21f3
jr z, $2248                       ;$21f4
sub a, $30                        ;$21f6
ld h, a                           ;$21f8
inc de                            ;$21f9
ld a, [de]                        ;$21fa
ld l, a                           ;$21fb
ldh a, [$ff9c]                    ;$21fc
cp $06                            ;$21fe
ld a, $8c                         ;$2200
jr nz, $2206                      ;$2202
ld a, $2f                         ;$2204
ld c, $0a                         ;$2206
ldi [hl], a                       ;$2208
dec c                             ;$2209
jr nz, $2208                      ;$220a
inc de                            ;$220c
ld a, [de]                        ;$220d
and a                             ;$220e
jr nz, $21f6                      ;$220f
ldh a, [$ff9c]                    ;$2211
inc a                             ;$2213
ldh [$ff9c], a                    ;$2214
cp $07                            ;$2216
jr z, $221f                       ;$2218
ld a, $0a                         ;$221a
ldh [$ffa6], a                    ;$221c
ret                               ;$221e
xor a                             ;$221f
ldh [$ff9c], a                    ;$2220
ld a, $0d                         ;$2222
ldh [$ffa6], a                    ;$2224
ld a, $01                         ;$2226
ldh [$ffe3], a                    ;$2228
xor a                             ;$222a
ldh [$ff98], a                    ;$222b
ret                               ;$222d
ld a, [de]                        ;$222e
ld h, a                           ;$222f
sub a, $30                        ;$2230
ld c, a                           ;$2232
inc de                            ;$2233
ld a, [de]                        ;$2234
ld l, a                           ;$2235
ld b, $0a                         ;$2236
ld a, [hl]                        ;$2238
push hl                           ;$2239
ld h, c                           ;$223a
ld [hl], a                        ;$223b
pop hl                            ;$223c
inc hl                            ;$223d
dec b                             ;$223e
jr nz, $2238                      ;$223f
inc de                            ;$2241
ld a, [de]                        ;$2242
and a                             ;$2243
jr nz, $222e                      ;$2244
jr $2211                          ;$2246
call $2007                        ;$2248
jr $222a                          ;$224b
ldh a, [$ffa6]                    ;$224d
and a                             ;$224f
ret nz                            ;$2250
ldh a, [$ffe3]                    ;$2251
cp $01                            ;$2253
ret nz                            ;$2255
ld de, $c0a3                      ;$2256
ld a, [de]                        ;$2259
ld h, a                           ;$225a
inc de                            ;$225b
ld a, [de]                        ;$225c
ld l, a                           ;$225d
push de                           ;$225e
push hl                           ;$225f
ld bc, $ffe0                      ;$2260
add hl, bc                        ;$2263
pop de                            ;$2264
push hl                           ;$2265
ld b, $0a                         ;$2266
ldi a, [hl]                       ;$2268
ld [de], a                        ;$2269
inc de                            ;$226a
dec b                             ;$226b
jr nz, $2268                      ;$226c
pop hl                            ;$226e
push hl                           ;$226f
pop de                            ;$2270
ld bc, $ffe0                      ;$2271
add hl, bc                        ;$2274
ld a, h                           ;$2275
cp $c7                            ;$2276
jr nz, $2265                      ;$2278
pop de                            ;$227a
inc de                            ;$227b
ld a, [de]                        ;$227c
and a                             ;$227d
jr nz, $225a                      ;$227e
ld hl, $c802                      ;$2280
ld a, $2f                         ;$2283
ld b, $0a                         ;$2285
ldi [hl], a                       ;$2287
dec b                             ;$2288
jr nz, $2287                      ;$2289
call $2293                        ;$228b
ld a, $02                         ;$228e
ldh [$ffe3], a                    ;$2290
ret                               ;$2292
ld hl, $c0a3                      ;$2293
xor a                             ;$2296
ld b, $09                         ;$2297
ldi [hl], a                       ;$2299
dec b                             ;$229a
jr nz, $2299                      ;$229b
ret                               ;$229d
ldh a, [$ffe3]                    ;$229e
cp $02                            ;$22a0
ret nz                            ;$22a2
ld hl, $9a22                      ;$22a3
ld de, $ca22                      ;$22a6
call $24ac                        ;$22a9
ret                               ;$22ac
ldh a, [$ffe3]                    ;$22ad
cp $03                            ;$22af
ret nz                            ;$22b1
ld hl, $9a02                      ;$22b2
ld de, $ca02                      ;$22b5
call $24ac                        ;$22b8
ret                               ;$22bb
ldh a, [$ffe3]                    ;$22bc
cp $04                            ;$22be
ret nz                            ;$22c0
ld hl, $99e2                      ;$22c1
ld de, $c9e2                      ;$22c4
call $24ac                        ;$22c7
ret                               ;$22ca
ldh a, [$ffe3]                    ;$22cb
cp $05                            ;$22cd
ret nz                            ;$22cf
ld hl, $99c2                      ;$22d0
ld de, $c9c2                      ;$22d3
call $24ac                        ;$22d6
ret                               ;$22d9
ldh a, [$ffe3]                    ;$22da
cp $06                            ;$22dc
ret nz                            ;$22de
ld hl, $99a2                      ;$22df
ld de, $c9a2                      ;$22e2
call $24ac                        ;$22e5
ret                               ;$22e8
ldh a, [$ffe3]                    ;$22e9
cp $07                            ;$22eb
ret nz                            ;$22ed
ld hl, $9982                      ;$22ee
ld de, $c982                      ;$22f1
call $24ac                        ;$22f4
ret                               ;$22f7
ldh a, [$ffe3]                    ;$22f8
cp $08                            ;$22fa
ret nz                            ;$22fc
ld hl, $9962                      ;$22fd
ld de, $c962                      ;$2300
call $24ac                        ;$2303
ldh a, [$ffc5]                    ;$2306
and a                             ;$2308
ldh a, [$ffe1]                    ;$2309
jr nz, $2315                      ;$230b
and a                             ;$230d
ret nz                            ;$230e
ld a, $01                         ;$230f
ld [$dff8], a                     ;$2311
ret                               ;$2314
cp $1a                            ;$2315
ret nz                            ;$2317
ldh a, [$ffd4]                    ;$2318
and a                             ;$231a
jr z, $230f                       ;$231b
ld a, $05                         ;$231d
ld [$dfe0], a                     ;$231f
ret                               ;$2322
ldh a, [$ffe3]                    ;$2323
cp $09                            ;$2325
ret nz                            ;$2327
ld hl, $9942                      ;$2328
ld de, $c942                      ;$232b
call $24ac                        ;$232e
ret                               ;$2331
ldh a, [$ffe3]                    ;$2332
cp $0a                            ;$2334
ret nz                            ;$2336
ld hl, $9922                      ;$2337
ld de, $c922                      ;$233a
call $24ac                        ;$233d
ret                               ;$2340
ldh a, [$ffe3]                    ;$2341
cp $0b                            ;$2343
ret nz                            ;$2345
ld hl, $9902                      ;$2346
ld de, $c902                      ;$2349
call $24ac                        ;$234c
ret                               ;$234f
ldh a, [$ffe3]                    ;$2350
cp $0c                            ;$2352
ret nz                            ;$2354
ld hl, $98e2                      ;$2355
ld de, $c8e2                      ;$2358
call $24ac                        ;$235b
ret                               ;$235e
ldh a, [$ffe3]                    ;$235f
cp $0d                            ;$2361
ret nz                            ;$2363
ld hl, $98c2                      ;$2364
ld de, $c8c2                      ;$2367
call $24ac                        ;$236a
ret                               ;$236d
ldh a, [$ffe3]                    ;$236e
cp $0e                            ;$2370
ret nz                            ;$2372
ld hl, $98a2                      ;$2373
ld de, $c8a2                      ;$2376
call $24ac                        ;$2379
ret                               ;$237c
ldh a, [$ffe3]                    ;$237d
cp $0f                            ;$237f
ret nz                            ;$2381
ld hl, $9882                      ;$2382
ld de, $c882                      ;$2385
call $24ac                        ;$2388
ret                               ;$238b
ldh a, [$ffe3]                    ;$238c
cp $10                            ;$238e
ret nz                            ;$2390
ld hl, $9862                      ;$2391
ld de, $c862                      ;$2394
call $24ac                        ;$2397
call $244b                        ;$239a
ret                               ;$239d
ldh a, [$ffe3]                    ;$239e
cp $11                            ;$23a0
ret nz                            ;$23a2
ld hl, $9842                      ;$23a3
ld de, $c842                      ;$23a6
call $24ac                        ;$23a9
ld hl, $9c6d                      ;$23ac
call $243b                        ;$23af
ld a, $01                         ;$23b2
ldh [$ffe0], a                    ;$23b4
ret                               ;$23b6
ldh a, [$ffe3]                    ;$23b7
cp $12                            ;$23b9
ret nz                            ;$23bb
ld hl, $9822                      ;$23bc
ld de, $c822                      ;$23bf
call $24ac                        ;$23c2
ld hl, $986d                      ;$23c5
call $243b                        ;$23c8
ret                               ;$23cb
ldh a, [$ffe3]                    ;$23cc
cp $13                            ;$23ce
ret nz                            ;$23d0
ld [$c0c7], a                     ;$23d1
ld hl, $9802                      ;$23d4
ld de, $c802                      ;$23d7
call $24ac                        ;$23da
xor a                             ;$23dd
ldh [$ffe3], a                    ;$23de
ldh a, [$ffc5]                    ;$23e0
and a                             ;$23e2
ldh a, [$ffe1]                    ;$23e3
jr nz, $242f                      ;$23e5
and a                             ;$23e7
ret nz                            ;$23e8
ld hl, $994e                      ;$23e9
ld de, $ff9f                      ;$23ec
ld c, $02                         ;$23ef
ldh a, [$ffc0]                    ;$23f1
cp $37                            ;$23f3
jr z, $23ff                       ;$23f5
ld hl, $9950                      ;$23f7
ld de, $ff9e                      ;$23fa
ld c, $01                         ;$23fd
call $2a3c                        ;$23ff
ldh a, [$ffc0]                    ;$2402
cp $37                            ;$2404
jr z, $242b                       ;$2406
ldh a, [$ff9e]                    ;$2408
and a                             ;$240a
jr nz, $242b                      ;$240b
ld a, $64                         ;$240d
ldh [$ffa6], a                    ;$240f
ld a, $02                         ;$2411
ld [$dfe8], a                     ;$2413
ldh a, [$ffc5]                    ;$2416
and a                             ;$2418
jr z, $241e                       ;$2419
ldh [$ffd5], a                    ;$241b
ret                               ;$241d
ldh a, [$ffc3]                    ;$241e
cp $09                            ;$2420
ld a, $05                         ;$2422
jr nz, $2428                      ;$2424
ld a, $22                         ;$2426
ldh [$ffe1], a                    ;$2428
ret                               ;$242a
call $2007                        ;$242b
ret                               ;$242e
cp $1a                            ;$242f
ret nz                            ;$2431
ldh a, [$ffd4]                    ;$2432
and a                             ;$2434
jr z, $23e9                       ;$2435
xor a                             ;$2437
ldh [$ffd4], a                    ;$2438
ret                               ;$243a
ldh a, [$ffe1]                    ;$243b
and a                             ;$243d
ret nz                            ;$243e
ldh a, [$ffc0]                    ;$243f
cp $37                            ;$2441
ret nz                            ;$2443
ld de, $c0a2                      ;$2444
call $2a36                        ;$2447
ret                               ;$244a
ldh a, [$ffe1]                    ;$244b
and a                             ;$244d
ret nz                            ;$244e
ldh a, [$ffc0]                    ;$244f
cp $37                            ;$2451
ret nz                            ;$2453
ld hl, $ffa9                      ;$2454
ld a, [hl]                        ;$2457
cp $14                            ;$2458
ret z                             ;$245a
call $249d                        ;$245b
ldh a, [$ff9f]                    ;$245e
ld d, a                           ;$2460
and a, $f0                        ;$2461
ret nz                            ;$2463
ld a, d                           ;$2464
and a, $0f                        ;$2465
swap a                            ;$2467
ld d, a                           ;$2469
ldh a, [$ff9e]                    ;$246a
and a, $f0                        ;$246c
swap a                            ;$246e
or d                              ;$2470
cp b                              ;$2471
ret c                             ;$2472
ret z                             ;$2473
inc [hl]                          ;$2474
call $249d                        ;$2475
and a, $0f                        ;$2478
ld c, a                           ;$247a
ld hl, $98f1                      ;$247b
ld [hl], c                        ;$247e
ld h, $9c                         ;$247f
ld [hl], c                        ;$2481
ld a, b                           ;$2482
and a, $f0                        ;$2483
jr z, $2494                       ;$2485
swap a                            ;$2487
ld c, a                           ;$2489
ld a, l                           ;$248a
cp $f0                            ;$248b
jr z, $2494                       ;$248d
ld hl, $98f0                      ;$248f
jr $247e                          ;$2492
ld a, $08                         ;$2494
ld [$dfe0], a                     ;$2496
call $1ae8                        ;$2499
ret                               ;$249c
ld a, [hl]                        ;$249d
ld b, a                           ;$249e
and a                             ;$249f
ret z                             ;$24a0
xor a                             ;$24a1
or a                              ;$24a2
inc a                             ;$24a3
daa                               ;$24a4
dec b                             ;$24a5
jr z, $24aa                       ;$24a6
jr $24a2                          ;$24a8
ld b, a                           ;$24aa
ret                               ;$24ab
ld b, $0a                         ;$24ac
ld a, [de]                        ;$24ae
ld [hl], a                        ;$24af
inc l                             ;$24b0
inc e                             ;$24b1
dec b                             ;$24b2
jr nz, $24ae                      ;$24b3
ldh a, [$ffe3]                    ;$24b5
inc a                             ;$24b7
ldh [$ffe3], a                    ;$24b8
ret                               ;$24ba
ld hl, $c200                      ;$24bb
ld a, [hl]                        ;$24be
cp $80                            ;$24bf
ret z                             ;$24c1
ld l, $03                         ;$24c2
ld a, [hl]                        ;$24c4
ldh [$ffa0], a                    ;$24c5
ldh a, [$ff81]                    ;$24c7
ld b, a                           ;$24c9
bit 1, b                          ;$24ca
jr nz, $24e0                      ;$24cc
bit 0, b                          ;$24ce
jr z, $2509                       ;$24d0
ld a, [hl]                        ;$24d2
and a, $03                        ;$24d3
jr z, $24da                       ;$24d5
dec [hl]                          ;$24d7
jr $24ee                          ;$24d8
ld a, [hl]                        ;$24da
or $03                            ;$24db
ld [hl], a                        ;$24dd
jr $24ee                          ;$24de
ld a, [hl]                        ;$24e0
and a, $03                        ;$24e1
cp $03                            ;$24e3
jr z, $24ea                       ;$24e5
inc [hl]                          ;$24e7
jr $24ee                          ;$24e8
ld a, [hl]                        ;$24ea
and a, $fc                        ;$24eb
ld [hl], a                        ;$24ed
ld a, $03                         ;$24ee
ld [$dfe0], a                     ;$24f0
call $2683                        ;$24f3
call $2573                        ;$24f6
and a                             ;$24f9
jr z, $2509                       ;$24fa
xor a                             ;$24fc
ld [$dfe0], a                     ;$24fd
ld hl, $c203                      ;$2500
ldh a, [$ffa0]                    ;$2503
ld [hl], a                        ;$2505
call $2683                        ;$2506
ld hl, $c202                      ;$2509
ldh a, [$ff81]                    ;$250c
ld b, a                           ;$250e
ldh a, [$ff80]                    ;$250f
ld c, a                           ;$2511
ld a, [hl]                        ;$2512
ldh [$ffa0], a                    ;$2513
bit 4, b                          ;$2515
ld a, $17                         ;$2517
jr nz, $2527                      ;$2519
bit 4, c                          ;$251b
jr z, $254c                       ;$251d
ldh a, [$ffaa]                    ;$251f
dec a                             ;$2521
ldh [$ffaa], a                    ;$2522
ret nz                            ;$2524
ld a, $09                         ;$2525
ldh [$ffaa], a                    ;$2527
ld a, [hl]                        ;$2529
add a, $08                        ;$252a
ld [hl], a                        ;$252c
call $2683                        ;$252d
ld a, $04                         ;$2530
ld [$dfe0], a                     ;$2532
call $2573                        ;$2535
and a                             ;$2538
ret z                             ;$2539
ld hl, $c202                      ;$253a
xor a                             ;$253d
ld [$dfe0], a                     ;$253e
ldh a, [$ffa0]                    ;$2541
ld [hl], a                        ;$2543
call $2683                        ;$2544
ld a, $01                         ;$2547
ldh [$ffaa], a                    ;$2549
ret                               ;$254b
bit 5, b                          ;$254c
ld a, $17                         ;$254e
jr nz, $255e                      ;$2550
bit 5, c                          ;$2552
jr z, $2549                       ;$2554
ldh a, [$ffaa]                    ;$2556
dec a                             ;$2558
ldh [$ffaa], a                    ;$2559
ret nz                            ;$255b
ld a, $09                         ;$255c
ldh [$ffaa], a                    ;$255e
ld a, [hl]                        ;$2560
sub a, $08                        ;$2561
ld [hl], a                        ;$2563
ld a, $04                         ;$2564
ld [$dfe0], a                     ;$2566
call $2683                        ;$2569
call $2573                        ;$256c
and a                             ;$256f
ret z                             ;$2570
jr $253a                          ;$2571
ld hl, $c010                      ;$2573
ld b, $04                         ;$2576
ldi a, [hl]                       ;$2578
ldh [$ffb2], a                    ;$2579
ldi a, [hl]                       ;$257b
and a                             ;$257c
jr z, $2596                       ;$257d
ldh [$ffb3], a                    ;$257f
push hl                           ;$2581
push bc                           ;$2582
call $29e3                        ;$2583
ld a, h                           ;$2586
add a, $30                        ;$2587
ld h, a                           ;$2589
ld a, [hl]                        ;$258a
cp $2f                            ;$258b
jr nz, $259a                      ;$258d
pop bc                            ;$258f
pop hl                            ;$2590
inc l                             ;$2591
inc l                             ;$2592
dec b                             ;$2593
jr nz, $2578                      ;$2594
xor a                             ;$2596
ldh [$ff9b], a                    ;$2597
ret                               ;$2599
pop bc                            ;$259a
pop hl                            ;$259b
ld a, $01                         ;$259c
ldh [$ff9b], a                    ;$259e
ret                               ;$25a0
ldh a, [$ff98]                    ;$25a1
cp $01                            ;$25a3
ret nz                            ;$25a5
ld hl, $c010                      ;$25a6
ld b, $04                         ;$25a9
ldi a, [hl]                       ;$25ab
ldh [$ffb2], a                    ;$25ac
ldi a, [hl]                       ;$25ae
and a                             ;$25af
jr z, $25cf                       ;$25b0
ldh [$ffb3], a                    ;$25b2
push hl                           ;$25b4
push bc                           ;$25b5
call $29e3                        ;$25b6
push hl                           ;$25b9
pop de                            ;$25ba
pop bc                            ;$25bb
pop hl                            ;$25bc
ldh a, [$ff41]                    ;$25bd
and a, $03                        ;$25bf
jr nz, $25bd                      ;$25c1
ld a, [hl]                        ;$25c3
ld [de], a                        ;$25c4
ld a, d                           ;$25c5
add a, $30                        ;$25c6
ld d, a                           ;$25c8
ldi a, [hl]                       ;$25c9
ld [de], a                        ;$25ca
inc l                             ;$25cb
dec b                             ;$25cc
jr nz, $25ab                      ;$25cd
ld a, $02                         ;$25cf
ldh [$ff98], a                    ;$25d1
ld hl, $c200                      ;$25d3
ld [hl], $80                      ;$25d6
ret                               ;$25d8
ld a, [$c0c6]                     ;$25d9
cp $02                            ;$25dc
jr z, $2626                       ;$25de
push de                           ;$25e0
ld a, [hl]                        ;$25e1
or a                              ;$25e2
jr z, $2639                       ;$25e3
dec a                             ;$25e5
ldi [hl], a                       ;$25e6
ld a, [hl]                        ;$25e7
inc a                             ;$25e8
daa                               ;$25e9
ld [hl], a                        ;$25ea
and a, $0f                        ;$25eb
ld [bc], a                        ;$25ed
dec c                             ;$25ee
ldi a, [hl]                       ;$25ef
swap a                            ;$25f0
and a, $0f                        ;$25f2
jr z, $25f7                       ;$25f4
ld [bc], a                        ;$25f6
push bc                           ;$25f7
ldh a, [$ffc3]                    ;$25f8
ld b, a                           ;$25fa
inc b                             ;$25fb
push hl                           ;$25fc
call $0166                        ;$25fd
pop hl                            ;$2600
dec b                             ;$2601
jr nz, $25fc                      ;$2602
pop bc                            ;$2604
inc hl                            ;$2605
inc hl                            ;$2606
push hl                           ;$2607
ld hl, $0023                      ;$2608
add hl, bc                        ;$260b
pop de                            ;$260c
call $2a3a                        ;$260d
pop de                            ;$2610
ldh a, [$ffc3]                    ;$2611
ld b, a                           ;$2613
inc b                             ;$2614
ld hl, $c0a0                      ;$2615
push hl                           ;$2618
call $0166                        ;$2619
pop hl                            ;$261c
dec b                             ;$261d
jr nz, $2618                      ;$261e
ld a, $02                         ;$2620
ld [$c0c6], a                     ;$2622
ret                               ;$2625
ld de, $c0a2                      ;$2626
ld hl, $9a25                      ;$2629
call $2a3a                        ;$262c
ld a, $02                         ;$262f
ld [$dfe0], a                     ;$2631
xor a                             ;$2634
ld [$c0c6], a                     ;$2635
ret                               ;$2638
pop de                            ;$2639
ld a, $21                         ;$263a
ldh [$ffa6], a                    ;$263c
xor a                             ;$263e
ld [$c0c6], a                     ;$263f
ld a, [$c0c5]                     ;$2642
inc a                             ;$2645
ld [$c0c5], a                     ;$2646
cp $05                            ;$2649
ret nz                            ;$264b
ld a, $04                         ;$264c
ldh [$ffe1], a                    ;$264e
ret                               ;$2650
ld hl, $c0ac                      ;$2651
ld b, $1b                         ;$2654
xor a                             ;$2656
ldi [hl], a                       ;$2657
dec b                             ;$2658
jr nz, $2657                      ;$2659
ld hl, $c0a0                      ;$265b
ld b, $03                         ;$265e
ldi [hl], a                       ;$2660
dec b                             ;$2661
jr nz, $2660                      ;$2662
ret                               ;$2664
ld a, [hl]                        ;$2665
and a, $f0                        ;$2666
swap a                            ;$2668
ld [de], a                        ;$266a
ld a, [hl]                        ;$266b
and a, $0f                        ;$266c
inc e                             ;$266e
ld [de], a                        ;$266f
ret                               ;$2670
ld a, $02                         ;$2671
ldh [$ff8f], a                    ;$2673
xor a                             ;$2675
ldh [$ff8e], a                    ;$2676
ld a, $c0                         ;$2678
ldh [$ff8d], a                    ;$267a
ld hl, $c200                      ;$267c
call $2a89                        ;$267f
ret                               ;$2682
ld a, $01                         ;$2683
ldh [$ff8f], a                    ;$2685
ld a, $10                         ;$2687
ldh [$ff8e], a                    ;$2689
ld a, $c0                         ;$268b
ldh [$ff8d], a                    ;$268d
ld hl, $c200                      ;$268f
call $2a89                        ;$2692
ret                               ;$2695
ld a, $01                         ;$2696
ldh [$ff8f], a                    ;$2698
ld a, $20                         ;$269a
ldh [$ff8e], a                    ;$269c
ld a, $c0                         ;$269e
ldh [$ff8d], a                    ;$26a0
ld hl, $c210                      ;$26a2
call $2a89                        ;$26a5
ret                               ;$26a8
ld b, $20                         ;$26a9
ld a, $8e                         ;$26ab
ld de, $0020                      ;$26ad
ld [hl], a                        ;$26b0
add hl, de                        ;$26b1
dec b                             ;$26b2
jr nz, $26b0                      ;$26b3
ret                               ;$26b5
ld a, [de]                        ;$26b6
cp $ff                            ;$26b7
ret z                             ;$26b9
ldi [hl], a                       ;$26ba
inc de                            ;$26bb
jr $26b6                          ;$26bc
reti                              ;$26be
nop                               ;$26bf
jr $2701                          ;$26c0
nop                               ;$26c2
add b                             ;$26c3
nop                               ;$26c4
nop                               ;$26c5
rst $38                           ;$26c6
nop                               ;$26c7
add b                             ;$26c8
adc a                             ;$26c9
nop                               ;$26ca
add b                             ;$26cb
nop                               ;$26cc
nop                               ;$26cd
rst $38                           ;$26ce
nop                               ;$26cf
ld [hl], b                        ;$26d0
scf                               ;$26d1
inc e                             ;$26d2
nop                               ;$26d3
nop                               ;$26d4
nop                               ;$26d5
jr c, $270f                       ;$26d6
inc e                             ;$26d8
nop                               ;$26d9
nop                               ;$26da
nop                               ;$26db
ld b, b                           ;$26dc
inc [hl]                          ;$26dd
jr nz, $26e0                      ;$26de
nop                               ;$26e0
nop                               ;$26e1
ld b, b                           ;$26e2
inc e                             ;$26e3
jr nz, $26e6                      ;$26e4
nop                               ;$26e6
nop                               ;$26e7
ld b, b                           ;$26e8
ld [hl], h                        ;$26e9
jr nz, $26ec                      ;$26ea
nop                               ;$26ec
nop                               ;$26ed
ld b, b                           ;$26ee
ld l, b                           ;$26ef
ld hl, $0000                      ;$26f0
nop                               ;$26f3
ld a, b                           ;$26f4
ld l, b                           ;$26f5
ld hl, $0000                      ;$26f6
nop                               ;$26f9
ld h, b                           ;$26fa
ld h, b                           ;$26fb
ldi a, [hl]                       ;$26fc
add b                             ;$26fd
nop                               ;$26fe
nop                               ;$26ff
ld h, b                           ;$2700
ld [hl], d                        ;$2701
ldi a, [hl]                       ;$2702
add b                             ;$2703
jr nz, $2706                      ;$2704
ld l, b                           ;$2706
jr c, $2747                       ;$2707
add b                             ;$2709
nop                               ;$270a
nop                               ;$270b
ld h, b                           ;$270c
ld h, b                           ;$270d
ld [hl], $80                      ;$270e
nop                               ;$2710
nop                               ;$2711
ld h, b                           ;$2712
ld [hl], d                        ;$2713
ld [hl], $80                      ;$2714
jr nz, $2718                      ;$2716
ld l, b                           ;$2718
jr c, $274d                       ;$2719
add b                             ;$271b
nop                               ;$271c
nop                               ;$271d
ld h, b                           ;$271e
ld h, b                           ;$271f
ld l, $80                         ;$2720
nop                               ;$2722
nop                               ;$2723
ld l, b                           ;$2724
jr c, $2763                       ;$2725
add b                             ;$2727
nop                               ;$2728
nop                               ;$2729
ld h, b                           ;$272a
ld h, b                           ;$272b
ldd a, [hl]                       ;$272c
add b                             ;$272d
nop                               ;$272e
nop                               ;$272f
ld l, b                           ;$2730
jr c, $2763                       ;$2731
add b                             ;$2733
nop                               ;$2734
add b                             ;$2735
ccf                               ;$2736
ld b, b                           ;$2737
ld b, h                           ;$2738
nop                               ;$2739
nop                               ;$273a
add b                             ;$273b
ccf                               ;$273c
jr nz, $2789                      ;$273d
nop                               ;$273f
nop                               ;$2740
add b                             ;$2741
ccf                               ;$2742
jr nc, $278b                      ;$2743
nop                               ;$2745
nop                               ;$2746
add b                             ;$2747
ld [hl], a                        ;$2748
jr nz, $2793                      ;$2749
nop                               ;$274b
nop                               ;$274c
add b                             ;$274d
add a                             ;$274e
ld c, b                           ;$274f
ld c, h                           ;$2750
nop                               ;$2751
nop                               ;$2752
add b                             ;$2753
add a                             ;$2754
ld e, b                           ;$2755
ld c, [hl]                        ;$2756
nop                               ;$2757
nop                               ;$2758
add b                             ;$2759
ld h, a                           ;$275a
ld c, l                           ;$275b
ld d, b                           ;$275c
nop                               ;$275d
nop                               ;$275e
add b                             ;$275f
ld h, a                           ;$2760
ld e, l                           ;$2761
ld d, d                           ;$2762
nop                               ;$2763
nop                               ;$2764
add b                             ;$2765
adc a                             ;$2766
adc b                             ;$2767
ld d, h                           ;$2768
nop                               ;$2769
nop                               ;$276a
add b                             ;$276b
adc a                             ;$276c
sbc b                             ;$276d
ld d, l                           ;$276e
nop                               ;$276f
nop                               ;$2770
nop                               ;$2771
ld e, a                           ;$2772
ld d, a                           ;$2773
inc l                             ;$2774
nop                               ;$2775
nop                               ;$2776
add b                             ;$2777
add b                             ;$2778
ld d, b                           ;$2779
inc [hl]                          ;$277a
nop                               ;$277b
nop                               ;$277c
add b                             ;$277d
add b                             ;$277e
ld h, b                           ;$277f
inc [hl]                          ;$2780
nop                               ;$2781
jr nz, $2784                      ;$2782
ld l, a                           ;$2784
ld d, a                           ;$2785
ld e, b                           ;$2786
nop                               ;$2787
nop                               ;$2788
add b                             ;$2789
add b                             ;$278a
ld d, l                           ;$278b
inc [hl]                          ;$278c
nop                               ;$278d
nop                               ;$278e
add b                             ;$278f
add b                             ;$2790
ld e, e                           ;$2791
inc [hl]                          ;$2792
nop                               ;$2793
jr nz, $27b7                      ;$2794
rst $38                           ;$2796
sbc e                             ;$2797
ld bc, $0400                      ;$2798
ld a, $2f                         ;$279b
ldd [hl], a                       ;$279d
dec bc                            ;$279e
ld a, b                           ;$279f
or c                              ;$27a0
jr nz, $279b                      ;$27a1
ret                               ;$27a3
ldi a, [hl]                       ;$27a4
ld [de], a                        ;$27a5
inc de                            ;$27a6
dec bc                            ;$27a7
ld a, b                           ;$27a8
or c                              ;$27a9
jr nz, $27a4                      ;$27aa
ret                               ;$27ac
call $27c3                        ;$27ad
ld bc, $00a0                      ;$27b0
call $27a4                        ;$27b3
ld hl, $323f                      ;$27b6
ld de, $8300                      ;$27b9
ld bc, $0d00                      ;$27bc
call $27a4                        ;$27bf
ret                               ;$27c2
ld hl, $415f                      ;$27c3
ld bc, $0138                      ;$27c6
ld de, $8000                      ;$27c9
ldi a, [hl]                       ;$27cc
ld [de], a                        ;$27cd
inc de                            ;$27ce
ld [de], a                        ;$27cf
inc de                            ;$27d0
dec bc                            ;$27d1
ld a, b                           ;$27d2
or c                              ;$27d3
jr nz, $27cc                      ;$27d4
ret                               ;$27d6
call $27c3                        ;$27d7
ld bc, $0da0                      ;$27da
call $27a4                        ;$27dd
ret                               ;$27e0
ld bc, $1000                      ;$27e1
ld de, $8000                      ;$27e4
call $27a4                        ;$27e7
ret                               ;$27ea
ld hl, $9800                      ;$27eb
ld b, $12                         ;$27ee
push hl                           ;$27f0
ld c, $14                         ;$27f1
ld a, [de]                        ;$27f3
ldi [hl], a                       ;$27f4
inc de                            ;$27f5
dec c                             ;$27f6
jr nz, $27f3                      ;$27f7
pop hl                            ;$27f9
push de                           ;$27fa
ld de, $0020                      ;$27fb
add hl, de                        ;$27fe
pop de                            ;$27ff
dec b                             ;$2800
jr nz, $27f0                      ;$2801
ret                               ;$2803
ld b, $0a                         ;$2804
push hl                           ;$2806
ld a, [de]                        ;$2807
cp $ff                            ;$2808
jr z, $281a                       ;$280a
ldi [hl], a                       ;$280c
inc de                            ;$280d
dec b                             ;$280e
jr nz, $2807                      ;$280f
pop hl                            ;$2811
push de                           ;$2812
ld de, $0020                      ;$2813
add hl, de                        ;$2816
pop de                            ;$2817
jr $2804                          ;$2818
pop hl                            ;$281a
ld a, $02                         ;$281b
ldh [$ffe3], a                    ;$281d
ret                               ;$281f
ldh a, [$ffff]                    ;$2820
ldh [$ffa1], a                    ;$2822
res 0, a                          ;$2824
ldh [$ffff], a                    ;$2826
ldh a, [$ff44]                    ;$2828
cp $91                            ;$282a
jr nz, $2828                      ;$282c
ldh a, [$ff40]                    ;$282e
and a, $7f                        ;$2830
ldh [$ff40], a                    ;$2832
ldh a, [$ffa1]                    ;$2834
ldh [$ffff], a                    ;$2836
ret                               ;$2838
cpl                               ;$2839
cpl                               ;$283a
ld de, $1d12                      ;$283b
cpl                               ;$283e
cpl                               ;$283f
cpl                               ;$2840
cpl                               ;$2841
cpl                               ;$2842
add hl, hl                        ;$2843
add hl, hl                        ;$2844
add hl, hl                        ;$2845
cpl                               ;$2846
cpl                               ;$2847
cpl                               ;$2848
cpl                               ;$2849
inc e                             ;$284a
dec e                             ;$284b
ld a, [bc]                        ;$284c
dec de                            ;$284d
dec e                             ;$284e
cpl                               ;$284f
cpl                               ;$2850
cpl                               ;$2851
add hl, hl                        ;$2852
add hl, hl                        ;$2853
add hl, hl                        ;$2854
add hl, hl                        ;$2855
add hl, hl                        ;$2856
cpl                               ;$2857
cpl                               ;$2858
cpl                               ;$2859
cpl                               ;$285a
cpl                               ;$285b
dec e                             ;$285c
jr $288e                          ;$285d
cpl                               ;$285f
cpl                               ;$2860
cpl                               ;$2861
cpl                               ;$2862
cpl                               ;$2863
add hl, hl                        ;$2864
add hl, hl                        ;$2865
cpl                               ;$2866
cpl                               ;$2867
cpl                               ;$2868
inc c                             ;$2869
jr $2883                          ;$286a
dec e                             ;$286c
ld [de], a                        ;$286d
rla                               ;$286e
ld e, $0e                         ;$286f
add hl, hl                        ;$2871
add hl, hl                        ;$2872
add hl, hl                        ;$2873
add hl, hl                        ;$2874
add hl, hl                        ;$2875
add hl, hl                        ;$2876
add hl, hl                        ;$2877
add hl, hl                        ;$2878
cpl                               ;$2879
cpl                               ;$287a
db $10 ;<corrupted stop>          ;$287b
ld a, [bc]                        ;$287c
ld d, $0e                         ;$287d
cpl                               ;$287f
cpl                               ;$2880
cpl                               ;$2881
cpl                               ;$2882
add hl, hl                        ;$2883
add hl, hl                        ;$2884
add hl, hl                        ;$2885
add hl, hl                        ;$2886
cpl                               ;$2887
cpl                               ;$2888
inc e                             ;$2889
ld [de], a                        ;$288a
rla                               ;$288b
db $10 ;<corrupted stop>          ;$288c
dec d                             ;$288d
ld c, $2f                         ;$288e
cpl                               ;$2890
cpl                               ;$2891
cpl                               ;$2892
cpl                               ;$2893
nop                               ;$2894
cpl                               ;$2895
ld h, $2f                         ;$2896
inc b                             ;$2898
nop                               ;$2899
cpl                               ;$289a
cpl                               ;$289b
cpl                               ;$289c
cpl                               ;$289d
cpl                               ;$289e
cpl                               ;$289f
cpl                               ;$28a0
cpl                               ;$28a1
cpl                               ;$28a2
cpl                               ;$28a3
cpl                               ;$28a4
nop                               ;$28a5
cpl                               ;$28a6
dec c                             ;$28a7
jr $28c8                          ;$28a8
dec bc                            ;$28aa
dec d                             ;$28ab
ld c, $2f                         ;$28ac
cpl                               ;$28ae
cpl                               ;$28af
cpl                               ;$28b0
cpl                               ;$28b1
nop                               ;$28b2
cpl                               ;$28b3
ld h, $2f                         ;$28b4
ld bc, $0000                      ;$28b6
cpl                               ;$28b9
cpl                               ;$28ba
cpl                               ;$28bb
cpl                               ;$28bc
cpl                               ;$28bd
cpl                               ;$28be
cpl                               ;$28bf
cpl                               ;$28c0
cpl                               ;$28c1
cpl                               ;$28c2
nop                               ;$28c3
cpl                               ;$28c4
dec e                             ;$28c5
dec de                            ;$28c6
ld [de], a                        ;$28c7
add hl, de                        ;$28c8
dec d                             ;$28c9
ld c, $2f                         ;$28ca
cpl                               ;$28cc
cpl                               ;$28cd
cpl                               ;$28ce
cpl                               ;$28cf
nop                               ;$28d0
cpl                               ;$28d1
ld h, $2f                         ;$28d2
inc bc                            ;$28d4
nop                               ;$28d5
nop                               ;$28d6
cpl                               ;$28d7
cpl                               ;$28d8
cpl                               ;$28d9
cpl                               ;$28da
cpl                               ;$28db
cpl                               ;$28dc
cpl                               ;$28dd
cpl                               ;$28de
cpl                               ;$28df
cpl                               ;$28e0
nop                               ;$28e1
cpl                               ;$28e2
dec e                             ;$28e3
ld c, $1d                         ;$28e4
dec de                            ;$28e6
ld [de], a                        ;$28e7
inc e                             ;$28e8
cpl                               ;$28e9
cpl                               ;$28ea
cpl                               ;$28eb
cpl                               ;$28ec
cpl                               ;$28ed
nop                               ;$28ee
cpl                               ;$28ef
ld h, $2f                         ;$28f0
ld bc, $0002                      ;$28f2
nop                               ;$28f5
cpl                               ;$28f6
cpl                               ;$28f7
cpl                               ;$28f8
cpl                               ;$28f9
cpl                               ;$28fa
cpl                               ;$28fb
cpl                               ;$28fc
cpl                               ;$28fd
cpl                               ;$28fe
nop                               ;$28ff
cpl                               ;$2900
dec c                             ;$2901
dec de                            ;$2902
jr $291e                          ;$2903
inc e                             ;$2905
cpl                               ;$2906
cpl                               ;$2907
cpl                               ;$2908
cpl                               ;$2909
cpl                               ;$290a
cpl                               ;$290b
cpl                               ;$290c
cpl                               ;$290d
cpl                               ;$290e
cpl                               ;$290f
cpl                               ;$2910
cpl                               ;$2911
cpl                               ;$2912
nop                               ;$2913
cpl                               ;$2914
cpl                               ;$2915
cpl                               ;$2916
cpl                               ;$2917
cpl                               ;$2918
cpl                               ;$2919
cpl                               ;$291a
cpl                               ;$291b
cpl                               ;$291c
cpl                               ;$291d
cpl                               ;$291e
add hl, hl                        ;$291f
add hl, hl                        ;$2920
add hl, hl                        ;$2921
add hl, hl                        ;$2922
add hl, hl                        ;$2923
add hl, hl                        ;$2924
add hl, hl                        ;$2925
add hl, hl                        ;$2926
add hl, hl                        ;$2927
add hl, hl                        ;$2928
dec e                             ;$2929
ld de, $1c12                      ;$292a
cpl                               ;$292d
inc e                             ;$292e
dec e                             ;$292f
ld a, [bc]                        ;$2930
db $10 ;<corrupted stop>          ;$2931
ld c, $2f                         ;$2932
cpl                               ;$2934
cpl                               ;$2935
cpl                               ;$2936
cpl                               ;$2937
cpl                               ;$2938
cpl                               ;$2939
cpl                               ;$293a
nop                               ;$293b
cpl                               ;$293c
rst $38                           ;$293d
ld h, c                           ;$293e
ld h, d                           ;$293f
ld h, d                           ;$2940
ld h, d                           ;$2941
ld h, d                           ;$2942
ld h, d                           ;$2943
ld h, d                           ;$2944
ld h, e                           ;$2945
ld h, h                           ;$2946
cpl                               ;$2947
cpl                               ;$2948
cpl                               ;$2949
cpl                               ;$294a
cpl                               ;$294b
cpl                               ;$294c
ld h, l                           ;$294d
ld h, h                           ;$294e
cpl                               ;$294f
db $10 ;<corrupted stop>          ;$2950
ld a, [bc]                        ;$2951
ld d, $0e                         ;$2952
cpl                               ;$2954
ld h, l                           ;$2955
ld h, h                           ;$2956
cpl                               ;$2957
xor l                             ;$2958
xor l                             ;$2959
xor l                             ;$295a
xor l                             ;$295b
cpl                               ;$295c
ld h, l                           ;$295d
ld h, h                           ;$295e
cpl                               ;$295f
jr $2981                          ;$2960
ld c, $1b                         ;$2962
cpl                               ;$2964
ld h, l                           ;$2965
ld h, h                           ;$2966
cpl                               ;$2967
xor l                             ;$2968
xor l                             ;$2969
xor l                             ;$296a
xor l                             ;$296b
cpl                               ;$296c
ld h, l                           ;$296d
ld h, [hl]                        ;$296e
ld l, c                           ;$296f
ld l, c                           ;$2970
ld l, c                           ;$2971
ld l, c                           ;$2972
ld l, c                           ;$2973
ld l, c                           ;$2974
ld l, d                           ;$2975
add hl, de                        ;$2976
dec d                             ;$2977
ld c, $0a                         ;$2978
inc e                             ;$297a
ld c, $2f                         ;$297b
cpl                               ;$297d
add hl, hl                        ;$297e
add hl, hl                        ;$297f
add hl, hl                        ;$2980
add hl, hl                        ;$2981
add hl, hl                        ;$2982
add hl, hl                        ;$2983
cpl                               ;$2984
cpl                               ;$2985
cpl                               ;$2986
dec e                             ;$2987
dec de                            ;$2988
ldi [hl], a                       ;$2989
cpl                               ;$298a
cpl                               ;$298b
cpl                               ;$298c
cpl                               ;$298d
cpl                               ;$298e
add hl, hl                        ;$298f
add hl, hl                        ;$2990
add hl, hl                        ;$2991
cpl                               ;$2992
cpl                               ;$2993
cpl                               ;$2994
cpl                               ;$2995
cpl                               ;$2996
cpl                               ;$2997
ld a, [bc]                        ;$2998
db $10 ;<corrupted stop>          ;$2999
ld a, [bc]                        ;$299a
ld [de], a                        ;$299b
rla                               ;$299c
daa                               ;$299d
cpl                               ;$299e
cpl                               ;$299f
add hl, hl                        ;$29a0
add hl, hl                        ;$29a1
add hl, hl                        ;$29a2
add hl, hl                        ;$29a3
add hl, hl                        ;$29a4
cpl                               ;$29a5
ld a, $20                         ;$29a6
ldh [$ff00], a                    ;$29a8
ldh a, [$ff00]                    ;$29aa
ldh a, [$ff00]                    ;$29ac
ldh a, [$ff00]                    ;$29ae
ldh a, [$ff00]                    ;$29b0
cpl                               ;$29b2
and a, $0f                        ;$29b3
swap a                            ;$29b5
ld b, a                           ;$29b7
ld a, $10                         ;$29b8
ldh [$ff00], a                    ;$29ba
ldh a, [$ff00]                    ;$29bc
ldh a, [$ff00]                    ;$29be
ldh a, [$ff00]                    ;$29c0
ldh a, [$ff00]                    ;$29c2
ldh a, [$ff00]                    ;$29c4
ldh a, [$ff00]                    ;$29c6
ldh a, [$ff00]                    ;$29c8
ldh a, [$ff00]                    ;$29ca
ldh a, [$ff00]                    ;$29cc
ldh a, [$ff00]                    ;$29ce
cpl                               ;$29d0
and a, $0f                        ;$29d1
or b                              ;$29d3
ld c, a                           ;$29d4
ldh a, [$ff80]                    ;$29d5
xor c                             ;$29d7
and c                             ;$29d8
ldh [$ff81], a                    ;$29d9
ld a, c                           ;$29db
ldh [$ff80], a                    ;$29dc
ld a, $30                         ;$29de
ldh [$ff00], a                    ;$29e0
ret                               ;$29e2
ldh a, [$ffb2]                    ;$29e3
sub a, $10                        ;$29e5
srl a                             ;$29e7
srl a                             ;$29e9
srl a                             ;$29eb
ld de, $0000                      ;$29ed
ld e, a                           ;$29f0
ld hl, $9800                      ;$29f1
ld b, $20                         ;$29f4
add hl, de                        ;$29f6
dec b                             ;$29f7
jr nz, $29f6                      ;$29f8
ldh a, [$ffb3]                    ;$29fa
sub a, $08                        ;$29fc
srl a                             ;$29fe
srl a                             ;$2a00
srl a                             ;$2a02
ld de, $0000                      ;$2a04
ld e, a                           ;$2a07
add hl, de                        ;$2a08
ld a, h                           ;$2a09
ldh [$ffb5], a                    ;$2a0a
ld a, l                           ;$2a0c
ldh [$ffb4], a                    ;$2a0d
ret                               ;$2a0f
ldh a, [$ffb5]                    ;$2a10
ld d, a                           ;$2a12
ldh a, [$ffb4]                    ;$2a13
ld e, a                           ;$2a15
ld b, $04                         ;$2a16
rr d                              ;$2a18
rr e                              ;$2a1a
dec b                             ;$2a1c
jr nz, $2a18                      ;$2a1d
ld a, e                           ;$2a1f
sub a, $84                        ;$2a20
and a, $fe                        ;$2a22
rlca                              ;$2a24
rlca                              ;$2a25
add a, $08                        ;$2a26
ldh [$ffb2], a                    ;$2a28
ldh a, [$ffb4]                    ;$2a2a
and a, $1f                        ;$2a2c
rla                               ;$2a2e
rla                               ;$2a2f
rla                               ;$2a30
add a, $08                        ;$2a31
ldh [$ffb3], a                    ;$2a33
ret                               ;$2a35
ldh a, [$ffe0]                    ;$2a36
and a                             ;$2a38
ret z                             ;$2a39
ld c, $03                         ;$2a3a
xor a                             ;$2a3c
ldh [$ffe0], a                    ;$2a3d
ld a, [de]                        ;$2a3f
ld b, a                           ;$2a40
swap a                            ;$2a41
and a, $0f                        ;$2a43
jr nz, $2a6f                      ;$2a45
ldh a, [$ffe0]                    ;$2a47
and a                             ;$2a49
ld a, $00                         ;$2a4a
jr nz, $2a50                      ;$2a4c
ld a, $2f                         ;$2a4e
ldi [hl], a                       ;$2a50
ld a, b                           ;$2a51
and a, $0f                        ;$2a52
jr nz, $2a77                      ;$2a54
ldh a, [$ffe0]                    ;$2a56
and a                             ;$2a58
ld a, $00                         ;$2a59
jr nz, $2a66                      ;$2a5b
ld a, $01                         ;$2a5d
cp c                              ;$2a5f
ld a, $00                         ;$2a60
jr z, $2a66                       ;$2a62
ld a, $2f                         ;$2a64
ldi [hl], a                       ;$2a66
dec e                             ;$2a67
dec c                             ;$2a68
jr nz, $2a3f                      ;$2a69
xor a                             ;$2a6b
ldh [$ffe0], a                    ;$2a6c
ret                               ;$2a6e
push af                           ;$2a6f
ld a, $01                         ;$2a70
ldh [$ffe0], a                    ;$2a72
pop af                            ;$2a74
jr $2a50                          ;$2a75
push af                           ;$2a77
ld a, $01                         ;$2a78
ldh [$ffe0], a                    ;$2a7a
pop af                            ;$2a7c
jr $2a66                          ;$2a7d
ld a, $c0                         ;$2a7f
ldh [$ff46], a                    ;$2a81
ld a, $28                         ;$2a83
dec a                             ;$2a85
jr nz, $2a85                      ;$2a86
ret                               ;$2a88
ld a, h                           ;$2a89
ldh [$ff96], a                    ;$2a8a
ld a, l                           ;$2a8c
ldh [$ff97], a                    ;$2a8d
ld a, [hl]                        ;$2a8f
and a                             ;$2a90
jr z, $2ab0                       ;$2a91
cp $80                            ;$2a93
jr z, $2aae                       ;$2a95
ldh a, [$ff96]                    ;$2a97
ld h, a                           ;$2a99
ldh a, [$ff97]                    ;$2a9a
ld l, a                           ;$2a9c
ld de, $0010                      ;$2a9d
add hl, de                        ;$2aa0
ldh a, [$ff8f]                    ;$2aa1
dec a                             ;$2aa3
ldh [$ff8f], a                    ;$2aa4
ret z                             ;$2aa6
jr $2a89                          ;$2aa7
xor a                             ;$2aa9
ldh [$ff95], a                    ;$2aaa
jr $2a97                          ;$2aac
ldh [$ff95], a                    ;$2aae
ld b, $07                         ;$2ab0
ld de, $ff86                      ;$2ab2
ldi a, [hl]                       ;$2ab5
ld [de], a                        ;$2ab6
inc de                            ;$2ab7
dec b                             ;$2ab8
jr nz, $2ab5                      ;$2ab9
ldh a, [$ff89]                    ;$2abb
ld hl, $2b64                      ;$2abd
rlca                              ;$2ac0
ld e, a                           ;$2ac1
ld d, $00                         ;$2ac2
add hl, de                        ;$2ac4
ld e, [hl]                        ;$2ac5
inc hl                            ;$2ac6
ld d, [hl]                        ;$2ac7
ld a, [de]                        ;$2ac8
ld l, a                           ;$2ac9
inc de                            ;$2aca
ld a, [de]                        ;$2acb
ld h, a                           ;$2acc
inc de                            ;$2acd
ld a, [de]                        ;$2ace
ldh [$ff90], a                    ;$2acf
inc de                            ;$2ad1
ld a, [de]                        ;$2ad2
ldh [$ff91], a                    ;$2ad3
ld e, [hl]                        ;$2ad5
inc hl                            ;$2ad6
ld d, [hl]                        ;$2ad7
inc hl                            ;$2ad8
ldh a, [$ff8c]                    ;$2ad9
ldh [$ff94], a                    ;$2adb
ld a, [hl]                        ;$2add
cp $ff                            ;$2ade
jr z, $2aa9                       ;$2ae0
cp $fd                            ;$2ae2
jr nz, $2af4                      ;$2ae4
ldh a, [$ff8c]                    ;$2ae6
xor $20                           ;$2ae8
ldh [$ff94], a                    ;$2aea
inc hl                            ;$2aec
ld a, [hl]                        ;$2aed
jr $2af8                          ;$2aee
inc de                            ;$2af0
inc de                            ;$2af1
jr $2ad8                          ;$2af2
cp $fe                            ;$2af4
jr z, $2af0                       ;$2af6
ldh [$ff89], a                    ;$2af8
ldh a, [$ff87]                    ;$2afa
ld b, a                           ;$2afc
ld a, [de]                        ;$2afd
ld c, a                           ;$2afe
ldh a, [$ff8b]                    ;$2aff
bit 6, a                          ;$2b01
jr nz, $2b0b                      ;$2b03
ldh a, [$ff90]                    ;$2b05
add b                             ;$2b07
adc c                             ;$2b08
jr $2b15                          ;$2b09
ld a, b                           ;$2b0b
push af                           ;$2b0c
ldh a, [$ff90]                    ;$2b0d
ld b, a                           ;$2b0f
pop af                            ;$2b10
sub b                             ;$2b11
sbc c                             ;$2b12
sbc a, $08                        ;$2b13
ldh [$ff93], a                    ;$2b15
ldh a, [$ff88]                    ;$2b17
ld b, a                           ;$2b19
inc de                            ;$2b1a
ld a, [de]                        ;$2b1b
inc de                            ;$2b1c
ld c, a                           ;$2b1d
ldh a, [$ff8b]                    ;$2b1e
bit 5, a                          ;$2b20
jr nz, $2b2a                      ;$2b22
ldh a, [$ff91]                    ;$2b24
add b                             ;$2b26
adc c                             ;$2b27
jr $2b34                          ;$2b28
ld a, b                           ;$2b2a
push af                           ;$2b2b
ldh a, [$ff91]                    ;$2b2c
ld b, a                           ;$2b2e
pop af                            ;$2b2f
sub b                             ;$2b30
sbc c                             ;$2b31
sbc a, $08                        ;$2b32
ldh [$ff92], a                    ;$2b34
push hl                           ;$2b36
ldh a, [$ff8d]                    ;$2b37
ld h, a                           ;$2b39
ldh a, [$ff8e]                    ;$2b3a
ld l, a                           ;$2b3c
ldh a, [$ff95]                    ;$2b3d
and a                             ;$2b3f
jr z, $2b46                       ;$2b40
ld a, $ff                         ;$2b42
jr $2b48                          ;$2b44
ldh a, [$ff93]                    ;$2b46
ldi [hl], a                       ;$2b48
ldh a, [$ff92]                    ;$2b49
ldi [hl], a                       ;$2b4b
ldh a, [$ff89]                    ;$2b4c
ldi [hl], a                       ;$2b4e
ldh a, [$ff94]                    ;$2b4f
ld b, a                           ;$2b51
ldh a, [$ff8b]                    ;$2b52
or b                              ;$2b54
ld b, a                           ;$2b55
ldh a, [$ff8a]                    ;$2b56
or b                              ;$2b58
ldi [hl], a                       ;$2b59
ld a, h                           ;$2b5a
ldh [$ff8d], a                    ;$2b5b
ld a, l                           ;$2b5d
ldh [$ff8e], a                    ;$2b5e
pop hl                            ;$2b60
jp $2ad8                          ;$2b61
jr nz, $2b92                      ;$2b64
inc h                             ;$2b66
inc l                             ;$2b67
jr z, $2b96                       ;$2b68
inc l                             ;$2b6a
inc l                             ;$2b6b
jr nc, $2b9a                      ;$2b6c
inc [hl]                          ;$2b6e
inc l                             ;$2b6f
jr c, $2b9e                       ;$2b70
inc a                             ;$2b72
inc l                             ;$2b73
ld b, b                           ;$2b74
inc l                             ;$2b75
ld b, h                           ;$2b76
inc l                             ;$2b77
ld c, b                           ;$2b78
inc l                             ;$2b79
ld c, h                           ;$2b7a
inc l                             ;$2b7b
ld d, b                           ;$2b7c
inc l                             ;$2b7d
ld d, h                           ;$2b7e
inc l                             ;$2b7f
ld e, b                           ;$2b80
inc l                             ;$2b81
ld e, h                           ;$2b82
inc l                             ;$2b83
ld h, b                           ;$2b84
inc l                             ;$2b85
ld h, h                           ;$2b86
inc l                             ;$2b87
ld l, b                           ;$2b88
inc l                             ;$2b89
ld l, h                           ;$2b8a
inc l                             ;$2b8b
ld [hl], b                        ;$2b8c
inc l                             ;$2b8d
ld [hl], h                        ;$2b8e
inc l                             ;$2b8f
ld a, b                           ;$2b90
inc l                             ;$2b91
ld a, h                           ;$2b92
inc l                             ;$2b93
add b                             ;$2b94
inc l                             ;$2b95
add h                             ;$2b96
inc l                             ;$2b97
adc b                             ;$2b98
inc l                             ;$2b99
adc h                             ;$2b9a
inc l                             ;$2b9b
sub b                             ;$2b9c
inc l                             ;$2b9d
sub h                             ;$2b9e
inc l                             ;$2b9f
sbc b                             ;$2ba0
inc l                             ;$2ba1
sbc h                             ;$2ba2
inc l                             ;$2ba3
and b                             ;$2ba4
inc l                             ;$2ba5
and h                             ;$2ba6
inc l                             ;$2ba7
xor b                             ;$2ba8
inc l                             ;$2ba9
xor h                             ;$2baa
inc l                             ;$2bab
or b                              ;$2bac
inc l                             ;$2bad
or h                              ;$2bae
inc l                             ;$2baf
cp b                              ;$2bb0
inc l                             ;$2bb1
cp h                              ;$2bb2
inc l                             ;$2bb3
ret nz                            ;$2bb4
inc l                             ;$2bb5
call nz, $c82c                    ;$2bb6
inc l                             ;$2bb9
call z, $c72c                     ;$2bba
jr nc, $2b8b                      ;$2bbd
inc l                             ;$2bbf
ret nc                            ;$2bc0
inc l                             ;$2bc1
call nc, $d82c                    ;$2bc2
inc l                             ;$2bc5
call c, $e02c                     ;$2bc6
inc l                             ;$2bc9
db $e4 ;<unknown instruction>     ;$2bca
inc l                             ;$2bcb
ld [$ee30], a                     ;$2bcc
jr nc, $2bb9                      ;$2bcf
inc l                             ;$2bd1
db $ec ;<unknown instruction>     ;$2bd2
inc l                             ;$2bd3
ld a, [$ff00+c]                   ;$2bd4
jr nc, $2bcd                      ;$2bd5
jr nc, $2bc9                      ;$2bd7
inc l                             ;$2bd9
db $f4 ;<unknown instruction>     ;$2bda
inc l                             ;$2bdb
ld hl, sp+$2c                     ;$2bdc
db $fc ;<unknown instruction>     ;$2bde
inc l                             ;$2bdf
nop                               ;$2be0
dec l                             ;$2be1
inc b                             ;$2be2
dec l                             ;$2be3
ld a, [$fe30]                     ;$2be4
jr nc, $2bed                      ;$2be7
dec l                             ;$2be9
ld [$082d], sp                    ;$2bea
dec l                             ;$2bed
inc c                             ;$2bee
dec l                             ;$2bef
db $10 ;<corrupted stop>          ;$2bf0
dec l                             ;$2bf1
inc d                             ;$2bf2
dec l                             ;$2bf3
jr $2c23                          ;$2bf4
inc e                             ;$2bf6
dec l                             ;$2bf7
jr nz, $2c27                      ;$2bf8
inc h                             ;$2bfa
dec l                             ;$2bfb
jr z, $2c2b                       ;$2bfc
inc l                             ;$2bfe
dec l                             ;$2bff
jr nc, $2c2f                      ;$2c00
inc [hl]                          ;$2c02
dec l                             ;$2c03
jr c, $2c33                       ;$2c04
inc a                             ;$2c06
dec l                             ;$2c07
ld b, b                           ;$2c08
dec l                             ;$2c09
ld b, h                           ;$2c0a
dec l                             ;$2c0b
ld c, b                           ;$2c0c
dec l                             ;$2c0d
ld c, h                           ;$2c0e
dec l                             ;$2c0f
ld d, b                           ;$2c10
dec l                             ;$2c11
ld d, h                           ;$2c12
dec l                             ;$2c13
ld a, [bc]                        ;$2c14
ld sp, $310e                      ;$2c15
ld [de], a                        ;$2c18
ld sp, $3112                      ;$2c19
ld [bc], a                        ;$2c1c
ld sp, $3106                      ;$2c1d
ld e, b                           ;$2c20
dec l                             ;$2c21
rst $28                           ;$2c22
ldh a, [$ff68]                    ;$2c23
dec l                             ;$2c25
rst $28                           ;$2c26
ldh a, [$ff7a]                    ;$2c27
dec l                             ;$2c29
rst $28                           ;$2c2a
ldh a, [$ff89]                    ;$2c2b
dec l                             ;$2c2d
rst $28                           ;$2c2e
ldh a, [$ff9a]                    ;$2c2f
dec l                             ;$2c31
rst $28                           ;$2c32
ldh a, [$ffac]                    ;$2c33
dec l                             ;$2c35
rst $28                           ;$2c36
ldh a, [$ffbd]                    ;$2c37
dec l                             ;$2c39
rst $28                           ;$2c3a
ldh a, [$ffcb]                    ;$2c3b
dec l                             ;$2c3d
rst $28                           ;$2c3e
ldh a, [$ffdc]                    ;$2c3f
dec l                             ;$2c41
rst $28                           ;$2c42
ldh a, [$ffeb]                    ;$2c43
dec l                             ;$2c45
rst $28                           ;$2c46
ldh a, [$fffc]                    ;$2c47
dec l                             ;$2c49
rst $28                           ;$2c4a
ldh a, [$ff0b]                    ;$2c4b
ld l, $ef                         ;$2c4d
ldh a, [$ff1c]                    ;$2c4f
ld l, $ef                         ;$2c51
ldh a, [$ff2e]                    ;$2c53
ld l, $ef                         ;$2c55
ldh a, [$ff40]                    ;$2c57
ld l, $ef                         ;$2c59
ldh a, [$ff52]                    ;$2c5b
ld l, $ef                         ;$2c5d
ldh a, [$ff64]                    ;$2c5f
ld l, $ef                         ;$2c61
ldh a, [$ff76]                    ;$2c63
ld l, $ef                         ;$2c65
ldh a, [$ff86]                    ;$2c67
ld l, $ef                         ;$2c69
ldh a, [$ff98]                    ;$2c6b
ld l, $ef                         ;$2c6d
ldh a, [$ffa8]                    ;$2c6f
ld l, $ef                         ;$2c71
ldh a, [$ffb9]                    ;$2c73
ld l, $ef                         ;$2c75
ldh a, [$ffca]                    ;$2c77
ld l, $ef                         ;$2c79
ldh a, [$ffdb]                    ;$2c7b
ld l, $ef                         ;$2c7d
ldh a, [$ff0b]                    ;$2c7f
cpl                               ;$2c81
rst $28                           ;$2c82
ldh a, [$ff1c]                    ;$2c83
cpl                               ;$2c85
rst $28                           ;$2c86
ldh a, [$ffec]                    ;$2c87
ld l, $ef                         ;$2c89
ldh a, [$fffa]                    ;$2c8b
ld l, $ef                         ;$2c8d
ldh a, [$ff2d]                    ;$2c8f
cpl                               ;$2c91
nop                               ;$2c92
add sp, $36                       ;$2c93
cpl                               ;$2c95
nop                               ;$2c96
add sp, $3f                       ;$2c97
cpl                               ;$2c99
nop                               ;$2c9a
add sp, $48                       ;$2c9b
cpl                               ;$2c9d
nop                               ;$2c9e
add sp, $51                       ;$2c9f
cpl                               ;$2ca1
nop                               ;$2ca2
nop                               ;$2ca3
ld d, l                           ;$2ca4
cpl                               ;$2ca5
nop                               ;$2ca6
nop                               ;$2ca7
ld e, c                           ;$2ca8
cpl                               ;$2ca9
nop                               ;$2caa
nop                               ;$2cab
ld e, l                           ;$2cac
cpl                               ;$2cad
nop                               ;$2cae
nop                               ;$2caf
ld h, c                           ;$2cb0
cpl                               ;$2cb1
nop                               ;$2cb2
nop                               ;$2cb3
ld h, l                           ;$2cb4
cpl                               ;$2cb5
nop                               ;$2cb6
nop                               ;$2cb7
ld l, c                           ;$2cb8
cpl                               ;$2cb9
nop                               ;$2cba
nop                               ;$2cbb
ld l, l                           ;$2cbc
cpl                               ;$2cbd
nop                               ;$2cbe
nop                               ;$2cbf
ld [hl], c                        ;$2cc0
cpl                               ;$2cc1
nop                               ;$2cc2
nop                               ;$2cc3
ld [hl], l                        ;$2cc4
cpl                               ;$2cc5
nop                               ;$2cc6
nop                               ;$2cc7
ld a, c                           ;$2cc8
cpl                               ;$2cc9
ldh a, [$fff8]                    ;$2cca
add h                             ;$2ccc
cpl                               ;$2ccd
ldh a, [$fff8]                    ;$2cce
adc a                             ;$2cd0
cpl                               ;$2cd1
ldh a, [$fff0]                    ;$2cd2
and e                             ;$2cd4
cpl                               ;$2cd5
ldh a, [$fff0]                    ;$2cd6
cp b                              ;$2cd8
cpl                               ;$2cd9
ld hl, sp+$f8                     ;$2cda
pop bc                            ;$2cdc
cpl                               ;$2cdd
ld hl, sp+$f8                     ;$2cde
jp z, $f82f                       ;$2ce0
ld hl, sp+$d1                     ;$2ce3
cpl                               ;$2ce5
ld hl, sp+$f8                     ;$2ce6
ret c                             ;$2ce8
cpl                               ;$2ce9
ldh a, [$fff8]                    ;$2cea
db $e3 ;<unknown instruction>     ;$2cec
cpl                               ;$2ced
ldh a, [$fff8]                    ;$2cee
xor $2f                           ;$2cf0
ldh a, [$fff0]                    ;$2cf2
inc bc                            ;$2cf4
jr nc, $2ce7                      ;$2cf5
ldh a, [$ff19]                    ;$2cf7
jr nc, $2cf3                      ;$2cf9
ld hl, sp+$22                     ;$2cfb
jr nc, $2cf7                      ;$2cfd
ld hl, sp+$2b                     ;$2cff
jr nc, $2cfb                      ;$2d01
ld hl, sp+$32                     ;$2d03
jr nc, $2cff                      ;$2d05
ld hl, sp+$39                     ;$2d07
jr nc, $2d03                      ;$2d09
ld hl, sp+$40                     ;$2d0b
jr nc, $2d07                      ;$2d0d
ld hl, sp+$47                     ;$2d0f
jr nc, $2d0b                      ;$2d11
ld hl, sp+$4e                     ;$2d13
jr nc, $2d0f                      ;$2d15
ld hl, sp+$55                     ;$2d17
jr nc, $2d13                      ;$2d19
ld hl, sp+$5c                     ;$2d1b
jr nc, $2d17                      ;$2d1d
ld hl, sp+$67                     ;$2d1f
jr nc, $2d1b                      ;$2d21
ld hl, sp+$6e                     ;$2d23
jr nc, $2d1f                      ;$2d25
ld hl, sp+$75                     ;$2d27
jr nc, $2d23                      ;$2d29
ld hl, sp+$7c                     ;$2d2b
jr nc, $2d27                      ;$2d2d
ld hl, sp+$83                     ;$2d2f
jr nc, $2d2b                      ;$2d31
ld hl, sp+$8c                     ;$2d33
jr nc, $2d2f                      ;$2d35
ld hl, sp+$95                     ;$2d37
jr nc, $2d33                      ;$2d39
ld hl, sp+$9e                     ;$2d3b
jr nc, $2d37                      ;$2d3d
ld hl, sp+$a7                     ;$2d3f
jr nc, $2d3b                      ;$2d41
ld hl, sp+$b0                     ;$2d43
jr nc, $2d3f                      ;$2d45
ld hl, sp+$b9                     ;$2d47
jr nc, $2d43                      ;$2d49
ld hl, sp+$c0                     ;$2d4b
jr nc, $2d47                      ;$2d4d
ld hl, sp+$46                     ;$2d4f
ld sp, $f0f0                      ;$2d51
ld e, l                           ;$2d54
ld sp, $f8f8                      ;$2d55
xor c                             ;$2d58
ld sp, $fefe                      ;$2d59
cp $fe                            ;$2d5c
cp $fe                            ;$2d5e
cp $fe                            ;$2d60
add h                             ;$2d62
add h                             ;$2d63
add h                             ;$2d64
cp $84                            ;$2d65
rst $38                           ;$2d67
xor c                             ;$2d68
ld sp, $fefe                      ;$2d69
cp $fe                            ;$2d6c
cp $84                            ;$2d6e
cp $fe                            ;$2d70
cp $84                            ;$2d72
cp $fe                            ;$2d74
cp $84                            ;$2d76
add h                             ;$2d78
rst $38                           ;$2d79
xor c                             ;$2d7a
ld sp, $fefe                      ;$2d7b
cp $fe                            ;$2d7e
cp $fe                            ;$2d80
add h                             ;$2d82
cp $84                            ;$2d83
add h                             ;$2d85
add h                             ;$2d86
cp $ff                            ;$2d87
xor c                             ;$2d89
ld sp, $fefe                      ;$2d8a
cp $fe                            ;$2d8d
add h                             ;$2d8f
add h                             ;$2d90
cp $fe                            ;$2d91
cp $84                            ;$2d93
cp $fe                            ;$2d95
cp $84                            ;$2d97
rst $38                           ;$2d99
xor c                             ;$2d9a
ld sp, $fefe                      ;$2d9b
cp $fe                            ;$2d9e
cp $fe                            ;$2da0
cp $fe                            ;$2da2
add c                             ;$2da4
add c                             ;$2da5
add c                             ;$2da6
cp $fe                            ;$2da7
cp $81                            ;$2da9
rst $38                           ;$2dab
xor c                             ;$2dac
ld sp, $fefe                      ;$2dad
cp $fe                            ;$2db0
cp $81                            ;$2db2
add c                             ;$2db4
cp $fe                            ;$2db5
add c                             ;$2db7
cp $fe                            ;$2db8
cp $81                            ;$2dba
rst $38                           ;$2dbc
xor c                             ;$2dbd
ld sp, $fefe                      ;$2dbe
cp $fe                            ;$2dc1
add c                             ;$2dc3
cp $fe                            ;$2dc4
cp $81                            ;$2dc6
add c                             ;$2dc8
add c                             ;$2dc9
rst $38                           ;$2dca
xor c                             ;$2dcb
ld sp, $fefe                      ;$2dcc
cp $fe                            ;$2dcf
cp $81                            ;$2dd1
cp $fe                            ;$2dd3
cp $81                            ;$2dd5
cp $fe                            ;$2dd7
add c                             ;$2dd9
add c                             ;$2dda
rst $38                           ;$2ddb
xor c                             ;$2ddc
ld sp, $fefe                      ;$2ddd
cp $fe                            ;$2de0
cp $fe                            ;$2de2
cp $fe                            ;$2de4
adc d                             ;$2de6
adc e                             ;$2de7
adc e                             ;$2de8
adc a                             ;$2de9
rst $38                           ;$2dea
xor c                             ;$2deb
ld sp, $80fe                      ;$2dec
cp $fe                            ;$2def
cp $88                            ;$2df1
cp $fe                            ;$2df3
cp $88                            ;$2df5
cp $fe                            ;$2df7
cp $89                            ;$2df9
rst $38                           ;$2dfb
xor c                             ;$2dfc
ld sp, $fefe                      ;$2dfd
cp $fe                            ;$2e00
cp $fe                            ;$2e02
cp $fe                            ;$2e04
adc d                             ;$2e06
adc e                             ;$2e07
adc e                             ;$2e08
adc a                             ;$2e09
rst $38                           ;$2e0a
xor c                             ;$2e0b
ld sp, $80fe                      ;$2e0c
cp $fe                            ;$2e0f
cp $88                            ;$2e11
cp $fe                            ;$2e13
cp $88                            ;$2e15
cp $fe                            ;$2e17
cp $89                            ;$2e19
rst $38                           ;$2e1b
xor c                             ;$2e1c
ld sp, $fefe                      ;$2e1d
cp $fe                            ;$2e20
cp $fe                            ;$2e22
cp $fe                            ;$2e24
cp $83                            ;$2e26
add e                             ;$2e28
cp $fe                            ;$2e29
add e                             ;$2e2b
add e                             ;$2e2c
rst $38                           ;$2e2d
xor c                             ;$2e2e
ld sp, $fefe                      ;$2e2f
cp $fe                            ;$2e32
cp $fe                            ;$2e34
cp $fe                            ;$2e36
cp $83                            ;$2e38
add e                             ;$2e3a
cp $fe                            ;$2e3b
add e                             ;$2e3d
add e                             ;$2e3e
rst $38                           ;$2e3f
xor c                             ;$2e40
ld sp, $fefe                      ;$2e41
cp $fe                            ;$2e44
cp $fe                            ;$2e46
cp $fe                            ;$2e48
cp $83                            ;$2e4a
add e                             ;$2e4c
cp $fe                            ;$2e4d
add e                             ;$2e4f
add e                             ;$2e50
rst $38                           ;$2e51
xor c                             ;$2e52
ld sp, $fefe                      ;$2e53
cp $fe                            ;$2e56
cp $fe                            ;$2e58
cp $fe                            ;$2e5a
cp $83                            ;$2e5c
add e                             ;$2e5e
cp $fe                            ;$2e5f
add e                             ;$2e61
add e                             ;$2e62
rst $38                           ;$2e63
xor c                             ;$2e64
ld sp, $fefe                      ;$2e65
cp $fe                            ;$2e68
cp $fe                            ;$2e6a
cp $fe                            ;$2e6c
add d                             ;$2e6e
add d                             ;$2e6f
cp $fe                            ;$2e70
cp $82                            ;$2e72
add d                             ;$2e74
rst $38                           ;$2e75
xor c                             ;$2e76
ld sp, $fefe                      ;$2e77
cp $fe                            ;$2e7a
cp $82                            ;$2e7c
cp $fe                            ;$2e7e
add d                             ;$2e80
add d                             ;$2e81
cp $fe                            ;$2e82
add d                             ;$2e84
rst $38                           ;$2e85
xor c                             ;$2e86
ld sp, $fefe                      ;$2e87
cp $fe                            ;$2e8a
cp $fe                            ;$2e8c
cp $fe                            ;$2e8e
add d                             ;$2e90
add d                             ;$2e91
cp $fe                            ;$2e92
cp $82                            ;$2e94
add d                             ;$2e96
rst $38                           ;$2e97
xor c                             ;$2e98
ld sp, $fefe                      ;$2e99
cp $fe                            ;$2e9c
cp $82                            ;$2e9e
cp $fe                            ;$2ea0
add d                             ;$2ea2
add d                             ;$2ea3
cp $fe                            ;$2ea4
add d                             ;$2ea6
rst $38                           ;$2ea7
xor c                             ;$2ea8
ld sp, $fefe                      ;$2ea9
cp $fe                            ;$2eac
cp $fe                            ;$2eae
cp $fe                            ;$2eb0
cp $86                            ;$2eb2
add [hl]                          ;$2eb4
cp $86                            ;$2eb5
add [hl]                          ;$2eb7
rst $38                           ;$2eb8
xor c                             ;$2eb9
ld sp, $fefe                      ;$2eba
cp $fe                            ;$2ebd
add [hl]                          ;$2ebf
cp $fe                            ;$2ec0
cp $86                            ;$2ec2
add [hl]                          ;$2ec4
cp $fe                            ;$2ec5
cp $86                            ;$2ec7
rst $38                           ;$2ec9
xor c                             ;$2eca
ld sp, $fefe                      ;$2ecb
cp $fe                            ;$2ece
cp $fe                            ;$2ed0
cp $fe                            ;$2ed2
cp $86                            ;$2ed4
add [hl]                          ;$2ed6
cp $86                            ;$2ed7
add [hl]                          ;$2ed9
rst $38                           ;$2eda
xor c                             ;$2edb
ld sp, $fefe                      ;$2edc
cp $fe                            ;$2edf
add [hl]                          ;$2ee1
cp $fe                            ;$2ee2
cp $86                            ;$2ee4
add [hl]                          ;$2ee6
cp $fe                            ;$2ee7
cp $86                            ;$2ee9
rst $38                           ;$2eeb
xor c                             ;$2eec
ld sp, $fefe                      ;$2eed
cp $fe                            ;$2ef0
cp $85                            ;$2ef2
cp $fe                            ;$2ef4
add l                             ;$2ef6
add l                             ;$2ef7
add l                             ;$2ef8
rst $38                           ;$2ef9
xor c                             ;$2efa
ld sp, $fefe                      ;$2efb
cp $fe                            ;$2efe
cp $85                            ;$2f00
cp $fe                            ;$2f02
add l                             ;$2f04
add l                             ;$2f05
cp $fe                            ;$2f06
cp $85                            ;$2f08
rst $38                           ;$2f0a
xor c                             ;$2f0b
ld sp, $fefe                      ;$2f0c
cp $fe                            ;$2f0f
cp $fe                            ;$2f11
cp $fe                            ;$2f13
add l                             ;$2f15
add l                             ;$2f16
add l                             ;$2f17
cp $fe                            ;$2f18
add l                             ;$2f1a
rst $38                           ;$2f1b
xor c                             ;$2f1c
ld sp, $fefe                      ;$2f1d
cp $fe                            ;$2f20
cp $85                            ;$2f22
cp $fe                            ;$2f24
cp $85                            ;$2f26
add l                             ;$2f28
cp $fe                            ;$2f29
add l                             ;$2f2b
rst $38                           ;$2f2c
ret                               ;$2f2d
ld sp, $250a                      ;$2f2e
dec e                             ;$2f31
ldi [hl], a                       ;$2f32
add hl, de                        ;$2f33
ld c, $ff                         ;$2f34
ret                               ;$2f36
ld sp, $250b                      ;$2f37
dec e                             ;$2f3a
ldi [hl], a                       ;$2f3b
add hl, de                        ;$2f3c
ld c, $ff                         ;$2f3d
ret                               ;$2f3f
ld sp, $250c                      ;$2f40
dec e                             ;$2f43
ldi [hl], a                       ;$2f44
add hl, de                        ;$2f45
ld c, $ff                         ;$2f46
ret                               ;$2f48
ld sp, $182f                      ;$2f49
rrca                              ;$2f4c
rrca                              ;$2f4d
cpl                               ;$2f4e
cpl                               ;$2f4f
rst $38                           ;$2f50
ret                               ;$2f51
ld sp, $ff00                      ;$2f52
ret                               ;$2f55
ld sp, $ff01                      ;$2f56
ret                               ;$2f59
ld sp, $ff02                      ;$2f5a
ret                               ;$2f5d
ld sp, $ff03                      ;$2f5e
ret                               ;$2f61
ld sp, $ff04                      ;$2f62
ret                               ;$2f65
ld sp, $ff05                      ;$2f66
ret                               ;$2f69
ld sp, $ff06                      ;$2f6a
ret                               ;$2f6d
ld sp, $ff07                      ;$2f6e
ret                               ;$2f71
ld sp, $ff08                      ;$2f72
ret                               ;$2f75
ld sp, $ff09                      ;$2f76
reti                              ;$2f79
ld sp, $012f                      ;$2f7a
cpl                               ;$2f7d
ld de, $2120                      ;$2f7e
jr nc, $2fb4                      ;$2f81
rst $38                           ;$2f83
reti                              ;$2f84
ld sp, $032f                      ;$2f85
ld [de], a                        ;$2f88
inc de                            ;$2f89
ldi [hl], a                       ;$2f8a
inc hl                            ;$2f8b
ldd [hl], a                       ;$2f8c
inc sp                            ;$2f8d
rst $38                           ;$2f8e
xor c                             ;$2f8f
ld sp, $052f                      ;$2f90
db $fd ;<unknown instruction>     ;$2f93
dec b                             ;$2f94
cpl                               ;$2f95
cpl                               ;$2f96
dec d                             ;$2f97
inc b                             ;$2f98
rla                               ;$2f99
inc h                             ;$2f9a
dec h                             ;$2f9b
ld h, $27                         ;$2f9c
inc [hl]                          ;$2f9e
dec [hl]                          ;$2f9f
ld [hl], $2f                      ;$2fa0
rst $38                           ;$2fa2
xor c                             ;$2fa3
ld sp, $3708                      ;$2fa4
db $fd ;<unknown instruction>     ;$2fa7
scf                               ;$2fa8
db $fd ;<unknown instruction>     ;$2fa9
ld [$1918], sp                    ;$2faa
inc d                             ;$2fad
dec de                            ;$2fae
jr z, $2fda                       ;$2faf
ldi a, [hl]                       ;$2fb1
dec hl                            ;$2fb2
ld h, b                           ;$2fb3
ld [hl], b                        ;$2fb4
ld [hl], $2f                      ;$2fb5
rst $38                           ;$2fb7
reti                              ;$2fb8
ld sp, $fdb9                      ;$2fb9
cp c                              ;$2fbc
cp d                              ;$2fbd
db $fd ;<unknown instruction>     ;$2fbe
cp d                              ;$2fbf
rst $38                           ;$2fc0
reti                              ;$2fc1
ld sp, $fd82                      ;$2fc2
add d                             ;$2fc5
add e                             ;$2fc6
db $fd ;<unknown instruction>     ;$2fc7
add e                             ;$2fc8
rst $38                           ;$2fc9
reti                              ;$2fca
ld sp, $0a09                      ;$2fcb
ldd a, [hl]                       ;$2fce
dec sp                            ;$2fcf
rst $38                           ;$2fd0
reti                              ;$2fd1
ld sp, $400b                      ;$2fd2
ld a, h                           ;$2fd5
ld l, a                           ;$2fd6
rst $38                           ;$2fd7
reti                              ;$2fd8
ld sp, $0f2f                      ;$2fd9
cpl                               ;$2fdc
rra                               ;$2fdd
ld e, a                           ;$2fde
inc l                             ;$2fdf
cpl                               ;$2fe0
ccf                               ;$2fe1
rst $38                           ;$2fe2
reti                              ;$2fe3
ld sp, $3c6c                      ;$2fe4
ld c, e                           ;$2fe7
ld c, h                           ;$2fe8
ld e, e                           ;$2fe9
ld e, h                           ;$2fea
ld l, e                           ;$2feb
cpl                               ;$2fec
rst $38                           ;$2fed
xor c                             ;$2fee
ld sp, $4d2f                      ;$2fef
db $fd ;<unknown instruction>     ;$2ff2
ld c, l                           ;$2ff3
cpl                               ;$2ff4
cpl                               ;$2ff5
ld e, l                           ;$2ff6
ld e, [hl]                        ;$2ff7
ld c, [hl]                        ;$2ff8
ld e, a                           ;$2ff9
ld l, l                           ;$2ffa
ld l, [hl]                        ;$2ffb
cpl                               ;$2ffc
cpl                               ;$2ffd
ld a, l                           ;$2ffe
db $fd ;<unknown instruction>     ;$2fff
ld a, l                           ;$3000
cpl                               ;$3001
rst $38                           ;$3002
xor c                             ;$3003
ld sp, $7708                      ;$3004
db $fd ;<unknown instruction>     ;$3007
ld [hl], a                        ;$3008
db $fd ;<unknown instruction>     ;$3009
ld [$7818], sp                    ;$300a
ld b, e                           ;$300d
ld d, e                           ;$300e
ld a, d                           ;$300f
ld a, e                           ;$3010
ld d, b                           ;$3011
cpl                               ;$3012
cpl                               ;$3013
ld [bc], a                        ;$3014
db $fd ;<unknown instruction>     ;$3015
ld a, l                           ;$3016
cpl                               ;$3017
rst $38                           ;$3018
reti                              ;$3019
ld sp, $fdb9                      ;$301a
cp c                              ;$301d
cp d                              ;$301e
db $fd ;<unknown instruction>     ;$301f
cp d                              ;$3020
rst $38                           ;$3021
reti                              ;$3022
ld sp, $fd82                      ;$3023
add d                             ;$3026
add e                             ;$3027
db $fd ;<unknown instruction>     ;$3028
add e                             ;$3029
rst $38                           ;$302a
reti                              ;$302b
ld sp, $0a09                      ;$302c
ldd a, [hl]                       ;$302f
dec sp                            ;$3030
rst $38                           ;$3031
reti                              ;$3032
ld sp, $400b                      ;$3033
ld a, h                           ;$3036
ld l, a                           ;$3037
rst $38                           ;$3038
reti                              ;$3039
ld sp, $dddc                      ;$303a
ldh [$ffe1], a                    ;$303d
rst $38                           ;$303f
reti                              ;$3040
ld sp, $dfde                      ;$3041
ldh [$ffe1], a                    ;$3044
rst $38                           ;$3046
reti                              ;$3047
ld sp, $e2de                      ;$3048
ldh [$ffe4], a                    ;$304b
rst $38                           ;$304d
reti                              ;$304e
ld sp, $eedc                      ;$304f
ldh [$ffe3], a                    ;$3052
rst $38                           ;$3054
reti                              ;$3055
ld sp, $e6e5                      ;$3056
rst $20                           ;$3059
add sp, $ff                       ;$305a
reti                              ;$305c
ld sp, $e6fd                      ;$305d
db $fd ;<unknown instruction>     ;$3060
push hl                           ;$3061
db $fd ;<unknown instruction>     ;$3062
add sp, $fd                       ;$3063
rst $20                           ;$3065
rst $38                           ;$3066
reti                              ;$3067
ld sp, $eae9                      ;$3068
db $eb ;<unknown instruction>     ;$306b
db $ec ;<unknown instruction>     ;$306c
rst $38                           ;$306d
reti                              ;$306e
ld sp, $eaed                      ;$306f
db $eb ;<unknown instruction>     ;$3072
db $ec ;<unknown instruction>     ;$3073
rst $38                           ;$3074
reti                              ;$3075
ld sp, $f4f2                      ;$3076
di                                ;$3079
cp a                              ;$307a
rst $38                           ;$307b
reti                              ;$307c
ld sp, $f2f4                      ;$307d
cp a                              ;$3080
di                                ;$3081
rst $38                           ;$3082
reti                              ;$3083
ld sp, $fdc2                      ;$3084
jp nz, $fdc3                      ;$3087
jp $d9ff                          ;$308a
ld sp, $fdc4                      ;$308d
call nz, $fdc5                    ;$3090
push bc                           ;$3093
rst $38                           ;$3094
reti                              ;$3095
ld sp, $fddc                      ;$3096
call c, $fdef                     ;$3099
rst $28                           ;$309c
rst $38                           ;$309d
reti                              ;$309e
ld sp, $fdf0                      ;$309f
ldh a, [$fff1]                    ;$30a2
db $fd ;<unknown instruction>     ;$30a4
pop af                            ;$30a5
rst $38                           ;$30a6
reti                              ;$30a7
ld sp, $fddc                      ;$30a8
ldh a, [$fff1]                    ;$30ab
db $fd ;<unknown instruction>     ;$30ad
rst $28                           ;$30ae
rst $38                           ;$30af
reti                              ;$30b0
ld sp, $fdf0                      ;$30b1
call c, $fdef                     ;$30b4
pop af                            ;$30b7
rst $38                           ;$30b8
reti                              ;$30b9
ld sp, $bebd                      ;$30ba
cp e                              ;$30bd
cp h                              ;$30be
rst $38                           ;$30bf
reti                              ;$30c0
ld sp, $bab9                      ;$30c1
jp c, $ffdb                       ;$30c4
swap b                            ;$30c7
ldh [$fff0], a                    ;$30c9
push af                           ;$30cb
ld sp, $c1c0                      ;$30cc
push bc                           ;$30cf
add a, $cc                        ;$30d0
call $7675                        ;$30d2
and h                             ;$30d5
and l                             ;$30d6
and [hl]                          ;$30d7
and a                             ;$30d8
ld d, h                           ;$30d9
ld d, l                           ;$30da
ld d, [hl]                        ;$30db
ld d, a                           ;$30dc
ld b, h                           ;$30dd
ld b, l                           ;$30de
ld b, [hl]                        ;$30df
ld b, a                           ;$30e0
and b                             ;$30e1
and c                             ;$30e2
and d                             ;$30e3
and e                             ;$30e4
sbc h                             ;$30e5
sbc l                             ;$30e6
sbc [hl]                          ;$30e7
sbc a                             ;$30e8
rst $38                           ;$30e9
ld d, $31                         ;$30ea
ld hl, sp+$e8                     ;$30ec
inc e                             ;$30ee
ld sp, $e8f0                      ;$30ef
dec h                             ;$30f2
ld sp, $0000                      ;$30f3
dec hl                            ;$30f6
ld sp, $0000                      ;$30f7
ld sp, $0031                      ;$30fa
nop                               ;$30fd
ldd a, [hl]                       ;$30fe
ld sp, $0000                      ;$30ff
sbc l                             ;$3102
ld sp, $0000                      ;$3103
and e                             ;$3106
ld sp, $0000                      ;$3107
ld h, h                           ;$310a
ld sp, $f8d8                      ;$310b
ld a, h                           ;$310e
ld sp, $f8e8                      ;$310f
adc [hl]                          ;$3112
ld sp, $f8f0                      ;$3113
dec l                             ;$3116
ldd [hl], a                       ;$3117
ld h, e                           ;$3118
ld h, h                           ;$3119
ld h, l                           ;$311a
rst $38                           ;$311b
dec l                             ;$311c
ldd [hl], a                       ;$311d
ld h, e                           ;$311e
ld h, h                           ;$311f
ld h, l                           ;$3120
ld h, [hl]                        ;$3121
ld h, a                           ;$3122
ld l, b                           ;$3123
rst $38                           ;$3124
dec l                             ;$3125
ldd [hl], a                       ;$3126
ld b, c                           ;$3127
ld b, c                           ;$3128
ld b, c                           ;$3129
rst $38                           ;$312a
dec l                             ;$312b
ldd [hl], a                       ;$312c
ld b, d                           ;$312d
ld b, d                           ;$312e
ld b, d                           ;$312f
rst $38                           ;$3130
dec l                             ;$3131
ldd [hl], a                       ;$3132
ld d, d                           ;$3133
ld d, d                           ;$3134
ld d, d                           ;$3135
ld h, d                           ;$3136
ld h, d                           ;$3137
ld h, d                           ;$3138
rst $38                           ;$3139
dec l                             ;$313a
ldd [hl], a                       ;$313b
ld d, c                           ;$313c
ld d, c                           ;$313d
ld d, c                           ;$313e
ld h, c                           ;$313f
ld h, c                           ;$3140
ld h, c                           ;$3141
ld [hl], c                        ;$3142
ld [hl], c                        ;$3143
ld [hl], c                        ;$3144
rst $38                           ;$3145
xor c                             ;$3146
ld sp, $2f2f                      ;$3147
cpl                               ;$314a
cpl                               ;$314b
cpl                               ;$314c
cpl                               ;$314d
cpl                               ;$314e
cpl                               ;$314f
ld h, e                           ;$3150
ld h, h                           ;$3151
db $fd ;<unknown instruction>     ;$3152
ld h, h                           ;$3153
db $fd ;<unknown instruction>     ;$3154
ld h, e                           ;$3155
ld h, [hl]                        ;$3156
ld h, a                           ;$3157
db $fd ;<unknown instruction>     ;$3158
ld h, a                           ;$3159
db $fd ;<unknown instruction>     ;$315a
ld h, [hl]                        ;$315b
rst $38                           ;$315c
reti                              ;$315d
ld sp, $2f2f                      ;$315e
ld h, e                           ;$3161
ld h, h                           ;$3162
rst $38                           ;$3163
reti                              ;$3164
ld sp, $fd00                      ;$3165
nop                               ;$3168
db $10 ;<corrupted stop>          ;$3169
db $fd ;<unknown instruction>     ;$316a
db $10 ;<corrupted stop>          ;$316b
ld c, a                           ;$316c
db $fd ;<unknown instruction>     ;$316d
ld c, a                           ;$316e
add b                             ;$316f
db $fd ;<unknown instruction>     ;$3170
add b                             ;$3171
add b                             ;$3172
db $fd ;<unknown instruction>     ;$3173
add b                             ;$3174
add c                             ;$3175
db $fd ;<unknown instruction>     ;$3176
add c                             ;$3177
sub a                             ;$3178
db $fd ;<unknown instruction>     ;$3179
sub a                             ;$317a
rst $38                           ;$317b
reti                              ;$317c
ld sp, $fd98                      ;$317d
sbc b                             ;$3180
sbc c                             ;$3181
db $fd ;<unknown instruction>     ;$3182
sbc c                             ;$3183
add b                             ;$3184
db $fd ;<unknown instruction>     ;$3185
add b                             ;$3186
sbc d                             ;$3187
db $fd ;<unknown instruction>     ;$3188
sbc d                             ;$3189
sbc e                             ;$318a
db $fd ;<unknown instruction>     ;$318b
sbc e                             ;$318c
rst $38                           ;$318d
reti                              ;$318e
ld sp, $fda8                      ;$318f
xor b                             ;$3192
xor c                             ;$3193
db $fd ;<unknown instruction>     ;$3194
xor c                             ;$3195
xor d                             ;$3196
db $fd ;<unknown instruction>     ;$3197
xor d                             ;$3198
xor e                             ;$3199
db $fd ;<unknown instruction>     ;$319a
xor e                             ;$319b
rst $38                           ;$319c
reti                              ;$319d
ld sp, $2f41                      ;$319e
cpl                               ;$31a1
rst $38                           ;$31a2
reti                              ;$31a3
ld sp, $2f52                      ;$31a4
ld h, d                           ;$31a7
rst $38                           ;$31a8
nop                               ;$31a9
nop                               ;$31aa
nop                               ;$31ab
ld [$1000], sp                    ;$31ac
nop                               ;$31af
jr $31ba                          ;$31b0
nop                               ;$31b2
ld [$0808], sp                    ;$31b3
db $10 ;<corrupted stop>          ;$31b6
ld [$1018], sp                    ;$31b7
nop                               ;$31ba
db $10 ;<corrupted stop>          ;$31bb
ld [$1010], sp                    ;$31bc
db $10 ;<corrupted stop>          ;$31bf
jr $31da                          ;$31c0
nop                               ;$31c2
jr $31cd                          ;$31c3
jr $31d7                          ;$31c5
jr $31e1                          ;$31c7
nop                               ;$31c9
nop                               ;$31ca
nop                               ;$31cb
ld [$1000], sp                    ;$31cc
nop                               ;$31cf
jr $31d2                          ;$31d0
jr nz, $31d4                      ;$31d2
jr z, $31d6                       ;$31d4
jr nc, $31d8                      ;$31d6
jr c, $31da                       ;$31d8
nop                               ;$31da
nop                               ;$31db
ld [$0008], sp                    ;$31dc
ld [$1008], sp                    ;$31df
nop                               ;$31e2
db $10 ;<corrupted stop>          ;$31e3
ld [$0018], sp                    ;$31e4
jr $31f1                          ;$31e7
jr nz, $31eb                      ;$31e9
jr nz, $31f5                      ;$31eb
jr z, $31ef                       ;$31ed
jr z, $31f9                       ;$31ef
jr nc, $31f3                      ;$31f1
jr nc, $31fd                      ;$31f3
nop                               ;$31f5
ld [$1000], sp                    ;$31f6
ld [$0808], sp                    ;$31f9
db $10 ;<corrupted stop>          ;$31fc
stop                              ;$31fd
db $10 ;<corrupted stop>          ;$31ff
ld [$1010], sp                    ;$3200
db $10 ;<corrupted stop>          ;$3203
jr $321e                          ;$3204
nop                               ;$3206
jr $3211                          ;$3207
jr $321b                          ;$3209
jr $3225                          ;$320b
jr nz, $320f                      ;$320d
jr nz, $3219                      ;$320f
jr nz, $3223                      ;$3211
jr nz, $322d                      ;$3213
jr z, $3217                       ;$3215
jr z, $3221                       ;$3217
jr z, $322b                       ;$3219
jr z, $3235                       ;$321b
jr nc, $321f                      ;$321d
jr nc, $3229                      ;$321f
jr nc, $3233                      ;$3221
jr nc, $323d                      ;$3223
jr c, $3227                       ;$3225
jr c, $3231                       ;$3227
jr c, $323b                       ;$3229
jr c, $3245                       ;$322b
nop                               ;$322d
nop                               ;$322e
nop                               ;$322f
ld [$1000], sp                    ;$3230
ld [$0800], sp                    ;$3233
ld [$1008], sp                    ;$3236
stop                              ;$3239
db $10 ;<corrupted stop>          ;$323b
ld [$1010], sp                    ;$323c
ld a, a                           ;$323f
ld a, a                           ;$3240
ld a, a                           ;$3241
ld a, a                           ;$3242
ld a, a                           ;$3243
ld a, a                           ;$3244
ld a, a                           ;$3245
ld a, a                           ;$3246
ld a, a                           ;$3247
ld a, a                           ;$3248
ld a, h                           ;$3249
ld a, h                           ;$324a
ld a, b                           ;$324b
ld a, c                           ;$324c
ld a, b                           ;$324d
ld a, e                           ;$324e
rst $38                           ;$324f
rst $38                           ;$3250
rst $38                           ;$3251
rst $38                           ;$3252
rst $38                           ;$3253
rst $38                           ;$3254
rst $38                           ;$3255
rst $38                           ;$3256
rst $38                           ;$3257
rst $38                           ;$3258
nop                               ;$3259
nop                               ;$325a
nop                               ;$325b
rst $38                           ;$325c
nop                               ;$325d
nop                               ;$325e
rst $38                           ;$325f
rst $38                           ;$3260
rst $38                           ;$3261
rst $38                           ;$3262
rst $38                           ;$3263
rst $38                           ;$3264
rst $38                           ;$3265
rst $38                           ;$3266
rst $38                           ;$3267
rst $38                           ;$3268
ccf                               ;$3269
ccf                               ;$326a
rra                               ;$326b
sbc a                             ;$326c
rra                               ;$326d
rst $18                           ;$326e
ld a, b                           ;$326f
ld a, e                           ;$3270
ld a, b                           ;$3271
ld a, c                           ;$3272
ld a, h                           ;$3273
ld a, h                           ;$3274
ld a, a                           ;$3275
ld a, a                           ;$3276
ld a, a                           ;$3277
ld a, a                           ;$3278
ld a, a                           ;$3279
ld a, a                           ;$327a
ld a, a                           ;$327b
ld a, a                           ;$327c
ld a, a                           ;$327d
ld a, a                           ;$327e
nop                               ;$327f
nop                               ;$3280
nop                               ;$3281
rst $38                           ;$3282
nop                               ;$3283
nop                               ;$3284
rst $38                           ;$3285
rst $38                           ;$3286
rst $38                           ;$3287
rst $38                           ;$3288
rst $38                           ;$3289
rst $38                           ;$328a
rst $38                           ;$328b
rst $38                           ;$328c
rst $38                           ;$328d
rst $38                           ;$328e
rra                               ;$328f
rst $18                           ;$3290
rra                               ;$3291
sbc a                             ;$3292
ccf                               ;$3293
ccf                               ;$3294
rst $38                           ;$3295
rst $38                           ;$3296
rst $38                           ;$3297
rst $38                           ;$3298
rst $38                           ;$3299
rst $38                           ;$329a
rst $38                           ;$329b
rst $38                           ;$329c
rst $38                           ;$329d
rst $38                           ;$329e
ld a, b                           ;$329f
ld a, d                           ;$32a0
ld a, b                           ;$32a1
ld a, d                           ;$32a2
ld a, b                           ;$32a3
ld a, d                           ;$32a4
ld a, b                           ;$32a5
ld a, d                           ;$32a6
ld a, b                           ;$32a7
ld a, d                           ;$32a8
ld a, b                           ;$32a9
ld a, d                           ;$32aa
ld a, b                           ;$32ab
ld a, d                           ;$32ac
ld a, b                           ;$32ad
ld a, d                           ;$32ae
rra                               ;$32af
ld e, a                           ;$32b0
rra                               ;$32b1
ld e, a                           ;$32b2
rra                               ;$32b3
ld e, a                           ;$32b4
rra                               ;$32b5
ld e, a                           ;$32b6
rra                               ;$32b7
ld e, a                           ;$32b8
rra                               ;$32b9
ld e, a                           ;$32ba
rra                               ;$32bb
ld e, a                           ;$32bc
rra                               ;$32bd
ld e, a                           ;$32be
rst $38                           ;$32bf
rst $38                           ;$32c0
rst $38                           ;$32c1
rst $38                           ;$32c2
rst $38                           ;$32c3
rst $38                           ;$32c4
rst $38                           ;$32c5
ld hl, sp+$f8                     ;$32c6
ldh a, [$fff2]                    ;$32c8
pop hl                            ;$32ca
push af                           ;$32cb
db $e3 ;<unknown instruction>     ;$32cc
ld a, [$ff00+c]                   ;$32cd
and a, $ff                        ;$32ce
rst $38                           ;$32d0
rst $38                           ;$32d1
rst $38                           ;$32d2
rst $38                           ;$32d3
rst $38                           ;$32d4
rst $38                           ;$32d5
nop                               ;$32d6
nop                               ;$32d7
nop                               ;$32d8
nop                               ;$32d9
rst $38                           ;$32da
rst $38                           ;$32db
rst $38                           ;$32dc
nop                               ;$32dd
nop                               ;$32de
rst $38                           ;$32df
rst $38                           ;$32e0
rst $38                           ;$32e1
rst $38                           ;$32e2
rst $38                           ;$32e3
rst $38                           ;$32e4
rst $38                           ;$32e5
rra                               ;$32e6
rra                               ;$32e7
rrca                              ;$32e8
ld c, a                           ;$32e9
add a                             ;$32ea
xor a                             ;$32eb
rst $00                           ;$32ec
ld c, a                           ;$32ed
ld h, a                           ;$32ee
ld a, [$ff00+c]                   ;$32ef
and a, $f2                        ;$32f0
and a, $f2                        ;$32f2
and a, $f2                        ;$32f4
and a, $f2                        ;$32f6
and a, $f2                        ;$32f8
and a, $f2                        ;$32fa
and a, $f2                        ;$32fc
and a, $4f                        ;$32fe
ld h, a                           ;$3300
ld c, a                           ;$3301
ld h, a                           ;$3302
ld c, a                           ;$3303
ld h, a                           ;$3304
ld c, a                           ;$3305
ld h, a                           ;$3306
ld c, a                           ;$3307
ld h, a                           ;$3308
ld c, a                           ;$3309
ld h, a                           ;$330a
ld c, a                           ;$330b
ld h, a                           ;$330c
ld c, a                           ;$330d
ld h, a                           ;$330e
ld a, [$ff00+c]                   ;$330f
and a, $f5                        ;$3310
db $e3 ;<unknown instruction>     ;$3312
ld a, [$ff00+c]                   ;$3313
pop hl                            ;$3314
ld hl, sp+$f0                     ;$3315
rst $38                           ;$3317
ld hl, sp+$ff                     ;$3318
rst $38                           ;$331a
rst $38                           ;$331b
rst $38                           ;$331c
rst $38                           ;$331d
rst $38                           ;$331e
nop                               ;$331f
nop                               ;$3320
rst $38                           ;$3321
rst $38                           ;$3322
nop                               ;$3323
rst $38                           ;$3324
nop                               ;$3325
nop                               ;$3326
rst $38                           ;$3327
nop                               ;$3328
rst $38                           ;$3329
rst $38                           ;$332a
rst $38                           ;$332b
rst $38                           ;$332c
rst $38                           ;$332d
rst $38                           ;$332e
ld c, a                           ;$332f
ld h, a                           ;$3330
xor a                             ;$3331
rst $00                           ;$3332
ld c, a                           ;$3333
add a                             ;$3334
rra                               ;$3335
rrca                              ;$3336
rst $38                           ;$3337
rra                               ;$3338
rst $38                           ;$3339
rst $38                           ;$333a
rst $38                           ;$333b
rst $38                           ;$333c
rst $38                           ;$333d
rst $38                           ;$333e
ld a, b                           ;$333f
ld a, e                           ;$3340
ld a, b                           ;$3341
ld a, c                           ;$3342
ld a, h                           ;$3343
ld a, h                           ;$3344
ld a, a                           ;$3345
ld a, a                           ;$3346
ld a, a                           ;$3347
ld a, a                           ;$3348
ld a, h                           ;$3349
ld a, h                           ;$334a
ld a, b                           ;$334b
ld a, c                           ;$334c
ld a, b                           ;$334d
ld a, e                           ;$334e
rra                               ;$334f
rst $18                           ;$3350
rra                               ;$3351
sbc a                             ;$3352
ccf                               ;$3353
ccf                               ;$3354
rst $38                           ;$3355
rst $38                           ;$3356
rst $38                           ;$3357
rst $38                           ;$3358
ccf                               ;$3359
ccf                               ;$335a
rra                               ;$335b
sbc a                             ;$335c
rra                               ;$335d
rst $18                           ;$335e
nop                               ;$335f
nop                               ;$3360
nop                               ;$3361
rst $38                           ;$3362
nop                               ;$3363
nop                               ;$3364
rst $38                           ;$3365
rst $38                           ;$3366
rst $38                           ;$3367
rst $38                           ;$3368
nop                               ;$3369
nop                               ;$336a
nop                               ;$336b
rst $38                           ;$336c
nop                               ;$336d
nop                               ;$336e
nop                               ;$336f
nop                               ;$3370
nop                               ;$3371
ld a, a                           ;$3372
nop                               ;$3373
nop                               ;$3374
ld a, a                           ;$3375
ld a, a                           ;$3376
ld a, a                           ;$3377
ld a, a                           ;$3378
ld a, a                           ;$3379
ld a, a                           ;$337a
ld a, a                           ;$337b
ld a, a                           ;$337c
ld a, a                           ;$337d
ld a, a                           ;$337e
ld a, b                           ;$337f
ld a, d                           ;$3380
ld a, b                           ;$3381
ld a, d                           ;$3382
ld a, b                           ;$3383
ld a, d                           ;$3384
ld a, b                           ;$3385
ld a, d                           ;$3386
ld a, b                           ;$3387
ld a, d                           ;$3388
nop                               ;$3389
ld [bc], a                        ;$338a
nop                               ;$338b
ld a, d                           ;$338c
nop                               ;$338d
ld a, d                           ;$338e
rra                               ;$338f
ld e, a                           ;$3390
rra                               ;$3391
ld e, a                           ;$3392
rra                               ;$3393
ld e, a                           ;$3394
rra                               ;$3395
ld e, a                           ;$3396
rra                               ;$3397
ld e, a                           ;$3398
nop                               ;$3399
ld b, b                           ;$339a
nop                               ;$339b
ld e, a                           ;$339c
nop                               ;$339d
ld e, a                           ;$339e
nop                               ;$339f
nop                               ;$33a0
nop                               ;$33a1
rst $38                           ;$33a2
nop                               ;$33a3
nop                               ;$33a4
nop                               ;$33a5
rst $38                           ;$33a6
nop                               ;$33a7
rst $38                           ;$33a8
nop                               ;$33a9
nop                               ;$33aa
nop                               ;$33ab
rst $38                           ;$33ac
nop                               ;$33ad
nop                               ;$33ae
nop                               ;$33af
nop                               ;$33b0
nop                               ;$33b1
nop                               ;$33b2
ccf                               ;$33b3
ccf                               ;$33b4
ccf                               ;$33b5
ccf                               ;$33b6
jr nc, $33e9                      ;$33b7
jr nc, $33eb                      ;$33b9
inc sp                            ;$33bb
ldd [hl], a                       ;$33bc
inc sp                            ;$33bd
jr nc, $33c0                      ;$33be
nop                               ;$33c0
nop                               ;$33c1
nop                               ;$33c2
rst $38                           ;$33c3
rst $38                           ;$33c4
rst $38                           ;$33c5
rst $38                           ;$33c6
nop                               ;$33c7
nop                               ;$33c8
nop                               ;$33c9
nop                               ;$33ca
rst $38                           ;$33cb
ld [bc], a                        ;$33cc
rst $38                           ;$33cd
jr nz, $33d0                      ;$33ce
nop                               ;$33d0
nop                               ;$33d1
nop                               ;$33d2
db $fc ;<unknown instruction>     ;$33d3
db $fc ;<unknown instruction>     ;$33d4
db $fc ;<unknown instruction>     ;$33d5
db $fc ;<unknown instruction>     ;$33d6
inc c                             ;$33d7
inc c                             ;$33d8
inc c                             ;$33d9
inc c                             ;$33da
call z, $cc0c                     ;$33db
inc c                             ;$33de
inc sp                            ;$33df
jr nc, $3415                      ;$33e0
jr nc, $3417                      ;$33e2
jr nc, $3419                      ;$33e4
jr nc, $341b                      ;$33e6
jr nc, $341d                      ;$33e8
jr nc, $341f                      ;$33ea
ldd [hl], a                       ;$33ec
inc sp                            ;$33ed
jr nc, $33bc                      ;$33ee
inc c                             ;$33f0
call z, $cc4c                     ;$33f1
inc c                             ;$33f4
call z, $cc0c                     ;$33f5
inc c                             ;$33f8
call z, $cc8c                     ;$33f9
inc c                             ;$33fc
call z, $330c                     ;$33fd
jr nc, $3435                      ;$3400
jr nc, $3434                      ;$3402
jr nc, $3436                      ;$3404
jr nc, $3447                      ;$3406
ccf                               ;$3408
ccf                               ;$3409
ccf                               ;$340a
nop                               ;$340b
nop                               ;$340c
nop                               ;$340d
nop                               ;$340e
rst $38                           ;$340f
inc b                             ;$3410
rst $38                           ;$3411
ld b, b                           ;$3412
nop                               ;$3413
nop                               ;$3414
nop                               ;$3415
nop                               ;$3416
rst $38                           ;$3417
rst $38                           ;$3418
rst $38                           ;$3419
rst $38                           ;$341a
nop                               ;$341b
nop                               ;$341c
nop                               ;$341d
nop                               ;$341e
call z, $cc0c                     ;$341f
ld c, h                           ;$3422
inc c                             ;$3423
inc c                             ;$3424
inc c                             ;$3425
inc c                             ;$3426
db $fc ;<unknown instruction>     ;$3427
db $fc ;<unknown instruction>     ;$3428
db $fc ;<unknown instruction>     ;$3429
db $fc ;<unknown instruction>     ;$342a
nop                               ;$342b
nop                               ;$342c
nop                               ;$342d
nop                               ;$342e
nop                               ;$342f
nop                               ;$3430
rst $38                           ;$3431
rst $38                           ;$3432
rst $38                           ;$3433
nop                               ;$3434
rst $38                           ;$3435
ld [bc], a                        ;$3436
rst $38                           ;$3437
jr nz, $3439                      ;$3438
nop                               ;$343a
rst $38                           ;$343b
inc b                             ;$343c
rst $38                           ;$343d
nop                               ;$343e
rst $38                           ;$343f
nop                               ;$3440
rst $38                           ;$3441
ld [bc], a                        ;$3442
rst $38                           ;$3443
ld b, b                           ;$3444
rst $38                           ;$3445
nop                               ;$3446
rst $38                           ;$3447
ld [$01ff], sp                    ;$3448
rst $38                           ;$344b
ld b, e                           ;$344c
rst $38                           ;$344d
rlca                              ;$344e
rst $38                           ;$344f
inc b                             ;$3450
rst $38                           ;$3451
ld b, b                           ;$3452
rst $38                           ;$3453
ld [bc], a                        ;$3454
rst $38                           ;$3455
nop                               ;$3456
rst $38                           ;$3457
nop                               ;$3458
rst $38                           ;$3459
rst $38                           ;$345a
rst $38                           ;$345b
rst $38                           ;$345c
nop                               ;$345d
nop                               ;$345e
rst $38                           ;$345f
nop                               ;$3460
rst $38                           ;$3461
ld b, b                           ;$3462
rst $38                           ;$3463
ld [bc], a                        ;$3464
rst $38                           ;$3465
nop                               ;$3466
rst $38                           ;$3467
db $10 ;<corrupted stop>          ;$3468
rst $38                           ;$3469
add b                             ;$346a
rst $38                           ;$346b
jp nz, $e0ff                      ;$346c
cp $06                            ;$346f
cp $46                            ;$3471
cp $06                            ;$3473
cp $06                            ;$3475
cp $16                            ;$3477
cp $86                            ;$3479
cp $06                            ;$347b
cp $06                            ;$347d
ld a, a                           ;$347f
ld h, h                           ;$3480
ld a, a                           ;$3481
ld h, b                           ;$3482
ld a, a                           ;$3483
ld h, d                           ;$3484
ld a, a                           ;$3485
ld h, b                           ;$3486
ld a, a                           ;$3487
ld h, b                           ;$3488
ld a, a                           ;$3489
ld l, b                           ;$348a
ld a, a                           ;$348b
ld h, d                           ;$348c
ld a, a                           ;$348d
ld h, b                           ;$348e
rst $38                           ;$348f
ld [bc], a                        ;$3490
rst $38                           ;$3491
ld b, b                           ;$3492
rst $38                           ;$3493
nop                               ;$3494
rst $38                           ;$3495
nop                               ;$3496
rst $38                           ;$3497
ld [$80ff], sp                    ;$3498
rst $38                           ;$349b
rra                               ;$349c
ldh a, [$ff10]                    ;$349d
rst $38                           ;$349f
ld [bc], a                        ;$34a0
rst $38                           ;$34a1
jr nz, $34a3                      ;$34a2
nop                               ;$34a4
rst $38                           ;$34a5
nop                               ;$34a6
rst $38                           ;$34a7
inc b                             ;$34a8
rst $38                           ;$34a9
nop                               ;$34aa
rst $38                           ;$34ab
rst $38                           ;$34ac
nop                               ;$34ad
nop                               ;$34ae
rst $38                           ;$34af
rlca                              ;$34b0
rst $38                           ;$34b1
inc de                            ;$34b2
rst $38                           ;$34b3
ld bc, $00ff                      ;$34b4
rst $38                           ;$34b7
ld b, b                           ;$34b8
rst $38                           ;$34b9
nop                               ;$34ba
rst $38                           ;$34bb
rst $38                           ;$34bc
ld [$0008], sp                    ;$34bd
nop                               ;$34c0
rst $38                           ;$34c1
rst $38                           ;$34c2
rst $38                           ;$34c3
rst $38                           ;$34c4
rst $38                           ;$34c5
nop                               ;$34c6
rst $38                           ;$34c7
ld [bc], a                        ;$34c8
rst $38                           ;$34c9
jr nz, $34cb                      ;$34ca
rst $38                           ;$34cc
nop                               ;$34cd
nop                               ;$34ce
rst $38                           ;$34cf
ldh [$ffff], a                    ;$34d0
ret z                             ;$34d2
rst $38                           ;$34d3
add b                             ;$34d4
rst $38                           ;$34d5
nop                               ;$34d6
rst $38                           ;$34d7
ld [bc], a                        ;$34d8
rst $38                           ;$34d9
nop                               ;$34da
rst $38                           ;$34db
rst $38                           ;$34dc
ld [$ff08], sp                    ;$34dd
nop                               ;$34e0
rst $38                           ;$34e1
ld [bc], a                        ;$34e2
rst $38                           ;$34e3
ld b, b                           ;$34e4
rst $38                           ;$34e5
nop                               ;$34e6
rst $38                           ;$34e7
ld [bc], a                        ;$34e8
rst $38                           ;$34e9
nop                               ;$34ea
rst $38                           ;$34eb
ld hl, sp+$0f                     ;$34ec
ld [$10f0], sp                    ;$34ee
ldh a, [$ff10]                    ;$34f1
ldh a, [$ff10]                    ;$34f3
ldh a, [$ff50]                    ;$34f5
ldh a, [$ff10]                    ;$34f7
ldh a, [$ff10]                    ;$34f9
ldh a, [$ff10]                    ;$34fb
ldh a, [$ff10]                    ;$34fd
rrca                              ;$34ff
ld [$0a0f], sp                    ;$3500
rrca                              ;$3503
ld [$080f], sp                    ;$3504
rrca                              ;$3507
ld [$080f], sp                    ;$3508
rrca                              ;$350b
add hl, bc                        ;$350c
rrca                              ;$350d
ld [$0000], sp                    ;$350e
nop                               ;$3511
ld a, a                           ;$3512
nop                               ;$3513
nop                               ;$3514
ld a, a                           ;$3515
ld a, a                           ;$3516
ld a, a                           ;$3517
ld a, a                           ;$3518
ld a, h                           ;$3519
ld a, h                           ;$351a
ld a, b                           ;$351b
ld a, c                           ;$351c
ld a, b                           ;$351d
ld a, e                           ;$351e
nop                               ;$351f
nop                               ;$3520
nop                               ;$3521
rst $38                           ;$3522
nop                               ;$3523
nop                               ;$3524
rst $38                           ;$3525
rst $38                           ;$3526
rst $38                           ;$3527
rst $38                           ;$3528
ccf                               ;$3529
ccf                               ;$352a
rra                               ;$352b
sbc a                             ;$352c
rra                               ;$352d
rst $18                           ;$352e
ld a, a                           ;$352f
ld a, a                           ;$3530
ld a, a                           ;$3531
ld a, a                           ;$3532
ld a, a                           ;$3533
ld a, a                           ;$3534
ld a, a                           ;$3535
ld a, a                           ;$3536
ld a, a                           ;$3537
ld a, a                           ;$3538
nop                               ;$3539
nop                               ;$353a
nop                               ;$353b
ld a, a                           ;$353c
nop                               ;$353d
nop                               ;$353e
nop                               ;$353f
nop                               ;$3540
nop                               ;$3541
nop                               ;$3542
nop                               ;$3543
nop                               ;$3544
xor d                             ;$3545
xor d                             ;$3546
nop                               ;$3547
nop                               ;$3548
nop                               ;$3549
nop                               ;$354a
nop                               ;$354b
nop                               ;$354c
nop                               ;$354d
nop                               ;$354e
nop                               ;$354f
nop                               ;$3550
nop                               ;$3551
nop                               ;$3552
rrca                              ;$3553
rrca                              ;$3554
rra                               ;$3555
rra                               ;$3556
jr c, $3591                       ;$3557
inc sp                            ;$3559
jr nc, $3592                      ;$355a
jr nc, $3592                      ;$355c
jr nc, $3560                      ;$355e
nop                               ;$3560
nop                               ;$3561
nop                               ;$3562
rst $38                           ;$3563
rst $38                           ;$3564
rst $38                           ;$3565
rst $38                           ;$3566
nop                               ;$3567
nop                               ;$3568
rst $38                           ;$3569
nop                               ;$356a
nop                               ;$356b
nop                               ;$356c
nop                               ;$356d
nop                               ;$356e
nop                               ;$356f
nop                               ;$3570
nop                               ;$3571
nop                               ;$3572
ldh a, [$fff0]                    ;$3573
ld hl, sp+$f8                     ;$3575
inc e                             ;$3577
inc e                             ;$3578
call z, $6c0c                     ;$3579
inc c                             ;$357c
inc l                             ;$357d
inc c                             ;$357e
inc [hl]                          ;$357f
jr nc, $35b6                      ;$3580
jr nc, $35b8                      ;$3582
jr nc, $35ba                      ;$3584
jr nc, $35bc                      ;$3586
jr nc, $35be                      ;$3588
jr nc, $35c0                      ;$358a
jr nc, $35c2                      ;$358c
jr nc, $35bc                      ;$358e
inc c                             ;$3590
inc l                             ;$3591
inc c                             ;$3592
inc l                             ;$3593
inc c                             ;$3594
inc l                             ;$3595
inc c                             ;$3596
inc l                             ;$3597
inc c                             ;$3598
inc l                             ;$3599
inc c                             ;$359a
inc l                             ;$359b
inc c                             ;$359c
inc l                             ;$359d
inc c                             ;$359e
inc [hl]                          ;$359f
jr nc, $35d8                      ;$35a0
jr nc, $35d7                      ;$35a2
jr nc, $35de                      ;$35a4
jr c, $35c7                       ;$35a6
rra                               ;$35a8
rrca                              ;$35a9
rrca                              ;$35aa
nop                               ;$35ab
nop                               ;$35ac
nop                               ;$35ad
nop                               ;$35ae
nop                               ;$35af
ld a, e                           ;$35b0
nop                               ;$35b1
ld a, c                           ;$35b2
nop                               ;$35b3
ld a, h                           ;$35b4
nop                               ;$35b5
ld a, a                           ;$35b6
nop                               ;$35b7
ld a, a                           ;$35b8
nop                               ;$35b9
nop                               ;$35ba
nop                               ;$35bb
ld a, a                           ;$35bc
nop                               ;$35bd
nop                               ;$35be
nop                               ;$35bf
rst $18                           ;$35c0
nop                               ;$35c1
sbc a                             ;$35c2
nop                               ;$35c3
ccf                               ;$35c4
nop                               ;$35c5
rst $38                           ;$35c6
nop                               ;$35c7
rst $38                           ;$35c8
nop                               ;$35c9
nop                               ;$35ca
nop                               ;$35cb
rst $38                           ;$35cc
nop                               ;$35cd
nop                               ;$35ce
nop                               ;$35cf
nop                               ;$35d0
nop                               ;$35d1
nop                               ;$35d2
rst $38                           ;$35d3
nop                               ;$35d4
nop                               ;$35d5
nop                               ;$35d6
rst $38                           ;$35d7
rst $38                           ;$35d8
rst $38                           ;$35d9
rst $38                           ;$35da
nop                               ;$35db
nop                               ;$35dc
nop                               ;$35dd
nop                               ;$35de
inc l                             ;$35df
inc c                             ;$35e0
ld l, h                           ;$35e1
inc c                             ;$35e2
call z, $1c0c                     ;$35e3
inc e                             ;$35e6
ld hl, sp+$f8                     ;$35e7
ldh a, [$fff0]                    ;$35e9
nop                               ;$35eb
nop                               ;$35ec
nop                               ;$35ed
nop                               ;$35ee
ld [$ff08], sp                    ;$35ef
rst $38                           ;$35f2
rst $38                           ;$35f3
ld [bc], a                        ;$35f4
rst $38                           ;$35f5
nop                               ;$35f6
rst $38                           ;$35f7
jr nz, $35f9                      ;$35f8
nop                               ;$35fa
rst $38                           ;$35fb
ld [bc], a                        ;$35fc
rst $38                           ;$35fd
nop                               ;$35fe
nop                               ;$35ff
nop                               ;$3600
rst $38                           ;$3601
rst $38                           ;$3602
rst $38                           ;$3603
rst $38                           ;$3604
rst $38                           ;$3605
nop                               ;$3606
rst $38                           ;$3607
ld [bc], a                        ;$3608
rst $38                           ;$3609
jr nz, $360b                      ;$360a
rst $38                           ;$360c
ld [$ff08], sp                    ;$360d
rlca                              ;$3610
rst $38                           ;$3611
inc de                            ;$3612
rst $38                           ;$3613
ld bc, $00ff                      ;$3614
rst $38                           ;$3617
ld b, b                           ;$3618
rst $38                           ;$3619
nop                               ;$361a
rst $38                           ;$361b
rst $38                           ;$361c
nop                               ;$361d
nop                               ;$361e
rst $38                           ;$361f
ldh [$ffff], a                    ;$3620
ret z                             ;$3622
rst $38                           ;$3623
add b                             ;$3624
rst $38                           ;$3625
nop                               ;$3626
rst $38                           ;$3627
ld [bc], a                        ;$3628
rst $38                           ;$3629
nop                               ;$362a
rst $38                           ;$362b
rst $38                           ;$362c
nop                               ;$362d
nop                               ;$362e
ld [$0808], sp                    ;$362f
ld [$0808], sp                    ;$3632
ld [$0808], sp                    ;$3635
ld [$0808], sp                    ;$3638
ld [$0808], sp                    ;$363b
ld [$00ff], sp                    ;$363e
rst $38                           ;$3641
ld [bc], a                        ;$3642
rst $38                           ;$3643
nop                               ;$3644
rst $38                           ;$3645
jr nz, $3647                      ;$3646
ld [bc], a                        ;$3648
rst $38                           ;$3649
nop                               ;$364a
rst $38                           ;$364b
rst $38                           ;$364c
ld [$f008], sp                    ;$364d
db $10 ;<corrupted stop>          ;$3650
rst $38                           ;$3651
rra                               ;$3652
ldh a, [$ff1f]                    ;$3653
ldh a, [$ff1f]                    ;$3655
ldh a, [$ff1f]                    ;$3657
ldh a, [$ff1f]                    ;$3659
rst $38                           ;$365b
ld e, a                           ;$365c
ldh a, [$ff10]                    ;$365d
nop                               ;$365f
nop                               ;$3660
rst $38                           ;$3661
rst $38                           ;$3662
nop                               ;$3663
rst $38                           ;$3664
nop                               ;$3665
rst $38                           ;$3666
nop                               ;$3667
rst $38                           ;$3668
nop                               ;$3669
rst $38                           ;$366a
rst $38                           ;$366b
rst $38                           ;$366c
nop                               ;$366d
nop                               ;$366e
ld [$ff08], sp                    ;$366f
rst $38                           ;$3672
nop                               ;$3673
rst $38                           ;$3674
nop                               ;$3675
rst $38                           ;$3676
nop                               ;$3677
rst $38                           ;$3678
nop                               ;$3679
rst $38                           ;$367a
rst $38                           ;$367b
rst $38                           ;$367c
ld [$0f08], sp                    ;$367d
ld [$f8ff], sp                    ;$3680
rrca                              ;$3683
ld hl, sp+$0f                     ;$3684
ld hl, sp+$0f                     ;$3686
ld hl, sp+$0f                     ;$3688
ld hl, sp+$ff                     ;$368a
ld a, [$080f]                     ;$368c
rst $38                           ;$368f
rlca                              ;$3690
rst $38                           ;$3691
ld b, e                           ;$3692
rst $38                           ;$3693
ld bc, $00ff                      ;$3694
rst $38                           ;$3697
nop                               ;$3698
rst $38                           ;$3699
add b                             ;$369a
rst $38                           ;$369b
rra                               ;$369c
ldh a, [$ff10]                    ;$369d
rst $38                           ;$369f
ldh [$ffff], a                    ;$36a0
jp nz, $80ff                      ;$36a2
rst $38                           ;$36a5
nop                               ;$36a6
rst $38                           ;$36a7
ldi [hl], a                       ;$36a8
rst $38                           ;$36a9
nop                               ;$36aa
rst $38                           ;$36ab
ld hl, sp+$0f                     ;$36ac
ld [$0000], sp                    ;$36ae
nop                               ;$36b1
nop                               ;$36b2
nop                               ;$36b3
nop                               ;$36b4
inc a                             ;$36b5
nop                               ;$36b6
inc a                             ;$36b7
nop                               ;$36b8
nop                               ;$36b9
nop                               ;$36ba
nop                               ;$36bb
nop                               ;$36bc
nop                               ;$36bd
nop                               ;$36be
nop                               ;$36bf
nop                               ;$36c0
inc a                             ;$36c1
nop                               ;$36c2
ld c, [hl]                        ;$36c3
nop                               ;$36c4
ld c, [hl]                        ;$36c5
nop                               ;$36c6
ld a, [hl]                        ;$36c7
nop                               ;$36c8
ld c, [hl]                        ;$36c9
nop                               ;$36ca
ld c, [hl]                        ;$36cb
nop                               ;$36cc
nop                               ;$36cd
nop                               ;$36ce
nop                               ;$36cf
nop                               ;$36d0
ld a, h                           ;$36d1
nop                               ;$36d2
ld h, [hl]                        ;$36d3
nop                               ;$36d4
ld a, h                           ;$36d5
nop                               ;$36d6
ld h, [hl]                        ;$36d7
nop                               ;$36d8
ld h, [hl]                        ;$36d9
nop                               ;$36da
ld a, h                           ;$36db
nop                               ;$36dc
nop                               ;$36dd
nop                               ;$36de
nop                               ;$36df
nop                               ;$36e0
inc a                             ;$36e1
nop                               ;$36e2
ld h, [hl]                        ;$36e3
nop                               ;$36e4
ld h, b                           ;$36e5
nop                               ;$36e6
ld h, b                           ;$36e7
nop                               ;$36e8
ld h, [hl]                        ;$36e9
nop                               ;$36ea
inc a                             ;$36eb
nop                               ;$36ec
nop                               ;$36ed
nop                               ;$36ee
db $dd ;<unknown instruction>     ;$36ef
ld b, h                           ;$36f0
rst $38                           ;$36f1
ld b, h                           ;$36f2
rst $38                           ;$36f3
rst $38                           ;$36f4
ld [hl], a                        ;$36f5
ld de, $11ff                      ;$36f6
rst $38                           ;$36f9
rst $38                           ;$36fa
db $dd ;<unknown instruction>     ;$36fb
ld b, h                           ;$36fc
rst $38                           ;$36fd
ld b, h                           ;$36fe
rst $38                           ;$36ff
rst $38                           ;$3700
ld [hl], a                        ;$3701
ld de, $11ff                      ;$3702
rst $38                           ;$3705
rst $38                           ;$3706
db $dd ;<unknown instruction>     ;$3707
ld b, h                           ;$3708
rst $38                           ;$3709
ld b, h                           ;$370a
rst $38                           ;$370b
rst $38                           ;$370c
ld [hl], a                        ;$370d
ld de, $11ff                      ;$370e
rst $38                           ;$3711
rst $38                           ;$3712
db $dd ;<unknown instruction>     ;$3713
ld b, h                           ;$3714
rst $38                           ;$3715
ld b, h                           ;$3716
rst $38                           ;$3717
rst $38                           ;$3718
ld [hl], a                        ;$3719
ld de, $11ff                      ;$371a
rst $38                           ;$371d
rst $38                           ;$371e
nop                               ;$371f
nop                               ;$3720
ld a, [hl]                        ;$3721
nop                               ;$3722
jr $3725                          ;$3723
jr $3727                          ;$3725
jr $3729                          ;$3727
jr $372b                          ;$3729
jr $372d                          ;$372b
nop                               ;$372d
nop                               ;$372e
nop                               ;$372f
nop                               ;$3730
ld h, [hl]                        ;$3731
nop                               ;$3732
ld h, [hl]                        ;$3733
nop                               ;$3734
inc a                             ;$3735
nop                               ;$3736
jr $3739                          ;$3737
jr $373b                          ;$3739
jr $373d                          ;$373b
nop                               ;$373d
nop                               ;$373e
rst $38                           ;$373f
rst $38                           ;$3740
rst $30                           ;$3741
adc c                             ;$3742
db $dd ;<unknown instruction>     ;$3743
and e                             ;$3744
rst $38                           ;$3745
add c                             ;$3746
or a                              ;$3747
ret                               ;$3748
db $fd ;<unknown instruction>     ;$3749
add e                             ;$374a
rst $10                           ;$374b
xor c                             ;$374c
rst $38                           ;$374d
add c                             ;$374e
rst $38                           ;$374f
rst $38                           ;$3750
rst $38                           ;$3751
add c                             ;$3752
rst $38                           ;$3753
cp l                              ;$3754
rst $20                           ;$3755
and l                             ;$3756
rst $20                           ;$3757
and l                             ;$3758
rst $38                           ;$3759
cp l                              ;$375a
rst $38                           ;$375b
add c                             ;$375c
rst $38                           ;$375d
rst $38                           ;$375e
rst $38                           ;$375f
rst $38                           ;$3760
rst $38                           ;$3761
add c                             ;$3762
rst $38                           ;$3763
add c                             ;$3764
rst $38                           ;$3765
sbc c                             ;$3766
rst $38                           ;$3767
sbc c                             ;$3768
rst $38                           ;$3769
add c                             ;$376a
rst $38                           ;$376b
add c                             ;$376c
rst $38                           ;$376d
rst $38                           ;$376e
rst $38                           ;$376f
rst $38                           ;$3770
add c                             ;$3771
add c                             ;$3772
cp l                              ;$3773
cp l                              ;$3774
cp l                              ;$3775
cp l                              ;$3776
cp l                              ;$3777
cp l                              ;$3778
cp l                              ;$3779
cp l                              ;$377a
add c                             ;$377b
add c                             ;$377c
rst $38                           ;$377d
rst $38                           ;$377e
rst $38                           ;$377f
rst $38                           ;$3780
add c                             ;$3781
rst $38                           ;$3782
add c                             ;$3783
rst $38                           ;$3784
add c                             ;$3785
rst $38                           ;$3786
add c                             ;$3787
rst $38                           ;$3788
add c                             ;$3789
rst $38                           ;$378a
add c                             ;$378b
rst $38                           ;$378c
rst $38                           ;$378d
rst $38                           ;$378e
rst $38                           ;$378f
rst $38                           ;$3790
rst $38                           ;$3791
add c                             ;$3792
jp $df81                          ;$3793
add l                             ;$3796
rst $18                           ;$3797
add l                             ;$3798
rst $38                           ;$3799
cp l                              ;$379a
rst $38                           ;$379b
add c                             ;$379c
rst $38                           ;$379d
rst $38                           ;$379e
rst $38                           ;$379f
rst $38                           ;$37a0
add c                             ;$37a1
rst $38                           ;$37a2
cp l                              ;$37a3
rst $38                           ;$37a4
and l                             ;$37a5
rst $20                           ;$37a6
and l                             ;$37a7
rst $20                           ;$37a8
cp l                              ;$37a9
rst $38                           ;$37aa
add c                             ;$37ab
rst $38                           ;$37ac
rst $38                           ;$37ad
rst $38                           ;$37ae
rst $38                           ;$37af
rst $38                           ;$37b0
add c                             ;$37b1
add c                             ;$37b2
cp l                              ;$37b3
add e                             ;$37b4
cp l                              ;$37b5
add e                             ;$37b6
cp l                              ;$37b7
add e                             ;$37b8
cp l                              ;$37b9
add e                             ;$37ba
add c                             ;$37bb
rst $38                           ;$37bc
rst $38                           ;$37bd
rst $38                           ;$37be
db $ed ;<unknown instruction>     ;$37bf
sub e                             ;$37c0
cp a                              ;$37c1
pop bc                            ;$37c2
push af                           ;$37c3
adc e                             ;$37c4
rst $18                           ;$37c5
and c                             ;$37c6
db $fd ;<unknown instruction>     ;$37c7
add e                             ;$37c8
xor a                             ;$37c9
pop de                            ;$37ca
ei                                ;$37cb
add l                             ;$37cc
rst $18                           ;$37cd
and c                             ;$37ce
db $fd ;<unknown instruction>     ;$37cf
add e                             ;$37d0
rst $28                           ;$37d1
sub c                             ;$37d2
cp e                              ;$37d3
push bc                           ;$37d4
rst $28                           ;$37d5
sub c                             ;$37d6
cp l                              ;$37d7
jp $89f7                          ;$37d8
rst $18                           ;$37db
and c                             ;$37dc
rst $38                           ;$37dd
rst $38                           ;$37de
rst $38                           ;$37df
rst $38                           ;$37e0
db $db ;<unknown instruction>     ;$37e1
and h                             ;$37e2
rst $38                           ;$37e3
add b                             ;$37e4
or l                              ;$37e5
jp z, $80ff                       ;$37e6
db $dd ;<unknown instruction>     ;$37e9
and d                             ;$37ea
rst $30                           ;$37eb
adc b                             ;$37ec
rst $38                           ;$37ed
rst $38                           ;$37ee
rst $38                           ;$37ef
rst $38                           ;$37f0
ld d, a                           ;$37f1
xor b                             ;$37f2
db $fd ;<unknown instruction>     ;$37f3
ld [bc], a                        ;$37f4
rst $18                           ;$37f5
jr nz, $3873                      ;$37f6
add h                             ;$37f8
xor $11                           ;$37f9
cp e                              ;$37fb
ld b, h                           ;$37fc
rst $38                           ;$37fd
rst $38                           ;$37fe
rst $38                           ;$37ff
nop                               ;$3800
rst $38                           ;$3801
nop                               ;$3802
rst $38                           ;$3803
nop                               ;$3804
rst $38                           ;$3805
nop                               ;$3806
rst $38                           ;$3807
nop                               ;$3808
rst $38                           ;$3809
nop                               ;$380a
rst $38                           ;$380b
nop                               ;$380c
rst $38                           ;$380d
nop                               ;$380e
nop                               ;$380f
rst $38                           ;$3810
nop                               ;$3811
rst $38                           ;$3812
nop                               ;$3813
rst $38                           ;$3814
nop                               ;$3815
rst $38                           ;$3816
nop                               ;$3817
rst $38                           ;$3818
nop                               ;$3819
rst $38                           ;$381a
nop                               ;$381b
rst $38                           ;$381c
nop                               ;$381d
rst $38                           ;$381e
rst $38                           ;$381f
rst $38                           ;$3820
rst $38                           ;$3821
rst $38                           ;$3822
rst $38                           ;$3823
rst $38                           ;$3824
rst $38                           ;$3825
rst $38                           ;$3826
rst $38                           ;$3827
rst $38                           ;$3828
rst $38                           ;$3829
rst $38                           ;$382a
rst $38                           ;$382b
rst $38                           ;$382c
rst $38                           ;$382d
rst $38                           ;$382e
rst $38                           ;$382f
rst $38                           ;$3830
ld [hl], a                        ;$3831
adc c                             ;$3832
rst $18                           ;$3833
ld hl, $05fb                      ;$3834
xor a                             ;$3837
ld d, c                           ;$3838
db $fd ;<unknown instruction>     ;$3839
inc bc                            ;$383a
rst $10                           ;$383b
add hl, hl                        ;$383c
rst $38                           ;$383d
rst $38                           ;$383e
nop                               ;$383f
nop                               ;$3840
inc a                             ;$3841
nop                               ;$3842
ld h, [hl]                        ;$3843
nop                               ;$3844
ld h, [hl]                        ;$3845
nop                               ;$3846
ld h, [hl]                        ;$3847
nop                               ;$3848
ld h, [hl]                        ;$3849
nop                               ;$384a
inc a                             ;$384b
nop                               ;$384c
nop                               ;$384d
nop                               ;$384e
nop                               ;$384f
nop                               ;$3850
jr $3853                          ;$3851
jr c, $3855                       ;$3853
jr $3857                          ;$3855
jr $3859                          ;$3857
jr $385b                          ;$3859
inc a                             ;$385b
nop                               ;$385c
nop                               ;$385d
nop                               ;$385e
nop                               ;$385f
nop                               ;$3860
inc a                             ;$3861
nop                               ;$3862
ld c, [hl]                        ;$3863
nop                               ;$3864
ld c, $00                         ;$3865
inc a                             ;$3867
nop                               ;$3868
ld [hl], b                        ;$3869
nop                               ;$386a
ld a, [hl]                        ;$386b
nop                               ;$386c
nop                               ;$386d
nop                               ;$386e
nop                               ;$386f
nop                               ;$3870
ld a, h                           ;$3871
nop                               ;$3872
ld c, $00                         ;$3873
inc a                             ;$3875
nop                               ;$3876
ld c, $00                         ;$3877
ld c, $00                         ;$3879
ld a, h                           ;$387b
nop                               ;$387c
nop                               ;$387d
nop                               ;$387e
nop                               ;$387f
nop                               ;$3880
inc a                             ;$3881
nop                               ;$3882
ld l, h                           ;$3883
nop                               ;$3884
ld c, h                           ;$3885
nop                               ;$3886
ld c, [hl]                        ;$3887
nop                               ;$3888
ld a, [hl]                        ;$3889
nop                               ;$388a
inc c                             ;$388b
nop                               ;$388c
nop                               ;$388d
nop                               ;$388e
nop                               ;$388f
nop                               ;$3890
ld a, h                           ;$3891
nop                               ;$3892
ld h, b                           ;$3893
nop                               ;$3894
ld a, h                           ;$3895
nop                               ;$3896
ld c, $00                         ;$3897
ld c, [hl]                        ;$3899
nop                               ;$389a
inc a                             ;$389b
nop                               ;$389c
nop                               ;$389d
nop                               ;$389e
nop                               ;$389f
nop                               ;$38a0
inc a                             ;$38a1
nop                               ;$38a2
ld h, b                           ;$38a3
nop                               ;$38a4
ld a, h                           ;$38a5
nop                               ;$38a6
ld h, [hl]                        ;$38a7
nop                               ;$38a8
ld h, [hl]                        ;$38a9
nop                               ;$38aa
inc a                             ;$38ab
nop                               ;$38ac
nop                               ;$38ad
nop                               ;$38ae
nop                               ;$38af
nop                               ;$38b0
ld a, [hl]                        ;$38b1
nop                               ;$38b2
ld b, $00                         ;$38b3
inc c                             ;$38b5
nop                               ;$38b6
jr $38b9                          ;$38b7
jr c, $38bb                       ;$38b9
jr c, $38bd                       ;$38bb
nop                               ;$38bd
nop                               ;$38be
nop                               ;$38bf
nop                               ;$38c0
inc a                             ;$38c1
nop                               ;$38c2
ld c, [hl]                        ;$38c3
nop                               ;$38c4
inc a                             ;$38c5
nop                               ;$38c6
ld c, [hl]                        ;$38c7
nop                               ;$38c8
ld c, [hl]                        ;$38c9
nop                               ;$38ca
inc a                             ;$38cb
nop                               ;$38cc
nop                               ;$38cd
nop                               ;$38ce
nop                               ;$38cf
nop                               ;$38d0
inc a                             ;$38d1
nop                               ;$38d2
ld c, [hl]                        ;$38d3
nop                               ;$38d4
ld c, [hl]                        ;$38d5
nop                               ;$38d6
ld a, $00                         ;$38d7
ld c, $00                         ;$38d9
inc a                             ;$38db
nop                               ;$38dc
nop                               ;$38dd
nop                               ;$38de
nop                               ;$38df
nop                               ;$38e0
ld a, h                           ;$38e1
nop                               ;$38e2
ld h, [hl]                        ;$38e3
nop                               ;$38e4
ld h, [hl]                        ;$38e5
nop                               ;$38e6
ld a, h                           ;$38e7
nop                               ;$38e8
ld h, b                           ;$38e9
nop                               ;$38ea
ld h, b                           ;$38eb
nop                               ;$38ec
nop                               ;$38ed
nop                               ;$38ee
nop                               ;$38ef
nop                               ;$38f0
ld a, [hl]                        ;$38f1
nop                               ;$38f2
ld h, b                           ;$38f3
nop                               ;$38f4
ld a, h                           ;$38f5
nop                               ;$38f6
ld h, b                           ;$38f7
nop                               ;$38f8
ld h, b                           ;$38f9
nop                               ;$38fa
ld a, [hl]                        ;$38fb
nop                               ;$38fc
nop                               ;$38fd
nop                               ;$38fe
nop                               ;$38ff
nop                               ;$3900
ld a, [hl]                        ;$3901
nop                               ;$3902
ld h, b                           ;$3903
nop                               ;$3904
ld h, b                           ;$3905
nop                               ;$3906
ld a, h                           ;$3907
nop                               ;$3908
ld h, b                           ;$3909
nop                               ;$390a
ld h, b                           ;$390b
nop                               ;$390c
nop                               ;$390d
nop                               ;$390e
nop                               ;$390f
nop                               ;$3910
inc a                             ;$3911
nop                               ;$3912
ld h, [hl]                        ;$3913
nop                               ;$3914
ld h, [hl]                        ;$3915
nop                               ;$3916
ld h, [hl]                        ;$3917
nop                               ;$3918
ld h, [hl]                        ;$3919
nop                               ;$391a
inc a                             ;$391b
nop                               ;$391c
nop                               ;$391d
nop                               ;$391e
nop                               ;$391f
nop                               ;$3920
inc a                             ;$3921
nop                               ;$3922
ld h, [hl]                        ;$3923
nop                               ;$3924
ld h, b                           ;$3925
nop                               ;$3926
ld l, [hl]                        ;$3927
nop                               ;$3928
ld h, [hl]                        ;$3929
nop                               ;$392a
ld a, $00                         ;$392b
nop                               ;$392d
nop                               ;$392e
nop                               ;$392f
nop                               ;$3930
ld b, [hl]                        ;$3931
nop                               ;$3932
ld l, [hl]                        ;$3933
nop                               ;$3934
ld a, [hl]                        ;$3935
nop                               ;$3936
ld d, [hl]                        ;$3937
nop                               ;$3938
ld b, [hl]                        ;$3939
nop                               ;$393a
ld b, [hl]                        ;$393b
nop                               ;$393c
nop                               ;$393d
nop                               ;$393e
nop                               ;$393f
nop                               ;$3940
ld b, [hl]                        ;$3941
nop                               ;$3942
ld b, [hl]                        ;$3943
nop                               ;$3944
ld b, [hl]                        ;$3945
nop                               ;$3946
ld b, [hl]                        ;$3947
nop                               ;$3948
ld c, [hl]                        ;$3949
nop                               ;$394a
inc a                             ;$394b
nop                               ;$394c
nop                               ;$394d
nop                               ;$394e
nop                               ;$394f
nop                               ;$3950
inc a                             ;$3951
nop                               ;$3952
ld h, b                           ;$3953
nop                               ;$3954
inc a                             ;$3955
nop                               ;$3956
ld c, $00                         ;$3957
ld c, [hl]                        ;$3959
nop                               ;$395a
inc a                             ;$395b
nop                               ;$395c
nop                               ;$395d
nop                               ;$395e
nop                               ;$395f
nop                               ;$3960
inc a                             ;$3961
nop                               ;$3962
jr $3965                          ;$3963
jr $3967                          ;$3965
jr $3969                          ;$3967
jr $396b                          ;$3969
inc a                             ;$396b
nop                               ;$396c
nop                               ;$396d
nop                               ;$396e
nop                               ;$396f
nop                               ;$3970
ld h, b                           ;$3971
nop                               ;$3972
ld h, b                           ;$3973
nop                               ;$3974
ld h, b                           ;$3975
nop                               ;$3976
ld h, b                           ;$3977
nop                               ;$3978
ld h, b                           ;$3979
nop                               ;$397a
ld a, [hl]                        ;$397b
nop                               ;$397c
nop                               ;$397d
nop                               ;$397e
nop                               ;$397f
nop                               ;$3980
ld b, [hl]                        ;$3981
nop                               ;$3982
ld b, [hl]                        ;$3983
nop                               ;$3984
ld b, [hl]                        ;$3985
nop                               ;$3986
ld b, [hl]                        ;$3987
nop                               ;$3988
inc l                             ;$3989
nop                               ;$398a
jr $398d                          ;$398b
nop                               ;$398d
nop                               ;$398e
nop                               ;$398f
nop                               ;$3990
ld a, h                           ;$3991
nop                               ;$3992
ld h, [hl]                        ;$3993
nop                               ;$3994
ld h, [hl]                        ;$3995
nop                               ;$3996
ld a, h                           ;$3997
nop                               ;$3998
ld l, b                           ;$3999
nop                               ;$399a
ld h, [hl]                        ;$399b
nop                               ;$399c
nop                               ;$399d
nop                               ;$399e
nop                               ;$399f
nop                               ;$39a0
ld b, [hl]                        ;$39a1
nop                               ;$39a2
ld h, [hl]                        ;$39a3
nop                               ;$39a4
halt                              ;$39a5
nop                               ;$39a6
ld e, [hl]                        ;$39a7
nop                               ;$39a8
ld c, [hl]                        ;$39a9
nop                               ;$39aa
ld b, [hl]                        ;$39ab
nop                               ;$39ac
nop                               ;$39ad
nop                               ;$39ae
nop                               ;$39af
nop                               ;$39b0
ld a, h                           ;$39b1
nop                               ;$39b2
ld c, [hl]                        ;$39b3
nop                               ;$39b4
ld c, [hl]                        ;$39b5
nop                               ;$39b6
ld c, [hl]                        ;$39b7
nop                               ;$39b8
ld c, [hl]                        ;$39b9
nop                               ;$39ba
ld a, h                           ;$39bb
nop                               ;$39bc
nop                               ;$39bd
nop                               ;$39be
rst $38                           ;$39bf
rst $38                           ;$39c0
rst $38                           ;$39c1
nop                               ;$39c2
rst $38                           ;$39c3
nop                               ;$39c4
rst $38                           ;$39c5
nop                               ;$39c6
rst $38                           ;$39c7
db $10 ;<corrupted stop>          ;$39c8
rst $38                           ;$39c9
add b                             ;$39ca
rst $38                           ;$39cb
ld [bc], a                        ;$39cc
rst $38                           ;$39cd
nop                               ;$39ce
nop                               ;$39cf
nop                               ;$39d0
rst $38                           ;$39d1
rst $38                           ;$39d2
rst $38                           ;$39d3
rst $38                           ;$39d4
rst $38                           ;$39d5
nop                               ;$39d6
rst $38                           ;$39d7
ld [bc], a                        ;$39d8
rst $38                           ;$39d9
jr nz, $39db                      ;$39da
rst $38                           ;$39dc
add b                             ;$39dd
add b                             ;$39de
add b                             ;$39df
add b                             ;$39e0
add b                             ;$39e1
add b                             ;$39e2
add b                             ;$39e3
add b                             ;$39e4
add b                             ;$39e5
add b                             ;$39e6
add b                             ;$39e7
add b                             ;$39e8
add b                             ;$39e9
add b                             ;$39ea
add b                             ;$39eb
add b                             ;$39ec
add b                             ;$39ed
add b                             ;$39ee
add b                             ;$39ef
add b                             ;$39f0
rst $38                           ;$39f1
rst $38                           ;$39f2
nop                               ;$39f3
rst $38                           ;$39f4
nop                               ;$39f5
rst $38                           ;$39f6
nop                               ;$39f7
rst $38                           ;$39f8
nop                               ;$39f9
rst $38                           ;$39fa
rst $38                           ;$39fb
rst $38                           ;$39fc
add b                             ;$39fd
add b                             ;$39fe
add b                             ;$39ff
add b                             ;$3a00
rst $38                           ;$3a01
rst $38                           ;$3a02
rst $38                           ;$3a03
nop                               ;$3a04
rst $38                           ;$3a05
ld [bc], a                        ;$3a06
rst $38                           ;$3a07
jr nz, $3a09                      ;$3a08
nop                               ;$3a0a
rst $38                           ;$3a0b
nop                               ;$3a0c
rst $38                           ;$3a0d
nop                               ;$3a0e
rst $38                           ;$3a0f
nop                               ;$3a10
nop                               ;$3a11
nop                               ;$3a12
nop                               ;$3a13
nop                               ;$3a14
nop                               ;$3a15
nop                               ;$3a16
nop                               ;$3a17
nop                               ;$3a18
nop                               ;$3a19
nop                               ;$3a1a
nop                               ;$3a1b
nop                               ;$3a1c
nop                               ;$3a1d
nop                               ;$3a1e
rlca                              ;$3a1f
rlca                              ;$3a20
jr $3a42                          ;$3a21
ld hl, $473e                      ;$3a23
ld a, a                           ;$3a26
ld e, a                           ;$3a27
ld a, a                           ;$3a28
add hl, sp                        ;$3a29
jr nc, $3aa7                      ;$3a2a
ld h, d                           ;$3a2c
ei                                ;$3a2d
or d                              ;$3a2e
rst $38                           ;$3a2f
and b                             ;$3a30
rst $38                           ;$3a31
jp nz, $547f                      ;$3a32
ld a, a                           ;$3a35
ld e, h                           ;$3a36
ccf                               ;$3a37
ld l, $7f                         ;$3a38
ld h, e                           ;$3a3a
cp a                              ;$3a3b
ld hl, sp+$37                     ;$3a3c
rst $38                           ;$3a3e
ld bc, $0101                      ;$3a3f
ld bc, $0101                      ;$3a42
ld bc, $0101                      ;$3a45
ld bc, $0101                      ;$3a48
ld bc, $8301                      ;$3a4b
add e                             ;$3a4e
ld bc, $0101                      ;$3a4f
ld bc, $0101                      ;$3a52
ld bc, $0101                      ;$3a55
ld bc, $0101                      ;$3a58
ld bc, $ff01                      ;$3a5b
rst $38                           ;$3a5e
rst $38                           ;$3a5f
rst $38                           ;$3a60
ld bc, $0101                      ;$3a61
ld bc, $0101                      ;$3a64
ld bc, $0101                      ;$3a67
ld bc, $0101                      ;$3a6a
add e                             ;$3a6d
add e                             ;$3a6e
rst $38                           ;$3a6f
rst $38                           ;$3a70
reti                              ;$3a71
add a                             ;$3a72
reti                              ;$3a73
add a                             ;$3a74
reti                              ;$3a75
add a                             ;$3a76
reti                              ;$3a77
add a                             ;$3a78
reti                              ;$3a79
add a                             ;$3a7a
reti                              ;$3a7b
add a                             ;$3a7c
reti                              ;$3a7d
add a                             ;$3a7e
reti                              ;$3a7f
add a                             ;$3a80
reti                              ;$3a81
add a                             ;$3a82
reti                              ;$3a83
add a                             ;$3a84
reti                              ;$3a85
add a                             ;$3a86
reti                              ;$3a87
add a                             ;$3a88
reti                              ;$3a89
add a                             ;$3a8a
reti                              ;$3a8b
add a                             ;$3a8c
rst $38                           ;$3a8d
rst $38                           ;$3a8e
reti                              ;$3a8f
add a                             ;$3a90
reti                              ;$3a91
add a                             ;$3a92
reti                              ;$3a93
add a                             ;$3a94
reti                              ;$3a95
add a                             ;$3a96
reti                              ;$3a97
add a                             ;$3a98
reti                              ;$3a99
add a                             ;$3a9a
reti                              ;$3a9b
add a                             ;$3a9c
reti                              ;$3a9d
add a                             ;$3a9e
nop                               ;$3a9f
jr c, $3aa2                       ;$3aa0
jr c, $3aa4                       ;$3aa2
jr c, $3aa6                       ;$3aa4
jr c, $3aa8                       ;$3aa6
jr c, $3aaa                       ;$3aa8
jr c, $3aac                       ;$3aaa
jr c, $3aae                       ;$3aac
jr c, $3b2c                       ;$3aae
nop                               ;$3ab0
ld a, h                           ;$3ab1
nop                               ;$3ab2
ld a, h                           ;$3ab3
nop                               ;$3ab4
ld a, h                           ;$3ab5
nop                               ;$3ab6
ld a, h                           ;$3ab7
nop                               ;$3ab8
ld a, h                           ;$3ab9
nop                               ;$3aba
ld a, a                           ;$3abb
nop                               ;$3abc
rst $38                           ;$3abd
nop                               ;$3abe
nop                               ;$3abf
nop                               ;$3ac0
nop                               ;$3ac1
nop                               ;$3ac2
ld [$0800], sp                    ;$3ac3
nop                               ;$3ac6
ld [$0800], sp                    ;$3ac7
nop                               ;$3aca
inc e                             ;$3acb
nop                               ;$3acc
inc e                             ;$3acd
nop                               ;$3ace
nop                               ;$3acf
nop                               ;$3ad0
nop                               ;$3ad1
ld c, $01                         ;$3ad2
dec e                             ;$3ad4
ld e, $06                         ;$3ad5
ldi a, [hl]                       ;$3ad7
ldi a, [hl]                       ;$3ad8
daa                               ;$3ad9
daa                               ;$3ada
db $10 ;<corrupted stop>          ;$3adb
inc de                            ;$3adc
inc c                             ;$3add
dec c                             ;$3ade
nop                               ;$3adf
nop                               ;$3ae0
ret nz                            ;$3ae1
ret nz                            ;$3ae2
jr nz, $3b05                      ;$3ae3
db $10 ;<corrupted stop>          ;$3ae5
ret nc                            ;$3ae6
ret nc                            ;$3ae7
db $10 ;<corrupted stop>          ;$3ae8
ldh a, [$ff30]                    ;$3ae9
ret z                             ;$3aeb
add sp, $08                       ;$3aec
add sp, $04                       ;$3aee
rlca                              ;$3af0
inc bc                            ;$3af1
inc bc                            ;$3af2
inc c                             ;$3af3
inc c                             ;$3af4
db $10 ;<corrupted stop>          ;$3af5
db $10 ;<corrupted stop>          ;$3af6
dec [hl]                          ;$3af7
jr nz, $3b24                      ;$3af8
jr nz, $3b3b                      ;$3afa
ccf                               ;$3afc
inc c                             ;$3afd
inc c                             ;$3afe
jr z, $3ae9                       ;$3aff
ret c                             ;$3b01
ret nz                            ;$3b02
ld b, b                           ;$3b03
ld b, b                           ;$3b04
jr nz, $3b27                      ;$3b05
ld d, b                           ;$3b07
db $10 ;<corrupted stop>          ;$3b08
or b                              ;$3b09
db $10 ;<corrupted stop>          ;$3b0a
ldh a, [$fff0]                    ;$3b0b
ret nz                            ;$3b0d
ret nz                            ;$3b0e
nop                               ;$3b0f
ldh [$ff01], a                    ;$3b10
ld [hl], c                        ;$3b12
ldd [hl], a                       ;$3b13
ld b, d                           ;$3b14
inc [hl]                          ;$3b15
dec [hl]                          ;$3b16
ld d, l                           ;$3b17
ld d, h                           ;$3b18
ld c, a                           ;$3b19
ld c, [hl]                        ;$3b1a
ld hl, $1827                      ;$3b1b
dec de                            ;$3b1e
nop                               ;$3b1f
nop                               ;$3b20
add b                             ;$3b21
add b                             ;$3b22
ld b, b                           ;$3b23
ld b, b                           ;$3b24
jr nz, $3ac7                      ;$3b25
and b                             ;$3b27
jr nz, $3b0a                      ;$3b28
ld h, b                           ;$3b2a
sub b                             ;$3b2b
ldh a, [$ff08]                    ;$3b2c
ret z                             ;$3b2e
cp b                              ;$3b2f
cp b                              ;$3b30
add h                             ;$3b31
add h                             ;$3b32
add h                             ;$3b33
add h                             ;$3b34
db $fc ;<unknown instruction>     ;$3b35
db $fc ;<unknown instruction>     ;$3b36
sub d                             ;$3b37
sub d                             ;$3b38
sub d                             ;$3b39
sub d                             ;$3b3a
ld l, h                           ;$3b3b
ld l, h                           ;$3b3c
xor $ee                           ;$3b3d
rlca                              ;$3b3f
rlca                              ;$3b40
rra                               ;$3b41
jr $3b82                          ;$3b42
jr nz, $3bc5                      ;$3b44
ld c, a                           ;$3b46
ld a, a                           ;$3b47
ld e, a                           ;$3b48
ld [hl], b                        ;$3b49
ld [hl], b                        ;$3b4a
and d                             ;$3b4b
and d                             ;$3b4c
or b                              ;$3b4d
or b                              ;$3b4e
or h                              ;$3b4f
or h                              ;$3b50
ld h, h                           ;$3b51
ld h, h                           ;$3b52
inc a                             ;$3b53
inc a                             ;$3b54
ld l, $2e                         ;$3b55
daa                               ;$3b57
daa                               ;$3b58
db $10 ;<corrupted stop>          ;$3b59
db $10 ;<corrupted stop>          ;$3b5a
ld l, h                           ;$3b5b
ld a, h                           ;$3b5c
rst $08                           ;$3b5d
or e                              ;$3b5e
inc bc                            ;$3b5f
inc bc                            ;$3b60
inc bc                            ;$3b61
inc bc                            ;$3b62
inc bc                            ;$3b63
ld [bc], a                        ;$3b64
rlca                              ;$3b65
ld b, $09                         ;$3b66
add hl, bc                        ;$3b68
ld d, $17                         ;$3b69
ld [de], a                        ;$3b6b
ld de, $0f0e                      ;$3b6c
ld [$0809], sp                    ;$3b6f
ld [$0f0f], sp                    ;$3b72
ld [$0908], sp                    ;$3b75
add hl, bc                        ;$3b78
ld a, [bc]                        ;$3b79
ld a, [bc]                        ;$3b7a
ld b, $06                         ;$3b7b
ld c, $0e                         ;$3b7d
inc bc                            ;$3b7f
inc bc                            ;$3b80
inc bc                            ;$3b81
inc bc                            ;$3b82
inc bc                            ;$3b83
ld [bc], a                        ;$3b84
rra                               ;$3b85
ld e, $21                         ;$3b86
ld hl, $554a                      ;$3b88
ld c, d                           ;$3b8b
ld [hl], l                        ;$3b8c
ld a, [bc]                        ;$3b8d
dec [hl]                          ;$3b8e
ld a, [bc]                        ;$3b8f
dec d                             ;$3b90
ld [$0f08], sp                    ;$3b91
rrca                              ;$3b94
ld [$0908], sp                    ;$3b95
add hl, bc                        ;$3b98
ld a, [bc]                        ;$3b99
ld a, [bc]                        ;$3b9a
ld b, $06                         ;$3b9b
ld c, $0e                         ;$3b9d
nop                               ;$3b9f
nop                               ;$3ba0
ld h, [hl]                        ;$3ba1
nop                               ;$3ba2
ld l, h                           ;$3ba3
nop                               ;$3ba4
ld a, b                           ;$3ba5
nop                               ;$3ba6
ld a, b                           ;$3ba7
nop                               ;$3ba8
ld l, h                           ;$3ba9
nop                               ;$3baa
ld h, [hl]                        ;$3bab
nop                               ;$3bac
nop                               ;$3bad
nop                               ;$3bae
nop                               ;$3baf
nop                               ;$3bb0
ld b, [hl]                        ;$3bb1
nop                               ;$3bb2
inc l                             ;$3bb3
nop                               ;$3bb4
jr $3bb7                          ;$3bb5
jr c, $3bb9                       ;$3bb7
ld h, h                           ;$3bb9
nop                               ;$3bba
ld b, d                           ;$3bbb
nop                               ;$3bbc
nop                               ;$3bbd
nop                               ;$3bbe
db $fd ;<unknown instruction>     ;$3bbf
db $fd ;<unknown instruction>     ;$3bc0
db $fd ;<unknown instruction>     ;$3bc1
db $fd ;<unknown instruction>     ;$3bc2
db $fd ;<unknown instruction>     ;$3bc3
db $fd ;<unknown instruction>     ;$3bc4
db $fd ;<unknown instruction>     ;$3bc5
db $fd ;<unknown instruction>     ;$3bc6
db $fd ;<unknown instruction>     ;$3bc7
db $fd ;<unknown instruction>     ;$3bc8
db $fd ;<unknown instruction>     ;$3bc9
db $fd ;<unknown instruction>     ;$3bca
db $fd ;<unknown instruction>     ;$3bcb
db $fd ;<unknown instruction>     ;$3bcc
db $fd ;<unknown instruction>     ;$3bcd
db $fd ;<unknown instruction>     ;$3bce
ld hl, sp+$00                     ;$3bcf
ldh [$ff00], a                    ;$3bd1
ret nz                            ;$3bd3
nop                               ;$3bd4
add b                             ;$3bd5
nop                               ;$3bd6
add b                             ;$3bd7
nop                               ;$3bd8
nop                               ;$3bd9
nop                               ;$3bda
nop                               ;$3bdb
nop                               ;$3bdc
nop                               ;$3bdd
nop                               ;$3bde
ld a, a                           ;$3bdf
nop                               ;$3be0
rra                               ;$3be1
nop                               ;$3be2
rrca                              ;$3be3
nop                               ;$3be4
rlca                              ;$3be5
nop                               ;$3be6
rlca                              ;$3be7
nop                               ;$3be8
inc bc                            ;$3be9
nop                               ;$3bea
inc bc                            ;$3beb
nop                               ;$3bec
inc bc                            ;$3bed
nop                               ;$3bee
nop                               ;$3bef
nop                               ;$3bf0
add b                             ;$3bf1
nop                               ;$3bf2
add b                             ;$3bf3
nop                               ;$3bf4
ret nz                            ;$3bf5
nop                               ;$3bf6
ldh [$ff00], a                    ;$3bf7
ld hl, sp+$00                     ;$3bf9
rst $38                           ;$3bfb
nop                               ;$3bfc
rst $38                           ;$3bfd
nop                               ;$3bfe
inc bc                            ;$3bff
nop                               ;$3c00
rlca                              ;$3c01
nop                               ;$3c02
rlca                              ;$3c03
nop                               ;$3c04
rrca                              ;$3c05
nop                               ;$3c06
rra                               ;$3c07
nop                               ;$3c08
ld a, a                           ;$3c09
nop                               ;$3c0a
rst $38                           ;$3c0b
nop                               ;$3c0c
rst $38                           ;$3c0d
nop                               ;$3c0e
rst $38                           ;$3c0f
rst $38                           ;$3c10
rst $38                           ;$3c11
rst $38                           ;$3c12
nop                               ;$3c13
rst $38                           ;$3c14
rst $38                           ;$3c15
rst $38                           ;$3c16
nop                               ;$3c17
rst $38                           ;$3c18
rst $38                           ;$3c19
nop                               ;$3c1a
nop                               ;$3c1b
rst $38                           ;$3c1c
rst $38                           ;$3c1d
nop                               ;$3c1e
rst $38                           ;$3c1f
nop                               ;$3c20
rst $38                           ;$3c21
nop                               ;$3c22
rst $38                           ;$3c23
ld bc, $02fe                      ;$3c24
cp $02                            ;$3c27
db $fc ;<unknown instruction>     ;$3c29
inc b                             ;$3c2a
db $fc ;<unknown instruction>     ;$3c2b
inc b                             ;$3c2c
db $fc ;<unknown instruction>     ;$3c2d
inc b                             ;$3c2e
rst $38                           ;$3c2f
ld [bc], a                        ;$3c30
rst $38                           ;$3c31
ld bc, $01ff                      ;$3c32
ld bc, $ff01                      ;$3c35
ld bc, $0101                      ;$3c38
rst $38                           ;$3c3b
ld bc, $0101                      ;$3c3c
ld [bc], a                        ;$3c3f
ld [bc], a                        ;$3c40
ld [bc], a                        ;$3c41
ld [bc], a                        ;$3c42
inc bc                            ;$3c43
inc bc                            ;$3c44
inc b                             ;$3c45
dec b                             ;$3c46
ld [$1109], sp                    ;$3c47
ld [de], a                        ;$3c4a
ld hl, $4326                      ;$3c4b
ld c, h                           ;$3c4e
nop                               ;$3c4f
nop                               ;$3c50
ld bc, $0201                      ;$3c51
ld [bc], a                        ;$3c54
inc b                             ;$3c55
inc b                             ;$3c56
ld [$1009], sp                    ;$3c57
inc de                            ;$3c5a
jr nz, $3c84                      ;$3c5b
jr nz, $3c8e                      ;$3c5d
add a                             ;$3c5f
sbc b                             ;$3c60
ld b, $39                         ;$3c61
ld c, $71                         ;$3c63
ld e, $e1                         ;$3c65
inc a                             ;$3c67
jp $c33c                          ;$3c68
ld a, b                           ;$3c6b
add a                             ;$3c6c
ld a, b                           ;$3c6d
add a                             ;$3c6e
ld b, b                           ;$3c6f
ld c, a                           ;$3c70
ld b, b                           ;$3c71
ld c, a                           ;$3c72
add b                             ;$3c73
sbc a                             ;$3c74
add b                             ;$3c75
sbc a                             ;$3c76
add b                             ;$3c77
sbc a                             ;$3c78
add b                             ;$3c79
sbc a                             ;$3c7a
add b                             ;$3c7b
sbc a                             ;$3c7c
add b                             ;$3c7d
sbc a                             ;$3c7e
ld hl, sp+$07                     ;$3c7f
ldh a, [$ff0f]                    ;$3c81
ldh a, [$ff0f]                    ;$3c83
ldh a, [$ff0f]                    ;$3c85
ldh a, [$ff0f]                    ;$3c87
ldh a, [$ff0f]                    ;$3c89
ldh a, [$ff0f]                    ;$3c8b
ld hl, sp+$07                     ;$3c8d
ld b, b                           ;$3c8f
ld e, a                           ;$3c90
ld b, b                           ;$3c91
ld c, a                           ;$3c92
jr nz, $3cc4                      ;$3c93
jr nz, $3cbe                      ;$3c95
db $10 ;<corrupted stop>          ;$3c97
ld de, $0f0f                      ;$3c98
inc b                             ;$3c9b
inc b                             ;$3c9c
rlca                              ;$3c9d
rlca                              ;$3c9e
ld a, b                           ;$3c9f
add a                             ;$3ca0
ld a, h                           ;$3ca1
add e                             ;$3ca2
inc a                             ;$3ca3
jp $e11e                          ;$3ca4
rrca                              ;$3ca7
ldh a, [$ffff]                    ;$3ca8
rst $38                           ;$3caa
rst $38                           ;$3cab
nop                               ;$3cac
rst $38                           ;$3cad
rst $38                           ;$3cae
rst $38                           ;$3caf
nop                               ;$3cb0
rst $38                           ;$3cb1
nop                               ;$3cb2
rst $38                           ;$3cb3
nop                               ;$3cb4
nop                               ;$3cb5
nop                               ;$3cb6
rst $38                           ;$3cb7
nop                               ;$3cb8
nop                               ;$3cb9
nop                               ;$3cba
rst $38                           ;$3cbb
nop                               ;$3cbc
nop                               ;$3cbd
nop                               ;$3cbe
ld [bc], a                        ;$3cbf
nop                               ;$3cc0
ld [bc], a                        ;$3cc1
nop                               ;$3cc2
ld [bc], a                        ;$3cc3
nop                               ;$3cc4
ld [bc], a                        ;$3cc5
nop                               ;$3cc6
ld [bc], a                        ;$3cc7
nop                               ;$3cc8
ld [bc], a                        ;$3cc9
nop                               ;$3cca
ld [bc], a                        ;$3ccb
nop                               ;$3ccc
ld [bc], a                        ;$3ccd
nop                               ;$3cce
stop                              ;$3ccf
jr c, $3cd3                       ;$3cd1
ld a, h                           ;$3cd3
nop                               ;$3cd4
cp $00                            ;$3cd5
cp $00                            ;$3cd7
cp $00                            ;$3cd9
ld a, h                           ;$3cdb
nop                               ;$3cdc
nop                               ;$3cdd
nop                               ;$3cde
ld [bc], a                        ;$3cdf
inc bc                            ;$3ce0
ld bc, $0201                      ;$3ce1
ld [bc], a                        ;$3ce4
inc b                             ;$3ce5
inc b                             ;$3ce6
dec c                             ;$3ce7
ld [$080a], sp                    ;$3ce8
rrca                              ;$3ceb
rrca                              ;$3cec
inc bc                            ;$3ced
inc bc                            ;$3cee
jr z, $3cd9                       ;$3cef
ldh a, [$ffd0]                    ;$3cf1
jr nc, $3d25                      ;$3cf3
ld [$5408], sp                    ;$3cf5
inc b                             ;$3cf8
xor h                             ;$3cf9
inc b                             ;$3cfa
db $fc ;<unknown instruction>     ;$3cfb
db $fc ;<unknown instruction>     ;$3cfc
jr nc, $3d2f                      ;$3cfd
nop                               ;$3cff
nop                               ;$3d00
inc bc                            ;$3d01
inc bc                            ;$3d02
inc bc                            ;$3d03
inc bc                            ;$3d04
inc bc                            ;$3d05
ld [bc], a                        ;$3d06
rlca                              ;$3d07
ld b, $09                         ;$3d08
add hl, bc                        ;$3d0a
ld [$0b08], sp                    ;$3d0b
dec bc                            ;$3d0e
nop                               ;$3d0f
nop                               ;$3d10
ret nz                            ;$3d11
ret nz                            ;$3d12
call nz, $e8c4                    ;$3d13
ld l, b                           ;$3d16
sub b                             ;$3d17
ldh a, [$ffa8]                    ;$3d18
ld hl, sp+$48                     ;$3d1a
ld a, b                           ;$3d1c
ld hl, sp+$b8                     ;$3d1d
nop                               ;$3d1f
nop                               ;$3d20
rlca                              ;$3d21
rlca                              ;$3d22
rlca                              ;$3d23
rlca                              ;$3d24
rlca                              ;$3d25
inc b                             ;$3d26
rlca                              ;$3d27
inc b                             ;$3d28
dec bc                            ;$3d29
dec bc                            ;$3d2a
db $10 ;<corrupted stop>          ;$3d2b
db $10 ;<corrupted stop>          ;$3d2c
rla                               ;$3d2d
rla                               ;$3d2e
nop                               ;$3d2f
nop                               ;$3d30
add b                             ;$3d31
add b                             ;$3d32
add b                             ;$3d33
add b                             ;$3d34
ldh [$ffe0], a                    ;$3d35
sub b                             ;$3d37
ldh a, [$ffa8]                    ;$3d38
ld hl, sp+$48                     ;$3d3a
ld a, b                           ;$3d3c
cp b                              ;$3d3d
cp b                              ;$3d3e
ld [$0f08], sp                    ;$3d3f
rrca                              ;$3d42
ld [$0f08], sp                    ;$3d43
rrca                              ;$3d46
add hl, bc                        ;$3d47
add hl, bc                        ;$3d48
add hl, bc                        ;$3d49
add hl, bc                        ;$3d4a
ld b, $06                         ;$3d4b
ld c, $0e                         ;$3d4d
db $e4 ;<unknown instruction>     ;$3d4f
db $e4 ;<unknown instruction>     ;$3d50
ldi [hl], a                       ;$3d51
ldi [hl], a                       ;$3d52
jr nz, $3d75                      ;$3d53
ldh [$ffe0], a                    ;$3d55
jr nz, $3d79                      ;$3d57
jr nz, $3d7b                      ;$3d59
ret nz                            ;$3d5b
ret nz                            ;$3d5c
ldh [$ffe0], a                    ;$3d5d
jr $3d79                          ;$3d5f
sbc b                             ;$3d61
sbc b                             ;$3d62
sbc b                             ;$3d63
sbc b                             ;$3d64
ld hl, sp+$f8                     ;$3d65
sbc h                             ;$3d67
sbc b                             ;$3d68
inc a                             ;$3d69
inc a                             ;$3d6a
inc a                             ;$3d6b
inc a                             ;$3d6c
ld a, [hl]                        ;$3d6d
ld a, [hl]                        ;$3d6e
ld a, a                           ;$3d6f
nop                               ;$3d70
cp $fe                            ;$3d71
ld a, [hl]                        ;$3d73
ld a, [hl]                        ;$3d74
cp $da                            ;$3d75
ld a, [hl]                        ;$3d77
ld e, d                           ;$3d78
ld a, [hl]                        ;$3d79
ld a, [hl]                        ;$3d7a
db $fc ;<unknown instruction>     ;$3d7b
db $fc ;<unknown instruction>     ;$3d7c
ld hl, sp+$f8                     ;$3d7d
cp $0e                            ;$3d7f
cp $fe                            ;$3d81
ld a, [hl]                        ;$3d83
ld a, [hl]                        ;$3d84
cp $da                            ;$3d85
ld a, [hl]                        ;$3d87
ld e, d                           ;$3d88
ld a, [hl]                        ;$3d89
ld a, [hl]                        ;$3d8a
db $fc ;<unknown instruction>     ;$3d8b
db $fc ;<unknown instruction>     ;$3d8c
ld hl, sp+$f8                     ;$3d8d
add b                             ;$3d8f
add b                             ;$3d90
add e                             ;$3d91
add e                             ;$3d92
add e                             ;$3d93
add e                             ;$3d94
jp $ef02                          ;$3d95
ld l, $97                         ;$3d98
sub a                             ;$3d9a
ld b, a                           ;$3d9b
ld b, h                           ;$3d9c
inc h                             ;$3d9d
inc h                             ;$3d9e
nop                               ;$3d9f
nop                               ;$3da0
ret nz                            ;$3da1
ret nz                            ;$3da2
ret nz                            ;$3da3
ret nz                            ;$3da4
ret nz                            ;$3da5
ld b, b                           ;$3da6
ldh [$ff60], a                    ;$3da7
ld hl, sp+$f8                     ;$3da9
db $e4 ;<unknown instruction>     ;$3dab
inc h                             ;$3dac
inc [hl]                          ;$3dad
inc [hl]                          ;$3dae
rla                               ;$3daf
inc d                             ;$3db0
rla                               ;$3db1
inc d                             ;$3db2
rla                               ;$3db3
inc d                             ;$3db4
inc e                             ;$3db5
rra                               ;$3db6
rla                               ;$3db7
rla                               ;$3db8
rrca                              ;$3db9
rrca                              ;$3dba
ld e, $1e                         ;$3dbb
nop                               ;$3dbd
nop                               ;$3dbe
db $f4 ;<unknown instruction>     ;$3dbf
inc h                             ;$3dc0
ld hl, sp+$28                     ;$3dc1
add sp, $28                       ;$3dc3
jr c, $3dbf                       ;$3dc5
add sp, $e8                       ;$3dc7
sub b                             ;$3dc9
sub b                             ;$3dca
ld [hl], b                        ;$3dcb
ld [hl], b                        ;$3dcc
ld a, b                           ;$3dcd
ld a, b                           ;$3dce
inc bc                            ;$3dcf
inc bc                            ;$3dd0
inc bc                            ;$3dd1
inc bc                            ;$3dd2
inc bc                            ;$3dd3
ld [bc], a                        ;$3dd4
rrca                              ;$3dd5
ld c, $11                         ;$3dd6
ld de, $3737                      ;$3dd8
ld [hl], c                        ;$3ddb
ld d, d                           ;$3ddc
ld a, l                           ;$3ddd
ld c, [hl]                        ;$3dde
ret nz                            ;$3ddf
ret nz                            ;$3de0
ret nz                            ;$3de1
ret nz                            ;$3de2
ret nz                            ;$3de3
ld b, b                           ;$3de4
ret nz                            ;$3de5
ld b, b                           ;$3de6
and b                             ;$3de7
and b                             ;$3de8
db $10 ;<corrupted stop>          ;$3de9
db $10 ;<corrupted stop>          ;$3dea
rst $38                           ;$3deb
rst $38                           ;$3dec
rst $08                           ;$3ded
inc sp                            ;$3dee
ld a, a                           ;$3def
ld b, b                           ;$3df0
ccf                               ;$3df1
ccf                               ;$3df2
ld [$0f08], sp                    ;$3df3
rrca                              ;$3df6
add hl, bc                        ;$3df7
add hl, bc                        ;$3df8
add hl, bc                        ;$3df9
add hl, bc                        ;$3dfa
ld b, $06                         ;$3dfb
ld c, $0e                         ;$3dfd
db $fc ;<unknown instruction>     ;$3dff
db $fc ;<unknown instruction>     ;$3e00
jr nz, $3e23                      ;$3e01
jr nz, $3e25                      ;$3e03
ldh [$ffe0], a                    ;$3e05
jr nz, $3e29                      ;$3e07
jr nz, $3e2b                      ;$3e09
ret nz                            ;$3e0b
ret nz                            ;$3e0c
ldh [$ffe0], a                    ;$3e0d
inc bc                            ;$3e0f
inc bc                            ;$3e10
inc bc                            ;$3e11
inc bc                            ;$3e12
inc bc                            ;$3e13
ld [bc], a                        ;$3e14
rlca                              ;$3e15
ld b, $09                         ;$3e16
add hl, bc                        ;$3e18
inc sp                            ;$3e19
inc sp                            ;$3e1a
ld [hl], a                        ;$3e1b
ld d, h                           ;$3e1c
ld [hl], e                        ;$3e1d
ld c, h                           ;$3e1e
jr $3e39                          ;$3e1f
ret c                             ;$3e21
ret c                             ;$3e22
ret c                             ;$3e23
ret c                             ;$3e24
ld hl, sp+$78                     ;$3e25
call c, $bc58                     ;$3e27
cp h                              ;$3e2a
inc a                             ;$3e2b
inc a                             ;$3e2c
ld a, [hl]                        ;$3e2d
ld a, [hl]                        ;$3e2e
add hl, bc                        ;$3e2f
ld c, $07                         ;$3e30
rlca                              ;$3e32
ld [$080f], sp                    ;$3e33
rrca                              ;$3e36
add hl, bc                        ;$3e37
rrca                              ;$3e38
ld a, [bc]                        ;$3e39
ld c, $06                         ;$3e3a
ld b, $0e                         ;$3e3c
ld c, $00                         ;$3e3e
nop                               ;$3e40
inc bc                            ;$3e41
inc bc                            ;$3e42
inc bc                            ;$3e43
inc bc                            ;$3e44
inc bc                            ;$3e45
ld [bc], a                        ;$3e46
rst $38                           ;$3e47
ld a, [hl]                        ;$3e48
ret                               ;$3e49
ccf                               ;$3e4a
ld a, b                           ;$3e4b
ld a, a                           ;$3e4c
add hl, bc                        ;$3e4d
rrca                              ;$3e4e
inc b                             ;$3e4f
inc b                             ;$3e50
rlca                              ;$3e51
rlca                              ;$3e52
cp b                              ;$3e53
cp a                              ;$3e54
ret nz                            ;$3e55
rst $38                           ;$3e56
rst $38                           ;$3e57
rst $38                           ;$3e58
nop                               ;$3e59
nop                               ;$3e5a
nop                               ;$3e5b
nop                               ;$3e5c
nop                               ;$3e5d
nop                               ;$3e5e
nop                               ;$3e5f
nop                               ;$3e60
ld a, b                           ;$3e61
ld a, b                           ;$3e62
ld a, b                           ;$3e63
ld a, b                           ;$3e64
ld a, e                           ;$3e65
ld c, b                           ;$3e66
ld h, b                           ;$3e67
ld e, a                           ;$3e68
or [hl]                           ;$3e69
or b                              ;$3e6a
add h                             ;$3e6b
add h                             ;$3e6c
cp b                              ;$3e6d
cp b                              ;$3e6e
add h                             ;$3e6f
add h                             ;$3e70
add h                             ;$3e71
add h                             ;$3e72
add h                             ;$3e73
add h                             ;$3e74
ld a, [$92fa]                     ;$3e75
sub d                             ;$3e78
sbc [hl]                          ;$3e79
sbc [hl]                          ;$3e7a
ld h, a                           ;$3e7b
ld h, a                           ;$3e7c
ldh [$ffe0], a                    ;$3e7d
nop                               ;$3e7f
nop                               ;$3e80
nop                               ;$3e81
nop                               ;$3e82
ld a, b                           ;$3e83
ld a, b                           ;$3e84
ld a, b                           ;$3e85
ld a, b                           ;$3e86
ld a, b                           ;$3e87
ld c, b                           ;$3e88
ld b, b                           ;$3e89
ld a, [hl]                        ;$3e8a
or h                              ;$3e8b
or b                              ;$3e8c
add h                             ;$3e8d
add h                             ;$3e8e
ldi a, [hl]                       ;$3e8f
ld a, e                           ;$3e90
cpl                               ;$3e91
cpl                               ;$3e92
cpl                               ;$3e93
cpl                               ;$3e94
cpl                               ;$3e95
cpl                               ;$3e96
cpl                               ;$3e97
cpl                               ;$3e98
cpl                               ;$3e99
cpl                               ;$3e9a
ld a, e                           ;$3e9b
jr nc, $3ecf                      ;$3e9c
ld sp, $3131                      ;$3e9e
ld sp, $2a32                      ;$3ea1
ld a, h                           ;$3ea4
cpl                               ;$3ea5
cpl                               ;$3ea6
cpl                               ;$3ea7
cpl                               ;$3ea8
cpl                               ;$3ea9
cpl                               ;$3eaa
cpl                               ;$3eab
cpl                               ;$3eac
cpl                               ;$3ead
cpl                               ;$3eae
ld a, h                           ;$3eaf
ld b, h                           ;$3eb0
inc e                             ;$3eb1
inc c                             ;$3eb2
jr $3ed0                          ;$3eb3
ld c, $45                         ;$3eb5
ldi a, [hl]                       ;$3eb7
ld a, l                           ;$3eb8
cpl                               ;$3eb9
cpl                               ;$3eba
cpl                               ;$3ebb
cpl                               ;$3ebc
cpl                               ;$3ebd
cpl                               ;$3ebe
cpl                               ;$3ebf
cpl                               ;$3ec0
cpl                               ;$3ec1
cpl                               ;$3ec2
ld a, l                           ;$3ec3
ld h, a                           ;$3ec4
ld b, [hl]                        ;$3ec5
ld b, [hl]                        ;$3ec6
ld b, [hl]                        ;$3ec7
ld b, [hl]                        ;$3ec8
ld b, [hl]                        ;$3ec9
ld l, b                           ;$3eca
ldi a, [hl]                       ;$3ecb
ld a, e                           ;$3ecc
cpl                               ;$3ecd
cpl                               ;$3ece
cpl                               ;$3ecf
cpl                               ;$3ed0
cpl                               ;$3ed1
cpl                               ;$3ed2
cpl                               ;$3ed3
cpl                               ;$3ed4
cpl                               ;$3ed5
cpl                               ;$3ed6
ld a, e                           ;$3ed7
cpl                               ;$3ed8
cpl                               ;$3ed9
cpl                               ;$3eda
cpl                               ;$3edb
cpl                               ;$3edc
nop                               ;$3edd
cpl                               ;$3ede
ldi a, [hl]                       ;$3edf
ld a, h                           ;$3ee0
cpl                               ;$3ee1
cpl                               ;$3ee2
cpl                               ;$3ee3
cpl                               ;$3ee4
cpl                               ;$3ee5
cpl                               ;$3ee6
cpl                               ;$3ee7
cpl                               ;$3ee8
cpl                               ;$3ee9
cpl                               ;$3eea
ld a, h                           ;$3eeb
ld b, e                           ;$3eec
inc [hl]                          ;$3eed
inc [hl]                          ;$3eee
inc [hl]                          ;$3eef
inc [hl]                          ;$3ef0
inc [hl]                          ;$3ef1
inc [hl]                          ;$3ef2
ldi a, [hl]                       ;$3ef3
ld a, l                           ;$3ef4
cpl                               ;$3ef5
cpl                               ;$3ef6
cpl                               ;$3ef7
cpl                               ;$3ef8
cpl                               ;$3ef9
cpl                               ;$3efa
cpl                               ;$3efb
cpl                               ;$3efc
cpl                               ;$3efd
cpl                               ;$3efe
ld a, l                           ;$3eff
jr nc, $3f33                      ;$3f00
ld sp, $3131                      ;$3f02
ld sp, $2a32                      ;$3f05
ld a, e                           ;$3f08
cpl                               ;$3f09
cpl                               ;$3f0a
cpl                               ;$3f0b
cpl                               ;$3f0c
cpl                               ;$3f0d
cpl                               ;$3f0e
cpl                               ;$3f0f
cpl                               ;$3f10
cpl                               ;$3f11
cpl                               ;$3f12
ld a, e                           ;$3f13
ld [hl], $15                      ;$3f14
ld c, $1f                         ;$3f16
ld c, $15                         ;$3f18
scf                               ;$3f1a
ldi a, [hl]                       ;$3f1b
ld a, h                           ;$3f1c
cpl                               ;$3f1d
cpl                               ;$3f1e
cpl                               ;$3f1f
cpl                               ;$3f20
cpl                               ;$3f21
cpl                               ;$3f22
cpl                               ;$3f23
cpl                               ;$3f24
cpl                               ;$3f25
cpl                               ;$3f26
ld a, h                           ;$3f27
ld [hl], $2f                      ;$3f28
cpl                               ;$3f2a
cpl                               ;$3f2b
cpl                               ;$3f2c
cpl                               ;$3f2d
scf                               ;$3f2e
ldi a, [hl]                       ;$3f2f
ld a, l                           ;$3f30
cpl                               ;$3f31
cpl                               ;$3f32
cpl                               ;$3f33
cpl                               ;$3f34
cpl                               ;$3f35
cpl                               ;$3f36
cpl                               ;$3f37
cpl                               ;$3f38
cpl                               ;$3f39
cpl                               ;$3f3a
ld a, l                           ;$3f3b
ld b, b                           ;$3f3c
ld b, d                           ;$3f3d
ld b, d                           ;$3f3e
ld b, d                           ;$3f3f
ld b, d                           ;$3f40
ld b, d                           ;$3f41
ld b, c                           ;$3f42
ldi a, [hl]                       ;$3f43
ld a, e                           ;$3f44
cpl                               ;$3f45
cpl                               ;$3f46
cpl                               ;$3f47
cpl                               ;$3f48
cpl                               ;$3f49
cpl                               ;$3f4a
cpl                               ;$3f4b
cpl                               ;$3f4c
cpl                               ;$3f4d
cpl                               ;$3f4e
ld a, e                           ;$3f4f
ld [hl], $15                      ;$3f50
ld [de], a                        ;$3f52
rla                               ;$3f53
ld c, $1c                         ;$3f54
scf                               ;$3f56
ldi a, [hl]                       ;$3f57
ld a, h                           ;$3f58
cpl                               ;$3f59
cpl                               ;$3f5a
cpl                               ;$3f5b
cpl                               ;$3f5c
cpl                               ;$3f5d
cpl                               ;$3f5e
cpl                               ;$3f5f
cpl                               ;$3f60
cpl                               ;$3f61
cpl                               ;$3f62
ld a, h                           ;$3f63
ld [hl], $2f                      ;$3f64
cpl                               ;$3f66
cpl                               ;$3f67
cpl                               ;$3f68
cpl                               ;$3f69
scf                               ;$3f6a
ldi a, [hl]                       ;$3f6b
ld a, l                           ;$3f6c
cpl                               ;$3f6d
cpl                               ;$3f6e
cpl                               ;$3f6f
cpl                               ;$3f70
cpl                               ;$3f71
cpl                               ;$3f72
cpl                               ;$3f73
cpl                               ;$3f74
cpl                               ;$3f75
cpl                               ;$3f76
ld a, l                           ;$3f77
inc sp                            ;$3f78
inc [hl]                          ;$3f79
inc [hl]                          ;$3f7a
inc [hl]                          ;$3f7b
inc [hl]                          ;$3f7c
inc [hl]                          ;$3f7d
dec [hl]                          ;$3f7e
ldi a, [hl]                       ;$3f7f
ld a, e                           ;$3f80
cpl                               ;$3f81
cpl                               ;$3f82
cpl                               ;$3f83
cpl                               ;$3f84
cpl                               ;$3f85
cpl                               ;$3f86
cpl                               ;$3f87
cpl                               ;$3f88
cpl                               ;$3f89
cpl                               ;$3f8a
ld a, e                           ;$3f8b
dec hl                            ;$3f8c
jr c, $3fc8                       ;$3f8d
add hl, sp                        ;$3f8f
add hl, sp                        ;$3f90
add hl, sp                        ;$3f91
ldd a, [hl]                       ;$3f92
ldi a, [hl]                       ;$3f93
ld a, h                           ;$3f94
cpl                               ;$3f95
cpl                               ;$3f96
cpl                               ;$3f97
cpl                               ;$3f98
cpl                               ;$3f99
cpl                               ;$3f9a
cpl                               ;$3f9b
cpl                               ;$3f9c
cpl                               ;$3f9d
cpl                               ;$3f9e
ld a, h                           ;$3f9f
dec hl                            ;$3fa0
dec sp                            ;$3fa1
cpl                               ;$3fa2
cpl                               ;$3fa3
cpl                               ;$3fa4
cpl                               ;$3fa5
inc a                             ;$3fa6
ldi a, [hl]                       ;$3fa7
ld a, l                           ;$3fa8
cpl                               ;$3fa9
cpl                               ;$3faa
cpl                               ;$3fab
cpl                               ;$3fac
cpl                               ;$3fad
cpl                               ;$3fae
cpl                               ;$3faf
cpl                               ;$3fb0
cpl                               ;$3fb1
cpl                               ;$3fb2
ld a, l                           ;$3fb3
dec hl                            ;$3fb4
dec sp                            ;$3fb5
cpl                               ;$3fb6
cpl                               ;$3fb7
cpl                               ;$3fb8
cpl                               ;$3fb9
inc a                             ;$3fba
ldi a, [hl]                       ;$3fbb
ld a, e                           ;$3fbc
cpl                               ;$3fbd
cpl                               ;$3fbe
cpl                               ;$3fbf
cpl                               ;$3fc0
cpl                               ;$3fc1
cpl                               ;$3fc2
cpl                               ;$3fc3
cpl                               ;$3fc4
cpl                               ;$3fc5
cpl                               ;$3fc6
ld a, e                           ;$3fc7
dec hl                            ;$3fc8
dec sp                            ;$3fc9
cpl                               ;$3fca
cpl                               ;$3fcb
cpl                               ;$3fcc
cpl                               ;$3fcd
inc a                             ;$3fce
ldi a, [hl]                       ;$3fcf
ld a, h                           ;$3fd0
cpl                               ;$3fd1
cpl                               ;$3fd2
cpl                               ;$3fd3
cpl                               ;$3fd4
cpl                               ;$3fd5
cpl                               ;$3fd6
cpl                               ;$3fd7
cpl                               ;$3fd8
cpl                               ;$3fd9
cpl                               ;$3fda
ld a, h                           ;$3fdb
dec hl                            ;$3fdc
dec sp                            ;$3fdd
cpl                               ;$3fde
cpl                               ;$3fdf
cpl                               ;$3fe0
cpl                               ;$3fe1
inc a                             ;$3fe2
ldi a, [hl]                       ;$3fe3
ld a, l                           ;$3fe4
cpl                               ;$3fe5
cpl                               ;$3fe6
cpl                               ;$3fe7
cpl                               ;$3fe8
cpl                               ;$3fe9
cpl                               ;$3fea
cpl                               ;$3feb
cpl                               ;$3fec
cpl                               ;$3fed
cpl                               ;$3fee
ld a, l                           ;$3fef
dec hl                            ;$3ff0
dec a                             ;$3ff1
ld a, $3e                         ;$3ff2
ld a, $3e                         ;$3ff4
ccf                               ;$3ff6
ldi a, [hl]                       ;$3ff7
ld a, e                           ;$3ff8
cpl                               ;$3ff9
cpl                               ;$3ffa
cpl                               ;$3ffb
cpl                               ;$3ffc
cpl                               ;$3ffd
cpl                               ;$3ffe
cpl                               ;$3fff
SECTION "rom1", ROMX
cpl                               ;$4000
cpl                               ;$4001
cpl                               ;$4002
ld a, e                           ;$4003
jr nc, $4037                      ;$4004
ld sp, $3131                      ;$4006
ld sp, $2a32                      ;$4009
ld a, h                           ;$400c
cpl                               ;$400d
cpl                               ;$400e
cpl                               ;$400f
cpl                               ;$4010
cpl                               ;$4011
cpl                               ;$4012
cpl                               ;$4013
cpl                               ;$4014
cpl                               ;$4015
cpl                               ;$4016
ld a, h                           ;$4017
ld [hl], $15                      ;$4018
ld c, $1f                         ;$401a
ld c, $15                         ;$401c
scf                               ;$401e
ldi a, [hl]                       ;$401f
ld a, l                           ;$4020
cpl                               ;$4021
cpl                               ;$4022
cpl                               ;$4023
cpl                               ;$4024
cpl                               ;$4025
cpl                               ;$4026
cpl                               ;$4027
cpl                               ;$4028
cpl                               ;$4029
cpl                               ;$402a
ld a, l                           ;$402b
ld [hl], $2f                      ;$402c
cpl                               ;$402e
cpl                               ;$402f
cpl                               ;$4030
cpl                               ;$4031
scf                               ;$4032
ldi a, [hl]                       ;$4033
ld a, e                           ;$4034
cpl                               ;$4035
cpl                               ;$4036
cpl                               ;$4037
cpl                               ;$4038
cpl                               ;$4039
cpl                               ;$403a
cpl                               ;$403b
cpl                               ;$403c
cpl                               ;$403d
cpl                               ;$403e
ld a, e                           ;$403f
ld b, b                           ;$4040
ld b, d                           ;$4041
ld b, d                           ;$4042
ld b, d                           ;$4043
ld b, d                           ;$4044
ld b, d                           ;$4045
ld b, c                           ;$4046
ldi a, [hl]                       ;$4047
ld a, h                           ;$4048
cpl                               ;$4049
cpl                               ;$404a
cpl                               ;$404b
cpl                               ;$404c
cpl                               ;$404d
cpl                               ;$404e
cpl                               ;$404f
cpl                               ;$4050
cpl                               ;$4051
cpl                               ;$4052
ld a, h                           ;$4053
ld [hl], $11                      ;$4054
ld [de], a                        ;$4056
db $10 ;<corrupted stop>          ;$4057
ld de, $372f                      ;$4058
ldi a, [hl]                       ;$405b
ld a, l                           ;$405c
cpl                               ;$405d
cpl                               ;$405e
cpl                               ;$405f
cpl                               ;$4060
cpl                               ;$4061
cpl                               ;$4062
cpl                               ;$4063
cpl                               ;$4064
cpl                               ;$4065
cpl                               ;$4066
ld a, l                           ;$4067
ld [hl], $2f                      ;$4068
cpl                               ;$406a
cpl                               ;$406b
cpl                               ;$406c
cpl                               ;$406d
scf                               ;$406e
ldi a, [hl]                       ;$406f
ld a, e                           ;$4070
cpl                               ;$4071
cpl                               ;$4072
cpl                               ;$4073
cpl                               ;$4074
cpl                               ;$4075
cpl                               ;$4076
cpl                               ;$4077
cpl                               ;$4078
cpl                               ;$4079
cpl                               ;$407a
ld a, e                           ;$407b
inc sp                            ;$407c
inc [hl]                          ;$407d
inc [hl]                          ;$407e
inc [hl]                          ;$407f
inc [hl]                          ;$4080
inc [hl]                          ;$4081
dec [hl]                          ;$4082
ldi a, [hl]                       ;$4083
ld a, h                           ;$4084
cpl                               ;$4085
cpl                               ;$4086
cpl                               ;$4087
cpl                               ;$4088
cpl                               ;$4089
cpl                               ;$408a
cpl                               ;$408b
cpl                               ;$408c
cpl                               ;$408d
cpl                               ;$408e
ld a, h                           ;$408f
dec hl                            ;$4090
adc [hl]                          ;$4091
adc [hl]                          ;$4092
adc [hl]                          ;$4093
adc [hl]                          ;$4094
adc [hl]                          ;$4095
adc [hl]                          ;$4096
ldi a, [hl]                       ;$4097
ld a, l                           ;$4098
cpl                               ;$4099
cpl                               ;$409a
cpl                               ;$409b
cpl                               ;$409c
cpl                               ;$409d
cpl                               ;$409e
cpl                               ;$409f
cpl                               ;$40a0
cpl                               ;$40a1
cpl                               ;$40a2
ld a, l                           ;$40a3
jr nc, $40d7                      ;$40a4
ld sp, $3131                      ;$40a6
ld sp, $2a32                      ;$40a9
ld a, e                           ;$40ac
cpl                               ;$40ad
cpl                               ;$40ae
cpl                               ;$40af
cpl                               ;$40b0
cpl                               ;$40b1
cpl                               ;$40b2
cpl                               ;$40b3
cpl                               ;$40b4
cpl                               ;$40b5
cpl                               ;$40b6
ld a, e                           ;$40b7
ld [hl], $15                      ;$40b8
ld [de], a                        ;$40ba
rla                               ;$40bb
ld c, $1c                         ;$40bc
scf                               ;$40be
ldi a, [hl]                       ;$40bf
ld a, h                           ;$40c0
cpl                               ;$40c1
cpl                               ;$40c2
cpl                               ;$40c3
cpl                               ;$40c4
cpl                               ;$40c5
cpl                               ;$40c6
cpl                               ;$40c7
cpl                               ;$40c8
cpl                               ;$40c9
cpl                               ;$40ca
ld a, h                           ;$40cb
ld [hl], $2f                      ;$40cc
cpl                               ;$40ce
ld [bc], a                        ;$40cf
dec b                             ;$40d0
cpl                               ;$40d1
scf                               ;$40d2
ldi a, [hl]                       ;$40d3
ld a, l                           ;$40d4
cpl                               ;$40d5
cpl                               ;$40d6
cpl                               ;$40d7
cpl                               ;$40d8
cpl                               ;$40d9
cpl                               ;$40da
cpl                               ;$40db
cpl                               ;$40dc
cpl                               ;$40dd
cpl                               ;$40de
ld a, l                           ;$40df
inc sp                            ;$40e0
inc [hl]                          ;$40e1
inc [hl]                          ;$40e2
inc [hl]                          ;$40e3
inc [hl]                          ;$40e4
inc [hl]                          ;$40e5
dec [hl]                          ;$40e6
ldi a, [hl]                       ;$40e7
ld a, e                           ;$40e8
cpl                               ;$40e9
cpl                               ;$40ea
cpl                               ;$40eb
cpl                               ;$40ec
cpl                               ;$40ed
cpl                               ;$40ee
cpl                               ;$40ef
cpl                               ;$40f0
cpl                               ;$40f1
cpl                               ;$40f2
ld a, e                           ;$40f3
dec hl                            ;$40f4
jr c, $4130                       ;$40f5
add hl, sp                        ;$40f7
add hl, sp                        ;$40f8
add hl, sp                        ;$40f9
ldd a, [hl]                       ;$40fa
ldi a, [hl]                       ;$40fb
ld a, h                           ;$40fc
cpl                               ;$40fd
cpl                               ;$40fe
cpl                               ;$40ff
cpl                               ;$4100
cpl                               ;$4101
cpl                               ;$4102
cpl                               ;$4103
cpl                               ;$4104
cpl                               ;$4105
cpl                               ;$4106
ld a, h                           ;$4107
dec hl                            ;$4108
dec sp                            ;$4109
cpl                               ;$410a
cpl                               ;$410b
cpl                               ;$410c
cpl                               ;$410d
inc a                             ;$410e
ldi a, [hl]                       ;$410f
ld a, l                           ;$4110
cpl                               ;$4111
cpl                               ;$4112
cpl                               ;$4113
cpl                               ;$4114
cpl                               ;$4115
cpl                               ;$4116
cpl                               ;$4117
cpl                               ;$4118
cpl                               ;$4119
cpl                               ;$411a
ld a, l                           ;$411b
dec hl                            ;$411c
dec sp                            ;$411d
cpl                               ;$411e
cpl                               ;$411f
cpl                               ;$4120
cpl                               ;$4121
inc a                             ;$4122
ldi a, [hl]                       ;$4123
ld a, e                           ;$4124
cpl                               ;$4125
cpl                               ;$4126
cpl                               ;$4127
cpl                               ;$4128
cpl                               ;$4129
cpl                               ;$412a
cpl                               ;$412b
cpl                               ;$412c
cpl                               ;$412d
cpl                               ;$412e
ld a, e                           ;$412f
dec hl                            ;$4130
dec sp                            ;$4131
cpl                               ;$4132
cpl                               ;$4133
cpl                               ;$4134
cpl                               ;$4135
inc a                             ;$4136
ldi a, [hl]                       ;$4137
ld a, h                           ;$4138
cpl                               ;$4139
cpl                               ;$413a
cpl                               ;$413b
cpl                               ;$413c
cpl                               ;$413d
cpl                               ;$413e
cpl                               ;$413f
cpl                               ;$4140
cpl                               ;$4141
cpl                               ;$4142
ld a, h                           ;$4143
dec hl                            ;$4144
dec sp                            ;$4145
cpl                               ;$4146
cpl                               ;$4147
cpl                               ;$4148
cpl                               ;$4149
inc a                             ;$414a
ldi a, [hl]                       ;$414b
ld a, l                           ;$414c
cpl                               ;$414d
cpl                               ;$414e
cpl                               ;$414f
cpl                               ;$4150
cpl                               ;$4151
cpl                               ;$4152
cpl                               ;$4153
cpl                               ;$4154
cpl                               ;$4155
cpl                               ;$4156
ld a, l                           ;$4157
dec hl                            ;$4158
dec a                             ;$4159
ld a, $3e                         ;$415a
ld a, $3e                         ;$415c
ccf                               ;$415e
nop                               ;$415f
inc a                             ;$4160
ld h, [hl]                        ;$4161
ld h, [hl]                        ;$4162
ld h, [hl]                        ;$4163
ld h, [hl]                        ;$4164
inc a                             ;$4165
nop                               ;$4166
nop                               ;$4167
jr $41a2                          ;$4168
jr $4184                          ;$416a
jr $41aa                          ;$416c
nop                               ;$416e
nop                               ;$416f
inc a                             ;$4170
ld c, [hl]                        ;$4171
ld c, $3c                         ;$4172
ld [hl], b                        ;$4174
ld a, [hl]                        ;$4175
nop                               ;$4176
nop                               ;$4177
ld a, h                           ;$4178
ld c, $3c                         ;$4179
ld c, $0e                         ;$417b
ld a, h                           ;$417d
nop                               ;$417e
nop                               ;$417f
inc a                             ;$4180
ld l, h                           ;$4181
ld c, h                           ;$4182
ld c, [hl]                        ;$4183
ld a, [hl]                        ;$4184
inc c                             ;$4185
nop                               ;$4186
nop                               ;$4187
ld a, h                           ;$4188
ld h, b                           ;$4189
ld a, h                           ;$418a
ld c, $4e                         ;$418b
inc a                             ;$418d
nop                               ;$418e
nop                               ;$418f
inc a                             ;$4190
ld h, b                           ;$4191
ld a, h                           ;$4192
ld h, [hl]                        ;$4193
ld h, [hl]                        ;$4194
inc a                             ;$4195
nop                               ;$4196
nop                               ;$4197
ld a, [hl]                        ;$4198
ld b, $0c                         ;$4199
jr $41d5                          ;$419b
jr c, $419f                       ;$419d
nop                               ;$419f
inc a                             ;$41a0
ld c, [hl]                        ;$41a1
inc a                             ;$41a2
ld c, [hl]                        ;$41a3
ld c, [hl]                        ;$41a4
inc a                             ;$41a5
nop                               ;$41a6
nop                               ;$41a7
inc a                             ;$41a8
ld c, [hl]                        ;$41a9
ld c, [hl]                        ;$41aa
ld a, $0e                         ;$41ab
inc a                             ;$41ad
nop                               ;$41ae
nop                               ;$41af
inc a                             ;$41b0
ld c, [hl]                        ;$41b1
ld c, [hl]                        ;$41b2
ld a, [hl]                        ;$41b3
ld c, [hl]                        ;$41b4
ld c, [hl]                        ;$41b5
nop                               ;$41b6
nop                               ;$41b7
ld a, h                           ;$41b8
ld h, [hl]                        ;$41b9
ld a, h                           ;$41ba
ld h, [hl]                        ;$41bb
ld h, [hl]                        ;$41bc
ld a, h                           ;$41bd
nop                               ;$41be
nop                               ;$41bf
inc a                             ;$41c0
ld h, [hl]                        ;$41c1
ld h, b                           ;$41c2
ld h, b                           ;$41c3
ld h, [hl]                        ;$41c4
inc a                             ;$41c5
nop                               ;$41c6
nop                               ;$41c7
ld a, h                           ;$41c8
ld c, [hl]                        ;$41c9
ld c, [hl]                        ;$41ca
ld c, [hl]                        ;$41cb
ld c, [hl]                        ;$41cc
ld a, h                           ;$41cd
nop                               ;$41ce
nop                               ;$41cf
ld a, [hl]                        ;$41d0
ld h, b                           ;$41d1
ld a, h                           ;$41d2
ld h, b                           ;$41d3
ld h, b                           ;$41d4
ld a, [hl]                        ;$41d5
nop                               ;$41d6
nop                               ;$41d7
ld a, [hl]                        ;$41d8
ld h, b                           ;$41d9
ld h, b                           ;$41da
ld a, h                           ;$41db
ld h, b                           ;$41dc
ld h, b                           ;$41dd
nop                               ;$41de
nop                               ;$41df
inc a                             ;$41e0
ld h, [hl]                        ;$41e1
ld h, b                           ;$41e2
ld l, [hl]                        ;$41e3
ld h, [hl]                        ;$41e4
ld a, $00                         ;$41e5
nop                               ;$41e7
ld b, [hl]                        ;$41e8
ld b, [hl]                        ;$41e9
ld a, [hl]                        ;$41ea
ld b, [hl]                        ;$41eb
ld b, [hl]                        ;$41ec
ld b, [hl]                        ;$41ed
nop                               ;$41ee
nop                               ;$41ef
inc a                             ;$41f0
jr $420b                          ;$41f1
jr $420d                          ;$41f3
inc a                             ;$41f5
nop                               ;$41f6
nop                               ;$41f7
ld e, $0c                         ;$41f8
inc c                             ;$41fa
ld l, h                           ;$41fb
ld l, h                           ;$41fc
jr c, $41ff                       ;$41fd
nop                               ;$41ff
ld h, [hl]                        ;$4200
ld l, h                           ;$4201
ld a, b                           ;$4202
ld a, b                           ;$4203
ld l, h                           ;$4204
ld h, [hl]                        ;$4205
nop                               ;$4206
nop                               ;$4207
ld h, b                           ;$4208
ld h, b                           ;$4209
ld h, b                           ;$420a
ld h, b                           ;$420b
ld h, b                           ;$420c
ld a, [hl]                        ;$420d
nop                               ;$420e
nop                               ;$420f
ld b, [hl]                        ;$4210
ld l, [hl]                        ;$4211
ld a, [hl]                        ;$4212
ld d, [hl]                        ;$4213
ld b, [hl]                        ;$4214
ld b, [hl]                        ;$4215
nop                               ;$4216
nop                               ;$4217
ld b, [hl]                        ;$4218
ld h, [hl]                        ;$4219
halt                              ;$421a
ld e, [hl]                        ;$421b
ld c, [hl]                        ;$421c
ld b, [hl]                        ;$421d
nop                               ;$421e
nop                               ;$421f
inc a                             ;$4220
ld h, [hl]                        ;$4221
ld h, [hl]                        ;$4222
ld h, [hl]                        ;$4223
ld h, [hl]                        ;$4224
inc a                             ;$4225
nop                               ;$4226
nop                               ;$4227
ld a, h                           ;$4228
ld h, [hl]                        ;$4229
ld h, [hl]                        ;$422a
ld a, h                           ;$422b
ld h, b                           ;$422c
ld h, b                           ;$422d
nop                               ;$422e
nop                               ;$422f
inc a                             ;$4230
ld h, d                           ;$4231
ld h, d                           ;$4232
ld l, d                           ;$4233
ld h, h                           ;$4234
ldd a, [hl]                       ;$4235
nop                               ;$4236
nop                               ;$4237
ld a, h                           ;$4238
ld h, [hl]                        ;$4239
ld h, [hl]                        ;$423a
ld a, h                           ;$423b
ld l, b                           ;$423c
ld h, [hl]                        ;$423d
nop                               ;$423e
nop                               ;$423f
inc a                             ;$4240
ld h, b                           ;$4241
inc a                             ;$4242
ld c, $4e                         ;$4243
inc a                             ;$4245
nop                               ;$4246
nop                               ;$4247
ld a, [hl]                        ;$4248
jr $4263                          ;$4249
jr $4265                          ;$424b
jr $424f                          ;$424d
nop                               ;$424f
ld b, [hl]                        ;$4250
ld b, [hl]                        ;$4251
ld b, [hl]                        ;$4252
ld b, [hl]                        ;$4253
ld c, [hl]                        ;$4254
inc a                             ;$4255
nop                               ;$4256
nop                               ;$4257
ld b, [hl]                        ;$4258
ld b, [hl]                        ;$4259
ld b, [hl]                        ;$425a
ld b, [hl]                        ;$425b
inc l                             ;$425c
jr $425f                          ;$425d
nop                               ;$425f
ld b, [hl]                        ;$4260
ld b, [hl]                        ;$4261
ld d, [hl]                        ;$4262
ld a, [hl]                        ;$4263
ld l, [hl]                        ;$4264
ld b, [hl]                        ;$4265
nop                               ;$4266
nop                               ;$4267
ld b, [hl]                        ;$4268
inc l                             ;$4269
jr $42a4                          ;$426a
ld h, h                           ;$426c
ld b, d                           ;$426d
nop                               ;$426e
nop                               ;$426f
ld h, [hl]                        ;$4270
ld h, [hl]                        ;$4271
inc a                             ;$4272
jr $428d                          ;$4273
jr $4277                          ;$4275
nop                               ;$4277
ld a, [hl]                        ;$4278
ld c, $1c                         ;$4279
jr c, $42ed                       ;$427b
ld a, [hl]                        ;$427d
nop                               ;$427e
nop                               ;$427f
nop                               ;$4280
nop                               ;$4281
nop                               ;$4282
nop                               ;$4283
ld h, b                           ;$4284
ld h, b                           ;$4285
nop                               ;$4286
nop                               ;$4287
nop                               ;$4288
nop                               ;$4289
inc a                             ;$428a
inc a                             ;$428b
nop                               ;$428c
nop                               ;$428d
nop                               ;$428e
nop                               ;$428f
nop                               ;$4290
ldi [hl], a                       ;$4291
inc d                             ;$4292
ld [$2214], sp                    ;$4293
nop                               ;$4296
nop                               ;$4297
nop                               ;$4298
ld [hl], $36                      ;$4299
ld e, a                           ;$429b
ld c, c                           ;$429c
ld e, a                           ;$429d
ld b, c                           ;$429e
ld a, a                           ;$429f
ld b, c                           ;$42a0
ld a, $22                         ;$42a1
inc e                             ;$42a3
inc d                             ;$42a4
ld [$ff08], sp                    ;$42a5
rst $38                           ;$42a8
rst $38                           ;$42a9
add c                             ;$42aa
pop bc                            ;$42ab
cp a                              ;$42ac
pop bc                            ;$42ad
cp a                              ;$42ae
pop bc                            ;$42af
cp a                              ;$42b0
pop bc                            ;$42b1
cp a                              ;$42b2
add c                             ;$42b3
rst $38                           ;$42b4
rst $38                           ;$42b5
rst $38                           ;$42b6
xor d                             ;$42b7
xor d                             ;$42b8
nop                               ;$42b9
nop                               ;$42ba
nop                               ;$42bb
nop                               ;$42bc
nop                               ;$42bd
nop                               ;$42be
nop                               ;$42bf
nop                               ;$42c0
nop                               ;$42c1
nop                               ;$42c2
nop                               ;$42c3
nop                               ;$42c4
nop                               ;$42c5
nop                               ;$42c6
cp $fe                            ;$42c7
cp $fe                            ;$42c9
cp $fe                            ;$42cb
cp $fe                            ;$42cd
cp $fe                            ;$42cf
cp $fe                            ;$42d1
cp $fe                            ;$42d3
cp $fe                            ;$42d5
ld a, a                           ;$42d7
ld a, a                           ;$42d8
ld a, a                           ;$42d9
ld a, a                           ;$42da
ld a, a                           ;$42db
ld a, a                           ;$42dc
ld a, a                           ;$42dd
ld a, a                           ;$42de
ld a, a                           ;$42df
ld a, a                           ;$42e0
ld a, a                           ;$42e1
ld a, a                           ;$42e2
ld a, a                           ;$42e3
ld a, a                           ;$42e4
ld a, a                           ;$42e5
ld a, a                           ;$42e6
rst $38                           ;$42e7
nop                               ;$42e8
rst $38                           ;$42e9
ld b, b                           ;$42ea
rst $38                           ;$42eb
ld [bc], a                        ;$42ec
rst $38                           ;$42ed
nop                               ;$42ee
rst $38                           ;$42ef
db $10 ;<corrupted stop>          ;$42f0
rst $38                           ;$42f1
add b                             ;$42f2
rst $38                           ;$42f3
ld [bc], a                        ;$42f4
rst $38                           ;$42f5
nop                               ;$42f6
ldh a, [$ff10]                    ;$42f7
rst $38                           ;$42f9
rra                               ;$42fa
rst $38                           ;$42fb
nop                               ;$42fc
rst $38                           ;$42fd
ld b, b                           ;$42fe
rst $38                           ;$42ff
nop                               ;$4300
rst $38                           ;$4301
ld [bc], a                        ;$4302
rst $38                           ;$4303
ld b, b                           ;$4304
rst $38                           ;$4305
nop                               ;$4306
rrca                              ;$4307
ld [$f8ff], sp                    ;$4308
rst $38                           ;$430b
nop                               ;$430c
rst $38                           ;$430d
ld [bc], a                        ;$430e
rst $38                           ;$430f
nop                               ;$4310
rst $38                           ;$4311
ld b, b                           ;$4312
rst $38                           ;$4313
ld [bc], a                        ;$4314
rst $38                           ;$4315
nop                               ;$4316
nop                               ;$4317
nop                               ;$4318
nop                               ;$4319
nop                               ;$431a
nop                               ;$431b
nop                               ;$431c
nop                               ;$431d
nop                               ;$431e
nop                               ;$431f
nop                               ;$4320
nop                               ;$4321
nop                               ;$4322
nop                               ;$4323
nop                               ;$4324
nop                               ;$4325
nop                               ;$4326
nop                               ;$4327
nop                               ;$4328
nop                               ;$4329
nop                               ;$432a
jr $4345                          ;$432b
jr c, $4367                       ;$432d
jr $4349                          ;$432f
jr $434b                          ;$4331
jr $434d                          ;$4333
inc a                             ;$4335
inc a                             ;$4336
nop                               ;$4337
nop                               ;$4338
nop                               ;$4339
nop                               ;$433a
inc a                             ;$433b
inc a                             ;$433c
ld c, [hl]                        ;$433d
ld c, [hl]                        ;$433e
ld c, [hl]                        ;$433f
ld c, [hl]                        ;$4340
ld a, $3e                         ;$4341
ld c, $0e                         ;$4343
inc a                             ;$4345
inc a                             ;$4346
nop                               ;$4347
nop                               ;$4348
nop                               ;$4349
nop                               ;$434a
inc a                             ;$434b
inc a                             ;$434c
ld c, [hl]                        ;$434d
ld c, [hl]                        ;$434e
inc a                             ;$434f
inc a                             ;$4350
ld c, [hl]                        ;$4351
ld c, [hl]                        ;$4352
ld c, [hl]                        ;$4353
ld c, [hl]                        ;$4354
inc a                             ;$4355
inc a                             ;$4356
nop                               ;$4357
nop                               ;$4358
jr c, $4393                       ;$4359
ld b, h                           ;$435b
ld b, h                           ;$435c
cp d                              ;$435d
cp d                              ;$435e
and d                             ;$435f
and d                             ;$4360
cp d                              ;$4361
cp d                              ;$4362
ld b, h                           ;$4363
ld b, h                           ;$4364
jr c, $439f                       ;$4365
add a, $c6                        ;$4367
and a, $e6                        ;$4369
and a, $e6                        ;$436b
sub a, $d6                        ;$436d
sub a, $d6                        ;$436f
adc a, $ce                        ;$4371
adc a, $ce                        ;$4373
add a, $c6                        ;$4375
ret nz                            ;$4377
ret nz                            ;$4378
ret nz                            ;$4379
ret nz                            ;$437a
nop                               ;$437b
nop                               ;$437c
db $db ;<unknown instruction>     ;$437d
db $db ;<unknown instruction>     ;$437e
db $dd ;<unknown instruction>     ;$437f
db $dd ;<unknown instruction>     ;$4380
reti                              ;$4381
reti                              ;$4382
reti                              ;$4383
reti                              ;$4384
reti                              ;$4385
reti                              ;$4386
nop                               ;$4387
nop                               ;$4388
jr nc, $43bb                      ;$4389
ld a, b                           ;$438b
ld a, b                           ;$438c
inc sp                            ;$438d
inc sp                            ;$438e
or [hl]                           ;$438f
or [hl]                           ;$4390
or a                              ;$4391
or a                              ;$4392
or [hl]                           ;$4393
or [hl]                           ;$4394
or e                              ;$4395
or e                              ;$4396
nop                               ;$4397
nop                               ;$4398
nop                               ;$4399
nop                               ;$439a
nop                               ;$439b
nop                               ;$439c
call $6ecd                        ;$439d
ld l, [hl]                        ;$43a0
db $ec ;<unknown instruction>     ;$43a1
db $ec ;<unknown instruction>     ;$43a2
inc c                             ;$43a3
inc c                             ;$43a4
db $ec ;<unknown instruction>     ;$43a5
db $ec ;<unknown instruction>     ;$43a6
ld bc, $0101                      ;$43a7
ld bc, $0101                      ;$43aa
adc a                             ;$43ad
adc a                             ;$43ae
reti                              ;$43af
reti                              ;$43b0
reti                              ;$43b1
reti                              ;$43b2
reti                              ;$43b3
reti                              ;$43b4
rst $08                           ;$43b5
rst $08                           ;$43b6
add b                             ;$43b7
add b                             ;$43b8
add b                             ;$43b9
add b                             ;$43ba
add b                             ;$43bb
add b                             ;$43bc
sbc [hl]                          ;$43bd
sbc [hl]                          ;$43be
or e                              ;$43bf
or e                              ;$43c0
or e                              ;$43c1
or e                              ;$43c2
or e                              ;$43c3
or e                              ;$43c4
sbc [hl]                          ;$43c5
sbc [hl]                          ;$43c6
rst $38                           ;$43c7
nop                               ;$43c8
rst $38                           ;$43c9
nop                               ;$43ca
rst $38                           ;$43cb
nop                               ;$43cc
rst $28                           ;$43cd
nop                               ;$43ce
rst $38                           ;$43cf
nop                               ;$43d0
rst $38                           ;$43d1
nop                               ;$43d2
rst $38                           ;$43d3
nop                               ;$43d4
rst $38                           ;$43d5
nop                               ;$43d6
rst $38                           ;$43d7
nop                               ;$43d8
rst $38                           ;$43d9
nop                               ;$43da
rst $38                           ;$43db
nop                               ;$43dc
rst $20                           ;$43dd
nop                               ;$43de
rst $20                           ;$43df
nop                               ;$43e0
rst $38                           ;$43e1
nop                               ;$43e2
rst $38                           ;$43e3
nop                               ;$43e4
rst $38                           ;$43e5
nop                               ;$43e6
nop                               ;$43e7
rst $38                           ;$43e8
rst $38                           ;$43e9
rst $38                           ;$43ea
nop                               ;$43eb
rst $38                           ;$43ec
nop                               ;$43ed
rst $38                           ;$43ee
rst $38                           ;$43ef
nop                               ;$43f0
nop                               ;$43f1
rst $38                           ;$43f2
rst $38                           ;$43f3
nop                               ;$43f4
rst $38                           ;$43f5
nop                               ;$43f6
nop                               ;$43f7
rst $38                           ;$43f8
rst $38                           ;$43f9
rst $38                           ;$43fa
ld bc, $02ff                      ;$43fb
cp $fe                            ;$43fe
ld [bc], a                        ;$4400
inc b                             ;$4401
db $fc ;<unknown instruction>     ;$4402
db $fc ;<unknown instruction>     ;$4403
inc b                             ;$4404
db $fc ;<unknown instruction>     ;$4405
inc b                             ;$4406
nop                               ;$4407
rst $38                           ;$4408
rst $38                           ;$4409
rst $38                           ;$440a
add b                             ;$440b
rst $38                           ;$440c
ld b, b                           ;$440d
ld a, a                           ;$440e
rst $38                           ;$440f
ld b, b                           ;$4410
ldh [$ff3f], a                    ;$4411
rst $38                           ;$4413
jr nz, $43d5                      ;$4414
ld h, b                           ;$4416
rst $38                           ;$4417
nop                               ;$4418
rst $38                           ;$4419
nop                               ;$441a
rst $38                           ;$441b
ld bc, $02fe                      ;$441c
cp $02                            ;$441f
db $fc ;<unknown instruction>     ;$4421
inc b                             ;$4422
db $fc ;<unknown instruction>     ;$4423
inc b                             ;$4424
db $fc ;<unknown instruction>     ;$4425
inc b                             ;$4426
rst $38                           ;$4427
nop                               ;$4428
rst $38                           ;$4429
nop                               ;$442a
rst $38                           ;$442b
add b                             ;$442c
ld a, a                           ;$442d
ld b, b                           ;$442e
rst $38                           ;$442f
ld b, b                           ;$4430
rst $38                           ;$4431
jr nz, $4433                      ;$4432
jr nz, $43f5                      ;$4434
ld h, b                           ;$4436
rst $38                           ;$4437
rst $38                           ;$4438
rst $38                           ;$4439
rst $38                           ;$443a
rst $38                           ;$443b
rst $38                           ;$443c
rst $38                           ;$443d
rst $38                           ;$443e
rst $38                           ;$443f
rst $38                           ;$4440
rst $38                           ;$4441
rst $38                           ;$4442
nop                               ;$4443
nop                               ;$4444
nop                               ;$4445
nop                               ;$4446
rst $38                           ;$4447
ld [bc], a                        ;$4448
rst $38                           ;$4449
ld bc, $01ff                      ;$444a
rst $38                           ;$444d
ld bc, $01ff                      ;$444e
rst $38                           ;$4451
ld bc, $01ff                      ;$4452
rst $38                           ;$4455
ld bc, $c07f                      ;$4456
rst $38                           ;$4459
add b                             ;$445a
rst $38                           ;$445b
add b                             ;$445c
rst $38                           ;$445d
add b                             ;$445e
rst $38                           ;$445f
add b                             ;$4460
rst $38                           ;$4461
add b                             ;$4462
rst $38                           ;$4463
add b                             ;$4464
rst $38                           ;$4465
add b                             ;$4466
cp $02                            ;$4467
cp $02                            ;$4469
rst $38                           ;$446b
inc bc                            ;$446c
db $fc ;<unknown instruction>     ;$446d
dec b                             ;$446e
ld hl, sp+$09                     ;$446f
pop af                            ;$4471
ld [de], a                        ;$4472
pop hl                            ;$4473
ld h, $c3                         ;$4474
ld c, h                           ;$4476
ld a, a                           ;$4477
ret nz                            ;$4478
ld a, a                           ;$4479
ret nz                            ;$447a
rst $38                           ;$447b
ret nz                            ;$447c
cp a                              ;$447d
ld h, b                           ;$447e
sbc a                             ;$447f
ld [hl], b                        ;$4480
xor a                             ;$4481
ld e, b                           ;$4482
daa                               ;$4483
call c, $ce33                     ;$4484
rst $38                           ;$4487
nop                               ;$4488
rst $38                           ;$4489
ld bc, $02fe                      ;$448a
db $fc ;<unknown instruction>     ;$448d
inc b                             ;$448e
ld hl, sp+$09                     ;$448f
ldh a, [$ff13]                    ;$4491
ldh [$ff27], a                    ;$4493
ldh [$ff2f], a                    ;$4495
add a                             ;$4497
sbc b                             ;$4498
ld b, $39                         ;$4499
ld c, $71                         ;$449b
ld e, $e1                         ;$449d
inc a                             ;$449f
jp $c33c                          ;$44a0
ld a, b                           ;$44a3
add a                             ;$44a4
ld a, b                           ;$44a5
add a                             ;$44a6
dec [hl]                          ;$44a7
swap d                            ;$44a8
call $c53a                        ;$44aa
ld a, c                           ;$44ad
add [hl]                          ;$44ae
ld a, b                           ;$44af
add a                             ;$44b0
ld a, b                           ;$44b1
add a                             ;$44b2
ld a, h                           ;$44b3
add e                             ;$44b4
ld a, h                           ;$44b5
add e                             ;$44b6
rst $38                           ;$44b7
nop                               ;$44b8
rst $38                           ;$44b9
add b                             ;$44ba
ld a, a                           ;$44bb
ret nz                            ;$44bc
ccf                               ;$44bd
ldh [$ff9f], a                    ;$44be
ld [hl], b                        ;$44c0
ld c, a                           ;$44c1
cp b                              ;$44c2
ld h, a                           ;$44c3
sbc h                             ;$44c4
scf                               ;$44c5
call z, $4fc0                     ;$44c6
ret nz                            ;$44c9
ld c, a                           ;$44ca
add b                             ;$44cb
sbc a                             ;$44cc
add b                             ;$44cd
sbc a                             ;$44ce
add b                             ;$44cf
sbc a                             ;$44d0
add b                             ;$44d1
sbc a                             ;$44d2
add b                             ;$44d3
sbc a                             ;$44d4
add b                             ;$44d5
sbc a                             ;$44d6
ld hl, sp+$07                     ;$44d7
ldh a, [$ff0f]                    ;$44d9
ldh a, [$ff0f]                    ;$44db
ldh a, [$ff0f]                    ;$44dd
ldh a, [$ff0f]                    ;$44df
ldh a, [$ff0f]                    ;$44e1
ldh a, [$ff0f]                    ;$44e3
ld hl, sp+$07                     ;$44e5
ld a, h                           ;$44e7
add e                             ;$44e8
ld a, [hl]                        ;$44e9
add c                             ;$44ea
ld a, [hl]                        ;$44eb
add c                             ;$44ec
ld a, $c1                         ;$44ed
ccf                               ;$44ef
ret nz                            ;$44f0
rra                               ;$44f1
ldh [$ff1f], a                    ;$44f2
ldh [$ff1f], a                    ;$44f4
ldh [$ff33], a                    ;$44f6
adc a, $1b                        ;$44f8
and a, $09                        ;$44fa
rst $30                           ;$44fc
dec c                             ;$44fd
di                                ;$44fe
dec c                             ;$44ff
di                                ;$4500
dec c                             ;$4501
di                                ;$4502
dec c                             ;$4503
di                                ;$4504
add hl, bc                        ;$4505
rst $30                           ;$4506
ret nz                            ;$4507
ld e, a                           ;$4508
ret nz                            ;$4509
ld c, a                           ;$450a
ldh [$ff2f], a                    ;$450b
ldh [$ff27], a                    ;$450d
ldh a, [$ff11]                    ;$450f
cp a                              ;$4511
ld c, a                           ;$4512
inc c                             ;$4513
db $f4 ;<unknown instruction>     ;$4514
rlca                              ;$4515
rst $38                           ;$4516
ld a, b                           ;$4517
add a                             ;$4518
ld a, h                           ;$4519
add e                             ;$451a
inc a                             ;$451b
jp $e11e                          ;$451c
rrca                              ;$451f
ldh a, [$ffff]                    ;$4520
rst $38                           ;$4522
rst $38                           ;$4523
nop                               ;$4524
rst $38                           ;$4525
rst $38                           ;$4526
rrca                              ;$4527
ldh a, [$ff0f]                    ;$4528
ldh a, [$ff0e]                    ;$452a
pop af                            ;$452c
ld c, $f1                         ;$452d
ld b, $f9                         ;$452f
rst $38                           ;$4531
rst $38                           ;$4532
push bc                           ;$4533
ccf                               ;$4534
rst $38                           ;$4535
rst $38                           ;$4536
dec de                            ;$4537
and a, $13                        ;$4538
xor $37                           ;$453a
call z, $dc27                     ;$453c
ld c, a                           ;$453f
cp b                              ;$4540
db $fc ;<unknown instruction>     ;$4541
di                                ;$4542
db $fc ;<unknown instruction>     ;$4543
and e                             ;$4544
ldh [$ffff], a                    ;$4545
cp $02                            ;$4547
cp $02                            ;$4549
cp a                              ;$454b
ld b, e                           ;$454c
inc e                             ;$454d
push hl                           ;$454e
cp b                              ;$454f
ld c, c                           ;$4550
or c                              ;$4551
ld d, d                           ;$4552
and c                             ;$4553
ld h, [hl]                        ;$4554
ld b, e                           ;$4555
call z, $00ff                     ;$4556
rst $38                           ;$4559
nop                               ;$455a
rst $38                           ;$455b
nop                               ;$455c
rst $38                           ;$455d
nop                               ;$455e
rst $38                           ;$455f
nop                               ;$4560
rst $38                           ;$4561
nop                               ;$4562
rst $28                           ;$4563
db $10 ;<corrupted stop>          ;$4564
rst $00                           ;$4565
jr c, $4567                       ;$4566
nop                               ;$4568
ei                                ;$4569
inc b                             ;$456a
ei                                ;$456b
inc b                             ;$456c
ei                                ;$456d
inc b                             ;$456e
ei                                ;$456f
inc b                             ;$4570
pop af                            ;$4571
ld c, $f1                         ;$4572
ld c, $f1                         ;$4574
ld c, $83                         ;$4576
ld a, h                           ;$4578
ld bc, $01fe                      ;$4579
cp $01                            ;$457c
cp $83                            ;$457e
ld a, h                           ;$4580
rst $38                           ;$4581
nop                               ;$4582
add e                             ;$4583
ld a, h                           ;$4584
add e                             ;$4585
ld a, h                           ;$4586
pop af                            ;$4587
ld c, $e0                         ;$4588
rra                               ;$458a
ldh [$ff1f], a                    ;$458b
ldh [$ff1f], a                    ;$458d
ldh [$ff1f], a                    ;$458f
ldh [$ff1f], a                    ;$4591
add b                             ;$4593
ld a, a                           ;$4594
add b                             ;$4595
ld a, a                           ;$4596
rst $30                           ;$4597
ld [$14eb], sp                    ;$4598
rst $30                           ;$459b
ld [$08f7], sp                    ;$459c
db $e3 ;<unknown instruction>     ;$459f
inc e                             ;$45a0
db $e3 ;<unknown instruction>     ;$45a1
inc e                             ;$45a2
ld h, e                           ;$45a3
sbc h                             ;$45a4
ld bc, $00fe                      ;$45a5
nop                               ;$45a8
ld h, b                           ;$45a9
ld h, b                           ;$45aa
ld [hl], b                        ;$45ab
ld [hl], b                        ;$45ac
ld a, b                           ;$45ad
ld a, b                           ;$45ae
ld a, b                           ;$45af
ld a, b                           ;$45b0
ld [hl], b                        ;$45b1
ld [hl], b                        ;$45b2
ld h, b                           ;$45b3
ld h, b                           ;$45b4
nop                               ;$45b5
nop                               ;$45b6
nop                               ;$45b7
nop                               ;$45b8
jr nc, $45eb                      ;$45b9
ld [hl], b                        ;$45bb
ld [hl], b                        ;$45bc
jr nc, $45ef                      ;$45bd
jr nc, $45f1                      ;$45bf
jr nc, $45f3                      ;$45c1
ld a, b                           ;$45c3
ld a, b                           ;$45c4
nop                               ;$45c5
nop                               ;$45c6
ldh [$ffe0], a                    ;$45c7
ldh a, [$ffe0]                    ;$45c9
ei                                ;$45cb
ldh [$fffc], a                    ;$45cc
ldh [$fffc], a                    ;$45ce
pop hl                            ;$45d0
db $fc ;<unknown instruction>     ;$45d1
pop hl                            ;$45d2
db $fc ;<unknown instruction>     ;$45d3
pop hl                            ;$45d4
db $fc ;<unknown instruction>     ;$45d5
pop hl                            ;$45d6
nop                               ;$45d7
nop                               ;$45d8
nop                               ;$45d9
nop                               ;$45da
rst $38                           ;$45db
nop                               ;$45dc
nop                               ;$45dd
nop                               ;$45de
nop                               ;$45df
rst $38                           ;$45e0
nop                               ;$45e1
nop                               ;$45e2
nop                               ;$45e3
nop                               ;$45e4
nop                               ;$45e5
nop                               ;$45e6
rlca                              ;$45e7
rlca                              ;$45e8
rrca                              ;$45e9
rlca                              ;$45ea
rst $18                           ;$45eb
rlca                              ;$45ec
ccf                               ;$45ed
rlca                              ;$45ee
ccf                               ;$45ef
add a                             ;$45f0
ccf                               ;$45f1
add a                             ;$45f2
ccf                               ;$45f3
add a                             ;$45f4
ccf                               ;$45f5
add a                             ;$45f6
db $fc ;<unknown instruction>     ;$45f7
pop hl                            ;$45f8
db $fc ;<unknown instruction>     ;$45f9
pop hl                            ;$45fa
db $fc ;<unknown instruction>     ;$45fb
pop hl                            ;$45fc
db $fc ;<unknown instruction>     ;$45fd
pop hl                            ;$45fe
db $fc ;<unknown instruction>     ;$45ff
pop hl                            ;$4600
db $fc ;<unknown instruction>     ;$4601
pop hl                            ;$4602
db $fc ;<unknown instruction>     ;$4603
pop hl                            ;$4604
db $fc ;<unknown instruction>     ;$4605
pop hl                            ;$4606
ccf                               ;$4607
add a                             ;$4608
ccf                               ;$4609
add a                             ;$460a
ccf                               ;$460b
add a                             ;$460c
ccf                               ;$460d
add a                             ;$460e
ccf                               ;$460f
add a                             ;$4610
ccf                               ;$4611
add a                             ;$4612
ccf                               ;$4613
add a                             ;$4614
ccf                               ;$4615
add a                             ;$4616
db $fc ;<unknown instruction>     ;$4617
pop hl                            ;$4618
db $fc ;<unknown instruction>     ;$4619
pop hl                            ;$461a
db $fc ;<unknown instruction>     ;$461b
pop hl                            ;$461c
db $fc ;<unknown instruction>     ;$461d
pop hl                            ;$461e
db $fc ;<unknown instruction>     ;$461f
ldh [$ffff], a                    ;$4620
rst $20                           ;$4622
rst $38                           ;$4623
rst $28                           ;$4624
ldh [$ffff], a                    ;$4625
nop                               ;$4627
nop                               ;$4628
nop                               ;$4629
nop                               ;$462a
nop                               ;$462b
nop                               ;$462c
nop                               ;$462d
rst $38                           ;$462e
nop                               ;$462f
nop                               ;$4630
rst $38                           ;$4631
rst $38                           ;$4632
rst $38                           ;$4633
rst $38                           ;$4634
nop                               ;$4635
rst $38                           ;$4636
ccf                               ;$4637
add a                             ;$4638
ccf                               ;$4639
add a                             ;$463a
ccf                               ;$463b
add a                             ;$463c
ccf                               ;$463d
add a                             ;$463e
ccf                               ;$463f
rlca                              ;$4640
rst $38                           ;$4641
rst $20                           ;$4642
rst $38                           ;$4643
rst $30                           ;$4644
rlca                              ;$4645
rst $38                           ;$4646
ld hl, sp+$00                     ;$4647
ldh [$ff00], a                    ;$4649
ret nz                            ;$464b
nop                               ;$464c
add b                             ;$464d
nop                               ;$464e
add b                             ;$464f
nop                               ;$4650
nop                               ;$4651
nop                               ;$4652
nop                               ;$4653
nop                               ;$4654
nop                               ;$4655
nop                               ;$4656
ld a, a                           ;$4657
nop                               ;$4658
rra                               ;$4659
nop                               ;$465a
rrca                              ;$465b
nop                               ;$465c
rlca                              ;$465d
nop                               ;$465e
rlca                              ;$465f
nop                               ;$4660
inc bc                            ;$4661
nop                               ;$4662
inc bc                            ;$4663
nop                               ;$4664
inc bc                            ;$4665
nop                               ;$4666
nop                               ;$4667
nop                               ;$4668
add b                             ;$4669
nop                               ;$466a
add b                             ;$466b
nop                               ;$466c
ret nz                            ;$466d
nop                               ;$466e
ldh [$ff00], a                    ;$466f
ld hl, sp+$00                     ;$4671
rst $38                           ;$4673
nop                               ;$4674
rst $38                           ;$4675
nop                               ;$4676
inc bc                            ;$4677
nop                               ;$4678
rlca                              ;$4679
nop                               ;$467a
rlca                              ;$467b
nop                               ;$467c
rrca                              ;$467d
nop                               ;$467e
rra                               ;$467f
nop                               ;$4680
ld a, a                           ;$4681
nop                               ;$4682
rst $38                           ;$4683
nop                               ;$4684
rst $38                           ;$4685
nop                               ;$4686
ld bc, $0101                      ;$4687
ld bc, $8181                      ;$468a
pop bc                            ;$468d
pop bc                            ;$468e
pop bc                            ;$468f
pop bc                            ;$4690
pop hl                            ;$4691
pop hl                            ;$4692
pop af                            ;$4693
pop af                            ;$4694
ld sp, hl                         ;$4695
ld sp, hl                         ;$4696
cp $fe                            ;$4697
cp $fe                            ;$4699
cp $fe                            ;$469b
cp $fe                            ;$469d
cp $fe                            ;$469f
cp $fe                            ;$46a1
cp $fe                            ;$46a3
cp $fe                            ;$46a5
ld a, [hl]                        ;$46a7
ld a, [hl]                        ;$46a8
ld a, a                           ;$46a9
ld a, a                           ;$46aa
ld a, a                           ;$46ab
ld a, a                           ;$46ac
ld a, a                           ;$46ad
ld a, a                           ;$46ae
ld a, a                           ;$46af
ld a, a                           ;$46b0
ld a, a                           ;$46b1
ld a, a                           ;$46b2
ld a, a                           ;$46b3
ld a, a                           ;$46b4
ld a, a                           ;$46b5
ld a, a                           ;$46b6
ld a, a                           ;$46b7
ld a, a                           ;$46b8
ccf                               ;$46b9
ccf                               ;$46ba
sbc a                             ;$46bb
sbc a                             ;$46bc
adc a                             ;$46bd
adc a                             ;$46be
rst $08                           ;$46bf
rst $08                           ;$46c0
rst $20                           ;$46c1
rst $20                           ;$46c2
di                                ;$46c3
di                                ;$46c4
rst $30                           ;$46c5
rst $30                           ;$46c6
ldh [$ffe0], a                    ;$46c7
ldh [$ffe0], a                    ;$46c9
ldh [$ffe0], a                    ;$46cb
ldh [$ffe0], a                    ;$46cd
ldh [$ffe0], a                    ;$46cf
ret nz                            ;$46d1
ret nz                            ;$46d2
ret nz                            ;$46d3
ret nz                            ;$46d4
add b                             ;$46d5
add b                             ;$46d6
ldh a, [$fff0]                    ;$46d7
ldh a, [$fff0]                    ;$46d9
ldh a, [$fff0]                    ;$46db
ldh a, [$fff0]                    ;$46dd
ldh a, [$fff0]                    ;$46df
ldh a, [$fff0]                    ;$46e1
ldh a, [$fff0]                    ;$46e3
ldh a, [$fff0]                    ;$46e5
nop                               ;$46e7
nop                               ;$46e8
ld a, h                           ;$46e9
ld a, h                           ;$46ea
ld b, a                           ;$46eb
ld b, a                           ;$46ec
ld b, c                           ;$46ed
ld b, c                           ;$46ee
ld b, b                           ;$46ef
ld b, b                           ;$46f0
ld b, b                           ;$46f1
ld b, b                           ;$46f2
ld b, b                           ;$46f3
ld b, b                           ;$46f4
ld a, a                           ;$46f5
ld b, b                           ;$46f6
nop                               ;$46f7
nop                               ;$46f8
ld bc, $0101                      ;$46f9
ld bc, $8181                      ;$46fc
pop bc                            ;$46ff
pop bc                            ;$4700
ld b, c                           ;$4701
ld b, c                           ;$4702
ld h, c                           ;$4703
ld h, c                           ;$4704
pop hl                            ;$4705
ld h, c                           ;$4706
nop                               ;$4707
nop                               ;$4708
cp $fe                            ;$4709
ld b, $06                         ;$470b
ld b, $06                         ;$470d
ld b, $06                         ;$470f
ld b, $06                         ;$4711
ld b, $06                         ;$4713
cp $06                            ;$4715
nop                               ;$4717
nop                               ;$4718
dec de                            ;$4719
dec de                            ;$471a
ldd [hl], a                       ;$471b
ldd [hl], a                       ;$471c
ld e, c                           ;$471d
ld e, c                           ;$471e
ld c, h                           ;$471f
ld c, h                           ;$4720
adc h                             ;$4721
adc h                             ;$4722
add [hl]                          ;$4723
add [hl]                          ;$4724
rst $38                           ;$4725
add e                             ;$4726
nop                               ;$4727
nop                               ;$4728
rst $38                           ;$4729
rst $38                           ;$472a
ld bc, $0101                      ;$472b
ld bc, $8181                      ;$472e
ld b, c                           ;$4731
ld b, c                           ;$4732
ld b, c                           ;$4733
ld b, c                           ;$4734
ccf                               ;$4735
ld hl, $0000                      ;$4736
cp [hl]                           ;$4739
cp [hl]                           ;$473a
adc b                             ;$473b
adc b                             ;$473c
adc b                             ;$473d
adc b                             ;$473e
adc b                             ;$473f
adc b                             ;$4740
adc b                             ;$4741
adc b                             ;$4742
add b                             ;$4743
add b                             ;$4744
add b                             ;$4745
add b                             ;$4746
nop                               ;$4747
nop                               ;$4748
adc b                             ;$4749
adc b                             ;$474a
ret c                             ;$474b
ret c                             ;$474c
xor b                             ;$474d
xor b                             ;$474e
adc b                             ;$474f
adc b                             ;$4750
adc b                             ;$4751
adc b                             ;$4752
nop                               ;$4753
nop                               ;$4754
nop                               ;$4755
nop                               ;$4756
ld a, a                           ;$4757
ld b, b                           ;$4758
ld a, a                           ;$4759
ld b, b                           ;$475a
ld a, a                           ;$475b
ld b, b                           ;$475c
ld a, a                           ;$475d
ld b, b                           ;$475e
ld a, a                           ;$475f
ld b, b                           ;$4760
ld a, a                           ;$4761
ld b, b                           ;$4762
ld a, a                           ;$4763
ld b, b                           ;$4764
ld b, a                           ;$4765
ld a, a                           ;$4766
pop hl                            ;$4767
ld h, c                           ;$4768
pop hl                            ;$4769
ld h, c                           ;$476a
pop hl                            ;$476b
ld h, c                           ;$476c
pop hl                            ;$476d
ld h, c                           ;$476e
pop hl                            ;$476f
ld h, c                           ;$4770
pop bc                            ;$4771
pop bc                            ;$4772
pop bc                            ;$4773
pop bc                            ;$4774
add c                             ;$4775
add c                             ;$4776
cp $06                            ;$4777
cp $06                            ;$4779
cp $06                            ;$477b
cp $06                            ;$477d
cp $06                            ;$477f
cp $06                            ;$4781
cp $06                            ;$4783
ld b, $fe                         ;$4785
rst $38                           ;$4787
add e                             ;$4788
rst $38                           ;$4789
add c                             ;$478a
ld a, a                           ;$478b
ld b, b                           ;$478c
ld a, a                           ;$478d
ld b, b                           ;$478e
ld a, a                           ;$478f
ld b, b                           ;$4790
ccf                               ;$4791
jr nz, $47d3                      ;$4792
jr nz, $47a6                      ;$4794
rra                               ;$4796
rra                               ;$4797
ld de, $919f                      ;$4798
rst $08                           ;$479b
ret                               ;$479c
rst $00                           ;$479d
push bc                           ;$479e
db $e3 ;<unknown instruction>     ;$479f
ld h, e                           ;$47a0
di                                ;$47a1
inc sp                            ;$47a2
ld sp, hl                         ;$47a3
add hl, de                        ;$47a4
ld [$80f8], sp                    ;$47a5
add b                             ;$47a8
add b                             ;$47a9
add b                             ;$47aa
add b                             ;$47ab
add b                             ;$47ac
add b                             ;$47ad
add b                             ;$47ae
add b                             ;$47af
add b                             ;$47b0
add b                             ;$47b1
add b                             ;$47b2
add b                             ;$47b3
add b                             ;$47b4
add b                             ;$47b5
add b                             ;$47b6
ld e, a                           ;$47b7
ld a, a                           ;$47b8
ld a, b                           ;$47b9
ld a, b                           ;$47ba
ld h, b                           ;$47bb
ld h, b                           ;$47bc
ld d, b                           ;$47bd
ld [hl], b                        ;$47be
ld d, b                           ;$47bf
ld [hl], b                        ;$47c0
ld c, b                           ;$47c1
ld a, b                           ;$47c2
ld b, h                           ;$47c3
ld a, h                           ;$47c4
ld a, [hl]                        ;$47c5
ld a, [hl]                        ;$47c6
ld bc, $0101                      ;$47c7
ld bc, $0101                      ;$47ca
ld bc, $0101                      ;$47cd
ld bc, $0101                      ;$47d0
ld bc, $0101                      ;$47d3
ld bc, $fe06                      ;$47d6
ld b, $fe                         ;$47d9
ld b, $fe                         ;$47db
ld b, $fe                         ;$47dd
ld b, $fe                         ;$47df
ld b, $fe                         ;$47e1
ld b, $fe                         ;$47e3
cp $fe                            ;$47e5
ld [$440f], sp                    ;$47e7
ld b, a                           ;$47ea
ld h, h                           ;$47eb
ld h, a                           ;$47ec
ld [hl], d                        ;$47ed
ld [hl], e                        ;$47ee
ld d, c                           ;$47ef
ld [hl], c                        ;$47f0
ld e, c                           ;$47f1
ld a, c                           ;$47f2
ld c, h                           ;$47f3
ld a, h                           ;$47f4
ld a, [hl]                        ;$47f5
ld a, [hl]                        ;$47f6
inc c                             ;$47f7
db $fc ;<unknown instruction>     ;$47f8
ld b, $fe                         ;$47f9
inc bc                            ;$47fb
rst $38                           ;$47fc
ld bc, $01ff                      ;$47fd
rst $38                           ;$4800
nop                               ;$4801
rst $38                           ;$4802
add b                             ;$4803
rst $38                           ;$4804
ld a, a                           ;$4805
ld a, a                           ;$4806
nop                               ;$4807
nop                               ;$4808
nop                               ;$4809
nop                               ;$480a
nop                               ;$480b
nop                               ;$480c
add b                             ;$480d
add b                             ;$480e
add b                             ;$480f
add b                             ;$4810
ret nz                            ;$4811
ret nz                            ;$4812
ret nz                            ;$4813
ret nz                            ;$4814
ldh [$ffe0], a                    ;$4815
ld a, [hl]                        ;$4817
ld a, [hl]                        ;$4818
ld a, a                           ;$4819
ld a, a                           ;$481a
ld a, a                           ;$481b
ld a, a                           ;$481c
ld a, a                           ;$481d
ld a, a                           ;$481e
ld a, a                           ;$481f
ld a, a                           ;$4820
ld a, a                           ;$4821
ld a, a                           ;$4822
ld a, a                           ;$4823
ld a, a                           ;$4824
ld a, a                           ;$4825
ld a, a                           ;$4826
nop                               ;$4827
nop                               ;$4828
inc bc                            ;$4829
inc bc                            ;$482a
ld [bc], a                        ;$482b
ld [bc], a                        ;$482c
ld [bc], a                        ;$482d
ld [bc], a                        ;$482e
ld [bc], a                        ;$482f
ld [bc], a                        ;$4830
ld [bc], a                        ;$4831
ld [bc], a                        ;$4832
ld [bc], a                        ;$4833
ld [bc], a                        ;$4834
inc bc                            ;$4835
ld [bc], a                        ;$4836
nop                               ;$4837
nop                               ;$4838
ei                                ;$4839
ei                                ;$483a
ld a, [bc]                        ;$483b
ld a, [bc]                        ;$483c
ld [de], a                        ;$483d
ld [de], a                        ;$483e
ldi [hl], a                       ;$483f
ldi [hl], a                       ;$4840
ldi [hl], a                       ;$4841
ldi [hl], a                       ;$4842
ld b, d                           ;$4843
ld b, d                           ;$4844
jp $0042                          ;$4845
nop                               ;$4848
db $fd ;<unknown instruction>     ;$4849
db $fd ;<unknown instruction>     ;$484a
dec c                             ;$484b
dec c                             ;$484c
inc c                             ;$484d
inc c                             ;$484e
inc c                             ;$484f
inc c                             ;$4850
inc c                             ;$4851
inc c                             ;$4852
inc c                             ;$4853
inc c                             ;$4854
db $fc ;<unknown instruction>     ;$4855
inc c                             ;$4856
nop                               ;$4857
nop                               ;$4858
db $fc ;<unknown instruction>     ;$4859
db $fc ;<unknown instruction>     ;$485a
inc c                             ;$485b
inc c                             ;$485c
adc h                             ;$485d
adc h                             ;$485e
ld c, h                           ;$485f
ld c, h                           ;$4860
ld c, h                           ;$4861
ld c, h                           ;$4862
inc l                             ;$4863
inc l                             ;$4864
inc a                             ;$4865
inc l                             ;$4866
inc bc                            ;$4867
ld [bc], a                        ;$4868
inc bc                            ;$4869
ld [bc], a                        ;$486a
inc bc                            ;$486b
inc bc                            ;$486c
inc bc                            ;$486d
inc bc                            ;$486e
ld [bc], a                        ;$486f
ld [bc], a                        ;$4870
nop                               ;$4871
nop                               ;$4872
nop                               ;$4873
nop                               ;$4874
nop                               ;$4875
nop                               ;$4876
add e                             ;$4877
add d                             ;$4878
add e                             ;$4879
add d                             ;$487a
inc bc                            ;$487b
ld [bc], a                        ;$487c
inc bc                            ;$487d
ld [bc], a                        ;$487e
inc bc                            ;$487f
ld [bc], a                        ;$4880
inc bc                            ;$4881
ld [bc], a                        ;$4882
inc bc                            ;$4883
ld [bc], a                        ;$4884
ld [bc], a                        ;$4885
inc bc                            ;$4886
db $fc ;<unknown instruction>     ;$4887
inc c                             ;$4888
db $fc ;<unknown instruction>     ;$4889
inc c                             ;$488a
db $fc ;<unknown instruction>     ;$488b
inc c                             ;$488c
db $fc ;<unknown instruction>     ;$488d
inc c                             ;$488e
db $fc ;<unknown instruction>     ;$488f
inc c                             ;$4890
db $fc ;<unknown instruction>     ;$4891
inc c                             ;$4892
db $fc ;<unknown instruction>     ;$4893
inc c                             ;$4894
inc c                             ;$4895
db $fc ;<unknown instruction>     ;$4896
inc e                             ;$4897
inc e                             ;$4898
inc e                             ;$4899
inc e                             ;$489a
inc c                             ;$489b
inc c                             ;$489c
inc c                             ;$489d
inc c                             ;$489e
inc b                             ;$489f
inc b                             ;$48a0
nop                               ;$48a1
nop                               ;$48a2
nop                               ;$48a3
nop                               ;$48a4
nop                               ;$48a5
nop                               ;$48a6
ld [bc], a                        ;$48a7
inc bc                            ;$48a8
ld [bc], a                        ;$48a9
inc bc                            ;$48aa
ld [bc], a                        ;$48ab
inc bc                            ;$48ac
ld [bc], a                        ;$48ad
inc bc                            ;$48ae
ld [bc], a                        ;$48af
inc bc                            ;$48b0
ld [bc], a                        ;$48b1
inc bc                            ;$48b2
ld [bc], a                        ;$48b3
inc bc                            ;$48b4
inc bc                            ;$48b5
inc bc                            ;$48b6
inc c                             ;$48b7
db $fc ;<unknown instruction>     ;$48b8
inc c                             ;$48b9
db $fc ;<unknown instruction>     ;$48ba
inc c                             ;$48bb
db $fc ;<unknown instruction>     ;$48bc
inc c                             ;$48bd
db $fc ;<unknown instruction>     ;$48be
inc c                             ;$48bf
db $fc ;<unknown instruction>     ;$48c0
inc c                             ;$48c1
db $fc ;<unknown instruction>     ;$48c2
inc c                             ;$48c3
db $fc ;<unknown instruction>     ;$48c4
db $fc ;<unknown instruction>     ;$48c5
db $fc ;<unknown instruction>     ;$48c6
inc bc                            ;$48c7
inc bc                            ;$48c8
inc bc                            ;$48c9
inc bc                            ;$48ca
inc bc                            ;$48cb
inc bc                            ;$48cc
inc bc                            ;$48cd
inc bc                            ;$48ce
inc bc                            ;$48cf
inc bc                            ;$48d0
inc bc                            ;$48d1
inc bc                            ;$48d2
inc bc                            ;$48d3
inc bc                            ;$48d4
inc bc                            ;$48d5
inc bc                            ;$48d6
db $fc ;<unknown instruction>     ;$48d7
db $fc ;<unknown instruction>     ;$48d8
db $fc ;<unknown instruction>     ;$48d9
db $fc ;<unknown instruction>     ;$48da
db $fc ;<unknown instruction>     ;$48db
db $fc ;<unknown instruction>     ;$48dc
db $fc ;<unknown instruction>     ;$48dd
db $fc ;<unknown instruction>     ;$48de
db $fc ;<unknown instruction>     ;$48df
db $fc ;<unknown instruction>     ;$48e0
db $fc ;<unknown instruction>     ;$48e1
db $fc ;<unknown instruction>     ;$48e2
db $fc ;<unknown instruction>     ;$48e3
db $fc ;<unknown instruction>     ;$48e4
db $fc ;<unknown instruction>     ;$48e5
db $fc ;<unknown instruction>     ;$48e6
rst $38                           ;$48e7
nop                               ;$48e8
rst $38                           ;$48e9
nop                               ;$48ea
rst $38                           ;$48eb
nop                               ;$48ec
rst $38                           ;$48ed
nop                               ;$48ee
rst $38                           ;$48ef
nop                               ;$48f0
rst $38                           ;$48f1
nop                               ;$48f2
rst $38                           ;$48f3
nop                               ;$48f4
rst $38                           ;$48f5
nop                               ;$48f6
nop                               ;$48f7
rst $38                           ;$48f8
nop                               ;$48f9
rst $38                           ;$48fa
nop                               ;$48fb
rst $38                           ;$48fc
nop                               ;$48fd
rst $38                           ;$48fe
nop                               ;$48ff
rst $38                           ;$4900
nop                               ;$4901
rst $38                           ;$4902
nop                               ;$4903
rst $38                           ;$4904
nop                               ;$4905
rst $38                           ;$4906
rst $38                           ;$4907
rst $38                           ;$4908
rst $38                           ;$4909
rst $38                           ;$490a
rst $38                           ;$490b
rst $38                           ;$490c
rst $38                           ;$490d
rst $38                           ;$490e
rst $38                           ;$490f
rst $38                           ;$4910
rst $38                           ;$4911
rst $38                           ;$4912
rst $38                           ;$4913
rst $38                           ;$4914
rst $38                           ;$4915
rst $38                           ;$4916
nop                               ;$4917
nop                               ;$4918
ld bc, $0301                      ;$4919
inc bc                            ;$491c
rlca                              ;$491d
rlca                              ;$491e
rrca                              ;$491f
rrca                              ;$4920
rra                               ;$4921
rra                               ;$4922
ccf                               ;$4923
ccf                               ;$4924
ld a, a                           ;$4925
ld a, a                           ;$4926
nop                               ;$4927
nop                               ;$4928
rst $38                           ;$4929
rst $38                           ;$492a
add e                             ;$492b
add e                             ;$492c
add e                             ;$492d
add e                             ;$492e
add e                             ;$492f
add e                             ;$4930
add e                             ;$4931
add e                             ;$4932
add e                             ;$4933
add e                             ;$4934
rst $38                           ;$4935
add e                             ;$4936
nop                               ;$4937
nop                               ;$4938
ld a, a                           ;$4939
ld a, a                           ;$493a
jr nz, $495d                      ;$493b
db $10 ;<corrupted stop>          ;$493d
db $10 ;<corrupted stop>          ;$493e
ld [$0408], sp                    ;$493f
inc b                             ;$4942
ld [bc], a                        ;$4943
ld [bc], a                        ;$4944
ld bc, $0001                      ;$4945
nop                               ;$4948
di                                ;$4949
di                                ;$494a
ldd [hl], a                       ;$494b
ldd [hl], a                       ;$494c
ldd [hl], a                       ;$494d
ldd [hl], a                       ;$494e
ldd [hl], a                       ;$494f
ldd [hl], a                       ;$4950
ldd [hl], a                       ;$4951
ldd [hl], a                       ;$4952
ldd [hl], a                       ;$4953
ldd [hl], a                       ;$4954
di                                ;$4955
ldd [hl], a                       ;$4956
rst $38                           ;$4957
add e                             ;$4958
rst $38                           ;$4959
add e                             ;$495a
rst $38                           ;$495b
add e                             ;$495c
rst $38                           ;$495d
add e                             ;$495e
rst $38                           ;$495f
add e                             ;$4960
rst $38                           ;$4961
add e                             ;$4962
rst $38                           ;$4963
add e                             ;$4964
add e                             ;$4965
rst $38                           ;$4966
nop                               ;$4967
nop                               ;$4968
nop                               ;$4969
nop                               ;$496a
ld bc, $0301                      ;$496b
inc bc                            ;$496e
rlca                              ;$496f
rlca                              ;$4970
rrca                              ;$4971
dec bc                            ;$4972
rra                               ;$4973
inc de                            ;$4974
inc hl                            ;$4975
ccf                               ;$4976
di                                ;$4977
or d                              ;$4978
ld [hl], e                        ;$4979
ld [hl], d                        ;$497a
inc sp                            ;$497b
inc sp                            ;$497c
inc de                            ;$497d
inc de                            ;$497e
ld [bc], a                        ;$497f
ld [bc], a                        ;$4980
nop                               ;$4981
nop                               ;$4982
nop                               ;$4983
nop                               ;$4984
nop                               ;$4985
nop                               ;$4986
add e                             ;$4987
rst $38                           ;$4988
add e                             ;$4989
rst $38                           ;$498a
add e                             ;$498b
rst $38                           ;$498c
add e                             ;$498d
rst $38                           ;$498e
add e                             ;$498f
rst $38                           ;$4990
add e                             ;$4991
rst $38                           ;$4992
add e                             ;$4993
rst $38                           ;$4994
rst $38                           ;$4995
rst $38                           ;$4996
ld b, e                           ;$4997
ld a, a                           ;$4998
inc hl                            ;$4999
ccf                               ;$499a
inc de                            ;$499b
rra                               ;$499c
dec bc                            ;$499d
rrca                              ;$499e
rlca                              ;$499f
rlca                              ;$49a0
inc bc                            ;$49a1
inc bc                            ;$49a2
ld bc, $0001                      ;$49a3
nop                               ;$49a6
nop                               ;$49a7
nop                               ;$49a8
nop                               ;$49a9
nop                               ;$49aa
nop                               ;$49ab
nop                               ;$49ac
nop                               ;$49ad
nop                               ;$49ae
nop                               ;$49af
nop                               ;$49b0
db $10 ;<corrupted stop>          ;$49b1
db $10 ;<corrupted stop>          ;$49b2
jr nc, $49e5                      ;$49b3
ld [hl], b                        ;$49b5
ld [hl], b                        ;$49b6
nop                               ;$49b7
nop                               ;$49b8
ld a, b                           ;$49b9
ld a, b                           ;$49ba
sbc h                             ;$49bb
sbc h                             ;$49bc
inc e                             ;$49bd
inc e                             ;$49be
ld a, b                           ;$49bf
ld a, b                           ;$49c0
ldh [$ffe0], a                    ;$49c1
db $fc ;<unknown instruction>     ;$49c3
db $fc ;<unknown instruction>     ;$49c4
nop                               ;$49c5
nop                               ;$49c6
rst $38                           ;$49c7
nop                               ;$49c8
nop                               ;$49c9
nop                               ;$49ca
nop                               ;$49cb
nop                               ;$49cc
nop                               ;$49cd
nop                               ;$49ce
nop                               ;$49cf
nop                               ;$49d0
nop                               ;$49d1
nop                               ;$49d2
nop                               ;$49d3
nop                               ;$49d4
nop                               ;$49d5
nop                               ;$49d6
dec de                            ;$49d7
dec de                            ;$49d8
dec de                            ;$49d9
dec de                            ;$49da
add hl, bc                        ;$49db
add hl, bc                        ;$49dc
nop                               ;$49dd
nop                               ;$49de
nop                               ;$49df
nop                               ;$49e0
nop                               ;$49e1
nop                               ;$49e2
nop                               ;$49e3
nop                               ;$49e4
nop                               ;$49e5
nop                               ;$49e6
nop                               ;$49e7
nop                               ;$49e8
nop                               ;$49e9
nop                               ;$49ea
nop                               ;$49eb
nop                               ;$49ec
nop                               ;$49ed
nop                               ;$49ee
ld h, b                           ;$49ef
ld h, b                           ;$49f0
ld h, b                           ;$49f1
ld h, b                           ;$49f2
jr nz, $4a15                      ;$49f3
nop                               ;$49f5
nop                               ;$49f6
dec de                            ;$49f7
dec de                            ;$49f8
dec de                            ;$49f9
dec de                            ;$49fa
add hl, bc                        ;$49fb
add hl, bc                        ;$49fc
nop                               ;$49fd
nop                               ;$49fe
nop                               ;$49ff
nop                               ;$4a00
ld h, b                           ;$4a01
ld h, b                           ;$4a02
ld h, b                           ;$4a03
ld h, b                           ;$4a04
nop                               ;$4a05
nop                               ;$4a06
cpl                               ;$4a07
cpl                               ;$4a08
cpl                               ;$4a09
cpl                               ;$4a0a
cpl                               ;$4a0b
cpl                               ;$4a0c
cpl                               ;$4a0d
cpl                               ;$4a0e
cpl                               ;$4a0f
cpl                               ;$4a10
cpl                               ;$4a11
cpl                               ;$4a12
cpl                               ;$4a13
cpl                               ;$4a14
cpl                               ;$4a15
cpl                               ;$4a16
cpl                               ;$4a17
cpl                               ;$4a18
cpl                               ;$4a19
cpl                               ;$4a1a
sbc e                             ;$4a1b
dec e                             ;$4a1c
ld d, $2f                         ;$4a1d
ld a, [bc]                        ;$4a1f
rla                               ;$4a20
dec c                             ;$4a21
cpl                               ;$4a22
inc sp                            ;$4a23
ld bc, $0809                      ;$4a24
rlca                              ;$4a27
cpl                               ;$4a28
ld c, $15                         ;$4a29
jr $4a48                          ;$4a2b
db $10 ;<corrupted stop>          ;$4a2d
sbc h                             ;$4a2e
cpl                               ;$4a2f
dec e                             ;$4a30
ld c, $1d                         ;$4a31
dec de                            ;$4a33
ld [de], a                        ;$4a34
inc e                             ;$4a35
cpl                               ;$4a36
dec d                             ;$4a37
ld [de], a                        ;$4a38
inc c                             ;$4a39
ld c, $17                         ;$4a3a
inc e                             ;$4a3c
ld c, $0d                         ;$4a3d
cpl                               ;$4a3f
dec e                             ;$4a40
jr $4a72                          ;$4a41
cpl                               ;$4a43
cpl                               ;$4a44
cpl                               ;$4a45
cpl                               ;$4a46
dec bc                            ;$4a47
ld e, $15                         ;$4a48
dec d                             ;$4a4a
ld c, $1d                         ;$4a4b
dec h                             ;$4a4d
add hl, de                        ;$4a4e
dec de                            ;$4a4f
jr $4a6a                          ;$4a50
rrca                              ;$4a52
cpl                               ;$4a53
cpl                               ;$4a54
cpl                               ;$4a55
cpl                               ;$4a56
cpl                               ;$4a57
cpl                               ;$4a58
cpl                               ;$4a59
cpl                               ;$4a5a
inc e                             ;$4a5b
jr $4a6d                          ;$4a5c
dec e                             ;$4a5e
jr nz, $4a6b                      ;$4a5f
dec de                            ;$4a61
ld c, $2f                         ;$4a62
ld a, [bc]                        ;$4a64
rla                               ;$4a65
dec c                             ;$4a66
cpl                               ;$4a67
cpl                               ;$4a68
cpl                               ;$4a69
cpl                               ;$4a6a
cpl                               ;$4a6b
cpl                               ;$4a6c
cpl                               ;$4a6d
inc e                             ;$4a6e
ld e, $0b                         ;$4a6f
dec h                             ;$4a71
dec d                             ;$4a72
ld [de], a                        ;$4a73
inc c                             ;$4a74
ld c, $17                         ;$4a75
inc e                             ;$4a77
ld c, $0d                         ;$4a78
cpl                               ;$4a7a
dec e                             ;$4a7b
jr $4aad                          ;$4a7c
cpl                               ;$4a7e
cpl                               ;$4a7f
cpl                               ;$4a80
cpl                               ;$4a81
cpl                               ;$4a82
cpl                               ;$4a83
cpl                               ;$4a84
rla                               ;$4a85
ld [de], a                        ;$4a86
rla                               ;$4a87
dec e                             ;$4a88
ld c, $17                         ;$4a89
dec c                             ;$4a8b
jr $4ab2                          ;$4a8c
cpl                               ;$4a8e
cpl                               ;$4a8f
cpl                               ;$4a90
cpl                               ;$4a91
cpl                               ;$4a92
cpl                               ;$4a93
cpl                               ;$4a94
cpl                               ;$4a95
cpl                               ;$4a96
cpl                               ;$4a97
cpl                               ;$4a98
cpl                               ;$4a99
cpl                               ;$4a9a
cpl                               ;$4a9b
cpl                               ;$4a9c
cpl                               ;$4a9d
cpl                               ;$4a9e
cpl                               ;$4a9f
cpl                               ;$4aa0
cpl                               ;$4aa1
cpl                               ;$4aa2
cpl                               ;$4aa3
cpl                               ;$4aa4
cpl                               ;$4aa5
cpl                               ;$4aa6
cpl                               ;$4aa7
inc sp                            ;$4aa8
ld bc, $0809                      ;$4aa9
add hl, bc                        ;$4aac
cpl                               ;$4aad
dec bc                            ;$4aae
ld e, $15                         ;$4aaf
dec d                             ;$4ab1
ld c, $1d                         ;$4ab2
dec h                             ;$4ab4
add hl, de                        ;$4ab5
dec de                            ;$4ab6
jr $4ad1                          ;$4ab7
rrca                              ;$4ab9
cpl                               ;$4aba
cpl                               ;$4abb
cpl                               ;$4abc
cpl                               ;$4abd
cpl                               ;$4abe
cpl                               ;$4abf
cpl                               ;$4ac0
inc e                             ;$4ac1
jr $4ad3                          ;$4ac2
dec e                             ;$4ac4
jr nz, $4ad1                      ;$4ac5
dec de                            ;$4ac7
ld c, $24                         ;$4ac8
cpl                               ;$4aca
cpl                               ;$4acb
cpl                               ;$4acc
cpl                               ;$4acd
cpl                               ;$4ace
cpl                               ;$4acf
cpl                               ;$4ad0
cpl                               ;$4ad1
inc sp                            ;$4ad2
jr nc, $4b06                      ;$4ad3
ldd [hl], a                       ;$4ad5
ld sp, $342f                      ;$4ad6
dec [hl]                          ;$4ad9
ld [hl], $37                      ;$4ada
jr c, $4b17                       ;$4adc
cpl                               ;$4ade
cpl                               ;$4adf
cpl                               ;$4ae0
cpl                               ;$4ae1
cpl                               ;$4ae2
cpl                               ;$4ae3
cpl                               ;$4ae4
cpl                               ;$4ae5
cpl                               ;$4ae6
cpl                               ;$4ae7
cpl                               ;$4ae8
cpl                               ;$4ae9
cpl                               ;$4aea
cpl                               ;$4aeb
cpl                               ;$4aec
cpl                               ;$4aed
cpl                               ;$4aee
cpl                               ;$4aef
cpl                               ;$4af0
cpl                               ;$4af1
cpl                               ;$4af2
cpl                               ;$4af3
cpl                               ;$4af4
cpl                               ;$4af5
cpl                               ;$4af6
ld a, [bc]                        ;$4af7
dec d                             ;$4af8
dec d                             ;$4af9
cpl                               ;$4afa
dec de                            ;$4afb
ld [de], a                        ;$4afc
db $10 ;<corrupted stop>          ;$4afd
ld de, $1c1d                      ;$4afe
cpl                               ;$4b01
dec de                            ;$4b02
ld c, $1c                         ;$4b03
ld c, $1b                         ;$4b05
rra                               ;$4b07
ld c, $0d                         ;$4b08
inc h                             ;$4b0a
cpl                               ;$4b0b
cpl                               ;$4b0c
cpl                               ;$4b0d
cpl                               ;$4b0e
cpl                               ;$4b0f
cpl                               ;$4b10
cpl                               ;$4b11
cpl                               ;$4b12
cpl                               ;$4b13
cpl                               ;$4b14
cpl                               ;$4b15
cpl                               ;$4b16
cpl                               ;$4b17
cpl                               ;$4b18
cpl                               ;$4b19
cpl                               ;$4b1a
cpl                               ;$4b1b
cpl                               ;$4b1c
cpl                               ;$4b1d
cpl                               ;$4b1e
cpl                               ;$4b1f
cpl                               ;$4b20
jr $4b3e                          ;$4b21
ld [de], a                        ;$4b23
db $10 ;<corrupted stop>          ;$4b24
ld [de], a                        ;$4b25
rla                               ;$4b26
ld a, [bc]                        ;$4b27
dec d                             ;$4b28
cpl                               ;$4b29
inc c                             ;$4b2a
jr $4b44                          ;$4b2b
inc c                             ;$4b2d
ld c, $19                         ;$4b2e
dec e                             ;$4b30
sbc h                             ;$4b31
cpl                               ;$4b32
cpl                               ;$4b33
dec c                             ;$4b34
ld c, $1c                         ;$4b35
ld [de], a                        ;$4b37
db $10 ;<corrupted stop>          ;$4b38
rla                               ;$4b39
cpl                               ;$4b3a
ld a, [bc]                        ;$4b3b
rla                               ;$4b3c
dec c                             ;$4b3d
cpl                               ;$4b3e
add hl, de                        ;$4b3f
dec de                            ;$4b40
jr $4b53                          ;$4b41
dec de                            ;$4b43
ld a, [bc]                        ;$4b44
ld d, $2f                         ;$4b45
dec bc                            ;$4b47
ldi [hl], a                       ;$4b48
cpl                               ;$4b49
ld a, [bc]                        ;$4b4a
dec d                             ;$4b4b
ld c, $21                         ;$4b4c
ld c, $22                         ;$4b4e
cpl                               ;$4b50
add hl, de                        ;$4b51
ld a, [bc]                        ;$4b52
inc hl                            ;$4b53
ld de, $1d12                      ;$4b54
rla                               ;$4b57
jr $4b79                          ;$4b58
sbc l                             ;$4b5a
cpl                               ;$4b5b
cpl                               ;$4b5c
cpl                               ;$4b5d
cpl                               ;$4b5e
cpl                               ;$4b5f
cpl                               ;$4b60
cpl                               ;$4b61
cpl                               ;$4b62
cpl                               ;$4b63
cpl                               ;$4b64
cpl                               ;$4b65
cpl                               ;$4b66
cpl                               ;$4b67
cpl                               ;$4b68
cpl                               ;$4b69
cpl                               ;$4b6a
cpl                               ;$4b6b
cpl                               ;$4b6c
cpl                               ;$4b6d
cpl                               ;$4b6e
adc [hl]                          ;$4b6f
adc [hl]                          ;$4b70
adc [hl]                          ;$4b71
adc [hl]                          ;$4b72
adc [hl]                          ;$4b73
adc [hl]                          ;$4b74
adc [hl]                          ;$4b75
adc [hl]                          ;$4b76
adc [hl]                          ;$4b77
adc [hl]                          ;$4b78
adc [hl]                          ;$4b79
adc [hl]                          ;$4b7a
adc [hl]                          ;$4b7b
adc [hl]                          ;$4b7c
adc [hl]                          ;$4b7d
adc [hl]                          ;$4b7e
adc [hl]                          ;$4b7f
adc [hl]                          ;$4b80
adc [hl]                          ;$4b81
adc [hl]                          ;$4b82
ld e, d                           ;$4b83
ld e, e                           ;$4b84
ld e, e                           ;$4b85
ld e, e                           ;$4b86
ld e, e                           ;$4b87
ld e, e                           ;$4b88
ld e, e                           ;$4b89
ld e, e                           ;$4b8a
ld e, e                           ;$4b8b
ld e, e                           ;$4b8c
ld e, e                           ;$4b8d
ld e, e                           ;$4b8e
ld e, e                           ;$4b8f
ld e, e                           ;$4b90
ld e, e                           ;$4b91
ld e, e                           ;$4b92
ld e, e                           ;$4b93
ld e, e                           ;$4b94
ld e, e                           ;$4b95
ld e, h                           ;$4b96
ld e, l                           ;$4b97
add b                             ;$4b98
add c                             ;$4b99
add d                             ;$4b9a
add e                             ;$4b9b
sub b                             ;$4b9c
sub c                             ;$4b9d
sub d                             ;$4b9e
add c                             ;$4b9f
add d                             ;$4ba0
add e                             ;$4ba1
sub b                             ;$4ba2
ld l, h                           ;$4ba3
ld l, l                           ;$4ba4
ld l, [hl]                        ;$4ba5
ld l, a                           ;$4ba6
ld [hl], b                        ;$4ba7
ld [hl], c                        ;$4ba8
ld [hl], d                        ;$4ba9
ld e, [hl]                        ;$4baa
ld e, l                           ;$4bab
add h                             ;$4bac
add l                             ;$4bad
add [hl]                          ;$4bae
add a                             ;$4baf
sub e                             ;$4bb0
sub h                             ;$4bb1
sub l                             ;$4bb2
add l                             ;$4bb3
add [hl]                          ;$4bb4
add a                             ;$4bb5
sub e                             ;$4bb6
ld [hl], e                        ;$4bb7
ld [hl], h                        ;$4bb8
ld [hl], l                        ;$4bb9
halt                              ;$4bba
ld [hl], a                        ;$4bbb
ld a, b                           ;$4bbc
cpl                               ;$4bbd
ld e, [hl]                        ;$4bbe
ld e, l                           ;$4bbf
cpl                               ;$4bc0
adc b                             ;$4bc1
adc c                             ;$4bc2
cpl                               ;$4bc3
sub [hl]                          ;$4bc4
sub a                             ;$4bc5
sbc b                             ;$4bc6
adc b                             ;$4bc7
adc c                             ;$4bc8
cpl                               ;$4bc9
sub [hl]                          ;$4bca
ld a, c                           ;$4bcb
ld a, d                           ;$4bcc
ld a, e                           ;$4bcd
ld a, h                           ;$4bce
ld a, l                           ;$4bcf
ld a, [hl]                        ;$4bd0
cpl                               ;$4bd1
ld e, [hl]                        ;$4bd2
ld e, l                           ;$4bd3
cpl                               ;$4bd4
adc d                             ;$4bd5
adc e                             ;$4bd6
cpl                               ;$4bd7
adc [hl]                          ;$4bd8
adc a                             ;$4bd9
ld l, e                           ;$4bda
adc d                             ;$4bdb
adc e                             ;$4bdc
cpl                               ;$4bdd
adc [hl]                          ;$4bde
ld a, a                           ;$4bdf
ld h, [hl]                        ;$4be0
ld h, a                           ;$4be1
ld l, b                           ;$4be2
ld l, c                           ;$4be3
ld l, d                           ;$4be4
cpl                               ;$4be5
ld e, [hl]                        ;$4be6
ld e, a                           ;$4be7
ld h, b                           ;$4be8
ld h, b                           ;$4be9
ld h, b                           ;$4bea
ld h, b                           ;$4beb
ld h, b                           ;$4bec
ld h, b                           ;$4bed
ld h, b                           ;$4bee
ld h, b                           ;$4bef
ld h, b                           ;$4bf0
ld h, b                           ;$4bf1
ld h, b                           ;$4bf2
ld h, b                           ;$4bf3
ld h, b                           ;$4bf4
ld h, b                           ;$4bf5
ld h, b                           ;$4bf6
ld h, b                           ;$4bf7
ld h, b                           ;$4bf8
ld h, b                           ;$4bf9
ld h, c                           ;$4bfa
adc [hl]                          ;$4bfb
inc a                             ;$4bfc
inc a                             ;$4bfd
inc a                             ;$4bfe
inc a                             ;$4bff
inc a                             ;$4c00
inc a                             ;$4c01
inc a                             ;$4c02
inc a                             ;$4c03
inc a                             ;$4c04
inc a                             ;$4c05
inc a                             ;$4c06
inc a                             ;$4c07
inc a                             ;$4c08
dec a                             ;$4c09
ld a, $3c                         ;$4c0a
inc a                             ;$4c0c
inc a                             ;$4c0d
adc [hl]                          ;$4c0e
adc [hl]                          ;$4c0f
adc h                             ;$4c10
adc h                             ;$4c11
ld h, d                           ;$4c12
ld h, e                           ;$4c13
adc h                             ;$4c14
adc h                             ;$4c15
ldd a, [hl]                       ;$4c16
adc h                             ;$4c17
adc h                             ;$4c18
adc h                             ;$4c19
adc h                             ;$4c1a
adc h                             ;$4c1b
ldd a, [hl]                       ;$4c1c
ld b, d                           ;$4c1d
ld b, e                           ;$4c1e
dec sp                            ;$4c1f
adc h                             ;$4c20
adc h                             ;$4c21
adc [hl]                          ;$4c22
adc [hl]                          ;$4c23
ldd a, [hl]                       ;$4c24
adc h                             ;$4c25
ld h, h                           ;$4c26
ld h, l                           ;$4c27
adc h                             ;$4c28
adc h                             ;$4c29
adc h                             ;$4c2a
adc h                             ;$4c2b
dec sp                            ;$4c2c
adc h                             ;$4c2d
adc h                             ;$4c2e
adc h                             ;$4c2f
adc h                             ;$4c30
ld b, h                           ;$4c31
ld b, l                           ;$4c32
adc h                             ;$4c33
adc h                             ;$4c34
adc h                             ;$4c35
adc [hl]                          ;$4c36
adc [hl]                          ;$4c37
adc h                             ;$4c38
adc h                             ;$4c39
adc h                             ;$4c3a
adc h                             ;$4c3b
adc h                             ;$4c3c
adc h                             ;$4c3d
adc h                             ;$4c3e
adc h                             ;$4c3f
adc h                             ;$4c40
adc h                             ;$4c41
adc h                             ;$4c42
adc h                             ;$4c43
ld b, [hl]                        ;$4c44
ld b, a                           ;$4c45
ld c, b                           ;$4c46
ld c, c                           ;$4c47
ccf                               ;$4c48
ld b, b                           ;$4c49
adc [hl]                          ;$4c4a
adc [hl]                          ;$4c4b
adc h                             ;$4c4c
adc h                             ;$4c4d
adc h                             ;$4c4e
adc h                             ;$4c4f
ldd a, [hl]                       ;$4c50
adc h                             ;$4c51
adc h                             ;$4c52
adc h                             ;$4c53
adc h                             ;$4c54
ld d, e                           ;$4c55
ld d, h                           ;$4c56
adc h                             ;$4c57
ld c, d                           ;$4c58
ld c, e                           ;$4c59
ld c, h                           ;$4c5a
ld c, l                           ;$4c5b
ld b, d                           ;$4c5c
ld b, e                           ;$4c5d
adc [hl]                          ;$4c5e
adc [hl]                          ;$4c5f
adc h                             ;$4c60
adc h                             ;$4c61
adc h                             ;$4c62
adc h                             ;$4c63
adc h                             ;$4c64
adc h                             ;$4c65
adc h                             ;$4c66
adc h                             ;$4c67
ld d, h                           ;$4c68
ld d, l                           ;$4c69
ld d, [hl]                        ;$4c6a
ld d, a                           ;$4c6b
ld c, [hl]                        ;$4c6c
ld c, a                           ;$4c6d
ld d, b                           ;$4c6e
ld d, c                           ;$4c6f
ld d, d                           ;$4c70
ld b, l                           ;$4c71
adc [hl]                          ;$4c72
ld b, c                           ;$4c73
ld b, c                           ;$4c74
ld b, c                           ;$4c75
ld b, c                           ;$4c76
ld b, c                           ;$4c77
ld b, c                           ;$4c78
ld b, c                           ;$4c79
ld b, c                           ;$4c7a
ld b, c                           ;$4c7b
ld b, c                           ;$4c7c
ld b, c                           ;$4c7d
ld b, c                           ;$4c7e
ld b, c                           ;$4c7f
ld b, c                           ;$4c80
ld b, c                           ;$4c81
ld b, c                           ;$4c82
ld b, c                           ;$4c83
ld b, c                           ;$4c84
ld b, c                           ;$4c85
ld b, c                           ;$4c86
cpl                               ;$4c87
cpl                               ;$4c88
ld e, c                           ;$4c89
add hl, de                        ;$4c8a
dec d                             ;$4c8b
ld a, [bc]                        ;$4c8c
ldi [hl], a                       ;$4c8d
ld c, $1b                         ;$4c8e
cpl                               ;$4c90
cpl                               ;$4c91
cpl                               ;$4c92
sbc c                             ;$4c93
add hl, de                        ;$4c94
dec d                             ;$4c95
ld a, [bc]                        ;$4c96
ldi [hl], a                       ;$4c97
ld c, $1b                         ;$4c98
cpl                               ;$4c9a
cpl                               ;$4c9b
cpl                               ;$4c9c
sbc d                             ;$4c9d
sbc d                             ;$4c9e
sbc d                             ;$4c9f
sbc d                             ;$4ca0
sbc d                             ;$4ca1
sbc d                             ;$4ca2
sbc d                             ;$4ca3
cpl                               ;$4ca4
cpl                               ;$4ca5
cpl                               ;$4ca6
sbc d                             ;$4ca7
sbc d                             ;$4ca8
sbc d                             ;$4ca9
sbc d                             ;$4caa
sbc d                             ;$4cab
sbc d                             ;$4cac
sbc d                             ;$4cad
cpl                               ;$4cae
cpl                               ;$4caf
cpl                               ;$4cb0
cpl                               ;$4cb1
cpl                               ;$4cb2
inc sp                            ;$4cb3
jr nc, $4ce7                      ;$4cb4
ldd [hl], a                       ;$4cb6
ld sp, $342f                      ;$4cb7
dec [hl]                          ;$4cba
ld [hl], $37                      ;$4cbb
jr c, $4cf8                       ;$4cbd
cpl                               ;$4cbf
cpl                               ;$4cc0
cpl                               ;$4cc1
cpl                               ;$4cc2
cpl                               ;$4cc3
cpl                               ;$4cc4
cpl                               ;$4cc5
cpl                               ;$4cc6
cpl                               ;$4cc7
cpl                               ;$4cc8
cpl                               ;$4cc9
cpl                               ;$4cca
cpl                               ;$4ccb
cpl                               ;$4ccc
cpl                               ;$4ccd
cpl                               ;$4cce
cpl                               ;$4ccf
cpl                               ;$4cd0
cpl                               ;$4cd1
cpl                               ;$4cd2
cpl                               ;$4cd3
cpl                               ;$4cd4
cpl                               ;$4cd5
cpl                               ;$4cd6
ld b, a                           ;$4cd7
ld c, b                           ;$4cd8
ld c, b                           ;$4cd9
ld c, b                           ;$4cda
ld c, b                           ;$4cdb
ld c, b                           ;$4cdc
ld c, b                           ;$4cdd
ld c, b                           ;$4cde
ld c, b                           ;$4cdf
ld c, b                           ;$4ce0
ld c, b                           ;$4ce1
ld c, b                           ;$4ce2
ld c, b                           ;$4ce3
ld c, b                           ;$4ce4
ld c, b                           ;$4ce5
ld c, b                           ;$4ce6
ld c, b                           ;$4ce7
ld c, b                           ;$4ce8
ld c, b                           ;$4ce9
ld c, c                           ;$4cea
ld c, d                           ;$4ceb
inc l                             ;$4cec
inc l                             ;$4ced
inc l                             ;$4cee
inc l                             ;$4cef
inc l                             ;$4cf0
inc l                             ;$4cf1
inc l                             ;$4cf2
inc l                             ;$4cf3
inc l                             ;$4cf4
inc l                             ;$4cf5
inc l                             ;$4cf6
inc l                             ;$4cf7
inc l                             ;$4cf8
inc l                             ;$4cf9
inc l                             ;$4cfa
inc l                             ;$4cfb
inc l                             ;$4cfc
inc l                             ;$4cfd
ld c, e                           ;$4cfe
ld c, d                           ;$4cff
inc l                             ;$4d00
inc l                             ;$4d01
inc l                             ;$4d02
ld d, b                           ;$4d03
ld d, c                           ;$4d04
ld d, c                           ;$4d05
ld d, c                           ;$4d06
ld d, c                           ;$4d07
ld d, c                           ;$4d08
ld d, c                           ;$4d09
ld d, c                           ;$4d0a
ld d, c                           ;$4d0b
ld d, c                           ;$4d0c
ld d, d                           ;$4d0d
inc l                             ;$4d0e
inc l                             ;$4d0f
inc l                             ;$4d10
inc l                             ;$4d11
ld c, e                           ;$4d12
ld c, d                           ;$4d13
inc l                             ;$4d14
inc l                             ;$4d15
inc l                             ;$4d16
ld d, e                           ;$4d17
db $10 ;<corrupted stop>          ;$4d18
ld a, [bc]                        ;$4d19
ld d, $0e                         ;$4d1a
cpl                               ;$4d1c
dec e                             ;$4d1d
ldi [hl], a                       ;$4d1e
add hl, de                        ;$4d1f
ld c, $54                         ;$4d20
inc l                             ;$4d22
inc l                             ;$4d23
inc l                             ;$4d24
inc l                             ;$4d25
ld c, e                           ;$4d26
ld c, d                           ;$4d27
inc l                             ;$4d28
ld d, l                           ;$4d29
ld d, [hl]                        ;$4d2a
ld l, l                           ;$4d2b
ld e, b                           ;$4d2c
ld e, b                           ;$4d2d
ld e, b                           ;$4d2e
ld e, b                           ;$4d2f
ld e, b                           ;$4d30
xor c                             ;$4d31
ld e, b                           ;$4d32
ld e, b                           ;$4d33
ld e, b                           ;$4d34
ld l, [hl]                        ;$4d35
ld d, [hl]                        ;$4d36
ld d, [hl]                        ;$4d37
ld e, d                           ;$4d38
inc l                             ;$4d39
ld c, e                           ;$4d3a
ld c, d                           ;$4d3b
inc l                             ;$4d3c
ld e, e                           ;$4d3d
ld a, b                           ;$4d3e
ld [hl], a                        ;$4d3f
ld a, [hl]                        ;$4d40
ld a, a                           ;$4d41
sbc d                             ;$4d42
sbc e                             ;$4d43
cpl                               ;$4d44
xor d                             ;$4d45
ld a, c                           ;$4d46
ld [hl], a                        ;$4d47
ld a, [hl]                        ;$4d48
ld a, a                           ;$4d49
sbc d                             ;$4d4a
sbc e                             ;$4d4b
ld e, h                           ;$4d4c
inc l                             ;$4d4d
ld c, e                           ;$4d4e
ld c, d                           ;$4d4f
inc l                             ;$4d50
dec l                             ;$4d51
ld c, a                           ;$4d52
ld c, a                           ;$4d53
ld c, a                           ;$4d54
ld c, a                           ;$4d55
ld c, a                           ;$4d56
ld c, a                           ;$4d57
ld c, a                           ;$4d58
xor h                             ;$4d59
ld c, a                           ;$4d5a
ld c, a                           ;$4d5b
ld c, a                           ;$4d5c
ld c, a                           ;$4d5d
ld c, a                           ;$4d5e
ld c, a                           ;$4d5f
ld l, $2c                         ;$4d60
ld c, e                           ;$4d62
ld c, d                           ;$4d63
inc l                             ;$4d64
inc l                             ;$4d65
inc l                             ;$4d66
inc l                             ;$4d67
inc l                             ;$4d68
inc l                             ;$4d69
inc l                             ;$4d6a
inc l                             ;$4d6b
inc l                             ;$4d6c
inc l                             ;$4d6d
inc l                             ;$4d6e
inc l                             ;$4d6f
inc l                             ;$4d70
inc l                             ;$4d71
inc l                             ;$4d72
inc l                             ;$4d73
inc l                             ;$4d74
inc l                             ;$4d75
ld c, e                           ;$4d76
ld c, d                           ;$4d77
inc l                             ;$4d78
inc l                             ;$4d79
inc l                             ;$4d7a
inc l                             ;$4d7b
inc l                             ;$4d7c
inc l                             ;$4d7d
inc l                             ;$4d7e
inc l                             ;$4d7f
inc l                             ;$4d80
inc l                             ;$4d81
inc l                             ;$4d82
inc l                             ;$4d83
inc l                             ;$4d84
inc l                             ;$4d85
inc l                             ;$4d86
inc l                             ;$4d87
inc l                             ;$4d88
inc l                             ;$4d89
ld c, e                           ;$4d8a
ld c, d                           ;$4d8b
inc l                             ;$4d8c
inc l                             ;$4d8d
inc l                             ;$4d8e
ld d, b                           ;$4d8f
ld d, c                           ;$4d90
ld d, c                           ;$4d91
ld d, c                           ;$4d92
ld d, c                           ;$4d93
ld d, c                           ;$4d94
ld d, c                           ;$4d95
ld d, c                           ;$4d96
ld d, c                           ;$4d97
ld d, c                           ;$4d98
ld d, c                           ;$4d99
ld d, d                           ;$4d9a
inc l                             ;$4d9b
inc l                             ;$4d9c
inc l                             ;$4d9d
ld c, e                           ;$4d9e
ld c, d                           ;$4d9f
inc l                             ;$4da0
inc l                             ;$4da1
inc l                             ;$4da2
ld d, e                           ;$4da3
ld d, $1e                         ;$4da4
inc e                             ;$4da6
ld [de], a                        ;$4da7
inc c                             ;$4da8
cpl                               ;$4da9
dec e                             ;$4daa
ldi [hl], a                       ;$4dab
add hl, de                        ;$4dac
ld c, $54                         ;$4dad
inc l                             ;$4daf
inc l                             ;$4db0
inc l                             ;$4db1
ld c, e                           ;$4db2
ld c, d                           ;$4db3
inc l                             ;$4db4
ld d, l                           ;$4db5
ld d, [hl]                        ;$4db6
ld l, l                           ;$4db7
ld e, b                           ;$4db8
ld e, b                           ;$4db9
ld e, b                           ;$4dba
ld e, b                           ;$4dbb
ld e, b                           ;$4dbc
xor c                             ;$4dbd
ld e, b                           ;$4dbe
ld e, b                           ;$4dbf
ld e, b                           ;$4dc0
ld e, b                           ;$4dc1
ld l, [hl]                        ;$4dc2
ld d, [hl]                        ;$4dc3
ld e, d                           ;$4dc4
inc l                             ;$4dc5
ld c, e                           ;$4dc6
ld c, d                           ;$4dc7
inc l                             ;$4dc8
ld e, e                           ;$4dc9
ld a, b                           ;$4dca
ld [hl], a                        ;$4dcb
ld a, [hl]                        ;$4dcc
ld a, a                           ;$4dcd
sbc d                             ;$4dce
sbc e                             ;$4dcf
cpl                               ;$4dd0
xor d                             ;$4dd1
ld a, c                           ;$4dd2
ld [hl], a                        ;$4dd3
ld a, [hl]                        ;$4dd4
ld a, a                           ;$4dd5
sbc d                             ;$4dd6
sbc e                             ;$4dd7
ld e, h                           ;$4dd8
inc l                             ;$4dd9
ld c, e                           ;$4dda
ld c, d                           ;$4ddb
inc l                             ;$4ddc
ld [hl], c                        ;$4ddd
ld [hl], d                        ;$4dde
ld [hl], d                        ;$4ddf
ld [hl], d                        ;$4de0
ld [hl], d                        ;$4de1
ld [hl], d                        ;$4de2
ld [hl], d                        ;$4de3
ld [hl], d                        ;$4de4
xor e                             ;$4de5
ld [hl], d                        ;$4de6
ld [hl], d                        ;$4de7
ld [hl], d                        ;$4de8
ld [hl], d                        ;$4de9
ld [hl], d                        ;$4dea
ld [hl], d                        ;$4deb
ld [hl], h                        ;$4dec
inc l                             ;$4ded
ld c, e                           ;$4dee
ld c, d                           ;$4def
inc l                             ;$4df0
ld e, e                           ;$4df1
ld a, d                           ;$4df2
ld [hl], a                        ;$4df3
ld a, [hl]                        ;$4df4
ld a, a                           ;$4df5
sbc d                             ;$4df6
sbc e                             ;$4df7
cpl                               ;$4df8
xor d                             ;$4df9
cpl                               ;$4dfa
sbc l                             ;$4dfb
sbc h                             ;$4dfc
sbc h                             ;$4dfd
cpl                               ;$4dfe
cpl                               ;$4dff
ld e, h                           ;$4e00
inc l                             ;$4e01
ld c, e                           ;$4e02
ld c, d                           ;$4e03
inc l                             ;$4e04
dec l                             ;$4e05
ld c, a                           ;$4e06
ld c, a                           ;$4e07
ld c, a                           ;$4e08
ld c, a                           ;$4e09
ld c, a                           ;$4e0a
ld c, a                           ;$4e0b
ld c, a                           ;$4e0c
xor h                             ;$4e0d
ld c, a                           ;$4e0e
ld c, a                           ;$4e0f
ld c, a                           ;$4e10
ld c, a                           ;$4e11
ld c, a                           ;$4e12
ld c, a                           ;$4e13
ld l, $2c                         ;$4e14
ld c, e                           ;$4e16
ld c, d                           ;$4e17
inc l                             ;$4e18
inc l                             ;$4e19
inc l                             ;$4e1a
inc l                             ;$4e1b
inc l                             ;$4e1c
inc l                             ;$4e1d
inc l                             ;$4e1e
inc l                             ;$4e1f
inc l                             ;$4e20
inc l                             ;$4e21
inc l                             ;$4e22
inc l                             ;$4e23
inc l                             ;$4e24
inc l                             ;$4e25
inc l                             ;$4e26
inc l                             ;$4e27
inc l                             ;$4e28
inc l                             ;$4e29
ld c, e                           ;$4e2a
ld c, h                           ;$4e2b
ld c, l                           ;$4e2c
ld c, l                           ;$4e2d
ld c, l                           ;$4e2e
ld c, l                           ;$4e2f
ld c, l                           ;$4e30
ld c, l                           ;$4e31
ld c, l                           ;$4e32
ld c, l                           ;$4e33
ld c, l                           ;$4e34
ld c, l                           ;$4e35
ld c, l                           ;$4e36
ld c, l                           ;$4e37
ld c, l                           ;$4e38
ld c, l                           ;$4e39
ld c, l                           ;$4e3a
ld c, l                           ;$4e3b
ld c, l                           ;$4e3c
ld c, l                           ;$4e3d
ld c, [hl]                        ;$4e3e
ld b, a                           ;$4e3f
ld c, b                           ;$4e40
ld c, b                           ;$4e41
ld c, b                           ;$4e42
ld c, b                           ;$4e43
ld c, b                           ;$4e44
ld c, b                           ;$4e45
ld c, b                           ;$4e46
ld c, b                           ;$4e47
ld c, b                           ;$4e48
ld c, b                           ;$4e49
ld c, b                           ;$4e4a
ld c, b                           ;$4e4b
ld c, b                           ;$4e4c
ld c, b                           ;$4e4d
ld c, b                           ;$4e4e
ld c, b                           ;$4e4f
ld c, b                           ;$4e50
ld c, b                           ;$4e51
ld c, c                           ;$4e52
ld c, d                           ;$4e53
cpl                               ;$4e54
ld a, [bc]                        ;$4e55
dec h                             ;$4e56
dec e                             ;$4e57
ldi [hl], a                       ;$4e58
add hl, de                        ;$4e59
ld c, $2f                         ;$4e5a
inc l                             ;$4e5c
inc l                             ;$4e5d
inc l                             ;$4e5e
inc l                             ;$4e5f
inc l                             ;$4e60
inc l                             ;$4e61
inc l                             ;$4e62
inc l                             ;$4e63
inc l                             ;$4e64
inc l                             ;$4e65
ld c, e                           ;$4e66
ld c, d                           ;$4e67
inc l                             ;$4e68
inc l                             ;$4e69
inc l                             ;$4e6a
inc l                             ;$4e6b
inc l                             ;$4e6c
inc l                             ;$4e6d
inc l                             ;$4e6e
inc l                             ;$4e6f
inc l                             ;$4e70
inc l                             ;$4e71
inc l                             ;$4e72
inc l                             ;$4e73
inc l                             ;$4e74
inc l                             ;$4e75
inc l                             ;$4e76
inc l                             ;$4e77
inc l                             ;$4e78
inc l                             ;$4e79
ld c, e                           ;$4e7a
ld c, d                           ;$4e7b
inc l                             ;$4e7c
inc l                             ;$4e7d
inc l                             ;$4e7e
inc l                             ;$4e7f
inc l                             ;$4e80
ld d, b                           ;$4e81
ld d, c                           ;$4e82
ld d, c                           ;$4e83
ld d, c                           ;$4e84
ld d, c                           ;$4e85
ld d, c                           ;$4e86
ld d, d                           ;$4e87
inc l                             ;$4e88
inc l                             ;$4e89
inc l                             ;$4e8a
inc l                             ;$4e8b
inc l                             ;$4e8c
inc l                             ;$4e8d
ld c, e                           ;$4e8e
ld c, d                           ;$4e8f
inc l                             ;$4e90
inc l                             ;$4e91
inc l                             ;$4e92
inc l                             ;$4e93
inc l                             ;$4e94
ld d, e                           ;$4e95
dec d                             ;$4e96
ld c, $1f                         ;$4e97
ld c, $15                         ;$4e99
ld d, h                           ;$4e9b
inc l                             ;$4e9c
inc l                             ;$4e9d
inc l                             ;$4e9e
inc l                             ;$4e9f
inc l                             ;$4ea0
inc l                             ;$4ea1
ld c, e                           ;$4ea2
ld c, d                           ;$4ea3
inc l                             ;$4ea4
inc l                             ;$4ea5
inc l                             ;$4ea6
ld d, l                           ;$4ea7
ld d, [hl]                        ;$4ea8
ld d, a                           ;$4ea9
ld e, b                           ;$4eaa
ld l, h                           ;$4eab
ld e, b                           ;$4eac
ld l, h                           ;$4ead
ld e, b                           ;$4eae
ld e, c                           ;$4eaf
ld d, [hl]                        ;$4eb0
ld e, d                           ;$4eb1
inc l                             ;$4eb2
inc l                             ;$4eb3
inc l                             ;$4eb4
inc l                             ;$4eb5
ld c, e                           ;$4eb6
ld c, d                           ;$4eb7
inc l                             ;$4eb8
inc l                             ;$4eb9
inc l                             ;$4eba
ld e, e                           ;$4ebb
sub b                             ;$4ebc
ld l, a                           ;$4ebd
sub c                             ;$4ebe
ld l, a                           ;$4ebf
sub d                             ;$4ec0
ld l, a                           ;$4ec1
sub e                             ;$4ec2
ld l, a                           ;$4ec3
sub h                             ;$4ec4
ld e, h                           ;$4ec5
inc l                             ;$4ec6
inc l                             ;$4ec7
inc l                             ;$4ec8
inc l                             ;$4ec9
ld c, e                           ;$4eca
ld c, d                           ;$4ecb
inc l                             ;$4ecc
inc l                             ;$4ecd
inc l                             ;$4ece
ld [hl], c                        ;$4ecf
ld [hl], d                        ;$4ed0
ld [hl], e                        ;$4ed1
ld [hl], d                        ;$4ed2
ld [hl], e                        ;$4ed3
ld [hl], d                        ;$4ed4
ld [hl], e                        ;$4ed5
ld [hl], d                        ;$4ed6
ld [hl], e                        ;$4ed7
ld [hl], d                        ;$4ed8
ld [hl], h                        ;$4ed9
inc l                             ;$4eda
inc l                             ;$4edb
inc l                             ;$4edc
inc l                             ;$4edd
ld c, e                           ;$4ede
ld c, d                           ;$4edf
inc l                             ;$4ee0
inc l                             ;$4ee1
inc l                             ;$4ee2
ld e, e                           ;$4ee3
sub l                             ;$4ee4
ld l, a                           ;$4ee5
sub [hl]                          ;$4ee6
ld l, a                           ;$4ee7
sub a                             ;$4ee8
ld l, a                           ;$4ee9
sbc b                             ;$4eea
ld l, a                           ;$4eeb
sbc c                             ;$4eec
ld e, h                           ;$4eed
inc l                             ;$4eee
inc l                             ;$4eef
inc l                             ;$4ef0
inc l                             ;$4ef1
ld c, e                           ;$4ef2
ld c, d                           ;$4ef3
inc l                             ;$4ef4
inc l                             ;$4ef5
inc l                             ;$4ef6
dec l                             ;$4ef7
ld c, a                           ;$4ef8
ld l, e                           ;$4ef9
ld c, a                           ;$4efa
ld l, e                           ;$4efb
ld c, a                           ;$4efc
ld l, e                           ;$4efd
ld c, a                           ;$4efe
ld l, e                           ;$4eff
ld c, a                           ;$4f00
ld l, $2c                         ;$4f01
inc l                             ;$4f03
inc l                             ;$4f04
inc l                             ;$4f05
ld c, e                           ;$4f06
ld c, d                           ;$4f07
inc l                             ;$4f08
inc l                             ;$4f09
inc l                             ;$4f0a
ld d, b                           ;$4f0b
ld d, c                           ;$4f0c
ld d, c                           ;$4f0d
ld d, c                           ;$4f0e
ld d, c                           ;$4f0f
ld d, c                           ;$4f10
ld d, c                           ;$4f11
ld d, c                           ;$4f12
ld d, c                           ;$4f13
ld d, c                           ;$4f14
ld d, d                           ;$4f15
inc l                             ;$4f16
inc l                             ;$4f17
inc l                             ;$4f18
inc l                             ;$4f19
ld c, e                           ;$4f1a
ld c, d                           ;$4f1b
inc l                             ;$4f1c
inc l                             ;$4f1d
inc l                             ;$4f1e
ld d, e                           ;$4f1f
dec e                             ;$4f20
jr $4f3c                          ;$4f21
dec h                             ;$4f23
inc e                             ;$4f24
inc c                             ;$4f25
jr $4f43                          ;$4f26
ld c, $54                         ;$4f28
inc l                             ;$4f2a
inc l                             ;$4f2b
inc l                             ;$4f2c
inc l                             ;$4f2d
ld c, e                           ;$4f2e
ld c, d                           ;$4f2f
ld d, l                           ;$4f30
ld d, [hl]                        ;$4f31
ld [hl], b                        ;$4f32
ld l, l                           ;$4f33
ld e, b                           ;$4f34
ld e, b                           ;$4f35
ld e, b                           ;$4f36
ld e, b                           ;$4f37
ld e, b                           ;$4f38
ld e, b                           ;$4f39
ld e, b                           ;$4f3a
ld e, b                           ;$4f3b
ld e, b                           ;$4f3c
ld l, [hl]                        ;$4f3d
ld d, [hl]                        ;$4f3e
ld d, [hl]                        ;$4f3f
ld d, [hl]                        ;$4f40
ld e, d                           ;$4f41
ld c, e                           ;$4f42
ld c, d                           ;$4f43
ld e, e                           ;$4f44
ld bc, $606f                      ;$4f45
ld h, b                           ;$4f48
ld h, b                           ;$4f49
ld h, b                           ;$4f4a
ld h, b                           ;$4f4b
ld h, b                           ;$4f4c
cpl                               ;$4f4d
cpl                               ;$4f4e
ld h, b                           ;$4f4f
ld h, b                           ;$4f50
ld h, b                           ;$4f51
ld h, b                           ;$4f52
ld h, b                           ;$4f53
ld h, b                           ;$4f54
ld e, h                           ;$4f55
ld c, e                           ;$4f56
ld c, d                           ;$4f57
ld e, e                           ;$4f58
ld [bc], a                        ;$4f59
ld l, a                           ;$4f5a
ld h, b                           ;$4f5b
ld h, b                           ;$4f5c
ld h, b                           ;$4f5d
ld h, b                           ;$4f5e
ld h, b                           ;$4f5f
ld h, b                           ;$4f60
cpl                               ;$4f61
cpl                               ;$4f62
ld h, b                           ;$4f63
ld h, b                           ;$4f64
ld h, b                           ;$4f65
ld h, b                           ;$4f66
ld h, b                           ;$4f67
ld h, b                           ;$4f68
ld e, h                           ;$4f69
ld c, e                           ;$4f6a
ld c, d                           ;$4f6b
ld e, e                           ;$4f6c
inc bc                            ;$4f6d
ld l, a                           ;$4f6e
ld h, b                           ;$4f6f
ld h, b                           ;$4f70
ld h, b                           ;$4f71
ld h, b                           ;$4f72
ld h, b                           ;$4f73
ld h, b                           ;$4f74
cpl                               ;$4f75
cpl                               ;$4f76
ld h, b                           ;$4f77
ld h, b                           ;$4f78
ld h, b                           ;$4f79
ld h, b                           ;$4f7a
ld h, b                           ;$4f7b
ld h, b                           ;$4f7c
ld e, h                           ;$4f7d
ld c, e                           ;$4f7e
ld c, d                           ;$4f7f
dec l                             ;$4f80
ld c, a                           ;$4f81
ld l, e                           ;$4f82
ld c, a                           ;$4f83
ld c, a                           ;$4f84
ld c, a                           ;$4f85
ld c, a                           ;$4f86
ld c, a                           ;$4f87
ld c, a                           ;$4f88
ld c, a                           ;$4f89
ld c, a                           ;$4f8a
ld c, a                           ;$4f8b
ld c, a                           ;$4f8c
ld c, a                           ;$4f8d
ld c, a                           ;$4f8e
ld c, a                           ;$4f8f
ld c, a                           ;$4f90
ld l, $4b                         ;$4f91
ld c, h                           ;$4f93
ld c, l                           ;$4f94
ld c, l                           ;$4f95
ld c, l                           ;$4f96
ld c, l                           ;$4f97
ld c, l                           ;$4f98
ld c, l                           ;$4f99
ld c, l                           ;$4f9a
ld c, l                           ;$4f9b
ld c, l                           ;$4f9c
ld c, l                           ;$4f9d
ld c, l                           ;$4f9e
ld c, l                           ;$4f9f
ld c, l                           ;$4fa0
ld c, l                           ;$4fa1
ld c, l                           ;$4fa2
ld c, l                           ;$4fa3
ld c, l                           ;$4fa4
ld c, l                           ;$4fa5
ld c, [hl]                        ;$4fa6
ld b, a                           ;$4fa7
ld c, b                           ;$4fa8
ld c, b                           ;$4fa9
ld c, b                           ;$4faa
ld c, b                           ;$4fab
ld c, b                           ;$4fac
ld c, b                           ;$4fad
ld c, b                           ;$4fae
ld c, b                           ;$4faf
ld c, b                           ;$4fb0
ld c, b                           ;$4fb1
ld c, b                           ;$4fb2
ld c, b                           ;$4fb3
ld c, b                           ;$4fb4
ld c, b                           ;$4fb5
ld c, b                           ;$4fb6
ld c, b                           ;$4fb7
ld c, b                           ;$4fb8
ld c, b                           ;$4fb9
ld c, c                           ;$4fba
ld c, d                           ;$4fbb
cpl                               ;$4fbc
dec bc                            ;$4fbd
dec h                             ;$4fbe
dec e                             ;$4fbf
ldi [hl], a                       ;$4fc0
add hl, de                        ;$4fc1
ld c, $2f                         ;$4fc2
inc l                             ;$4fc4
inc l                             ;$4fc5
inc l                             ;$4fc6
inc l                             ;$4fc7
inc l                             ;$4fc8
inc l                             ;$4fc9
inc l                             ;$4fca
inc l                             ;$4fcb
inc l                             ;$4fcc
inc l                             ;$4fcd
ld c, e                           ;$4fce
ld c, d                           ;$4fcf
inc l                             ;$4fd0
inc l                             ;$4fd1
inc l                             ;$4fd2
inc l                             ;$4fd3
inc l                             ;$4fd4
inc l                             ;$4fd5
inc l                             ;$4fd6
inc l                             ;$4fd7
inc l                             ;$4fd8
inc l                             ;$4fd9
inc l                             ;$4fda
inc l                             ;$4fdb
inc l                             ;$4fdc
inc l                             ;$4fdd
inc l                             ;$4fde
inc l                             ;$4fdf
inc l                             ;$4fe0
inc l                             ;$4fe1
ld c, e                           ;$4fe2
ld c, d                           ;$4fe3
inc l                             ;$4fe4
inc l                             ;$4fe5
ld d, b                           ;$4fe6
ld d, c                           ;$4fe7
ld d, c                           ;$4fe8
ld d, c                           ;$4fe9
ld d, c                           ;$4fea
ld d, c                           ;$4feb
ld d, d                           ;$4fec
inc l                             ;$4fed
inc l                             ;$4fee
ld d, b                           ;$4fef
ld d, c                           ;$4ff0
ld d, c                           ;$4ff1
ld d, c                           ;$4ff2
ld d, c                           ;$4ff3
ld d, d                           ;$4ff4
inc l                             ;$4ff5
ld c, e                           ;$4ff6
ld c, d                           ;$4ff7
inc l                             ;$4ff8
inc l                             ;$4ff9
ld d, e                           ;$4ffa
dec d                             ;$4ffb
ld c, $1f                         ;$4ffc
ld c, $15                         ;$4ffe
ld d, h                           ;$5000
inc l                             ;$5001
inc l                             ;$5002
ld d, e                           ;$5003
ld de, $1012                      ;$5004
ld de, $2c54                      ;$5007
ld c, e                           ;$500a
ld c, d                           ;$500b
ld d, l                           ;$500c
ld d, [hl]                        ;$500d
ld d, a                           ;$500e
ld e, b                           ;$500f
ld l, h                           ;$5010
ld e, b                           ;$5011
ld l, h                           ;$5012
ld e, b                           ;$5013
ld e, c                           ;$5014
ld d, [hl]                        ;$5015
ld e, d                           ;$5016
ld [hl], l                        ;$5017
ld e, b                           ;$5018
ld l, h                           ;$5019
ld e, b                           ;$501a
ld l, h                           ;$501b
ld l, [hl]                        ;$501c
ld e, d                           ;$501d
ld c, e                           ;$501e
ld c, d                           ;$501f
ld e, e                           ;$5020
sub b                             ;$5021
ld l, a                           ;$5022
sub c                             ;$5023
ld l, a                           ;$5024
sub d                             ;$5025
ld l, a                           ;$5026
sub e                             ;$5027
ld l, a                           ;$5028
sub h                             ;$5029
ld e, h                           ;$502a
ld e, e                           ;$502b
sub b                             ;$502c
ld l, a                           ;$502d
sub c                             ;$502e
ld l, a                           ;$502f
sub d                             ;$5030
ld e, h                           ;$5031
ld c, e                           ;$5032
ld c, d                           ;$5033
ld [hl], c                        ;$5034
ld [hl], d                        ;$5035
ld [hl], e                        ;$5036
ld [hl], d                        ;$5037
ld [hl], e                        ;$5038
ld [hl], d                        ;$5039
ld [hl], e                        ;$503a
ld [hl], d                        ;$503b
ld [hl], e                        ;$503c
ld [hl], d                        ;$503d
ld [hl], h                        ;$503e
ld [hl], c                        ;$503f
ld [hl], d                        ;$5040
ld [hl], e                        ;$5041
ld [hl], d                        ;$5042
ld [hl], e                        ;$5043
ld [hl], d                        ;$5044
ld [hl], h                        ;$5045
ld c, e                           ;$5046
ld c, d                           ;$5047
ld e, e                           ;$5048
sub l                             ;$5049
ld l, a                           ;$504a
sub [hl]                          ;$504b
ld l, a                           ;$504c
sub a                             ;$504d
ld l, a                           ;$504e
sbc b                             ;$504f
ld l, a                           ;$5050
sbc c                             ;$5051
ld e, h                           ;$5052
ld e, e                           ;$5053
sub e                             ;$5054
ld l, a                           ;$5055
sub h                             ;$5056
ld l, a                           ;$5057
sub l                             ;$5058
ld e, h                           ;$5059
ld c, e                           ;$505a
ld c, d                           ;$505b
dec l                             ;$505c
ld c, a                           ;$505d
ld l, e                           ;$505e
ld c, a                           ;$505f
ld l, e                           ;$5060
ld c, a                           ;$5061
ld l, e                           ;$5062
ld c, a                           ;$5063
ld l, e                           ;$5064
ld c, a                           ;$5065
ld l, $2d                         ;$5066
ld c, a                           ;$5068
ld l, e                           ;$5069
ld c, a                           ;$506a
ld l, e                           ;$506b
ld c, a                           ;$506c
ld l, $4b                         ;$506d
ld c, d                           ;$506f
inc l                             ;$5070
inc l                             ;$5071
inc l                             ;$5072
ld d, b                           ;$5073
ld d, c                           ;$5074
ld d, c                           ;$5075
ld d, c                           ;$5076
ld d, c                           ;$5077
ld d, c                           ;$5078
ld d, c                           ;$5079
ld d, c                           ;$507a
ld d, c                           ;$507b
ld d, c                           ;$507c
ld d, d                           ;$507d
inc l                             ;$507e
inc l                             ;$507f
inc l                             ;$5080
inc l                             ;$5081
ld c, e                           ;$5082
ld c, d                           ;$5083
inc l                             ;$5084
inc l                             ;$5085
inc l                             ;$5086
ld d, e                           ;$5087
dec e                             ;$5088
jr $50a4                          ;$5089
dec h                             ;$508b
inc e                             ;$508c
inc c                             ;$508d
jr $50ab                          ;$508e
ld c, $54                         ;$5090
inc l                             ;$5092
inc l                             ;$5093
inc l                             ;$5094
inc l                             ;$5095
ld c, e                           ;$5096
ld c, d                           ;$5097
ld d, l                           ;$5098
ld d, [hl]                        ;$5099
ld [hl], b                        ;$509a
ld l, l                           ;$509b
ld e, b                           ;$509c
ld e, b                           ;$509d
ld e, b                           ;$509e
ld e, b                           ;$509f
ld e, b                           ;$50a0
ld e, b                           ;$50a1
ld e, b                           ;$50a2
ld e, b                           ;$50a3
ld e, b                           ;$50a4
ld l, [hl]                        ;$50a5
ld d, [hl]                        ;$50a6
ld d, [hl]                        ;$50a7
ld d, [hl]                        ;$50a8
ld e, d                           ;$50a9
ld c, e                           ;$50aa
ld c, d                           ;$50ab
ld e, e                           ;$50ac
ld bc, $606f                      ;$50ad
ld h, b                           ;$50b0
ld h, b                           ;$50b1
ld h, b                           ;$50b2
ld h, b                           ;$50b3
ld h, b                           ;$50b4
cpl                               ;$50b5
cpl                               ;$50b6
ld h, b                           ;$50b7
ld h, b                           ;$50b8
ld h, b                           ;$50b9
ld h, b                           ;$50ba
ld h, b                           ;$50bb
ld h, b                           ;$50bc
ld e, h                           ;$50bd
ld c, e                           ;$50be
ld c, d                           ;$50bf
ld e, e                           ;$50c0
ld [bc], a                        ;$50c1
ld l, a                           ;$50c2
ld h, b                           ;$50c3
ld h, b                           ;$50c4
ld h, b                           ;$50c5
ld h, b                           ;$50c6
ld h, b                           ;$50c7
ld h, b                           ;$50c8
cpl                               ;$50c9
cpl                               ;$50ca
ld h, b                           ;$50cb
ld h, b                           ;$50cc
ld h, b                           ;$50cd
ld h, b                           ;$50ce
ld h, b                           ;$50cf
ld h, b                           ;$50d0
ld e, h                           ;$50d1
ld c, e                           ;$50d2
ld c, d                           ;$50d3
ld e, e                           ;$50d4
inc bc                            ;$50d5
ld l, a                           ;$50d6
ld h, b                           ;$50d7
ld h, b                           ;$50d8
ld h, b                           ;$50d9
ld h, b                           ;$50da
ld h, b                           ;$50db
ld h, b                           ;$50dc
cpl                               ;$50dd
cpl                               ;$50de
ld h, b                           ;$50df
ld h, b                           ;$50e0
ld h, b                           ;$50e1
ld h, b                           ;$50e2
ld h, b                           ;$50e3
ld h, b                           ;$50e4
ld e, h                           ;$50e5
ld c, e                           ;$50e6
ld c, d                           ;$50e7
dec l                             ;$50e8
ld c, a                           ;$50e9
ld l, e                           ;$50ea
ld c, a                           ;$50eb
ld c, a                           ;$50ec
ld c, a                           ;$50ed
ld c, a                           ;$50ee
ld c, a                           ;$50ef
ld c, a                           ;$50f0
ld c, a                           ;$50f1
ld c, a                           ;$50f2
ld c, a                           ;$50f3
ld c, a                           ;$50f4
ld c, a                           ;$50f5
ld c, a                           ;$50f6
ld c, a                           ;$50f7
ld c, a                           ;$50f8
ld l, $4b                         ;$50f9
ld c, h                           ;$50fb
ld c, l                           ;$50fc
ld c, l                           ;$50fd
ld c, l                           ;$50fe
ld c, l                           ;$50ff
ld c, l                           ;$5100
ld c, l                           ;$5101
ld c, l                           ;$5102
ld c, l                           ;$5103
ld c, l                           ;$5104
ld c, l                           ;$5105
ld c, l                           ;$5106
ld c, l                           ;$5107
ld c, l                           ;$5108
ld c, l                           ;$5109
ld c, l                           ;$510a
ld c, l                           ;$510b
ld c, l                           ;$510c
ld c, l                           ;$510d
ld c, [hl]                        ;$510e
call $cdcd                        ;$510f
call $cdcd                        ;$5112
call $cdcd                        ;$5115
call $c98c                        ;$5118
jp z, $8c8c                       ;$511b
adc h                             ;$511e
adc h                             ;$511f
adc h                             ;$5120
adc h                             ;$5121
adc h                             ;$5122
adc h                             ;$5123
set 1, h                          ;$5124
adc h                             ;$5126
adc h                             ;$5127
adc h                             ;$5128
adc h                             ;$5129
adc h                             ;$512a
adc h                             ;$512b
adc a, $d7                        ;$512c
rst $10                           ;$512e
rst $10                           ;$512f
rst $10                           ;$5130
rst $10                           ;$5131
rst $10                           ;$5132
rst $10                           ;$5133
rst $10                           ;$5134
rst $10                           ;$5135
rst $08                           ;$5136
cpl                               ;$5137
cpl                               ;$5138
cpl                               ;$5139
cpl                               ;$513a
cpl                               ;$513b
cpl                               ;$513c
cpl                               ;$513d
cpl                               ;$513e
cpl                               ;$513f
ret nc                            ;$5140
cpl                               ;$5141
cpl                               ;$5142
cpl                               ;$5143
cpl                               ;$5144
cpl                               ;$5145
cpl                               ;$5146
cpl                               ;$5147
cpl                               ;$5148
pop de                            ;$5149
jp nc, $2f2f                      ;$514a
cpl                               ;$514d
cpl                               ;$514e
cpl                               ;$514f
cpl                               ;$5150
cpl                               ;$5151
cpl                               ;$5152
db $d3 ;<unknown instruction>     ;$5153
call nc, $7c7c                    ;$5154
ld a, h                           ;$5157
ld a, h                           ;$5158
ld a, h                           ;$5159
ld a, h                           ;$515a
cpl                               ;$515b
cpl                               ;$515c
push de                           ;$515d
sub a, $7d                        ;$515e
ld a, l                           ;$5160
ld a, l                           ;$5161
ld a, l                           ;$5162
cpl                               ;$5163
cpl                               ;$5164
cpl                               ;$5165
cpl                               ;$5166
ret c                             ;$5167
cpl                               ;$5168
ld a, e                           ;$5169
ld a, e                           ;$516a
ld a, e                           ;$516b
ld a, e                           ;$516c
cpl                               ;$516d
cpl                               ;$516e
cpl                               ;$516f
cpl                               ;$5170
ret c                             ;$5171
cpl                               ;$5172
ld a, h                           ;$5173
ld a, h                           ;$5174
ld a, h                           ;$5175
ld a, h                           ;$5176
cpl                               ;$5177
cpl                               ;$5178
cpl                               ;$5179
cpl                               ;$517a
ret c                             ;$517b
cpl                               ;$517c
cpl                               ;$517d
cpl                               ;$517e
cpl                               ;$517f
cpl                               ;$5180
cpl                               ;$5181
cpl                               ;$5182
cpl                               ;$5183
cpl                               ;$5184
ret c                             ;$5185
cpl                               ;$5186
cpl                               ;$5187
cpl                               ;$5188
cpl                               ;$5189
cpl                               ;$518a
cpl                               ;$518b
cpl                               ;$518c
ld a, h                           ;$518d
ld a, h                           ;$518e
ld a, h                           ;$518f
ld a, h                           ;$5190
cpl                               ;$5191
cpl                               ;$5192
cpl                               ;$5193
cpl                               ;$5194
cpl                               ;$5195
cpl                               ;$5196
cpl                               ;$5197
cpl                               ;$5198
cpl                               ;$5199
ld a, h                           ;$519a
ld a, l                           ;$519b
ld a, l                           ;$519c
cpl                               ;$519d
cpl                               ;$519e
cpl                               ;$519f
cpl                               ;$51a0
cpl                               ;$51a1
cpl                               ;$51a2
cpl                               ;$51a3
ld a, l                           ;$51a4
cpl                               ;$51a5
cpl                               ;$51a6
cpl                               ;$51a7
reti                              ;$51a8
cpl                               ;$51a9
cpl                               ;$51aa
cpl                               ;$51ab
cpl                               ;$51ac
cpl                               ;$51ad
ld a, e                           ;$51ae
or a                              ;$51af
cp b                              ;$51b0
reti                              ;$51b1
or a                              ;$51b2
cpl                               ;$51b3
ld a, h                           ;$51b4
ld a, h                           ;$51b5
ld a, h                           ;$51b6
ld a, h                           ;$51b7
ld a, h                           ;$51b8
ld a, l                           ;$51b9
ld a, l                           ;$51ba
ld a, l                           ;$51bb
ld a, l                           ;$51bc
ld a, l                           ;$51bd
ld a, l                           ;$51be
ld a, l                           ;$51bf
ld a, l                           ;$51c0
ld a, l                           ;$51c1
ld a, l                           ;$51c2
rst $38                           ;$51c3
ld c, d                           ;$51c4
ld c, d                           ;$51c5
ld c, d                           ;$51c6
ld c, d                           ;$51c7
ld c, d                           ;$51c8
ld c, d                           ;$51c9
ld e, c                           ;$51ca
ld l, c                           ;$51cb
ld l, c                           ;$51cc
ld l, c                           ;$51cd
ld l, c                           ;$51ce
ld l, c                           ;$51cf
ld l, c                           ;$51d0
ld c, c                           ;$51d1
ld c, d                           ;$51d2
ld c, d                           ;$51d3
ld c, d                           ;$51d4
ld c, d                           ;$51d5
ld c, d                           ;$51d6
ld c, d                           ;$51d7
ld e, d                           ;$51d8
ld e, d                           ;$51d9
ld e, d                           ;$51da
ld e, d                           ;$51db
ld e, d                           ;$51dc
ld e, d                           ;$51dd
add l                             ;$51de
add l                             ;$51df
add l                             ;$51e0
add l                             ;$51e1
add l                             ;$51e2
add l                             ;$51e3
add l                             ;$51e4
add l                             ;$51e5
ld e, d                           ;$51e6
ld e, d                           ;$51e7
jr c, $5223                       ;$51e8
jr c, $5246                       ;$51ea
ld l, d                           ;$51ec
ld l, d                           ;$51ed
ld l, d                           ;$51ee
ld l, d                           ;$51ef
ld l, d                           ;$51f0
ld l, d                           ;$51f1
ld l, d                           ;$51f2
ld l, d                           ;$51f3
ld l, d                           ;$51f4
ld l, d                           ;$51f5
ld l, d                           ;$51f6
ld l, d                           ;$51f7
ld l, d                           ;$51f8
ld l, d                           ;$51f9
ld l, d                           ;$51fa
ld l, d                           ;$51fb
ld l, d                           ;$51fc
ld l, d                           ;$51fd
ld l, d                           ;$51fe
ld l, d                           ;$51ff
rlca                              ;$5200
rlca                              ;$5201
rlca                              ;$5202
rlca                              ;$5203
rlca                              ;$5204
rlca                              ;$5205
rlca                              ;$5206
rlca                              ;$5207
rlca                              ;$5208
rlca                              ;$5209
rlca                              ;$520a
rlca                              ;$520b
rlca                              ;$520c
rlca                              ;$520d
rlca                              ;$520e
rlca                              ;$520f
rlca                              ;$5210
rlca                              ;$5211
rlca                              ;$5212
rlca                              ;$5213
ld b, a                           ;$5214
ld c, b                           ;$5215
ld c, b                           ;$5216
ld c, b                           ;$5217
ld c, b                           ;$5218
ld c, b                           ;$5219
ld c, b                           ;$521a
ld c, b                           ;$521b
ld c, b                           ;$521c
ld c, b                           ;$521d
ld c, b                           ;$521e
ld c, b                           ;$521f
ld c, b                           ;$5220
ld c, b                           ;$5221
ld c, b                           ;$5222
ld c, b                           ;$5223
ld c, b                           ;$5224
ld c, b                           ;$5225
ld c, b                           ;$5226
ld c, c                           ;$5227
ld c, d                           ;$5228
inc l                             ;$5229
inc l                             ;$522a
inc l                             ;$522b
inc l                             ;$522c
inc l                             ;$522d
inc l                             ;$522e
inc l                             ;$522f
inc l                             ;$5230
inc l                             ;$5231
inc l                             ;$5232
inc l                             ;$5233
inc l                             ;$5234
inc l                             ;$5235
inc l                             ;$5236
inc l                             ;$5237
inc l                             ;$5238
inc l                             ;$5239
inc l                             ;$523a
ld c, e                           ;$523b
ld c, d                           ;$523c
inc l                             ;$523d
inc l                             ;$523e
ld d, $0a                         ;$523f
dec de                            ;$5241
ld [de], a                        ;$5242
jr $5274                          ;$5243
rra                               ;$5245
inc e                             ;$5246
inc h                             ;$5247
dec d                             ;$5248
ld e, $12                         ;$5249
db $10 ;<corrupted stop>          ;$524b
ld [de], a                        ;$524c
inc l                             ;$524d
inc l                             ;$524e
ld c, e                           ;$524f
ld c, d                           ;$5250
inc l                             ;$5251
inc l                             ;$5252
inc l                             ;$5253
inc l                             ;$5254
inc l                             ;$5255
inc l                             ;$5256
inc l                             ;$5257
inc l                             ;$5258
inc l                             ;$5259
ld d, b                           ;$525a
ld d, c                           ;$525b
ld d, c                           ;$525c
ld d, c                           ;$525d
ld d, c                           ;$525e
ld d, d                           ;$525f
inc l                             ;$5260
inc l                             ;$5261
inc l                             ;$5262
ld c, e                           ;$5263
ld c, d                           ;$5264
inc l                             ;$5265
inc l                             ;$5266
inc l                             ;$5267
inc l                             ;$5268
inc l                             ;$5269
inc l                             ;$526a
inc l                             ;$526b
inc l                             ;$526c
inc l                             ;$526d
ld d, e                           ;$526e
ld de, $1012                      ;$526f
ld de, $2c54                      ;$5272
inc l                             ;$5275
inc l                             ;$5276
ld c, e                           ;$5277
ld c, d                           ;$5278
inc l                             ;$5279
inc l                             ;$527a
ld d, l                           ;$527b
ld d, [hl]                        ;$527c
ld d, [hl]                        ;$527d
ld e, d                           ;$527e
inc l                             ;$527f
inc l                             ;$5280
inc l                             ;$5281
ld [hl], l                        ;$5282
ld e, b                           ;$5283
ld l, h                           ;$5284
ld e, b                           ;$5285
ld l, h                           ;$5286
ld l, [hl]                        ;$5287
ld e, d                           ;$5288
inc l                             ;$5289
inc l                             ;$528a
ld c, e                           ;$528b
ld c, d                           ;$528c
inc l                             ;$528d
inc l                             ;$528e
ld e, e                           ;$528f
cpl                               ;$5290
cpl                               ;$5291
ld e, h                           ;$5292
inc l                             ;$5293
inc l                             ;$5294
inc l                             ;$5295
ld e, e                           ;$5296
sub b                             ;$5297
ld l, a                           ;$5298
sub c                             ;$5299
ld l, a                           ;$529a
sub d                             ;$529b
ld e, h                           ;$529c
inc l                             ;$529d
inc l                             ;$529e
ld c, e                           ;$529f
ld c, d                           ;$52a0
inc l                             ;$52a1
inc l                             ;$52a2
ld e, e                           ;$52a3
cpl                               ;$52a4
cpl                               ;$52a5
ld e, h                           ;$52a6
inc l                             ;$52a7
inc l                             ;$52a8
inc l                             ;$52a9
ld [hl], c                        ;$52aa
ld [hl], d                        ;$52ab
ld [hl], e                        ;$52ac
ld [hl], d                        ;$52ad
ld [hl], e                        ;$52ae
ld [hl], d                        ;$52af
ld [hl], h                        ;$52b0
inc l                             ;$52b1
inc l                             ;$52b2
ld c, e                           ;$52b3
ld c, d                           ;$52b4
inc l                             ;$52b5
inc l                             ;$52b6
dec l                             ;$52b7
ld c, a                           ;$52b8
ld c, a                           ;$52b9
ld l, $2c                         ;$52ba
inc l                             ;$52bc
inc l                             ;$52bd
ld e, e                           ;$52be
sub e                             ;$52bf
ld l, a                           ;$52c0
sub h                             ;$52c1
ld l, a                           ;$52c2
sub l                             ;$52c3
ld e, h                           ;$52c4
inc l                             ;$52c5
inc l                             ;$52c6
ld c, e                           ;$52c7
ld c, d                           ;$52c8
inc l                             ;$52c9
inc l                             ;$52ca
ld d, $0a                         ;$52cb
dec de                            ;$52cd
ld [de], a                        ;$52ce
jr $52fd                          ;$52cf
inc l                             ;$52d1
dec l                             ;$52d2
ld c, a                           ;$52d3
ld l, e                           ;$52d4
ld c, a                           ;$52d5
ld l, e                           ;$52d6
ld c, a                           ;$52d7
ld l, $2c                         ;$52d8
inc l                             ;$52da
ld c, e                           ;$52db
ld c, d                           ;$52dc
inc l                             ;$52dd
inc l                             ;$52de
inc l                             ;$52df
inc l                             ;$52e0
inc l                             ;$52e1
inc l                             ;$52e2
inc l                             ;$52e3
inc l                             ;$52e4
inc l                             ;$52e5
ld d, b                           ;$52e6
ld d, c                           ;$52e7
ld d, c                           ;$52e8
ld d, c                           ;$52e9
ld d, c                           ;$52ea
ld d, d                           ;$52eb
inc l                             ;$52ec
inc l                             ;$52ed
inc l                             ;$52ee
ld c, e                           ;$52ef
ld c, d                           ;$52f0
inc l                             ;$52f1
inc l                             ;$52f2
inc l                             ;$52f3
inc l                             ;$52f4
inc l                             ;$52f5
inc l                             ;$52f6
inc l                             ;$52f7
inc l                             ;$52f8
inc l                             ;$52f9
ld d, e                           ;$52fa
ld de, $1012                      ;$52fb
ld de, $2c54                      ;$52fe
inc l                             ;$5301
inc l                             ;$5302
ld c, e                           ;$5303
ld c, d                           ;$5304
inc l                             ;$5305
inc l                             ;$5306
ld d, l                           ;$5307
ld d, [hl]                        ;$5308
ld d, [hl]                        ;$5309
ld e, d                           ;$530a
inc l                             ;$530b
inc l                             ;$530c
inc l                             ;$530d
ld [hl], l                        ;$530e
ld e, b                           ;$530f
ld l, h                           ;$5310
ld e, b                           ;$5311
ld l, h                           ;$5312
ld l, [hl]                        ;$5313
ld e, d                           ;$5314
inc l                             ;$5315
inc l                             ;$5316
ld c, e                           ;$5317
ld c, d                           ;$5318
inc l                             ;$5319
inc l                             ;$531a
ld e, e                           ;$531b
cpl                               ;$531c
cpl                               ;$531d
ld e, h                           ;$531e
inc l                             ;$531f
inc l                             ;$5320
inc l                             ;$5321
ld e, e                           ;$5322
sub b                             ;$5323
ld l, a                           ;$5324
sub c                             ;$5325
ld l, a                           ;$5326
sub d                             ;$5327
ld e, h                           ;$5328
inc l                             ;$5329
inc l                             ;$532a
ld c, e                           ;$532b
ld c, d                           ;$532c
inc l                             ;$532d
inc l                             ;$532e
ld e, e                           ;$532f
cpl                               ;$5330
cpl                               ;$5331
ld e, h                           ;$5332
inc l                             ;$5333
inc l                             ;$5334
inc l                             ;$5335
ld [hl], c                        ;$5336
ld [hl], d                        ;$5337
ld [hl], e                        ;$5338
ld [hl], d                        ;$5339
ld [hl], e                        ;$533a
ld [hl], d                        ;$533b
ld [hl], h                        ;$533c
inc l                             ;$533d
inc l                             ;$533e
ld c, e                           ;$533f
ld c, d                           ;$5340
inc l                             ;$5341
inc l                             ;$5342
dec l                             ;$5343
ld c, a                           ;$5344
ld c, a                           ;$5345
ld l, $2c                         ;$5346
inc l                             ;$5348
inc l                             ;$5349
ld e, e                           ;$534a
sub e                             ;$534b
ld l, a                           ;$534c
sub h                             ;$534d
ld l, a                           ;$534e
sub l                             ;$534f
ld e, h                           ;$5350
inc l                             ;$5351
inc l                             ;$5352
ld c, e                           ;$5353
ld c, d                           ;$5354
inc l                             ;$5355
inc l                             ;$5356
dec d                             ;$5357
ld e, $12                         ;$5358
db $10 ;<corrupted stop>          ;$535a
ld [de], a                        ;$535b
inc l                             ;$535c
inc l                             ;$535d
dec l                             ;$535e
ld c, a                           ;$535f
ld l, e                           ;$5360
ld c, a                           ;$5361
ld l, e                           ;$5362
ld c, a                           ;$5363
ld l, $2c                         ;$5364
inc l                             ;$5366
ld c, e                           ;$5367
ld c, h                           ;$5368
ld c, l                           ;$5369
ld c, l                           ;$536a
ld c, l                           ;$536b
ld c, l                           ;$536c
ld c, l                           ;$536d
ld c, l                           ;$536e
ld c, l                           ;$536f
ld c, l                           ;$5370
ld c, l                           ;$5371
ld c, l                           ;$5372
ld c, l                           ;$5373
ld c, l                           ;$5374
ld c, l                           ;$5375
ld c, l                           ;$5376
ld c, l                           ;$5377
ld c, l                           ;$5378
ld c, l                           ;$5379
ld c, l                           ;$537a
ld c, [hl]                        ;$537b
adc [hl]                          ;$537c
or d                              ;$537d
cpl                               ;$537e
cpl                               ;$537f
cpl                               ;$5380
cpl                               ;$5381
cpl                               ;$5382
cpl                               ;$5383
cpl                               ;$5384
cpl                               ;$5385
cpl                               ;$5386
cpl                               ;$5387
or e                              ;$5388
jr nc, $53bc                      ;$5389
ld sp, $3131                      ;$538b
ld sp, $8e32                      ;$538e
or b                              ;$5391
cpl                               ;$5392
cpl                               ;$5393
cpl                               ;$5394
cpl                               ;$5395
cpl                               ;$5396
cpl                               ;$5397
cpl                               ;$5398
cpl                               ;$5399
cpl                               ;$539a
cpl                               ;$539b
or l                              ;$539c
ld [hl], $2f                      ;$539d
cpl                               ;$539f
cpl                               ;$53a0
cpl                               ;$53a1
cpl                               ;$53a2
scf                               ;$53a3
adc [hl]                          ;$53a4
or b                              ;$53a5
cpl                               ;$53a6
cpl                               ;$53a7
cpl                               ;$53a8
cpl                               ;$53a9
cpl                               ;$53aa
cpl                               ;$53ab
cpl                               ;$53ac
cpl                               ;$53ad
cpl                               ;$53ae
cpl                               ;$53af
or l                              ;$53b0
ld [hl], $2f                      ;$53b1
cpl                               ;$53b3
cpl                               ;$53b4
cpl                               ;$53b5
cpl                               ;$53b6
scf                               ;$53b7
adc [hl]                          ;$53b8
or b                              ;$53b9
cpl                               ;$53ba
cpl                               ;$53bb
cpl                               ;$53bc
cpl                               ;$53bd
cpl                               ;$53be
cpl                               ;$53bf
cpl                               ;$53c0
cpl                               ;$53c1
cpl                               ;$53c2
cpl                               ;$53c3
or l                              ;$53c4
ld b, b                           ;$53c5
ld b, d                           ;$53c6
ld b, d                           ;$53c7
ld b, d                           ;$53c8
ld b, d                           ;$53c9
ld b, d                           ;$53ca
ld b, c                           ;$53cb
adc [hl]                          ;$53cc
or b                              ;$53cd
cpl                               ;$53ce
cpl                               ;$53cf
cpl                               ;$53d0
cpl                               ;$53d1
cpl                               ;$53d2
cpl                               ;$53d3
cpl                               ;$53d4
cpl                               ;$53d5
cpl                               ;$53d6
cpl                               ;$53d7
or l                              ;$53d8
ld [hl], $11                      ;$53d9
ld [de], a                        ;$53db
db $10 ;<corrupted stop>          ;$53dc
ld de, $372f                      ;$53dd
adc [hl]                          ;$53e0
or b                              ;$53e1
cpl                               ;$53e2
cpl                               ;$53e3
cpl                               ;$53e4
cpl                               ;$53e5
cpl                               ;$53e6
cpl                               ;$53e7
cpl                               ;$53e8
cpl                               ;$53e9
cpl                               ;$53ea
cpl                               ;$53eb
or l                              ;$53ec
ld [hl], $2f                      ;$53ed
cpl                               ;$53ef
cpl                               ;$53f0
cpl                               ;$53f1
cpl                               ;$53f2
scf                               ;$53f3
adc [hl]                          ;$53f4
or b                              ;$53f5
cpl                               ;$53f6
cpl                               ;$53f7
cpl                               ;$53f8
cpl                               ;$53f9
cpl                               ;$53fa
cpl                               ;$53fb
cpl                               ;$53fc
cpl                               ;$53fd
cpl                               ;$53fe
cpl                               ;$53ff
or l                              ;$5400
inc sp                            ;$5401
inc [hl]                          ;$5402
inc [hl]                          ;$5403
inc [hl]                          ;$5404
inc [hl]                          ;$5405
inc [hl]                          ;$5406
dec [hl]                          ;$5407
adc [hl]                          ;$5408
or b                              ;$5409
cpl                               ;$540a
cpl                               ;$540b
cpl                               ;$540c
cpl                               ;$540d
cpl                               ;$540e
cpl                               ;$540f
cpl                               ;$5410
cpl                               ;$5411
cpl                               ;$5412
cpl                               ;$5413
or l                              ;$5414
dec hl                            ;$5415
adc [hl]                          ;$5416
adc [hl]                          ;$5417
adc [hl]                          ;$5418
adc [hl]                          ;$5419
adc [hl]                          ;$541a
adc [hl]                          ;$541b
adc [hl]                          ;$541c
or b                              ;$541d
cpl                               ;$541e
cpl                               ;$541f
cpl                               ;$5420
cpl                               ;$5421
cpl                               ;$5422
cpl                               ;$5423
cpl                               ;$5424
cpl                               ;$5425
cpl                               ;$5426
cpl                               ;$5427
or l                              ;$5428
jr nc, $545c                      ;$5429
ld sp, $3131                      ;$542b
ld sp, $8e32                      ;$542e
or b                              ;$5431
cpl                               ;$5432
cpl                               ;$5433
cpl                               ;$5434
cpl                               ;$5435
cpl                               ;$5436
cpl                               ;$5437
cpl                               ;$5438
cpl                               ;$5439
cpl                               ;$543a
cpl                               ;$543b
or l                              ;$543c
ld [hl], $15                      ;$543d
ld [de], a                        ;$543f
rla                               ;$5440
ld c, $1c                         ;$5441
scf                               ;$5443
adc [hl]                          ;$5444
or b                              ;$5445
cpl                               ;$5446
cpl                               ;$5447
cpl                               ;$5448
cpl                               ;$5449
cpl                               ;$544a
cpl                               ;$544b
cpl                               ;$544c
cpl                               ;$544d
cpl                               ;$544e
cpl                               ;$544f
or l                              ;$5450
ld [hl], $2f                      ;$5451
cpl                               ;$5453
cpl                               ;$5454
cpl                               ;$5455
cpl                               ;$5456
scf                               ;$5457
adc [hl]                          ;$5458
or b                              ;$5459
cpl                               ;$545a
cpl                               ;$545b
cpl                               ;$545c
cpl                               ;$545d
cpl                               ;$545e
cpl                               ;$545f
cpl                               ;$5460
cpl                               ;$5461
cpl                               ;$5462
cpl                               ;$5463
or l                              ;$5464
inc sp                            ;$5465
inc [hl]                          ;$5466
inc [hl]                          ;$5467
inc [hl]                          ;$5468
inc [hl]                          ;$5469
inc [hl]                          ;$546a
dec [hl]                          ;$546b
adc [hl]                          ;$546c
or b                              ;$546d
cpl                               ;$546e
cpl                               ;$546f
cpl                               ;$5470
cpl                               ;$5471
cpl                               ;$5472
cpl                               ;$5473
cpl                               ;$5474
cpl                               ;$5475
cpl                               ;$5476
cpl                               ;$5477
or l                              ;$5478
dec hl                            ;$5479
jr c, $54b5                       ;$547a
add hl, sp                        ;$547c
add hl, sp                        ;$547d
add hl, sp                        ;$547e
ldd a, [hl]                       ;$547f
adc [hl]                          ;$5480
or b                              ;$5481
cpl                               ;$5482
cpl                               ;$5483
cpl                               ;$5484
cpl                               ;$5485
cpl                               ;$5486
cpl                               ;$5487
cpl                               ;$5488
cpl                               ;$5489
cpl                               ;$548a
cpl                               ;$548b
or l                              ;$548c
dec hl                            ;$548d
dec sp                            ;$548e
cpl                               ;$548f
cpl                               ;$5490
cpl                               ;$5491
cpl                               ;$5492
inc a                             ;$5493
adc [hl]                          ;$5494
or b                              ;$5495
cpl                               ;$5496
cpl                               ;$5497
cpl                               ;$5498
cpl                               ;$5499
cpl                               ;$549a
cpl                               ;$549b
cpl                               ;$549c
cpl                               ;$549d
cpl                               ;$549e
cpl                               ;$549f
or l                              ;$54a0
dec hl                            ;$54a1
dec sp                            ;$54a2
cpl                               ;$54a3
cpl                               ;$54a4
cpl                               ;$54a5
cpl                               ;$54a6
inc a                             ;$54a7
adc [hl]                          ;$54a8
or b                              ;$54a9
cpl                               ;$54aa
cpl                               ;$54ab
cpl                               ;$54ac
cpl                               ;$54ad
cpl                               ;$54ae
cpl                               ;$54af
cpl                               ;$54b0
cpl                               ;$54b1
cpl                               ;$54b2
cpl                               ;$54b3
or l                              ;$54b4
dec hl                            ;$54b5
dec sp                            ;$54b6
cpl                               ;$54b7
cpl                               ;$54b8
cpl                               ;$54b9
cpl                               ;$54ba
inc a                             ;$54bb
adc [hl]                          ;$54bc
or b                              ;$54bd
cpl                               ;$54be
cpl                               ;$54bf
cpl                               ;$54c0
cpl                               ;$54c1
cpl                               ;$54c2
cpl                               ;$54c3
cpl                               ;$54c4
cpl                               ;$54c5
cpl                               ;$54c6
cpl                               ;$54c7
or l                              ;$54c8
dec hl                            ;$54c9
dec sp                            ;$54ca
cpl                               ;$54cb
cpl                               ;$54cc
cpl                               ;$54cd
cpl                               ;$54ce
inc a                             ;$54cf
adc [hl]                          ;$54d0
or c                              ;$54d1
cpl                               ;$54d2
cpl                               ;$54d3
cpl                               ;$54d4
cpl                               ;$54d5
cpl                               ;$54d6
cpl                               ;$54d7
cpl                               ;$54d8
cpl                               ;$54d9
cpl                               ;$54da
cpl                               ;$54db
or h                              ;$54dc
dec hl                            ;$54dd
dec a                             ;$54de
ld a, $3e                         ;$54df
ld a, $3e                         ;$54e1
ccf                               ;$54e3
rlca                              ;$54e4
rlca                              ;$54e5
rlca                              ;$54e6
rlca                              ;$54e7
rlca                              ;$54e8
rlca                              ;$54e9
add h                             ;$54ea
add a                             ;$54eb
add a                             ;$54ec
adc h                             ;$54ed
add a                             ;$54ee
add a                             ;$54ef
adc h                             ;$54f0
add a                             ;$54f1
add a                             ;$54f2
adc h                             ;$54f3
add a                             ;$54f4
add a                             ;$54f5
add [hl]                          ;$54f6
rlca                              ;$54f7
rlca                              ;$54f8
ld e, $1e                         ;$54f9
ld e, $1e                         ;$54fb
ld e, $79                         ;$54fd
cpl                               ;$54ff
cpl                               ;$5500
adc l                             ;$5501
cpl                               ;$5502
cpl                               ;$5503
adc l                             ;$5504
cpl                               ;$5505
cpl                               ;$5506
adc l                             ;$5507
cpl                               ;$5508
cpl                               ;$5509
adc b                             ;$550a
rlca                              ;$550b
rlca                              ;$550c
or h                              ;$550d
or l                              ;$550e
cp e                              ;$550f
ld l, $bc                         ;$5510
ld a, c                           ;$5512
cpl                               ;$5513
cpl                               ;$5514
adc l                             ;$5515
cpl                               ;$5516
cpl                               ;$5517
adc l                             ;$5518
cpl                               ;$5519
cpl                               ;$551a
adc l                             ;$551b
cpl                               ;$551c
cpl                               ;$551d
adc b                             ;$551e
rlca                              ;$551f
rlca                              ;$5520
cp a                              ;$5521
cp a                              ;$5522
cp a                              ;$5523
cp a                              ;$5524
cp a                              ;$5525
adc c                             ;$5526
adc d                             ;$5527
adc d                             ;$5528
adc [hl]                          ;$5529
adc d                             ;$552a
adc d                             ;$552b
adc [hl]                          ;$552c
adc d                             ;$552d
adc d                             ;$552e
adc [hl]                          ;$552f
adc d                             ;$5530
adc d                             ;$5531
adc e                             ;$5532
rlca                              ;$5533
ld b, $06                         ;$5534
ld b, $06                         ;$5536
ld b, $06                         ;$5538
ld b, $06                         ;$553a
ld b, $06                         ;$553c
ld b, $06                         ;$553e
ld b, $06                         ;$5540
ld b, $06                         ;$5542
ld b, $06                         ;$5544
ld b, $06                         ;$5546
ld d, $16                         ;$5548
ld d, $16                         ;$554a
ld d, $16                         ;$554c
ld d, $16                         ;$554e
ld d, $16                         ;$5550
ld d, $16                         ;$5552
ld d, $16                         ;$5554
ld d, $16                         ;$5556
ld d, $16                         ;$5558
ld d, $16                         ;$555a
rlca                              ;$555c
rlca                              ;$555d
rlca                              ;$555e
rlca                              ;$555f
rlca                              ;$5560
rlca                              ;$5561
add h                             ;$5562
add a                             ;$5563
add a                             ;$5564
adc h                             ;$5565
add a                             ;$5566
add a                             ;$5567
adc h                             ;$5568
add a                             ;$5569
add a                             ;$556a
adc h                             ;$556b
add a                             ;$556c
add a                             ;$556d
add [hl]                          ;$556e
rlca                              ;$556f
rlca                              ;$5570
ld e, $1e                         ;$5571
ld e, $1e                         ;$5573
ld e, $79                         ;$5575
cpl                               ;$5577
cpl                               ;$5578
adc l                             ;$5579
cpl                               ;$557a
cpl                               ;$557b
adc l                             ;$557c
cpl                               ;$557d
cpl                               ;$557e
adc l                             ;$557f
cpl                               ;$5580
cpl                               ;$5581
adc b                             ;$5582
rlca                              ;$5583
rlca                              ;$5584
cp l                              ;$5585
or d                              ;$5586
ld l, $be                         ;$5587
ld l, $79                         ;$5589
cpl                               ;$558b
cpl                               ;$558c
adc l                             ;$558d
cpl                               ;$558e
cpl                               ;$558f
adc l                             ;$5590
cpl                               ;$5591
cpl                               ;$5592
adc l                             ;$5593
cpl                               ;$5594
cpl                               ;$5595
adc b                             ;$5596
rlca                              ;$5597
rlca                              ;$5598
cp a                              ;$5599
cp a                              ;$559a
cp a                              ;$559b
cp a                              ;$559c
cp a                              ;$559d
adc c                             ;$559e
adc d                             ;$559f
adc d                             ;$55a0
adc [hl]                          ;$55a1
adc d                             ;$55a2
adc d                             ;$55a3
adc [hl]                          ;$55a4
adc d                             ;$55a5
adc d                             ;$55a6
adc [hl]                          ;$55a7
adc d                             ;$55a8
adc d                             ;$55a9
adc e                             ;$55aa
rlca                              ;$55ab
ld bc, $0101                      ;$55ac
ld bc, $0101                      ;$55af
ld [bc], a                        ;$55b2
ld [bc], a                        ;$55b3
inc bc                            ;$55b4
inc bc                            ;$55b5
ld bc, $0101                      ;$55b6
ld bc, $0202                      ;$55b9
nop                               ;$55bc
nop                               ;$55bd
nop                               ;$55be
nop                               ;$55bf
nop                               ;$55c0
nop                               ;$55c1
nop                               ;$55c2
nop                               ;$55c3
rlca                              ;$55c4
rlca                              ;$55c5
jr $55e7                          ;$55c6
ld hl, $473e                      ;$55c8
ld a, a                           ;$55cb
ld a, [$ff00+c]                   ;$55cc
cp $12                            ;$55cd
ld e, $12                         ;$55cf
ld e, $12                         ;$55d1
ld e, $7e                         ;$55d3
ld a, [hl]                        ;$55d5
rst $38                           ;$55d6
add e                             ;$55d7
rst $38                           ;$55d8
add c                             ;$55d9
rst $38                           ;$55da
rst $38                           ;$55db
nop                               ;$55dc
nop                               ;$55dd
nop                               ;$55de
nop                               ;$55df
nop                               ;$55e0
nop                               ;$55e1
nop                               ;$55e2
nop                               ;$55e3
rlca                              ;$55e4
rlca                              ;$55e5
jr $5607                          ;$55e6
ld hl, $473e                      ;$55e8
ld a, a                           ;$55eb
inc b                             ;$55ec
db $fc ;<unknown instruction>     ;$55ed
ld [bc], a                        ;$55ee
cp $02                            ;$55ef
cp $07                            ;$55f1
db $fd ;<unknown instruction>     ;$55f3
rlca                              ;$55f4
db $fd ;<unknown instruction>     ;$55f5
rra                               ;$55f6
rst $38                           ;$55f7
rst $38                           ;$55f8
rst $38                           ;$55f9
rst $38                           ;$55fa
ld a, [$0000]                     ;$55fb
nop                               ;$55fe
nop                               ;$55ff
nop                               ;$5600
nop                               ;$5601
nop                               ;$5602
nop                               ;$5603
nop                               ;$5604
nop                               ;$5605
nop                               ;$5606
nop                               ;$5607
rlca                              ;$5608
rlca                              ;$5609
jr $562b                          ;$560a
rst $38                           ;$560c
rst $38                           ;$560d
ld [hl], a                        ;$560e
ld de, $11ff                      ;$560f
rst $38                           ;$5612
rst $38                           ;$5613
db $dd ;<unknown instruction>     ;$5614
ld b, h                           ;$5615
rst $38                           ;$5616
ld b, h                           ;$5617
rst $38                           ;$5618
rst $38                           ;$5619
ld [hl], a                        ;$561a
ld de, $ffff                      ;$561b
rst $38                           ;$561e
rst $38                           ;$561f
rst $38                           ;$5620
rst $38                           ;$5621
rst $38                           ;$5622
rst $38                           ;$5623
rst $38                           ;$5624
rst $38                           ;$5625
rst $38                           ;$5626
rst $38                           ;$5627
rst $38                           ;$5628
rst $38                           ;$5629
rst $38                           ;$562a
rst $38                           ;$562b
nop                               ;$562c
nop                               ;$562d
inc bc                            ;$562e
inc bc                            ;$562f
dec b                             ;$5630
inc b                             ;$5631
inc bc                            ;$5632
inc bc                            ;$5633
nop                               ;$5634
nop                               ;$5635
jr $5650                          ;$5636
inc l                             ;$5638
inc h                             ;$5639
ld a, [de]                        ;$563a
ld a, [de]                        ;$563b
ld [$4008], sp                    ;$563c
ld b, b                           ;$563f
rlca                              ;$5640
rlca                              ;$5641
jr $5663                          ;$5642
and b                             ;$5644
cp a                              ;$5645
dec sp                            ;$5646
ccf                               ;$5647
ld a, h                           ;$5648
ld b, h                           ;$5649
ld a, h                           ;$564a
ld b, h                           ;$564b
db $10 ;<corrupted stop>          ;$564c
db $10 ;<corrupted stop>          ;$564d
ld [bc], a                        ;$564e
ld [bc], a                        ;$564f
ldh [$ffe0], a                    ;$5650
jr $564c                          ;$5652
dec b                             ;$5654
db $fd ;<unknown instruction>     ;$5655
adc h                             ;$5656
db $fc ;<unknown instruction>     ;$5657
ld a, b                           ;$5658
ld c, b                           ;$5659
ld l, h                           ;$565a
ld [hl], h                        ;$565b
nop                               ;$565c
nop                               ;$565d
rlca                              ;$565e
rlca                              ;$565f
jr $5681                          ;$5660
jr nz, $56a3                      ;$5662
jr nc, $56a5                      ;$5664
rra                               ;$5666
dec e                             ;$5667
ld a, $22                         ;$5668
ld a, $22                         ;$566a
add b                             ;$566c
add b                             ;$566d
add b                             ;$566e
add b                             ;$566f
add b                             ;$5670
add b                             ;$5671
add b                             ;$5672
add b                             ;$5673
nop                               ;$5674
nop                               ;$5675
ret nz                            ;$5676
ret nz                            ;$5677
ldh [$ffe0], a                    ;$5678
ldh [$ffe0], a                    ;$567a
nop                               ;$567c
nop                               ;$567d
ld a, h                           ;$567e
ld a, h                           ;$567f
ld h, [hl]                        ;$5680
ld h, [hl]                        ;$5681
ld h, [hl]                        ;$5682
ld h, [hl]                        ;$5683
ld a, h                           ;$5684
ld a, h                           ;$5685
ld h, b                           ;$5686
ld h, b                           ;$5687
ld h, b                           ;$5688
ld h, b                           ;$5689
nop                               ;$568a
nop                               ;$568b
nop                               ;$568c
nop                               ;$568d
inc a                             ;$568e
inc a                             ;$568f
ld h, b                           ;$5690
ld h, b                           ;$5691
inc a                             ;$5692
inc a                             ;$5693
ld c, $0e                         ;$5694
ld c, [hl]                        ;$5696
ld c, [hl]                        ;$5697
inc a                             ;$5698
inc a                             ;$5699
nop                               ;$569a
nop                               ;$569b
rlca                              ;$569c
rlca                              ;$569d
rra                               ;$569e
jr $56df                          ;$569f
jr nz, $5722                      ;$56a1
ld c, a                           ;$56a3
ld a, a                           ;$56a4
ld e, a                           ;$56a5
ld [hl], b                        ;$56a6
ld [hl], b                        ;$56a7
and d                             ;$56a8
and d                             ;$56a9
or b                              ;$56aa
or b                              ;$56ab
inc b                             ;$56ac
inc b                             ;$56ad
rlca                              ;$56ae
inc b                             ;$56af
inc b                             ;$56b0
inc b                             ;$56b1
inc b                             ;$56b2
dec c                             ;$56b3
inc b                             ;$56b4
dec c                             ;$56b5
inc b                             ;$56b6
inc b                             ;$56b7
inc b                             ;$56b8
inc b                             ;$56b9
inc bc                            ;$56ba
ld [bc], a                        ;$56bb
ld e, a                           ;$56bc
ld a, a                           ;$56bd
add hl, sp                        ;$56be
jr nc, $573c                      ;$56bf
ld h, d                           ;$56c1
ei                                ;$56c2
or d                              ;$56c3
rst $38                           ;$56c4
and b                             ;$56c5
rst $38                           ;$56c6
jp nz, $547f                      ;$56c7
ld a, a                           ;$56ca
ld e, h                           ;$56cb
nop                               ;$56cc
nop                               ;$56cd
nop                               ;$56ce
nop                               ;$56cf
nop                               ;$56d0
nop                               ;$56d1
inc bc                            ;$56d2
inc bc                            ;$56d3
inc b                             ;$56d4
inc b                             ;$56d5
ld [$0908], sp                    ;$56d6
add hl, bc                        ;$56d9
inc b                             ;$56da
inc b                             ;$56db
ld e, a                           ;$56dc
ld a, a                           ;$56dd
add hl, sp                        ;$56de
jr nc, $575c                      ;$56df
ld h, d                           ;$56e1
ei                                ;$56e2
or d                              ;$56e3
rst $38                           ;$56e4
and b                             ;$56e5
rst $38                           ;$56e6
jp nz, $547f                      ;$56e7
ld a, a                           ;$56ea
ld e, h                           ;$56eb
jr $56e6                          ;$56ec
inc b                             ;$56ee
db $fc ;<unknown instruction>     ;$56ef
ld [bc], a                        ;$56f0
cp $02                            ;$56f1
cp $07                            ;$56f3
db $fd ;<unknown instruction>     ;$56f5
rlca                              ;$56f6
db $fd ;<unknown instruction>     ;$56f7
rst $38                           ;$56f8
rst $38                           ;$56f9
rst $38                           ;$56fa
ld a, [$3f20]                     ;$56fb
ld b, b                           ;$56fe
ld a, a                           ;$56ff
ld b, b                           ;$5700
ld a, a                           ;$5701
ldh [$ffbf], a                    ;$5702
ldh [$ffbf], a                    ;$5704
ld hl, sp+$ff                     ;$5706
ld a, a                           ;$5708
ld a, a                           ;$5709
ld a, a                           ;$570a
ld e, a                           ;$570b
rst $38                           ;$570c
ld de, $ffff                      ;$570d
db $dd ;<unknown instruction>     ;$5710
ld b, h                           ;$5711
rst $38                           ;$5712
ld b, h                           ;$5713
rst $38                           ;$5714
rst $38                           ;$5715
ld [hl], a                        ;$5716
ld de, $11ff                      ;$5717
rst $38                           ;$571a
rst $38                           ;$571b
nop                               ;$571c
nop                               ;$571d
nop                               ;$571e
nop                               ;$571f
nop                               ;$5720
nop                               ;$5721
nop                               ;$5722
nop                               ;$5723
nop                               ;$5724
nop                               ;$5725
nop                               ;$5726
nop                               ;$5727
add b                             ;$5728
add b                             ;$5729
ret nz                            ;$572a
ld b, b                           ;$572b
nop                               ;$572c
nop                               ;$572d
nop                               ;$572e
nop                               ;$572f
nop                               ;$5730
nop                               ;$5731
inc b                             ;$5732
inc b                             ;$5733
ld [$1c08], sp                    ;$5734
inc d                             ;$5737
inc d                             ;$5738
inc d                             ;$5739
ld [$1808], sp                    ;$573a
rra                               ;$573d
jr nz, $577f                      ;$573e
ld b, b                           ;$5740
ld a, a                           ;$5741
ld b, b                           ;$5742
ld a, a                           ;$5743
ldh [$ffbf], a                    ;$5744
ldh [$ffbf], a                    ;$5746
ld a, a                           ;$5748
ld a, a                           ;$5749
ld a, a                           ;$574a
ld e, a                           ;$574b
db $dd ;<unknown instruction>     ;$574c
ld b, h                           ;$574d
rst $38                           ;$574e
ld b, h                           ;$574f
rst $38                           ;$5750
rst $38                           ;$5751
ld [hl], a                        ;$5752
ld de, $11ff                      ;$5753
rst $38                           ;$5756
rst $38                           ;$5757
db $dd ;<unknown instruction>     ;$5758
ld b, h                           ;$5759
rst $38                           ;$575a
ld b, h                           ;$575b
nop                               ;$575c
nop                               ;$575d
nop                               ;$575e
nop                               ;$575f
nop                               ;$5760
nop                               ;$5761
jr nz, $5784                      ;$5762
db $10 ;<corrupted stop>          ;$5764
db $10 ;<corrupted stop>          ;$5765
jr c, $5790                       ;$5766
jr z, $5792                       ;$5768
sub b                             ;$576a
sub b                             ;$576b
nop                               ;$576c
nop                               ;$576d
ld b, [hl]                        ;$576e
ld b, [hl]                        ;$576f
ld b, [hl]                        ;$5770
ld b, [hl]                        ;$5771
ld a, [hl]                        ;$5772
ld a, [hl]                        ;$5773
ld b, [hl]                        ;$5774
ld b, [hl]                        ;$5775
ld b, [hl]                        ;$5776
ld b, [hl]                        ;$5777
ld b, [hl]                        ;$5778
ld b, [hl]                        ;$5779
nop                               ;$577a
nop                               ;$577b
nop                               ;$577c
nop                               ;$577d
ld a, [hl]                        ;$577e
ld a, [hl]                        ;$577f
jr $579a                          ;$5780
jr $579c                          ;$5782
jr $579e                          ;$5784
jr $57a0                          ;$5786
jr $57a2                          ;$5788
nop                               ;$578a
nop                               ;$578b
rst $38                           ;$578c
rst $38                           ;$578d
rst $38                           ;$578e
rst $38                           ;$578f
rst $38                           ;$5790
rst $38                           ;$5791
rst $38                           ;$5792
rst $38                           ;$5793
rst $38                           ;$5794
rst $38                           ;$5795
rst $38                           ;$5796
rst $38                           ;$5797
nop                               ;$5798
nop                               ;$5799
nop                               ;$579a
xor $b4                           ;$579b
or h                              ;$579d
ld h, h                           ;$579e
ld h, h                           ;$579f
inc a                             ;$57a0
inc a                             ;$57a1
ld l, $2e                         ;$57a2
daa                               ;$57a4
daa                               ;$57a5
ld [hl], b                        ;$57a6
ld [hl], b                        ;$57a7
db $fc ;<unknown instruction>     ;$57a8
sbc h                             ;$57a9
rst $30                           ;$57aa
sbc a                             ;$57ab
nop                               ;$57ac
nop                               ;$57ad
nop                               ;$57ae
nop                               ;$57af
nop                               ;$57b0
nop                               ;$57b1
ld bc, $0101                      ;$57b2
ld bc, $0202                      ;$57b5
ld [bc], a                        ;$57b8
ld [bc], a                        ;$57b9
ld [bc], a                        ;$57ba
ld [bc], a                        ;$57bb
ccf                               ;$57bc
ld l, $7f                         ;$57bd
ld h, e                           ;$57bf
rst $38                           ;$57c0
sbc b                             ;$57c1
rst $30                           ;$57c2
rra                               ;$57c3
rst $30                           ;$57c4
inc e                             ;$57c5
rst $30                           ;$57c6
rst $10                           ;$57c7
inc [hl]                          ;$57c8
ccf                               ;$57c9
xor h                             ;$57ca
cp a                              ;$57cb
inc bc                            ;$57cc
inc bc                            ;$57cd
ld bc, $0101                      ;$57ce
ld bc, $0000                      ;$57d1
nop                               ;$57d4
nop                               ;$57d5
ld b, $06                         ;$57d6
dec b                             ;$57d8
dec b                             ;$57d9
rlca                              ;$57da
rlca                              ;$57db
rst $38                           ;$57dc
xor [hl]                          ;$57dd
rst $38                           ;$57de
inc hl                            ;$57df
rst $38                           ;$57e0
jr $57da                          ;$57e1
sbc a                             ;$57e3
rst $30                           ;$57e4
sbc h                             ;$57e5
ld [hl], a                        ;$57e6
ld d, a                           ;$57e7
inc [hl]                          ;$57e8
ccf                               ;$57e9
ld l, h                           ;$57ea
ld a, a                           ;$57eb
nop                               ;$57ec
nop                               ;$57ed
nop                               ;$57ee
nop                               ;$57ef
nop                               ;$57f0
nop                               ;$57f1
ld bc, $0101                      ;$57f2
ld bc, $0202                      ;$57f5
ld [bc], a                        ;$57f8
ld [bc], a                        ;$57f9
ld [bc], a                        ;$57fa
ld [bc], a                        ;$57fb
ccf                               ;$57fc
cpl                               ;$57fd
ld a, a                           ;$57fe
ld a, h                           ;$57ff
rst $30                           ;$5800
sbc h                             ;$5801
di                                ;$5802
rra                               ;$5803
ldh a, [$ff1f]                    ;$5804
ldh a, [$ffdf]                    ;$5806
jr nc, $5849                      ;$5808
and b                             ;$580a
cp a                              ;$580b
rst $38                           ;$580c
db $f4 ;<unknown instruction>     ;$580d
rst $38                           ;$580e
ld a, $ef                         ;$580f
jr c, $57e2                       ;$5811
ld hl, sp+$0f                     ;$5813
ei                                ;$5815
ld c, $fa                         ;$5816
inc c                             ;$5818
db $fc ;<unknown instruction>     ;$5819
inc b                             ;$581a
db $fc ;<unknown instruction>     ;$581b
ldh [$ff20], a                    ;$581c
ldh [$ff20], a                    ;$581e
ldh [$ff20], a                    ;$5820
ret nz                            ;$5822
ld b, b                           ;$5823
add b                             ;$5824
add b                             ;$5825
nop                               ;$5826
nop                               ;$5827
nop                               ;$5828
nop                               ;$5829
nop                               ;$582a
nop                               ;$582b
nop                               ;$582c
nop                               ;$582d
nop                               ;$582e
nop                               ;$582f
nop                               ;$5830
nop                               ;$5831
nop                               ;$5832
nop                               ;$5833
ld bc, $0101                      ;$5834
ld bc, $0202                      ;$5837
ld [bc], a                        ;$583a
ld [bc], a                        ;$583b
ccf                               ;$583c
cpl                               ;$583d
ccf                               ;$583e
inc a                             ;$583f
ld [hl], a                        ;$5840
ld e, h                           ;$5841
di                                ;$5842
sbc a                             ;$5843
ldh a, [$ff1f]                    ;$5844
ldh a, [$ff1f]                    ;$5846
ldh a, [$ffff]                    ;$5848
jr nz, $588b                      ;$584a
rst $38                           ;$584c
db $f4 ;<unknown instruction>     ;$584d
rst $38                           ;$584e
ld a, $ef                         ;$584f
jr c, $5822                       ;$5851
ld sp, hl                         ;$5853
ld c, $fa                         ;$5854
ld c, $fa                         ;$5856
inc c                             ;$5858
db $fc ;<unknown instruction>     ;$5859
inc b                             ;$585a
db $fc ;<unknown instruction>     ;$585b
ret nz                            ;$585c
ld b, b                           ;$585d
ret nz                            ;$585e
ld b, b                           ;$585f
ret nz                            ;$5860
ld b, b                           ;$5861
add b                             ;$5862
add b                             ;$5863
nop                               ;$5864
nop                               ;$5865
nop                               ;$5866
nop                               ;$5867
nop                               ;$5868
nop                               ;$5869
nop                               ;$586a
nop                               ;$586b
rst $30                           ;$586c
inc e                             ;$586d
rst $30                           ;$586e
inc [hl]                          ;$586f
rst $30                           ;$5870
cp a                              ;$5871
ld l, h                           ;$5872
ld a, a                           ;$5873
db $10 ;<corrupted stop>          ;$5874
rra                               ;$5875
ld d, b                           ;$5876
ld e, a                           ;$5877
ldd [hl], a                       ;$5878
ccf                               ;$5879
pop af                            ;$587a
rst $38                           ;$587b
nop                               ;$587c
nop                               ;$587d
ld b, [hl]                        ;$587e
ld b, [hl]                        ;$587f
ld b, [hl]                        ;$5880
ld b, [hl]                        ;$5881
ld d, [hl]                        ;$5882
ld d, [hl]                        ;$5883
ld a, [hl]                        ;$5884
ld a, [hl]                        ;$5885
ld l, [hl]                        ;$5886
ld l, [hl]                        ;$5887
ld b, [hl]                        ;$5888
ld b, [hl]                        ;$5889
nop                               ;$588a
nop                               ;$588b
nop                               ;$588c
nop                               ;$588d
inc a                             ;$588e
inc a                             ;$588f
jr $58aa                          ;$5890
jr $58ac                          ;$5892
jr $58ae                          ;$5894
jr $58b0                          ;$5896
inc a                             ;$5898
inc a                             ;$5899
nop                               ;$589a
nop                               ;$589b
nop                               ;$589c
nop                               ;$589d
nop                               ;$589e
nop                               ;$589f
nop                               ;$58a0
nop                               ;$58a1
nop                               ;$58a2
nop                               ;$58a3
nop                               ;$58a4
nop                               ;$58a5
nop                               ;$58a6
nop                               ;$58a7
nop                               ;$58a8
nop                               ;$58a9
nop                               ;$58aa
nop                               ;$58ab
ld [bc], a                        ;$58ac
ld [bc], a                        ;$58ad
ld bc, $0001                      ;$58ae
nop                               ;$58b1
nop                               ;$58b2
nop                               ;$58b3
nop                               ;$58b4
nop                               ;$58b5
nop                               ;$58b6
nop                               ;$58b7
nop                               ;$58b8
nop                               ;$58b9
nop                               ;$58ba
nop                               ;$58bb
ld b, b                           ;$58bc
ld a, a                           ;$58bd
ret nz                            ;$58be
rst $38                           ;$58bf
jr nz, $5901                      ;$58c0
ldi [hl], a                       ;$58c2
ccf                               ;$58c3
ld de, $721f                      ;$58c4
ld a, [hl]                        ;$58c7
cp a                              ;$58c8
cp a                              ;$58c9
rst $38                           ;$58ca
rst $38                           ;$58cb
rlca                              ;$58cc
rlca                              ;$58cd
ld b, $07                         ;$58ce
ld b, $07                         ;$58d0
ld b, $07                         ;$58d2
rlca                              ;$58d4
rlca                              ;$58d5
nop                               ;$58d6
nop                               ;$58d7
nop                               ;$58d8
nop                               ;$58d9
nop                               ;$58da
nop                               ;$58db
ret nz                            ;$58dc
rst $38                           ;$58dd
nop                               ;$58de
rst $38                           ;$58df
nop                               ;$58e0
rst $38                           ;$58e1
ld [bc], a                        ;$58e2
rst $38                           ;$58e3
rst $38                           ;$58e4
rst $38                           ;$58e5
nop                               ;$58e6
nop                               ;$58e7
nop                               ;$58e8
nop                               ;$58e9
nop                               ;$58ea
nop                               ;$58eb
ld [bc], a                        ;$58ec
ld [bc], a                        ;$58ed
ld bc, $0001                      ;$58ee
nop                               ;$58f1
nop                               ;$58f2
nop                               ;$58f3
nop                               ;$58f4
nop                               ;$58f5
nop                               ;$58f6
nop                               ;$58f7
nop                               ;$58f8
nop                               ;$58f9
nop                               ;$58fa
nop                               ;$58fb
ld b, b                           ;$58fc
ld a, a                           ;$58fd
ret nz                            ;$58fe
rst $38                           ;$58ff
jr nz, $5941                      ;$5900
jr nz, $5943                      ;$5902
ld de, $721f                      ;$5904
ld a, [hl]                        ;$5907
rst $38                           ;$5908
rst $38                           ;$5909
rst $38                           ;$590a
rst $38                           ;$590b
ld [bc], a                        ;$590c
cp $02                            ;$590d
cp $04                            ;$590f
db $fc ;<unknown instruction>     ;$5911
inc b                             ;$5912
db $fc ;<unknown instruction>     ;$5913
adc b                             ;$5914
ld hl, sp+$4e                     ;$5915
ld a, [hl]                        ;$5917
rst $38                           ;$5918
rst $38                           ;$5919
rst $38                           ;$591a
rst $38                           ;$591b
nop                               ;$591c
nop                               ;$591d
nop                               ;$591e
nop                               ;$591f
add b                             ;$5920
add b                             ;$5921
ld b, b                           ;$5922
ld b, b                           ;$5923
nop                               ;$5924
nop                               ;$5925
nop                               ;$5926
nop                               ;$5927
nop                               ;$5928
nop                               ;$5929
rlca                              ;$592a
rlca                              ;$592b
nop                               ;$592c
nop                               ;$592d
nop                               ;$592e
nop                               ;$592f
rst $38                           ;$5930
nop                               ;$5931
db $fd ;<unknown instruction>     ;$5932
ld [bc], a                        ;$5933
call $0932                        ;$5934
or $08                            ;$5937
rst $30                           ;$5939
nop                               ;$593a
rst $38                           ;$593b
nop                               ;$593c
nop                               ;$593d
nop                               ;$593e
nop                               ;$593f
rst $38                           ;$5940
nop                               ;$5941
rst $38                           ;$5942
nop                               ;$5943
rst $38                           ;$5944
nop                               ;$5945
db $fc ;<unknown instruction>     ;$5946
inc bc                            ;$5947
call z, $0833                     ;$5948
rst $30                           ;$594b
ld a, h                           ;$594c
ld b, h                           ;$594d
ccf                               ;$594e
ccf                               ;$594f
db $10 ;<corrupted stop>          ;$5950
rra                               ;$5951
db $10 ;<corrupted stop>          ;$5952
rra                               ;$5953
ld [de], a                        ;$5954
rra                               ;$5955
add hl, de                        ;$5956
rra                               ;$5957
ccf                               ;$5958
ccf                               ;$5959
ld a, $3e                         ;$595a
adc a, $f2                        ;$595c
adc [hl]                          ;$595e
jp c, $f909                       ;$595f
add hl, bc                        ;$5962
ld sp, hl                         ;$5963
ld c, [hl]                        ;$5964
cp $98                            ;$5965
ld hl, sp+$fc                     ;$5967
db $fc ;<unknown instruction>     ;$5969
ld a, h                           ;$596a
ld a, h                           ;$596b
rlca                              ;$596c
rlca                              ;$596d
rra                               ;$596e
jr $59af                          ;$596f
jr nz, $59f2                      ;$5971
ld c, a                           ;$5973
ld a, a                           ;$5974
ld e, a                           ;$5975
ld [hl], b                        ;$5976
ld [hl], b                        ;$5977
and d                             ;$5978
and d                             ;$5979
or b                              ;$597a
or b                              ;$597b
nop                               ;$597c
nop                               ;$597d
ld b, [hl]                        ;$597e
ld b, [hl]                        ;$597f
ld h, [hl]                        ;$5980
ld h, [hl]                        ;$5981
halt                              ;$5982
halt                              ;$5983
ld e, [hl]                        ;$5984
ld e, [hl]                        ;$5985
ld c, [hl]                        ;$5986
ld c, [hl]                        ;$5987
ld b, [hl]                        ;$5988
ld b, [hl]                        ;$5989
nop                               ;$598a
nop                               ;$598b
nop                               ;$598c
nop                               ;$598d
jr $59a8                          ;$598e
jr $59aa                          ;$5990
jr $59ac                          ;$5992
jr $59ae                          ;$5994
nop                               ;$5996
nop                               ;$5997
jr $59b2                          ;$5998
nop                               ;$599a
nop                               ;$599b
ld [de], a                        ;$599c
ld e, $12                         ;$599d
ld e, $12                         ;$599f
ld e, $12                         ;$59a1
ld e, $7e                         ;$59a3
ld a, [hl]                        ;$59a5
cp a                              ;$59a6
add e                             ;$59a7
rst $38                           ;$59a8
add c                             ;$59a9
rst $38                           ;$59aa
rst $38                           ;$59ab
nop                               ;$59ac
nop                               ;$59ad
ldh [$ffe0], a                    ;$59ae
jr $59aa                          ;$59b0
inc b                             ;$59b2
db $fc ;<unknown instruction>     ;$59b3
inc c                             ;$59b4
db $fc ;<unknown instruction>     ;$59b5
ld hl, sp+$c8                     ;$59b6
inc l                             ;$59b8
inc [hl]                          ;$59b9
ld l, $32                         ;$59ba
nop                               ;$59bc
nop                               ;$59bd
ld b, [hl]                        ;$59be
ld b, [hl]                        ;$59bf
ld b, [hl]                        ;$59c0
ld b, [hl]                        ;$59c1
ld b, [hl]                        ;$59c2
ld b, [hl]                        ;$59c3
ld b, [hl]                        ;$59c4
ld b, [hl]                        ;$59c5
inc l                             ;$59c6
inc l                             ;$59c7
jr $59e2                          ;$59c8
nop                               ;$59ca
nop                               ;$59cb
nop                               ;$59cc
nop                               ;$59cd
ld [hl], $36                      ;$59ce
ld e, a                           ;$59d0
ld c, c                           ;$59d1
ld e, a                           ;$59d2
ld b, c                           ;$59d3
ld a, a                           ;$59d4
ld b, c                           ;$59d5
ld a, $22                         ;$59d6
inc e                             ;$59d8
inc d                             ;$59d9
ld [$fe08], sp                    ;$59da
ld [bc], a                        ;$59dd
db $fd ;<unknown instruction>     ;$59de
dec b                             ;$59df
db $fd ;<unknown instruction>     ;$59e0
dec b                             ;$59e1
rst $38                           ;$59e2
rra                               ;$59e3
rst $38                           ;$59e4
db $fc ;<unknown instruction>     ;$59e5
rst $38                           ;$59e6
cp $ef                            ;$59e7
jr c, $59da                       ;$59e9
add hl, sp                        ;$59eb
nop                               ;$59ec
inc b                             ;$59ed
nop                               ;$59ee
inc b                             ;$59ef
nop                               ;$59f0
inc b                             ;$59f1
ld bc, $0105                      ;$59f2
dec b                             ;$59f5
inc bc                            ;$59f6
rlca                              ;$59f7
ld b, $06                         ;$59f8
inc c                             ;$59fa
inc c                             ;$59fb
jp z, $c8c0                       ;$59fc
ret nz                            ;$59ff
jp z, $88c0                       ;$5a00
add b                             ;$5a03
adc b                             ;$5a04
add a                             ;$5a05
ld [$0a00], sp                    ;$5a06
nop                               ;$5a09
ld [$6f00], sp                    ;$5a0a
inc de                            ;$5a0d
cpl                               ;$5a0e
inc de                            ;$5a0f
ld l, a                           ;$5a10
inc de                            ;$5a11
cpl                               ;$5a12
ld de, $d12d                      ;$5a13
inc l                             ;$5a16
db $10 ;<corrupted stop>          ;$5a17
ld l, h                           ;$5a18
db $10 ;<corrupted stop>          ;$5a19
inc l                             ;$5a1a
db $10 ;<corrupted stop>          ;$5a1b
and b                             ;$5a1c
jr nz, $59bf                      ;$5a1d
jr nz, $59c1                      ;$5a1f
jr nz, $59c3                      ;$5a21
and b                             ;$5a23
and b                             ;$5a24
and b                             ;$5a25
ldh [$ffe0], a                    ;$5a26
ld h, b                           ;$5a28
ld h, b                           ;$5a29
jr nc, $5a5c                      ;$5a2a
ld [$08a8], sp                    ;$5a2c
jr $5a39                          ;$5a2f
xor b                             ;$5a31
ld [$0848], sp                    ;$5a32
xor b                             ;$5a35
ld [$0818], sp                    ;$5a36
xor b                             ;$5a39
ld [$0048], sp                    ;$5a3a
cp $00                            ;$5a3d
rst $38                           ;$5a3f
ld a, a                           ;$5a40
rst $38                           ;$5a41
ld a, a                           ;$5a42
pop bc                            ;$5a43
ld a, a                           ;$5a44
pop bc                            ;$5a45
ld a, a                           ;$5a46
db $eb ;<unknown instruction>     ;$5a47
ld a, a                           ;$5a48
pop bc                            ;$5a49
ld bc, $00ff                      ;$5a4a
nop                               ;$5a4d
nop                               ;$5a4e
nop                               ;$5a4f
nop                               ;$5a50
nop                               ;$5a51
rst $38                           ;$5a52
nop                               ;$5a53
nop                               ;$5a54
nop                               ;$5a55
rst $38                           ;$5a56
nop                               ;$5a57
nop                               ;$5a58
nop                               ;$5a59
rst $38                           ;$5a5a
nop                               ;$5a5b
db $10 ;<corrupted stop>          ;$5a5c
db $10 ;<corrupted stop>          ;$5a5d
dec bc                            ;$5a5e
dec bc                            ;$5a5f
rlca                              ;$5a60
inc b                             ;$5a61
rlca                              ;$5a62
inc b                             ;$5a63
inc bc                            ;$5a64
ld [bc], a                        ;$5a65
ld bc, $0001                      ;$5a66
nop                               ;$5a69
nop                               ;$5a6a
nop                               ;$5a6b
or h                              ;$5a6c
or h                              ;$5a6d
db $e4 ;<unknown instruction>     ;$5a6e
db $e4 ;<unknown instruction>     ;$5a6f
cp h                              ;$5a70
cp h                              ;$5a71
xor $6e                           ;$5a72
rst $20                           ;$5a74
daa                               ;$5a75
ldh a, [$ff10]                    ;$5a76
db $fc ;<unknown instruction>     ;$5a78
sbc h                             ;$5a79
ld [hl], a                        ;$5a7a
ld e, a                           ;$5a7b
nop                               ;$5a7c
nop                               ;$5a7d
nop                               ;$5a7e
nop                               ;$5a7f
rlca                              ;$5a80
rlca                              ;$5a81
rra                               ;$5a82
jr $5ac4                          ;$5a83
jr nz, $5b06                      ;$5a85
ld b, b                           ;$5a87
ld a, a                           ;$5a88
ld b, b                           ;$5a89
ld a, a                           ;$5a8a
ld b, b                           ;$5a8b
nop                               ;$5a8c
nop                               ;$5a8d
nop                               ;$5a8e
nop                               ;$5a8f
nop                               ;$5a90
nop                               ;$5a91
add b                             ;$5a92
add b                             ;$5a93
ret nz                            ;$5a94
ld b, b                           ;$5a95
ret nz                            ;$5a96
ld b, b                           ;$5a97
ret nz                            ;$5a98
ld b, b                           ;$5a99
add b                             ;$5a9a
add b                             ;$5a9b
ld [bc], a                        ;$5a9c
inc bc                            ;$5a9d
dec b                             ;$5a9e
inc b                             ;$5a9f
rlca                              ;$5aa0
inc b                             ;$5aa1
inc b                             ;$5aa2
rlca                              ;$5aa3
inc b                             ;$5aa4
rlca                              ;$5aa5
inc b                             ;$5aa6
ld b, $04                         ;$5aa7
dec b                             ;$5aa9
inc b                             ;$5aaa
rlca                              ;$5aab
adc a, $fa                        ;$5aac
inc c                             ;$5aae
db $fc ;<unknown instruction>     ;$5aaf
ld [$08f8], sp                    ;$5ab0
ld hl, sp+$08                     ;$5ab3
ld hl, sp+$08                     ;$5ab5
ld hl, sp+$08                     ;$5ab7
ld hl, sp+$88                     ;$5ab9
ld hl, sp+$00                     ;$5abb
inc a                             ;$5abd
nop                               ;$5abe
ld a, [hl]                        ;$5abf
db $10 ;<corrupted stop>          ;$5ac0
ld h, a                           ;$5ac1
inc h                             ;$5ac2
jp $c324                          ;$5ac3
inc h                             ;$5ac6
jp $c324                          ;$5ac7
inc [hl]                          ;$5aca
jp $3c00                          ;$5acb
nop                               ;$5ace
ld h, [hl]                        ;$5acf
nop                               ;$5ad0
rst $20                           ;$5ad1
inc l                             ;$5ad2
jp $c33c                          ;$5ad3
inc a                             ;$5ad6
jp $423c                          ;$5ad7
jr $5b42                          ;$5ada
nop                               ;$5adc
nop                               ;$5add
nop                               ;$5ade
nop                               ;$5adf
nop                               ;$5ae0
nop                               ;$5ae1
jr nz, $5b04                      ;$5ae2
sub b                             ;$5ae4
sub b                             ;$5ae5
cp b                              ;$5ae6
xor b                             ;$5ae7
xor b                             ;$5ae8
xor b                             ;$5ae9
db $10 ;<corrupted stop>          ;$5aea
db $10 ;<corrupted stop>          ;$5aeb
ld a, [bc]                        ;$5aec
db $10 ;<corrupted stop>          ;$5aed
ld b, $08                         ;$5aee
ld [bc], a                        ;$5af0
inc b                             ;$5af1
nop                               ;$5af2
inc b                             ;$5af3
nop                               ;$5af4
inc b                             ;$5af5
nop                               ;$5af6
inc b                             ;$5af7
nop                               ;$5af8
inc b                             ;$5af9
nop                               ;$5afa
inc b                             ;$5afb
rla                               ;$5afc
ld d, b                           ;$5afd
jr z, $5b60                       ;$5afe
ldi a, [hl]                       ;$5b00
ld h, b                           ;$5b01
jr z, $5b64                       ;$5b02
ldi a, [hl]                       ;$5b04
ld h, b                           ;$5b05
jr z, $5b68                       ;$5b06
jr z, $5b71                       ;$5b08
ld l, b                           ;$5b0a
ld h, b                           ;$5b0b
sbc a, $2b                        ;$5b0c
ld l, $17                         ;$5b0e
ld l, [hl]                        ;$5b10
rla                               ;$5b11
ld l, $17                         ;$5b12
ld l, [hl]                        ;$5b14
rla                               ;$5b15
ld l, $17                         ;$5b16
ld l, $d7                         ;$5b18
ld l, $17                         ;$5b1a
sbc b                             ;$5b1c
ld c, b                           ;$5b1d
or b                              ;$5b1e
ld d, b                           ;$5b1f
and b                             ;$5b20
ld h, b                           ;$5b21
and b                             ;$5b22
jr nz, $5ac5                      ;$5b23
jr nz, $5ac7                      ;$5b25
jr nz, $5ac9                      ;$5b27
jr nz, $5acb                      ;$5b29
jr nz, $5b35                      ;$5b2b
xor b                             ;$5b2d
ld [$0818], sp                    ;$5b2e
xor b                             ;$5b31
ld [$0848], sp                    ;$5b32
cp b                              ;$5b35
ld [$083f], sp                    ;$5b36
cp a                              ;$5b39
add hl, bc                        ;$5b3a
ld a, a                           ;$5b3b
nop                               ;$5b3c
ld a, a                           ;$5b3d
nop                               ;$5b3e
rst $38                           ;$5b3f
ld a, [hl]                        ;$5b40
rst $38                           ;$5b41
ld a, [hl]                        ;$5b42
pop bc                            ;$5b43
ld a, [hl]                        ;$5b44
pop bc                            ;$5b45
ld a, [hl]                        ;$5b46
db $eb ;<unknown instruction>     ;$5b47
ld a, [hl]                        ;$5b48
pop bc                            ;$5b49
nop                               ;$5b4a
rst $38                           ;$5b4b
nop                               ;$5b4c
nop                               ;$5b4d
nop                               ;$5b4e
nop                               ;$5b4f
rst $38                           ;$5b50
nop                               ;$5b51
rst $38                           ;$5b52
nop                               ;$5b53
rst $38                           ;$5b54
nop                               ;$5b55
rst $38                           ;$5b56
nop                               ;$5b57
rst $38                           ;$5b58
nop                               ;$5b59
rst $38                           ;$5b5a
nop                               ;$5b5b
nop                               ;$5b5c
nop                               ;$5b5d
jr c, $5b98                       ;$5b5e
inc [hl]                          ;$5b60
inc h                             ;$5b61
inc a                             ;$5b62
inc h                             ;$5b63
ccf                               ;$5b64
daa                               ;$5b65
inc a                             ;$5b66
daa                               ;$5b67
inc a                             ;$5b68
daa                               ;$5b69
ccf                               ;$5b6a
cpl                               ;$5b6b
scf                               ;$5b6c
inc a                             ;$5b6d
rla                               ;$5b6e
inc d                             ;$5b6f
rla                               ;$5b70
rra                               ;$5b71
inc e                             ;$5b72
rra                               ;$5b73
ldh a, [$ffff]                    ;$5b74
nop                               ;$5b76
rst $38                           ;$5b77
ld [bc], a                        ;$5b78
rst $38                           ;$5b79
rst $38                           ;$5b7a
rst $38                           ;$5b7b
cp a                              ;$5b7c
and b                             ;$5b7d
cp a                              ;$5b7e
and b                             ;$5b7f
cp a                              ;$5b80
cp b                              ;$5b81
ld a, a                           ;$5b82
ld a, a                           ;$5b83
cpl                               ;$5b84
cpl                               ;$5b85
ld a, a                           ;$5b86
ld a, a                           ;$5b87
rst $30                           ;$5b88
sbc h                             ;$5b89
rst $30                           ;$5b8a
sbc h                             ;$5b8b
db $fd ;<unknown instruction>     ;$5b8c
dec b                             ;$5b8d
db $fd ;<unknown instruction>     ;$5b8e
dec b                             ;$5b8f
db $fd ;<unknown instruction>     ;$5b90
dec e                             ;$5b91
rst $38                           ;$5b92
rst $38                           ;$5b93
rst $30                           ;$5b94
db $f4 ;<unknown instruction>     ;$5b95
rst $38                           ;$5b96
cp $ef                            ;$5b97
jr c, $5b8a                       ;$5b99
jr c, $5b9e                       ;$5b9b
ld bc, $0101                      ;$5b9d
ld bc, $0201                      ;$5ba0
ld [bc], a                        ;$5ba3
ld [bc], a                        ;$5ba4
ld [bc], a                        ;$5ba5
ld [bc], a                        ;$5ba6
ld [bc], a                        ;$5ba7
ld bc, $0001                      ;$5ba8
nop                               ;$5bab
ld [bc], a                        ;$5bac
ld [bc], a                        ;$5bad
ld [bc], a                        ;$5bae
ld [bc], a                        ;$5baf
ld bc, $0001                      ;$5bb0
nop                               ;$5bb3
nop                               ;$5bb4
nop                               ;$5bb5
nop                               ;$5bb6
nop                               ;$5bb7
nop                               ;$5bb8
nop                               ;$5bb9
nop                               ;$5bba
nop                               ;$5bbb
inc [hl]                          ;$5bbc
jp $433c                          ;$5bbd
inc a                             ;$5bc0
ld b, e                           ;$5bc1
jr $5c2a                          ;$5bc2
jr $5c2c                          ;$5bc4
ld [$0876], sp                    ;$5bc6
ld [hl], $08                      ;$5bc9
inc [hl]                          ;$5bcb
jr $5bf4                          ;$5bcc
jr $5bf4                          ;$5bce
jr $5bf6                          ;$5bd0
ld [$0034], sp                    ;$5bd2
jr $5bd7                          ;$5bd5
ld [$0800], sp                    ;$5bd7
nop                               ;$5bda
ld [$0000], sp                    ;$5bdb
rrca                              ;$5bde
rrca                              ;$5bdf
rra                               ;$5be0
db $10 ;<corrupted stop>          ;$5be1
inc a                             ;$5be2
jr nz, $5c55                      ;$5be3
ld b, b                           ;$5be5
ld [hl], e                        ;$5be6
ld b, e                           ;$5be7
ld h, a                           ;$5be8
ld c, h                           ;$5be9
ccf                               ;$5bea
jr z, $5bed                       ;$5beb
nop                               ;$5bed
add b                             ;$5bee
add b                             ;$5bef
call c, $3e5c                     ;$5bf0
ldi [hl], a                       ;$5bf3
ldd [hl], a                       ;$5bf4
ld [$ff00+c], a                   ;$5bf5
or c                              ;$5bf6
pop bc                            ;$5bf7
jp $274b                          ;$5bf8
ld a, h                           ;$5bfb
nop                               ;$5bfc
nop                               ;$5bfd
nop                               ;$5bfe
nop                               ;$5bff
nop                               ;$5c00
nop                               ;$5c01
nop                               ;$5c02
nop                               ;$5c03
ldh [$ffe0], a                    ;$5c04
ret nc                            ;$5c06
db $10 ;<corrupted stop>          ;$5c07
ret nc                            ;$5c08
ret nc                            ;$5c09
ldh [$ff20], a                    ;$5c0a
ld e, h                           ;$5c0c
ld d, b                           ;$5c0d
ld a, h                           ;$5c0e
ld d, b                           ;$5c0f
add hl, sp                        ;$5c10
jr nc, $5c8f                      ;$5c11
ld c, h                           ;$5c13
xor $82                           ;$5c14
ret nz                            ;$5c16
add h                             ;$5c17
ld h, b                           ;$5c18
ld b, e                           ;$5c19
ld sp, $1f26                      ;$5c1a
inc a                             ;$5c1d
cp e                              ;$5c1e
ld h, d                           ;$5c1f
pop af                            ;$5c20
ld b, c                           ;$5c21
ld h, c                           ;$5c22
ld b, c                           ;$5c23
jp $f703                          ;$5c24
inc b                             ;$5c27
xor $08                           ;$5c28
sbc h                             ;$5c2a
ld h, b                           ;$5c2b
sub b                             ;$5c2c
db $10 ;<corrupted stop>          ;$5c2d
ld [$1808], sp                    ;$5c2e
jr $5c6f                          ;$5c31
ld h, h                           ;$5c33
ld a, [$ff00+c]                   ;$5c34
jp nz, $60e3                      ;$5c35
add hl, sp                        ;$5c38
jr nz, $5c2d                      ;$5c39
nop                               ;$5c3b
nop                               ;$5c3c
rst $38                           ;$5c3d
nop                               ;$5c3e
rst $38                           ;$5c3f
rst $38                           ;$5c40
rst $38                           ;$5c41
rst $38                           ;$5c42
nop                               ;$5c43
rst $38                           ;$5c44
nop                               ;$5c45
rst $38                           ;$5c46
nop                               ;$5c47
nop                               ;$5c48
rst $38                           ;$5c49
nop                               ;$5c4a
rst $38                           ;$5c4b
rst $38                           ;$5c4c
rst $38                           ;$5c4d
rst $38                           ;$5c4e
nop                               ;$5c4f
rst $38                           ;$5c50
rst $38                           ;$5c51
nop                               ;$5c52
rst $38                           ;$5c53
nop                               ;$5c54
rst $38                           ;$5c55
rst $38                           ;$5c56
rst $38                           ;$5c57
rst $38                           ;$5c58
rst $38                           ;$5c59
rst $38                           ;$5c5a
rst $38                           ;$5c5b
jr c, $5c96                       ;$5c5c
nop                               ;$5c5e
nop                               ;$5c5f
nop                               ;$5c60
nop                               ;$5c61
nop                               ;$5c62
nop                               ;$5c63
nop                               ;$5c64
nop                               ;$5c65
nop                               ;$5c66
nop                               ;$5c67
nop                               ;$5c68
nop                               ;$5c69
nop                               ;$5c6a
nop                               ;$5c6b
nop                               ;$5c6c
nop                               ;$5c6d
nop                               ;$5c6e
nop                               ;$5c6f
nop                               ;$5c70
nop                               ;$5c71
nop                               ;$5c72
nop                               ;$5c73
ld c, $0e                         ;$5c74
ld de, $1111                      ;$5c76
ld de, $1212                      ;$5c79
di                                ;$5c7c
rra                               ;$5c7d
ldh a, [$ff3f]                    ;$5c7e
ldh a, [$ffbf]                    ;$5c80
ld h, b                           ;$5c82
ld a, a                           ;$5c83
db $10 ;<corrupted stop>          ;$5c84
rra                               ;$5c85
ld d, b                           ;$5c86
ld e, a                           ;$5c87
jr nc, $5cc9                      ;$5c88
pop af                            ;$5c8a
rst $38                           ;$5c8b
rst $08                           ;$5c8c
ei                                ;$5c8d
inc c                             ;$5c8e
db $fc ;<unknown instruction>     ;$5c8f
ld [$08f8], sp                    ;$5c90
ld hl, sp+$08                     ;$5c93
ld hl, sp+$08                     ;$5c95
ld hl, sp+$08                     ;$5c97
ld hl, sp+$88                     ;$5c99
ld hl, sp+$4e                     ;$5c9b
ld a, d                           ;$5c9d
ret                               ;$5c9e
reti                              ;$5c9f
add hl, bc                        ;$5ca0
ld sp, hl                         ;$5ca1
ld c, $fe                         ;$5ca2
ld c, b                           ;$5ca4
ld hl, sp+$98                     ;$5ca5
ld hl, sp+$fc                     ;$5ca7
db $fc ;<unknown instruction>     ;$5ca9
ld a, h                           ;$5caa
ld a, h                           ;$5cab
and b                             ;$5cac
cp a                              ;$5cad
ld b, b                           ;$5cae
ld a, a                           ;$5caf
ldh [$ffff], a                    ;$5cb0
jr nz, $5cf3                      ;$5cb2
ld de, $721f                      ;$5cb4
ld a, [hl]                        ;$5cb7
rst $38                           ;$5cb8
rst $38                           ;$5cb9
rst $38                           ;$5cba
rst $38                           ;$5cbb
nop                               ;$5cbc
inc a                             ;$5cbd
nop                               ;$5cbe
inc e                             ;$5cbf
nop                               ;$5cc0
inc e                             ;$5cc1
nop                               ;$5cc2
jr $5cc5                          ;$5cc3
ld [$0000], sp                    ;$5cc5
nop                               ;$5cc8
nop                               ;$5cc9
nop                               ;$5cca
nop                               ;$5ccb
nop                               ;$5ccc
rst $38                           ;$5ccd
nop                               ;$5cce
xor e                             ;$5ccf
nop                               ;$5cd0
ld d, l                           ;$5cd1
nop                               ;$5cd2
rst $38                           ;$5cd3
nop                               ;$5cd4
nop                               ;$5cd5
nop                               ;$5cd6
nop                               ;$5cd7
nop                               ;$5cd8
nop                               ;$5cd9
nop                               ;$5cda
nop                               ;$5cdb
nop                               ;$5cdc
dec d                             ;$5cdd
nop                               ;$5cde
jr $5ce1                          ;$5cdf
dec d                             ;$5ce1
nop                               ;$5ce2
ld [de], a                        ;$5ce3
nop                               ;$5ce4
dec d                             ;$5ce5
nop                               ;$5ce6
jr $5ce9                          ;$5ce7
dec d                             ;$5ce9
nop                               ;$5cea
ld [de], a                        ;$5ceb
ld b, b                           ;$5cec
ld b, b                           ;$5ced
ld b, b                           ;$5cee
ret nz                            ;$5cef
ld b, b                           ;$5cf0
ld b, b                           ;$5cf1
ld b, b                           ;$5cf2
ld b, b                           ;$5cf3
ld b, b                           ;$5cf4
ld b, b                           ;$5cf5
ld b, b                           ;$5cf6
ret nz                            ;$5cf7
ld b, b                           ;$5cf8
ld b, b                           ;$5cf9
ld b, b                           ;$5cfa
ld b, b                           ;$5cfb
ld c, $32                         ;$5cfc
ld c, $32                         ;$5cfe
ld c, $32                         ;$5d00
ld c, $32                         ;$5d02
rrca                              ;$5d04
inc sp                            ;$5d05
adc a                             ;$5d06
or e                              ;$5d07
adc a, $f3                        ;$5d08
xor $73                           ;$5d0a
nop                               ;$5d0c
nop                               ;$5d0d
nop                               ;$5d0e
nop                               ;$5d0f
nop                               ;$5d10
nop                               ;$5d11
nop                               ;$5d12
nop                               ;$5d13
nop                               ;$5d14
nop                               ;$5d15
nop                               ;$5d16
nop                               ;$5d17
add b                             ;$5d18
add b                             ;$5d19
ret nz                            ;$5d1a
ld b, b                           ;$5d1b
nop                               ;$5d1c
nop                               ;$5d1d
nop                               ;$5d1e
nop                               ;$5d1f
add b                             ;$5d20
add b                             ;$5d21
ld b, a                           ;$5d22
ld b, a                           ;$5d23
rra                               ;$5d24
jr $5d66                          ;$5d25
jr nz, $5da8                      ;$5d27
ld b, b                           ;$5d29
ld a, a                           ;$5d2a
ld b, b                           ;$5d2b
ld a, a                           ;$5d2c
ld b, b                           ;$5d2d
cp a                              ;$5d2e
and b                             ;$5d2f
cp a                              ;$5d30
and b                             ;$5d31
cp a                              ;$5d32
cp b                              ;$5d33
ld a, a                           ;$5d34
ld a, a                           ;$5d35
ccf                               ;$5d36
ccf                               ;$5d37
ld [hl], a                        ;$5d38
ld a, h                           ;$5d39
rst $30                           ;$5d3a
sbc h                             ;$5d3b
ld a, [$ff00+c]                   ;$5d3c
and a, $f2                        ;$5d3d
and a, $f2                        ;$5d3f
and a, $f2                        ;$5d41
and a, $f2                        ;$5d43
and a, $f2                        ;$5d45
and a, $f2                        ;$5d47
and a, $f2                        ;$5d49
and a, $00                        ;$5d4b
nop                               ;$5d4d
ld bc, $0101                      ;$5d4e
ld bc, $0101                      ;$5d51
ld [bc], a                        ;$5d54
ld [bc], a                        ;$5d55
ld [bc], a                        ;$5d56
ld [bc], a                        ;$5d57
ld [bc], a                        ;$5d58
ld [bc], a                        ;$5d59
ld bc, $f301                      ;$5d5a
sbc a                             ;$5d5d
ldh a, [$ff1f]                    ;$5d5e
ldh a, [$ff3f]                    ;$5d60
ldh [$ffbf], a                    ;$5d62
ld [hl], b                        ;$5d64
ld a, a                           ;$5d65
db $10 ;<corrupted stop>          ;$5d66
rra                               ;$5d67
ld d, b                           ;$5d68
ld e, a                           ;$5d69
ld sp, $3e3f                      ;$5d6a
ldi [hl], a                       ;$5d6d
rra                               ;$5d6e
rra                               ;$5d6f
db $10 ;<corrupted stop>          ;$5d70
rra                               ;$5d71
db $10 ;<corrupted stop>          ;$5d72
rra                               ;$5d73
ld [de], a                        ;$5d74
rra                               ;$5d75
add hl, de                        ;$5d76
rra                               ;$5d77
ccf                               ;$5d78
ccf                               ;$5d79
ld a, $3e                         ;$5d7a
ld [de], a                        ;$5d7c
ld e, $12                         ;$5d7d
ld e, $12                         ;$5d7f
ld e, $12                         ;$5d81
ld e, $7e                         ;$5d83
ld a, [hl]                        ;$5d85
rst $38                           ;$5d86
add e                             ;$5d87
rst $38                           ;$5d88
add c                             ;$5d89
rst $38                           ;$5d8a
rst $38                           ;$5d8b
ld bc, $0101                      ;$5d8c
ld bc, $0101                      ;$5d8f
ld [bc], a                        ;$5d92
ld [bc], a                        ;$5d93
ld [bc], a                        ;$5d94
ld [bc], a                        ;$5d95
ld [bc], a                        ;$5d96
ld [bc], a                        ;$5d97
ld bc, $0001                      ;$5d98
nop                               ;$5d9b
ld h, b                           ;$5d9c
ldh [$ff80], a                    ;$5d9d
add b                             ;$5d9f
add b                             ;$5da0
add b                             ;$5da1
add b                             ;$5da2
add b                             ;$5da3
add b                             ;$5da4
add b                             ;$5da5
add b                             ;$5da6
add b                             ;$5da7
add b                             ;$5da8
add b                             ;$5da9
add b                             ;$5daa
add b                             ;$5dab
rlca                              ;$5dac
inc b                             ;$5dad
rlca                              ;$5dae
inc b                             ;$5daf
rlca                              ;$5db0
inc b                             ;$5db1
rlca                              ;$5db2
inc b                             ;$5db3
rlca                              ;$5db4
inc b                             ;$5db5
rlca                              ;$5db6
inc b                             ;$5db7
rlca                              ;$5db8
inc b                             ;$5db9
rlca                              ;$5dba
inc b                             ;$5dbb
dec bc                            ;$5dbc
add hl, bc                        ;$5dbd
dec bc                            ;$5dbe
ld a, [bc]                        ;$5dbf
rrca                              ;$5dc0
ld a, [bc]                        ;$5dc1
rla                               ;$5dc2
ld [de], a                        ;$5dc3
rla                               ;$5dc4
inc e                             ;$5dc5
inc d                             ;$5dc6
rla                               ;$5dc7
rla                               ;$5dc8
inc d                             ;$5dc9
cpl                               ;$5dca
inc h                             ;$5dcb
nop                               ;$5dcc
nop                               ;$5dcd
ld [hl], b                        ;$5dce
ld [hl], b                        ;$5dcf
adc a                             ;$5dd0
adc a                             ;$5dd1
sbc b                             ;$5dd2
sbc a                             ;$5dd3
ldh [$ffff], a                    ;$5dd4
ldh a, [$ff9f]                    ;$5dd6
ld a, b                           ;$5dd8
ld d, a                           ;$5dd9
ld a, a                           ;$5dda
ld c, h                           ;$5ddb
dec sp                            ;$5ddc
cpl                               ;$5ddd
ret nc                            ;$5dde
rst $18                           ;$5ddf
ldh a, [$ffff]                    ;$5de0
ret nz                            ;$5de2
rst $38                           ;$5de3
ret nz                            ;$5de4
rst $38                           ;$5de5
rst $38                           ;$5de6
rst $38                           ;$5de7
nop                               ;$5de8
nop                               ;$5de9
nop                               ;$5dea
nop                               ;$5deb
rst $38                           ;$5dec
rst $38                           ;$5ded
rst $38                           ;$5dee
rst $38                           ;$5def
rst $38                           ;$5df0
rst $38                           ;$5df1
rst $38                           ;$5df2
ld hl, sp+$f8                     ;$5df3
ldh a, [$fff2]                    ;$5df5
pop hl                            ;$5df7
push af                           ;$5df8
db $e3 ;<unknown instruction>     ;$5df9
ld a, [$ff00+c]                   ;$5dfa
and a, $ff                        ;$5dfb
rst $38                           ;$5dfd
rst $38                           ;$5dfe
add c                             ;$5dff
jp $df81                          ;$5e00
add l                             ;$5e03
rst $18                           ;$5e04
add l                             ;$5e05
rst $38                           ;$5e06
cp l                              ;$5e07
rst $38                           ;$5e08
add c                             ;$5e09
rst $38                           ;$5e0a
rst $38                           ;$5e0b
rst $38                           ;$5e0c
rst $38                           ;$5e0d
rst $38                           ;$5e0e
rst $38                           ;$5e0f
rst $38                           ;$5e10
rst $38                           ;$5e11
rst $38                           ;$5e12
rra                               ;$5e13
rra                               ;$5e14
rrca                              ;$5e15
ld c, a                           ;$5e16
add a                             ;$5e17
xor a                             ;$5e18
rst $00                           ;$5e19
ld c, a                           ;$5e1a
ld h, a                           ;$5e1b
rst $38                           ;$5e1c
rst $38                           ;$5e1d
rst $38                           ;$5e1e
rst $38                           ;$5e1f
rst $38                           ;$5e20
rst $38                           ;$5e21
rst $38                           ;$5e22
nop                               ;$5e23
nop                               ;$5e24
nop                               ;$5e25
nop                               ;$5e26
rst $38                           ;$5e27
rst $38                           ;$5e28
rst $38                           ;$5e29
nop                               ;$5e2a
nop                               ;$5e2b
ld c, a                           ;$5e2c
ld h, a                           ;$5e2d
ld c, a                           ;$5e2e
ld h, a                           ;$5e2f
ld c, a                           ;$5e30
ld h, a                           ;$5e31
ld c, a                           ;$5e32
ld h, a                           ;$5e33
ld c, a                           ;$5e34
ld h, a                           ;$5e35
ld c, a                           ;$5e36
ld h, a                           ;$5e37
ld c, a                           ;$5e38
ld h, a                           ;$5e39
ld c, a                           ;$5e3a
ld h, a                           ;$5e3b
ld a, [$ff00+c]                   ;$5e3c
and a, $f5                        ;$5e3d
db $e3 ;<unknown instruction>     ;$5e3f
ld a, [$ff00+c]                   ;$5e40
pop hl                            ;$5e41
ld hl, sp+$f0                     ;$5e42
rst $38                           ;$5e44
ld hl, sp+$ff                     ;$5e45
rst $38                           ;$5e47
rst $38                           ;$5e48
rst $38                           ;$5e49
rst $38                           ;$5e4a
rst $38                           ;$5e4b
nop                               ;$5e4c
nop                               ;$5e4d
rst $38                           ;$5e4e
rst $38                           ;$5e4f
nop                               ;$5e50
rst $38                           ;$5e51
nop                               ;$5e52
nop                               ;$5e53
rst $38                           ;$5e54
nop                               ;$5e55
rst $38                           ;$5e56
rst $38                           ;$5e57
rst $38                           ;$5e58
rst $38                           ;$5e59
rst $38                           ;$5e5a
rst $38                           ;$5e5b
ld c, a                           ;$5e5c
ld h, a                           ;$5e5d
xor a                             ;$5e5e
rst $00                           ;$5e5f
ld c, a                           ;$5e60
add a                             ;$5e61
rra                               ;$5e62
rrca                              ;$5e63
rst $38                           ;$5e64
rra                               ;$5e65
rst $38                           ;$5e66
rst $38                           ;$5e67
rst $38                           ;$5e68
rst $38                           ;$5e69
rst $38                           ;$5e6a
rst $38                           ;$5e6b
rst $38                           ;$5e6c
rst $38                           ;$5e6d
rst $38                           ;$5e6e
rst $38                           ;$5e6f
rst $38                           ;$5e70
rst $38                           ;$5e71
rst $38                           ;$5e72
nop                               ;$5e73
nop                               ;$5e74
nop                               ;$5e75
nop                               ;$5e76
rst $28                           ;$5e77
rst $20                           ;$5e78
rst $08                           ;$5e79
inc h                             ;$5e7a
inc c                             ;$5e7b
inc h                             ;$5e7c
inc c                             ;$5e7d
inc h                             ;$5e7e
inc c                             ;$5e7f
inc h                             ;$5e80
inc c                             ;$5e81
inc h                             ;$5e82
inc c                             ;$5e83
inc h                             ;$5e84
inc c                             ;$5e85
inc h                             ;$5e86
inc c                             ;$5e87
inc h                             ;$5e88
inc c                             ;$5e89
inc h                             ;$5e8a
inc c                             ;$5e8b
inc h                             ;$5e8c
inc c                             ;$5e8d
rst $20                           ;$5e8e
rst $08                           ;$5e8f
nop                               ;$5e90
rst $28                           ;$5e91
nop                               ;$5e92
nop                               ;$5e93
rst $38                           ;$5e94
nop                               ;$5e95
rst $38                           ;$5e96
rst $38                           ;$5e97
rst $38                           ;$5e98
rst $38                           ;$5e99
rst $38                           ;$5e9a
rst $38                           ;$5e9b
rlca                              ;$5e9c
rlca                              ;$5e9d
jr $5ebf                          ;$5e9e
ld hl, $473e                      ;$5ea0
ld a, a                           ;$5ea3
ld e, a                           ;$5ea4
ld a, a                           ;$5ea5
add hl, sp                        ;$5ea6
jr nc, $5f24                      ;$5ea7
ld h, d                           ;$5ea9
ei                                ;$5eaa
or d                              ;$5eab
ldh [$ffe0], a                    ;$5eac
jr $5ea8                          ;$5eae
add h                             ;$5eb0
ld a, h                           ;$5eb1
ld [$ff00+c], a                   ;$5eb2
cp $fa                            ;$5eb3
cp $9c                            ;$5eb5
inc c                             ;$5eb7
sbc a, $46                        ;$5eb8
rst $18                           ;$5eba
ld c, l                           ;$5ebb
rst $38                           ;$5ebc
and b                             ;$5ebd
rst $38                           ;$5ebe
jp nz, $547f                      ;$5ebf
ld a, a                           ;$5ec2
ld e, h                           ;$5ec3
ccf                               ;$5ec4
ld l, $3f                         ;$5ec5
inc hl                            ;$5ec7
rra                               ;$5ec8
jr $5ed2                          ;$5ec9
rlca                              ;$5ecb
rst $38                           ;$5ecc
dec b                             ;$5ecd
rst $38                           ;$5ece
ld b, e                           ;$5ecf
cp $2a                            ;$5ed0
cp $3a                            ;$5ed2
db $fc ;<unknown instruction>     ;$5ed4
ld [hl], h                        ;$5ed5
db $fc ;<unknown instruction>     ;$5ed6
call nz, $18f8                    ;$5ed7
ldh [$ffe0], a                    ;$5eda
rlca                              ;$5edc
rlca                              ;$5edd
rra                               ;$5ede
jr $5f1f                          ;$5edf
jr nz, $5f62                      ;$5ee1
ld c, a                           ;$5ee3
ld a, a                           ;$5ee4
ld e, a                           ;$5ee5
ld [hl], b                        ;$5ee6
ld [hl], b                        ;$5ee7
and d                             ;$5ee8
and d                             ;$5ee9
or b                              ;$5eea
or b                              ;$5eeb
ldh [$ffe0], a                    ;$5eec
ld hl, sp+$18                     ;$5eee
ld a, h                           ;$5ef0
inc b                             ;$5ef1
cp $f2                            ;$5ef2
cp $fa                            ;$5ef4
ld c, $0e                         ;$5ef6
ld b, l                           ;$5ef8
ld b, l                           ;$5ef9
dec c                             ;$5efa
dec c                             ;$5efb
or h                              ;$5efc
or h                              ;$5efd
ld h, h                           ;$5efe
ld h, h                           ;$5eff
inc a                             ;$5f00
inc a                             ;$5f01
ld l, $2e                         ;$5f02
daa                               ;$5f04
daa                               ;$5f05
db $10 ;<corrupted stop>          ;$5f06
db $10 ;<corrupted stop>          ;$5f07
inc c                             ;$5f08
inc c                             ;$5f09
inc bc                            ;$5f0a
inc bc                            ;$5f0b
dec l                             ;$5f0c
dec l                             ;$5f0d
ld h, $26                         ;$5f0e
inc a                             ;$5f10
inc a                             ;$5f11
ld [hl], h                        ;$5f12
ld [hl], h                        ;$5f13
db $e4 ;<unknown instruction>     ;$5f14
db $e4 ;<unknown instruction>     ;$5f15
ld [$3008], sp                    ;$5f16
jr nc, $5edb                      ;$5f19
ret nz                            ;$5f1b
cpl                               ;$5f1c
inc h                             ;$5f1d
cpl                               ;$5f1e
inc h                             ;$5f1f
cpl                               ;$5f20
inc h                             ;$5f21
cpl                               ;$5f22
inc h                             ;$5f23
ld h, a                           ;$5f24
ld a, h                           ;$5f25
cp h                              ;$5f26
and a                             ;$5f27
rst $38                           ;$5f28
db $e4 ;<unknown instruction>     ;$5f29
dec de                            ;$5f2a
dec de                            ;$5f2b
nop                               ;$5f2c
nop                               ;$5f2d
nop                               ;$5f2e
nop                               ;$5f2f
ld bc, $0101                      ;$5f30
ld bc, $0303                      ;$5f33
inc bc                            ;$5f36
inc bc                            ;$5f37
inc bc                            ;$5f38
ld [bc], a                        ;$5f39
rlca                              ;$5f3a
inc b                             ;$5f3b
inc b                             ;$5f3c
rlca                              ;$5f3d
rlca                              ;$5f3e
inc b                             ;$5f3f
rlca                              ;$5f40
inc b                             ;$5f41
inc b                             ;$5f42
inc b                             ;$5f43
ld b, $06                         ;$5f44
dec b                             ;$5f46
dec b                             ;$5f47
dec b                             ;$5f48
dec b                             ;$5f49
ld b, $06                         ;$5f4a
rlca                              ;$5f4c
inc b                             ;$5f4d
rlca                              ;$5f4e
inc b                             ;$5f4f
inc b                             ;$5f50
rlca                              ;$5f51
inc b                             ;$5f52
inc b                             ;$5f53
inc b                             ;$5f54
inc b                             ;$5f55
rlca                              ;$5f56
rlca                              ;$5f57
rlca                              ;$5f58
rlca                              ;$5f59
ld b, $06                         ;$5f5a
ld b, $06                         ;$5f5c
ld b, $06                         ;$5f5e
inc b                             ;$5f60
inc b                             ;$5f61
rlca                              ;$5f62
rlca                              ;$5f63
dec b                             ;$5f64
dec b                             ;$5f65
inc bc                            ;$5f66
inc bc                            ;$5f67
dec b                             ;$5f68
dec b                             ;$5f69
ld c, $0e                         ;$5f6a
rrca                              ;$5f6c
rra                               ;$5f6d
ld bc, $0110                      ;$5f6e
db $10 ;<corrupted stop>          ;$5f71
ld bc, $0110                      ;$5f72
ld [$0701], sp                    ;$5f75
inc b                             ;$5f78
add hl, bc                        ;$5f79
nop                               ;$5f7a
rrca                              ;$5f7b
ld [$f801], sp                    ;$5f7c
pop af                            ;$5f7f
ld c, [hl]                        ;$5f80
pop bc                            ;$5f81
ld [bc], a                        ;$5f82
rst $00                           ;$5f83
adc h                             ;$5f84
cp l                              ;$5f85
add h                             ;$5f86
xor l                             ;$5f87
ld h, d                           ;$5f88
rst $08                           ;$5f89
ld a, [hl]                        ;$5f8a
cp $ec                            ;$5f8b
sub b                             ;$5f8d
rst $28                           ;$5f8e
sbc a                             ;$5f8f
ld a, [$daf7]                     ;$5f90
rst $20                           ;$5f93
cp l                              ;$5f94
cp l                              ;$5f95
or l                              ;$5f96
xor l                             ;$5f97
jp nc, $7fef                      ;$5f98
ld a, a                           ;$5f9b
ld hl, sp+$f8                     ;$5f9c
jr $5f88                          ;$5f9e
jr c, $5f2a                       ;$5fa0
cp b                              ;$5fa2
ld [$10b0], sp                    ;$5fa3
ldh [$ffe0], a                    ;$5fa6
ret nc                            ;$5fa8
jr nc, $5f9b                      ;$5fa9
ldh a, [$ff18]                    ;$5fab
jr $5fdf                          ;$5fad
jr nc, $6011                      ;$5faf
ld h, b                           ;$5fb1
ret nz                            ;$5fb2
ret nz                            ;$5fb3
ret nz                            ;$5fb4
ret nz                            ;$5fb5
rst $38                           ;$5fb6
rst $38                           ;$5fb7
add e                             ;$5fb8
add e                             ;$5fb9
ld h, b                           ;$5fba
ld h, d                           ;$5fbb
ld a, [bc]                        ;$5fbc
nop                               ;$5fbd
ld [$0800], sp                    ;$5fbe
rlca                              ;$5fc1
ld [$0800], sp                    ;$5fc2
ld bc, $f1f8                      ;$5fc5
ld hl, sp+$f1                     ;$5fc8
ld [$6c01], sp                    ;$5fca
db $10 ;<corrupted stop>          ;$5fcd
inc l                             ;$5fce
db $10 ;<corrupted stop>          ;$5fcf
inc l                             ;$5fd0
pop de                            ;$5fd1
inc l                             ;$5fd2
ld de, $90ac                      ;$5fd3
rst $28                           ;$5fd6
sbc a                             ;$5fd7
rst $28                           ;$5fd8
sbc a                             ;$5fd9
db $ec ;<unknown instruction>     ;$5fda
sub b                             ;$5fdb
jr $5ff6                          ;$5fdc
inc c                             ;$5fde
inc c                             ;$5fdf
ld b, $c6                         ;$5fe0
inc bc                            ;$5fe2
jp $0303                          ;$5fe3
rst $38                           ;$5fe6
rst $38                           ;$5fe7
pop bc                            ;$5fe8
pop bc                            ;$5fe9
ld b, $46                         ;$5fea
nop                               ;$5fec
inc b                             ;$5fed
nop                               ;$5fee
inc c                             ;$5fef
ld [bc], a                        ;$5ff0
db $10 ;<corrupted stop>          ;$5ff1
ld [bc], a                        ;$5ff2
db $10 ;<corrupted stop>          ;$5ff3
ld [bc], a                        ;$5ff4
db $10 ;<corrupted stop>          ;$5ff5
ld [bc], a                        ;$5ff6
db $10 ;<corrupted stop>          ;$5ff7
ld [bc], a                        ;$5ff8
db $10 ;<corrupted stop>          ;$5ff9
ld [bc], a                        ;$5ffa
db $10 ;<corrupted stop>          ;$5ffb
inc c                             ;$5ffc
ld c, h                           ;$5ffd
inc c                             ;$5ffe
ld c, h                           ;$5fff
add hl, bc                        ;$6000
ld c, c                           ;$6001
dec bc                            ;$6002
ld c, e                           ;$6003
ld a, [bc]                        ;$6004
ld c, d                           ;$6005
db $10 ;<corrupted stop>          ;$6006
ld d, b                           ;$6007
ld [de], a                        ;$6008
ld d, d                           ;$6009
db $10 ;<corrupted stop>          ;$600a
ld d, b                           ;$600b
ld a, [hl]                        ;$600c
inc sp                            ;$600d
ld a, [hl]                        ;$600e
inc sp                            ;$600f
cp [hl]                           ;$6010
sub e                             ;$6011
cp $d3                            ;$6012
ld a, [hl]                        ;$6014
ld d, e                           ;$6015
ld a, $0b                         ;$6016
ld a, [hl]                        ;$6018
ld c, e                           ;$6019
ld a, $0b                         ;$601a
and b                             ;$601c
jr nz, $5faf                      ;$601d
jr nc, $5fb9                      ;$601f
ld c, b                           ;$6021
sbc b                             ;$6022
ld c, b                           ;$6023
sbc b                             ;$6024
ld c, b                           ;$6025
sbc b                             ;$6026
ld c, b                           ;$6027
sbc b                             ;$6028
ld c, b                           ;$6029
sbc b                             ;$602a
ld c, b                           ;$602b
nop                               ;$602c
nop                               ;$602d
nop                               ;$602e
nop                               ;$602f
nop                               ;$6030
nop                               ;$6031
nop                               ;$6032
nop                               ;$6033
ld bc, $0101                      ;$6034
ld bc, $0202                      ;$6037
ld [bc], a                        ;$603a
ld [bc], a                        ;$603b
ld [bc], a                        ;$603c
ld [bc], a                        ;$603d
ld [bc], a                        ;$603e
ld [bc], a                        ;$603f
ld [bc], a                        ;$6040
ld [bc], a                        ;$6041
nop                               ;$6042
ld bc, $0202                      ;$6043
ld [bc], a                        ;$6046
ld [bc], a                        ;$6047
ld [bc], a                        ;$6048
ld [bc], a                        ;$6049
ld [bc], a                        ;$604a
inc bc                            ;$604b
ld [bc], a                        ;$604c
inc bc                            ;$604d
ld [bc], a                        ;$604e
ld [bc], a                        ;$604f
ld [bc], a                        ;$6050
ld [bc], a                        ;$6051
ld [bc], a                        ;$6052
inc bc                            ;$6053
ld [bc], a                        ;$6054
ld [bc], a                        ;$6055
ld b, $06                         ;$6056
ld c, $0a                         ;$6058
ld c, $0a                         ;$605a
dec bc                            ;$605c
ld a, [bc]                        ;$605d
dec bc                            ;$605e
ld a, [bc]                        ;$605f
rrca                              ;$6060
ld a, [bc]                        ;$6061
ld a, [bc]                        ;$6062
ld a, [bc]                        ;$6063
ld b, $06                         ;$6064
ld a, [bc]                        ;$6066
ld a, [bc]                        ;$6067
ld a, [de]                        ;$6068
ld [de], a                        ;$6069
rra                               ;$606a
rra                               ;$606b
nop                               ;$606c
nop                               ;$606d
nop                               ;$606e
nop                               ;$606f
rra                               ;$6070
rra                               ;$6071
ccf                               ;$6072
jr nz, $60f4                      ;$6073
ld b, a                           ;$6075
ld a, h                           ;$6076
ld c, h                           ;$6077
ld a, h                           ;$6078
ld c, h                           ;$6079
ld a, h                           ;$607a
ld c, h                           ;$607b
nop                               ;$607c
nop                               ;$607d
nop                               ;$607e
nop                               ;$607f
ldh [$ffe0], a                    ;$6080
ldh a, [$ff30]                    ;$6082
ld hl, sp+$18                     ;$6084
ld hl, sp+$98                     ;$6086
ld hl, sp+$98                     ;$6088
ld hl, sp+$98                     ;$608a
ld a, a                           ;$608c
ld c, a                           ;$608d
ld a, a                           ;$608e
ld b, b                           ;$608f
ld a, a                           ;$6090
ld c, a                           ;$6091
ld a, h                           ;$6092
ld c, h                           ;$6093
ld a, h                           ;$6094
ld c, h                           ;$6095
ld a, h                           ;$6096
ld a, h                           ;$6097
nop                               ;$6098
nop                               ;$6099
nop                               ;$609a
nop                               ;$609b
ld hl, sp+$98                     ;$609c
ld hl, sp+$18                     ;$609e
ld hl, sp+$98                     ;$60a0
ld hl, sp+$98                     ;$60a2
ld hl, sp+$98                     ;$60a4
ld hl, sp+$f8                     ;$60a6
nop                               ;$60a8
nop                               ;$60a9
nop                               ;$60aa
nop                               ;$60ab
nop                               ;$60ac
nop                               ;$60ad
ld a, h                           ;$60ae
ld a, h                           ;$60af
ld c, [hl]                        ;$60b0
ld c, [hl]                        ;$60b1
ld c, [hl]                        ;$60b2
ld c, [hl]                        ;$60b3
ld c, [hl]                        ;$60b4
ld c, [hl]                        ;$60b5
ld c, [hl]                        ;$60b6
ld c, [hl]                        ;$60b7
ld a, h                           ;$60b8
ld a, h                           ;$60b9
nop                               ;$60ba
nop                               ;$60bb
nop                               ;$60bc
nop                               ;$60bd
ld a, [hl]                        ;$60be
ld a, [hl]                        ;$60bf
ld h, b                           ;$60c0
ld h, b                           ;$60c1
ld a, h                           ;$60c2
ld a, h                           ;$60c3
ld h, b                           ;$60c4
ld h, b                           ;$60c5
ld h, b                           ;$60c6
ld h, b                           ;$60c7
ld a, [hl]                        ;$60c8
ld a, [hl]                        ;$60c9
nop                               ;$60ca
nop                               ;$60cb
nop                               ;$60cc
nop                               ;$60cd
ld b, [hl]                        ;$60ce
ld b, [hl]                        ;$60cf
ld b, [hl]                        ;$60d0
ld b, [hl]                        ;$60d1
ld b, [hl]                        ;$60d2
ld b, [hl]                        ;$60d3
ld b, [hl]                        ;$60d4
ld b, [hl]                        ;$60d5
ld c, [hl]                        ;$60d6
ld c, [hl]                        ;$60d7
inc a                             ;$60d8
inc a                             ;$60d9
nop                               ;$60da
nop                               ;$60db
nop                               ;$60dc
nop                               ;$60dd
inc a                             ;$60de
inc a                             ;$60df
ld h, [hl]                        ;$60e0
ld h, [hl]                        ;$60e1
ld h, b                           ;$60e2
ld h, b                           ;$60e3
ld h, b                           ;$60e4
ld h, b                           ;$60e5
ld h, [hl]                        ;$60e6
ld h, [hl]                        ;$60e7
inc a                             ;$60e8
inc a                             ;$60e9
nop                               ;$60ea
nop                               ;$60eb
nop                               ;$60ec
nop                               ;$60ed
ld b, [hl]                        ;$60ee
ld b, [hl]                        ;$60ef
ld l, [hl]                        ;$60f0
ld l, [hl]                        ;$60f1
ld a, [hl]                        ;$60f2
ld a, [hl]                        ;$60f3
ld d, [hl]                        ;$60f4
ld d, [hl]                        ;$60f5
ld b, [hl]                        ;$60f6
ld b, [hl]                        ;$60f7
ld b, [hl]                        ;$60f8
ld b, [hl]                        ;$60f9
nop                               ;$60fa
nop                               ;$60fb
nop                               ;$60fc
nop                               ;$60fd
inc a                             ;$60fe
inc a                             ;$60ff
ld c, [hl]                        ;$6100
ld c, [hl]                        ;$6101
ld c, [hl]                        ;$6102
ld c, [hl]                        ;$6103
ld a, [hl]                        ;$6104
ld a, [hl]                        ;$6105
ld c, [hl]                        ;$6106
ld c, [hl]                        ;$6107
ld c, [hl]                        ;$6108
ld c, [hl]                        ;$6109
nop                               ;$610a
nop                               ;$610b
rst $38                           ;$610c
nop                               ;$610d
nop                               ;$610e
nop                               ;$610f
nop                               ;$6110
nop                               ;$6111
nop                               ;$6112
nop                               ;$6113
nop                               ;$6114
nop                               ;$6115
nop                               ;$6116
nop                               ;$6117
nop                               ;$6118
nop                               ;$6119
nop                               ;$611a
nop                               ;$611b
nop                               ;$611c
nop                               ;$611d
nop                               ;$611e
nop                               ;$611f
nop                               ;$6120
nop                               ;$6121
nop                               ;$6122
nop                               ;$6123
ld bc, $ff01                      ;$6124
ld bc, $ff01                      ;$6127
rst $38                           ;$612a
rst $38                           ;$612b
nop                               ;$612c
nop                               ;$612d
nop                               ;$612e
nop                               ;$612f
nop                               ;$6130
nop                               ;$6131
nop                               ;$6132
nop                               ;$6133
ldh a, [$fff0]                    ;$6134
ldh a, [$ffb0]                    ;$6136
ldh a, [$ffb0]                    ;$6138
ldh a, [$fff0]                    ;$613a
nop                               ;$613c
nop                               ;$613d
nop                               ;$613e
nop                               ;$613f
rlca                              ;$6140
rlca                              ;$6141
jr $6163                          ;$6142
jr nz, $6185                      ;$6144
jr nc, $6187                      ;$6146
jr $6161                          ;$6148
ccf                               ;$614a
inc l                             ;$614b
ld a, e                           ;$614c
ld c, a                           ;$614d
ld [hl], b                        ;$614e
ld e, a                           ;$614f
sub b                             ;$6150
sbc a                             ;$6151
sub b                             ;$6152
sbc a                             ;$6153
ld [hl], b                        ;$6154
ld a, a                           ;$6155
ld de, $3e1f                      ;$6156
ld a, $3e                         ;$6159
ld a, $00                         ;$615b
nop                               ;$615d
ld a, h                           ;$615e
ld a, h                           ;$615f
ld h, [hl]                        ;$6160
ld h, [hl]                        ;$6161
ld h, [hl]                        ;$6162
ld h, [hl]                        ;$6163
ld a, h                           ;$6164
ld a, h                           ;$6165
ld l, b                           ;$6166
ld l, b                           ;$6167
ld h, [hl]                        ;$6168
ld h, [hl]                        ;$6169
nop                               ;$616a
nop                               ;$616b
nop                               ;$616c
nop                               ;$616d
inc a                             ;$616e
inc a                             ;$616f
ld h, [hl]                        ;$6170
ld h, [hl]                        ;$6171
ld h, [hl]                        ;$6172
ld h, [hl]                        ;$6173
ld h, [hl]                        ;$6174
ld h, [hl]                        ;$6175
ld h, [hl]                        ;$6176
ld h, [hl]                        ;$6177
inc a                             ;$6178
inc a                             ;$6179
nop                               ;$617a
nop                               ;$617b
nop                               ;$617c
nop                               ;$617d
ld h, b                           ;$617e
ld h, b                           ;$617f
ld h, b                           ;$6180
ld h, b                           ;$6181
ld h, b                           ;$6182
ld h, b                           ;$6183
ld h, b                           ;$6184
ld h, b                           ;$6185
ld h, b                           ;$6186
ld h, b                           ;$6187
ld a, [hl]                        ;$6188
ld a, [hl]                        ;$6189
nop                               ;$618a
nop                               ;$618b
nop                               ;$618c
nop                               ;$618d
inc a                             ;$618e
inc a                             ;$618f
ld h, [hl]                        ;$6190
ld h, [hl]                        ;$6191
ld h, b                           ;$6192
ld h, b                           ;$6193
ld l, [hl]                        ;$6194
ld l, [hl]                        ;$6195
ld h, [hl]                        ;$6196
ld h, [hl]                        ;$6197
ld a, $3e                         ;$6198
nop                               ;$619a
nop                               ;$619b
nop                               ;$619c
xor $00                           ;$619d
nop                               ;$619f
rst $38                           ;$61a0
rst $38                           ;$61a1
rst $38                           ;$61a2
rst $38                           ;$61a3
rst $38                           ;$61a4
rst $38                           ;$61a5
rst $38                           ;$61a6
rst $38                           ;$61a7
rst $38                           ;$61a8
rst $38                           ;$61a9
rst $38                           ;$61aa
rst $38                           ;$61ab
nop                               ;$61ac
ld bc, $0200                      ;$61ad
nop                               ;$61b0
ld [bc], a                        ;$61b1
nop                               ;$61b2
inc b                             ;$61b3
nop                               ;$61b4
ld [$0800], sp                    ;$61b5
nop                               ;$61b8
stop                              ;$61b9
db $10 ;<corrupted stop>          ;$61bb
add b                             ;$61bc
add b                             ;$61bd
ret nz                            ;$61be
ld b, b                           ;$61bf
ret nz                            ;$61c0
ld b, b                           ;$61c1
ldh [$ff20], a                    ;$61c2
jr nc, $6216                      ;$61c4
jr nc, $6218                      ;$61c6
jr c, $6212                       ;$61c8
jr $61f4                          ;$61ca
nop                               ;$61cc
nop                               ;$61cd
nop                               ;$61ce
nop                               ;$61cf
nop                               ;$61d0
nop                               ;$61d1
nop                               ;$61d2
nop                               ;$61d3
nop                               ;$61d4
inc bc                            ;$61d5
nop                               ;$61d6
inc bc                            ;$61d7
nop                               ;$61d8
ld [bc], a                        ;$61d9
nop                               ;$61da
ld [bc], a                        ;$61db
nop                               ;$61dc
nop                               ;$61dd
nop                               ;$61de
nop                               ;$61df
nop                               ;$61e0
nop                               ;$61e1
nop                               ;$61e2
nop                               ;$61e3
ld [$08f8], sp                    ;$61e4
jr $61f1                          ;$61e7
xor b                             ;$61e9
ld [$0048], sp                    ;$61ea
add b                             ;$61ed
nop                               ;$61ee
add b                             ;$61ef
nop                               ;$61f0
add b                             ;$61f1
nop                               ;$61f2
add b                             ;$61f3
nop                               ;$61f4
nop                               ;$61f5
nop                               ;$61f6
nop                               ;$61f7
nop                               ;$61f8
nop                               ;$61f9
nop                               ;$61fa
nop                               ;$61fb
nop                               ;$61fc
jr nz, $61ff                      ;$61fd
jr nz, $6201                      ;$61ff
jr nz, $6222                      ;$6201
jr nz, $6205                      ;$6203
ld b, b                           ;$6205
nop                               ;$6206
ld b, b                           ;$6207
nop                               ;$6208
ld b, b                           ;$6209
nop                               ;$620a
ld b, b                           ;$620b
inc e                             ;$620c
inc h                             ;$620d
inc c                             ;$620e
inc [hl]                          ;$620f
inc c                             ;$6210
inc [hl]                          ;$6211
inc b                             ;$6212
db $fc ;<unknown instruction>     ;$6213
ld c, $32                         ;$6214
ld c, $32                         ;$6216
ld c, $32                         ;$6218
ld c, $32                         ;$621a
nop                               ;$621c
nop                               ;$621d
nop                               ;$621e
nop                               ;$621f
nop                               ;$6220
nop                               ;$6221
nop                               ;$6222
nop                               ;$6223
nop                               ;$6224
nop                               ;$6225
nop                               ;$6226
nop                               ;$6227
nop                               ;$6228
nop                               ;$6229
nop                               ;$622a
nop                               ;$622b
nop                               ;$622c
nop                               ;$622d
nop                               ;$622e
nop                               ;$622f
nop                               ;$6230
nop                               ;$6231
nop                               ;$6232
nop                               ;$6233
nop                               ;$6234
rra                               ;$6235
nop                               ;$6236
jr $6239                          ;$6237
dec d                             ;$6239
nop                               ;$623a
ld [de], a                        ;$623b
nop                               ;$623c
nop                               ;$623d
nop                               ;$623e
nop                               ;$623f
nop                               ;$6240
nop                               ;$6241
nop                               ;$6242
nop                               ;$6243
ld b, b                           ;$6244
ret nz                            ;$6245
ld b, b                           ;$6246
ret nz                            ;$6247
ld b, b                           ;$6248
ld b, b                           ;$6249
ld b, b                           ;$624a
ld b, b                           ;$624b
nop                               ;$624c
ld [bc], a                        ;$624d
nop                               ;$624e
inc bc                            ;$624f
nop                               ;$6250
ld [bc], a                        ;$6251
nop                               ;$6252
ld [bc], a                        ;$6253
nop                               ;$6254
ld [bc], a                        ;$6255
nop                               ;$6256
inc bc                            ;$6257
nop                               ;$6258
ld [bc], a                        ;$6259
nop                               ;$625a
ld [bc], a                        ;$625b
ld [$08af], sp                    ;$625c
ld a, [de]                        ;$625f
ld [$08ad], sp                    ;$6260
ld c, a                           ;$6263
ld [$08a8], sp                    ;$6264
jr $6271                          ;$6267
xor b                             ;$6269
ld [$0048], sp                    ;$626a
nop                               ;$626d
nop                               ;$626e
nop                               ;$626f
nop                               ;$6270
nop                               ;$6271
nop                               ;$6272
nop                               ;$6273
nop                               ;$6274
nop                               ;$6275
nop                               ;$6276
nop                               ;$6277
nop                               ;$6278
ld bc, $0200                      ;$6279
nop                               ;$627c
ld b, b                           ;$627d
dec d                             ;$627e
ld b, b                           ;$627f
dec d                             ;$6280
ld b, b                           ;$6281
dec d                             ;$6282
ld b, b                           ;$6283
dec d                             ;$6284
ret nz                            ;$6285
dec d                             ;$6286
pop bc                            ;$6287
rla                               ;$6288
ld b, e                           ;$6289
ld d, $46                         ;$628a
inc h                             ;$628c
inc c                             ;$628d
inc [hl]                          ;$628e
inc c                             ;$628f
inc [hl]                          ;$6290
inc b                             ;$6291
db $fc ;<unknown instruction>     ;$6292
ld c, $32                         ;$6293
ld c, $32                         ;$6295
ld c, $32                         ;$6297
ld c, $32                         ;$6299
nop                               ;$629b
nop                               ;$629c
nop                               ;$629d
nop                               ;$629e
nop                               ;$629f
nop                               ;$62a0
nop                               ;$62a1
nop                               ;$62a2
nop                               ;$62a3
nop                               ;$62a4
nop                               ;$62a5
nop                               ;$62a6
nop                               ;$62a7
nop                               ;$62a8
nop                               ;$62a9
nop                               ;$62aa
nop                               ;$62ab
nop                               ;$62ac
nop                               ;$62ad
nop                               ;$62ae
nop                               ;$62af
nop                               ;$62b0
ldi a, [hl]                       ;$62b1
jr nz, $62b5                      ;$62b2
nop                               ;$62b4
dec e                             ;$62b5
ld bc, $0009                      ;$62b6
rlca                              ;$62b9
ld bc, $000b                      ;$62ba
inc bc                            ;$62bd
jr nz, $62c4                      ;$62be
nop                               ;$62c0
jr nz, $62e3                      ;$62c1
ld b, $00                         ;$62c3
ld a, [bc]                        ;$62c5
add b                             ;$62c6
rla                               ;$62c7
nop                               ;$62c8
ld b, $01                         ;$62c9
ld b, $00                         ;$62cb
inc b                             ;$62cd
ld bc, $0005                      ;$62ce
ld e, $80                         ;$62d1
dec bc                            ;$62d3
nop                               ;$62d4
ld b, $80                         ;$62d5
inc e                             ;$62d7
nop                               ;$62d8
ld a, [bc]                        ;$62d9
db $10 ;<corrupted stop>          ;$62da
ld [$0411], sp                    ;$62db
ld bc, $0002                      ;$62de
inc b                             ;$62e1
ld bc, $0006                      ;$62e2
nop                               ;$62e5
db $10 ;<corrupted stop>          ;$62e6
ld b, $00                         ;$62e7
inc b                             ;$62e9
db $10 ;<corrupted stop>          ;$62ea
dec b                             ;$62eb
nop                               ;$62ec
ld a, [de]                        ;$62ed
add b                             ;$62ee
inc h                             ;$62ef
nop                               ;$62f0
dec d                             ;$62f1
ld bc, $0007                      ;$62f2
jr nz, $6307                      ;$62f5
inc b                             ;$62f7
nop                               ;$62f8
dec b                             ;$62f9
db $10 ;<corrupted stop>          ;$62fa
inc bc                            ;$62fb
nop                               ;$62fc
dec c                             ;$62fd
db $10 ;<corrupted stop>          ;$62fe
ld b, $00                         ;$62ff
inc bc                            ;$6301
db $10 ;<corrupted stop>          ;$6302
dec b                             ;$6303
nop                               ;$6304
dec h                             ;$6305
add b                             ;$6306
dec d                             ;$6307
nop                               ;$6308
dec de                            ;$6309
db $10 ;<corrupted stop>          ;$630a
inc b                             ;$630b
nop                               ;$630c
inc de                            ;$630d
add b                             ;$630e
inc bc                            ;$630f
nop                               ;$6310
inc e                             ;$6311
add b                             ;$6312
add hl, de                        ;$6313
nop                               ;$6314
ld a, [de]                        ;$6315
ld bc, $0006                      ;$6316
ld a, [bc]                        ;$6319
jr nz, $631d                      ;$631a
nop                               ;$631c
add hl, bc                        ;$631d
jr nz, $6322                      ;$631e
nop                               ;$6320
inc d                             ;$6321
db $10 ;<corrupted stop>          ;$6322
inc bc                            ;$6323
nop                               ;$6324
ld c, $80                         ;$6325
ld d, $00                         ;$6327
ld a, [bc]                        ;$6329
db $10 ;<corrupted stop>          ;$632a
ld a, [bc]                        ;$632b
ld de, $1006                      ;$632c
ld d, $00                         ;$632f
inc de                            ;$6331
add b                             ;$6332
dec h                             ;$6333
nop                               ;$6334
inc e                             ;$6335
ld bc, $0006                      ;$6336
inc bc                            ;$6339
jr nz, $633e                      ;$633a
nop                               ;$633c
ld c, $20                         ;$633d
inc bc                            ;$633f
nop                               ;$6340
inc b                             ;$6341
jr nz, $6346                      ;$6342
nop                               ;$6344
inc bc                            ;$6345
jr nz, $634d                      ;$6346
nop                               ;$6348
dec c                             ;$6349
add b                             ;$634a
ld hl, $1300                      ;$634b
ld bc, $0007                      ;$634e
dec b                             ;$6351
ld bc, $0006                      ;$6352
inc b                             ;$6355
ld bc, $0005                      ;$6356
ld b, $20                         ;$6359
inc bc                            ;$635b
nop                               ;$635c
dec b                             ;$635d
jr nz, $6362                      ;$635e
nop                               ;$6360
inc e                             ;$6361
jr nz, $6367                      ;$6362
nop                               ;$6364
ld c, $80                         ;$6365
ld [de], a                        ;$6367
nop                               ;$6368
inc c                             ;$6369
db $10 ;<corrupted stop>          ;$636a
inc b                             ;$636b
nop                               ;$636c
ld [bc], a                        ;$636d
ld bc, $0008                      ;$636e
db $10 ;<corrupted stop>          ;$6371
ld bc, $0008                      ;$6372
ld e, $80                         ;$6375
add hl, de                        ;$6377
nop                               ;$6378
db $10 ;<corrupted stop>          ;$6379
db $10 ;<corrupted stop>          ;$637a
inc bc                            ;$637b
nop                               ;$637c
inc b                             ;$637d
db $10 ;<corrupted stop>          ;$637e
dec b                             ;$637f
nop                               ;$6380
inc h                             ;$6381
add b                             ;$6382
inc e                             ;$6383
nop                               ;$6384
dec b                             ;$6385
ld bc, $0005                      ;$6386
ld de, $0320                      ;$6389
nop                               ;$638c
ld [de], a                        ;$638d
add b                             ;$638e
jr nz, $6391                      ;$638f
ld a, [bc]                        ;$6391
db $10 ;<corrupted stop>          ;$6392
ld bc, $0611                      ;$6393
ld bc, $0000                      ;$6396
inc b                             ;$6399
db $10 ;<corrupted stop>          ;$639a
inc b                             ;$639b
nop                               ;$639c
inc b                             ;$639d
db $10 ;<corrupted stop>          ;$639e
inc bc                            ;$639f
nop                               ;$63a0
ld [bc], a                        ;$63a1
db $10 ;<corrupted stop>          ;$63a2
add hl, de                        ;$63a3
nop                               ;$63a4
inc b                             ;$63a5
db $10 ;<corrupted stop>          ;$63a6
rlca                              ;$63a7
nop                               ;$63a8
ld a, [bc]                        ;$63a9
nop                               ;$63aa
nop                               ;$63ab
nop                               ;$63ac
nop                               ;$63ad
nop                               ;$63ae
nop                               ;$63af
nop                               ;$63b0
ld c, l                           ;$63b1
jr nz, $63bc                      ;$63b2
ld hl, $2006                      ;$63b4
dec bc                            ;$63b7
nop                               ;$63b8
rlca                              ;$63b9
jr nz, $63c2                      ;$63ba
nop                               ;$63bc
ld h, h                           ;$63bd
stop                              ;$63be
ld de, $1006                      ;$63c0
dec b                             ;$63c3
nop                               ;$63c4
cpl                               ;$63c5
add b                             ;$63c6
ld d, $00                         ;$63c7
rla                               ;$63c9
jr nz, $63d1                      ;$63ca
nop                               ;$63cc
ld b, $20                         ;$63cd
ld b, $00                         ;$63cf
db $10 ;<corrupted stop>          ;$63d1
add b                             ;$63d2
jr $63d5                          ;$63d3
inc [hl]                          ;$63d5
ld bc, $0005                      ;$63d6
ld bc, $0e10                      ;$63d9
ld de, $1006                      ;$63dc
jr nz, $63e1                      ;$63df
ld a, [bc]                        ;$63e1
add b                             ;$63e2
ld a, [bc]                        ;$63e3
nop                               ;$63e4
dec hl                            ;$63e5
jr nz, $63ee                      ;$63e6
nop                               ;$63e8
ld b, $20                         ;$63e9
dec b                             ;$63eb
nop                               ;$63ec
dec b                             ;$63ed
jr nz, $63f6                      ;$63ee
nop                               ;$63f0
ld a, [bc]                        ;$63f1
add b                             ;$63f2
inc c                             ;$63f3
nop                               ;$63f4
ld a, [bc]                        ;$63f5
ld bc, $0007                      ;$63f6
ld [bc], a                        ;$63f9
db $10 ;<corrupted stop>          ;$63fa
dec bc                            ;$63fb
nop                               ;$63fc
dec b                             ;$63fd
db $10 ;<corrupted stop>          ;$63fe
inc b                             ;$63ff
nop                               ;$6400
dec c                             ;$6401
add b                             ;$6402
inc e                             ;$6403
nop                               ;$6404
ld [hl], l                        ;$6405
ld bc, $0006                      ;$6406
ld c, $80                         ;$6409
rra                               ;$640b
nop                               ;$640c
ld a, [de]                        ;$640d
ld bc, $0006                      ;$640e
nop                               ;$6411
db $10 ;<corrupted stop>          ;$6412
rlca                              ;$6413
nop                               ;$6414
dec b                             ;$6415
db $10 ;<corrupted stop>          ;$6416
ld b, $00                         ;$6417
inc b                             ;$6419
db $10 ;<corrupted stop>          ;$641a
ld [$0300], sp                    ;$641b
db $10 ;<corrupted stop>          ;$641e
ld [$0c00], sp                    ;$641f
add b                             ;$6422
rrca                              ;$6423
nop                               ;$6424
ld a, [bc]                        ;$6425
ld bc, $0007                      ;$6426
nop                               ;$6429
db $10 ;<corrupted stop>          ;$642a
dec a                             ;$642b
nop                               ;$642c
dec b                             ;$642d
add b                             ;$642e
rra                               ;$642f
nop                               ;$6430
nop                               ;$6431
nop                               ;$6432
nop                               ;$6433
nop                               ;$6434
nop                               ;$6435
nop                               ;$6436
nop                               ;$6437
nop                               ;$6438
nop                               ;$6439
nop                               ;$643a
nop                               ;$643b
nop                               ;$643c
nop                               ;$643d
nop                               ;$643e
nop                               ;$643f
nop                               ;$6440
nop                               ;$6441
nop                               ;$6442
nop                               ;$6443
nop                               ;$6444
nop                               ;$6445
nop                               ;$6446
nop                               ;$6447
nop                               ;$6448
nop                               ;$6449
nop                               ;$644a
nop                               ;$644b
nop                               ;$644c
nop                               ;$644d
nop                               ;$644e
nop                               ;$644f
db $10 ;<corrupted stop>          ;$6450
jr $6453                          ;$6451
inc b                             ;$6453
ld [$0400], sp                    ;$6454
ld [$0008], sp                    ;$6457
inc b                             ;$645a
inc d                             ;$645b
db $10 ;<corrupted stop>          ;$645c
ld [$1010], sp                    ;$645d
inc d                             ;$6460
jr $6477                          ;$6461
nop                               ;$6463
inc c                             ;$6464
inc b                             ;$6465
jr $6468                          ;$6466
inc d                             ;$6468
inc d                             ;$6469
ld [$0404], sp                    ;$646a
inc c                             ;$646d
nop                               ;$646e
jr $6475                          ;$646f
nop                               ;$6471
ld [$0c0c], sp                    ;$6472
jr $6477                          ;$6475
inc c                             ;$6477
ld [$1800], sp                    ;$6478
db $10 ;<corrupted stop>          ;$647b
inc d                             ;$647c
inc d                             ;$647d
jr $6488                          ;$647e
xor d                             ;$6480
ld h, l                           ;$6481
add a, $65                        ;$6482
db $fc ;<unknown instruction>     ;$6484
ld h, [hl]                        ;$6485
jr z, $64ee                       ;$6486
inc [hl]                          ;$6488
ld h, a                           ;$6489
xor a                             ;$648a
ld h, [hl]                        ;$648b
pop af                            ;$648c
ld h, l                           ;$648d
ld d, h                           ;$648e
ld h, [hl]                        ;$648f
or d                              ;$6490
ld h, l                           ;$6491
adc a, $65                        ;$6492
inc d                             ;$6494
ld h, a                           ;$6495
adc a, $65                        ;$6496
adc a, $65                        ;$6498
jp $f766                          ;$649a
ld h, l                           ;$649d
ld h, b                           ;$649e
ld h, [hl]                        ;$649f
call nc, $dc67                    ;$64a0
ld h, a                           ;$64a3
sbc l                             ;$64a4
ld h, a                           ;$64a5
and l                             ;$64a6
ld h, a                           ;$64a7
db $e4 ;<unknown instruction>     ;$64a8
ld h, a                           ;$64a9
db $e4 ;<unknown instruction>     ;$64aa
ld h, a                           ;$64ab
db $e4 ;<unknown instruction>     ;$64ac
ld h, a                           ;$64ad
xor l                             ;$64ae
ld h, a                           ;$64af
ccf                               ;$64b0
ld l, a                           ;$64b1
ld c, d                           ;$64b2
ld l, a                           ;$64b3
ld d, l                           ;$64b4
ld l, a                           ;$64b5
ld h, b                           ;$64b6
ld l, a                           ;$64b7
ld l, e                           ;$64b8
ld l, a                           ;$64b9
halt                              ;$64ba
ld l, a                           ;$64bb
add c                             ;$64bc
ld l, a                           ;$64bd
adc h                             ;$64be
ld l, a                           ;$64bf
sub a                             ;$64c0
ld l, a                           ;$64c1
and d                             ;$64c2
ld l, a                           ;$64c3
xor l                             ;$64c4
ld l, a                           ;$64c5
cp b                              ;$64c6
ld l, a                           ;$64c7
jp $ce6f                          ;$64c8
ld l, a                           ;$64cb
reti                              ;$64cc
ld l, a                           ;$64cd
db $e4 ;<unknown instruction>     ;$64ce
ld l, a                           ;$64cf
rst $28                           ;$64d0
ld l, a                           ;$64d1
ret                               ;$64d2
push af                           ;$64d3
push bc                           ;$64d4
push de                           ;$64d5
push hl                           ;$64d6
ld a, [$df7f]                     ;$64d7
cp $01                            ;$64da
jr z, $6524                       ;$64dc
cp $02                            ;$64de
jr z, $655d                       ;$64e0
ld a, [$df7e]                     ;$64e2
and a                             ;$64e5
jr nz, $6563                      ;$64e6
ldh a, [$ffe4]                    ;$64e8
and a                             ;$64ea
jr z, $64fa                       ;$64eb
xor a                             ;$64ed
ld [$dfe0], a                     ;$64ee
ld [$dfe8], a                     ;$64f1
ld [$dff0], a                     ;$64f4
ld [$dff8], a                     ;$64f7
call $64d2                        ;$64fa
call $69dd                        ;$64fd
call $69fd                        ;$6500
call $683c                        ;$6503
call $6a21                        ;$6506
call $6c44                        ;$6509
call $6a65                        ;$650c
xor a                             ;$650f
ld [$dfe0], a                     ;$6510
ld [$dfe8], a                     ;$6513
ld [$dff0], a                     ;$6516
ld [$dff8], a                     ;$6519
ld [$df7f], a                     ;$651c
pop hl                            ;$651f
pop de                            ;$6520
pop bc                            ;$6521
pop af                            ;$6522
ret                               ;$6523
call $69c7                        ;$6524
xor a                             ;$6527
ld [$dfe1], a                     ;$6528
ld [$dff1], a                     ;$652b
ld [$dff9], a                     ;$652e
ld hl, $dfbf                      ;$6531
res 7, [hl]                       ;$6534
ld hl, $df9f                      ;$6536
res 7, [hl]                       ;$6539
ld hl, $dfaf                      ;$653b
res 7, [hl]                       ;$653e
ld hl, $dfcf                      ;$6540
res 7, [hl]                       ;$6543
ld hl, $6ee9                      ;$6545
call $6998                        ;$6548
ld a, $30                         ;$654b
ld [$df7e], a                     ;$654d
ld hl, $657b                      ;$6550
call $695d                        ;$6553
jr $650f                          ;$6556
ld hl, $657f                      ;$6558
jr $6553                          ;$655b
xor a                             ;$655d
ld [$df7e], a                     ;$655e
jr $64e8                          ;$6561
ld hl, $df7e                      ;$6563
dec [hl]                          ;$6566
ld a, [hl]                        ;$6567
cp $28                            ;$6568
jr z, $6558                       ;$656a
cp $20                            ;$656c
jr z, $6550                       ;$656e
cp $18                            ;$6570
jr z, $6558                       ;$6572
cp $10                            ;$6574
jr nz, $650f                      ;$6576
inc [hl]                          ;$6578
jr $650f                          ;$6579
or d                              ;$657b
db $e3 ;<unknown instruction>     ;$657c
add e                             ;$657d
rst $00                           ;$657e
or d                              ;$657f
db $e3 ;<unknown instruction>     ;$6580
pop bc                            ;$6581
rst $00                           ;$6582
ld a, [$dff1]                     ;$6583
cp $01                            ;$6586
ret                               ;$6588
ld a, [$dfe1]                     ;$6589
cp $05                            ;$658c
ret                               ;$658e
ld a, [$dfe1]                     ;$658f
cp $07                            ;$6592
ret                               ;$6594
ld a, [$dfe1]                     ;$6595
cp $08                            ;$6598
ret                               ;$659a
nop                               ;$659b
or l                              ;$659c
ret nc                            ;$659d
ld b, b                           ;$659e
rst $00                           ;$659f
nop                               ;$65a0
or l                              ;$65a1
jr nz, $65e4                      ;$65a2
rst $00                           ;$65a4
nop                               ;$65a5
or [hl]                           ;$65a6
and c                             ;$65a7
add b                             ;$65a8
rst $00                           ;$65a9
ld a, $05                         ;$65aa
ld hl, $659b                      ;$65ac
jp $6936                          ;$65af
call $698b                        ;$65b2
and a                             ;$65b5
ret nz                            ;$65b6
ld hl, $dfe4                      ;$65b7
inc [hl]                          ;$65ba
ld a, [hl]                        ;$65bb
cp $02                            ;$65bc
jr z, $65d3                       ;$65be
ld hl, $65a0                      ;$65c0
jp $6956                          ;$65c3
ld a, $03                         ;$65c6
ld hl, $65a5                      ;$65c8
jp $6936                          ;$65cb
call $698b                        ;$65ce
and a                             ;$65d1
ret nz                            ;$65d2
xor a                             ;$65d3
ld [$dfe1], a                     ;$65d4
ldh [$ff10], a                    ;$65d7
ld a, $08                         ;$65d9
ldh [$ff12], a                    ;$65db
ld a, $80                         ;$65dd
ldh [$ff14], a                    ;$65df
ld hl, $df9f                      ;$65e1
res 7, [hl]                       ;$65e4
ret                               ;$65e6
nop                               ;$65e7
add b                             ;$65e8
pop hl                            ;$65e9
pop bc                            ;$65ea
add a                             ;$65eb
nop                               ;$65ec
add b                             ;$65ed
pop hl                            ;$65ee
xor h                             ;$65ef
add a                             ;$65f0
ld hl, $65e7                      ;$65f1
jp $6936                          ;$65f4
ld hl, $dfe4                      ;$65f7
inc [hl]                          ;$65fa
ld a, [hl]                        ;$65fb
cp $04                            ;$65fc
jr z, $6617                       ;$65fe
cp $0b                            ;$6600
jr z, $661d                       ;$6602
cp $0f                            ;$6604
jr z, $6617                       ;$6606
cp $18                            ;$6608
jp z, $660e                       ;$660a
ret                               ;$660d
ld a, $01                         ;$660e
ld hl, $dff0                      ;$6610
ld [hl], a                        ;$6613
jp $65d3                          ;$6614
ld hl, $65ec                      ;$6617
jp $6956                          ;$661a
ld hl, $65e7                      ;$661d
jp $6956                          ;$6620
ld c, b                           ;$6623
cp h                              ;$6624
ld b, d                           ;$6625
ld h, [hl]                        ;$6626
add a                             ;$6627
call $6583                        ;$6628
ret z                             ;$662b
call $6595                        ;$662c
ret z                             ;$662f
call $658f                        ;$6630
ret z                             ;$6633
call $6589                        ;$6634
ret z                             ;$6637
ld a, $02                         ;$6638
ld hl, $6623                      ;$663a
jp $6936                          ;$663d
nop                               ;$6640
or b                              ;$6641
pop af                            ;$6642
or [hl]                           ;$6643
rst $00                           ;$6644
nop                               ;$6645
or b                              ;$6646
pop af                            ;$6647
call nz, $00c7                    ;$6648
or b                              ;$664b
pop af                            ;$664c
adc a, $c7                        ;$664d
nop                               ;$664f
or b                              ;$6650
pop af                            ;$6651
db $db ;<unknown instruction>     ;$6652
rst $00                           ;$6653
call $658f                        ;$6654
ret z                             ;$6657
ld a, $07                         ;$6658
ld hl, $6640                      ;$665a
jp $6936                          ;$665d
call $698b                        ;$6660
and a                             ;$6663
ret nz                            ;$6664
ld hl, $dfe4                      ;$6665
inc [hl]                          ;$6668
ld a, [hl]                        ;$6669
cp $01                            ;$666a
jr z, $6680                       ;$666c
cp $02                            ;$666e
jr z, $6685                       ;$6670
cp $03                            ;$6672
jr z, $668a                       ;$6674
cp $04                            ;$6676
jr z, $668f                       ;$6678
cp $05                            ;$667a
jp z, $65d3                       ;$667c
ret                               ;$667f
ld hl, $6645                      ;$6680
jr $6692                          ;$6683
ld hl, $664a                      ;$6685
jr $6692                          ;$6688
ld hl, $664f                      ;$668a
jr $6692                          ;$668d
ld hl, $6640                      ;$668f
jp $6956                          ;$6692
ld a, $80                         ;$6695
db $e3 ;<unknown instruction>     ;$6697
nop                               ;$6698
call nz, $8393                    ;$6699
add e                             ;$669c
ld [hl], e                        ;$669d
ld h, e                           ;$669e
ld d, e                           ;$669f
ld b, e                           ;$66a0
inc sp                            ;$66a1
inc hl                            ;$66a2
inc de                            ;$66a3
nop                               ;$66a4
nop                               ;$66a5
inc hl                            ;$66a6
ld b, e                           ;$66a7
ld h, e                           ;$66a8
add e                             ;$66a9
and e                             ;$66aa
jp $e3d3                          ;$66ab
rst $38                           ;$66ae
call $6583                        ;$66af
ret z                             ;$66b2
call $6595                        ;$66b3
ret z                             ;$66b6
call $658f                        ;$66b7
ret z                             ;$66ba
ld a, $06                         ;$66bb
ld hl, $6695                      ;$66bd
jp $6936                          ;$66c0
call $698b                        ;$66c3
and a                             ;$66c6
ret nz                            ;$66c7
ld hl, $dfe4                      ;$66c8
ld c, [hl]                        ;$66cb
inc [hl]                          ;$66cc
ld b, $00                         ;$66cd
ld hl, $669a                      ;$66cf
add hl, bc                        ;$66d2
ld a, [hl]                        ;$66d3
and a                             ;$66d4
jp z, $65d3                       ;$66d5
ld e, a                           ;$66d8
ld hl, $66a5                      ;$66d9
add hl, bc                        ;$66dc
ld a, [hl]                        ;$66dd
ld d, a                           ;$66de
ld b, $86                         ;$66df
ld c, $12                         ;$66e1
ld a, e                           ;$66e3
ld [$ff00+c], a                   ;$66e4
inc c                             ;$66e5
ld a, d                           ;$66e6
ld [$ff00+c], a                   ;$66e7
inc c                             ;$66e8
ld a, b                           ;$66e9
ld [$ff00+c], a                   ;$66ea
ret                               ;$66eb
dec sp                            ;$66ec
add b                             ;$66ed
or d                              ;$66ee
add a                             ;$66ef
add a                             ;$66f0
and d                             ;$66f1
sub e                             ;$66f2
ld h, d                           ;$66f3
ld b, e                           ;$66f4
inc hl                            ;$66f5
nop                               ;$66f6
add b                             ;$66f7
ld b, b                           ;$66f8
add b                             ;$66f9
ld b, b                           ;$66fa
add b                             ;$66fb
call $6583                        ;$66fc
ret z                             ;$66ff
call $6595                        ;$6700
ret z                             ;$6703
call $658f                        ;$6704
ret z                             ;$6707
call $6589                        ;$6708
ret z                             ;$670b
ld a, $03                         ;$670c
ld hl, $66ec                      ;$670e
jp $6936                          ;$6711
call $698b                        ;$6714
and a                             ;$6717
ret nz                            ;$6718
ld hl, $dfe4                      ;$6719
ld c, [hl]                        ;$671c
inc [hl]                          ;$671d
ld b, $00                         ;$671e
ld hl, $66f1                      ;$6720
add hl, bc                        ;$6723
ld a, [hl]                        ;$6724
and a                             ;$6725
jp z, $65d3                       ;$6726
ld e, a                           ;$6729
ld hl, $66f7                      ;$672a
add hl, bc                        ;$672d
ld a, [hl]                        ;$672e
ld d, a                           ;$672f
ld b, $87                         ;$6730
jr $66e1                          ;$6732
call $658f                        ;$6734
ret z                             ;$6737
ld a, $28                         ;$6738
ld hl, $6740                      ;$673a
jp $6936                          ;$673d
or a                              ;$6740
add b                             ;$6741
sub b                             ;$6742
rst $38                           ;$6743
add e                             ;$6744
nop                               ;$6745
pop de                            ;$6746
ld b, l                           ;$6747
add b                             ;$6748
nop                               ;$6749
pop af                            ;$674a
ld d, h                           ;$674b
add b                             ;$674c
nop                               ;$674d
push de                           ;$674e
ld h, l                           ;$674f
add b                             ;$6750
nop                               ;$6751
ld [hl], b                        ;$6752
ld h, [hl]                        ;$6753
add b                             ;$6754
ld h, l                           ;$6755
ld h, l                           ;$6756
ld h, l                           ;$6757
ld h, h                           ;$6758
ld d, a                           ;$6759
ld d, [hl]                        ;$675a
ld d, l                           ;$675b
ld d, h                           ;$675c
ld d, h                           ;$675d
ld d, h                           ;$675e
ld d, h                           ;$675f
ld d, h                           ;$6760
ld b, a                           ;$6761
ld b, [hl]                        ;$6762
ld b, [hl]                        ;$6763
ld b, l                           ;$6764
ld b, l                           ;$6765
ld b, l                           ;$6766
ld b, h                           ;$6767
ld b, h                           ;$6768
ld b, h                           ;$6769
inc [hl]                          ;$676a
inc [hl]                          ;$676b
inc [hl]                          ;$676c
inc [hl]                          ;$676d
inc [hl]                          ;$676e
inc [hl]                          ;$676f
inc [hl]                          ;$6770
inc [hl]                          ;$6771
inc [hl]                          ;$6772
inc [hl]                          ;$6773
inc [hl]                          ;$6774
inc [hl]                          ;$6775
inc [hl]                          ;$6776
inc [hl]                          ;$6777
inc [hl]                          ;$6778
ld [hl], b                        ;$6779
ld h, b                           ;$677a
ld [hl], b                        ;$677b
ld [hl], b                        ;$677c
ld [hl], b                        ;$677d
add b                             ;$677e
sub b                             ;$677f
and b                             ;$6780
ret nc                            ;$6781
ldh a, [$ffe0]                    ;$6782
ret nc                            ;$6784
ret nz                            ;$6785
or b                              ;$6786
and b                             ;$6787
sub b                             ;$6788
add b                             ;$6789
ld [hl], b                        ;$678a
ld h, b                           ;$678b
ld d, b                           ;$678c
ld b, b                           ;$678d
jr nc, $67c0                      ;$678e
jr nz, $67b2                      ;$6790
jr nz, $67b4                      ;$6792
jr nz, $67b6                      ;$6794
jr nz, $67b8                      ;$6796
jr nz, $67ba                      ;$6798
jr nz, $67ac                      ;$679a
db $10 ;<corrupted stop>          ;$679c
ld a, $30                         ;$679d
ld hl, $674d                      ;$679f
jp $6936                          ;$67a2
ld a, $30                         ;$67a5
ld hl, $6751                      ;$67a7
jp $6936                          ;$67aa
call $698b                        ;$67ad
and a                             ;$67b0
ret nz                            ;$67b1
ld hl, $dffc                      ;$67b2
ld a, [hl]                        ;$67b5
ld c, a                           ;$67b6
cp $24                            ;$67b7
jp z, $67e9                       ;$67b9
inc [hl]                          ;$67bc
ld b, $00                         ;$67bd
push bc                           ;$67bf
ld hl, $6755                      ;$67c0
add hl, bc                        ;$67c3
ld a, [hl]                        ;$67c4
ldh [$ff22], a                    ;$67c5
pop bc                            ;$67c7
ld hl, $6779                      ;$67c8
add hl, bc                        ;$67cb
ld a, [hl]                        ;$67cc
ldh [$ff21], a                    ;$67cd
ld a, $80                         ;$67cf
ldh [$ff23], a                    ;$67d1
ret                               ;$67d3
ld a, $20                         ;$67d4
ld hl, $6749                      ;$67d6
jp $6936                          ;$67d9
ld a, $12                         ;$67dc
ld hl, $6745                      ;$67de
jp $6936                          ;$67e1
call $698b                        ;$67e4
and a                             ;$67e7
ret nz                            ;$67e8
xor a                             ;$67e9
ld [$dff9], a                     ;$67ea
ld a, $08                         ;$67ed
ldh [$ff21], a                    ;$67ef
ld a, $80                         ;$67f1
ldh [$ff23], a                    ;$67f3
ld hl, $dfcf                      ;$67f5
res 7, [hl]                       ;$67f8
ret                               ;$67fa
add b                             ;$67fb
ldd a, [hl]                       ;$67fc
jr nz, $685f                      ;$67fd
add a, $21                        ;$67ff
reti                              ;$6801
ld l, [hl]                        ;$6802
call $690d                        ;$6803
ldh a, [$ff04]                    ;$6806
and a, $1f                        ;$6808
ld b, a                           ;$680a
ld a, $d0                         ;$680b
add b                             ;$680d
ld [$dff5], a                     ;$680e
ld hl, $67fb                      ;$6811
jp $6964                          ;$6814
ldh a, [$ff04]                    ;$6817
and a, $0f                        ;$6819
ld b, a                           ;$681b
ld hl, $dff4                      ;$681c
inc [hl]                          ;$681f
ld a, [hl]                        ;$6820
ld hl, $dff5                      ;$6821
cp $0e                            ;$6824
jr nc, $6832                      ;$6826
inc [hl]                          ;$6828
inc [hl]                          ;$6829
ld a, [hl]                        ;$682a
and a, $f0                        ;$682b
or b                              ;$682d
ld c, $1d                         ;$682e
ld [$ff00+c], a                   ;$6830
ret                               ;$6831
cp $1e                            ;$6832
jp z, $68e2                       ;$6834
dec [hl]                          ;$6837
dec [hl]                          ;$6838
dec [hl]                          ;$6839
jr $682a                          ;$683a
ld a, [$dff0]                     ;$683c
cp $01                            ;$683f
jp z, $686b                       ;$6841
cp $02                            ;$6844
jp z, $6800                       ;$6846
ld a, [$dff1]                     ;$6849
cp $01                            ;$684c
jp z, $68b6                       ;$684e
cp $02                            ;$6851
jp z, $6817                       ;$6853
ret                               ;$6856
add b                             ;$6857
add b                             ;$6858
jr nz, $67f8                      ;$6859
add a                             ;$685b
add b                             ;$685c
ld hl, sp+$20                     ;$685d
sbc b                             ;$685f
add a                             ;$6860
add b                             ;$6861
ei                                ;$6862
jr nz, $67fb                      ;$6863
add a                             ;$6865
add b                             ;$6866
or $20                            ;$6867
sub l                             ;$6869
add a                             ;$686a
ld hl, $6ea9                      ;$686b
call $690d                        ;$686e
ld hl, $685a                      ;$6871
ld a, [hl]                        ;$6874
ld [$dff6], a                     ;$6875
ld a, $01                         ;$6878
ld [$dff5], a                     ;$687a
ld hl, $6857                      ;$687d
jp $6964                          ;$6880
ld a, $00                         ;$6883
ld [$dff5], a                     ;$6885
ld hl, $685f                      ;$6888
ld a, [hl]                        ;$688b
ld [$dff6], a                     ;$688c
ld hl, $685c                      ;$688f
jr $6880                          ;$6892
ld a, $01                         ;$6894
ld [$dff5], a                     ;$6896
ld hl, $6864                      ;$6899
ld a, [hl]                        ;$689c
ld [$dff6], a                     ;$689d
ld hl, $6861                      ;$68a0
jr $6880                          ;$68a3
ld a, $02                         ;$68a5
ld [$dff5], a                     ;$68a7
ld hl, $6869                      ;$68aa
ld a, [hl]                        ;$68ad
ld [$dff6], a                     ;$68ae
ld hl, $6866                      ;$68b1
jr $6880                          ;$68b4
ld hl, $dff4                      ;$68b6
inc [hl]                          ;$68b9
ldi a, [hl]                       ;$68ba
cp $09                            ;$68bb
jr z, $6883                       ;$68bd
cp $13                            ;$68bf
jr z, $6894                       ;$68c1
cp $17                            ;$68c3
jr z, $68a5                       ;$68c5
cp $20                            ;$68c7
jr z, $68e2                       ;$68c9
ldi a, [hl]                       ;$68cb
cp $00                            ;$68cc
ret z                             ;$68ce
cp $01                            ;$68cf
jr z, $68d8                       ;$68d1
cp $02                            ;$68d3
jr z, $68dc                       ;$68d5
ret                               ;$68d7
inc [hl]                          ;$68d8
inc [hl]                          ;$68d9
jr $68de                          ;$68da
dec [hl]                          ;$68dc
dec [hl]                          ;$68dd
ld a, [hl]                        ;$68de
ldh [$ff1d], a                    ;$68df
ret                               ;$68e1
xor a                             ;$68e2
ld [$dff1], a                     ;$68e3
ldh [$ff1a], a                    ;$68e6
ld hl, $dfbf                      ;$68e8
res 7, [hl]                       ;$68eb
ld hl, $df9f                      ;$68ed
res 7, [hl]                       ;$68f0
ld hl, $dfaf                      ;$68f2
res 7, [hl]                       ;$68f5
ld hl, $dfcf                      ;$68f7
res 7, [hl]                       ;$68fa
ld a, [$dfe9]                     ;$68fc
cp $05                            ;$68ff
jr z, $6908                       ;$6901
ld hl, $6ee9                      ;$6903
jr $6932                          ;$6906
ld hl, $6ec9                      ;$6908
jr $6932                          ;$690b
push hl                           ;$690d
ld [$dff1], a                     ;$690e
ld hl, $dfbf                      ;$6911
set 7, [hl]                       ;$6914
xor a                             ;$6916
ld [$dff4], a                     ;$6917
ld [$dff5], a                     ;$691a
ld [$dff6], a                     ;$691d
ldh [$ff1a], a                    ;$6920
ld hl, $df9f                      ;$6922
set 7, [hl]                       ;$6925
ld hl, $dfaf                      ;$6927
set 7, [hl]                       ;$692a
ld hl, $dfcf                      ;$692c
set 7, [hl]                       ;$692f
pop hl                            ;$6931
call $6998                        ;$6932
ret                               ;$6935
push af                           ;$6936
dec e                             ;$6937
ld a, [$df71]                     ;$6938
ld [de], a                        ;$693b
inc e                             ;$693c
pop af                            ;$693d
inc e                             ;$693e
ld [de], a                        ;$693f
dec e                             ;$6940
xor a                             ;$6941
ld [de], a                        ;$6942
inc e                             ;$6943
inc e                             ;$6944
ld [de], a                        ;$6945
inc e                             ;$6946
ld [de], a                        ;$6947
ld a, e                           ;$6948
cp $e5                            ;$6949
jr z, $6956                       ;$694b
cp $f5                            ;$694d
jr z, $6964                       ;$694f
cp $fd                            ;$6951
jr z, $696b                       ;$6953
ret                               ;$6955
push bc                           ;$6956
ld c, $10                         ;$6957
ld b, $05                         ;$6959
jr $6970                          ;$695b
push bc                           ;$695d
ld c, $16                         ;$695e
ld b, $04                         ;$6960
jr $6970                          ;$6962
push bc                           ;$6964
ld c, $1a                         ;$6965
ld b, $05                         ;$6967
jr $6970                          ;$6969
push bc                           ;$696b
ld c, $20                         ;$696c
ld b, $04                         ;$696e
ldi a, [hl]                       ;$6970
ld [$ff00+c], a                   ;$6971
inc c                             ;$6972
dec b                             ;$6973
jr nz, $6970                      ;$6974
pop bc                            ;$6976
ret                               ;$6977
inc e                             ;$6978
ld [$df71], a                     ;$6979
inc e                             ;$697c
dec a                             ;$697d
sla a                             ;$697e
ld c, a                           ;$6980
ld b, $00                         ;$6981
add hl, bc                        ;$6983
ld c, [hl]                        ;$6984
inc hl                            ;$6985
ld b, [hl]                        ;$6986
ld l, c                           ;$6987
ld h, b                           ;$6988
ld a, h                           ;$6989
ret                               ;$698a
push de                           ;$698b
ld l, e                           ;$698c
ld h, d                           ;$698d
inc [hl]                          ;$698e
ldi a, [hl]                       ;$698f
cp [hl]                           ;$6990
jr nz, $6996                      ;$6991
dec l                             ;$6993
xor a                             ;$6994
ld [hl], a                        ;$6995
pop de                            ;$6996
ret                               ;$6997
push bc                           ;$6998
ld c, $30                         ;$6999
ldi a, [hl]                       ;$699b
ld [$ff00+c], a                   ;$699c
inc c                             ;$699d
ld a, c                           ;$699e
cp $40                            ;$699f
jr nz, $699b                      ;$69a1
pop bc                            ;$69a3
ret                               ;$69a4
xor a                             ;$69a5
ld [$dfe1], a                     ;$69a6
ld [$dfe9], a                     ;$69a9
ld [$dff1], a                     ;$69ac
ld [$dff9], a                     ;$69af
ld [$df9f], a                     ;$69b2
ld [$dfaf], a                     ;$69b5
ld [$dfbf], a                     ;$69b8
ld [$dfcf], a                     ;$69bb
ld a, $ff                         ;$69be
ldh [$ff25], a                    ;$69c0
ld a, $03                         ;$69c2
ld [$df78], a                     ;$69c4
ld a, $08                         ;$69c7
ldh [$ff12], a                    ;$69c9
ldh [$ff17], a                    ;$69cb
ldh [$ff21], a                    ;$69cd
ld a, $80                         ;$69cf
ldh [$ff14], a                    ;$69d1
ldh [$ff19], a                    ;$69d3
ldh [$ff23], a                    ;$69d5
xor a                             ;$69d7
ldh [$ff10], a                    ;$69d8
ldh [$ff1a], a                    ;$69da
ret                               ;$69dc
ld de, $dfe0                      ;$69dd
ld a, [de]                        ;$69e0
and a                             ;$69e1
jr z, $69f0                       ;$69e2
ld hl, $df9f                      ;$69e4
set 7, [hl]                       ;$69e7
ld hl, $6480                      ;$69e9
call $6978                        ;$69ec
jp hl                             ;$69ef
inc e                             ;$69f0
ld a, [de]                        ;$69f1
and a                             ;$69f2
jr z, $69fc                       ;$69f3
ld hl, $6490                      ;$69f5
call $697c                        ;$69f8
jp hl                             ;$69fb
ret                               ;$69fc
ld de, $dff8                      ;$69fd
ld a, [de]                        ;$6a00
and a                             ;$6a01
jr z, $6a10                       ;$6a02
ld hl, $dfcf                      ;$6a04
set 7, [hl]                       ;$6a07
ld hl, $64a0                      ;$6a09
call $6978                        ;$6a0c
jp hl                             ;$6a0f
inc e                             ;$6a10
ld a, [de]                        ;$6a11
and a                             ;$6a12
jr z, $6a1c                       ;$6a13
ld hl, $64a8                      ;$6a15
call $697c                        ;$6a18
jp hl                             ;$6a1b
ret                               ;$6a1c
call $69a5                        ;$6a1d
ret                               ;$6a20
ld hl, $dfe8                      ;$6a21
ldi a, [hl]                       ;$6a24
and a                             ;$6a25
ret z                             ;$6a26
cp $ff                            ;$6a27
jr z, $6a1d                       ;$6a29
ld [hl], a                        ;$6a2b
ld b, a                           ;$6a2c
ld hl, $64b0                      ;$6a2d
and a, $1f                        ;$6a30
call $697c                        ;$6a32
call $6b13                        ;$6a35
call $6a3c                        ;$6a38
ret                               ;$6a3b
ld a, [$dfe9]                     ;$6a3c
and a                             ;$6a3f
ret z                             ;$6a40
ld hl, $6abe                      ;$6a41
dec a                             ;$6a44
jr z, $6a4d                       ;$6a45
inc hl                            ;$6a47
inc hl                            ;$6a48
inc hl                            ;$6a49
inc hl                            ;$6a4a
jr $6a44                          ;$6a4b
ldi a, [hl]                       ;$6a4d
ld [$df78], a                     ;$6a4e
ldi a, [hl]                       ;$6a51
ld [$df76], a                     ;$6a52
ldi a, [hl]                       ;$6a55
ld [$df79], a                     ;$6a56
ldi a, [hl]                       ;$6a59
ld [$df7a], a                     ;$6a5a
xor a                             ;$6a5d
ld [$df75], a                     ;$6a5e
ld [$df77], a                     ;$6a61
ret                               ;$6a64
ld a, [$dfe9]                     ;$6a65
and a                             ;$6a68
jr z, $6aa8                       ;$6a69
ld hl, $df75                      ;$6a6b
ld a, [$df78]                     ;$6a6e
cp $01                            ;$6a71
jr z, $6aac                       ;$6a73
cp $03                            ;$6a75
jr z, $6aa8                       ;$6a77
inc [hl]                          ;$6a79
ldi a, [hl]                       ;$6a7a
cp [hl]                           ;$6a7b
jr nz, $6ab1                      ;$6a7c
dec l                             ;$6a7e
ld [hl], $00                      ;$6a7f
inc l                             ;$6a81
inc l                             ;$6a82
inc [hl]                          ;$6a83
ld a, [$df79]                     ;$6a84
bit 0, [hl]                       ;$6a87
jp z, $6a8f                       ;$6a89
ld a, [$df7a]                     ;$6a8c
ld b, a                           ;$6a8f
ld a, [$dff1]                     ;$6a90
and a                             ;$6a93
jr z, $6a9a                       ;$6a94
set 2, b                          ;$6a96
set 6, b                          ;$6a98
ld a, [$dff9]                     ;$6a9a
and a                             ;$6a9d
jr z, $6aa4                       ;$6a9e
set 3, b                          ;$6aa0
set 7, b                          ;$6aa2
ld a, b                           ;$6aa4
ldh [$ff25], a                    ;$6aa5
ret                               ;$6aa7
ld a, $ff                         ;$6aa8
jr $6aa5                          ;$6aaa
ld a, [$df79]                     ;$6aac
jr $6a8f                          ;$6aaf
ld a, [$dff9]                     ;$6ab1
and a                             ;$6ab4
jr nz, $6aa8                      ;$6ab5
ld a, [$dff1]                     ;$6ab7
and a                             ;$6aba
jr nz, $6aa8                      ;$6abb
ret                               ;$6abd
ld bc, $ef24                      ;$6abe
ld d, [hl]                        ;$6ac1
ld bc, $e500                      ;$6ac2
nop                               ;$6ac5
ld bc, $fd20                      ;$6ac6
nop                               ;$6ac9
ld bc, $de20                      ;$6aca
rst $30                           ;$6acd
inc bc                            ;$6ace
jr $6b50                          ;$6acf
rst $30                           ;$6ad1
inc bc                            ;$6ad2
jr $6acc                          ;$6ad3
ld a, a                           ;$6ad5
inc bc                            ;$6ad6
ld c, b                           ;$6ad7
rst $18                           ;$6ad8
ld e, e                           ;$6ad9
ld bc, $db18                      ;$6ada
rst $20                           ;$6add
ld bc, $fd00                      ;$6ade
rst $30                           ;$6ae1
inc bc                            ;$6ae2
jr nz, $6b64                      ;$6ae3
rst $30                           ;$6ae5
ld bc, $ed20                      ;$6ae6
rst $30                           ;$6ae9
ld bc, $ed20                      ;$6aea
rst $30                           ;$6aed
ld bc, $ed20                      ;$6aee
rst $30                           ;$6af1
ld bc, $ed20                      ;$6af2
rst $30                           ;$6af5
ld bc, $ed20                      ;$6af6
rst $30                           ;$6af9
ld bc, $ef20                      ;$6afa
rst $30                           ;$6afd
ld bc, $ef20                      ;$6afe
rst $30                           ;$6b01
ldi a, [hl]                       ;$6b02
ld c, a                           ;$6b03
ld a, [hl]                        ;$6b04
ld b, a                           ;$6b05
ld a, [bc]                        ;$6b06
ld [de], a                        ;$6b07
inc e                             ;$6b08
inc bc                            ;$6b09
ld a, [bc]                        ;$6b0a
ld [de], a                        ;$6b0b
ret                               ;$6b0c
ldi a, [hl]                       ;$6b0d
ld [de], a                        ;$6b0e
inc e                             ;$6b0f
ldi a, [hl]                       ;$6b10
ld [de], a                        ;$6b11
ret                               ;$6b12
call $69c7                        ;$6b13
xor a                             ;$6b16
ld [$df75], a                     ;$6b17
ld [$df77], a                     ;$6b1a
ld de, $df80                      ;$6b1d
ld b, $00                         ;$6b20
ldi a, [hl]                       ;$6b22
ld [de], a                        ;$6b23
inc e                             ;$6b24
call $6b0d                        ;$6b25
ld de, $df90                      ;$6b28
call $6b0d                        ;$6b2b
ld de, $dfa0                      ;$6b2e
call $6b0d                        ;$6b31
ld de, $dfb0                      ;$6b34
call $6b0d                        ;$6b37
ld de, $dfc0                      ;$6b3a
call $6b0d                        ;$6b3d
ld hl, $df90                      ;$6b40
ld de, $df94                      ;$6b43
call $6b02                        ;$6b46
ld hl, $dfa0                      ;$6b49
ld de, $dfa4                      ;$6b4c
call $6b02                        ;$6b4f
ld hl, $dfb0                      ;$6b52
ld de, $dfb4                      ;$6b55
call $6b02                        ;$6b58
ld hl, $dfc0                      ;$6b5b
ld de, $dfc4                      ;$6b5e
call $6b02                        ;$6b61
ld bc, $0410                      ;$6b64
ld hl, $df92                      ;$6b67
ld [hl], $01                      ;$6b6a
ld a, c                           ;$6b6c
add l                             ;$6b6d
ld l, a                           ;$6b6e
dec b                             ;$6b6f
jr nz, $6b6a                      ;$6b70
xor a                             ;$6b72
ld [$df9e], a                     ;$6b73
ld [$dfae], a                     ;$6b76
ld [$dfbe], a                     ;$6b79
ret                               ;$6b7c
push hl                           ;$6b7d
xor a                             ;$6b7e
ldh [$ff1a], a                    ;$6b7f
ld l, e                           ;$6b81
ld h, d                           ;$6b82
call $6998                        ;$6b83
pop hl                            ;$6b86
jr $6bb3                          ;$6b87
call $6bb9                        ;$6b89
call $6bce                        ;$6b8c
ld e, a                           ;$6b8f
call $6bb9                        ;$6b90
call $6bce                        ;$6b93
ld d, a                           ;$6b96
call $6bb9                        ;$6b97
call $6bce                        ;$6b9a
ld c, a                           ;$6b9d
inc l                             ;$6b9e
inc l                             ;$6b9f
ld [hl], e                        ;$6ba0
inc l                             ;$6ba1
ld [hl], d                        ;$6ba2
inc l                             ;$6ba3
ld [hl], c                        ;$6ba4
dec l                             ;$6ba5
dec l                             ;$6ba6
dec l                             ;$6ba7
dec l                             ;$6ba8
push hl                           ;$6ba9
ld hl, $df70                      ;$6baa
ld a, [hl]                        ;$6bad
pop hl                            ;$6bae
cp $03                            ;$6baf
jr z, $6b7d                       ;$6bb1
call $6bb9                        ;$6bb3
jp $6c5e                          ;$6bb6
push de                           ;$6bb9
ldi a, [hl]                       ;$6bba
ld e, a                           ;$6bbb
ldd a, [hl]                       ;$6bbc
ld d, a                           ;$6bbd
inc de                            ;$6bbe
ld a, e                           ;$6bbf
ldi [hl], a                       ;$6bc0
ld a, d                           ;$6bc1
ldd [hl], a                       ;$6bc2
pop de                            ;$6bc3
ret                               ;$6bc4
push de                           ;$6bc5
ldi a, [hl]                       ;$6bc6
ld e, a                           ;$6bc7
ldd a, [hl]                       ;$6bc8
ld d, a                           ;$6bc9
inc de                            ;$6bca
inc de                            ;$6bcb
jr $6bbf                          ;$6bcc
ldi a, [hl]                       ;$6bce
ld c, a                           ;$6bcf
ldd a, [hl]                       ;$6bd0
ld b, a                           ;$6bd1
ld a, [bc]                        ;$6bd2
ld b, a                           ;$6bd3
ret                               ;$6bd4
pop hl                            ;$6bd5
jr $6c04                          ;$6bd6
ld a, [$df70]                     ;$6bd8
cp $03                            ;$6bdb
jr nz, $6bef                      ;$6bdd
ld a, [$dfb8]                     ;$6bdf
bit 7, a                          ;$6be2
jr z, $6bef                       ;$6be4
ld a, [hl]                        ;$6be6
cp $06                            ;$6be7
jr nz, $6bef                      ;$6be9
ld a, $40                         ;$6beb
ldh [$ff1c], a                    ;$6bed
push hl                           ;$6bef
ld a, l                           ;$6bf0
add a, $09                        ;$6bf1
ld l, a                           ;$6bf3
ld a, [hl]                        ;$6bf4
and a                             ;$6bf5
jr nz, $6bd5                      ;$6bf6
ld a, l                           ;$6bf8
add a, $04                        ;$6bf9
ld l, a                           ;$6bfb
bit 7, [hl]                       ;$6bfc
jr nz, $6bd5                      ;$6bfe
pop hl                            ;$6c00
call $6d67                        ;$6c01
dec l                             ;$6c04
dec l                             ;$6c05
jp $6d39                          ;$6c06
dec l                             ;$6c09
dec l                             ;$6c0a
dec l                             ;$6c0b
dec l                             ;$6c0c
call $6bc5                        ;$6c0d
ld a, l                           ;$6c10
add a, $04                        ;$6c11
ld e, a                           ;$6c13
ld d, h                           ;$6c14
call $6b02                        ;$6c15
cp $00                            ;$6c18
jr z, $6c3b                       ;$6c1a
cp $ff                            ;$6c1c
jr z, $6c24                       ;$6c1e
inc l                             ;$6c20
jp $6c5c                          ;$6c21
dec l                             ;$6c24
push hl                           ;$6c25
call $6bc5                        ;$6c26
call $6bce                        ;$6c29
ld e, a                           ;$6c2c
call $6bb9                        ;$6c2d
call $6bce                        ;$6c30
ld d, a                           ;$6c33
pop hl                            ;$6c34
ld a, e                           ;$6c35
ldi [hl], a                       ;$6c36
ld a, d                           ;$6c37
ldd [hl], a                       ;$6c38
jr $6c10                          ;$6c39
ld hl, $dfe9                      ;$6c3b
ld [hl], $00                      ;$6c3e
call $69a5                        ;$6c40
ret                               ;$6c43
ld hl, $dfe9                      ;$6c44
ld a, [hl]                        ;$6c47
and a                             ;$6c48
ret z                             ;$6c49
ld a, $01                         ;$6c4a
ld [$df70], a                     ;$6c4c
ld hl, $df90                      ;$6c4f
inc l                             ;$6c52
ldi a, [hl]                       ;$6c53
and a                             ;$6c54
jp z, $6c04                       ;$6c55
dec [hl]                          ;$6c58
jp nz, $6bd8                      ;$6c59
inc l                             ;$6c5c
inc l                             ;$6c5d
call $6bce                        ;$6c5e
cp $00                            ;$6c61
jp z, $6c09                       ;$6c63
cp $9d                            ;$6c66
jp z, $6b89                       ;$6c68
and a, $f0                        ;$6c6b
cp $a0                            ;$6c6d
jr nz, $6c8b                      ;$6c6f
ld a, b                           ;$6c71
and a, $0f                        ;$6c72
ld c, a                           ;$6c74
ld b, $00                         ;$6c75
push hl                           ;$6c77
ld de, $df81                      ;$6c78
ld a, [de]                        ;$6c7b
ld l, a                           ;$6c7c
inc de                            ;$6c7d
ld a, [de]                        ;$6c7e
ld h, a                           ;$6c7f
add hl, bc                        ;$6c80
ld a, [hl]                        ;$6c81
pop hl                            ;$6c82
dec l                             ;$6c83
ldi [hl], a                       ;$6c84
call $6bb9                        ;$6c85
call $6bce                        ;$6c88
ld a, b                           ;$6c8b
ld c, a                           ;$6c8c
ld b, $00                         ;$6c8d
call $6bb9                        ;$6c8f
ld a, [$df70]                     ;$6c92
cp $04                            ;$6c95
jp z, $6cbc                       ;$6c97
push hl                           ;$6c9a
ld a, l                           ;$6c9b
add a, $05                        ;$6c9c
ld l, a                           ;$6c9e
ld e, l                           ;$6c9f
ld d, h                           ;$6ca0
inc l                             ;$6ca1
inc l                             ;$6ca2
ld a, c                           ;$6ca3
cp $01                            ;$6ca4
jr z, $6cb7                       ;$6ca6
ld [hl], $00                      ;$6ca8
ld hl, $6e02                      ;$6caa
add hl, bc                        ;$6cad
ldi a, [hl]                       ;$6cae
ld [de], a                        ;$6caf
inc e                             ;$6cb0
ld a, [hl]                        ;$6cb1
ld [de], a                        ;$6cb2
pop hl                            ;$6cb3
jp $6cd3                          ;$6cb4
ld [hl], $01                      ;$6cb7
pop hl                            ;$6cb9
jr $6cd3                          ;$6cba
push hl                           ;$6cbc
ld de, $dfc6                      ;$6cbd
ld hl, $6e94                      ;$6cc0
add hl, bc                        ;$6cc3
ldi a, [hl]                       ;$6cc4
ld [de], a                        ;$6cc5
inc e                             ;$6cc6
ld a, e                           ;$6cc7
cp $cb                            ;$6cc8
jr nz, $6cc4                      ;$6cca
ld c, $20                         ;$6ccc
ld hl, $dfc4                      ;$6cce
jr $6d01                          ;$6cd1
push hl                           ;$6cd3
ld a, [$df70]                     ;$6cd4
cp $01                            ;$6cd7
jr z, $6cfc                       ;$6cd9
cp $02                            ;$6cdb
jr z, $6cf8                       ;$6cdd
ld c, $1a                         ;$6cdf
ld a, [$dfbf]                     ;$6ce1
bit 7, a                          ;$6ce4
jr nz, $6ced                      ;$6ce6
xor a                             ;$6ce8
ld [$ff00+c], a                   ;$6ce9
ld a, $80                         ;$6cea
ld [$ff00+c], a                   ;$6cec
inc c                             ;$6ced
inc l                             ;$6cee
inc l                             ;$6cef
inc l                             ;$6cf0
inc l                             ;$6cf1
ldi a, [hl]                       ;$6cf2
ld e, a                           ;$6cf3
ld d, $00                         ;$6cf4
jr $6d0d                          ;$6cf6
ld c, $16                         ;$6cf8
jr $6d01                          ;$6cfa
ld c, $10                         ;$6cfc
ld a, $00                         ;$6cfe
inc c                             ;$6d00
inc l                             ;$6d01
inc l                             ;$6d02
inc l                             ;$6d03
ldd a, [hl]                       ;$6d04
and a                             ;$6d05
jr nz, $6d57                      ;$6d06
ldi a, [hl]                       ;$6d08
ld e, a                           ;$6d09
inc l                             ;$6d0a
ldi a, [hl]                       ;$6d0b
ld d, a                           ;$6d0c
push hl                           ;$6d0d
inc l                             ;$6d0e
inc l                             ;$6d0f
ldi a, [hl]                       ;$6d10
and a                             ;$6d11
jr z, $6d16                       ;$6d12
ld e, $01                         ;$6d14
inc l                             ;$6d16
inc l                             ;$6d17
ld [hl], $00                      ;$6d18
inc l                             ;$6d1a
ld a, [hl]                        ;$6d1b
pop hl                            ;$6d1c
bit 7, a                          ;$6d1d
jr nz, $6d34                      ;$6d1f
ld a, d                           ;$6d21
ld [$ff00+c], a                   ;$6d22
inc c                             ;$6d23
ld a, e                           ;$6d24
ld [$ff00+c], a                   ;$6d25
inc c                             ;$6d26
ldi a, [hl]                       ;$6d27
ld [$ff00+c], a                   ;$6d28
inc c                             ;$6d29
ld a, [hl]                        ;$6d2a
or $80                            ;$6d2b
ld [$ff00+c], a                   ;$6d2d
ld a, l                           ;$6d2e
or $05                            ;$6d2f
ld l, a                           ;$6d31
res 0, [hl]                       ;$6d32
pop hl                            ;$6d34
dec l                             ;$6d35
ldd a, [hl]                       ;$6d36
ldd [hl], a                       ;$6d37
dec l                             ;$6d38
ld de, $df70                      ;$6d39
ld a, [de]                        ;$6d3c
cp $04                            ;$6d3d
jr z, $6d4a                       ;$6d3f
inc a                             ;$6d41
ld [de], a                        ;$6d42
ld de, $0010                      ;$6d43
add hl, de                        ;$6d46
jp $6c52                          ;$6d47
ld hl, $df9e                      ;$6d4a
inc [hl]                          ;$6d4d
ld hl, $dfae                      ;$6d4e
inc [hl]                          ;$6d51
ld hl, $dfbe                      ;$6d52
inc [hl]                          ;$6d55
ret                               ;$6d56
ld b, $00                         ;$6d57
push hl                           ;$6d59
pop hl                            ;$6d5a
inc l                             ;$6d5b
jr $6d0a                          ;$6d5c
ld a, b                           ;$6d5e
srl a                             ;$6d5f
ld l, a                           ;$6d61
ld h, $00                         ;$6d62
add hl, de                        ;$6d64
ld e, [hl]                        ;$6d65
ret                               ;$6d66
push hl                           ;$6d67
ld a, l                           ;$6d68
add a, $06                        ;$6d69
ld l, a                           ;$6d6b
ld a, [hl]                        ;$6d6c
and a, $0f                        ;$6d6d
jr z, $6d89                       ;$6d6f
ld [$df71], a                     ;$6d71
ld a, [$df70]                     ;$6d74
ld c, $13                         ;$6d77
cp $01                            ;$6d79
jr z, $6d8b                       ;$6d7b
ld c, $18                         ;$6d7d
cp $02                            ;$6d7f
jr z, $6d8b                       ;$6d81
ld c, $1d                         ;$6d83
cp $03                            ;$6d85
jr z, $6d8b                       ;$6d87
pop hl                            ;$6d89
ret                               ;$6d8a
inc l                             ;$6d8b
ldi a, [hl]                       ;$6d8c
ld e, a                           ;$6d8d
ld a, [hl]                        ;$6d8e
ld d, a                           ;$6d8f
push de                           ;$6d90
ld a, l                           ;$6d91
add a, $04                        ;$6d92
ld l, a                           ;$6d94
ld b, [hl]                        ;$6d95
ld a, [$df71]                     ;$6d96
cp $01                            ;$6d99
jr $6da6                          ;$6d9b
cp $03                            ;$6d9d
jr $6da1                          ;$6d9f
ld hl, $ffff                      ;$6da1
jr $6dc2                          ;$6da4
ld de, $6dcb                      ;$6da6
call $6d5e                        ;$6da9
bit 0, b                          ;$6dac
jr nz, $6db2                      ;$6dae
swap e                            ;$6db0
ld a, e                           ;$6db2
and a, $0f                        ;$6db3
bit 3, a                          ;$6db5
jr z, $6dbf                       ;$6db7
ld h, $ff                         ;$6db9
or $f0                            ;$6dbb
jr $6dc1                          ;$6dbd
ld h, $00                         ;$6dbf
ld l, a                           ;$6dc1
pop de                            ;$6dc2
add hl, de                        ;$6dc3
ld a, l                           ;$6dc4
ld [$ff00+c], a                   ;$6dc5
inc c                             ;$6dc6
ld a, h                           ;$6dc7
ld [$ff00+c], a                   ;$6dc8
jr $6d89                          ;$6dc9
nop                               ;$6dcb
nop                               ;$6dcc
nop                               ;$6dcd
nop                               ;$6dce
nop                               ;$6dcf
nop                               ;$6dd0
stop                              ;$6dd1
rrca                              ;$6dd3
nop                               ;$6dd4
nop                               ;$6dd5
ld de, $0f00                      ;$6dd6
ldh a, [$ff01]                    ;$6dd9
ld [de], a                        ;$6ddb
db $10 ;<corrupted stop>          ;$6ddc
rst $38                           ;$6ddd
rst $28                           ;$6dde
ld bc, $1012                      ;$6ddf
rst $38                           ;$6de2
rst $28                           ;$6de3
ld bc, $1012                      ;$6de4
rst $38                           ;$6de7
rst $28                           ;$6de8
ld bc, $1012                      ;$6de9
rst $38                           ;$6dec
rst $28                           ;$6ded
ld bc, $1012                      ;$6dee
rst $38                           ;$6df1
rst $28                           ;$6df2
ld bc, $1012                      ;$6df3
rst $38                           ;$6df6
rst $28                           ;$6df7
ld bc, $1012                      ;$6df8
rst $38                           ;$6dfb
rst $28                           ;$6dfc
ld bc, $1012                      ;$6dfd
rst $38                           ;$6e00
rst $28                           ;$6e01
nop                               ;$6e02
rrca                              ;$6e03
inc l                             ;$6e04
nop                               ;$6e05
sbc h                             ;$6e06
nop                               ;$6e07
ld b, $01                         ;$6e08
ld l, e                           ;$6e0a
ld bc, $01c9                      ;$6e0b
inc hl                            ;$6e0e
ld [bc], a                        ;$6e0f
ld [hl], a                        ;$6e10
ld [bc], a                        ;$6e11
add a, $02                        ;$6e12
ld [de], a                        ;$6e14
inc bc                            ;$6e15
ld d, [hl]                        ;$6e16
inc bc                            ;$6e17
sbc e                             ;$6e18
inc bc                            ;$6e19
jp c, $1603                       ;$6e1a
inc b                             ;$6e1d
ld c, [hl]                        ;$6e1e
inc b                             ;$6e1f
add e                             ;$6e20
inc b                             ;$6e21
or l                              ;$6e22
inc b                             ;$6e23
push hl                           ;$6e24
inc b                             ;$6e25
ld de, $3b05                      ;$6e26
dec b                             ;$6e29
ld h, e                           ;$6e2a
dec b                             ;$6e2b
adc c                             ;$6e2c
dec b                             ;$6e2d
xor h                             ;$6e2e
dec b                             ;$6e2f
adc a, $05                        ;$6e30
db $ed ;<unknown instruction>     ;$6e32
dec b                             ;$6e33
ld a, [bc]                        ;$6e34
ld b, $27                         ;$6e35
ld b, $42                         ;$6e37
ld b, $5b                         ;$6e39
ld b, $72                         ;$6e3b
ld b, $89                         ;$6e3d
ld b, $9e                         ;$6e3f
ld b, $b2                         ;$6e41
ld b, $c4                         ;$6e43
ld b, $d6                         ;$6e45
ld b, $e7                         ;$6e47
ld b, $f7                         ;$6e49
ld b, $06                         ;$6e4b
rlca                              ;$6e4d
inc d                             ;$6e4e
rlca                              ;$6e4f
ld hl, $2d07                      ;$6e50
rlca                              ;$6e53
add hl, sp                        ;$6e54
rlca                              ;$6e55
ld b, h                           ;$6e56
rlca                              ;$6e57
ld c, a                           ;$6e58
rlca                              ;$6e59
ld e, c                           ;$6e5a
rlca                              ;$6e5b
ld h, d                           ;$6e5c
rlca                              ;$6e5d
ld l, e                           ;$6e5e
rlca                              ;$6e5f
ld [hl], e                        ;$6e60
rlca                              ;$6e61
ld a, e                           ;$6e62
rlca                              ;$6e63
add e                             ;$6e64
rlca                              ;$6e65
adc d                             ;$6e66
rlca                              ;$6e67
sub b                             ;$6e68
rlca                              ;$6e69
sub a                             ;$6e6a
rlca                              ;$6e6b
sbc l                             ;$6e6c
rlca                              ;$6e6d
and d                             ;$6e6e
rlca                              ;$6e6f
and a                             ;$6e70
rlca                              ;$6e71
xor h                             ;$6e72
rlca                              ;$6e73
or c                              ;$6e74
rlca                              ;$6e75
or [hl]                           ;$6e76
rlca                              ;$6e77
cp d                              ;$6e78
rlca                              ;$6e79
cp [hl]                           ;$6e7a
rlca                              ;$6e7b
pop bc                            ;$6e7c
rlca                              ;$6e7d
call nz, $c807                    ;$6e7e
rlca                              ;$6e81
rlc a                             ;$6e82
adc a, $07                        ;$6e84
pop de                            ;$6e86
rlca                              ;$6e87
call nc, $d607                    ;$6e88
rlca                              ;$6e8b
reti                              ;$6e8c
rlca                              ;$6e8d
db $db ;<unknown instruction>     ;$6e8e
rlca                              ;$6e8f
db $dd ;<unknown instruction>     ;$6e90
rlca                              ;$6e91
rst $18                           ;$6e92
rlca                              ;$6e93
nop                               ;$6e94
nop                               ;$6e95
nop                               ;$6e96
nop                               ;$6e97
nop                               ;$6e98
ret nz                            ;$6e99
and c                             ;$6e9a
nop                               ;$6e9b
ldd a, [hl]                       ;$6e9c
nop                               ;$6e9d
ret nz                            ;$6e9e
or c                              ;$6e9f
nop                               ;$6ea0
add hl, hl                        ;$6ea1
ld bc, $61c0                      ;$6ea2
nop                               ;$6ea5
ldd a, [hl]                       ;$6ea6
nop                               ;$6ea7
ret nz                            ;$6ea8
ld [de], a                        ;$6ea9
inc [hl]                          ;$6eaa
ld b, l                           ;$6eab
ld h, a                           ;$6eac
sbc d                             ;$6ead
cp h                              ;$6eae
sbc a, $fe                        ;$6eaf
sbc b                             ;$6eb1
ld a, d                           ;$6eb2
or a                              ;$6eb3
cp [hl]                           ;$6eb4
xor b                             ;$6eb5
halt                              ;$6eb6
ld d, h                           ;$6eb7
ld sp, $2301                      ;$6eb8
ld b, h                           ;$6ebb
ld d, l                           ;$6ebc
ld h, a                           ;$6ebd
adc b                             ;$6ebe
sbc d                             ;$6ebf
cp e                              ;$6ec0
xor c                             ;$6ec1
adc b                             ;$6ec2
halt                              ;$6ec3
ld d, l                           ;$6ec4
ld b, h                           ;$6ec5
inc sp                            ;$6ec6
ldi [hl], a                       ;$6ec7
ld de, $2301                      ;$6ec8
ld b, l                           ;$6ecb
ld h, a                           ;$6ecc
adc c                             ;$6ecd
xor e                             ;$6ece
call $feef                        ;$6ecf
call c, $98ba                     ;$6ed2
halt                              ;$6ed5
ld d, h                           ;$6ed6
ldd [hl], a                       ;$6ed7
db $10 ;<corrupted stop>          ;$6ed8
and c                             ;$6ed9
add d                             ;$6eda
inc hl                            ;$6edb
inc [hl]                          ;$6edc
ld b, l                           ;$6edd
ld d, [hl]                        ;$6ede
ld h, a                           ;$6edf
ld a, b                           ;$6ee0
adc c                             ;$6ee1
sbc d                             ;$6ee2
xor e                             ;$6ee3
cp h                              ;$6ee4
call $3264                        ;$6ee5
db $10 ;<corrupted stop>          ;$6ee8
ld de, $5623                      ;$6ee9
ld a, b                           ;$6eec
sbc c                             ;$6eed
sbc b                             ;$6eee
halt                              ;$6eef
ld h, a                           ;$6ef0
sbc d                             ;$6ef1
rst $18                           ;$6ef2
cp $c9                            ;$6ef3
add l                             ;$6ef5
ld b, d                           ;$6ef6
ld de, $0231                      ;$6ef7
inc b                             ;$6efa
ld [$2010], sp                    ;$6efb
ld b, b                           ;$6efe
inc c                             ;$6eff
jr $6f32                          ;$6f00
dec b                             ;$6f02
nop                               ;$6f03
ld bc, $0503                      ;$6f04
ld a, [bc]                        ;$6f07
inc d                             ;$6f08
jr z, $6f5b                       ;$6f09
rrca                              ;$6f0b
ld e, $3c                         ;$6f0c
inc bc                            ;$6f0e
ld b, $0c                         ;$6f0f
jr $6f43                          ;$6f11
ld h, b                           ;$6f13
ld [de], a                        ;$6f14
inc h                             ;$6f15
ld c, b                           ;$6f16
ld [$0010], sp                    ;$6f17
rlca                              ;$6f1a
ld c, $1c                         ;$6f1b
jr c, $6f8f                       ;$6f1d
dec d                             ;$6f1f
ldi a, [hl]                       ;$6f20
ld d, h                           ;$6f21
inc b                             ;$6f22
ld [$2010], sp                    ;$6f23
ld b, b                           ;$6f26
add b                             ;$6f27
jr $6f5a                          ;$6f28
ld h, b                           ;$6f2a
inc b                             ;$6f2b
add hl, bc                        ;$6f2c
ld [de], a                        ;$6f2d
inc h                             ;$6f2e
ld c, b                           ;$6f2f
sub b                             ;$6f30
dec de                            ;$6f31
ld [hl], $6c                      ;$6f32
inc c                             ;$6f34
jr $6f3b                          ;$6f35
ld a, [bc]                        ;$6f37
inc d                             ;$6f38
jr z, $6f8b                       ;$6f39
and b                             ;$6f3b
ld e, $3c                         ;$6f3c
ld a, b                           ;$6f3e
nop                               ;$6f3f
ld c, $6f                         ;$6f40
ld sp, hl                         ;$6f42
ld a, h                           ;$6f43
rst $38                           ;$6f44
ld a, h                           ;$6f45
ld de, $217d                      ;$6f46
ld a, l                           ;$6f49
nop                               ;$6f4a
dec b                             ;$6f4b
ld l, a                           ;$6f4c
ld c, b                           ;$6f4d
ld a, [hl]                        ;$6f4e
ld b, h                           ;$6f4f
ld a, [hl]                        ;$6f50
ld c, d                           ;$6f51
ld a, [hl]                        ;$6f52
ld c, h                           ;$6f53
ld a, [hl]                        ;$6f54
nop                               ;$6f55
ld c, $6f                         ;$6f56
dec sp                            ;$6f58
halt                              ;$6f59
inc sp                            ;$6f5a
halt                              ;$6f5b
ld b, c                           ;$6f5c
halt                              ;$6f5d
ld h, e                           ;$6f5e
halt                              ;$6f5f
nop                               ;$6f60
ld sp, hl                         ;$6f61
ld l, [hl]                        ;$6f62
nop                               ;$6f63
halt                              ;$6f64
db $fc ;<unknown instruction>     ;$6f65
ld [hl], l                        ;$6f66
ld [bc], a                        ;$6f67
halt                              ;$6f68
nop                               ;$6f69
nop                               ;$6f6a
nop                               ;$6f6b
ld c, $6f                         ;$6f6c
ld c, h                           ;$6f6e
ld [hl], c                        ;$6f6f
ld b, d                           ;$6f70
ld [hl], c                        ;$6f71
ld d, [hl]                        ;$6f72
ld [hl], c                        ;$6f73
ld h, d                           ;$6f74
ld [hl], c                        ;$6f75
nop                               ;$6f76
ld c, $6f                         ;$6f77
add a, $72                        ;$6f79
cp b                              ;$6f7b
ld [hl], d                        ;$6f7c
call nc, $0272                    ;$6f7d
ld [hl], e                        ;$6f80
nop                               ;$6f81
ld c, $6f                         ;$6f82
ld [$fa70], sp                    ;$6f84
ld l, a                           ;$6f87
nop                               ;$6f88
nop                               ;$6f89
nop                               ;$6f8a
nop                               ;$6f8b
nop                               ;$6f8c
dec b                             ;$6f8d
ld l, a                           ;$6f8e
sbc l                             ;$6f8f
ld a, [hl]                        ;$6f90
sub c                             ;$6f91
ld a, [hl]                        ;$6f92
xor c                             ;$6f93
ld a, [hl]                        ;$6f94
or l                              ;$6f95
ld a, [hl]                        ;$6f96
nop                               ;$6f97
ld c, $6f                         ;$6f98
jr z, $7018                       ;$6f9a
inc h                             ;$6f9c
ld a, h                           ;$6f9d
ldi a, [hl]                       ;$6f9e
ld a, h                           ;$6f9f
inc l                             ;$6fa0
ld a, h                           ;$6fa1
nop                               ;$6fa2
ld c, $6f                         ;$6fa3
nop                               ;$6fa5
nop                               ;$6fa6
nop                               ;$6fa7
ld a, d                           ;$6fa8
nop                               ;$6fa9
nop                               ;$6faa
nop                               ;$6fab
nop                               ;$6fac
nop                               ;$6fad
ld c, $6f                         ;$6fae
nop                               ;$6fb0
nop                               ;$6fb1
ld h, $7a                         ;$6fb2
ldi a, [hl]                       ;$6fb4
ld a, d                           ;$6fb5
nop                               ;$6fb6
nop                               ;$6fb7
nop                               ;$6fb8
ld c, $6f                         ;$6fb9
ld [hl], e                        ;$6fbb
ld a, d                           ;$6fbc
ld l, a                           ;$6fbd
ld a, d                           ;$6fbe
ld [hl], l                        ;$6fbf
ld a, d                           ;$6fc0
nop                               ;$6fc1
nop                               ;$6fc2
nop                               ;$6fc3
ld c, $6f                         ;$6fc4
rst $18                           ;$6fc6
ld a, d                           ;$6fc7
db $e3 ;<unknown instruction>     ;$6fc8
ld a, d                           ;$6fc9
push hl                           ;$6fca
ld a, d                           ;$6fcb
rst $20                           ;$6fcc
ld a, d                           ;$6fcd
nop                               ;$6fce
ld c, $6f                         ;$6fcf
ld h, l                           ;$6fd1
ld a, e                           ;$6fd2
ld l, e                           ;$6fd3
ld a, e                           ;$6fd4
ld l, a                           ;$6fd5
ld a, e                           ;$6fd6
ld [hl], e                        ;$6fd7
ld a, e                           ;$6fd8
nop                               ;$6fd9
ld c, $6f                         ;$6fda
ld l, h                           ;$6fdc
ld a, b                           ;$6fdd
halt                              ;$6fde
ld a, b                           ;$6fdf
ld a, [hl]                        ;$6fe0
ld a, b                           ;$6fe1
add [hl]                          ;$6fe2
ld a, b                           ;$6fe3
nop                               ;$6fe4
dec hl                            ;$6fe5
ld l, a                           ;$6fe6
ld b, e                           ;$6fe7
ld [hl], l                        ;$6fe8
ld c, e                           ;$6fe9
ld [hl], l                        ;$6fea
ld d, c                           ;$6feb
ld [hl], l                        ;$6fec
nop                               ;$6fed
nop                               ;$6fee
nop                               ;$6fef
ld c, $6f                         ;$6ff0
adc l                             ;$6ff2
ld [hl], l                        ;$6ff3
sub l                             ;$6ff4
ld [hl], l                        ;$6ff5
sbc e                             ;$6ff6
ld [hl], l                        ;$6ff7
nop                               ;$6ff8
nop                               ;$6ff9
ld d, $70                         ;$6ffa
inc [hl]                          ;$6ffc
ld [hl], b                        ;$6ffd
ld d, $70                         ;$6ffe
ld c, l                           ;$7000
ld [hl], b                        ;$7001
sub e                             ;$7002
ld [hl], b                        ;$7003
rst $38                           ;$7004
rst $38                           ;$7005
ld a, [$626f]                     ;$7006
ld [hl], b                        ;$7009
ld [hl], h                        ;$700a
ld [hl], b                        ;$700b
ld h, d                           ;$700c
ld [hl], b                        ;$700d
add l                             ;$700e
ld [hl], b                        ;$700f
db $f4 ;<unknown instruction>     ;$7010
ld [hl], b                        ;$7011
rst $38                           ;$7012
rst $38                           ;$7013
ld [$9d70], sp                    ;$7014
ld [hl], h                        ;$7017
nop                               ;$7018
ld b, c                           ;$7019
and d                             ;$701a
ld b, h                           ;$701b
ld c, h                           ;$701c
ld d, [hl]                        ;$701d
ld c, h                           ;$701e
ld b, d                           ;$701f
ld c, h                           ;$7020
ld b, h                           ;$7021
ld c, h                           ;$7022
ld a, $4c                         ;$7023
inc a                             ;$7025
ld c, h                           ;$7026
ld b, h                           ;$7027
ld c, h                           ;$7028
ld d, [hl]                        ;$7029
ld c, h                           ;$702a
ld b, d                           ;$702b
ld c, h                           ;$702c
ld b, h                           ;$702d
ld c, h                           ;$702e
ld a, $4c                         ;$702f
inc a                             ;$7031
ld c, h                           ;$7032
nop                               ;$7033
ld b, h                           ;$7034
ld c, h                           ;$7035
ld b, h                           ;$7036
ld a, $4e                         ;$7037
ld c, b                           ;$7039
ld b, d                           ;$703a
ld c, b                           ;$703b
ld b, d                           ;$703c
ldd a, [hl]                       ;$703d
ld c, h                           ;$703e
ld b, h                           ;$703f
ld a, $4c                         ;$7040
ld c, b                           ;$7042
ld b, h                           ;$7043
ld b, d                           ;$7044
ld a, $3c                         ;$7045
inc [hl]                          ;$7047
inc a                             ;$7048
ld b, d                           ;$7049
ld c, h                           ;$704a
ld c, b                           ;$704b
nop                               ;$704c
ld b, h                           ;$704d
ld c, h                           ;$704e
ld b, h                           ;$704f
ld a, $4e                         ;$7050
ld c, b                           ;$7052
ld b, d                           ;$7053
ld c, b                           ;$7054
ld b, d                           ;$7055
ldd a, [hl]                       ;$7056
ld d, d                           ;$7057
ld c, b                           ;$7058
ld c, h                           ;$7059
ld d, d                           ;$705a
ld c, h                           ;$705b
ld b, h                           ;$705c
ldd a, [hl]                       ;$705d
ld b, d                           ;$705e
xor b                             ;$705f
ld b, h                           ;$7060
nop                               ;$7061
sbc l                             ;$7062
ld h, h                           ;$7063
nop                               ;$7064
ld b, c                           ;$7065
and e                             ;$7066
ld h, $3e                         ;$7067
inc a                             ;$7069
ld h, $2c                         ;$706a
inc [hl]                          ;$706c
ld a, $36                         ;$706d
inc [hl]                          ;$706f
ld a, $2c                         ;$7070
inc [hl]                          ;$7072
nop                               ;$7073
ld h, $3e                         ;$7074
jr nc, $709a                      ;$7076
ldd a, [hl]                       ;$7078
inc l                             ;$7079
ld e, $36                         ;$707a
jr nc, $7020                      ;$707c
inc [hl]                          ;$707e
ld [hl], $34                      ;$707f
jr nc, $70af                      ;$7081
ldi a, [hl]                       ;$7083
nop                               ;$7084
and e                             ;$7085
ld h, $3e                         ;$7086
jr nc, $70ac                      ;$7088
ldd a, [hl]                       ;$708a
ldi a, [hl]                       ;$708b
inc l                             ;$708c
inc [hl]                          ;$708d
inc [hl]                          ;$708e
inc l                             ;$708f
ldi [hl], a                       ;$7090
inc d                             ;$7091
nop                               ;$7092
and d                             ;$7093
ld d, d                           ;$7094
ld c, [hl]                        ;$7095
ld c, h                           ;$7096
ld c, b                           ;$7097
ld b, h                           ;$7098
ld b, d                           ;$7099
ld b, h                           ;$709a
ld c, b                           ;$709b
ld c, h                           ;$709c
ld b, h                           ;$709d
ld c, b                           ;$709e
ld c, [hl]                        ;$709f
ld c, h                           ;$70a0
ld c, [hl]                        ;$70a1
and e                             ;$70a2
ld d, d                           ;$70a3
ld b, d                           ;$70a4
and d                             ;$70a5
ld b, h                           ;$70a6
ld c, b                           ;$70a7
and e                             ;$70a8
ld c, h                           ;$70a9
ld c, b                           ;$70aa
ld c, h                           ;$70ab
ld d, [hl]                        ;$70ac
ld d, b                           ;$70ad
and d                             ;$70ae
ld d, [hl]                        ;$70af
ld e, d                           ;$70b0
and e                             ;$70b1
ld e, h                           ;$70b2
ld e, d                           ;$70b3
and d                             ;$70b4
ld d, [hl]                        ;$70b5
ld d, d                           ;$70b6
ld d, b                           ;$70b7
ld c, h                           ;$70b8
ld d, b                           ;$70b9
ld c, d                           ;$70ba
xor b                             ;$70bb
ld c, h                           ;$70bc
and a                             ;$70bd
ld d, d                           ;$70be
and c                             ;$70bf
ld d, [hl]                        ;$70c0
ld e, b                           ;$70c1
and e                             ;$70c2
ld d, [hl]                        ;$70c3
and d                             ;$70c4
ld d, d                           ;$70c5
ld c, [hl]                        ;$70c6
ld d, d                           ;$70c7
ld c, h                           ;$70c8
ld c, [hl]                        ;$70c9
ld c, b                           ;$70ca
and a                             ;$70cb
ld d, [hl]                        ;$70cc
and c                             ;$70cd
ld e, d                           ;$70ce
ld e, h                           ;$70cf
and e                             ;$70d0
ld e, d                           ;$70d1
and d                             ;$70d2
ld d, [hl]                        ;$70d3
ld d, h                           ;$70d4
ld d, [hl]                        ;$70d5
ld d, b                           ;$70d6
ld d, h                           ;$70d7
ld c, h                           ;$70d8
ld e, d                           ;$70d9
ld d, h                           ;$70da
ld c, h                           ;$70db
ld d, h                           ;$70dc
ld e, d                           ;$70dd
ld h, b                           ;$70de
ld h, [hl]                        ;$70df
ld d, h                           ;$70e0
ld h, h                           ;$70e1
ld d, h                           ;$70e2
ld h, b                           ;$70e3
ld d, h                           ;$70e4
and e                             ;$70e5
ld e, h                           ;$70e6
and d                             ;$70e7
ld h, b                           ;$70e8
ld e, h                           ;$70e9
ld e, d                           ;$70ea
ld e, h                           ;$70eb
and c                             ;$70ec
ld d, [hl]                        ;$70ed
ld e, d                           ;$70ee
and h                             ;$70ef
ld d, [hl]                        ;$70f0
and d                             ;$70f1
ld bc, $a200                      ;$70f2
inc [hl]                          ;$70f5
ldd a, [hl]                       ;$70f6
ld b, h                           ;$70f7
ldd a, [hl]                       ;$70f8
jr nc, $7135                      ;$70f9
inc [hl]                          ;$70fb
ldd a, [hl]                       ;$70fc
inc l                             ;$70fd
ldd a, [hl]                       ;$70fe
ldi a, [hl]                       ;$70ff
ldd a, [hl]                       ;$7100
inc l                             ;$7101
ldd a, [hl]                       ;$7102
ld b, h                           ;$7103
ldd a, [hl]                       ;$7104
jr nc, $7141                      ;$7105
inc [hl]                          ;$7107
ldd a, [hl]                       ;$7108
inc l                             ;$7109
ldd a, [hl]                       ;$710a
ldi a, [hl]                       ;$710b
ldd a, [hl]                       ;$710c
inc l                             ;$710d
inc [hl]                          ;$710e
inc l                             ;$710f
ld h, $3e                         ;$7110
jr c, $7146                       ;$7112
jr c, $7140                       ;$7114
jr c, $714a                       ;$7116
jr c, $70bd                       ;$7118
inc [hl]                          ;$711a
ld b, d                           ;$711b
ldi a, [hl]                       ;$711c
and d                             ;$711d
inc [hl]                          ;$711e
ldd a, [hl]                       ;$711f
ld b, d                           ;$7120
ldd a, [hl]                       ;$7121
jr nc, $715e                      ;$7122
ld l, $34                         ;$7124
ld h, $34                         ;$7126
ld l, $34                         ;$7128
xor b                             ;$712a
jr nc, $70cf                      ;$712b
ldd [hl], a                       ;$712d
jr c, $715a                       ;$712e
jr c, $7164                       ;$7130
jr c, $70dc                       ;$7132
inc [hl]                          ;$7134
and e                             ;$7135
inc [hl]                          ;$7136
ldi a, [hl]                       ;$7137
inc h                             ;$7138
inc e                             ;$7139
jr nz, $7160                      ;$713a
inc l                             ;$713c
jr nc, $7173                      ;$713d
xor b                             ;$713f
ld h, $00                         ;$7140
ld l, b                           ;$7142
ld [hl], c                        ;$7143
ld l, b                           ;$7144
ld [hl], c                        ;$7145
xor [hl]                          ;$7146
ld [hl], c                        ;$7147
rst $38                           ;$7148
rst $38                           ;$7149
ld b, d                           ;$714a
ld [hl], c                        ;$714b
bit 6, c                          ;$714c
bit 6, c                          ;$714e
dec e                             ;$7150
ld [hl], d                        ;$7151
rst $38                           ;$7152
rst $38                           ;$7153
ld c, h                           ;$7154
ld [hl], c                        ;$7155
ldd a, [hl]                       ;$7156
ld [hl], d                        ;$7157
ldd a, [hl]                       ;$7158
ld [hl], d                        ;$7159
ld a, a                           ;$715a
ld [hl], d                        ;$715b
ld a, a                           ;$715c
ld [hl], d                        ;$715d
rst $38                           ;$715e
rst $38                           ;$715f
ld d, [hl]                        ;$7160
ld [hl], c                        ;$7161
and e                             ;$7162
ld [hl], d                        ;$7163
rst $38                           ;$7164
rst $38                           ;$7165
ld h, d                           ;$7166
ld [hl], c                        ;$7167
sbc l                             ;$7168
add h                             ;$7169
nop                               ;$716a
add c                             ;$716b
and e                             ;$716c
ld d, d                           ;$716d
and d                             ;$716e
ld c, b                           ;$716f
ld c, d                           ;$7170
and e                             ;$7171
ld c, [hl]                        ;$7172
and d                             ;$7173
ld c, d                           ;$7174
ld c, b                           ;$7175
and e                             ;$7176
ld b, h                           ;$7177
and d                             ;$7178
ld b, h                           ;$7179
ld c, d                           ;$717a
and e                             ;$717b
ld d, d                           ;$717c
and d                             ;$717d
ld c, [hl]                        ;$717e
ld c, d                           ;$717f
and a                             ;$7180
ld c, b                           ;$7181
and d                             ;$7182
ld c, d                           ;$7183
and e                             ;$7184
ld c, [hl]                        ;$7185
ld d, d                           ;$7186
and e                             ;$7187
ld c, d                           ;$7188
ld b, h                           ;$7189
ld b, h                           ;$718a
ld bc, $01a2                      ;$718b
and e                             ;$718e
ld c, [hl]                        ;$718f
and d                             ;$7190
ld d, h                           ;$7191
and e                             ;$7192
ld e, h                           ;$7193
and d                             ;$7194
ld e, b                           ;$7195
ld d, h                           ;$7196
and a                             ;$7197
ld d, d                           ;$7198
and d                             ;$7199
ld c, d                           ;$719a
and e                             ;$719b
ld d, d                           ;$719c
and d                             ;$719d
ld c, [hl]                        ;$719e
ld c, d                           ;$719f
and e                             ;$71a0
ld c, b                           ;$71a1
and d                             ;$71a2
ld c, b                           ;$71a3
ld c, d                           ;$71a4
and e                             ;$71a5
ld c, [hl]                        ;$71a6
ld d, d                           ;$71a7
and e                             ;$71a8
ld c, d                           ;$71a9
ld b, h                           ;$71aa
ld b, h                           ;$71ab
ld bc, $9d00                      ;$71ac
ld d, b                           ;$71af
nop                               ;$71b0
add c                             ;$71b1
and h                             ;$71b2
ldd a, [hl]                       ;$71b3
ldd [hl], a                       ;$71b4
ld [hl], $30                      ;$71b5
and h                             ;$71b7
ldd [hl], a                       ;$71b8
inc l                             ;$71b9
xor b                             ;$71ba
ldi a, [hl]                       ;$71bb
and e                             ;$71bc
ld bc, $3aa4                      ;$71bd
ldd [hl], a                       ;$71c0
ld [hl], $30                      ;$71c1
and e                             ;$71c3
ldd [hl], a                       ;$71c4
ldd a, [hl]                       ;$71c5
and h                             ;$71c6
ld b, h                           ;$71c7
ld b, d                           ;$71c8
ld bc, $9d00                      ;$71c9
ld b, e                           ;$71cc
nop                               ;$71cd
add c                             ;$71ce
and e                             ;$71cf
ld c, b                           ;$71d0
and d                             ;$71d1
ld b, d                           ;$71d2
ld b, h                           ;$71d3
ld c, b                           ;$71d4
and c                             ;$71d5
ld d, d                           ;$71d6
ld c, [hl]                        ;$71d7
and d                             ;$71d8
ld b, h                           ;$71d9
ld b, d                           ;$71da
and a                             ;$71db
ldd a, [hl]                       ;$71dc
and d                             ;$71dd
ld b, h                           ;$71de
ld c, d                           ;$71df
ld bc, $48a2                      ;$71e0
ld b, h                           ;$71e3
and c                             ;$71e4
ld b, d                           ;$71e5
ld b, d                           ;$71e6
and d                             ;$71e7
ldd a, [hl]                       ;$71e8
ld b, d                           ;$71e9
ld b, h                           ;$71ea
and e                             ;$71eb
ld c, b                           ;$71ec
ld c, d                           ;$71ed
and e                             ;$71ee
ld b, h                           ;$71ef
ldd a, [hl]                       ;$71f0
ldd a, [hl]                       ;$71f1
ld bc, $1ea2                      ;$71f2
and e                             ;$71f5
inc a                             ;$71f6
and d                             ;$71f7
ld b, h                           ;$71f8
ld c, d                           ;$71f9
and c                             ;$71fa
ld c, d                           ;$71fb
ld c, d                           ;$71fc
and d                             ;$71fd
ld c, b                           ;$71fe
ld b, h                           ;$71ff
and a                             ;$7200
ld b, b                           ;$7201
and d                             ;$7202
ldd a, [hl]                       ;$7203
ld b, b                           ;$7204
and c                             ;$7205
ld b, h                           ;$7206
ld b, b                           ;$7207
and d                             ;$7208
inc a                             ;$7209
ldd a, [hl]                       ;$720a
ld b, d                           ;$720b
ldd a, [hl]                       ;$720c
ld b, d                           ;$720d
ld b, h                           ;$720e
ld c, b                           ;$720f
ld b, d                           ;$7210
ld c, d                           ;$7211
ld b, d                           ;$7212
and c                             ;$7213
ld b, h                           ;$7214
ld c, d                           ;$7215
ldd a, [hl]                       ;$7216
ld bc, $3aa3                      ;$7217
ldd a, [hl]                       ;$721a
ld bc, $9d00                      ;$721b
jr nc, $7220                      ;$721e
add c                             ;$7220
and h                             ;$7221
ldd [hl], a                       ;$7222
inc l                             ;$7223
jr nc, $7250                      ;$7224
inc l                             ;$7226
ldi [hl], a                       ;$7227
and h                             ;$7228
ldi [hl], a                       ;$7229
and e                             ;$722a
jr nc, $722e                      ;$722b
and h                             ;$722d
ldd [hl], a                       ;$722e
inc l                             ;$722f
jr nc, $725c                      ;$7230
and e                             ;$7232
inc l                             ;$7233
ldd [hl], a                       ;$7234
and h                             ;$7235
ldd a, [hl]                       ;$7236
ld [hl], $01                      ;$7237
nop                               ;$7239
sbc l                             ;$723a
ret                               ;$723b
ld l, [hl]                        ;$723c
jr nz, $71e1                      ;$723d
ldi [hl], a                       ;$723f
ldd a, [hl]                       ;$7240
ldi [hl], a                       ;$7241
ldd a, [hl]                       ;$7242
ldi [hl], a                       ;$7243
ldd a, [hl]                       ;$7244
ldi [hl], a                       ;$7245
ldd a, [hl]                       ;$7246
inc l                             ;$7247
ld b, h                           ;$7248
inc l                             ;$7249
ld b, h                           ;$724a
inc l                             ;$724b
ld b, h                           ;$724c
inc l                             ;$724d
ld b, h                           ;$724e
ldi a, [hl]                       ;$724f
ld b, d                           ;$7250
ldi a, [hl]                       ;$7251
ld b, d                           ;$7252
ldi [hl], a                       ;$7253
ldd a, [hl]                       ;$7254
ldi [hl], a                       ;$7255
ldd a, [hl]                       ;$7256
inc l                             ;$7257
ld b, h                           ;$7258
inc l                             ;$7259
ld b, h                           ;$725a
inc l                             ;$725b
ld b, h                           ;$725c
jr nc, $7291                      ;$725d
ld [hl], $1e                      ;$725f
ld bc, $011e                      ;$7261
ld e, $2c                         ;$7264
inc h                             ;$7266
ld a, [de]                        ;$7267
ldd [hl], a                       ;$7268
ld bc, $1a32                      ;$7269
jr z, $7296                       ;$726c
ld bc, $4830                      ;$726e
ld bc, $0148                      ;$7271
ldd a, [hl]                       ;$7274
ld bc, $2c42                      ;$7275
ldd a, [hl]                       ;$7278
inc l                             ;$7279
ldd a, [hl]                       ;$727a
and e                             ;$727b
inc l                             ;$727c
ld bc, $9d00                      ;$727d
ret                               ;$7280
ld l, [hl]                        ;$7281
jr nz, $7226                      ;$7282
ld b, h                           ;$7284
ld d, d                           ;$7285
ld b, h                           ;$7286
ld d, d                           ;$7287
ld b, h                           ;$7288
ld d, d                           ;$7289
ld b, h                           ;$728a
ld d, d                           ;$728b
ld b, d                           ;$728c
ld d, d                           ;$728d
ld b, d                           ;$728e
ld d, d                           ;$728f
ld b, d                           ;$7290
ld d, d                           ;$7291
ld b, d                           ;$7292
ld d, d                           ;$7293
ld b, h                           ;$7294
ld d, d                           ;$7295
ld b, h                           ;$7296
ld d, d                           ;$7297
ld b, h                           ;$7298
ld d, d                           ;$7299
ld b, h                           ;$729a
ld d, d                           ;$729b
ld b, d                           ;$729c
ld d, d                           ;$729d
ld b, d                           ;$729e
ld d, d                           ;$729f
and h                             ;$72a0
ld bc, $a200                      ;$72a1
ld bc, $0106                      ;$72a4
ld b, $01                         ;$72a7
and c                             ;$72a9
ld b, $06                         ;$72aa
and d                             ;$72ac
ld bc, $0106                      ;$72ad
ld b, $01                         ;$72b0
ld b, $01                         ;$72b2
ld b, $06                         ;$72b4
ld b, $00                         ;$72b6
dec bc                            ;$72b8
ld [hl], e                        ;$72b9
ccf                               ;$72ba
ld [hl], e                        ;$72bb
ld h, a                           ;$72bc
ld [hl], e                        ;$72bd
ld h, a                           ;$72be
ld [hl], e                        ;$72bf
ret                               ;$72c0
ld [hl], e                        ;$72c1
rst $38                           ;$72c2
rst $38                           ;$72c3
cp b                              ;$72c4
ld [hl], d                        ;$72c5
ld [$3c73], sp                    ;$72c6
ld [hl], e                        ;$72c9
adc [hl]                          ;$72ca
ld [hl], e                        ;$72cb
adc [hl]                          ;$72cc
ld [hl], e                        ;$72cd
ld c, e                           ;$72ce
ld [hl], h                        ;$72cf
rst $38                           ;$72d0
rst $38                           ;$72d1
add a, $72                        ;$72d2
rra                               ;$72d4
ld [hl], e                        ;$72d5
ld d, e                           ;$72d6
ld [hl], e                        ;$72d7
or l                              ;$72d8
ld [hl], e                        ;$72d9
or l                              ;$72da
ld [hl], e                        ;$72db
or l                              ;$72dc
ld [hl], e                        ;$72dd
or l                              ;$72de
ld [hl], e                        ;$72df
or l                              ;$72e0
ld [hl], e                        ;$72e1
or l                              ;$72e2
ld [hl], e                        ;$72e3
ret nz                            ;$72e4
ld [hl], h                        ;$72e5
sbc a, $74                        ;$72e6
sbc a, $74                        ;$72e8
sbc a, $74                        ;$72ea
xor $74                           ;$72ec
cp $74                            ;$72ee
cp $74                            ;$72f0
ld c, $75                         ;$72f2
ld c, $75                         ;$72f4
ld e, $75                         ;$72f6
ld e, $75                         ;$72f8
ld c, $75                         ;$72fa
ld l, $75                         ;$72fc
rst $38                           ;$72fe
rst $38                           ;$72ff
call nc, $3372                    ;$7300
ld [hl], e                        ;$7303
rst $38                           ;$7304
rst $38                           ;$7305
ld [bc], a                        ;$7306
ld [hl], e                        ;$7307
and l                             ;$7308
ld bc, $9d00                      ;$7309
ld h, d                           ;$730c
nop                               ;$730d
add b                             ;$730e
and d                             ;$730f
ldd a, [hl]                       ;$7310
and c                             ;$7311
ldd a, [hl]                       ;$7312
ldd a, [hl]                       ;$7313
and d                             ;$7314
jr nc, $7347                      ;$7315
ldd a, [hl]                       ;$7317
and c                             ;$7318
ldd a, [hl]                       ;$7319
ldd a, [hl]                       ;$731a
and d                             ;$731b
jr nc, $734e                      ;$731c
nop                               ;$731e
sbc l                             ;$731f
jp hl                             ;$7320
ld l, [hl]                        ;$7321
and b                             ;$7322
and d                             ;$7323
ldd a, [hl]                       ;$7324
and c                             ;$7325
ldd a, [hl]                       ;$7326
ldd a, [hl]                       ;$7327
and d                             ;$7328
jr nc, $735b                      ;$7329
ldd a, [hl]                       ;$732b
and c                             ;$732c
ldd a, [hl]                       ;$732d
ldd a, [hl]                       ;$732e
and d                             ;$732f
jr nc, $7362                      ;$7330
nop                               ;$7332
and d                             ;$7333
ld b, $a1                         ;$7334
ld b, $06                         ;$7336
and d                             ;$7338
ld b, $06                         ;$7339
nop                               ;$733b
and l                             ;$733c
ld bc, $9d00                      ;$733d
ldd [hl], a                       ;$7340
nop                               ;$7341
add b                             ;$7342
and d                             ;$7343
ldd a, [hl]                       ;$7344
and c                             ;$7345
ldd a, [hl]                       ;$7346
ldd a, [hl]                       ;$7347
and d                             ;$7348
jr nc, $737b                      ;$7349
ldd a, [hl]                       ;$734b
and c                             ;$734c
ldd a, [hl]                       ;$734d
ldd a, [hl]                       ;$734e
and d                             ;$734f
jr nc, $7382                      ;$7350
nop                               ;$7352
sbc l                             ;$7353
jp hl                             ;$7354
ld l, [hl]                        ;$7355
and b                             ;$7356
and d                             ;$7357
ldd a, [hl]                       ;$7358
and c                             ;$7359
ldd a, [hl]                       ;$735a
ldd a, [hl]                       ;$735b
and d                             ;$735c
jr nc, $738f                      ;$735d
ldd a, [hl]                       ;$735f
and c                             ;$7360
ldd a, [hl]                       ;$7361
ldd a, [hl]                       ;$7362
and d                             ;$7363
jr nc, $7396                      ;$7364
nop                               ;$7366
sbc l                             ;$7367
add d                             ;$7368
nop                               ;$7369
add b                             ;$736a
and d                             ;$736b
ldd a, [hl]                       ;$736c
ld c, b                           ;$736d
ld d, d                           ;$736e
ld d, b                           ;$736f
ld d, d                           ;$7370
and c                             ;$7371
ld c, b                           ;$7372
ld c, b                           ;$7373
and d                             ;$7374
ld c, d                           ;$7375
ld b, h                           ;$7376
ld c, b                           ;$7377
and c                             ;$7378
ld b, b                           ;$7379
ld b, b                           ;$737a
and d                             ;$737b
ld b, h                           ;$737c
ld a, $40                         ;$737d
and c                             ;$737f
ldd a, [hl]                       ;$7380
ldd a, [hl]                       ;$7381
and d                             ;$7382
ld a, $38                         ;$7383
ldd a, [hl]                       ;$7385
jr nc, $73ba                      ;$7386
jr c, $73c4                       ;$7388
jr nc, $73be                      ;$738a
ld a, $00                         ;$738c
sbc l                             ;$738e
ld d, e                           ;$738f
nop                               ;$7390
ld b, b                           ;$7391
and d                             ;$7392
jr nc, $73d5                      ;$7393
ld b, b                           ;$7395
ld b, h                           ;$7396
ld b, b                           ;$7397
and c                             ;$7398
ld a, $40                         ;$7399
and d                             ;$739b
ld b, h                           ;$739c
ld a, $40                         ;$739d
and c                             ;$739f
jr c, $73dc                       ;$73a0
and d                             ;$73a2
ld a, $38                         ;$73a3
ldd a, [hl]                       ;$73a5
and c                             ;$73a6
ld l, $30                         ;$73a7
and d                             ;$73a9
jr c, $73dc                       ;$73aa
jr nc, $73d6                      ;$73ac
inc l                             ;$73ae
inc l                             ;$73af
jr nc, $73da                      ;$73b0
inc l                             ;$73b2
jr c, $73b5                       ;$73b3
sbc l                             ;$73b5
jp hl                             ;$73b6
ld l, [hl]                        ;$73b7
and b                             ;$73b8
and d                             ;$73b9
ldd a, [hl]                       ;$73ba
and c                             ;$73bb
ldd a, [hl]                       ;$73bc
ldd a, [hl]                       ;$73bd
and d                             ;$73be
jr nc, $73f1                      ;$73bf
ldd a, [hl]                       ;$73c1
and c                             ;$73c2
ldd a, [hl]                       ;$73c3
ldd a, [hl]                       ;$73c4
and d                             ;$73c5
jr nc, $73f8                      ;$73c6
nop                               ;$73c8
xor b                             ;$73c9
ldd a, [hl]                       ;$73ca
and d                             ;$73cb
ld a, $38                         ;$73cc
xor b                             ;$73ce
ldd a, [hl]                       ;$73cf
and e                             ;$73d0
ld a, $a2                         ;$73d1
ld b, b                           ;$73d3
and c                             ;$73d4
ld b, b                           ;$73d5
ld b, b                           ;$73d6
and d                             ;$73d7
ld b, h                           ;$73d8
ld a, $40                         ;$73d9
and c                             ;$73db
ld b, b                           ;$73dc
ld b, b                           ;$73dd
and d                             ;$73de
ld b, h                           ;$73df
ld a, $a8                         ;$73e0
ld b, b                           ;$73e2
and e                             ;$73e3
ld b, h                           ;$73e4
and d                             ;$73e5
ld c, b                           ;$73e6
and c                             ;$73e7
ld c, b                           ;$73e8
ld c, b                           ;$73e9
and d                             ;$73ea
ld c, d                           ;$73eb
ld b, h                           ;$73ec
ld c, b                           ;$73ed
and c                             ;$73ee
ld c, b                           ;$73ef
ld c, b                           ;$73f0
and d                             ;$73f1
ld c, d                           ;$73f2
ld b, h                           ;$73f3
xor b                             ;$73f4
ld c, b                           ;$73f5
and e                             ;$73f6
ld c, h                           ;$73f7
and d                             ;$73f8
ld c, [hl]                        ;$73f9
and c                             ;$73fa
ld c, [hl]                        ;$73fb
ld c, [hl]                        ;$73fc
and d                             ;$73fd
ld c, [hl]                        ;$73fe
ld c, [hl]                        ;$73ff
ld d, d                           ;$7400
ld c, [hl]                        ;$7401
ld c, [hl]                        ;$7402
ld c, h                           ;$7403
ld c, [hl]                        ;$7404
and c                             ;$7405
ld c, [hl]                        ;$7406
ld c, [hl]                        ;$7407
and d                             ;$7408
ld c, [hl]                        ;$7409
ld c, [hl]                        ;$740a
ld d, d                           ;$740b
ld c, [hl]                        ;$740c
ld c, [hl]                        ;$740d
ld c, h                           ;$740e
ld c, [hl]                        ;$740f
and c                             ;$7410
ld c, [hl]                        ;$7411
ld c, [hl]                        ;$7412
and d                             ;$7413
ld c, [hl]                        ;$7414
ld c, [hl]                        ;$7415
ld c, h                           ;$7416
and c                             ;$7417
ld c, h                           ;$7418
ld c, h                           ;$7419
and d                             ;$741a
ld c, h                           ;$741b
ld c, h                           ;$741c
ld c, d                           ;$741d
and c                             ;$741e
ld c, d                           ;$741f
ld c, d                           ;$7420
and d                             ;$7421
ld c, d                           ;$7422
ld b, h                           ;$7423
ld a, $40                         ;$7424
ld b, h                           ;$7426
ld [hl], $44                      ;$7427
and c                             ;$7429
ld b, b                           ;$742a
ld b, b                           ;$742b
and d                             ;$742c
ld [hl], $a3                      ;$742d
ld b, b                           ;$742f
and c                             ;$7430
ld [hl], $3a                      ;$7431
and d                             ;$7433
ld [hl], $30                      ;$7434
ld b, h                           ;$7436
and c                             ;$7437
ld b, b                           ;$7438
ld b, b                           ;$7439
and d                             ;$743a
ld [hl], $a3                      ;$743b
ld b, b                           ;$743d
and c                             ;$743e
ld [hl], $3a                      ;$743f
and d                             ;$7441
ld [hl], $2e                      ;$7442
and l                             ;$7444
ld [hl], $a8                      ;$7445
ld bc, $38a3                      ;$7447
nop                               ;$744a
xor b                             ;$744b
jr nc, $73f0                      ;$744c
jr nc, $7480                      ;$744e
xor b                             ;$7450
jr nc, $73f6                      ;$7451
ld [hl], $a5                      ;$7453
ld bc, $01a8                      ;$7455
and e                             ;$7458
ld a, $a2                         ;$7459
ld b, b                           ;$745b
and c                             ;$745c
ld b, b                           ;$745d
ld b, b                           ;$745e
and d                             ;$745f
ld b, h                           ;$7460
ld a, $40                         ;$7461
and c                             ;$7463
ld b, b                           ;$7464
ld b, b                           ;$7465
and d                             ;$7466
ld b, h                           ;$7467
ld a, $a8                         ;$7468
ld [hl], $a3                      ;$746a
ldd a, [hl]                       ;$746c
and d                             ;$746d
ld a, $a1                         ;$746e
ld b, b                           ;$7470
ld b, h                           ;$7471
and d                             ;$7472
ld a, $44                         ;$7473
ld c, b                           ;$7475
ld c, b                           ;$7476
ld c, b                           ;$7477
ldd a, [hl]                       ;$7478
ld a, $a1                         ;$7479
ld b, b                           ;$747b
ld b, h                           ;$747c
and d                             ;$747d
ld a, $44                         ;$747e
ld b, [hl]                        ;$7480
ld b, [hl]                        ;$7481
ld b, [hl]                        ;$7482
ldd a, [hl]                       ;$7483
ld a, $a1                         ;$7484
ld b, b                           ;$7486
ld b, h                           ;$7487
and d                             ;$7488
ld a, $44                         ;$7489
ldd a, [hl]                       ;$748b
and c                             ;$748c
ld a, $40                         ;$748d
and d                             ;$748f
ldd a, [hl]                       ;$7490
ld b, b                           ;$7491
ldd a, [hl]                       ;$7492
and c                             ;$7493
ld a, $40                         ;$7494
and d                             ;$7496
ld a, $3e                         ;$7497
inc l                             ;$7499
ldd a, [hl]                       ;$749a
ld a, $26                         ;$749b
jr nc, $7440                      ;$749d
jr nc, $74d1                      ;$749f
and d                             ;$74a1
jr nc, $7447                      ;$74a2
jr nc, $7447                      ;$74a4
jr nc, $74dc                      ;$74a6
and d                             ;$74a8
jr nc, $74d3                      ;$74a9
ld l, $a1                         ;$74ab
ld l, $2e                         ;$74ad
and d                             ;$74af
ld l, $a3                         ;$74b0
ld l, $a1                         ;$74b2
ld l, $32                         ;$74b4
and d                             ;$74b6
ld l, $28                         ;$74b7
and l                             ;$74b9
ld h, $a8                         ;$74ba
ld bc, $2ca3                      ;$74bc
nop                               ;$74bf
and d                             ;$74c0
ldd a, [hl]                       ;$74c1
and c                             ;$74c2
ldd a, [hl]                       ;$74c3
ldd a, [hl]                       ;$74c4
and d                             ;$74c5
ldd [hl], a                       ;$74c6
inc l                             ;$74c7
ldd a, [hl]                       ;$74c8
and c                             ;$74c9
ldd a, [hl]                       ;$74ca
ldd a, [hl]                       ;$74cb
and d                             ;$74cc
jr c, $74ff                       ;$74cd
ldd a, [hl]                       ;$74cf
and c                             ;$74d0
ldd a, [hl]                       ;$74d1
ldd a, [hl]                       ;$74d2
and d                             ;$74d3
ldd [hl], a                       ;$74d4
inc l                             ;$74d5
ldd a, [hl]                       ;$74d6
and c                             ;$74d7
ldd a, [hl]                       ;$74d8
ldd a, [hl]                       ;$74d9
and d                             ;$74da
inc l                             ;$74db
ld e, $00                         ;$74dc
and d                             ;$74de
jr z, $7482                       ;$74df
ld b, b                           ;$74e1
jr z, $7486                       ;$74e2
ld e, $36                         ;$74e4
jr z, $7489                       ;$74e6
ld b, b                           ;$74e8
jr z, $748d                       ;$74e9
ld e, $36                         ;$74eb
nop                               ;$74ed
and d                             ;$74ee
jr z, $7492                       ;$74ef
ld b, b                           ;$74f1
jr z, $7496                       ;$74f2
ld e, $36                         ;$74f4
jr z, $7499                       ;$74f6
ld b, b                           ;$74f8
jr z, $749d                       ;$74f9
inc l                             ;$74fb
ld b, h                           ;$74fc
nop                               ;$74fd
and d                             ;$74fe
ld e, $a1                         ;$74ff
ld [hl], $1e                      ;$7501
and d                             ;$7503
ld e, $36                         ;$7504
jr z, $74a9                       ;$7506
ld b, b                           ;$7508
jr z, $74ad                       ;$7509
jr z, $754d                       ;$750b
nop                               ;$750d
and d                             ;$750e
ld e, $a1                         ;$750f
ld [hl], $1e                      ;$7511
and d                             ;$7513
ld e, $36                         ;$7514
ld e, $a1                         ;$7516
ld [hl], $1e                      ;$7518
and d                             ;$751a
ld e, $36                         ;$751b
nop                               ;$751d
and d                             ;$751e
ldi [hl], a                       ;$751f
and c                             ;$7520
ldd a, [hl]                       ;$7521
ldi [hl], a                       ;$7522
and d                             ;$7523
ldi [hl], a                       ;$7524
ldd a, [hl]                       ;$7525
ldi [hl], a                       ;$7526
and c                             ;$7527
ldd a, [hl]                       ;$7528
ldi [hl], a                       ;$7529
and d                             ;$752a
ldi [hl], a                       ;$752b
ldd a, [hl]                       ;$752c
nop                               ;$752d
and d                             ;$752e
ld e, $a1                         ;$752f
ld [hl], $1e                      ;$7531
and d                             ;$7533
ld e, $36                         ;$7534
ld e, $a1                         ;$7536
ld [hl], $1e                      ;$7538
and d                             ;$753a
and h                             ;$753b
ld a, $00                         ;$753c
ld [hl], $3e                      ;$753e
ld b, h                           ;$7540
and h                             ;$7541
ld b, h                           ;$7542
ld d, a                           ;$7543
ld [hl], l                        ;$7544
ld h, d                           ;$7545
ld [hl], l                        ;$7546
rst $38                           ;$7547
rst $38                           ;$7548
ld b, l                           ;$7549
ld [hl], l                        ;$754a
ld e, [hl]                        ;$754b
ld [hl], l                        ;$754c
rst $38                           ;$754d
rst $38                           ;$754e
ld c, e                           ;$754f
ld [hl], l                        ;$7550
ld a, h                           ;$7551
ld [hl], l                        ;$7552
rst $38                           ;$7553
rst $38                           ;$7554
ld d, c                           ;$7555
ld [hl], l                        ;$7556
sbc l                             ;$7557
jr nz, $755a                      ;$7558
add c                             ;$755a
xor d                             ;$755b
ld bc, $9d00                      ;$755c
ld [hl], b                        ;$755f
nop                               ;$7560
add c                             ;$7561
and d                             ;$7562
ld b, d                           ;$7563
ldd [hl], a                       ;$7564
jr c, $75a9                       ;$7565
ld b, [hl]                        ;$7567
inc [hl]                          ;$7568
inc a                             ;$7569
ld b, [hl]                        ;$756a
ld c, d                           ;$756b
jr c, $75b0                       ;$756c
ld c, d                           ;$756e
ld c, h                           ;$756f
inc a                             ;$7570
ld b, d                           ;$7571
ld c, h                           ;$7572
ld b, [hl]                        ;$7573
inc [hl]                          ;$7574
inc a                             ;$7575
ld b, [hl]                        ;$7576
ld b, b                           ;$7577
ld l, $34                         ;$7578
ld b, b                           ;$757a
nop                               ;$757b
sbc l                             ;$757c
jp hl                             ;$757d
ld l, [hl]                        ;$757e
ld hl, $42a8                      ;$757f
and e                             ;$7582
ldi a, [hl]                       ;$7583
xor b                             ;$7584
ld b, d                           ;$7585
and e                             ;$7586
ldi a, [hl]                       ;$7587
xor b                             ;$7588
ld b, d                           ;$7589
and e                             ;$758a
ldi a, [hl]                       ;$758b
nop                               ;$758c
and c                             ;$758d
ld [hl], l                        ;$758e
xor h                             ;$758f
ld [hl], l                        ;$7590
rst $38                           ;$7591
rst $38                           ;$7592
adc a                             ;$7593
ld [hl], l                        ;$7594
xor b                             ;$7595
ld [hl], l                        ;$7596
rst $38                           ;$7597
rst $38                           ;$7598
sub l                             ;$7599
ld [hl], l                        ;$759a
xor $75                           ;$759b
rst $38                           ;$759d
rst $38                           ;$759e
sbc e                             ;$759f
ld [hl], l                        ;$75a0
sbc l                             ;$75a1
jr nz, $75a4                      ;$75a2
add c                             ;$75a4
xor d                             ;$75a5
ld bc, $9d00                      ;$75a6
ld [hl], b                        ;$75a9
nop                               ;$75aa
add c                             ;$75ab
and d                             ;$75ac
ld c, h                           ;$75ad
ld b, d                           ;$75ae
ld d, b                           ;$75af
ld b, d                           ;$75b0
ld d, h                           ;$75b1
ld b, d                           ;$75b2
ld d, b                           ;$75b3
ld b, d                           ;$75b4
ld d, [hl]                        ;$75b5
ld b, d                           ;$75b6
ld d, h                           ;$75b7
ld b, d                           ;$75b8
ld d, b                           ;$75b9
ld b, d                           ;$75ba
ld d, h                           ;$75bb
ld b, d                           ;$75bc
ld c, h                           ;$75bd
ld b, d                           ;$75be
ld d, b                           ;$75bf
ld b, d                           ;$75c0
ld d, h                           ;$75c1
ld b, d                           ;$75c2
ld d, b                           ;$75c3
ld b, d                           ;$75c4
ld d, [hl]                        ;$75c5
ld b, d                           ;$75c6
ld d, h                           ;$75c7
ld b, d                           ;$75c8
ld d, b                           ;$75c9
ld b, d                           ;$75ca
ld d, h                           ;$75cb
ld b, d                           ;$75cc
ld e, d                           ;$75cd
ld b, [hl]                        ;$75ce
ld d, [hl]                        ;$75cf
ld b, [hl]                        ;$75d0
ld d, h                           ;$75d1
ld b, [hl]                        ;$75d2
ld d, b                           ;$75d3
ld b, [hl]                        ;$75d4
ld c, [hl]                        ;$75d5
ld b, [hl]                        ;$75d6
ld d, b                           ;$75d7
ld b, [hl]                        ;$75d8
ld d, h                           ;$75d9
ld b, [hl]                        ;$75da
ld d, b                           ;$75db
ld b, [hl]                        ;$75dc
ld d, b                           ;$75dd
ld a, $4c                         ;$75de
ld a, $4c                         ;$75e0
ld a, $4a                         ;$75e2
ld a, $4a                         ;$75e4
ld a, $46                         ;$75e6
ld a, $4a                         ;$75e8
ld a, $50                         ;$75ea
ld a, $00                         ;$75ec
sbc l                             ;$75ee
jp hl                             ;$75ef
ld l, [hl]                        ;$75f0
ld hl, $4ca5                      ;$75f1
ld c, d                           ;$75f4
ld b, [hl]                        ;$75f5
ld b, d                           ;$75f6
jr c, $7637                       ;$75f7
ld b, d                           ;$75f9
ld b, d                           ;$75fa
nop                               ;$75fb
inc b                             ;$75fc
halt                              ;$75fd
nop                               ;$75fe
nop                               ;$75ff
inc d                             ;$7600
halt                              ;$7601
inc hl                            ;$7602
halt                              ;$7603
sbc l                             ;$7604
or d                              ;$7605
nop                               ;$7606
add b                             ;$7607
and d                             ;$7608
ld h, b                           ;$7609
ld e, h                           ;$760a
ld h, b                           ;$760b
ld e, h                           ;$760c
ld h, b                           ;$760d
ld h, d                           ;$760e
ld h, b                           ;$760f
ld e, h                           ;$7610
and h                             ;$7611
ld h, b                           ;$7612
nop                               ;$7613
sbc l                             ;$7614
sub d                             ;$7615
nop                               ;$7616
add b                             ;$7617
and d                             ;$7618
ld d, d                           ;$7619
ld c, [hl]                        ;$761a
ld d, d                           ;$761b
ld c, [hl]                        ;$761c
ld d, d                           ;$761d
ld d, h                           ;$761e
ld d, d                           ;$761f
ld c, [hl]                        ;$7620
and h                             ;$7621
ld d, d                           ;$7622
sbc l                             ;$7623
jp hl                             ;$7624
ld l, [hl]                        ;$7625
jr nz, $75ca                      ;$7626
ld h, d                           ;$7628
ld h, b                           ;$7629
ld h, d                           ;$762a
ld h, b                           ;$762b
ld h, d                           ;$762c
ld h, [hl]                        ;$762d
ld h, d                           ;$762e
ld h, b                           ;$762f
and e                             ;$7630
ld h, d                           ;$7631
ld bc, $766f                      ;$7632
ld l, c                           ;$7635
ld [hl], a                        ;$7636
ld l, c                           ;$7637
ld [hl], a                        ;$7638
nop                               ;$7639
nop                               ;$763a
cp a                              ;$763b
halt                              ;$763c
xor d                             ;$763d
ld [hl], a                        ;$763e
inc a                             ;$763f
ld a, b                           ;$7640
inc c                             ;$7641
ld [hl], a                        ;$7642
db $eb ;<unknown instruction>     ;$7643
ld [hl], a                        ;$7644
db $eb ;<unknown instruction>     ;$7645
ld [hl], a                        ;$7646
push af                           ;$7647
ld [hl], a                        ;$7648
db $eb ;<unknown instruction>     ;$7649
ld [hl], a                        ;$764a
db $eb ;<unknown instruction>     ;$764b
ld [hl], a                        ;$764c
cp $77                            ;$764d
push af                           ;$764f
ld [hl], a                        ;$7650
db $eb ;<unknown instruction>     ;$7651
ld [hl], a                        ;$7652
db $eb ;<unknown instruction>     ;$7653
ld [hl], a                        ;$7654
cp $77                            ;$7655
push af                           ;$7657
ld [hl], a                        ;$7658
rlca                              ;$7659
ld a, b                           ;$765a
ld de, $fe78                      ;$765b
ld [hl], a                        ;$765e
push af                           ;$765f
ld [hl], a                        ;$7660
db $eb ;<unknown instruction>     ;$7661
ld [hl], a                        ;$7662
ld e, e                           ;$7663
ld [hl], a                        ;$7664
ld e, e                           ;$7665
ld [hl], a                        ;$7666
ld a, [de]                        ;$7667
ld a, b                           ;$7668
ld a, [de]                        ;$7669
ld a, b                           ;$766a
ld a, [de]                        ;$766b
ld a, b                           ;$766c
ld a, [de]                        ;$766d
ld a, b                           ;$766e
sbc l                             ;$766f
jp $8000                          ;$7670
and d                             ;$7673
inc a                             ;$7674
ld a, $3c                         ;$7675
ld a, $38                         ;$7677
ld d, b                           ;$7679
and e                             ;$767a
ld bc, $3ca2                      ;$767b
ld a, $3c                         ;$767e
ld a, $38                         ;$7680
ld d, b                           ;$7682
and e                             ;$7683
ld bc, $01a2                      ;$7684
ld c, b                           ;$7687
ld bc, $0146                      ;$7688
ld b, d                           ;$768b
ld bc, $a146                      ;$768c
ld b, d                           ;$768f
ld b, [hl]                        ;$7690
and d                             ;$7691
ld b, d                           ;$7692
ld b, d                           ;$7693
jr c, $7639                       ;$7694
inc a                             ;$7696
ld bc, $3ea2                      ;$7697
ld b, d                           ;$769a
ld a, $42                         ;$769b
inc a                             ;$769d
ld d, h                           ;$769e
and e                             ;$769f
ld bc, $3ea2                      ;$76a0
ld b, d                           ;$76a3
ld a, $42                         ;$76a4
inc a                             ;$76a6
ld d, h                           ;$76a7
and e                             ;$76a8
ld bc, $01a2                      ;$76a9
ld d, [hl]                        ;$76ac
ld bc, $0154                      ;$76ad
ld d, h                           ;$76b0
ld bc, $a250                      ;$76b1
ld bc, $50a1                      ;$76b4
ld d, h                           ;$76b7
and d                             ;$76b8
ld d, b                           ;$76b9
ld c, [hl]                        ;$76ba
and e                             ;$76bb
ld d, b                           ;$76bc
ld bc, $9d00                      ;$76bd
ld [hl], h                        ;$76c0
nop                               ;$76c1
add b                             ;$76c2
and d                             ;$76c3
ld [hl], $38                      ;$76c4
ld [hl], $38                      ;$76c6
ld l, $3e                         ;$76c8
and e                             ;$76ca
ld bc, $36a2                      ;$76cb
jr c, $7706                       ;$76ce
jr c, $7700                       ;$76d0
ld a, $a3                         ;$76d2
ld bc, $01a2                      ;$76d4
ld [hl], $01                      ;$76d7
ld [hl], $01                      ;$76d9
ldd [hl], a                       ;$76db
ld bc, $3636                      ;$76dc
ldd [hl], a                       ;$76df
ldd [hl], a                       ;$76e0
jr nc, $7686                      ;$76e1
ld [hl], $01                      ;$76e3
and d                             ;$76e5
jr c, $7724                       ;$76e6
jr c, $7726                       ;$76e8
ld [hl], $4e                      ;$76ea
and e                             ;$76ec
ld bc, $38a2                      ;$76ed
inc a                             ;$76f0
jr c, $772f                       ;$76f1
ld [hl], $4e                      ;$76f3
and e                             ;$76f5
ld bc, $01a2                      ;$76f6
ld d, b                           ;$76f9
ld bc, $014e                      ;$76fa
ld b, [hl]                        ;$76fd
ld bc, $a246                      ;$76fe
ld bc, $48a1                      ;$7701
ld c, [hl]                        ;$7704
and d                             ;$7705
ld c, b                           ;$7706
ld b, [hl]                        ;$7707
and e                             ;$7708
ld b, b                           ;$7709
ld bc, $9d00                      ;$770a
jp hl                             ;$770d
ld l, [hl]                        ;$770e
jr nz, $76b3                      ;$770f
ld c, b                           ;$7711
ld b, [hl]                        ;$7712
ld c, b                           ;$7713
ld b, [hl]                        ;$7714
ld a, $20                         ;$7715
and e                             ;$7717
ld bc, $48a2                      ;$7718
ld b, [hl]                        ;$771b
ld c, b                           ;$771c
ld b, [hl]                        ;$771d
ld a, $20                         ;$771e
and e                             ;$7720
ld bc, $2ea2                      ;$7721
inc a                             ;$7724
ld l, $24                         ;$7725
inc h                             ;$7727
inc h                             ;$7728
inc h                             ;$7729
inc a                             ;$772a
ldi a, [hl]                       ;$772b
ld a, $2a                         ;$772c
ld a, $a6                         ;$772e
ld l, $a3                         ;$7730
ld bc, $01a1                      ;$7732
and d                             ;$7735
ld c, b                           ;$7736
ld b, [hl]                        ;$7737
ld c, b                           ;$7738
ld b, [hl]                        ;$7739
ld l, $2e                         ;$773a
and e                             ;$773c
ld bc, $48a2                      ;$773d
ld b, [hl]                        ;$7740
ld c, b                           ;$7741
ld b, [hl]                        ;$7742
ld l, $2e                         ;$7743
and e                             ;$7745
ld bc, $2aa2                      ;$7746
inc a                             ;$7749
ldi a, [hl]                       ;$774a
inc a                             ;$774b
ld l, $3e                         ;$774c
ld l, $3e                         ;$774e
ld l, $42                         ;$7750
ld l, $42                         ;$7752
and [hl]                          ;$7754
jr c, $76fa                       ;$7755
ld bc, $01a1                      ;$7757
nop                               ;$775a
xor b                             ;$775b
ld bc, $06a2                      ;$775c
dec bc                            ;$775f
xor b                             ;$7760
ld bc, $06a2                      ;$7761
dec bc                            ;$7764
and l                             ;$7765
ld bc, $0001                      ;$7766
sbc l                             ;$7769
push bc                           ;$776a
nop                               ;$776b
add b                             ;$776c
and c                             ;$776d
ld b, [hl]                        ;$776e
ld c, d                           ;$776f
and h                             ;$7770
ld b, [hl]                        ;$7771
and d                             ;$7772
ld bc, $50a3                      ;$7773
xor b                             ;$7776
ld c, d                           ;$7777
and e                             ;$7778
ld bc, $42a1                      ;$7779
ld b, [hl]                        ;$777c
and h                             ;$777d
ld b, d                           ;$777e
and d                             ;$777f
ld bc, $4ea3                      ;$7780
and c                             ;$7783
ld c, [hl]                        ;$7784
ld d, b                           ;$7785
and h                             ;$7786
ld b, [hl]                        ;$7787
and a                             ;$7788
ld bc, $40a1                      ;$7789
ld b, [hl]                        ;$778c
and h                             ;$778d
ld b, b                           ;$778e
and d                             ;$778f
ld bc, $46a3                      ;$7790
and c                             ;$7793
ld b, [hl]                        ;$7794
ld c, d                           ;$7795
and h                             ;$7796
ld b, d                           ;$7797
and a                             ;$7798
ld bc, $36a1                      ;$7799
jr c, $7742                       ;$779c
ld [hl], $a2                      ;$779e
ld bc, $3ca3                      ;$77a0
and a                             ;$77a3
ld b, d                           ;$77a4
and h                             ;$77a5
ld b, b                           ;$77a6
and d                             ;$77a7
ld bc, $9d00                      ;$77a8
add h                             ;$77ab
nop                               ;$77ac
ld b, c                           ;$77ad
and c                             ;$77ae
ld b, b                           ;$77af
ld b, d                           ;$77b0
and h                             ;$77b1
ld b, b                           ;$77b2
and d                             ;$77b3
ld bc, $40a3                      ;$77b4
xor b                             ;$77b7
ld b, d                           ;$77b8
and e                             ;$77b9
ld bc, $3ca1                      ;$77ba
ld b, b                           ;$77bd
and h                             ;$77be
inc a                             ;$77bf
and d                             ;$77c0
ld bc, $3ca3                      ;$77c1
and c                             ;$77c4
inc a                             ;$77c5
ld b, b                           ;$77c6
and h                             ;$77c7
ld b, b                           ;$77c8
and a                             ;$77c9
ld bc, $36a1                      ;$77ca
ldd [hl], a                       ;$77cd
and h                             ;$77ce
ld l, $a2                         ;$77cf
ld bc, $40a3                      ;$77d1
and c                             ;$77d4
ld [hl], $38                      ;$77d5
and h                             ;$77d7
ldd [hl], a                       ;$77d8
and a                             ;$77d9
ld bc, $2ea1                      ;$77da
ldd [hl], a                       ;$77dd
and h                             ;$77de
ld l, $a2                         ;$77df
ld bc, $2aa3                      ;$77e1
and a                             ;$77e4
jr nc, $778b                      ;$77e5
ld l, $a2                         ;$77e7
ld bc, $a200                      ;$77e9
jr c, $7826                       ;$77ec
ld bc, $3838                      ;$77ee
jr c, $77f4                       ;$77f1
jr c, $77f5                       ;$77f3
ld l, $2e                         ;$77f5
ld bc, $2e2e                      ;$77f7
ld l, $01                         ;$77fa
ld l, $00                         ;$77fc
ldi a, [hl]                       ;$77fe
ldi a, [hl]                       ;$77ff
ld bc, $2a2a                      ;$7800
ldi a, [hl]                       ;$7803
ld bc, $002a                      ;$7804
and d                             ;$7807
jr c, $7842                       ;$7808
ld bc, $3638                      ;$780a
ld [hl], $01                      ;$780d
ld [hl], $00                      ;$780f
ldd [hl], a                       ;$7811
ldd [hl], a                       ;$7812
ld bc, $2e32                      ;$7813
ld l, $01                         ;$7816
ld l, $00                         ;$7818
and d                             ;$781a
ld b, $0b                         ;$781b
ld bc, $0606                      ;$781d
dec bc                            ;$7820
ld bc, $0606                      ;$7821
dec bc                            ;$7824
ld bc, $0606                      ;$7825
dec bc                            ;$7828
ld bc, $0606                      ;$7829
dec bc                            ;$782c
ld bc, $0606                      ;$782d
dec bc                            ;$7830
ld bc, $0606                      ;$7831
dec bc                            ;$7834
ld bc, $0106                      ;$7835
dec bc                            ;$7838
ld bc, $000b                      ;$7839
sbc l                             ;$783c
ld h, [hl]                        ;$783d
nop                               ;$783e
add c                             ;$783f
and a                             ;$7840
ld e, b                           ;$7841
ld e, d                           ;$7842
and e                             ;$7843
ld e, b                           ;$7844
and a                             ;$7845
ld e, [hl]                        ;$7846
and h                             ;$7847
ld e, d                           ;$7848
and d                             ;$7849
ld bc, $50a7                      ;$784a
ld d, h                           ;$784d
and e                             ;$784e
ld e, b                           ;$784f
and a                             ;$7850
ld e, d                           ;$7851
and h                             ;$7852
ld e, b                           ;$7853
and d                             ;$7854
ld bc, $50a7                      ;$7855
and e                             ;$7858
ld c, [hl]                        ;$7859
and a                             ;$785a
ld c, [hl]                        ;$785b
ld e, b                           ;$785c
ld d, h                           ;$785d
and e                             ;$785e
ld c, d                           ;$785f
and a                             ;$7860
ld e, d                           ;$7861
ld e, [hl]                        ;$7862
and e                             ;$7863
ld e, d                           ;$7864
and a                             ;$7865
ld d, h                           ;$7866
and h                             ;$7867
ld d, b                           ;$7868
and d                             ;$7869
ld bc, $8e00                      ;$786a
ld a, b                           ;$786d
ld de, $8e79                      ;$786e
ld a, b                           ;$7871
sub [hl]                          ;$7872
ld a, c                           ;$7873
nop                               ;$7874
nop                               ;$7875
xor l                             ;$7876
ld a, b                           ;$7877
jr c, $78f3                       ;$7878
xor l                             ;$787a
ld a, b                           ;$787b
cp d                              ;$787c
ld a, c                           ;$787d
push de                           ;$787e
ld a, b                           ;$787f
ld e, [hl]                        ;$7880
ld a, c                           ;$7881
push de                           ;$7882
ld a, b                           ;$7883
db $dd ;<unknown instruction>     ;$7884
ld a, c                           ;$7885
cp $78                            ;$7886
add h                             ;$7888
ld a, c                           ;$7889
cp $78                            ;$788a
add h                             ;$788c
ld a, c                           ;$788d
sbc l                             ;$788e
pop de                            ;$788f
nop                               ;$7890
add b                             ;$7891
and d                             ;$7892
ld e, h                           ;$7893
and c                             ;$7894
ld e, h                           ;$7895
ld e, d                           ;$7896
and d                             ;$7897
ld e, h                           ;$7898
ld e, h                           ;$7899
ld d, [hl]                        ;$789a
ld d, d                           ;$789b
ld c, [hl]                        ;$789c
ld d, [hl]                        ;$789d
and d                             ;$789e
ld d, d                           ;$789f
and c                             ;$78a0
ld d, d                           ;$78a1
ld d, b                           ;$78a2
and d                             ;$78a3
ld d, d                           ;$78a4
ld d, d                           ;$78a5
ld c, h                           ;$78a6
ld c, b                           ;$78a7
ld b, h                           ;$78a8
and c                             ;$78a9
ld c, h                           ;$78aa
ld d, d                           ;$78ab
nop                               ;$78ac
sbc l                             ;$78ad
or d                              ;$78ae
nop                               ;$78af
add b                             ;$78b0
and d                             ;$78b1
ld d, d                           ;$78b2
and c                             ;$78b3
ld d, d                           ;$78b4
ld d, d                           ;$78b5
and d                             ;$78b6
ld d, d                           ;$78b7
and c                             ;$78b8
ld d, d                           ;$78b9
ld d, d                           ;$78ba
and d                             ;$78bb
ld b, h                           ;$78bc
and c                             ;$78bd
ld b, h                           ;$78be
ld b, h                           ;$78bf
and d                             ;$78c0
ld b, h                           ;$78c1
ld bc, $a14c                      ;$78c2
ld c, h                           ;$78c5
ld c, h                           ;$78c6
and d                             ;$78c7
ld c, h                           ;$78c8
and c                             ;$78c9
ld c, h                           ;$78ca
ld c, h                           ;$78cb
and d                             ;$78cc
ldd a, [hl]                       ;$78cd
and c                             ;$78ce
ldd a, [hl]                       ;$78cf
ldd a, [hl]                       ;$78d0
and d                             ;$78d1
ldd a, [hl]                       ;$78d2
ld bc, $9d00                      ;$78d3
jp hl                             ;$78d6
ld l, [hl]                        ;$78d7
jr nz, $787c                      ;$78d8
ld e, h                           ;$78da
and c                             ;$78db
ld e, h                           ;$78dc
ld e, h                           ;$78dd
and d                             ;$78de
ld e, h                           ;$78df
and c                             ;$78e0
ld e, h                           ;$78e1
ld e, h                           ;$78e2
and d                             ;$78e3
ld c, [hl]                        ;$78e4
and c                             ;$78e5
ld d, d                           ;$78e6
ld d, d                           ;$78e7
and d                             ;$78e8
ld d, [hl]                        ;$78e9
ld bc, $5ca2                      ;$78ea
and c                             ;$78ed
ld e, h                           ;$78ee
ld e, h                           ;$78ef
and d                             ;$78f0
ld e, h                           ;$78f1
and c                             ;$78f2
ld e, h                           ;$78f3
ld e, h                           ;$78f4
and d                             ;$78f5
ld b, h                           ;$78f6
and c                             ;$78f7
ld c, b                           ;$78f8
ld c, b                           ;$78f9
and d                             ;$78fa
ld c, h                           ;$78fb
ld bc, $a200                      ;$78fc
ld b, $a7                         ;$78ff
ld bc, $0ba2                      ;$7901
dec bc                            ;$7904
dec bc                            ;$7905
ld bc, $06a2                      ;$7906
and a                             ;$7909
ld bc, $0ba2                      ;$790a
dec bc                            ;$790d
dec bc                            ;$790e
ld bc, $a200                      ;$790f
ld c, b                           ;$7912
and c                             ;$7913
ld c, b                           ;$7914
ld d, d                           ;$7915
and d                             ;$7916
ld b, h                           ;$7917
and c                             ;$7918
ld b, h                           ;$7919
ld d, d                           ;$791a
and d                             ;$791b
ld b, d                           ;$791c
and c                             ;$791d
ld b, d                           ;$791e
ld d, d                           ;$791f
and d                             ;$7920
ld c, b                           ;$7921
and c                             ;$7922
ld c, b                           ;$7923
ld d, d                           ;$7924
and d                             ;$7925
ld c, h                           ;$7926
and c                             ;$7927
ld c, h                           ;$7928
ld d, d                           ;$7929
and d                             ;$792a
ld b, h                           ;$792b
and c                             ;$792c
ld b, h                           ;$792d
ld d, d                           ;$792e
and d                             ;$792f
ld c, b                           ;$7930
ld b, h                           ;$7931
and c                             ;$7932
ld c, b                           ;$7933
ld d, d                           ;$7934
ld d, [hl]                        ;$7935
ld e, d                           ;$7936
nop                               ;$7937
ldd a, [hl]                       ;$7938
and c                             ;$7939
ldd a, [hl]                       ;$793a
ldd a, [hl]                       ;$793b
and d                             ;$793c
ldd a, [hl]                       ;$793d
and c                             ;$793e
ldd a, [hl]                       ;$793f
ldd a, [hl]                       ;$7940
and d                             ;$7941
ldd a, [hl]                       ;$7942
and c                             ;$7943
ldd a, [hl]                       ;$7944
ldd a, [hl]                       ;$7945
and d                             ;$7946
ldd a, [hl]                       ;$7947
and c                             ;$7948
ldd a, [hl]                       ;$7949
ldd a, [hl]                       ;$794a
and d                             ;$794b
ldd a, [hl]                       ;$794c
and c                             ;$794d
ldd a, [hl]                       ;$794e
ldd a, [hl]                       ;$794f
and d                             ;$7950
ldd a, [hl]                       ;$7951
and c                             ;$7952
ldd a, [hl]                       ;$7953
ldd a, [hl]                       ;$7954
and d                             ;$7955
ld [hl], $a1                      ;$7956
ld [hl], $36                      ;$7958
and d                             ;$795a
ld [hl], $01                      ;$795b
nop                               ;$795d
ld c, b                           ;$795e
and c                             ;$795f
ld c, b                           ;$7960
ld c, b                           ;$7961
and d                             ;$7962
ld c, b                           ;$7963
and c                             ;$7964
ld c, b                           ;$7965
ld c, b                           ;$7966
and d                             ;$7967
ld c, b                           ;$7968
and c                             ;$7969
ld c, b                           ;$796a
ld c, b                           ;$796b
and d                             ;$796c
ld c, b                           ;$796d
and c                             ;$796e
ld c, b                           ;$796f
ld c, b                           ;$7970
and d                             ;$7971
ld b, h                           ;$7972
and c                             ;$7973
ld b, h                           ;$7974
ld b, h                           ;$7975
and d                             ;$7976
ld b, h                           ;$7977
and c                             ;$7978
ld b, h                           ;$7979
ld b, h                           ;$797a
and d                             ;$797b
ld b, d                           ;$797c
and c                             ;$797d
ld b, d                           ;$797e
ld b, d                           ;$797f
and d                             ;$7980
ld b, d                           ;$7981
ld bc, $a200                      ;$7982
ld bc, $010b                      ;$7985
dec bc                            ;$7988
ld bc, $010b                      ;$7989
dec bc                            ;$798c
ld bc, $010b                      ;$798d
dec bc                            ;$7990
ld bc, $0b0b                      ;$7991
ld bc, $a200                      ;$7994
ld c, b                           ;$7997
and c                             ;$7998
ld c, b                           ;$7999
ld d, d                           ;$799a
and d                             ;$799b
ld b, h                           ;$799c
and c                             ;$799d
ld b, h                           ;$799e
ld d, d                           ;$799f
and d                             ;$79a0
ld b, d                           ;$79a1
and c                             ;$79a2
ld b, d                           ;$79a3
ld d, d                           ;$79a4
and d                             ;$79a5
ld c, b                           ;$79a6
and c                             ;$79a7
ld c, b                           ;$79a8
ld d, d                           ;$79a9
and d                             ;$79aa
ld c, h                           ;$79ab
and c                             ;$79ac
ld c, h                           ;$79ad
ld d, d                           ;$79ae
and d                             ;$79af
ld c, b                           ;$79b0
and c                             ;$79b1
ld c, b                           ;$79b2
ld d, d                           ;$79b3
and d                             ;$79b4
ld b, h                           ;$79b5
ld d, d                           ;$79b6
and e                             ;$79b7
ld e, h                           ;$79b8
nop                               ;$79b9
ldd a, [hl]                       ;$79ba
and c                             ;$79bb
ldd a, [hl]                       ;$79bc
ldd a, [hl]                       ;$79bd
and d                             ;$79be
ldd a, [hl]                       ;$79bf
and c                             ;$79c0
ldd a, [hl]                       ;$79c1
ldd a, [hl]                       ;$79c2
and d                             ;$79c3
ldd a, [hl]                       ;$79c4
and c                             ;$79c5
ldd a, [hl]                       ;$79c6
ldd a, [hl]                       ;$79c7
and d                             ;$79c8
ldd a, [hl]                       ;$79c9
and c                             ;$79ca
ldd a, [hl]                       ;$79cb
ldd a, [hl]                       ;$79cc
and d                             ;$79cd
ldd a, [hl]                       ;$79ce
and c                             ;$79cf
ldd a, [hl]                       ;$79d0
ldd a, [hl]                       ;$79d1
and d                             ;$79d2
ldd a, [hl]                       ;$79d3
and c                             ;$79d4
ldd a, [hl]                       ;$79d5
ldd a, [hl]                       ;$79d6
and d                             ;$79d7
ld bc, $a33a                      ;$79d8
ld c, h                           ;$79db
nop                               ;$79dc
ld c, b                           ;$79dd
and c                             ;$79de
ld c, b                           ;$79df
ld c, b                           ;$79e0
and d                             ;$79e1
ld c, b                           ;$79e2
and c                             ;$79e3
ld c, b                           ;$79e4
ld c, b                           ;$79e5
and d                             ;$79e6
ld c, b                           ;$79e7
and c                             ;$79e8
ld c, b                           ;$79e9
ld c, b                           ;$79ea
and d                             ;$79eb
ld c, b                           ;$79ec
and c                             ;$79ed
ld c, b                           ;$79ee
ld c, b                           ;$79ef
and d                             ;$79f0
ld b, h                           ;$79f1
and c                             ;$79f2
ld b, h                           ;$79f3
ld b, h                           ;$79f4
and d                             ;$79f5
ld b, h                           ;$79f6
and c                             ;$79f7
ld b, h                           ;$79f8
ld b, h                           ;$79f9
and d                             ;$79fa
ld bc, $a34c                      ;$79fb
ld b, h                           ;$79fe
nop                               ;$79ff
inc b                             ;$7a00
ld a, d                           ;$7a01
nop                               ;$7a02
nop                               ;$7a03
sbc l                             ;$7a04
jp nz, $4000                      ;$7a05
and d                             ;$7a08
ld e, h                           ;$7a09
and c                             ;$7a0a
ld e, h                           ;$7a0b
ld e, d                           ;$7a0c
and d                             ;$7a0d
ld e, h                           ;$7a0e
ld e, h                           ;$7a0f
ld d, [hl]                        ;$7a10
ld d, d                           ;$7a11
ld c, [hl]                        ;$7a12
ld d, [hl]                        ;$7a13
and d                             ;$7a14
ld d, d                           ;$7a15
and c                             ;$7a16
ld d, d                           ;$7a17
ld d, b                           ;$7a18
and d                             ;$7a19
ld d, d                           ;$7a1a
ld d, d                           ;$7a1b
ld c, h                           ;$7a1c
ld c, b                           ;$7a1d
and c                             ;$7a1e
ld b, h                           ;$7a1f
ld b, d                           ;$7a20
and d                             ;$7a21
ld b, h                           ;$7a22
and h                             ;$7a23
ld bc, $2c00                      ;$7a24
ld a, d                           ;$7a27
nop                               ;$7a28
nop                               ;$7a29
ld c, e                           ;$7a2a
ld a, d                           ;$7a2b
sbc l                             ;$7a2c
jp nz, $8000                      ;$7a2d
and d                             ;$7a30
ld e, h                           ;$7a31
and c                             ;$7a32
ld e, h                           ;$7a33
ld e, d                           ;$7a34
and d                             ;$7a35
ld e, h                           ;$7a36
ld e, h                           ;$7a37
ld d, [hl]                        ;$7a38
ld d, d                           ;$7a39
ld c, [hl]                        ;$7a3a
ld d, [hl]                        ;$7a3b
and d                             ;$7a3c
ld d, d                           ;$7a3d
and c                             ;$7a3e
ld d, d                           ;$7a3f
ld d, b                           ;$7a40
and d                             ;$7a41
ld d, d                           ;$7a42
ld c, h                           ;$7a43
ld b, h                           ;$7a44
ld d, d                           ;$7a45
and e                             ;$7a46
ld e, h                           ;$7a47
and h                             ;$7a48
ld bc, $9d00                      ;$7a49
jp hl                             ;$7a4c
ld l, [hl]                        ;$7a4d
jr nz, $79f2                      ;$7a4e
ld e, h                           ;$7a50
and c                             ;$7a51
ld e, h                           ;$7a52
ld e, h                           ;$7a53
and d                             ;$7a54
ld e, h                           ;$7a55
and c                             ;$7a56
ld e, h                           ;$7a57
ld e, h                           ;$7a58
and d                             ;$7a59
ld c, [hl]                        ;$7a5a
ld d, d                           ;$7a5b
ld d, [hl]                        ;$7a5c
ld bc, $5ca2                      ;$7a5d
and c                             ;$7a60
ld e, h                           ;$7a61
ld e, h                           ;$7a62
and d                             ;$7a63
ld e, h                           ;$7a64
and c                             ;$7a65
ld e, h                           ;$7a66
ld e, h                           ;$7a67
and d                             ;$7a68
ld d, d                           ;$7a69
ld c, h                           ;$7a6a
ld b, h                           ;$7a6b
ld bc, $01a5                      ;$7a6c
ld [hl], a                        ;$7a6f
ld a, d                           ;$7a70
nop                               ;$7a71
nop                               ;$7a72
sub [hl]                          ;$7a73
ld a, d                           ;$7a74
or h                              ;$7a75
ld a, d                           ;$7a76
sbc l                             ;$7a77
jp nz, $8000                      ;$7a78
and d                             ;$7a7b
ld e, h                           ;$7a7c
and c                             ;$7a7d
ld e, h                           ;$7a7e
ld e, d                           ;$7a7f
and d                             ;$7a80
ld e, h                           ;$7a81
ld e, h                           ;$7a82
ld d, [hl]                        ;$7a83
ld d, d                           ;$7a84
ld c, [hl]                        ;$7a85
ld d, [hl]                        ;$7a86
and d                             ;$7a87
ld d, d                           ;$7a88
and c                             ;$7a89
ld d, d                           ;$7a8a
ld d, b                           ;$7a8b
and d                             ;$7a8c
ld d, d                           ;$7a8d
ld c, h                           ;$7a8e
ld b, h                           ;$7a8f
ld d, d                           ;$7a90
and e                             ;$7a91
ld e, h                           ;$7a92
and h                             ;$7a93
ld bc, $9d00                      ;$7a94
jp nz, $4000                      ;$7a97
and d                             ;$7a9a
ld c, [hl]                        ;$7a9b
and c                             ;$7a9c
ld c, [hl]                        ;$7a9d
ld d, d                           ;$7a9e
and d                             ;$7a9f
ld d, [hl]                        ;$7aa0
ld c, [hl]                        ;$7aa1
and e                             ;$7aa2
ld c, b                           ;$7aa3
ld c, b                           ;$7aa4
and d                             ;$7aa5
ld c, h                           ;$7aa6
and c                             ;$7aa7
ld c, h                           ;$7aa8
ld c, d                           ;$7aa9
and d                             ;$7aaa
ld c, h                           ;$7aab
ld b, h                           ;$7aac
inc [hl]                          ;$7aad
ld c, h                           ;$7aae
and e                             ;$7aaf
ld c, h                           ;$7ab0
and l                             ;$7ab1
ld bc, $9d00                      ;$7ab2
jp hl                             ;$7ab5
ld l, [hl]                        ;$7ab6
jr nz, $7a5b                      ;$7ab7
ld e, h                           ;$7ab9
and c                             ;$7aba
ld e, h                           ;$7abb
ld e, h                           ;$7abc
and d                             ;$7abd
ld e, h                           ;$7abe
and c                             ;$7abf
ld e, h                           ;$7ac0
ld e, h                           ;$7ac1
and d                             ;$7ac2
ld c, [hl]                        ;$7ac3
ld d, d                           ;$7ac4
and c                             ;$7ac5
ld d, [hl]                        ;$7ac6
ld d, [hl]                        ;$7ac7
and d                             ;$7ac8
ld d, [hl]                        ;$7ac9
and d                             ;$7aca
ld e, h                           ;$7acb
and c                             ;$7acc
ld e, h                           ;$7acd
ld e, h                           ;$7ace
and d                             ;$7acf
ld e, h                           ;$7ad0
and c                             ;$7ad1
ld e, h                           ;$7ad2
ld e, h                           ;$7ad3
and d                             ;$7ad4
ld d, d                           ;$7ad5
ld c, h                           ;$7ad6
and c                             ;$7ad7
ld b, h                           ;$7ad8
ld b, h                           ;$7ad9
and d                             ;$7ada
ld bc, $01a5                      ;$7adb
nop                               ;$7ade
jp hl                             ;$7adf
ld a, d                           ;$7ae0
nop                               ;$7ae1
nop                               ;$7ae2
ld [$257b], sp                    ;$7ae3
ld a, e                           ;$7ae6
ld c, a                           ;$7ae7
ld a, e                           ;$7ae8
sbc l                             ;$7ae9
jp nz, $8000                      ;$7aea
and d                             ;$7aed
ld e, h                           ;$7aee
and c                             ;$7aef
ld e, h                           ;$7af0
ld e, d                           ;$7af1
and d                             ;$7af2
ld e, h                           ;$7af3
ld e, h                           ;$7af4
ld d, [hl]                        ;$7af5
ld d, d                           ;$7af6
ld c, [hl]                        ;$7af7
ld d, [hl]                        ;$7af8
and d                             ;$7af9
ld d, d                           ;$7afa
and c                             ;$7afb
ld d, d                           ;$7afc
ld d, b                           ;$7afd
and d                             ;$7afe
ld d, d                           ;$7aff
ld c, h                           ;$7b00
ld b, h                           ;$7b01
ld d, d                           ;$7b02
and e                             ;$7b03
ld e, h                           ;$7b04
and h                             ;$7b05
ld bc, $9d00                      ;$7b06
or d                              ;$7b09
nop                               ;$7b0a
add b                             ;$7b0b
and d                             ;$7b0c
ld c, [hl]                        ;$7b0d
and c                             ;$7b0e
ld c, [hl]                        ;$7b0f
ld d, d                           ;$7b10
and d                             ;$7b11
ld d, [hl]                        ;$7b12
ld c, [hl]                        ;$7b13
and e                             ;$7b14
ld c, b                           ;$7b15
ld c, b                           ;$7b16
and d                             ;$7b17
ld c, h                           ;$7b18
and c                             ;$7b19
ld c, h                           ;$7b1a
ld c, d                           ;$7b1b
and d                             ;$7b1c
ld c, h                           ;$7b1d
ld b, h                           ;$7b1e
inc [hl]                          ;$7b1f
ld c, h                           ;$7b20
and e                             ;$7b21
ld c, h                           ;$7b22
and l                             ;$7b23
ld bc, $e99d                      ;$7b24
ld l, [hl]                        ;$7b27
jr nz, $7acc                      ;$7b28
ld e, h                           ;$7b2a
and c                             ;$7b2b
ld e, h                           ;$7b2c
ld e, h                           ;$7b2d
and d                             ;$7b2e
ld e, h                           ;$7b2f
and c                             ;$7b30
ld e, h                           ;$7b31
ld e, h                           ;$7b32
ld c, [hl]                        ;$7b33
ld d, [hl]                        ;$7b34
ld e, h                           ;$7b35
ld d, [hl]                        ;$7b36
ld c, [hl]                        ;$7b37
ld b, h                           ;$7b38
ld a, $44                         ;$7b39
and d                             ;$7b3b
ld e, h                           ;$7b3c
and c                             ;$7b3d
ld e, h                           ;$7b3e
ld e, h                           ;$7b3f
and d                             ;$7b40
ld e, h                           ;$7b41
and c                             ;$7b42
ld e, h                           ;$7b43
ld e, h                           ;$7b44
ld d, d                           ;$7b45
ld c, h                           ;$7b46
ld b, h                           ;$7b47
ld c, h                           ;$7b48
ld e, h                           ;$7b49
ld bc, $01a2                      ;$7b4a
and l                             ;$7b4d
ld bc, $0ba2                      ;$7b4e
dec bc                            ;$7b51
dec bc                            ;$7b52
dec bc                            ;$7b53
and d                             ;$7b54
dec bc                            ;$7b55
dec bc                            ;$7b56
dec bc                            ;$7b57
ld bc, $0ba2                      ;$7b58
dec bc                            ;$7b5b
dec bc                            ;$7b5c
dec bc                            ;$7b5d
and d                             ;$7b5e
dec bc                            ;$7b5f
dec bc                            ;$7b60
dec bc                            ;$7b61
ld bc, $01a5                      ;$7b62
ld [hl], a                        ;$7b65
ld a, e                           ;$7b66
adc a, $7b                        ;$7b67
nop                               ;$7b69
nop                               ;$7b6a
sub [hl]                          ;$7b6b
ld a, e                           ;$7b6c
ld a, [$ff00+c]                   ;$7b6d
ld a, e                           ;$7b6e
xor b                             ;$7b6f
ld a, e                           ;$7b70
ld [bc], a                        ;$7b71
ld a, h                           ;$7b72
cp e                              ;$7b73
ld a, e                           ;$7b74
ld [de], a                        ;$7b75
ld a, h                           ;$7b76
sbc l                             ;$7b77
pop de                            ;$7b78
nop                               ;$7b79
add b                             ;$7b7a
and d                             ;$7b7b
ld e, h                           ;$7b7c
and c                             ;$7b7d
ld e, h                           ;$7b7e
ld e, d                           ;$7b7f
and d                             ;$7b80
ld e, h                           ;$7b81
ld e, h                           ;$7b82
ld d, [hl]                        ;$7b83
ld d, d                           ;$7b84
ld c, [hl]                        ;$7b85
ld d, [hl]                        ;$7b86
and d                             ;$7b87
ld d, d                           ;$7b88
and c                             ;$7b89
ld d, d                           ;$7b8a
ld d, b                           ;$7b8b
and d                             ;$7b8c
ld d, d                           ;$7b8d
ld d, d                           ;$7b8e
ld c, h                           ;$7b8f
ld c, b                           ;$7b90
ld b, h                           ;$7b91
and c                             ;$7b92
ld c, h                           ;$7b93
ld d, d                           ;$7b94
nop                               ;$7b95
and d                             ;$7b96
ld d, d                           ;$7b97
and a                             ;$7b98
ld bc, $44a2                      ;$7b99
ld b, h                           ;$7b9c
ld b, h                           ;$7b9d
ld bc, $a74c                      ;$7b9e
ld bc, $3aa2                      ;$7ba1
ldd a, [hl]                       ;$7ba4
ldd a, [hl]                       ;$7ba5
ld bc, $a200                      ;$7ba6
ld e, h                           ;$7ba9
and a                             ;$7baa
ld bc, $4ea2                      ;$7bab
ld d, d                           ;$7bae
ld d, [hl]                        ;$7baf
ld bc, $5ca2                      ;$7bb0
and a                             ;$7bb3
ld bc, $44a2                      ;$7bb4
ld c, b                           ;$7bb7
ld c, h                           ;$7bb8
ld bc, $a200                      ;$7bb9
ld b, $a7                         ;$7bbc
ld bc, $0ba2                      ;$7bbe
dec bc                            ;$7bc1
dec bc                            ;$7bc2
ld bc, $06a2                      ;$7bc3
and a                             ;$7bc6
ld bc, $0ba2                      ;$7bc7
dec bc                            ;$7bca
dec bc                            ;$7bcb
ld bc, $a200                      ;$7bcc
ld c, b                           ;$7bcf
and c                             ;$7bd0
ld c, b                           ;$7bd1
ld d, d                           ;$7bd2
and d                             ;$7bd3
ld b, h                           ;$7bd4
and c                             ;$7bd5
ld b, h                           ;$7bd6
ld d, d                           ;$7bd7
and d                             ;$7bd8
ld b, d                           ;$7bd9
and c                             ;$7bda
ld b, d                           ;$7bdb
ld d, d                           ;$7bdc
and d                             ;$7bdd
ld c, b                           ;$7bde
and c                             ;$7bdf
ld c, b                           ;$7be0
ld d, d                           ;$7be1
and d                             ;$7be2
ld c, h                           ;$7be3
and c                             ;$7be4
ld c, h                           ;$7be5
ld d, d                           ;$7be6
and d                             ;$7be7
ld c, b                           ;$7be8
and c                             ;$7be9
ld c, b                           ;$7bea
ld d, d                           ;$7beb
and d                             ;$7bec
ld e, h                           ;$7bed
ld d, d                           ;$7bee
and e                             ;$7bef
ld e, h                           ;$7bf0
nop                               ;$7bf1
ld bc, $013a                      ;$7bf2
ldd a, [hl]                       ;$7bf5
ld bc, $013a                      ;$7bf6
ldd a, [hl]                       ;$7bf9
ld bc, $013a                      ;$7bfa
ldd a, [hl]                       ;$7bfd
ld bc, $a33a                      ;$7bfe
inc [hl]                          ;$7c01
ld bc, $0148                      ;$7c02
ld c, b                           ;$7c05
ld bc, $0148                      ;$7c06
ld c, b                           ;$7c09
ld bc, $0144                      ;$7c0a
ld b, h                           ;$7c0d
ld bc, $a34c                      ;$7c0e
ld b, h                           ;$7c11
and d                             ;$7c12
ld bc, $010b                      ;$7c13
dec bc                            ;$7c16
ld bc, $010b                      ;$7c17
dec bc                            ;$7c1a
ld bc, $010b                      ;$7c1b
dec bc                            ;$7c1e
and d                             ;$7c1f
ld bc, $0b0b                      ;$7c20
ld bc, $7c2e                      ;$7c23
nop                               ;$7c26
nop                               ;$7c27
ld h, e                           ;$7c28
ld a, h                           ;$7c29
sub a                             ;$7c2a
ld a, h                           ;$7c2b
bit 7, h                          ;$7c2c
sbc l                             ;$7c2e
or e                              ;$7c2f
nop                               ;$7c30
add b                             ;$7c31
and [hl]                          ;$7c32
ld d, d                           ;$7c33
and c                             ;$7c34
ld d, b                           ;$7c35
and [hl]                          ;$7c36
ld d, d                           ;$7c37
and c                             ;$7c38
ld d, b                           ;$7c39
and [hl]                          ;$7c3a
ld d, d                           ;$7c3b
and c                             ;$7c3c
ld c, b                           ;$7c3d
and e                             ;$7c3e
ld bc, $4ca6                      ;$7c3f
and c                             ;$7c42
ld c, d                           ;$7c43
and [hl]                          ;$7c44
ld c, h                           ;$7c45
and c                             ;$7c46
ld c, d                           ;$7c47
and [hl]                          ;$7c48
ld c, h                           ;$7c49
and c                             ;$7c4a
ld b, d                           ;$7c4b
and e                             ;$7c4c
ld bc, $3ea6                      ;$7c4d
and c                             ;$7c50
ld b, d                           ;$7c51
and [hl]                          ;$7c52
ld b, h                           ;$7c53
and c                             ;$7c54
ld c, b                           ;$7c55
and [hl]                          ;$7c56
ld c, h                           ;$7c57
and c                             ;$7c58
ld d, b                           ;$7c59
and [hl]                          ;$7c5a
ld d, d                           ;$7c5b
and c                             ;$7c5c
ld d, [hl]                        ;$7c5d
and [hl]                          ;$7c5e
ld d, d                           ;$7c5f
and c                             ;$7c60
ld l, d                           ;$7c61
nop                               ;$7c62
sbc l                             ;$7c63
sub e                             ;$7c64
nop                               ;$7c65
ret nz                            ;$7c66
and [hl]                          ;$7c67
ld b, d                           ;$7c68
and c                             ;$7c69
ld b, b                           ;$7c6a
and [hl]                          ;$7c6b
ld b, d                           ;$7c6c
and c                             ;$7c6d
ld b, b                           ;$7c6e
and [hl]                          ;$7c6f
ld b, d                           ;$7c70
and c                             ;$7c71
ld b, d                           ;$7c72
and e                             ;$7c73
ld bc, $3aa6                      ;$7c74
and c                             ;$7c77
jr c, $7c20                       ;$7c78
ldd a, [hl]                       ;$7c7a
and c                             ;$7c7b
jr c, $7c24                       ;$7c7c
ldd a, [hl]                       ;$7c7e
and c                             ;$7c7f
ldd a, [hl]                       ;$7c80
and e                             ;$7c81
ld bc, $38a6                      ;$7c82
and c                             ;$7c85
jr c, $7c2e                       ;$7c86
ldd a, [hl]                       ;$7c88
and c                             ;$7c89
ld a, $a6                         ;$7c8a
ld b, d                           ;$7c8c
and c                             ;$7c8d
ld b, h                           ;$7c8e
and [hl]                          ;$7c8f
ld c, b                           ;$7c90
and c                             ;$7c91
ld c, h                           ;$7c92
and [hl]                          ;$7c93
ld b, d                           ;$7c94
and c                             ;$7c95
ld b, d                           ;$7c96
sbc l                             ;$7c97
jp hl                             ;$7c98
ld l, [hl]                        ;$7c99
and b                             ;$7c9a
and [hl]                          ;$7c9b
ld c, b                           ;$7c9c
and c                             ;$7c9d
ld b, [hl]                        ;$7c9e
and [hl]                          ;$7c9f
ld c, b                           ;$7ca0
and c                             ;$7ca1
ld b, [hl]                        ;$7ca2
and [hl]                          ;$7ca3
ld c, b                           ;$7ca4
and c                             ;$7ca5
ld d, d                           ;$7ca6
and e                             ;$7ca7
ld bc, $44a6                      ;$7ca8
and c                             ;$7cab
ld b, d                           ;$7cac
and [hl]                          ;$7cad
ld b, h                           ;$7cae
and c                             ;$7caf
ld b, d                           ;$7cb0
and [hl]                          ;$7cb1
ld b, h                           ;$7cb2
and c                             ;$7cb3
ld c, h                           ;$7cb4
and e                             ;$7cb5
ld bc, $48a6                      ;$7cb6
and c                             ;$7cb9
ldd a, [hl]                       ;$7cba
and [hl]                          ;$7cbb
ld a, $a1                         ;$7cbc
ld b, d                           ;$7cbe
and [hl]                          ;$7cbf
ld b, h                           ;$7cc0
and c                             ;$7cc1
ld c, b                           ;$7cc2
and [hl]                          ;$7cc3
ld c, h                           ;$7cc4
and c                             ;$7cc5
ld d, b                           ;$7cc6
and [hl]                          ;$7cc7
ld d, d                           ;$7cc8
and c                             ;$7cc9
ldd a, [hl]                       ;$7cca
and [hl]                          ;$7ccb
dec bc                            ;$7ccc
and c                             ;$7ccd
ld b, $a6                         ;$7cce
dec bc                            ;$7cd0
and c                             ;$7cd1
ld b, $a6                         ;$7cd2
dec bc                            ;$7cd4
and c                             ;$7cd5
ld b, $a3                         ;$7cd6
ld bc, $0ba6                      ;$7cd8
and c                             ;$7cdb
ld b, $a6                         ;$7cdc
dec bc                            ;$7cde
and c                             ;$7cdf
ld b, $a6                         ;$7ce0
dec bc                            ;$7ce2
and c                             ;$7ce3
ld b, $a3                         ;$7ce4
ld bc, $0ba6                      ;$7ce6
and c                             ;$7ce9
ld b, $a6                         ;$7cea
dec bc                            ;$7cec
and c                             ;$7ced
ld b, $a6                         ;$7cee
dec bc                            ;$7cf0
and c                             ;$7cf1
ld b, $a3                         ;$7cf2
ld bc, $0ba6                      ;$7cf4
and c                             ;$7cf7
ld b, $2e                         ;$7cf8
ld a, l                           ;$7cfa
rst $38                           ;$7cfb
rst $38                           ;$7cfc
ld bc, $297d                      ;$7cfd
ld a, l                           ;$7d00
dec [hl]                          ;$7d01
ld a, l                           ;$7d02
ld e, e                           ;$7d03
ld a, l                           ;$7d04
add d                             ;$7d05
ld a, l                           ;$7d06
ld e, e                           ;$7d07
ld a, l                           ;$7d08
and h                             ;$7d09
ld a, l                           ;$7d0a
add a, $7d                        ;$7d0b
rst $38                           ;$7d0d
rst $38                           ;$7d0e
inc bc                            ;$7d0f
ld a, l                           ;$7d10
dec sp                            ;$7d11
ld a, l                           ;$7d12
ld l, h                           ;$7d13
ld a, l                           ;$7d14
sub e                             ;$7d15
ld a, l                           ;$7d16
ld l, h                           ;$7d17
ld a, l                           ;$7d18
or l                              ;$7d19
ld a, l                           ;$7d1a
rlca                              ;$7d1b
ld a, [hl]                        ;$7d1c
rst $38                           ;$7d1d
rst $38                           ;$7d1e
inc de                            ;$7d1f
ld a, l                           ;$7d20
ld a, $7d                         ;$7d21
ld b, c                           ;$7d23
ld a, l                           ;$7d24
rst $38                           ;$7d25
rst $38                           ;$7d26
inc hl                            ;$7d27
ld a, l                           ;$7d28
sbc l                             ;$7d29
ld h, b                           ;$7d2a
nop                               ;$7d2b
add c                             ;$7d2c
nop                               ;$7d2d
sbc l                             ;$7d2e
jr nz, $7d31                      ;$7d2f
add c                             ;$7d31
xor d                             ;$7d32
ld bc, $a300                      ;$7d33
ld bc, $5450                      ;$7d36
ld e, b                           ;$7d39
nop                               ;$7d3a
and l                             ;$7d3b
ld bc, $a500                      ;$7d3c
ld bc, $a300                      ;$7d3f
ld bc, $0106                      ;$7d42
ld b, $01                         ;$7d45
and d                             ;$7d47
ld b, $06                         ;$7d48
and e                             ;$7d4a
ld bc, $a306                      ;$7d4b
ld bc, $0106                      ;$7d4e
ld b, $01                         ;$7d51
and d                             ;$7d53
ld b, $06                         ;$7d54
ld bc, $0601                      ;$7d56
ld b, $00                         ;$7d59
and a                             ;$7d5b
ld e, d                           ;$7d5c
and d                             ;$7d5d
ld e, [hl]                        ;$7d5e
and a                             ;$7d5f
ld e, d                           ;$7d60
and d                             ;$7d61
ld e, b                           ;$7d62
and a                             ;$7d63
ld e, b                           ;$7d64
and d                             ;$7d65
ld d, h                           ;$7d66
and a                             ;$7d67
ld e, b                           ;$7d68
and d                             ;$7d69
ld d, h                           ;$7d6a
nop                               ;$7d6b
sbc l                             ;$7d6c
ret                               ;$7d6d
ld l, [hl]                        ;$7d6e
jr nz, $7d13                      ;$7d6f
ld e, d                           ;$7d71
ld h, d                           ;$7d72
ld l, b                           ;$7d73
ld [hl], b                        ;$7d74
ld e, d                           ;$7d75
ld h, d                           ;$7d76
ld l, b                           ;$7d77
ld [hl], b                        ;$7d78
ld e, d                           ;$7d79
ld h, h                           ;$7d7a
ld h, [hl]                        ;$7d7b
ld l, h                           ;$7d7c
ld e, d                           ;$7d7d
ld h, h                           ;$7d7e
ld h, [hl]                        ;$7d7f
ld l, h                           ;$7d80
nop                               ;$7d81
and a                             ;$7d82
ld d, h                           ;$7d83
and d                             ;$7d84
ld d, b                           ;$7d85
and a                             ;$7d86
ld d, h                           ;$7d87
and d                             ;$7d88
ld d, b                           ;$7d89
and a                             ;$7d8a
ld d, b                           ;$7d8b
and d                             ;$7d8c
ld c, h                           ;$7d8d
and a                             ;$7d8e
ld c, d                           ;$7d8f
and d                             ;$7d90
ld d, b                           ;$7d91
nop                               ;$7d92
ld e, b                           ;$7d93
ld e, [hl]                        ;$7d94
ld h, h                           ;$7d95
ld l, h                           ;$7d96
ld e, b                           ;$7d97
ld e, [hl]                        ;$7d98
ld h, h                           ;$7d99
ld l, h                           ;$7d9a
ld d, b                           ;$7d9b
ld d, h                           ;$7d9c
ld e, b                           ;$7d9d
ld e, [hl]                        ;$7d9e
ld d, b                           ;$7d9f
ld e, b                           ;$7da0
ld e, [hl]                        ;$7da1
ld h, h                           ;$7da2
nop                               ;$7da3
and a                             ;$7da4
ld d, h                           ;$7da5
and d                             ;$7da6
ld d, b                           ;$7da7
and a                             ;$7da8
ld d, h                           ;$7da9
and d                             ;$7daa
ld d, b                           ;$7dab
and a                             ;$7dac
ld d, b                           ;$7dad
and d                             ;$7dae
ld c, h                           ;$7daf
and a                             ;$7db0
ld c, d                           ;$7db1
and d                             ;$7db2
ld b, [hl]                        ;$7db3
nop                               ;$7db4
ld e, b                           ;$7db5
ld e, [hl]                        ;$7db6
ld h, h                           ;$7db7
ld l, h                           ;$7db8
ld e, b                           ;$7db9
ld e, [hl]                        ;$7dba
ld h, h                           ;$7dbb
ld l, h                           ;$7dbc
ld d, b                           ;$7dbd
ld d, h                           ;$7dbe
ld e, b                           ;$7dbf
ld e, [hl]                        ;$7dc0
ld d, b                           ;$7dc1
ld e, b                           ;$7dc2
ld e, [hl]                        ;$7dc3
ld h, h                           ;$7dc4
nop                               ;$7dc5
and a                             ;$7dc6
ld c, d                           ;$7dc7
and d                             ;$7dc8
ld c, h                           ;$7dc9
and a                             ;$7dca
ld c, d                           ;$7dcb
and d                             ;$7dcc
ld b, [hl]                        ;$7dcd
and a                             ;$7dce
ld b, [hl]                        ;$7dcf
and d                             ;$7dd0
ld b, h                           ;$7dd1
and a                             ;$7dd2
ld b, [hl]                        ;$7dd3
and d                             ;$7dd4
ld c, d                           ;$7dd5
and a                             ;$7dd6
ld c, h                           ;$7dd7
and d                             ;$7dd8
ld d, b                           ;$7dd9
and a                             ;$7dda
ld c, h                           ;$7ddb
and d                             ;$7ddc
ld c, d                           ;$7ddd
and a                             ;$7dde
ld c, d                           ;$7ddf
and d                             ;$7de0
ld b, [hl]                        ;$7de1
and a                             ;$7de2
ld c, d                           ;$7de3
and d                             ;$7de4
ld c, h                           ;$7de5
and a                             ;$7de6
ld d, b                           ;$7de7
and d                             ;$7de8
ld c, [hl]                        ;$7de9
and a                             ;$7dea
ld d, b                           ;$7deb
and d                             ;$7dec
ld d, d                           ;$7ded
and a                             ;$7dee
ld e, b                           ;$7def
and d                             ;$7df0
ld d, h                           ;$7df1
and a                             ;$7df2
ld e, d                           ;$7df3
and d                             ;$7df4
ld d, h                           ;$7df5
and a                             ;$7df6
ld d, d                           ;$7df7
and d                             ;$7df8
ld d, b                           ;$7df9
and a                             ;$7dfa
ld c, h                           ;$7dfb
and d                             ;$7dfc
ld c, d                           ;$7dfd
and d                             ;$7dfe
ld b, d                           ;$7dff
jr c, $7e3e                       ;$7e00
ld c, d                           ;$7e02
and e                             ;$7e03
ld b, d                           ;$7e04
ld bc, $4a00                      ;$7e05
ld d, d                           ;$7e08
ld e, b                           ;$7e09
ld e, [hl]                        ;$7e0a
ld c, d                           ;$7e0b
ld e, b                           ;$7e0c
ld e, [hl]                        ;$7e0d
ld h, d                           ;$7e0e
ld d, h                           ;$7e0f
ld h, d                           ;$7e10
ld l, b                           ;$7e11
ld l, h                           ;$7e12
ld d, h                           ;$7e13
ld h, d                           ;$7e14
ld l, b                           ;$7e15
ld l, h                           ;$7e16
ld b, [hl]                        ;$7e17
ld c, h                           ;$7e18
ld d, h                           ;$7e19
ld e, [hl]                        ;$7e1a
ld b, [hl]                        ;$7e1b
ld c, h                           ;$7e1c
ld d, h                           ;$7e1d
ld e, d                           ;$7e1e
ld d, b                           ;$7e1f
ld e, b                           ;$7e20
ld e, [hl]                        ;$7e21
ld h, h                           ;$7e22
ld d, b                           ;$7e23
ld e, [hl]                        ;$7e24
ld h, h                           ;$7e25
ld l, h                           ;$7e26
ld c, d                           ;$7e27
ld d, b                           ;$7e28
ld e, b                           ;$7e29
ld e, [hl]                        ;$7e2a
ld c, d                           ;$7e2b
ld e, b                           ;$7e2c
ld e, [hl]                        ;$7e2d
ld h, d                           ;$7e2e
ld c, [hl]                        ;$7e2f
ld d, h                           ;$7e30
ld e, d                           ;$7e31
ld h, d                           ;$7e32
ld c, [hl]                        ;$7e33
ld d, h                           ;$7e34
ld e, d                           ;$7e35
ld h, [hl]                        ;$7e36
ld d, b                           ;$7e37
ld e, b                           ;$7e38
ld e, [hl]                        ;$7e39
ld h, h                           ;$7e3a
ld d, b                           ;$7e3b
ld e, [hl]                        ;$7e3c
ld h, h                           ;$7e3d
ld l, b                           ;$7e3e
xor b                             ;$7e3f
ld e, d                           ;$7e40
and e                             ;$7e41
ld bc, $4e00                      ;$7e42
ld a, [hl]                        ;$7e45
nop                               ;$7e46
nop                               ;$7e47
ld e, [hl]                        ;$7e48
ld a, [hl]                        ;$7e49
ld l, l                           ;$7e4a
ld a, [hl]                        ;$7e4b
ld a, l                           ;$7e4c
ld a, [hl]                        ;$7e4d
sbc l                             ;$7e4e
or c                              ;$7e4f
nop                               ;$7e50
add b                             ;$7e51
and a                             ;$7e52
ld bc, $5ea1                      ;$7e53
ld e, [hl]                        ;$7e56
and [hl]                          ;$7e57
ld l, b                           ;$7e58
and c                             ;$7e59
ld e, [hl]                        ;$7e5a
and h                             ;$7e5b
ld l, b                           ;$7e5c
nop                               ;$7e5d
sbc l                             ;$7e5e
sub c                             ;$7e5f
nop                               ;$7e60
add b                             ;$7e61
and a                             ;$7e62
ld bc, $54a1                      ;$7e63
ld d, h                           ;$7e66
and [hl]                          ;$7e67
ld e, [hl]                        ;$7e68
and c                             ;$7e69
ld e, b                           ;$7e6a
and h                             ;$7e6b
ld e, [hl]                        ;$7e6c
sbc l                             ;$7e6d
jp hl                             ;$7e6e
ld l, [hl]                        ;$7e6f
jr nz, $7e19                      ;$7e70
ld bc, $4ea1                      ;$7e72
ld c, [hl]                        ;$7e75
and [hl]                          ;$7e76
ld e, b                           ;$7e77
and c                             ;$7e78
ld d, b                           ;$7e79
and e                             ;$7e7a
ld e, b                           ;$7e7b
ld bc, $01a7                      ;$7e7c
and c                             ;$7e7f
ld b, $06                         ;$7e80
and [hl]                          ;$7e82
dec bc                            ;$7e83
and c                             ;$7e84
ld b, $a0                         ;$7e85
ld b, $06                         ;$7e87
ld b, $06                         ;$7e89
ld b, $06                         ;$7e8b
ld b, $06                         ;$7e8d
and e                             ;$7e8f
ld bc, $7ebb                      ;$7e90
jr z, $7f14                       ;$7e93
cp e                              ;$7e95
ld a, [hl]                        ;$7e96
ld [hl], e                        ;$7e97
ld a, a                           ;$7e98
rst $38                           ;$7e99
rst $38                           ;$7e9a
sub c                             ;$7e9b
ld a, [hl]                        ;$7e9c
push hl                           ;$7e9d
ld a, [hl]                        ;$7e9e
ld c, a                           ;$7e9f
ld a, a                           ;$7ea0
push hl                           ;$7ea1
ld a, [hl]                        ;$7ea2
sub [hl]                          ;$7ea3
ld a, a                           ;$7ea4
rst $38                           ;$7ea5
rst $38                           ;$7ea6
sbc l                             ;$7ea7
ld a, [hl]                        ;$7ea8
ei                                ;$7ea9
ld a, [hl]                        ;$7eaa
ld h, c                           ;$7eab
ld a, a                           ;$7eac
ei                                ;$7ead
ld a, [hl]                        ;$7eae
xor [hl]                          ;$7eaf
ld a, a                           ;$7eb0
rst $38                           ;$7eb1
rst $38                           ;$7eb2
xor c                             ;$7eb3
ld a, [hl]                        ;$7eb4
ld de, $ff7f                      ;$7eb5
rst $38                           ;$7eb8
or l                              ;$7eb9
ld a, [hl]                        ;$7eba
sbc l                             ;$7ebb
add d                             ;$7ebc
nop                               ;$7ebd
add b                             ;$7ebe
and d                             ;$7ebf
ld d, h                           ;$7ec0
and c                             ;$7ec1
ld d, h                           ;$7ec2
ld d, h                           ;$7ec3
ld d, h                           ;$7ec4
ld c, d                           ;$7ec5
ld b, [hl]                        ;$7ec6
ld c, d                           ;$7ec7
and d                             ;$7ec8
ld d, h                           ;$7ec9
and c                             ;$7eca
ld d, h                           ;$7ecb
ld d, h                           ;$7ecc
ld d, h                           ;$7ecd
ld e, b                           ;$7ece
ld e, h                           ;$7ecf
ld e, b                           ;$7ed0
and d                             ;$7ed1
ld d, h                           ;$7ed2
and c                             ;$7ed3
ld d, h                           ;$7ed4
ld d, h                           ;$7ed5
ld e, b                           ;$7ed6
ld d, h                           ;$7ed7
ld d, d                           ;$7ed8
ld d, h                           ;$7ed9
and c                             ;$7eda
ld e, b                           ;$7edb
ld e, h                           ;$7edc
ld e, b                           ;$7edd
ld e, h                           ;$7ede
and d                             ;$7edf
ld e, b                           ;$7ee0
and c                             ;$7ee1
ld d, [hl]                        ;$7ee2
ld e, b                           ;$7ee3
nop                               ;$7ee4
sbc l                             ;$7ee5
ld h, d                           ;$7ee6
nop                               ;$7ee7
add b                             ;$7ee8
and d                             ;$7ee9
ld bc, $0144                      ;$7eea
ld b, b                           ;$7eed
ld bc, $0144                      ;$7eee
ld b, [hl]                        ;$7ef1
ld bc, $0144                      ;$7ef2
ld b, h                           ;$7ef5
ld bc, $0140                      ;$7ef6
ld b, b                           ;$7ef9
nop                               ;$7efa
sbc l                             ;$7efb
jp hl                             ;$7efc
ld l, [hl]                        ;$7efd
jr nz, $7ea2                      ;$7efe
ld d, h                           ;$7f00
ld d, h                           ;$7f01
ld c, d                           ;$7f02
ld d, d                           ;$7f03
ld d, h                           ;$7f04
ld d, h                           ;$7f05
ld c, d                           ;$7f06
ld e, b                           ;$7f07
ld d, h                           ;$7f08
ld d, h                           ;$7f09
ld d, d                           ;$7f0a
ld d, h                           ;$7f0b
ld c, [hl]                        ;$7f0c
ld d, h                           ;$7f0d
ld c, d                           ;$7f0e
ld d, d                           ;$7f0f
nop                               ;$7f10
and d                             ;$7f11
ld b, $0b                         ;$7f12
ld b, $0b                         ;$7f14
ld b, $0b                         ;$7f16
ld b, $0b                         ;$7f18
ld b, $0b                         ;$7f1a
ld b, $0b                         ;$7f1c
ld b, $a1                         ;$7f1e
dec bc                            ;$7f20
dec bc                            ;$7f21
ld b, $a2                         ;$7f22
dec bc                            ;$7f24
and c                             ;$7f25
ld b, $00                         ;$7f26
and d                             ;$7f28
ld e, [hl]                        ;$7f29
and c                             ;$7f2a
ld e, [hl]                        ;$7f2b
ld e, [hl]                        ;$7f2c
ld e, [hl]                        ;$7f2d
ld d, h                           ;$7f2e
ld d, b                           ;$7f2f
ld d, h                           ;$7f30
and d                             ;$7f31
ld e, [hl]                        ;$7f32
and c                             ;$7f33
ld e, [hl]                        ;$7f34
ld e, [hl]                        ;$7f35
ld e, [hl]                        ;$7f36
ld h, d                           ;$7f37
ld h, [hl]                        ;$7f38
ld h, d                           ;$7f39
and d                             ;$7f3a
ld e, [hl]                        ;$7f3b
and c                             ;$7f3c
ld e, [hl]                        ;$7f3d
ld e, h                           ;$7f3e
and d                             ;$7f3f
ld e, b                           ;$7f40
and c                             ;$7f41
ld e, b                           ;$7f42
ld d, h                           ;$7f43
and c                             ;$7f44
ld d, d                           ;$7f45
ld d, h                           ;$7f46
ld d, d                           ;$7f47
ld d, h                           ;$7f48
and d                             ;$7f49
ld d, d                           ;$7f4a
and c                             ;$7f4b
ld c, [hl]                        ;$7f4c
ld d, d                           ;$7f4d
nop                               ;$7f4e
and d                             ;$7f4f
ld bc, $0146                      ;$7f50
ld c, d                           ;$7f53
ld bc, $0146                      ;$7f54
ld c, d                           ;$7f57
ld bc, $0146                      ;$7f58
ld b, [hl]                        ;$7f5b
ld bc, $0146                      ;$7f5c
ld b, [hl]                        ;$7f5f
nop                               ;$7f60
and d                             ;$7f61
ld b, [hl]                        ;$7f62
ld d, h                           ;$7f63
ld d, h                           ;$7f64
ld d, h                           ;$7f65
ld b, [hl]                        ;$7f66
ld d, h                           ;$7f67
ld d, h                           ;$7f68
ld d, h                           ;$7f69
ld b, [hl]                        ;$7f6a
ld d, h                           ;$7f6b
ld d, d                           ;$7f6c
ld e, b                           ;$7f6d
ld b, h                           ;$7f6e
ld d, d                           ;$7f6f
ld c, d                           ;$7f70
ld e, b                           ;$7f71
nop                               ;$7f72
and d                             ;$7f73
ld h, d                           ;$7f74
and c                             ;$7f75
ld h, d                           ;$7f76
ld h, d                           ;$7f77
ld h, d                           ;$7f78
ld e, [hl]                        ;$7f79
ld e, d                           ;$7f7a
ld e, [hl]                        ;$7f7b
and d                             ;$7f7c
ld h, d                           ;$7f7d
and c                             ;$7f7e
ld h, d                           ;$7f7f
ld h, d                           ;$7f80
ld h, d                           ;$7f81
ld e, [hl]                        ;$7f82
ld e, d                           ;$7f83
ld e, [hl]                        ;$7f84
and d                             ;$7f85
ld h, d                           ;$7f86
and c                             ;$7f87
ld c, d                           ;$7f88
ld c, [hl]                        ;$7f89
and d                             ;$7f8a
ld d, d                           ;$7f8b
and c                             ;$7f8c
ld c, d                           ;$7f8d
ld e, h                           ;$7f8e
and e                             ;$7f8f
ld e, b                           ;$7f90
and c                             ;$7f91
ld d, h                           ;$7f92
and [hl]                          ;$7f93
ld l, h                           ;$7f94
nop                               ;$7f95
and d                             ;$7f96
ld bc, $014a                      ;$7f97
ld c, d                           ;$7f9a
ld bc, $014a                      ;$7f9b
ld c, d                           ;$7f9e
ld bc, $46a1                      ;$7f9f
ld b, [hl]                        ;$7fa2
and d                             ;$7fa3
ld b, [hl]                        ;$7fa4
and c                             ;$7fa5
ld b, [hl]                        ;$7fa6
ld b, [hl]                        ;$7fa7
and e                             ;$7fa8
ld b, [hl]                        ;$7fa9
and d                             ;$7faa
ld b, h                           ;$7fab
ld bc, $a200                      ;$7fac
ld b, d                           ;$7faf
ld e, d                           ;$7fb0
ld d, b                           ;$7fb1
ld e, d                           ;$7fb2
ld b, d                           ;$7fb3
ld e, d                           ;$7fb4
ld d, b                           ;$7fb5
ld e, d                           ;$7fb6
ld c, d                           ;$7fb7
and c                             ;$7fb8
ld d, d                           ;$7fb9
ld d, d                           ;$7fba
and d                             ;$7fbb
ld d, d                           ;$7fbc
and c                             ;$7fbd
ld d, d                           ;$7fbe
ld d, d                           ;$7fbf
and e                             ;$7fc0
ld d, d                           ;$7fc1
and d                             ;$7fc2
ld d, h                           ;$7fc3
ld bc, $0000                      ;$7fc4
nop                               ;$7fc7
nop                               ;$7fc8
nop                               ;$7fc9
nop                               ;$7fca
nop                               ;$7fcb
nop                               ;$7fcc
nop                               ;$7fcd
nop                               ;$7fce
nop                               ;$7fcf
nop                               ;$7fd0
nop                               ;$7fd1
nop                               ;$7fd2
nop                               ;$7fd3
nop                               ;$7fd4
nop                               ;$7fd5
nop                               ;$7fd6
nop                               ;$7fd7
nop                               ;$7fd8
nop                               ;$7fd9
nop                               ;$7fda
nop                               ;$7fdb
nop                               ;$7fdc
nop                               ;$7fdd
nop                               ;$7fde
nop                               ;$7fdf
nop                               ;$7fe0
nop                               ;$7fe1
nop                               ;$7fe2
nop                               ;$7fe3
nop                               ;$7fe4
nop                               ;$7fe5
nop                               ;$7fe6
nop                               ;$7fe7
nop                               ;$7fe8
nop                               ;$7fe9
nop                               ;$7fea
nop                               ;$7feb
nop                               ;$7fec
nop                               ;$7fed
nop                               ;$7fee
nop                               ;$7fef
jp $64d3                          ;$7ff0
jp $69a5                          ;$7ff3
nop                               ;$7ff6
nop                               ;$7ff7
nop                               ;$7ff8
nop                               ;$7ff9
nop                               ;$7ffa
nop                               ;$7ffb
nop                               ;$7ffc
nop                               ;$7ffd
nop                               ;$7ffe
nop                               ;$7fff