" last modified 2014-11-28

au bufread,bufnewfile *.arr call s:arrOptions()

func! s:arrOptions()
  setl isk+=-

  syn region comment oneline start="#" end="$"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
endfunc
