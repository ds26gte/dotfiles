"last modified 2014-08-29

au bufread,bufnewfile * call s:hilite_strings()

func! s:hilite_strings()
    "strings -- pretty much universal
    "syn region string oneline start="[[:alnum:]\\]\@<!\"" skip="\\[\\\"]" end="\""
    syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""

    "so matchparen works in Lisp
    syn match character "\\[(){}[\]]"
endfunc
