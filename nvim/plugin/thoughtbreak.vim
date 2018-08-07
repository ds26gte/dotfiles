" last modified 2018-08-03
" Dorai Sitaram

au filetype asciidoc au bufwritepre <buffer> call s:addThoughtBreaks()

fun! s:addThoughtBreaks()
  norm mx
  sil g:^\(\|\S.* \)\~\s*$: +1s:^\s*$:==THOUGHTBREAK==:
  g:^==THOUGHTBREAK==$: +1s:^\($\|[^​]\):​\r\r\0:
  %s:^==THOUGHTBREAK==$::e
  norm `x
endfun 
