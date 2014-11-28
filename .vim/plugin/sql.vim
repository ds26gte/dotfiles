"last modified 2014-11-28

au bufread,bufnewfile *.sql call s:sqlOptions()

func! s:sqlOptions()
  ru indent/sql.vim
endfunc
