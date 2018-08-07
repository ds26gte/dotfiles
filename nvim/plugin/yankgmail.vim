"last modified 2018-01-24

func! s:removeHardbreaksWithinGrafs()
  let l:saved_fo = &l:fo

  setl fo+=w

  sil! %s/\s\+$//

  g/^\S/ s/\S$/\0 /

  sil! %s/^\s\+$//

  sil! %s/^$/\r/

  "at every non-blank line, reformat up to paragraph end
  g/\s$/ norm vipJ

  "remove any blank lines at bof
  1 g/^$/ .,/./j

  "remove any blank lines at eof
  $ g/^$/ ?.?,.j

  "collapse consecutive blanks lines to one
  v/./ .,/./-1 j

  %s/\s\+$//

  let &l:fo = l:saved_fo
endfunc

com! Softwrap sil call s:removeHardbreaksWithinGrafs()

func! s:yankForGmail()
  call s:removeHardbreaksWithinGrafs()
  %y
  u
endfunc

com! YGmail sil call s:yankForGmail() 
