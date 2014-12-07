"last modified 2014-12-06

au bufread,bufnewfile *.sql call s:sqlOptions()

func! s:sqlOptions()
  ru indent/sql.vim
endfunc
