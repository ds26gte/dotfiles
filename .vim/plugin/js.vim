"last modified 2014-08-21

au bufread,bufnewfile *.js call s:js_options()

func! s:js_options()
    setl tw=0
    setl cin
    setl cino=j1,J1

    syn region comment oneline start="//" end="$"
    syn region comment start="/\*" end="\*/"
endfunc
