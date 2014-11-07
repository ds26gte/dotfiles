"last modified 2014-11-06

func! s:xdigFunc(biliteral, num)
  exec "let l:dnum = " . a:num
  exec 'dig ' . a:biliteral . ' ' . l:dnum
endfunc

com! -nargs=* Xdig call s:xdigFunc(<f-args>)

":P tongue-out smily
"ANchor
"AirPlane
"BUllet
"BeVerage
"BottoM
"FloweR
"GeaR
"HEdera
"QeD
"ToP
"u< left angle
"u> right angle

Xdig :P 0x1f61c
Xdig an 0x2693
Xdig ap 0x2708
Xdig bm 0x22a5
Xdig bu 0x2022
Xdig bv 0x2615
Xdig fl 0x2698
Xdig gr 0x2699
Xdig al 0x2766
Xdig he 0x2767
Xdig qd 0x220e
Xdig tp 0x22a4
Xdig u< 0x27e8
Xdig u> 0x27e9
