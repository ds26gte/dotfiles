" last modified 2019-10-04
" Dorai Sitaram

au bufwritepre * call Datestamp()

func! Datestamp()
  norm mx
  norm M
  norm my
  $
  sil! /\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{4}[-]\d\{2}[-]\d\{2}\>/
        \ s/\<\d\{4}[-]\d\{2}[-]\d\{2}\>/\=strftime('%Y-%m-%d')/
  sil! /\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{8}\>/
        \ s/\<\d\{8}\>/\=strftime('%Y%m%d')/
  norm 'y
  norm z.
  norm `x
endfunc
