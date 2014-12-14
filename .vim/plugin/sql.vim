"last modified 2014-12-14

au bufread,bufnewfile *.sql call s:sqlOptions()

func! s:sqlOptions()
  setl tw=0

  ru indent/sql.vim
endfunc
