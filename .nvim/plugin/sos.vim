" last modified 2015-05-30

au bufwritepost */sos/*.txt call s:libreoffice()

func! s:libreoffice()
  call Jobstart('txt2page -Tdocx ' . expand('%'))
endfunc
