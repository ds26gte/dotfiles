" last modified 2014-12-06

au bufread,bufnewfile *.arr call s:arrOptions()

func! s:arrOptions()
  setl isk+=-

  syn region comment oneline start='#' end='$'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
endfunc
