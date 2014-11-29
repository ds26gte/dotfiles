" last modified 2014-11-28

au bufread,bufnewfile *.lisp call s:lispOptions()

func! s:lispOptions()
  setl lisp

  syn region comment oneline start=';' end='$'
  syn region comment start='#|' end='|#'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc

au bufread,bufnewfile *.lfe,*.rkt,*.scm
      \ doau bufread pretend.lisp
