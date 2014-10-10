"last modified 2014-09-29

au bufread,bufnewfile *.sql call s:sql_options()

func! s:sql_options()
  ru indent/sql.vim
endfunc
