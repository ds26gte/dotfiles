"last modified 2015-02-14

au bufread,bufnewfile *.tmac call s:tmacOptions()

func! s:tmacOptions()
  setl tw=0
endfunc
