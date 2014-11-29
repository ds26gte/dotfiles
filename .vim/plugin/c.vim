" last modified 2014-11-28

au bufread,bufnewfile *.c call s:cOptions()

func! s:cOptions()
  setl cin
  setl cino+=:0

  syn region comment oneline start='//' end='$'
  syn region comment start='/\*' end='\*/'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc
