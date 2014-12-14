" last modified 2014-12-14

au bufread,bufnewfile *.c call s:cOptions()

func! s:cOptions()
  setl cin
  setl cino+=:0
  setl tw=0

  syn region comment oneline start='//' end='$'
  syn region comment start='/\*' end='\*/'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc
