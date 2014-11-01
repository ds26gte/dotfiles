"last modified 2014-10-28

au bufread,bufnewfile *.arr call s:arr_options()

func! s:arr_options()
  setl isk+=-

  syn region comment oneline start="#" end="$"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
endfunc
