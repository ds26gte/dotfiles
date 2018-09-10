" last modified 2018-09-12
" Dorai Sitaram

au filetype scheme call s:racketHouseStyle()

func! s:racketHouseStyle()
  setl lw+=call-with-input-file,datum->syntax,fluid-let,for,syntax/loc,syntax-parse,with-input-from-file
endfunc
