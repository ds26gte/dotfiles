" last modified 2018-09-08
" Dorai Sitaram

au filetype help call s:lessLike()

func! s:lessLike()
  nno <buffer> <cr> <c-e>
  nno <buffer> <space> <c-f>
  nno <buffer> b <c-b>
  nno <buffer> p <c-b>
endfunc
