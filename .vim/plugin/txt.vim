" last modified 2014-11-26

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  setl tw=65

  call TxtHilite()

  exec 'au bufwritepre ' . expand('%') . ' call SmartQuotes()'
endfunc
