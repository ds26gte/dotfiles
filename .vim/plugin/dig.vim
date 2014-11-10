"last modified 2014-11-09

func! s:xdigFunc(biliteral, num, ...)
  exec "let l:dnum = " . a:num
  exec 'dig ' . a:biliteral . ' ' . l:dnum
endfunc

com! -nargs=* Xdig call s:xdigFunc(<f-args>)

Xdig :P 0x1f61c "tongue out
Xdig al 0x2766 "aldus
Xdig an 0x2693 "anchor
Xdig ap 0x2708 "airplane
Xdig bm 0x22a5 "bottom
Xdig bu 0x2022 "bullet
Xdig bv 0x2615 "beverage
Xdig fl 0x2698 "flower
Xdig gr 0x2699 "gear
Xdig he 0x2767 "hedera
Xdig pc 0x2761 "pilcrow, curved
Xdig pi 0xb6 "pilcrow
Xdig qd 0x220e "qed
Xdig sk 0x2620 "skull
Xdig sm 0x263a "smiley
Xdig tp 0x22a4 "top
Xdig u< 0x27e8 "left angle
Xdig u> 0x27e9 "right angle
