"last modified 2014-09-16

au bufread,bufnewfile *.json call s:json_options()

func! s:json_options()
  ru indent/json.vim
endfunc
