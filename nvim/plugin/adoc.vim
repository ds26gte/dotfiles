" last modified 2019-03-12

func! UniCycleTyping()
  " don't mess with hyphen and dot
  inoremap <buffer> ' x<Esc>:call UniCycleApostrophe()<CR>a
  inoremap <buffer> " x<Esc>:call UniCycleQuote()<CR>a
endfunc

func! UniCycleTypingOff()
  iunmap '
  iunmap "
endfunc

func! AdocFold()
  let l:line = getline(v:lnum)
  let l:depth = match(getline(v:lnum), '\(^=\+\)\@<=[^=]') + 1
  if l:depth > 0
    return ">" . l:depth
  endif
  return "="
endfunc

func! s:adocOptions()

  "setl fdm=expr
  setl com-=fb:-
  setl com-=mb:*
  setl cpt+=k
  setl fde=AdocFold()
  setl fdl=1
  setl inf
  setl tw=65

  if exists('b:turnUniCyclingOff') && b:turnUniCyclingOff
  else
    call UniCycleTyping()
  endif
endfunc

au filetype asciidoc call s:adocOptions()

au bufread,bufnewfile *.adoc? setf asciidoc

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au bufwritepost status-*.adoc sil !yank4gmail %

com! Tmspeech e ~/src/tmspeech/utopia.adoc 
