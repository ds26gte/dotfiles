" last modified 2015-02-01

au bufread,bufnewfile *.arr call s:arrOptions()

func! s:arrOptions()
  setl isk+=-
  setl tw=0

  syn region comment oneline start='#' end='$'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'

  ru indent/pyret.vim
endfunc
