"last modified 2014-11-17

au bufread,bufnewfile *.arr call s:arr_options()

func! s:arr_options()
  setl isk+=-
  setl tw=0

  syn region comment oneline start="#" end="$"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
endfunc
