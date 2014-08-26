"last modified 2014-08-26

au bufread,bufnewfile * call s:hilite_strings()

func! s:hilite_strings()
    "strings -- pretty much universal
    syn region string oneline start="[[:alnum:]\\]\@<!\"" skip="\\[\\\"]" end="\""

    "so matchparen works in Lisp
    syn match character "\\[(){}[\]]"
endfunc
