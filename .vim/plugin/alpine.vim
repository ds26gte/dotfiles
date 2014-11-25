"last modified 2014–11–20

au bufread,bufnewfile /tmp/pico.* call s:alpineOptions()

func! s:alpineOptions()
  setl co=72
  setl lbr
  setl nu
  setl sbr=
  setl tw=0

  nn k gk
  nn j gj
  nn 0 g0
  nn $ g$
  nn I g^i
  nn A g$i
  nn D dg$

  syn region comment oneline start="^>" end="$"

  exec 'au bufwritepre ' . expand('%') . ' doau bufwritepre pretend.txt'
endfunc
