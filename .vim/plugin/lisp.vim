" last modified 2014-12-06

au bufread,bufnewfile *.lisp call s:lispOptions()

func! s:lispOptions()
  setl def=^\\s*(def\\S*
  setl isk+==,*,>,?
  setl lisp

  syn region comment oneline start=';' end='$'
  syn region comment start='#|' end='|#'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc

au bufread,bufnewfile *.lfe,*.rkt,*.scm,tex2page
      \ doau bufread pretend.lisp
