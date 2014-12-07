" last modified 2014-12-06

au bufread,bufnewfile *.js call s:jsOptions()

func! s:jsOptions()
  setl cin
  setl cino=j1,J1

  syn region comment oneline start='//' end='$'
  syn region comment start='/\*' end='\*/'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
  syn region string oneline start='[\\]\@<!\'' skip='\\[\\\']' end='\''
endfunc

au bufread,bufnewfile *.json doau bufread pretend.js
