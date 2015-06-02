" last modified 2015-05-29

au bufwritepre * call s:timestamp()

func! s:timestamp()
  if &bh == ''
    norm mx
    sil! /\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{4}[-–]\d\{2}[-–]\d\{2}\>/
          \ s/\<\d\{4}[-–]\d\{2}[-–]\d\{2}\>/\=strftime('%Y-%m-%d')/
    sil! /\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{8}\>/
          \ s/\<\d\{8}\>/\=strftime('%Y%m%d')/
    norm `x
  endif
endfunc
