" last modified 2018-08-12
" Dorai Sitaram

au filetype css au bufwritepre <buffer> call s:rewriteCSSlineComments()

func! s:rewriteCSSlineComments()
  norm mx
  %s=:\@<!//\s*\(.*\)=/* \1 */=e
  norm `x
endfunc

au filetype css nmap <buffer> <leader>c :call CssUncommentLine()<cr>

func! CssUncommentLine()
  s=/\*\s\+\(.\{-}\)\s*\*/\s*$=\1=
endfunc
