"last modified 2015-01-30

func! s:xdig_fn(biliteral, hexnum, ...)
  exec 'dig' a:biliteral str2nr(a:hexnum, 16)
endfunc

com! -nargs=* Xdig call s:xdig_fn(<f-args>)
