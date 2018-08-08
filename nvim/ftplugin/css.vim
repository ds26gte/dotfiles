" last modified 2018-08-13
" Dorai Sitaram

au bufwritepre <buffer> call s:rewriteCSSlineComments()

func! s:rewriteCSSlineComments()
  norm mx
  %s=:\@<!//\s*\(.*\)=/* \1 */=e
  norm `x
endfunc

nmap <buffer> <leader>c :call CssUncommentLine()<cr>

func! CssUncommentLine()
  s=/\*\s\+\(.\{-}\)\s*\*/\s*$=\1=
endfunc
