" last modified 2014-11-26

au bufread,bufnewfile *.js call s:js_options()

func! s:js_options()
  setl cin
  setl cino=j1,J1

  syn region comment oneline start="//" end="$"
  syn region comment start="/\*" end="\*/"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
  syn region string oneline start="[\\]\@<!'" skip="\\[\\']" end="'"
endfunc

au bufread,bufnewfile *.json doau bufread pretend.js
