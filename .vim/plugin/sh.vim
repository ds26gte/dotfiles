"last modified 2014-10-08

au bufread,bufnewfile *.sh call s:sh_options()

au bufread,bufnewfile .aliases*,.bash* doau bufread pretend.sh

func! s:sh_options()
  setl tw=0
endfunc
