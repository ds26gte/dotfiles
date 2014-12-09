" last modified 2014-12-08

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  if &ft == 'help'
    return
  endif

  setl mp=txt2page\ %
  setl tw=65

  call TxtHilite()

  exec 'au bufwritepre' expand('%') 'call TypographicNiceties()'

  exec 'au bufwritepost' expand('%') 'make | redraw'
endfunc
