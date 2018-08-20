" last modified 2018-08-20
" Dorai Sitaram

func! s:removeHardbreaksWithinGrafs()
  let l:savedFo = &l:fo
  setl fo+=w

  sil! %s/\s\+$//

  g/^\S/ s/\S$/\0 /

  sil! %s/^\s\+$//

  "at every non-blank line, reformat up to paragraph end
  g/\s$/ norm vipJ

  %s/\s\+$//

  let &l:fo = l:savedFo
endfunc

com! Softwrap sil call s:removeHardbreaksWithinGrafs()

func! s:yankForGmail()
  if !exists('b:autocopySet')
    let b:autocopySet = 1
    au bufwritepost <buffer> sil call s:yankForGmail()
  endif
  call s:removeHardbreaksWithinGrafs()
  %y
  u
endfunc

com! Ygmail sil call s:yankForGmail()
