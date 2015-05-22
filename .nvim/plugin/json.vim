"last modified 2014-12-14

au bufread,bufnewfile *.json call s:json_options()

func! s:json_options()
  setl tw=0

  ru indent/json.vim
endfunc
