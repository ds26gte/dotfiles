"last modified 2014-09-03

au bufread,bufnewfile *.js call s:js_options()

func! s:js_options()
  setl tw=0
  setl cin
  setl cino=j1,J1

  syn region comment oneline start="//" end="$"
  syn region comment start="/\*" end="\*/"
  syn region string oneline start="[\\]\@<!'" skip="\\[\\']" end="'"
endfunc
