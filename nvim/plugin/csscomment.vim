" last modified 2018-07-30
" Dorai Sitaram

au filetype css au bufwritepre <buffer> call s:rewriteCSSlineComments()

func! s:rewriteCSSlineComments()
  norm mx
  %s=:\@<!//\s*\(.*\)=/* \1 */=e
  norm `x
endfunc
