" last modified 2015-05-29

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  if &ft == 'help'
    return
  endif

  "setl mp=txt2page\ %
  "setl mp=:
  setl tw=65

  call TxtHilite()

  if &bh == ''
    exec 'au bufwritepre' expand('%') 'call TypographicNiceties()'
  endif

  "exec 'au bufwritepost' expand('%') 'make | redraw'
endfunc
