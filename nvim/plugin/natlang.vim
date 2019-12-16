" last modified 2019-12-22
" Dorai Sitaram

func! s:natlang()
  setl com-=mb:* 
  setl cpt+=k
  setl fo+=n
  setl tw=65
  ino <buffer> "` “
  ino <buffer> `" ”
  ino <buffer> '` ‘
  ino <buffer> `' ’
endfunc

au bufread,bufnewfile *.1,*.a[sd]*,*.m*,*.t* call s:natlang()
