" last modified 2015-06-02

au bufread,bufnewfile *.js call s:jsOptions()

func! s:jsOptions()
  setl cin
  setl cino=j1,J1
  setl tw=0

  ru after/indent/javascript.vim

  syn region comment oneline start='//' end='$'
  syn region comment start='/\*' end='\*/'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
  syn region string oneline start='[\\]\@<!\'' skip='\\[\\\']' end='\''
endfunc

au bufread,bufnewfile *.json doau bufread pretend.js
