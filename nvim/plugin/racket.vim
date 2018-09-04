" last modified 2018-09-08
" Dorai Sitaram

au filetype scheme call s:racketHouseStyle()

func! s:racketHouseStyle()
  " Racket house-style prefers this, i.e., LIN(if) = -1
  setl lw-=if

  setl lw+=call-with-input-file,datum->syntax,fluid-let,for,syntax/loc,syntax-parse,with-input-from-file
endfunc
