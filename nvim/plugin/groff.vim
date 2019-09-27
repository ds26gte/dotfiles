" last modified 2019-10-02
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
  au bufwritepre <buffer> sil call s:groffInsertPP()
endfunc

func! s:groffInsertPP()
  g/^\.EX/ .,/^\.EE/ s/^/ÞEXLINEÞ/
  g/^\s*$/ s/.*/.PP/
  g/^ÞEXLINEÞ/ s/^ÞEXLINEÞ//
endfunc

