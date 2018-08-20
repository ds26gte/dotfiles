" last modified 2018-08-20
" Dorai Sitaram

func! s:rewriteCSSlineComments()
  norm mx
  %s=:\@<!//\s*\(.*\)=/* \1 */=e
  norm `x
endfunc

au bufwritepre <buffer> call s:rewriteCSSlineComments()

func! CssUncommentLine()
  s=/\*\s\+\(.\{-}\)\s*\*/\s*$=\1=
endfunc

nmap <buffer> <leader>c :call CssUncommentLine()<cr>

func! s:CSSlint()
  !csslint --config=$HOME/.csslintrc % | tail -n +3
endfunc

au bufwritepost <buffer> call s:CSSlint()
