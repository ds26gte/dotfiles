" last modified 2019-02-13
" Dorai Sitaram

au filetype css au bufwritepre <buffer> call s:rewriteCSSlineComments()

func! s:rewriteCSSlineComments()
  " allow user to use //-style comments, which will be converted
  " upon file write to the legal but more clumsy /* ... */
  norm mx
  %s=:\@<!//\s*\(.*\)=/* \1 */=e
  norm `x
endfunc

au filetype css nmap <buffer> <leader>c :call CssUncommentLine()<cr>

func! CssUncommentLine()
  s=/\*\s\+\(.\{-}\)\s*\*/\s*$=\1=
endfunc
