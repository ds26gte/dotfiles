" last modified 2019-11-22
" Dorai Sitaram

au filetype nroff call s:groffOptions()

func! s:groffOptions()
  setl tw=65
  call Smartquotes()
  hi groffPP guifg=gray27
  syn match groffPP "^\.PP$"
  au bufwritepre <buffer> sil! call s:groffInsertPP()
endfunc

func! s:groffInsertPP()
  norm mx
  norm M
  norm my
  g/^\.EX/ .,/^\.EE/ s/^/ZZZ_BLANKLINE_ZZZ/
  g/^\.eval/ .,/^\.endeval/ s/^/ZZZ_BLANKLINE_ZZZ/
  g/^\s*$/ s/.*/.PP/
  g/^ZZZ_BLANKLINE_ZZZ/ s/^ZZZ_BLANKLINE_ZZZ//
  norm 'y
  norm z.
  norm `x
endfunc
