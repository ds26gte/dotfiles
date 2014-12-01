" last modified 2014-12-01

au bufread,bufnewfile *.txt call s:txtOptions()

func! s:txtOptions()
  if &ft == 'help'
    return
  endif

  let b:txtType = 'default'

  if expand('%:t') =~ '^pico.\d\+$'
    let b:txtType = 'email'
  endif

  if expand('%:e') == 'wd'
    let b:txtType = '4docx'
  endif

  if b:txtType != 'email'
    setl tw=65
  endif

  if b:txtType == 'default'
    setl mp=txt2page\ %
  endif

  if b:txtType == '4docx'
    setl mp=pandoc\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris\ %\ -o\ %:r.docx
    exec 'au bufwritepost' expand('%') 'make'
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

  exec 'au bufwritepre' expand('%') 'call TypographicNiceties()'
endfunc

au bufread,bufnewfile /tmp/pico.*,*.md,*.wd,COMMIT_EDITMSG
      \ doau bufread pretend.txt
