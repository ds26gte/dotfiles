" last modified 2019-09-02

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

endfunc

au filetype asciidoc call s:adocOptions()

au bufread,bufnewfile *.adoc? setf asciidoc

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au bufwritepost status-*.adoc sil !yank4gmail %

com! Tmspeech e ~/src/tmspeech/utopia.adoc 
