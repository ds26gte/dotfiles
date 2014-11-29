" last modified 2014-11-28

au bufread,bufnewfile *.sh call s:shOptions()

au bufread,bufnewfile .aliases*,.bash*,.env*,.pinerc
      \ doau bufread pretend.sh

func! s:shOptions()
  syn region comment oneline start='#' end='$'
endfunc
