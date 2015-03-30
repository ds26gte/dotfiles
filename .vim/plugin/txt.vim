" last modified 2015-03-29

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  if &ft == 'help'
    return
  endif

  "setl mp=txt2page\ %
  setl mp=:
  setl tw=65

  call TxtHilite()

  exec 'au bufwritepre' expand('%') 'call TypographicNiceties()'

  exec 'au bufwritepost' expand('%') 'make | redraw'
endfunc
