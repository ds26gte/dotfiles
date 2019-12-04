" last modified 2019-12-03
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

  setl com-=fb:-
  setl com-=mb:*
  setl cpt+=k
  setl fde=AdocFold()
  setl fdl=6
  setl fdm=expr
  setl inf
  setl tw=65

  nmap <buffer> [[ :?^=<cr>
  nmap <buffer> ]] :/^=<cr>

  let b:presenting_slide_separator = '\%(^\|\n\)\ze=\+\s'

  syn match warningmsg '\<\(CAUTION\|IMPORTANT\|NOTE\|TIP\|WARNING\)\>'
  syn match title '^=\+.*'

endfunc

au filetype asciidoc call s:adocOptions()

au bufread,bufnewfile *.asc setf asciidoc

au bufread,bufnewfile status-*.adoc setl spell

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au bufwritepost status-*.adoc sil !yank4gmail %

com! Tmspeech e ~/src/tmspeech/utopia.adoc 
