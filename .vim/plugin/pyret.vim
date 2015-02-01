" last modified 2014-12-14

au bufread,bufnewfile *.arr call s:arrOptions()

func! s:arrOptions()
  setl isk+=-
  setl tw=0

  syn region comment oneline start='#' end='$'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc
