" last modified 2014-11-26

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  let b:txtType = 'default'
  if expand('%:t') =~ '^pico.\d\+$'
    let b:txtType = 'email'
  endif

  if b:txtType != 'email'
    setl tw=65
  endif

  if b:txtType == 'email'
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
  endif

  call TxtHilite()

  exec 'au bufwritepre ' . expand('%') . ' TypographicNiceties'
endfunc

au bufread,bufnewfile /tmp/pico.*,*.md,COMMIT_EDITMSG
      \ doau bufread pretend.txt
