" last modified 2019-10-31
" created 2019-02-09
" Dorai Sitaram

au filetype css au bufwritepre <buffer> call s:rewriteCSSLineComments()

func! s:rewriteCSSLineComments()
  " //-style line comments, though oh so convenient, are not legal in CSS!
  " convert them into /* ... */

  norm mx

  " assume //-comment is not preceded by :, as that could be a URI
  %s=:\@<!//\s*\(.*\)=/* \1 */=e

  norm `x
endfunc

au filetype css nmap <buffer> <leader>c :call CSSUncommentLine()<cr>

func! CSSUncommentLine()
  s=/\*\s\+\(.\{-}\)\s+\*/\s*$=\1=
endfunc
