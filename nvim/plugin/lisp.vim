" last modified 2019-11-16
" Dorai Sitaram

au filetype lisp call s:commonLispWords()

func! s:commonLispWords()
  setl lw+=
        \with-open-file
endfunc
