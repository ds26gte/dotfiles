" last modified 2014-11-29

au bufread,bufnewfile *.lisp call s:lispOptions()

func! s:lispOptions()
  setl lisp
  setl isk+==,*,>,?
  setl def=^\\s*(def\\S*

  syn region comment oneline start=';' end='$'
  syn region comment start='#|' end='|#'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc

au bufread,bufnewfile *.lfe,*.rkt,*.scm,tex2page
      \ doau bufread pretend.lisp
