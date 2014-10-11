"last modified 2014-10-11

au bufread,bufnewfile *.lisp call s:lisp_options()

au bufread,bufnewfile *.rkt,*.scm doau bufread pretend.vim

func! s:lisp_options()
  setl lisp
  setl tw=0

  syn region comment oneline start=";" end="$"
  syn region comment start="#|" end="|#"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
endfunc
