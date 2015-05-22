" last modified 2015-02-01

au bufread,bufnewfile *.jl call s:julia_options()

func! s:julia_options()
  setl tw=0

  ru indent/julia.vim
endfunc
