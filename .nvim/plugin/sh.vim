" last modified 2014-12-14

au bufread,bufnewfile *.sh call s:shOptions()

au bufread,bufnewfile .aliases*,.bash*,.env*,.pinerc
      \ doau bufread pretend.sh

func! s:shOptions()
  setl tw=0

  syn region comment oneline start='#' end='$'
endfunc
