"last modified 2014-09-04

au bufwritepre * call s:trimspace()

func! s:trimspace()
  norm mx
  sil! %s/\s\+$//
  sil $ g/^$/ s/^$/\r@trimspace-last-line@/
  sil v/./,/./-j
  sil 1 g/^$/d
  sil $ g/^@trimspace-last-line@$/ $-1,$d
  sil! norm `x
endfunc
