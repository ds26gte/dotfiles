" last modified 2019-10-04
" Dorai Sitaram

au filetype nroff call s:groffOptions()

func! Smartquotes()
  ino <buffer> "` “
  ino <buffer> `" ”
  ino <buffer> '` ‘
  ino <buffer> `' ’
endfunc

func! s:groffOptions()
  setl tw=65
  call Smartquotes()
  hi groffPP guibg=bg guifg=gray27
  syn match groffPP "^\.PP$"
  au bufwritepre <buffer> sil! call s:groffInsertPP()
endfunc

func! s:groffInsertPP()
  norm mx
  norm M
  norm my
  g/^\.EX/ .,/^\.EE/ s/^/XXX_BLANKLINE_ZZZ/
  g/^\.eval/ .,/^\.endeval/ s/^/XXX_BLANKLINE_ZZZ/
  g/^\s*$/ s/.*/.PP/
  g/^XXX_BLANKLINE_ZZZ/ s/^XXX_BLANKLINE_ZZZ//
  norm 'y
  norm z.
  norm `x
endfunc
