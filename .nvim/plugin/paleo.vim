" last modified 2015-05-30

if has('nvim')
  finish
endif

set bs=indent,eol,start
set wim=list:longest,full

func! Jobstart(s)
  exec '!' . a:s
endfunc
