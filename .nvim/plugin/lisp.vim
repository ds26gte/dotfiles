" last modified 2015-05-30

au bufread,bufnewfile *.lisp call s:lispOptions()

func! s:lispOptions()
  setl def=^\\s*(def\\S*
  setl isk+==,*,>,?
  setl lisp
  setl tw=0
  setl lw+=defescape

  syn region comment oneline start=';' end='$'
  syn region comment start='#|' end='|#'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc

au bufread,bufnewfile *.lfe,*.rkt,*.scm,tex2page
      \ doau bufread pretend.lisp
