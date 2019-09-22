" last modified 2019-09-24
" Dorai Sitaram

au bufread,bufnewfile *.ms set ft=nroff

func! Smartquotes()
  ino <buffer> "` “
  ino <buffer> `" ”
  ino <buffer> '` ‘
  ino <buffer> `' ’
endfunc

func! s:groffOptions()
  if expand('%:e') != 'tmac'
    setl tw=65
    call Smartquotes()
    syn match vertsplit "^\.PP$"
    au bufwritepre <buffer> sil call s:groffInsertPP()
  endif
endfunc

func! s:groffInsertPP()
  g/^\.EX/ .,/^\.EE/ s/^/ÞEXLINEÞ/
  g/^\s*$/ s/.*/.PP/
  g/^ÞEXLINEÞ/ s/^ÞEXLINEÞ//
endfunc

au filetype nroff call s:groffOptions()
