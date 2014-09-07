"last modified 2014-09-05

"this so matchparen works correctly in the presence of \( etc.
"it has nothing to do with syntax highlighting

au bufread,bufnewfile * call s:dont_match_escaped_paren()

func! s:dont_match_escaped_paren()
  syn match character "\\[(){}[\]]"
endfunc
