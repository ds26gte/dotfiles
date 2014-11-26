" last modified 2014-11-26

au bufread,bufnewfile /tmp/pico.* call s:alpineOptions()

func! s:alpineOptions()
  setl co=72
  setl lbr
  setl nu
  setl sbr=

  nn j gj
  nn k gk
  nn 0 g0
  nn ^ g^
  nn $ g$
  nn I g^i
  nn A g$i
  nn D dg$

  call TxtHilite()
  syn region comment oneline start="^>" end="$"

  exec 'au bufwritepre ' . expand('%') . ' call SmartQuotes()'
endfunc
