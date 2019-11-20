" last modified 2019-11-20
" Dorai Sitaram

au filetype lisp call s:commonLispWords()

func! s:commonLispWords()
  setl lw+=
        \concatenate,
        \with-open-file
endfunc
