"last modified 2014-11-25

au bufread,bufnewfile *.sh call s:sh_options()

au bufread,bufnewfile .aliases*,.bash*,.env*,.pinerc
      \ doau bufread pretend.sh

func! s:sh_options()
  syn region comment oneline start="#" end="$"
endfunc
