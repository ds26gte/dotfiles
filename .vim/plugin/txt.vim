" last modified 2014-11-30

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  if expand('%:t') =~ '^wb1913_.\{-}\.txt$'
    return
  endif

  let l:txtType = 'default'

  if expand('%:t') =~ '^pico.\d\+$'
    let l:txtType = 'email'
  endif

  if l:txtType == 'default'
    setl tw=65
    setl mp=txt2page\ %
  endif

  if l:txtType == 'email'
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

  exec 'au bufwritepre' expand('%') 'call TypographicNiceties()'
endfunc

au bufread,bufnewfile /tmp/pico.*,*.md,COMMIT_EDITMSG
      \ doau bufread pretend.txt
