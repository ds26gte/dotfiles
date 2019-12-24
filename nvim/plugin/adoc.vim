" last modified 2019-12-28
" created < 2016-12

func! AdocFold()
  let l:line = getline(v:lnum)
  let l:depth = match(getline(v:lnum), '\(^==\+\)\@<=[^=]') + 1
  if l:depth > 0
    return ">" . l:depth
  endif
  return "="
endfunc

func! s:adocOptions()

  setl fde=AdocFold()
  setl fdl=6
  setl fdm=expr

  nno <buffer> [[ :?^=<cr>
  nno <buffer> ]] :/^=<cr>

  let b:presenting_slide_separator = '\%(^\|\n\)\ze=\+\s'

endfunc

au filetype asciidoc call s:adocOptions()

au bufread,bufnewfile *.asc setf asciidoc

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au bufwritepost status-*.adoc sil !yank4gmail %

com! Tmspeech e ~/src/tmspeech/utopia.adoc
