"last modified 2014-10-22

au bufread,bufnewfile *.sh call s:sh_options()

au bufread,bufnewfile .aliases*,.bash*,.env* doau bufread pretend.sh

func! s:sh_options()
  setl tw=0
endfunc
