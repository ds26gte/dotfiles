" last modified 2019-11-29
" created < 2016-07
" Dorai Sitaram

au filetype help call s:lessLike()

func! s:lessLike()
  nno <buffer> <cr> <c-e>
  nno <buffer> <space> <c-f>
  nno <buffer> b <c-b>
  nno <buffer> p <c-b>
endfunc
