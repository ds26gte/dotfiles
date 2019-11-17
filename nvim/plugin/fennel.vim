" last modified 2019-11-16
" Dorai Sitaram

au bufread,bufnewfile *.fnl setf fennel

au filetype fennel call s:fennelOptions()

func! s:fennelOptions()
  ru! indent/scheme.vim
  call s:fennelLispWords()
endfunc

func! s:fennelLispWords()
  setl lw+=
        \fn
endfunc
