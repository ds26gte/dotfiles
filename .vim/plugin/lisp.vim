" last modified 2014-11-26

au bufread,bufnewfile *.lisp call s:lisp_options()

au bufread,bufnewfile *.rkt,*.scm doau bufread pretend.lisp

func! s:lisp_options()
  setl lisp

  syn region comment oneline start=";" end="$"
  syn region comment start="#|" end="|#"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
endfunc
