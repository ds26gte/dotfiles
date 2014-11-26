" last modified 2014-11-26

func! s:xdigFunc(biliteral, num, ...)
  exec "let l:dnum = " . a:num
  exec 'dig ' . a:biliteral . ' ' . l:dnum
endfunc

com! -nargs=* Xdig call s:xdigFunc(<f-args>)

Xdig ** 0x22c6 "star
Xdig :P 0x1f61c "tongue out
Xdig al 0x2766 "ALdus
Xdig an 0x2693 "ANchor
Xdig ap 0x2708 "AirPlane
Xdig bm 0x22a5 "BottoM
Xdig bu 0x2022 "BUllet
Xdig bv 0x2615 "BeVerage
Xdig eh 0x2619 "HEdera reversed
Xdig fl 0x2698 "FLower
Xdig gr 0x2699 "GeaR
Xdig he 0x2767 "HEdera
Xdig la 0x27e8 "Left Angle
Xdig m- 0x2014 "eM dash
Xdig mi 0x2032 "MInute
Xdig n- 0x2013 "eN dash
Xdig nv 0x2630 "NaVicon
Xdig pc 0x2761 "Pilcrow, Curved
Xdig pi 0x00b6 "PIlcrow
Xdig q- 0x2015 "Quot dash
Xdig qd 0x220e "QeD
Xdig ra 0x27e9 "Right Angle
Xdig rt 0x2023 "Right Triangle
Xdig se 0x2033 "SEcond
Xdig sk 0x2620 "SKull
Xdig sm 0x263a "SMiley
Xdig tp 0x22a4 "ToP
Xdig uc 0x0326 "UnderComma
Xdig wv 0x2307 "WaVe
